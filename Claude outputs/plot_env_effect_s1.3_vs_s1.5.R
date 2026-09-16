## ------------------------------------------------------------------
## Efecto del ambiente en la curva S-R: s1.3 (forzado en SR_regime)
## vs s1.5 (pseudo-encuesta de recdev, Units=36)
## Sin r4ss, lectura directa de Report.sso
## ------------------------------------------------------------------

library(dplyr)
library(ggplot2)
library(tidyr)

base_dir <- "~/mnt/SA_Krill"

# ---------------------------------------------------------------
# 1) s1.3: tabla SPAWN_RECRUIT -> exp_recr (curva SIN regimen/env)
#    vs with_regime (curva CON el desplazamiento ambiental)
# ---------------------------------------------------------------
read_spawn_recruit <- function(scenario) {
  rpt_path <- file.path(base_dir, scenario, "Report.sso")
  rpt <- readLines(rpt_path)

  col_line <- grep("^Yr SpawnBio exp_recr", rpt)[1]
  if (is.na(col_line)) {
    stop("No encontré la tabla SPAWN_RECRUIT (linea 'Yr SpawnBio exp_recr...') en ", rpt_path)
  }

  data_lines <- character(0)
  i <- col_line + 1
  while (i <= length(rpt) && nchar(trimws(rpt[i])) > 0) {
    first_tok <- strsplit(trimws(rpt[i]), "\\s+")[[1]][1]
    if (grepl("^[0-9]{4}$", first_tok)) {   # solo filas con año real (excluye S/Rcurve, Virg, Init)
      data_lines <- c(data_lines, rpt[i])
    }
    i <- i + 1
    if (i > col_line + 2000) break
  }
  if (length(data_lines) == 0) {
    stop("No se extrajeron filas de datos de SPAWN_RECRUIT en ", rpt_path)
  }

  # header + datos juntos -> read.table asigna los nombres solo, sin riesgo de desalineación
  df <- read.table(text = c(rpt[col_line], data_lines), header = TRUE,
                    fill = TRUE, na.strings = c("NA", "-"),
                    stringsAsFactors = FALSE)
  stopifnot(all(c("exp_recr", "with_regime") %in% names(df)))
  df$scenario <- scenario
  df
}

sr_s13 <- read_spawn_recruit("s1.3")
sr_s15 <- read_spawn_recruit("s1.5")   # sirve de referencia: with_regime = exp_recr (sin link ambiental)

sr_s13 <- sr_s13 %>%
  mutate(env_shift_abs = with_regime - exp_recr,
         env_shift_pct = 100 * (with_regime / exp_recr - 1))

# Gráfico 1: curva base vs curva desplazada por ambiente, s1.3
p1 <- sr_s13 %>%
  select(Yr, exp_recr, with_regime) %>%
  pivot_longer(-Yr, names_to = "curva", values_to = "recr") %>%
  mutate(curva = recode(curva,
                         exp_recr = "Curva S-R base (sin ambiente)",
                         with_regime = "Curva S-R con offset ambiental")) %>%
  ggplot(aes(Yr, recr, colour = curva)) +
  geom_line(linewidth = 0.8) +
  labs(title = "s1.3: efecto del ambiente sobre el reclutamiento esperado (SR_regime)",
       x = "Año", y = "Reclutamiento esperado", colour = NULL) +
  theme_bw()

# Gráfico 2: magnitud del desplazamiento ambiental por año (%), s1.3
p2 <- ggplot(sr_s13, aes(Yr, env_shift_pct)) +
  geom_col(fill = "steelblue") +
  geom_hline(yintercept = 0, linetype = 2) +
  labs(title = "s1.3: % de desplazamiento de la curva S-R atribuible al ambiente",
       x = "Año", y = "Cambio en reclutamiento esperado (%)") +
  theme_bw()

