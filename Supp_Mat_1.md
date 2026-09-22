---
title: "Supplementary Material 1"
subtitle: "Reproducible Code to Output and Model Diagnostics for Antarctic Krill Stock Assessment"
date:  "22 September, 2026"
bibliography: bib/SA_krill.bib
csl: bib/apa.csl
#csl: icesjournal.csl
link-citations: yes
linkcolor: blue
output:
  bookdown::pdf_document2:
    keep_md: true
    toc: true
    toc_deep: 3
    toc_float:
      collapsed: false
      smooth_scroll: false
    theme: simplex
    fontsize: 0.9em
    linestretch: 1.7
    html-math-method: katex
    self-contained: true
    code-tools: true
    number_sections: false
always_allow_html: true
editor_options:
  markdown:
    wrap: 72
---

\newpage

# Overview

This documents have outputs and tables supplementaries as part of the scientific article titled **"Environmental and predator impacts on Antarctic Krill (*Euphausia superba*) population dynamics from an integrated length-to-age assessment model perspective."**

# Modeling setting



## Libraries

Libraries necessary to made this analysis;


``` r
# install.packages('devtools')
# devtools::install_github('r4ss/r4ss',
# ref='development') install.packages('caTools')
# library('caTools') install.packages('r4ss')
# Requiere el paquete funtimes (no está en tu
# lista de pkgs actual)
# install.packages('funtimes')
pkgs <- c("r4ss", "ss3diags", "doParallel", "tibble",
    "tidyr", "tidyverse", "readxl", "openxlsx", "broom",
    "forecast", "mixR", "lmtest", "funtimes", "car",
    "ggpubr", "ggthemes", "ggridges", "ggrepel", "cowplot",
    "kableExtra", "flextable", "here", "scales", "ggthemes",
    "patchwork", "ggh4x")

instalar <- pkgs[!pkgs %in% installed.packages()]
if (length(instalar) > 0) install.packages(instalar)

invisible(lapply(pkgs, library, character.only = TRUE))

library(doParallel)
registerDoParallel(8)
```



## Code Repository

