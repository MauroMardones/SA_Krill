# Integrating environmental and predator effects into a length-based stock assessment of Antarctic krill (*Euphausia superba*)

This repository contains the Stock Synthesis 3 (SS3 v3.30.21) assessment model for *Euphausia superba* (Antarctic krill) in Subarea 48.1, incorporating spatial heterogeneity and ecosystem variables (environmental covariates and predator-derived natural mortality). Seven model configurations are evaluated, ranging from a baseline spatial implicit model to fully ecosystem-informed scenarios, including three alternative formulations of the environmental link (recruitment, pseudo-index of recruitment deviations, and growth). Key functions and documentation are available at: [SA_Krill Documentation](https://mauromardones.github.io/SA_Krill/).

## Project Structure

```
SA_Krill
│── s1.1/           # Baseline spatial implicit model (fishery + survey data)
│── s1.2/           # Baseline + predator mortality (M2)
│── s1.3/           # Baseline + environmental covariate (Chl-a → SR_regime, additive)
│── s1.4/           # Baseline + predator mortality + environmental covariate (Chl-a → SR_regime, additive)
│── s1.5/           # Baseline + environmental covariate (Chl-a as pseudo-index of recruitment deviations)
│── s1.6/           # Baseline + environmental covariate (Chl-a → von Bertalanffy K, additive)
│── s1.7/           # Baseline + predator mortality + environmental covariate (Chl-a → von Bertalanffy K, additive)
│── Figs/           # Output figures
│── outputs/        # Processed results and diagnostics
│── MS2_Krill_revised.Rmd   # Main manuscript (R Markdown)
│── Supp_Mat_1.Rmd          # Supplementary Material 1 (to run, read outputs and rreproduce excercise)
│── Supp_Mat_2.Rmd          # Supplementary Material 2 (model equations)
│── SA_krill.bib            # BibTeX references
│── README.md               # Project overview
```

## Model Scenarios

| Scenario | Predator (M₂) | Environment (Chl-a) | Environmental link formulation |
|----------|:-------------:|:--------------------:|---------------------------------|
| s1.1     | No            | No                    | —                                |
| s1.2     | Yes           | No                    | —                                |
| s1.3     | No            | Yes                   | Forced additively in `SR_regime` (`SR_regime_ENV_add`) |
| s1.4     | Yes           | Yes                   | Forced additively in `SR_regime` (`SR_regime_ENV_add`) |
| s1.5     | No            | Yes                   | Pseudo-index of recruitment deviations (dedicated `SURVEYENV` fleet, CPUE units = 36) |
| s1.6     | No            | Yes                   | Forced additively on the von Bertalanffy growth coefficient K (`VonBert_K_ENV_add`) |
| s1.7     | Yes           | Yes                   | Forced additively on the von Bertalanffy growth coefficient K (`VonBert_K_ENV_add`) |

All scenarios share the same recruitment variability setting, `SR_sigmaR = 0.8` (fixed, phase -4), so that differences among scenarios are not confounded by different sigmaR values.
### Environmental link formulations

Three alternative ways of incorporating the Chl-a covariate are tested: two acting on the stock-recruitment relationship (s1.3/s1.4 and s1.5) and one acting on growth (s1.6/s1.7):

- **s1.3 / s1.4 — additive in `SR_regime`**: the environmental series enters as a time-varying additive term on top of the (fixed) `SR_regime` base parameter (`env_var&link = 201`), estimated as `SR_regime_ENV_add`. This term competes directly with the freely-estimated annual recruitment deviations for explanatory power over the same years, which tends to weaken its identifiability.
- **s1.5 — pseudo-index of recruitment deviations**: the same Chl-a series is instead read as an observed index for a dedicated survey fleet (`SURVEYENV`), using CPUE data-unit code 36 (recdev), with its own observation error. This anchors the environmental signal independently of the annual recruitment deviations rather than letting it compete with them.
- **s1.6 / s1.7 — additive on von Bertalanffy K**: the Chl-a series enters as a time-varying additive term on the growth coefficient (`env_var&link = 201`, environmental variable 1), so that K(y) = K + β·Chl-a(y), with β estimated as `VonBert_K_ENV_add` (bounds −0.1 to 0.1). The underlying assumption is faster growth in years of higher chlorophyll. The `SR_regime` environmental link is switched off in these scenarios. The upper bound of K was raised to 1.5. s1.6 is the growth-link counterpart of s1.3 (no predator) and s1.7 the counterpart of s1.4 (with predator M₂).

## Reproducibility

All SS3 model configuration files (`starter.ss`, `forecast.ss`, `control.ss`, `data.ss`) are available within each scenario folder. To run the models, the SS3 executable is required and can be downloaded directly from R using `r4ss`:

```r
r4ss::get_ss3_exe(dir = "s1.1", version = "v3.30.21")
```

Run the same line for each scenario folder (`s1.2`, `s1.3`, `s1.4`, `s1.5`, `s1.6`, `s1.7`).

### R Packages

```r
pkgs <- c("r4ss", "ss3diags", "doParallel",
          "tibble", "tidyr", "tidyverse",
          "readxl", "openxlsx", "broom",
          "forecast", "mixR", "lmtest",
          "car", "ggpubr", "ggthemes",
          "ggridges", "ggrepel", "cowplot",
          "kableExtra", "flextable", "here",
          "scales", "patchwork")

instalar <- pkgs[!pkgs %in% installed.packages()]
if (length(instalar) > 0) install.packages(instalar)
invisible(lapply(pkgs, library, character.only = TRUE))
```

### Run Models

```r
directorios <- c("s1.1", "s1.2", "s1.3", "s1.4", "s1.5", "s1.6", "s1.7")

for (dir in directorios) {
  r4ss::run(
    dir = dir,
    exe = "ss_osx",       # use "ss" on Windows
    skipfinished = FALSE,
    show_in_console = TRUE
  )
}
```

### Read Outputs

```r
library(here)

dir1.1 <- here("s1.1")
dir1.2 <- here("s1.2")
dir1.3 <- here("s1.3")
dir1.4 <- here("s1.4")
dir1.5 <- here("s1.5")
dir1.6 <- here("s1.6")
dir1.7 <- here("s1.7")

base.model1.1 <- SS_output(dir = dir1.1, covar = TRUE, forecast = TRUE)
base.model1.2 <- SS_output(dir = dir1.2, covar = TRUE, forecast = TRUE)
base.model1.3 <- SS_output(dir = dir1.3, covar = TRUE, forecast = TRUE)
base.model1.4 <- SS_output(dir = dir1.4, covar = TRUE, forecast = TRUE)
base.model1.5 <- SS_output(dir = dir1.5, covar = TRUE, forecast = TRUE)
base.model1.6 <- SS_output(dir = dir1.6, covar = TRUE, forecast = TRUE)
base.model1.7 <- SS_output(dir = dir1.7, covar = TRUE, forecast = TRUE)
```

## Contributions

This assessment contributes to **WG-SAM 2025** working group discussions, providing ecosystem-informed model outputs relevant to CCAMLR's krill fishery management strategy in Subarea 48.1.
