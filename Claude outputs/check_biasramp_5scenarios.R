## ------------------------------------------------------------------
## Revisión de la rampa de ajuste de sesgo (bias-adjustment ramp) para
## los 5 escenarios, usando r4ss::SS_fitbiasramp(). Esto NO corre SS3,
## solo lee el Report.sso ya generado y recalcula los valores
## recomendados de la rampa a partir del patrón real de varianza de
## los recdevs de cada modelo (Methot & Taylor 2011).
## ------------------------------------------------------------------

library(r4ss)
library(dplyr)
library(purrr)
library(ggplot2)

# Asume que ya tienes los replists cargados, tal como en tu script de
# comparación de escenarios (base.model1.1 ... base.model1.5).
# Si no, cárgalos así (ajusta la ruta a cada carpeta):
# base.model1.1 <- SS_output(dir = "s1.1", verbose = FALSE, printstats = FALSE)
# base.model1.2 <- SS_output(dir = "s1.2", verbose = FALSE, printstats = FALSE)
# base.model1.3 <- SS_output(dir = "s1.3", verbose = FALSE, printstats = FALSE)
# base.model1.4 <- SS_output(dir = "s1.4", verbose = FALSE, printstats = FALSE)
# base.model1.5 <- SS_output(dir = "s1.5", verbose = FALSE, printstats = FALSE)

models <- list(
  s1.1 = base.model1.1,
  s1.2 = base.model1.2,
  s1.3 = base.model1.3,
  s1.4 = base.model1.4,
  s1.5 = base.model1.5
)

# ── 1) Valores ACTUALES de la rampa (los que están hoy en cada control.ss) ──
current_ramp <- purrr::imap_dfr(models, function(mod, name) {
  bp <- mod$breakpoints_for_bias_adjustment_ramp  # data.frame de 1 fila, columnas nombradas
  data.frame(
    Model               = name,
    last_early_yr       = bp$last_yr_early,
    first_yr_full       = bp$first_yr_full,
    last_yr_full        = bp$last_yr_full,
    first_recent_yr     = bp$first_yr_recent,
    max_bias_adj_actual = bp$max_bias_adj
  )
})
print(current_ramp)

# ── 2) Valores RECOMENDADOS por SS_fitbiasramp() para cada escenario ──
# oldctl/newctl = FALSE para que solo calcule y no intente reescribir
# archivos de control por sí solo (lo hacemos nosotros después, a mano,
# igual que el resto de los cambios, con backup y aplicado por escenario).
biasramp_list <- purrr::imap(models, function(mod, name) {
  out <- SS_fitbiasramp(
    replist   = mod,
    plot      = FALSE,   # el plot automático choca con el dispositivo grafico
    print     = FALSE,   # de los chunks de RStudio Notebook -- lo generamos
    oldctl    = NULL,    # aparte, fuera del loop, si hace falta verlo
    newctl    = NULL,
    altmethod = "nlminb"
  )
  out$df$Model <- name
  out
})

# Si quieres VER el gráfico diagnóstico que arma SS_fitbiasramp() para un
# escenario puntual, ábrelo con un dispositivo gráfico explícito (evita el
# mismo problema del chunk de notebook):
# png("biasramp_s1.1.png", width = 800, height = 600)
# SS_fitbiasramp(replist = base.model1.1, plot = TRUE, print = FALSE)
# dev.off()

# IMPORTANTE: la estructura exacta de $df puede variar según la versión de
# r4ss. Antes de armar la tabla comparativa, revisa cómo quedó para
# confirmar los nombres de columna reales:
str(biasramp_list[["s1.1"]]$df)
print(biasramp_list[["s1.1"]]$df)

# Si los nombres de columna calzan con lo de abajo, sigue. Si no, ajusta
# los nombres en dplyr::select() según lo que te haya mostrado el str()
# de arriba.
recommended_ramp <- purrr::imap_dfr(biasramp_list, function(x, name) {
  d <- x$df
  d$Model <- name
  d
})
print(recommended_ramp)

comparison <- current_ramp |>
  dplyr::left_join(recommended_ramp, by = "Model")
print(comparison)

# ── 3) Gráfico comparativo ───────────────────────────────────────────────
# SS_fitbiasramp(plot = TRUE) ya genera, por cada escenario, su propio
# gráfico base R con la rampa actual vs la recomendada superpuestas
# (se abre uno por cada llamada al correr el bloque de arriba). Para un
# panel propio los 5 juntos, primero necesito ver los nombres reales de
# columna que te haya impreso el str() de arriba -- pásamelos y te dejo
# el bloque de graficado ya ajustado a esos nombres exactos, en vez de
# que yo intente adivinarlos de nuevo.

# ── 4) Qué hacer con esto ───────────────────────────────────────────────
# Esto NO reescribe tus control.ss automáticamente. Revisa la tabla
# `comparison` y dime los valores recomendados que salieron para cada
# escenario -- los aplico yo directamente a los 5 control.ss (con backup,
# como el resto de los cambios) y los vuelves a correr.
#
# A diferencia de otros ajustes de este proyecto, la rampa de bias-adjustment
# SÍ puede (y normalmente DEBE) diferir entre escenarios, porque depende del
# patrón de varianza de los recdevs propio de cada modelo -- no rompe la
# comparabilidad estructural que hemos mantenido para el resto de los parámetros.
