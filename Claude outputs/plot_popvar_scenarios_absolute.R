cols <- c("Yr", "Bio_smry", "SpawnBio", "Recruit_0")
outps1 <- base.model1.1$timeseries[, cols] %>% mutate(Model = "s1.1")
outps2 <- base.model1.2$timeseries[, cols] %>% mutate(Model = "s1.2")
outps3 <- base.model1.3$timeseries[, cols] %>% mutate(Model = "s1.3")
outps4 <- base.model1.4$timeseries[, cols] %>% mutate(Model = "s1.4")
outps5 <- base.model1.5$timeseries[, cols] %>% mutate(Model = "s1.5")

outps1$Model <- "s1.1"
outps2$Model <- "s1.2"
outps3$Model <- "s1.3"
outps4$Model <- "s1.4"
outps5$Model <- "s1.5"
outpsall <- rbind(outps1, outps2, outps3, outps4, outps5)
outpsall_long <- outpsall |>
  pivot_longer(
    cols      = c(Bio_smry, SpawnBio, Recruit_0),
    names_to  = "Variable",
    values_to = "Value"
  ) |>
  filter(Yr >= 1989, Yr <= 2020) |>
  mutate(Variable = case_when(
    Variable == "Bio_smry"  ~ "Summary Biomass (t)",
    Variable == "SpawnBio"  ~ "Spawning Stock Biomass (t)",
    Variable == "Recruit_0" ~ "Recruitment (N)",
    TRUE ~ Variable
  ))
panel_order <- c("Summary Biomass (t)",
                 "Spawning Stock Biomass (t)",
                 "Recruitment (N)")
colors <- c("s1.1" = "#ca0020", "s1.2" = "#f4a582",
            "s1.3" = "#bababa", "s1.4" = "#404040",
            "s1.5" = "#0571b0")
shapes <- c("s1.1" = 16, "s1.2" = 17, "s1.3" = 15, "s1.4" = 4)
theme_prod <- theme_bw() +
  theme(
    panel.grid.minor = element_blank(),
    panel.grid.major = element_line(color = "grey92"),
    strip.background = element_blank(),
    legend.position  = "none",
    axis.text        = element_text(size = 9),
    axis.title       = element_text(size = 10)
  )

# ── Valores virginales (B0/R0) por escenario, desde la fila de equilibrio
# no explotado del timeseries (Era == "VIRG"). Ya NO se usan para normalizar
# (eso era la versión relativa); se conservan solo por si querés dibujarlos
# como línea de referencia horizontal por escenario ────────────────────
get_virgin <- function(model, modelname) {
  model$timeseries |>
    dplyr::filter(Era == "VIRG") |>
    dplyr::slice(1) |>
    dplyr::select(Bio_smry, SpawnBio, Recruit_0) |>
    dplyr::mutate(Model = modelname)
}
virgin_long <- dplyr::bind_rows(
  get_virgin(base.model1.1, "s1.1"),
  get_virgin(base.model1.2, "s1.2"),
  get_virgin(base.model1.3, "s1.3"),
  get_virgin(base.model1.4, "s1.4"),
  get_virgin(base.model1.5, "s1.5")
) |>
  pivot_longer(cols = c(Bio_smry, SpawnBio, Recruit_0),
               names_to = "VarRaw", values_to = "Virgin") |>
  mutate(Variable = case_when(
    VarRaw == "Bio_smry"  ~ "Summary Biomass (t)",
    VarRaw == "SpawnBio"  ~ "Spawning Stock Biomass (t)",
    VarRaw == "Recruit_0" ~ "Recruitment (N)",
    TRUE ~ VarRaw
  )) |>
  dplyr::select(Model, Variable, Virgin)

# Serie principal en escala ABSOLUTA (sin dividir por el valor virginal)
# outpsall_long ya está en unidades absolutas, no hace falta tocarla

# ── Survey total con CV propagado → va en Summary Biomass, en unidades
# absolutas (sin referenciar contra SmryBio0) ───────────────────────────
survey_total <- dat1$CPUE |>
  dplyr::filter(index %in% c(6, 7, 8, 9, 10)) |>
  dplyr::group_by(year) |>
  dplyr::summarise(
    Value   = sum(obs),
    cv_pool = sqrt(sum((se_log * obs)^2)) / sum(obs),
    .groups = "drop"
  ) |>
  dplyr::filter(year >= 1989, year <= 2020) |>
  dplyr::rename(Yr = year) |>
  dplyr::mutate(
    Variable = "Summary Biomass (t)",
    lo       = Value * exp(-1.96 * cv_pool),
    hi       = Value * exp( 1.96 * cv_pool)
  )

