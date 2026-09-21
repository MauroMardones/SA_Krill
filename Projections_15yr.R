###############################################################################
# Projections_15yr.R
# Proyecciones a 15 anios (2021-2035) para los escenarios s1.1 ... s1.7 (SS3)
#
# QUE HACE
#  1. Copia cada escenario a una carpeta NUEVA (proj15/<nivel_captura>__<regla_env>/<escenario>)
#     -> los escenarios originales NO se tocan.
#  2. En la copia edita (por texto, sin depender de r4ss para leer/escribir):
#       forecast.ss : N forecast years = 15  +  capturas fijas por flota y anio
#       data.ss     : extiende la variable ambiental (Chl-a) a 2021-2035
#  3. Corre SS3 en cada copia (r4ss::run) con Hessiana, para tener SD en el forecast.
#  4. Lee SSB, Bratio y Recr (con SD) de los derived_quants y arma figuras + CSV.
#
# SUPUESTOS QUE DEBES REVISAR (estan en la seccion CONFIG)
#  - Captura: promedio de los ultimos n_recent anios de las flotas 1-5, escalado
#    por 'catch_levels' (multiplicador) o fijado por 'catch_abs' (toneladas/anio),
#    repartido entre flotas segun su proporcion reciente.
#  - Ambiente (Chl-a): 'env_rules' = "zero" (anomalia 0), "last" (ultimo valor),
#    "recent_mean" (promedio de los ultimos n_env_recent anios).
#    Solo se cruza con los escenarios que tienen enlace ambiental (s1.3, s1.4, s1.6, s1.7).
#  - Reclutamiento: el forecast usa la curva stock-recluta sin desvios
#    (value * SRR), como en tu forecast.ss actual.
#  - Depredador (s1.2, s1.4, s1.7): no tiene captura en data.ss; SS3 decide
#    los desvios de M2 despues de 2020. REVISA en Report.sso que hace (ver nota
#    al final del script).
###############################################################################

## ---------------------------------------------------------------- CONFIG ----
scenarios    <- c("s1.1", "s1.2", "s1.3", "s1.4", "s1.5", "s1.6", "s1.7")
env_linked   <- c("s1.3", "s1.4", "s1.6", "s1.7")   # escenarios con Chl-a en la dinamica

base_dir     <- getwd()                       # carpeta SA_Krill (donde estan s1.1 ... s1.7)
out_root     <- file.path(base_dir, "proj15") # aqui se crean las copias y los resultados
exe          <- "ss_osx"                      # ejecutable (se copia desde cada escenario)

n_fcast      <- 15                            # anios de proyeccion
n_recent     <- 3                             # anios recientes para la captura de referencia
fishing_fleets <- 1:5                         # flotas de captura (FISHERY*)

# Niveles de captura: multiplicador de la captura reciente total (1 = statu quo)
catch_levels <- c(status_quo = 1, half = 0.5, zero = 0)
# Opcional: captura total absoluta (t/anio). NULL si no se usa. Ej: c(cap_155k = 155000)
catch_abs    <- NULL

# Reglas para la Chl-a en 2021-2035
env_rules    <- c("zero", "last", "recent_mean")
n_env_recent <- 5

# Fases del script
do_setup <- TRUE     # crear carpetas y editar archivos
do_run   <- TRUE     # correr SS3
do_read  <- TRUE     # leer resultados y graficar

mycolors <- c("#ca0020", "#f4a582", "#bababa", "#404040", "#0571b0", "#1b9e77", "#e6ab02")
names(mycolors) <- scenarios

## --------------------------------------------------------------- HELPERS ----
# Lee un data.ss y devuelve endyr y la captura (year, seas, fleet, catch)
read_data_info <- function(data_file) {
  L <- readLines(data_file, warn = FALSE)
  endyr <- as.integer(sub("^\\s*([0-9]+).*", "\\1", L[grep("#_EndYr", L)[1]]))
  i0 <- grep("^#_Catch data", L)[1]
  i1 <- which(grepl("^\\s*-9999", L) & seq_along(L) > i0)[1]
  blk <- L[(i0 + 1):(i1 - 1)]
  blk <- blk[!grepl("^\\s*#", blk) & nzchar(trimws(blk))]
  m <- do.call(rbind, lapply(strsplit(trimws(blk), "[[:space:]]+"),
                             function(x) as.numeric(x[1:5])))
  catch <- data.frame(year = m[, 1], seas = m[, 2], fleet = m[, 3],
                      catch = m[, 4], se = m[, 5])
  list(endyr = endyr, catch = catch, lines = L)
}