# ---------------------------------------------------------------
# 2) s1.5: tabla INDEX_2 para la flota SURVEYENV
#    Obs = valor ambiental observado ; Exp = Q * recdev_y
# ---------------------------------------------------------------
read_index2_env <- function(scenario, fleet_name = "SURVEYENV") {
  rpt_path <- file.path(base_dir, scenario, "Report.sso")
  rpt <- readLines(rpt_path)

  hdr_line <- grep("^INDEX_2 report", rpt)[1]
  if (is.na(hdr_line)) {
    stop("No encontré la seccion INDEX_2 en ", rpt_path)
  }
  col_line <- hdr_line + 1  # "Fleet Fleet_name Area Yr Seas ... Obs Exp ..."

  data_lines <- character(0)
  i <- col_line + 1
  while (i <= length(rpt)) {
    ln <- rpt[i]
    if (nchar(trimws(ln)) == 0) break
    toks <- strsplit(trimws(ln), "\\s+")[[1]]
    if (length(toks) < 4) break
    if (toks[2] == fleet_name && grepl("^[0-9]{4}$", toks[4])) {
      data_lines <- c(data_lines, ln)
    }
    i <- i + 1
    if (i - col_line > 5000) break
  }
  if (length(data_lines) == 0) {
    stop("No se extrajeron filas para la flota '", fleet_name, "' en INDEX_2 de ", rpt_path)
  }

  df <- read.table(text = c(rpt[col_line], data_lines), header = TRUE,
                    fill = TRUE, na.strings = "NA", stringsAsFactors = FALSE)
  stopifnot(all(c("Yr", "Obs", "Exp") %in% names(df)))
  df$scenario <- scenario
  df
}

env_fit_s15 <- read_index2_env("s1.5")

p3 <- env_fit_s15 %>%
  dplyr::select(Yr, Obs, Exp) %>%
  pivot_longer(-Yr, names_to = "series", values_to = "value") %>%
  dplyr::mutate(series = dplyr::recode(series,
                         Obs = "Observed environmental index (env Z-score)",
                         Exp = "Estimated Q x recdev (model fit)")) %>%
  ggplot(aes(Yr, value, colour = series)) +
  geom_line(linewidth = 0.8) +
  geom_point(size = 1.5) +
  geom_hline(yintercept = 0, linetype = 2, colour = "grey50") +
  labs(title = "s1.5: environmental pseudo-survey - observed vs fitted (Q x recdev)",
       x = "Year", y = "Value (normal space)", colour = NULL) +
  theme_bw()

# ---------------------------------------------------------------
# 3) Comparación directa: "cuánto empuja" el ambiente en cada
#    escenario, en la misma escala (offset s1.3 vs Exp=Q*recdev s1.5)
# ---------------------------------------------------------------
comp <- dplyr::bind_rows(
  sr_s13 %>% dplyr::transmute(Yr, scenario = "s1.3 (forced in SR_regime)", effect = env_shift_abs / max(abs(env_shift_abs), na.rm = TRUE)),
  env_fit_s15 %>% dplyr::transmute(Yr, scenario = "s1.5 (recdev pseudo-index)", effect = Exp / max(abs(Exp), na.rm = TRUE))
)

p4 <- ggplot(comp, aes(Yr, effect, colour = scenario)) +
  geom_line(linewidth = 0.9) +
  geom_hline(yintercept = 0, linetype = 2, colour = "grey50") +
  labs(title = "Normalized environmental effect by scenario (s1.3 vs s1.5)",
       subtitle = "Each series scaled to its own absolute maximum, to compare temporal SHAPE, not magnitude",
       x = "Year", y = "Environmental effect (normalized)", colour = NULL) +
  theme_bw()

# ---------------------------------------------------------------
# Guardar
# ---------------------------------------------------------------
ggsave("s13_curva_SR_base_vs_regimen.png", p1, width = 9, height = 5, dpi = 200)
ggsave("s13_pct_desplazamiento_ambiental.png", p2, width = 9, height = 5, dpi = 200)
ggsave("s15_obs_vs_exp_pseudoindice.png", p3, width = 9, height = 5, dpi = 200)
ggsave("comparacion_efecto_ambiental_s13_s15.png", p4, width = 9, height = 5, dpi = 200)

print(p1); print(p2); print(p3); print(p4)
