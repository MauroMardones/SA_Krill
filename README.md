# Integrating environmental and predator effects into a length-based stock assessment of Antarctic krill (*Euphausia superba*)

This repository contains the Stock Synthesis 3 (SS3 v3.30.21) assessment model for *Euphausia superba* (Antarctic krill) in Subarea 48.1, incorporating spatial heterogeneity and ecosystem variables (environmental covariates and predator-derived natural mortality). Four model configurations are evaluated, ranging from a baseline spatial implicit model to fully ecosystem-informed scenarios. Key functions and documentation are available at: [SA_Krill Documentation](https://mauromardones.github.io/SA_Krill/).

## Project Structure

```
📂 SA_Krill
│── 📂 s1.1/           # Baseline spatial implicit model (fishery + survey data)
│── 📂 s1.2/           # Baseline + predator mortality (M2)
│── 📂 s1.3/           # Baseline + environmental covariate (Chl-a → recruitment)
│── 📂 s1.4/           # Baseline + predator mortality + environmental covariate
│── 📂 Figs/           # Output figures
│── 📂 outputs/        # Processed results and diagnostics
│── 📄 MS2_Krill_revised.Rmd   # Main manuscript (R Markdown)
│── 📄 Supp_Mat_1.Rmd          # Supplementary Material 1
│── 📄 Supp_Mat_2.Rmd          # Supplementary Material 2 (model equations)
│── 📄 SA_krill.bib            # BibTeX references
│── 📄 README.md               # Project overview
```

## Model Scenarios

| Scenario | Predator (M₂) | Environment (Chl-a) |
|----------|:-------------:|:-------------------:|
| s1.1     | No            | No                  |
| s1.2     | Yes           | No                  |
| s1.3     | No            | Yes                 |
| s1.4     | Yes           | Yes                 |

## Reproducibility

All SS3 model configuration files are available within each scenario folder. Additional information required to fully reproduce the analysis can be shared upon request.

## Contributions

This assessment contributes to **WG-SAM 2025** working group discussions, providing ecosystem-informed model outputs relevant to CCAMLR's krill fishery management strategy in Subarea 48.1.
