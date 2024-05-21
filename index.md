---
title: "Implicit spatial model to krill Dynamic Population in Antarctic Peninsula, 48-1 SubArea. SS3 aplications"
subtitle: "Working Paper to be submitted in a CCAMLR EMM-WG 2024"
author: "Mardones, M; Cárdenas, C., Krüger, L., Santa Cruz, F."
date:  "21 May, 2024"
bibliography: SA_krill.bib
csl: apa.csl
link-citations: yes
linkcolor: blue
output:
  html_document:
    keep_md: true
    toc: true
    toc_deep: 3
    toc_float:
      collapsed: false
      smooth_scroll: false
    theme: cosmo
    fontsize: 0.9em
    linestretch: 1.7
    html-math-method: katex
    self-contained: true
    code-tools: true
editor_options: 
  markdown: 
    wrap: 72
---




# OVERVIEW

## Conceptual Model 

The process of modeling and statistical analysis of a database can be structured according to the following guidelines:

- Contextualization of the problem. Definition of objectives and variables.
- Experiment design and data collection.
- Recording and preliminary processing of available information.
- Graphical inspection and trend identification.
- Consideration of distributional and relational hypotheses. Proposal of modeling.
- Model adjustment. Comparison and selection of the best model.
- Diagnosis and validation of the adjusted model.
- Assessment of the predictive capacity of the model and prediction.
- Interpretation and conclusions.

## Population Dynamics Model

In a simple way, the core of Stock Synthesis is its population dynamics model, which represents the dynamics of krill populations over time. This model incorporates key biological parameters such as growth rates, mortality rates, recruitment, and spawning biomass. The model is typically formulated using mathematical equations that describe how these parameters interact to determine the abundance and distribution of krill in the study area.

A typical state-space model for krill population dynamics can be represented as:

\[
N_t = N_{t-1} \cdot e^{(r - M)} + R
\]

Where:
- \(N_t\) is the abundance of krill at time \(t\).
- \(N_{t-1}\) is the abundance of krill at the previous time step.
- \(r\) is the intrinsic growth rate of the population.
- \(M\) is the mortality rate.
- \(R\) is the recruitment of new individuals into the population.

This equation represents the basic dynamics of the krill population, with abundance changing over time due to growth, mortality, and recruitment.

## Statistical model (SS3)

Stock Synthesis v.3.30.21 is a widely used software tool for assessing fish and invertebrate populations, including krill (Euphausia superba) in the Antarctic Peninsula region. The methodology employed by Stock Synthesis involves a comprehensive and integrated approach, utilizing various data sources and modeling techniques to estimate the main population variables of krill in WAP. 

The stock assesment model was configured using Stock Synthesis (SS3 hereafter)[SS3](https://vlab.noaa.gov/web/stock-synthesis) [@Methot2013; @methot2020stock] with the most updated version (V.3.30.21). SS3 is a structured age and size stock evaluation model, in the class of models called *"Integrated stock evaluation analysis model"*. SS3 has a stock population sub-model that simulates growth, maturity, fecundity, recruitment, movement, and mortality processes, and observation sub-models and expected values for different types of data. The model is coded in `C++` with estimation parameters enabled by automatic differentiation (ADMB) [@Fournier2012; @Methot2013]. The analysis of results and outputs uses R tools and the graphical interface of the *r4ss* library [@Taylor2019; @Winker2023].

By integrating data from multiple sources and considering spatial heterogeneity, the assessment methodology using Stock Synthesis v.3.30.21 provides a robust framework for evaluating the status of krill populations in the Antarctic Peninsula region. This information is essential for supporting management decisions aimed at ensuring the sustainable use of krill resources in this ecologically sensitive area.


## Scenarios

In Table 1 we have ten scenarios to test different option in modeling about main consideration in assessment of krill population.

| Scenario | Description                                      |
|:---------:|:-------------------------------------------------|
|    s01     | Fishery, Predator, Survey, Environmental data agreggate (Whole 48.1) |
|    s1     | Fishery data (Length, Index, Catch) by strata  and Predator and Env data      |
|    s2    | Fishery and Survey (AMLR) data Length, Index, Catch by strata and Predator and Env data |
|    s3     | Same "s2" Without S-R relation         |
|    s4     | Same "s2" Ricker S-R relation estimated          |
|    s5     | Same "s2" BH S-R relation weak (0.9 steepness)     |
|    s6     | Same "s2" BH S-R relation strong (0.6 steepness)     |
|    s7     | Same "s2" BH S-R relation mid-strong (0.65 steepness) estimated     |






```
## [1] 16
```

















Respecto a los valores y parametros biologicos modelados, los siguientes graficos identifican los estimadores puntuales del recurso






aporte de las cohortes por año para las capturas.


\quad

AJuste de tallas por flota


Otros plots





Salida de las biomasas con las dos flotas


Salida de las biomasas con todas las flotas



# RESULTS

## Diagnosis Base Model 

Step to do a good practice in model diagnosis is;

- 1. Convergence. Final convergence criteria is 1.0e-04

- 2. Residual (visual and metrics)

- 3. Retrospective analysis (Mhon Parameter)

- 4. Likelihood profile



## Residual








## Predator fleet with RW

Random Walk (RW) refers to a mathematical model that describes a stochastic process in which a variable changes randomly over time, without a clear trend or pattern.

Specifically, a random walk can be used as a Bayesian estimation technique to infer the posterior distribution of an unknown parameter. In this approach, it is assumed that the prior distribution of the parameter is a normal distribution with mean zero and a known variance, and that the parameter value at each time step follows a random walk process. Based on the observed data and the prior distribution, the posterior distribution of the parameter can be calculated using Bayesian inference.

Random walk is a useful tool for parameter estimation in dynamic models, as it allows for modeling uncertainty and variability in the parameter's evolution over time. However, it is important to note that the random walk assumes that the changes in the parameter are random and without a clear trend, which may not be appropriate in all cases.

## Retrospective analysis

Los análisis retrospectivo, dan cuenta de diferencias de estimación (sub - sobreestimación) en los patrones entre modelos evaluados. 













## Hindcast Cross-Validation and prediction skill

Implementing the Hindcast Cross-Validation (HCxval) diagnostic in Stock Synthesis requires the same model outputs generated by `r4ss:SS_doRetro()`. As a robust measure of prediction skill, we implemented the mean absolute scaled error (MASE). In brief, the MASE score scales the mean absolute. Regarding (A MASE score > 1 indicates that the average model forecasts are worse than a random walk. Conversely, a MASE score of 0.5 indicates that the model forecasts twice as
accurately as a naïve baseline prediction; thus, the model has prediction skill.




## Kobe (status)








## Verosimilitud




## Comparision outputs betwwen scenarios






\newpage
# DISCUSION

\newpage
# CONCLUSION

\newpage
# REFERENCES