# Captura reciente por flota (promedio de los ultimos n anios, sin el -999)
recent_catch <- function(catch, endyr, n, fleets) {
  cc <- subset(catch, year > endyr - n & year <= endyr & fleet %in% fleets)
  agg <- tapply(cc$catch, cc$fleet, function(v) sum(v) / n)
  out <- setNames(rep(0, length(fleets)), fleets)
  out[names(agg)] <- agg
  out
}

# forecast.ss: N forecast years + lista de capturas fijas
edit_forecast <- function(fc_file, n_fcast, endyr, catch_by_fleet) {
  L <- readLines(fc_file, warn = FALSE)
  i <- grep("# N forecast years", L)[1]
  stopifnot(!is.na(i))
  L[i] <- sub("^\\s*[0-9]+", as.character(n_fcast), L[i])
  j <- grep("^#_Yr Seas Fleet Catch", L)[1]
  stopifnot(!is.na(j))
  k <- which(grepl("^\\s*-9999", L) & seq_along(L) > j)[1]
  yrs <- (endyr + 1):(endyr + n_fcast)
  rows <- unlist(lapply(yrs, function(y)
    sprintf("%d 1 %s %.2f #_ fleet %s", y, names(catch_by_fleet),
            catch_by_fleet, names(catch_by_fleet))))
  L <- c(L[1:j], rows, L[k:length(L)])
  writeLines(L, fc_file)
  invisible(rows)
}

# data.ss: extiende la variable ambiental hasta endyr + n_fcast
extend_env <- function(data_file, endyr, n_fcast, rule, n_recent_env = 5) {
  L <- readLines(data_file, warn = FALSE)
  i <- grep("#_N_environ_variables", L)[1]
  stopifnot(!is.na(i))
  k <- which(grepl("^\\s*-9999", L) & seq_along(L) > i)[1]
  blk <- L[(i + 1):(k - 1)]
  blk <- blk[!grepl("^\\s*#", blk) & nzchar(trimws(blk))]
  m <- do.call(rbind, lapply(strsplit(trimws(blk), "[[:space:]]+"),
                             function(x) as.numeric(x[1:3])))
  env <- data.frame(year = m[, 1], var = m[, 2], value = m[, 3])
  new <- do.call(rbind, lapply(sort(unique(env$var)), function(v) {
    e <- env[env$var == v, ]; e <- e[order(e$year), ]
    val <- switch(rule,
                  zero        = 0,
                  last        = tail(e$value, 1),
                  recent_mean = mean(tail(e$value, n_recent_env)),
                  stop("env rule desconocida: ", rule))
    yrs <- (max(endyr, max(e$year)) + 1):(endyr + n_fcast)
    data.frame(year = yrs, var = v, value = val)
  }))
  add <- sprintf("%d\t%d\t%.5f\t#_projection (%s)", new$year, new$var, new$value, rule)
  L <- c(L[1:(k - 1)], add, L[k:length(L)])
  writeLines(L, data_file)
  invisible(new)
}

# Crea la carpeta de trabajo de un escenario (copia solo los archivos de entrada)
make_run_dir <- function(src, dst, exe) {
  dir.create(dst, recursive = TRUE, showWarnings = FALSE)
  for (f in c("starter.ss", "data.ss", "control.ss", "forecast.ss", exe)) {
    ok <- file.copy(file.path(src, f), file.path(dst, f), overwrite = TRUE)
    if (!ok) stop("No pude copiar ", f, " desde ", src)
  }
  Sys.chmod(file.path(dst, exe), "755")
}