The repository with files templates by scenario to replicate this analysis can be found in this [GitHub author link](https://github.com/MauroMardones/SA_Krill/tree/main/scenarios)

## Run Models




``` r
### Run all Models
directorios <- c("s1.1", "s1.2", "s1.3", "s1.4", "s1.5",
    "s1.6", "s1.7")

for (dir in directorios) {
    r4ss::run(dir = dir, exe = "ss_osx", skipfinished = FALSE,
        show_in_console = TRUE)
}
```





``` r
# reading ss3 outputs s1.1
base.model1.1 <- SS_output(dir = dir1.1, covar = T,
    forecast = T)
# s1.2
base.model1.2 <- SS_output(dir = dir1.2, covar = T,
    forecast = T)
# s1.3
base.model1.3 <- SS_output(dir = dir1.3, covar = T,
    forecast = T)
# s1.4
base.model1.4 <- SS_output(dir = dir1.4, covar = T,
    forecast = T)
# s1.5
base.model1.5 <- SS_output(dir = dir1.5, covar = T,
    forecast = T)
# s1.6
base.model1.6 <- SS_output(dir = dir1.6, covar = T,
    forecast = T)
# s1.7
base.model1.7 <- SS_output(dir = dir1.7, covar = T,
    forecast = T)
```


# Data

## Environmental Data

Based on @Flores2012; @Morley2020; @Veytia2021; @Walsh2020, Chl-a emerged as the most influential predictor and was therefore selected for incorporation into the stock assessment model as an environmental covariate. Figure \@ref(fig:mapachl) presents a time series of Chl-a concentration (mg m$^{-3}$) in the waters around the Antarctic Peninsula from 2000 to 2020. Each panel represents a different year, showing spatial variations in Chl-a levels as an indicator of phytoplankton biomass. The highest concentrations were observed along the coastal regions, while offshore areas exhibited lower Chl-a levels.

\begin{figure}[H]

{\centering \includegraphics[width=1\linewidth]{Figs/chla_grilled} 

}

\caption{Time series (2000-2020) to Chlorophyll in Subarea 48.1}(\#fig:mapachl)
\end{figure}

The interannual variability of this environmental index from 2000 to 2020 is shown in Figure \@ref(fig:chlindex). The figure highlights fluctuations across years, with periods of higher-than-average chlorophyll variability (e.g., 2003, 2016) as well as years with significantly lower values (e.g., 2011, 2020).

\begin{figure}[H]

{\centering \includegraphics[width=\linewidth]{Figs/chlindex-1} 

}

\caption{Interannual variability of the Chlorophyll Variability Index from 2000 to 2020. Positive anomalies (in red) and negative anomalies (in black) indicate below-average conditions}(\#fig:chlindex)
\end{figure}

## Predator Component 

The top panel in Figure \@ref(fig:mapapre) shows annual krill length distributions derived from penguin diet samples, displayed by predator species.

\begin{figure}[H]

{\centering \includegraphics[width=1\linewidth]{Figs/new_predator_plot} 

}

\caption{Ecosystem indicators derived from penguin predator data in the Western Antarctic Peninsula. Top panel: Annual krill length distributions from penguin diet samples by species: adélie, chinstrap, and gentoo. A red horizontal line marks the 3.6 cm as recruit size for reference purposes. Bottom panel: Synoptic index of relative predator biomass, used as an ecosystem input in the stock assessment model.}(\#fig:mapapre)
\end{figure}


## Abundances Index 

Standardized indices of krill index abundance and consumption from fishery-dependent, fishery-independent, and predator-based data sources across different strata within Subarea 48.1. Each panel represents a distinct spatial or functional stratum, with trend lines indicating temporal variation from 1990 to 2020. Colors denote data source categories: green for fishery, orange for scientific surveys, and purple for predator-based indices. These patterns highlight spatial and temporal heterogeneity in krill dynamics across the subarea Figure \@ref(fig:index))

\begin{figure}[H]

{\centering \includegraphics[width=\linewidth]{Figs/index-1} 

}

\caption{Standardized indices of krill index abundance and consumption from fishery-dependent, fishery-independent, and predator-based data sources across different strata within Subarea 48.1}(\#fig:index)
\end{figure}

## Length compositions

Annual length-frequency distributions of Antarctic krill (Euphausia superba) across different data sources and spatial strata within Subarea 48.1 from 1991 to 2020. Each panel represents a distinct stratum for either fishery-dependent (green), fishery-independent survey (orange), or predator-based (purple) observations. Density ridgelines illustrate variation in krill size structure across years. The red vertical line marks a recruit references length (3.6 cm) (Figure \@ref(fig:length)).

\begin{figure}[H]

{\centering \includegraphics[width=\linewidth]{Figs/length-1} 

}

\caption{Annual length-frequency distributions of Antarctic krill (Euphausia superba) across different data sources and spatial strata within Subarea 48.1 from 1991 to 2020.}(\#fig:length)
\end{figure}

This information and all sources can be represented through the following flow diagram (Figure \@ref(fig:path)) of inputs, model, and outputs.


\begin{figure}[H]

{\centering \includegraphics[width=0.75\linewidth]{Figs/pathmod} 

}

\caption{Framework path to stock assessment model in krill in WAP (Yellow boxes is not implemeted yet).}(\#fig:path)
\end{figure}

Figure \@ref(fig:dataserie) show time series of differente componentes of data sources to this krill stock assessment.

\begin{figure}[H]

{\centering \includegraphics[width=\linewidth]{Figs/dataserie-1} 

}

\caption{Data series used in krill modelling in 48.1 Subarea}(\#fig:dataserie)
\end{figure}
\newpage

# Results



Selectivity estimated by scenario in Figure \@ref(fig:selectivity).

\begin{figure}[H]

{\centering \includegraphics[width=\linewidth]{Figs/selectivity-1} 

}

\caption{Selectivity by fleet in each scenario}(\#fig:selectivity)
\end{figure}

Length by age



\begin{center}\includegraphics[width=\linewidth]{Figs/unnamed-chunk-7-1} \end{center}


## Population variables 










Comparsion in long term time series forecasting Figure \@ref(fig:cumsum)

\begin{figure}[H]

{\centering \includegraphics[width=\linewidth]{Figs/cumsum-1} 

}

\caption{Summary of estimation of different populations variables}(\#fig:cumsum)
\end{figure}






## Relationship Stock-Recruit

\[
R = \frac{R_0 \cdot S}{S_0 (1 - h) + S (5h - 1)}
\]

Where:  
- \( R \) is the predicted recruitment.  
- \( S \) is the spawning stock biomass.  
- \( R_0 \) is the recruitment at unfished equilibrium.  
- \( S_0 \) is the spawning biomass at unfished equilibrium.  
- \( h \) is the steepness parameter (the proportion of \( R_0 \) produced when \( S = 20\% \cdot S_0 \)).

The blue line represents the Beverton–Holt stock-recruitment relationship, commonly used in fisheries models to describe the compensatory response of recruitment to changes in spawning biomass.


## Productivity and Interannual Variability by Scenario

Estimating the productivity of Antarctic krill is critical for understanding the species’ capacity to replenish its population in response to varying levels of spawning biomass. Productivity, defined as the ratio of recruitment to spawning stock biomass, provides a standardized measure of reproductive success and population resilience under different ecological and fishing pressures. Comparing productivity across scenarios—each representing different assumptions about environmental drivers, fishing mortality, or predator dynamics—enables a robust evaluation of how krill populations reflect this changes.

For each scenario \( i \) and year \( t \), we computed the productivity as the ratio between recruitment and spawning stock biomass (SSB):

$$
\text{Productivity}_{i,t} = \frac{\text{Recruitment}_{i,t}}{\text{SSB}_{i,t}}
$$

We also calculated the **interannual percentage change** in recruitment and SSB as:

$$
\text{Change in Recruitment}_{i,t} = \left( \frac{\text{Recruitment}_{i,t} - \text{Recruitment}_{i,t-1}}{\text{Recruitment}_{i,t-1}} \right) \times 100
$$

$$
\text{Change in SSB}_{i,t} = \left( \frac{\text{SSB}_{i,t} - \text{SSB}_{i,t-1}}{\text{SSB}_{i,t-1}} \right) \times 100
$$

These metrics allow us to analyze both the productivity and the temporal dynamics of the population under each scenario \( i \).






Figure \@ref(fig:biasramp) shows the bias correction by scenario in krill.


\begin{figure}[H]

{\centering \includegraphics[width=\linewidth]{Figs/biasramp-1} 

}

\caption{Bias correction by scenario}(\#fig:biasramp-1)
\end{figure}
\begin{figure}[H]

{\centering \includegraphics[width=\linewidth]{Figs/biasramp-2} 

}

\caption{Bias correction by scenario}(\#fig:biasramp-2)
\end{figure}
\begin{figure}[H]

{\centering \includegraphics[width=\linewidth]{Figs/biasramp-3} 

}

\caption{Bias correction by scenario}(\#fig:biasramp-3)
\end{figure}
\begin{figure}[H]

{\centering \includegraphics[width=\linewidth]{Figs/biasramp-4} 

}

\caption{Bias correction by scenario}(\#fig:biasramp-4)
\end{figure}
\begin{figure}[H]

{\centering \includegraphics[width=\linewidth]{Figs/biasramp-5} 

}

\caption{Bias correction by scenario}(\#fig:biasramp-5)
\end{figure}
\begin{figure}[H]

{\centering \includegraphics[width=\linewidth]{Figs/biasramp-6} 

}

\caption{Bias correction by scenario}(\#fig:biasramp-6)
\end{figure}
\begin{figure}[H]

{\centering \includegraphics[width=\linewidth]{Figs/biasramp-7} 

}

\caption{Bias correction by scenario}(\#fig:biasramp-7)
\end{figure}




## Model Perfomance

The convergence criterion used for model calibration is set to a final threshold of **0.0001** (or equivalently **1.0e-04**). This criterion defines the minimum acceptable difference between successive model iterations. Convergence is considered achieved when the absolute change in the objective function value or key parameters falls below this threshold. A smaller convergence value ensures that the model achieves a high degree of accuracy and stability in its final estimates, indicating that further iterations are unlikely to result in significant changes to the parameter estimates.





This Figure \@ref(fig:index2) shows standardized time series of input indices used in four different model scenarios (s1.1 to s1.4) for the stock assessment of Antarctic krill in Subarea 48.1.

\begin{figure}[H]

{\centering \includegraphics[width=\linewidth]{Figs/index2-1} 

}

\caption{Standardized indices of krill abundance used as input in four model scenarios (s1.1 to s1.4), representing fishery-dependent (FISHERY) and fishery-independent (SURVEY) data across five spatial strata: Bransfield Strait (BS), Elephant Island (EI), Gerlache Strait (GS), Joinville Island (JOIN), and South West (SW). Scenario s1.4 also incorporates a predator index (PREDATOR), reflecting the integration of ecosystem variables into the assessment framework}(\#fig:index2)
\end{figure}


This Figure \@ref(fig:pearson)  and Figure \@ref(fig:pearsontrend) shows the Pearson residuals and trends of predicted length distributions for krill across four modeling scenarios, each incorporating different levels of ecosystem complexity.


\begin{landscape}


\begin{figure}[H]

{\centering \includegraphics[width=\linewidth]{Figs/pearson-1} 

}

\caption{Pearson residual by scenario and fleet}(\#fig:pearson)
\end{figure}


\clearpage


\begin{figure}[H]

{\centering \includegraphics[width=\linewidth]{Figs/pearsontrend-1} 

}

\caption{Pearson residual trend by scenario and fleet}(\#fig:pearsontrend)
\end{figure}

\end{landscape}




<!-- ### Residual consistency  -->

<!-- Residual analysis is a critical component of model diagnostics in stock assessments. It helps evaluate the fit of the model to observed data and detect potential biases or inconsistencies. This process is applied to both length composition data and abundance indices such as CPUE (Catch Per Unit Effort) and survey-derived estimates. For length composition data, residuals represent the difference between observed and model-predicted length distributions. The standardized residuals are calculated as the difference between observed and expected proportions at each length bin. These residuals are plotted by year to identify systematic trends, biases, or inconsistencies in the data. Ideally, they should be randomly distributed around zero, indicating no systematic over- or underestimation.   -->

<!-- For abundance indices such as CPUE and fishery-independent surveys, residuals are analyzed to assess model fit and potential sources of bias. Residuals are computed as the difference between observed index values and those predicted by the model, typically standardized by dividing by the standard error to facilitate comparison across years. These residuals are then plotted over time to evaluate trends. A shaded confidence region, like the green area in the provided plot, represents expected variability, with outliers highlighted in red or other distinct markers. Persistent positive or negative residuals may indicate systematic bias in the model or data collection process.   -->

<!-- Statistical diagnostics are also performed to check for autocorrelation in residuals, which can indicate potential model misspecifications. When mean residual values are close to zero, the model fit is considered unbiased. By integrating these residual analyses for both length and abundance indices, stock assessment models can be refined, improving their reliability and increasing confidence in the assessment results. -->







### Residual Analysis and RMSE 

By analyzing residual patterns and RMSE values, the model can be refined to improve the accuracy of mean length predictions, ultimately enhancing the reliability of stock assessment outcomes and management recommendations (Figure \@ref(fig:rmse1)).


```
## Plotting JABBA residual plot
```

```
## 
## RMSE stats by Index:
```

```
## Plotting JABBA residual plot
```

```
## 
## RMSE stats by Index:
```

```
## Plotting JABBA residual plot
```

```
## 
## RMSE stats by Index:
```

```
## Plotting JABBA residual plot
```

```
## 
## RMSE stats by Index:
```

```
## Plotting JABBA residual plot
```

```
## 
## RMSE stats by Index:
```

```
## Plotting JABBA residual plot
```

```
## 
## RMSE stats by Index:
```

```
## Plotting JABBA residual plot
```

```
## 
## RMSE stats by Index:
```

\begin{figure}[H]

{\centering \includegraphics[width=\linewidth]{Figs/rmse1-1} 

}

\caption{Time series of RMSE of length compositions by scenario}(\#fig:rmse1)
\end{figure}
Figure \@ref(fig:rmse2) show RMSE to index.


```
## Plotting JABBA residual plot
```

```
## 
## RMSE stats by Index:
```

```
## Plotting JABBA residual plot
```

```
## 
## RMSE stats by Index:
```

```
## Plotting JABBA residual plot
```

```
## 
## RMSE stats by Index:
```

```
## Plotting JABBA residual plot
```

```
## 
## RMSE stats by Index:
```

```
## Plotting JABBA residual plot
```

```
## 
## RMSE stats by Index:
```

```
## Plotting JABBA residual plot
```

```
## 
## RMSE stats by Index:
```

```
## Plotting JABBA residual plot
```

```
## 
## RMSE stats by Index:
```

\begin{figure}[H]

{\centering \includegraphics[width=\linewidth]{Figs/rmse2-1} 

}

\caption{Time series of RMSE of CPUE compositions by scenario}(\#fig:rmse2)
\end{figure}

Table \@ref(tab:combined_rmse) of RMSE values for each scenario and type (index and length) is created below. The RMSE values are extracted from the respective data frames for each scenario.


\begin{table}[H]
\centering\begingroup\fontsize{9}{11}\selectfont

\resizebox{\ifdim\width>\linewidth\linewidth\else\width\fi}{!}{
\begin{tabular}[t]{lrr}
\toprule
Scenario & RMSE\_index & RMSE\_length\\
\midrule
s1.1 & 69.1 & 13.7\\
s1.2 & 60.8 & 12.3\\
s1.3 & 68.9 & 13.6\\
s1.4 & 67.8 & 13.0\\
s1.5 & 68.3 & 13.2\\
\addlinespace
s1.6 & 67.8 & 13.9\\
s1.7 & 67.6 & 13.0\\
\bottomrule
\end{tabular}}
\endgroup{}
\end{table}

The RMSE values for each scenario and type (index and length) are summarized in the table above. 







### Retrospective Analysis in Model Evaluation




Code to run all retrospective analysis for all scenarios in a loop:


``` r
directorios <- c("s1.1", "s1.2", "s1.3", "s1.4", "s1.5",
    "s1.6", "s1.7")
for (dir in directorios) {
    retro(dir = dir, oldsubdir = "", newsubdir = "Retrospective",
        years = 0:-5, exe = "ss_osx", extras = "-nox",
        skipfinished = FALSE)
}
```



Using `retro()` and `SSplotRetro()` functions, we obtain main results of retrospective analysis for spawning biomass (SSB) and recruitment (R0) for each scenario. The retrospective analysis is a diagnostic tool used to evaluate the consistency of model estimates over time by sequentially removing recent years of data and refitting the model. This helps identify potential biases or inconsistencies in the model's predictions. Retrospective analysis for spawning biomass (Figure \@ref(fig:retrossb))

\begin{figure}[H]

{\centering \includegraphics[width=\linewidth]{Figs/retrossb-1} 

}

\caption{Retrospective analysis for spawning biomass by scenario in krill}(\#fig:retrossb)
\end{figure}

Retrospective analysis for fishing mortality (Figure \@ref(fig:retrof))

\begin{figure}[H]

{\centering \includegraphics[width=\linewidth]{Figs/retrof-1} 

}

\caption{Retrospective analysis for fishing mortality by scenario in krill}(\#fig:retrof)
\end{figure}


Mohn's rho and one-step-ahead forecast bias, summarized across retrospective peels for SSB and F, are in  Table \@ref(tab:hcbiastable).

\begin{figure}[H]

{\centering \includegraphics[width=\linewidth]{Figs/hcbias-1} 

}

\caption{Mohn's rho by scenario for spawning biomass (SSB) and fishing mortality (F). Bars show the mean Mohn's rho across retrospective peels; points show individual peel values; labels give the combined rho value per scenario.}(\#fig:hcbias)
\end{figure}

\begin{table}[H]
\centering
\caption{(\#tab:hcbiastable)Mohn's rho and mean one-step-ahead forecast bias by scenario and quantity}
\centering
\resizebox{\ifdim\width>\linewidth\linewidth\else\width\fi}{!}{
\fontsize{9}{11}\selectfont
\begin{tabular}[t]{llrr}
\toprule
Scenario & type & MohnsRho & ForecastRho\\
\midrule
s1.1 & SSB & -0.095 & -0.116\\
s1.1 & F & -0.560 & 0.198\\
s1.2 & SSB & -0.016 & -0.111\\
s1.2 & F & 0.347 & 1.091\\
s1.3 & SSB & -0.092 & -0.111\\
\addlinespace
s1.3 & F & -0.690 & -0.214\\
s1.4 & SSB & -0.293 & -0.434\\
s1.4 & F & -0.433 & -0.139\\
s1.5 & SSB & -0.195 & -0.246\\
s1.5 & F & -0.343 & 0.459\\
\addlinespace
s1.6 & SSB & 0.050 & 0.027\\
s1.6 & F & 0.332 & 0.842\\
s1.7 & SSB & -0.304 & -0.449\\
s1.7 & F & 1.093 & 2.484\\
\bottomrule
\end{tabular}}
\end{table}






### Hindcast Cross-Validation and Prediction Skill

The Hindcast Cross-Validation (HCxval) diagnostic in Stock Synthesis is implemented using the model outputs generated by the `r4ss::SS_doRetro()` and using `SSplotHCval()` function. This diagnostic evaluates the predictive performance of the model by comparing hindcast predictions with observed data. To assess prediction skill, we employ the Mean Absolute Scaled Error (MASE) as a robust metric. MASE is calculated by scaling the mean absolute error of the model predictions relative to the mean absolute error of a naïve baseline prediction. Specifically, the MASE score is computed as follows:


Hindcast validation in `s1.1` (Figure \@ref(fig:hcval1)), `s1.2` (Figure \@ref(fig:hcval2)), `s1.3` (Figure \@ref(fig:hcval3)) and  `s1.4` (Figure \@ref(fig:hcval4)).

\begin{figure}[H]

{\centering \includegraphics[width=\linewidth]{Figs/hcval1-1} 

}

\caption{Hindcast validation for s1.1 by fleet}(\#fig:hcval1)
\end{figure}



\begin{figure}[H]

{\centering \includegraphics[width=\linewidth]{Figs/hcval2-1} 

}

\caption{Hindcast validation for s1.2 by fleet}(\#fig:hcval2)
\end{figure}




\begin{figure}[H]

{\centering \includegraphics[width=\linewidth]{Figs/hcval3-1} 

}

\caption{Hindcast validation for s1.3 by fleet}(\#fig:hcval3)
\end{figure}



\begin{figure}[H]

{\centering \includegraphics[width=\linewidth]{Figs/hcval4-1} 

}

\caption{Hindcast validation for s1.4 by fleet}(\#fig:hcval4)
\end{figure}



\begin{figure}[H]

{\centering \includegraphics[width=\linewidth]{Figs/hcval5-1} 

}

\caption{Hindcast validation for s1.5 by fleet}(\#fig:hcval5)
\end{figure}


\begin{figure}[H]

{\centering \includegraphics[width=\linewidth]{Figs/hcval6-1} 

}

\caption{Hindcast validation for s1.6 by fleet}(\#fig:hcval6)
\end{figure}


\begin{figure}[H]

{\centering \includegraphics[width=\linewidth]{Figs/hcval7-1} 

}

\caption{Hindcast validation for s1.7 by fleet}(\#fig:hcval7)
\end{figure}


\begin{center}\includegraphics[width=\linewidth]{Figs/unnamed-chunk-19-1} \end{center}

A summary version of the same diagnostic, averaged across indices, is shown in Figure \@ref(fig:masesummary).

\begin{figure}[H]

{\centering \includegraphics[width=\linewidth]{Figs/masesummary-1} 

}

\caption{Mean MASE by scenario, averaged across indices with n.eval > 2. The dashed line marks MASE = 1 (naive forecast threshold). FISHERYGS is excluded due to its extreme skill values relative to all other indices (see Figure \@ref(fig:mase) for the full breakdown).}(\#fig:masesummary)
\end{figure}





Failure counts by scenario and index can be tallied directly for the Results text with `table(runs_grid$Scenario, runs_grid$test, runs_grid$Type)`, once the diagnostic table above is reviewed.




### Likelihood tables

Figure \@ref(fig:likecompo2) show the likelihood components for the four models. The total likelihood is the sum of the individual components, and the lower the value, the better the fit. The base model (s1.1) has a total likelihood of 2050, while the other models have higher total likelihoods, indicating worse fits to the data.


\begin{figure}[H]

{\centering \includegraphics[width=\linewidth]{Figs/likecompo2-1} 

}

\caption{total likelihood composition by scenario}(\#fig:likecompo2)
\end{figure}








As shown in Table \@ref(tab:parametercomparison), the models differ in key parameter estimates and likelihood contributions.

\begin{table}[H]
\centering
\caption{(\#tab:parametercomparison)Model parameter and likelihood comparison}
\centering
\resizebox{\ifdim\width>\linewidth\linewidth\else\width\fi}{!}{
\fontsize{8}{10}\selectfont
\begin{tabular}[t]{llllllll}
\toprule
Label & s1.1 & s1.2 & s1.3 & s1.4 & s1.5 & s1.6 & s1.7\\
\midrule
TOTAL\_like & 221.6530 & 209.4000 & 221.3090 & 565.43100 & 265.235 & 208.9150 & 564.81100\\
Survey\_like & 82.0641 & 17.8335 & 81.8127 & 82.08210 & 112.116 & 66.2866 & 77.39640\\
Length\_comp\_like & 124.3580 & 177.6570 & 124.4400 & 465.04800 & 127.811 & 124.0250 & 468.23800\\
Parm\_priors\_like & 3.8220 & 2.7483 & 3.8460 & 3.27001 & 3.819 & 7.7911 & 3.79170\\
Recr\_Virgin\_billions & 25133.0000 & 31012.4000 & 24834.8000 & 44761.50000 & 24307.300 & 17484.4000 & 44137.40000\\
\addlinespace
SR\_LN(R0) & 23.9474 & 24.1577 & 23.9355 & 24.52460 & 23.914 & 23.5846 & 24.51060\\
SSB\_Virgin & 2637080.0000 & 1495540.0000 & 2604340.0000 & 3282530.00000 & 2551500.000 & 1991450.0000 & 3156110.00000\\
Bratio\_2020 & 1.0412 & 1.2645 & 1.0545 & 0.67514 & 1.222 & 1.0906 & 0.67749\\
SPRratio\_2020 & 0.1457 & 0.1661 & 0.1452 & 0.07431 & 0.163 & 0.2061 & 0.07841\\
\bottomrule
\end{tabular}}
\end{table}



### Test distribution on parameters

The Figure \@ref(fig:desvpar) shows the distribution of estimated parameters (phase > 0) by scenario. The parameters were selected based on a direct review of the `control.ss` files for each scenario, rather than relying on SD > 0, which can fail due to a non-invertible Hessian and may be confused with "fixed" parameters.

\begin{figure}[H]

{\centering \includegraphics[width=\linewidth]{Figs/desvpar-1} 

}

\caption{Distribution of estimated parameters (phase > 0) by scenario. Parameters were selected based on a direct review of the control.ss files for each scenario, rather than relying on SD > 0, which can fail due to a non-invertible Hessian and may be confused with 'fixed' parameters.}(\#fig:desvpar)
\end{figure}


\newpage 

# References
