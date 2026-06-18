# Integrating environmental and predator effects into a length-based stock assessment of Antarctic krill (*Euphausia superba*)

This repository contains the Stock Synthesis 3 (SS3 v3.30.21) assessment model for *Euphausia superba* (Antarctic krill) in Subarea 48.1, incorporating spatial heterogeneity and ecosystem variables (environmental covariates and predator-derived natural mortality). Four model configurations are evaluated, ranging from a baseline spatial implicit model to fully ecosystem-informed scenarios. Key functions and documentation are available at: [SA_Krill Documentation](https://mauromardones.github.io/SA_Krill/).

## Project Structure

```
SA_Krill
│── s1.1/           # Baseline spatial implicit model (fishery + survey data)
│── s1.2/           # Baseline + predator mortality (M2)
│── s1.3/           # Baseline + environmental covariate (Chl-a → recruitment)
│── s1.4/           # Baseline + predator mortality + environmental covariate
│── Figs/           # Output figures
│── outputs/        # Processed results and diagnostics
│── MS2_Krill_revised.Rmd   # Main manuscript (R Markdown)
│── Supp_Mat_1.Rmd          # Supplementary Material 1 (to run, read outputs and rreproduce excercise)
│── Supp_Mat_2.Rmd          # Supplementary Material 2 (model equations)
│── SA_krill.bib            # BibTeX references
│── README.md               # Project overview
```

## Model Scenarios

| Scenario | Predator (M₂) | Environment (Chl-a) |
|----------|:-------------:|:-------------------:|
| s1.1     | No            | No                  |
| s1.2     | Yes           | No                  |
| s1.3     | No            | Yes                 |
| s1.4     | Yes           | Yes                 |

## Reproducibility

All SS3 model configuration files (`starter.ss`, `forecast.ss`, `control.ss`, `data.ss`) are available within each scenario folder. To run the models, the SS3 executable is required and can be downloaded directly from R using `r4ss`:

```r
r4ss::get_ss3_exe(dir = "s1.1", version = "v3.30.21")
```

Run the same line for each scenario folder (`s1.2`, `s1.3`, `s1.4`).

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
directorios <- c("s1.1", "s1.2", "s1.3", "s1.4")

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

base.model1.1 <- SS_output(dir = dir1.1, covar = TRUE, forecast = TRUE)
base.model1.2 <- SS_output(dir = dir1.2, covar = TRUE, forecast = TRUE)
base.model1.3 <- SS_output(dir = dir1.3, covar = TRUE, forecast = TRUE)
base.model1.4 <- SS_output(dir = dir1.4, covar = TRUE, forecast = TRUE)
```

## Contributions

This assessment contributes to **WG-SAM 2025** working group discussions, providing ecosystem-informed model outputs relevant to CCAMLR's krill fishery management strategy in Subarea 48.1.