## ------------------------------------------------------------------ MAIN ----
if (!exists("PROJ_TEST")) {

  # tabla de corridas: escenario x nivel de captura x regla ambiental
  lv <- c(as.list(catch_levels), if (!is.null(catch_abs)) as.list(catch_abs))
  lv_type <- c(rep("mult", length(catch_levels)),
               if (!is.null(catch_abs)) rep("abs", length(catch_abs)))
  names(lv_type) <- names(lv)

  runs <- do.call(rbind, lapply(scenarios, function(s) {
    rules <- if (s %in% env_linked) env_rules else "noenv"
    expand.grid(scenario = s, level = names(lv), env = rules,
                stringsAsFactors = FALSE)
  }))
  runs$dir <- file.path(out_root, paste0(runs$level, "__", runs$env), runs$scenario)
  cat("Corridas:", nrow(runs), "\n")

  ## ---- 1. SETUP ----
  if (do_setup) {
    for (r in seq_len(nrow(runs))) {
      x <- runs[r, ]
      make_run_dir(file.path(base_dir, x$scenario), x$dir, exe)
      info <- read_data_info(file.path(x$dir, "data.ss"))
      ref  <- recent_catch(info$catch, info$endyr, n_recent, fishing_fleets)
      shares <- ref / sum(ref)
      total  <- if (lv_type[[x$level]] == "mult") sum(ref) * lv[[x$level]] else lv[[x$level]]
      edit_forecast(file.path(x$dir, "forecast.ss"), n_fcast, info$endyr, total * shares)
      if (x$env != "noenv")
        extend_env(file.path(x$dir, "data.ss"), info$endyr, n_fcast, x$env, n_env_recent)
    }
    message("Setup listo en: ", out_root)
  }

  ## ---- 2. RUN ----
  if (do_run) {
    for (r in seq_len(nrow(runs))) {
      message("Corriendo ", runs$dir[r])
      r4ss::run(dir = runs$dir[r], exe = exe, skipfinished = FALSE,
                show_in_console = FALSE)
    }
  }

  ## ---- 3. LEER + GRAFICAR ----
  if (do_read) {
    library(dplyr); library(ggplot2)

    get_dq <- function(rep, prefix) {
      dq <- rep$derived_quants
      d  <- dq[grepl(paste0("^", prefix, "_[0-9]+$"), dq$Label), c("Label", "Value", "StdDev")]
      d$year <- as.integer(sub(".*_", "", d$Label))
      d$metric <- prefix
      d[, c("year", "metric", "Value", "StdDev")]
    }

    res <- do.call(rbind, lapply(seq_len(nrow(runs)), function(r) {
      x <- runs[r, ]
      rep <- try(r4ss::SS_output(x$dir, verbose = FALSE, printstats = FALSE,
                                 covar = TRUE, forecast = TRUE), silent = TRUE)
      if (inherits(rep, "try-error")) { warning("Fallo lectura: ", x$dir); return(NULL) }
      out <- rbind(get_dq(rep, "SSB"), get_dq(rep, "Bratio"), get_dq(rep, "Recr"))
      cbind(x[, c("scenario", "level", "env")], out, endyr = rep$endyr,
            converged = rep$maxgrad)
    }))
    res <- res %>%
      mutate(cv    = ifelse(is.finite(StdDev) & Value > 0, StdDev / Value, NA),
             sdlog = sqrt(log(1 + cv^2)),
             lo    = Value * exp(-1.96 * sdlog),
             hi    = Value * exp( 1.96 * sdlog),
             phase = ifelse(year > endyr, "proyeccion", "historico"))
    dir.create(out_root, showWarnings = FALSE, recursive = TRUE)
    write.csv(res, file.path(out_root, "proyecciones_15yr.csv"), row.names = FALSE)

    plot_metric <- function(metric, ylab) {
      d <- filter(res, metric == !!metric)
      ggplot(d, aes(year, Value, colour = scenario, fill = scenario)) +
        geom_ribbon(data = filter(d, phase == "proyeccion"),
                    aes(ymin = lo, ymax = hi), alpha = 0.12, colour = NA) +
        geom_line(aes(linetype = phase), linewidth = 0.7) +
        geom_vline(xintercept = unique(d$endyr)[1] + 0.5, colour = "grey50", linetype = 3) +
        facet_grid(env ~ level, scales = "free_y") +
        scale_colour_manual(values = mycolors) + scale_fill_manual(values = mycolors) +
        scale_linetype_manual(values = c(historico = 1, proyeccion = 2)) +
        labs(x = NULL, y = ylab, colour = NULL, fill = NULL, linetype = NULL) +
        theme_bw(base_size = 11) + theme(legend.position = "bottom")
    }
    ggsave(file.path(out_root, "proj_SSB.png"),    plot_metric("SSB",    "SSB"),
           width = 12, height = 8, dpi = 300)
    ggsave(file.path(out_root, "proj_Bratio.png"), plot_metric("Bratio", "SSB / SSB0"),
           width = 12, height = 8, dpi = 300)
    ggsave(file.path(out_root, "proj_Recr.png"),   plot_metric("Recr",   "Reclutamiento"),
           width = 12, height = 8, dpi = 300)
    message("Resultados: ", out_root)
  }
}

###############################################################################
# NOTAS DE REVISION (despues de correr)
#  * Confirma en cada proj15/.../Report.sso que la seccion TIME_SERIES llega a
#    2035 y que 'Era' pasa a FORE desde 2021.
#  * Depredador (s1.2, s1.4, s1.7): mira en ss.par / Report.sso que hace M2_pred1
#    despues de 2020 (los desvios estan definidos solo hasta 2020).
#  * Sin desvios de reclutamiento en el forecast, la banda de incertidumbre viene
#    solo de la Hessiana. Para incluir variabilidad de reclutamiento, activa fase
#    de 'forecast recruitment' en control.ss o usa MCMC / normal multivariada.
#  * Bratio y SSB dependen de la base de depletion de starter.ss (aqui SSB0).
###############################################################################
