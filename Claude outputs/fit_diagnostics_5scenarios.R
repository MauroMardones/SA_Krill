## ---------------------------------------------------------------
## Diagnóstico de ajuste de tallas (BS y GS) para s1.1 a s1.5
## SIN r4ss: lectura directa de Report.sso y CompReport.sso
## ---------------------------------------------------------------

library(dplyr)
library(ggplot2)
library(purrr)
library(stringr)

base_dir <- "~/mnt/SA_Krill"   # ajusta si tu ruta local es distinta
scenarios <- c("s1.1", "s1.2", "s1.3", "s1.4", "s1.5")

fleet_lookup <- c(`1` = "FISHERYBS", `3` = "FISHERYGS")

# -----------------------------------------------------------------
# 1) Resumen de ajuste por flota (Length_Comp_Fit_Summary en Report.sso)
# -----------------------------------------------------------------
read_lencomp_summary <- function(scenario) {
  rpt_path <- file.path(base_dir, scenario, "Report.sso")
  rpt <- readLines(rpt_path)

  hdr_line <- grep("^Length_Comp_Fit_Summary", rpt)
  stopifnot(length(hdr_line) == 1)

  col_line  <- hdr_line + 1
  col_names <- strsplit(rpt[col_line], "\\s+")[[1]]

  data_lines <- character(0)
  i <- col_line + 1
  while (i <= length(rpt) && nchar(trimws(rpt[i])) > 0 &&
         grepl("^[0-9-]", trimws(rpt[i]))) {
    data_lines <- c(data_lines, rpt[i])
    i <- i + 1
  }

  df <- read.table(text = data_lines, col.names = col_names,
                    fill = TRUE, na.strings = "NA")
  df$scenario <- scenario
  df
}

summary_all <- map_dfr(scenarios, read_lencomp_summary)

summary_BSGS <- summary_all %>%
  filter(Fleet_name %in% c("FISHERYBS", "FISHERYGS")) %>%
  select(scenario, Fleet_name, Npos, mean_effN, HarMean_effN, Curr_Var_Adj) %>%
  arrange(Fleet_name, scenario)

print(summary_BSGS)
# write.csv(summary_BSGS, "resumen_ajuste_BS_GS.csv", row.names = FALSE)

# -----------------------------------------------------------------
# 2) Ajuste fino obs vs exp por año y talla (CompReport.sso)
# -----------------------------------------------------------------
read_lencomp_detail <- function(scenario, fleet_num) {
  cr_path <- file.path(base_dir, scenario, "CompReport.sso")
  hdr_line <- grep("^Yr Month Seas", readLines(cr_path, n = 60))
  stopifnot(length(hdr_line) == 1)

  df <- read.table(cr_path, header = TRUE, skip = hdr_line - 1,
                    fill = TRUE, na.strings = "NA",
                    nrows = -1, stringsAsFactors = FALSE)

  df %>%
    filter(Fleet == fleet_num, Kind == "LEN") %>%
    mutate(scenario = scenario,
           fleet_name = fleet_lookup[as.character(fleet_num)])
}

detail_BS <- map_dfr(scenarios, ~read_lencomp_detail(.x, fleet_num = 1))
detail_GS <- map_dfr(scenarios, ~read_lencomp_detail(.x, fleet_num = 3))
detail_all <- bind_rows(detail_BS, detail_GS)

# RMSE de residuos de Pearson por escenario y flota (medida simple de ajuste)
rmse_tab <- detail_all %>%
  group_by(scenario, fleet_name) %>%
  summarise(RMSE_pearson = sqrt(mean(Pearson^2, na.rm = TRUE)),
            n_obs = n(), .groups = "drop") %>%
  arrange(fleet_name, scenario)

print(rmse_tab)

# -----------------------------------------------------------------
# 3) Gráficos: observado vs esperado por año (agregado en proporción)
# -----------------------------------------------------------------
plot_fit <- function(fleet_data, fleet_label) {
  agg <- fleet_data %>%
    group_by(scenario, Yr, Bin) %>%
    summarise(Obs = sum(Obs), Exp = sum(Exp), .groups = "drop") %>%
    group_by(scenario, Yr) %>%
    mutate(Obs_p = Obs / sum(Obs), Exp_p = Exp / sum(Exp))

  ggplot(agg, aes(x = Bin)) +
    geom_col(aes(y = Obs_p), fill = "grey75") +
    geom_line(aes(y = Exp_p), colour = "firebrick", linewidth = 0.6) +
    facet_grid(scenario ~ Yr, scales = "free_y") +
    labs(title = paste("Ajuste de tallas -", fleet_label),
         x = "Talla (bin)", y = "Proporción") +
    theme_bw(base_size = 8) +
    theme(strip.text = element_text(size = 6),
          axis.text.x = element_text(angle = 90, size = 5))
}

p_bs <- plot_fit(detail_BS, "FISHERYBS")
p_gs <- plot_fit(detail_GS, "FISHERYGS")

ggsave("ajuste_tallas_BS_5escenarios.png", p_bs, width = 20, height = 10, dpi = 200)
ggsave("ajuste_tallas_GS_5escenarios.png", p_gs, width = 20, height = 10, dpi = 200)

# -----------------------------------------------------------------
# 4) Residuos de Pearson por año (bubble plot clásico, sin r4ss)
# -----------------------------------------------------------------
plot_pearson <- function(fleet_data, fleet_label) {
  ggplot(fleet_data, aes(x = Yr, y = Bin, size = abs(Pearson),
                          colour = Pearson > 0)) +
    geom_point(alpha = 0.7) +
    scale_size_area(max_size = 6) +
    scale_colour_manual(values = c("TRUE" = "steelblue", "FALSE" = "firebrick"),
                         labels = c("Negativo (obs<exp)", "Positivo (obs>exp)"),
                         name = "Signo residuo") +
    facet_wrap(~scenario, ncol = 1) +
    labs(title = paste("Residuos de Pearson -", fleet_label),
         x = "Año", y = "Talla (bin)", size = "|Pearson|") +
    theme_bw()
}

p_bs_res <- plot_pearson(detail_BS, "FISHERYBS")
p_gs_res <- plot_pearson(detail_GS, "FISHERYGS")

ggsave("residuos_pearson_BS_5escenarios.png", p_bs_res, width = 10, height = 14, dpi = 200)
ggsave("residuos_pearson_GS_5escenarios.png", p_gs_res, width = 10, height = 14, dpi = 200)