# ── Incertidumbre de las variables poblacionales (derived_quants, SS3),
# en escala absoluta (sin dividir por Virgin) ───────────────────────────
get_pop_unc <- function(model, modelname) {
  dq <- model$derived_quants
  extract_dq <- function(prefix, varname) {
    dq |>
      dplyr::filter(grepl(paste0("^", prefix, "_[0-9]{4}$"), Label)) |>
      dplyr::mutate(
        Yr       = as.numeric(gsub(paste0(prefix, "_"), "", Label)),
        Variable = varname,
        Model    = modelname
      ) |>
      dplyr::select(Yr, Variable, Model, Value, StdDev)
  }
  dplyr::bind_rows(
    extract_dq("SSB",     "Spawning Stock Biomass (t)"),
    extract_dq("Recr",    "Recruitment (N)"),
    extract_dq("SmryBio", "Summary Biomass (t)")
  )
}
pop_unc <- dplyr::bind_rows(
  get_pop_unc(base.model1.1, "s1.1"),
  get_pop_unc(base.model1.2, "s1.2"),
  get_pop_unc(base.model1.3, "s1.3"),
  get_pop_unc(base.model1.4, "s1.4"),
  get_pop_unc(base.model1.5, "s1.5")
) |>
  dplyr::filter(Yr >= 1989, Yr <= 2020) |>
  dplyr::mutate(
    cv = StdDev / Value,
    lo = Value * exp(-1.96 * cv),
    hi = Value * exp( 1.96 * cv)
  )

library(ggh4x)

# ── Límites fijos por panel (Variable): ajusta estos tres máximos a lo que
# veas razonable en tus datos. El ribbon y las barras de error se recortan
# visualmente (coord_cartesian), no se borran ni se recalculan ──────────
y_limits <- list(
  Variable == "Summary Biomass (t)"       ~ scale_y_continuous(limits = c(0, 1.2e8)),
  Variable == "Spawning Stock Biomass (t)" ~ scale_y_continuous(limits = c(0, 6e7)),
  Variable == "Recruitment (N)"           ~ scale_y_continuous(limits = c(0, 2e12))
)

alloutput_abs <- ggplot(
  outpsall_long,
  aes(x = Yr,
      y = Value,
      color = Model,
      shape = Model,
      group = Model)) +
  geom_ribbon(
    data        = pop_unc,
    aes(x = Yr, ymin = lo, ymax = hi, fill = Model),
    inherit.aes = FALSE,
    alpha       = 0.15,
    color       = NA
  ) +
  geom_line(linewidth = 0.8) +
  geom_point(size = 1.2, alpha = 0.7) +
  geom_errorbar(
    data        = survey_total,
    aes(x = Yr, ymin = lo, ymax = hi),
    inherit.aes = FALSE,
    color       = "#1f78b4",
    width       = 0.4,
    linewidth   = 0.5,
    alpha       = 0.7
  ) +
  geom_point(
    data        = survey_total,
    aes(x = Yr, y = Value),
    inherit.aes = FALSE,
    color       = "#1f78b4",
    shape       = 18,
    size        = 2.2,
    alpha       = 0.9
  ) +
  facet_wrap(
    ~ factor(Variable, levels = panel_order),
    ncol   = 3,
    scales = "free"
  ) +
  scale_color_manual(name = "Scenario", values = colors) +
  scale_shape_manual(name = "Scenario", values = shapes) +
  scale_fill_manual(values = colors, guide = "none") +
  ggh4x::facetted_pos_scales(y = y_limits) +
  coord_cartesian(clip = "on") +
  scale_x_continuous(breaks = seq(1990, 2020, by = 5)) +
  labs(x = "", y = "") +
  theme_prod +
  theme(
    axis.text.x     = element_text(angle = 90, hjust = 1),
    strip.text      = element_text(size = 8),
    legend.position = "bottom",
    legend.title    = element_text(size = 10, face = "bold"),
    legend.text     = element_text(size = 9)
  )

ggsave(alloutput_abs, filename = "Figs/popvar_scenarios_absolute.png",
       width = 9,
       height = 4,
       units = "in", dpi = 300)
alloutput_abs
