---
title: "Supplementary Information 1"
subtitle: "Assessing ecosystem effects on the stock productivity of Antarctic Krill (*Euphausia superba*): An Integrated modeling perspective"
author: "Mardones, M; Jarvis Mason, E.T.; Pinones, A.;  Santa Cruz, F.; Cárdenas, C.A"
date:  "01 April, 2025"
bibliography: SA_krill.bib
#csl: apa.csl
csl: icesjournal.csl
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





```
## [1] 16
```


``` r
# dir01 <- here('s01') # agreggate data (no
# spatial diferences) dir1<-here('s1') # Data
# strata flishery dir2<-here('s2') # Same 9 with
# areas (SubStrata) as fleet. Dif size
# comoposition and dif CPUE and dif survey length
# and biomass data by strata dir3<-here('s3') #
# without S-R dir4<-here('s4') # dir5<-here('s5')
# # dir6<-here('s6') # dir7<-here('s7') # 2 set
# parametres EMM-2024/23 (Mardones)
# dir8<-here('s8') # s1 platoons dir9<-here('s9')
# # s1 w/ blocks
dir1.1 <- here("s1.1")  # sin predador ni ambiental
dir1.2 <- here("s1.2")  # s1.1 C/ predador
dir1.3 <- here("s1.3")  # s1.1 solo env
dir1.4 <- here("s1.4")  # s1.2 predator and env
Figs <- here("Figs")  # S
```


# OVERVIEW

This study aims to evaluate the impact of ecosystem components—such as environmental variables and predator-prey interactions—on the productivity and key population dynamics of *Euphausia superba* in Subarea 48.1. By incorporating these factors into the assessment, we analyze how krill population variables respond to ecological variability, providing insights into their resilience and potential management implications.  

Here, the **reference model** represents a baseline assessment of *Euphausia superba* population dynamics in Subarea 48.1, excluding environmental and ecological variables. This model assumes that krill productivity and population parameters are driven  by intrinsic biological processes, such as growth, mortality, and recruitment and fishery impacts without accounting for external influences like environmental variability or predation pressure. By serving as a *control scenario*, this model provides a benchmark against which the impact of ecosystem components in productivity can be evaluated, allowing for a direct comparison of how environmental and ecological factors influence krill stock dynamics.  


## Statistical Model (SS3)

Stock Synthesis (v.3.30.21)  is a widely used tool for assessing fish and invertebrate populations, including Antarctic krill. SS3 is implemented in `C++` with estimation enabled through automatic differentiation (ADMB) [@Fournier2012; @Methot2013]. In this exercise, SS3 is configured as an integrated stock assessment model, explicitly accounting for age and size structure while incorporating key ecosystem drivers. The model simulates population processes such as growth, maturity, fecundity, recruitment, movement, and mortality, while also integrating environmental variability and predator-prey relationships to refine estimates of population trends. The analysis of model outputs is conducted using R, utilizing the *r4ss* and *ss3diags* packages [@Taylor2019; @Winker2023]. By leveraging a spatially implicit, ecosystem-informed approach, this assessment provides a robust framework for evaluating krill stock dynamics under changing environmental conditions. These insights are crucial for informing sustainable management strategies in the Antarctic Peninsula region, where krill plays a foundational role in the marine food web.  

## Parameters

The following table summarizes the key parameters to conditioning the reference model, including biological, growth, and population dynamics factors.






<table class=" lightable-paper lightable-hover table" style='color: black; font-family: "Arial Narrow", arial, helvetica, sans-serif; margin-left: auto; margin-right: auto; font-size: 12px; color: black; font-family: Times New Roman; margin-left: auto; margin-right: auto;'>
<caption style="font-size: initial !important;">Input parameters for the initial SS3 model of krill. Each parameter line contains a minimum value (LO), maximum value (HI), and initial value (INIT). If the phase (PHASE) for the parameter is negative, the parameter is fixed as input</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:right;"> LO </th>
   <th style="text-align:right;"> HI </th>
   <th style="text-align:right;"> INIT </th>
   <th style="text-align:right;"> PHASE </th>
  </tr>
 </thead>
<tbody>
  <tr grouplength="1"><td colspan="5" style="border-bottom: 1px solid;"><strong>Natural Mortality</strong></td></tr>
<tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Nat M </td>
   <td style="text-align:right;"> 0.20 </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 0.270 </td>
   <td style="text-align:right;"> -3 </td>
  </tr>
  <tr grouplength="5"><td colspan="5" style="border-bottom: 1px solid;"><strong>Growth</strong></td></tr>
<tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Lmin </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 5.00 </td>
   <td style="text-align:right;"> 3.400 </td>
   <td style="text-align:right;"> -2 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Lmax </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 10.00 </td>
   <td style="text-align:right;"> 5.000 </td>
   <td style="text-align:right;"> -4 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> VonBert K </td>
   <td style="text-align:right;"> 0.05 </td>
   <td style="text-align:right;"> 0.80 </td>
   <td style="text-align:right;"> 0.470 </td>
   <td style="text-align:right;"> -4 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> CV young </td>
   <td style="text-align:right;"> 0.05 </td>
   <td style="text-align:right;"> 0.25 </td>
   <td style="text-align:right;"> 0.140 </td>
   <td style="text-align:right;"> -4 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> CV old </td>
   <td style="text-align:right;"> 0.05 </td>
   <td style="text-align:right;"> 0.25 </td>
   <td style="text-align:right;"> 0.070 </td>
   <td style="text-align:right;"> -4 </td>
  </tr>
  <tr grouplength="2"><td colspan="5" style="border-bottom: 1px solid;"><strong>relationship Length-Weigth</strong></td></tr>
<tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Wt a </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 3.00 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> -3 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Wt b </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 4.00 </td>
   <td style="text-align:right;"> 3.347 </td>
   <td style="text-align:right;"> -3 </td>
  </tr>
  <tr grouplength="2"><td colspan="5" style="border-bottom: 1px solid;"><strong>Maturity</strong></td></tr>
<tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> L50% </td>
   <td style="text-align:right;"> 0.20 </td>
   <td style="text-align:right;"> 5.00 </td>
   <td style="text-align:right;"> 1.800 </td>
   <td style="text-align:right;"> -4 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Mat slope </td>
   <td style="text-align:right;"> -3.00 </td>
   <td style="text-align:right;"> 3.00 </td>
   <td style="text-align:right;"> -2.900 </td>
   <td style="text-align:right;"> -4 </td>
  </tr>
  <tr grouplength="5"><td colspan="5" style="border-bottom: 1px solid;"><strong>S-R relation</strong></td></tr>
<tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> SR_LN(R0) </td>
   <td style="text-align:right;"> 3.00 </td>
   <td style="text-align:right;"> 30.00 </td>
   <td style="text-align:right;"> 23.000 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> SR_BH_steep </td>
   <td style="text-align:right;"> 0.20 </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 0.850 </td>
   <td style="text-align:right;"> -4 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> SR_sigmaR </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 2.00 </td>
   <td style="text-align:right;"> 1.200 </td>
   <td style="text-align:right;"> -4 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> SR_regime </td>
   <td style="text-align:right;"> -5.00 </td>
   <td style="text-align:right;"> 5.00 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> -4 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> SR_autocorr </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> -99 </td>
  </tr>
  <tr grouplength="2"><td colspan="5" style="border-bottom: 1px solid;"><strong>Catchability</strong></td></tr>
<tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> LnQ_base_FISHERYBS(1) </td>
   <td style="text-align:right;"> -25.00 </td>
   <td style="text-align:right;"> 25.00 </td>
   <td style="text-align:right;"> -5.722 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> LnQ_base_FISHERYEI(2) </td>
   <td style="text-align:right;"> -25.00 </td>
   <td style="text-align:right;"> 25.00 </td>
   <td style="text-align:right;"> -5.722 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr grouplength="4"><td colspan="5" style="border-bottom: 1px solid;"><strong>Selectivity</strong></td></tr>
<tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> SizeSel_P_1_FISHERYBS(1) </td>
   <td style="text-align:right;"> 0.01 </td>
   <td style="text-align:right;"> 8.00 </td>
   <td style="text-align:right;"> 2.000 </td>
   <td style="text-align:right;"> -3 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> SizeSel_P_2_FISHERYBS(1) </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 8.00 </td>
   <td style="text-align:right;"> 2.000 </td>
   <td style="text-align:right;"> -2 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> SizeSel_P_1_FISHERYEI(2) </td>
   <td style="text-align:right;"> 0.01 </td>
   <td style="text-align:right;"> 8.00 </td>
   <td style="text-align:right;"> 3.500 </td>
   <td style="text-align:right;"> -3 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> SizeSel_P_2_FISHERYEI(2) </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 8.00 </td>
   <td style="text-align:right;"> 4.000 </td>
   <td style="text-align:right;"> -2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SizeSel_P_1_FISHERYGS(3) </td>
   <td style="text-align:right;"> 0.01 </td>
   <td style="text-align:right;"> 8.00 </td>
   <td style="text-align:right;"> 2.000 </td>
   <td style="text-align:right;"> -3 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SizeSel_P_2_FISHERYGS(3) </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 8.00 </td>
   <td style="text-align:right;"> 2.000 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SizeSel_P_1_FISHERYJOIN(4) </td>
   <td style="text-align:right;"> 0.01 </td>
   <td style="text-align:right;"> 8.00 </td>
   <td style="text-align:right;"> 3.500 </td>
   <td style="text-align:right;"> -3 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SizeSel_P_2_FISHERYJOIN(4) </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 8.00 </td>
   <td style="text-align:right;"> 2.000 </td>
   <td style="text-align:right;"> -2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SizeSel_P_1_FISHERYSSIW(5) </td>
   <td style="text-align:right;"> 0.01 </td>
   <td style="text-align:right;"> 8.00 </td>
   <td style="text-align:right;"> 3.500 </td>
   <td style="text-align:right;"> -3 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SizeSel_P_2_FISHERYSSIW(5) </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 8.00 </td>
   <td style="text-align:right;"> 2.000 </td>
   <td style="text-align:right;"> -2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SizeSel_P_1_SURVEYBS(6) </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 7.00 </td>
   <td style="text-align:right;"> 2.000 </td>
   <td style="text-align:right;"> -2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SizeSel_P_2_SURVEYBS(6) </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 7.00 </td>
   <td style="text-align:right;"> 1.000 </td>
   <td style="text-align:right;"> -3 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SizeSel_P_1_SURVEYEI(7) </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 7.00 </td>
   <td style="text-align:right;"> 3.000 </td>
   <td style="text-align:right;"> -2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SizeSel_P_2_SURVEYEI(7) </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 7.00 </td>
   <td style="text-align:right;"> 1.000 </td>
   <td style="text-align:right;"> -3 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SizeSel_P_1_SURVEYGS(8) </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 7.00 </td>
   <td style="text-align:right;"> 2.000 </td>
   <td style="text-align:right;"> -2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SizeSel_P_2_SURVEYGS(8) </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 7.00 </td>
   <td style="text-align:right;"> 1.000 </td>
   <td style="text-align:right;"> -3 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SizeSel_P_1_SURVEYJOIN(9) </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 7.00 </td>
   <td style="text-align:right;"> 3.000 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SizeSel_P_2_SURVEYJOIN(9) </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 7.00 </td>
   <td style="text-align:right;"> 1.000 </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SizeSel_P_1_SURVEYSSIW(10) </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 7.00 </td>
   <td style="text-align:right;"> 2.000 </td>
   <td style="text-align:right;"> -2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SizeSel_P_2_SURVEYSSIW(10) </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 7.00 </td>
   <td style="text-align:right;"> 1.000 </td>
   <td style="text-align:right;"> -3 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SizeSel_P_1_PREDATOR(11) </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 3.00 </td>
   <td style="text-align:right;"> 0.200 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SizeSel_P_2_PREDATOR(11) </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 3.00 </td>
   <td style="text-align:right;"> 0.200 </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
</tbody>
</table>
Source of data inpit

<img src="Figs/unnamed-chunk-6-1.jpeg" style="display: block; margin: auto;" />


<img src="Figs/unnamed-chunk-7-1.jpeg" style="display: block; margin: auto;" />

## Scenarios

In Table 1 we have ten scenarios to test different option in modeling
about main consideration in assessment of krill population.

| Scenario | Description                                                                          |
|:------------:|:---------------------------------------------------------|
|    s1.1  | Spatial data without environmental and predator components                           |
|    s1.2  | "s1.1" with predator components                                                      |
|    s1.3  | "s1.1" with environmental variable                                                  |
|    s1.4  | "s1.1" w/ both, predator fleet and environmental variable                           |



### Run Models










Data used en both (spatial and No spatial models) `s1.1`

<img src="Figs/unnamed-chunk-11-1.jpeg" style="display: block; margin: auto;" />

and `s1.4`

<img src="Figs/unnamed-chunk-12-1.jpeg" style="display: block; margin: auto;" />

# RESULTS





Main Variables poulation in `s1.1` scenario

<img src="Figs/unnamed-chunk-14-1.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-14-2.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-14-3.jpeg" style="display: block; margin: auto;" />

Main Variables poulation in `s1.2` scenario

<img src="Figs/unnamed-chunk-15-1.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-15-2.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-15-3.jpeg" style="display: block; margin: auto;" />

Main Variables poulation in `s1.3` scenario

<img src="Figs/unnamed-chunk-16-1.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-16-2.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-16-3.jpeg" style="display: block; margin: auto;" />


Main Variables poulation in `s1.4` scenario

<img src="Figs/unnamed-chunk-17-1.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-17-2.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-17-3.jpeg" style="display: block; margin: auto;" />
Selectivity

<img src="Figs/unnamed-chunk-18-1.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-18-2.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-18-3.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-18-4.jpeg" style="display: block; margin: auto;" />



<img src="Figs/unnamed-chunk-19-1.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-19-2.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-19-3.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-19-4.jpeg" style="display: block; margin: auto;" />

<img src="Figs/unnamed-chunk-20-1.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-20-2.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-20-3.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-20-4.jpeg" style="display: block; margin: auto;" />



Total biomass

<img src="Figs/unnamed-chunk-21-1.jpeg" style="display: block; margin: auto;" />

Heatmap

<img src="Figs/unnamed-chunk-22-1.jpeg" style="display: block; margin: auto;" />
hexagon




## Diagnosis Base Model

A rigorous model diagnosis is essential to ensure the reliability and robustness of stock assessment models. The key steps for a good practice in model diagnosis include:  

1. Convergence Check: The model must reach a final convergence criterion of 1.0e-04 to ensure numerical stability and reliable parameter estimation.  

2. Residual Analysis: Both visual inspection and statistical metrics are used to evaluate model residuals, helping to detect patterns of bias or misfit.  

3. Retrospective Analysis: The Mohn’s rho parameter is used to assess the consistency of model estimates when sequentially removing recent years of data, identifying potential overestimation or underestimation trends.  

4. Likelihood Profile Analysis: This approach examines how the likelihood function behaves across a range of parameter values, providing insight into parameter uncertainty and model sensitivity.  

This framework follows the recommendations outlined by @Carvalho2021b, aiming to enhance transparency and reproducibility in model evaluation.

### Residual consistency 


Residual analysis is a critical component of model diagnostics in stock assessments. It helps evaluate the fit of the model to observed data and detect potential biases or inconsistencies. This process is applied to both length composition data and abundance indices such as CPUE (Catch Per Unit Effort) and survey-derived estimates.  

For length composition data, residuals represent the difference between observed and model-predicted length distributions. The standardized residuals are calculated as the difference between observed and expected proportions at each length bin. These residuals are plotted by year to identify systematic trends, biases, or inconsistencies in the data. Ideally, they should be randomly distributed around zero, indicating no systematic over- or underestimation.  

For abundance indices such as CPUE and fishery-independent surveys, residuals are analyzed to assess model fit and potential sources of bias. Residuals are computed as the difference between observed index values and those predicted by the model, typically standardized by dividing by the standard error to facilitate comparison across years. These residuals are then plotted over time to evaluate trends. A shaded confidence region, like the green area in the provided plot, represents expected variability, with outliers highlighted in red or other distinct markers. Persistent positive or negative residuals may indicate systematic bias in the model or data collection process.  

Statistical diagnostics are also performed to check for autocorrelation in residuals, which can indicate potential model misspecifications. When mean residual values are close to zero, the model fit is considered unbiased.  

By integrating these residual analyses for both length and abundance indices, stock assessment models can be refined, improving their reliability and increasing confidence in the assessment results.


```
## 
##  Running Runs Test Diagnosics for Mean length 
## Plotting Residual Runs Tests
```

<img src="Figs/unnamed-chunk-24-1.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-24-2.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-24-3.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-24-4.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-24-5.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-24-6.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-24-7.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-24-8.jpeg" style="display: block; margin: auto;" />

```
## 
## Runs Test stats by Mean length:
```

```
##         Index runs.p     test  sigma3.lo sigma3.hi type
## 1   FISHERYBS  0.218   Passed -0.1189633 0.1189633  len
## 2   FISHERYEI  0.013   Failed -0.2839347 0.2839347  len
## 3   FISHERYGS  0.912   Passed -0.1865475 0.1865475  len
## 4 FISHERYJOIN     NA Excluded         NA        NA  len
## 5 FISHERYSSIW  0.230   Passed -0.1176572 0.1176572  len
## 6    SURVEYBS  0.221   Passed -0.2220680 0.2220680  len
## 7    SURVEYEI  0.595   Passed -0.2119927 0.2119927  len
## 8    SURVEYGS  0.454   Passed -0.2928749 0.2928749  len
## 9  SURVEYJOIN  0.541   Passed -0.4156365 0.4156365  len
```

```
## 
##  Running Runs Test Diagnosics for Mean length 
## Plotting Residual Runs Tests
```

<img src="Figs/unnamed-chunk-24-9.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-24-10.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-24-11.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-24-12.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-24-13.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-24-14.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-24-15.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-24-16.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-24-17.jpeg" style="display: block; margin: auto;" />

```
## 
## Runs Test stats by Mean length:
```

```
##          Index runs.p     test   sigma3.lo  sigma3.hi type
## 1    FISHERYBS  0.150   Passed -0.04986852 0.04986852  len
## 2    FISHERYEI  0.013   Failed -0.30357206 0.30357206  len
## 3    FISHERYGS  0.346   Passed -0.38742103 0.38742103  len
## 4  FISHERYJOIN     NA Excluded          NA         NA  len
## 5  FISHERYSSIW  0.230   Passed -0.14854188 0.14854188  len
## 6     SURVEYBS  0.001   Failed -0.29126384 0.29126384  len
## 7     SURVEYEI  0.627   Passed -0.22413735 0.22413735  len
## 8     SURVEYGS  0.409   Passed -0.35196215 0.35196215  len
## 9   SURVEYJOIN  0.500   Passed -0.44688062 0.44688062  len
## 10    PREDATOR  0.607   Passed -0.18346375 0.18346375  len
```

```
## 
##  Running Runs Test Diagnosics for Mean length 
## Plotting Residual Runs Tests
```

<img src="Figs/unnamed-chunk-24-18.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-24-19.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-24-20.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-24-21.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-24-22.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-24-23.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-24-24.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-24-25.jpeg" style="display: block; margin: auto;" />

```
## 
## Runs Test stats by Mean length:
```

```
##         Index runs.p     test   sigma3.lo  sigma3.hi type
## 1   FISHERYBS  0.744   Passed -0.08525923 0.08525923  len
## 2   FISHERYEI  0.013   Failed -0.27984372 0.27984372  len
## 3   FISHERYGS  0.179   Passed -0.20160902 0.20160902  len
## 4 FISHERYJOIN     NA Excluded          NA         NA  len
## 5 FISHERYSSIW  0.230   Passed -0.12113187 0.12113187  len
## 6    SURVEYBS  0.631   Passed -0.22746036 0.22746036  len
## 7    SURVEYEI  0.786   Passed -0.18187931 0.18187931  len
## 8    SURVEYGS  0.136   Passed -0.29411566 0.29411566  len
## 9  SURVEYJOIN  0.500   Passed -0.41808588 0.41808588  len
```

```
## 
##  Running Runs Test Diagnosics for Mean length 
## Plotting Residual Runs Tests
```

<img src="Figs/unnamed-chunk-24-26.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-24-27.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-24-28.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-24-29.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-24-30.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-24-31.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-24-32.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-24-33.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-24-34.jpeg" style="display: block; margin: auto;" />

```
## 
## Runs Test stats by Mean length:
```

```
##          Index runs.p     test   sigma3.lo  sigma3.hi type
## 1    FISHERYBS  0.500   Passed -0.04709602 0.04709602  len
## 2    FISHERYEI  0.013   Failed -0.27986404 0.27986404  len
## 3    FISHERYGS  0.013   Failed -0.26812009 0.26812009  len
## 4  FISHERYJOIN     NA Excluded          NA         NA  len
## 5  FISHERYSSIW  0.064   Passed -0.11843515 0.11843515  len
## 6     SURVEYBS  0.001   Failed -0.29845897 0.29845897  len
## 7     SURVEYEI  0.627   Passed -0.22182714 0.22182714  len
## 8     SURVEYGS  0.198   Passed -0.36195876 0.36195876  len
## 9   SURVEYJOIN  0.500   Passed -0.44265910 0.44265910  len
## 10    PREDATOR  0.607   Passed -0.26298700 0.26298700  len
```



```
## 
##  Running Runs Test Diagnosics for Index 
## Plotting Residual Runs Tests
```

<img src="Figs/unnamed-chunk-25-1.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-25-2.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-25-3.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-25-4.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-25-5.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-25-6.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-25-7.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-25-8.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-25-9.jpeg" style="display: block; margin: auto;" />

```
## 
## Runs Test stats by Index:
```

```
##          Index runs.p     test  sigma3.lo sigma3.hi type
## 1    FISHERYBS  0.001   Failed -0.8964068 0.8964068 cpue
## 2    FISHERYEI  0.100   Passed -1.1328816 1.1328816 cpue
## 3    FISHERYGS  0.797   Passed -1.9827363 1.9827363 cpue
## 4  FISHERYJOIN  0.140   Passed -1.1347812 1.1347812 cpue
## 5  FISHERYSSIW  0.001   Failed -0.7101892 0.7101892 cpue
## 6     SURVEYBS  0.333   Passed -2.9583720 2.9583720 cpue
## 7     SURVEYEI  0.771   Passed -2.6776080 2.6776080 cpue
## 8     SURVEYGS  0.448   Passed -3.2527164 3.2527164 cpue
## 9   SURVEYJOIN  0.001   Failed -3.1976327 3.1976327 cpue
## 10  SURVEYSSIW     NA Excluded         NA        NA cpue
```

```
## 
##  Running Runs Test Diagnosics for Index 
## Plotting Residual Runs Tests
```

<img src="Figs/unnamed-chunk-25-10.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-25-11.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-25-12.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-25-13.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-25-14.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-25-15.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-25-16.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-25-17.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-25-18.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-25-19.jpeg" style="display: block; margin: auto;" />

```
## 
## Runs Test stats by Index:
```

```
##          Index runs.p     test  sigma3.lo sigma3.hi type
## 1    FISHERYBS  0.143   Passed -1.1809409 1.1809409 cpue
## 2    FISHERYEI  0.100   Passed -1.4337655 1.4337655 cpue
## 3    FISHERYGS  0.797   Passed -2.5816226 2.5816226 cpue
## 4  FISHERYJOIN  0.582   Passed -1.2562104 1.2562104 cpue
## 5  FISHERYSSIW  0.285   Passed -0.8795652 0.8795652 cpue
## 6     SURVEYBS  0.001   Failed -2.3451953 2.3451953 cpue
## 7     SURVEYEI  0.684   Passed -2.5556960 2.5556960 cpue
## 8     SURVEYGS  0.753   Passed -3.4160804 3.4160804 cpue
## 9   SURVEYJOIN  0.268   Passed -3.2923986 3.2923986 cpue
## 10  SURVEYSSIW     NA Excluded         NA        NA cpue
## 11    PREDATOR  0.001   Failed -0.5495260 0.5495260 cpue
```

```
## 
##  Running Runs Test Diagnosics for Index 
## Plotting Residual Runs Tests
```

<img src="Figs/unnamed-chunk-25-20.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-25-21.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-25-22.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-25-23.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-25-24.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-25-25.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-25-26.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-25-27.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-25-28.jpeg" style="display: block; margin: auto;" />

```
## 
## Runs Test stats by Index:
```

```
##          Index runs.p     test  sigma3.lo sigma3.hi type
## 1    FISHERYBS  0.089   Passed -0.9902968 0.9902968 cpue
## 2    FISHERYEI  0.095   Passed -1.3237393 1.3237393 cpue
## 3    FISHERYGS  0.530   Passed -2.0049843 2.0049843 cpue
## 4  FISHERYJOIN  0.140   Passed -1.0956169 1.0956169 cpue
## 5  FISHERYSSIW  0.000   Failed -0.7352820 0.7352820 cpue
## 6     SURVEYBS  0.184   Passed -2.4899491 2.4899491 cpue
## 7     SURVEYEI  0.684   Passed -2.6109770 2.6109770 cpue
## 8     SURVEYGS  0.448   Passed -3.2352437 3.2352437 cpue
## 9   SURVEYJOIN  0.718   Passed -3.1776396 3.1776396 cpue
## 10  SURVEYSSIW     NA Excluded         NA        NA cpue
```

```
## 
##  Running Runs Test Diagnosics for Index 
## Plotting Residual Runs Tests
```

<img src="Figs/unnamed-chunk-25-29.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-25-30.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-25-31.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-25-32.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-25-33.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-25-34.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-25-35.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-25-36.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-25-37.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-25-38.jpeg" style="display: block; margin: auto;" />

```
## 
## Runs Test stats by Index:
```

```
##          Index runs.p     test  sigma3.lo sigma3.hi type
## 1    FISHERYBS  0.219   Passed -1.1501113 1.1501113 cpue
## 2    FISHERYEI  0.095   Passed -1.3504415 1.3504415 cpue
## 3    FISHERYGS  0.240   Passed -2.3793664 2.3793664 cpue
## 4  FISHERYJOIN  0.582   Passed -1.0623026 1.0623026 cpue
## 5  FISHERYSSIW  0.028   Failed -0.8070684 0.8070684 cpue
## 6     SURVEYBS  0.001   Failed -2.3397865 2.3397865 cpue
## 7     SURVEYEI  0.684   Passed -2.6620650 2.6620650 cpue
## 8     SURVEYGS  0.753   Passed -3.3140560 3.3140560 cpue
## 9   SURVEYJOIN  0.268   Passed -3.4145689 3.4145689 cpue
## 10  SURVEYSSIW     NA Excluded         NA        NA cpue
## 11    PREDATOR  0.001   Failed -0.5495260 0.5495260 cpue
```

### Residual Analysis and RMSE 

Residual analysis of mean length data is a fundamental diagnostic tool in stock assessments. It helps evaluate whether the model provides an unbiased fit to the observed data and detects potential biases over time. In this figure, mean length residuals are plotted across years, differentiated by data source, including fishery-dependent (FISHERY) and fishery-independent (SURVEY) datasets, as well as predator-related observations (PREDATOR). The residuals represent the deviation of observed mean length from model-predicted values, standardized to facilitate interpretation.  

The black line represents a locally estimated scatterplot smoothing (Loess) curve, which provides a trend line to visualize systematic deviations over time. The presence of persistent positive or negative trends in the residuals may indicate biases in the growth model, selectivity assumptions, or misrepresentation of recruitment variability. The gray bars highlight periods where residual variability is particularly high, suggesting potential inconsistencies between observed and predicted size structures.  

RMSE quantifies the overall deviation between observed and predicted values, providing an aggregate measure of model fit. Lower RMSE values indicate better agreement between observed and predicted data. In fisheries stock assessment [@HurtadoF2015], RMSE thresholds for acceptable model performance typically range between *10% and 30%*, depending on the data quality and complexity of the population dynamics being modeled. Values exceeding this range suggest potential biases, requiring further investigation into the model structure, parameter estimation, or data sources.   

By analyzing residual patterns and RMSE values, the model can be refined to improve the accuracy of mean length predictions, ultimately enhancing the reliability of stock assessment outcomes and management recommendations.


```
## Plotting JABBA residual plot
```

<img src="Figs/unnamed-chunk-26-1.jpeg" style="display: block; margin: auto;" />

```
## 
## RMSE stats by Index:
```

```
##        indices RMSE.perc nobs
## 1    FISHERYBS       5.1   16
## 2    FISHERYEI      13.4   14
## 3    FISHERYGS       7.5   12
## 4  FISHERYJOIN       6.3    3
## 5  FISHERYSSIW       4.2   17
## 6     SURVEYBS       9.4   20
## 7     SURVEYEI       7.7   21
## 8     SURVEYGS      12.7   19
## 9   SURVEYJOIN      14.5   12
## 10    Combined       9.7  134
```

```
## Plotting JABBA residual plot
```

<img src="Figs/unnamed-chunk-26-2.jpeg" style="display: block; margin: auto;" />

```
## 
## RMSE stats by Index:
```

```
##        indices RMSE.perc nobs
## 1    FISHERYBS       2.4   16
## 2    FISHERYEI      12.6   14
## 3    FISHERYGS      19.0   12
## 4  FISHERYJOIN       9.6    3
## 5  FISHERYSSIW       4.8   17
## 6     SURVEYBS      30.6   20
## 7     SURVEYEI      15.6   21
## 8     SURVEYGS      18.2   19
## 9   SURVEYJOIN      13.0   12
## 10    PREDATOR      13.5   29
## 11    Combined      16.6  163
```

```
## Plotting JABBA residual plot
```

<img src="Figs/unnamed-chunk-26-3.jpeg" style="display: block; margin: auto;" />

```
## 
## RMSE stats by Index:
```

```
##        indices RMSE.perc nobs
## 1    FISHERYBS       4.9   16
## 2    FISHERYEI      13.9   14
## 3    FISHERYGS       9.4   12
## 4  FISHERYJOIN       7.3    3
## 5  FISHERYSSIW       4.4   17
## 6     SURVEYBS      15.0   20
## 7     SURVEYEI       7.6   21
## 8     SURVEYGS      11.9   19
## 9   SURVEYJOIN      14.2   12
## 10    Combined      10.7  134
```

```
## Plotting JABBA residual plot
```

<img src="Figs/unnamed-chunk-26-4.jpeg" style="display: block; margin: auto;" />

```
## 
## RMSE stats by Index:
```

```
##        indices RMSE.perc nobs
## 1    FISHERYBS       1.6   16
## 2    FISHERYEI      12.4   14
## 3    FISHERYGS      18.3   12
## 4  FISHERYJOIN       8.1    3
## 5  FISHERYSSIW       3.9   17
## 6     SURVEYBS      30.4   20
## 7     SURVEYEI      15.3   21
## 8     SURVEYGS      18.3   19
## 9   SURVEYJOIN      12.6   12
## 10    PREDATOR      16.4   29
## 11    Combined      16.8  163
```


```
## Plotting JABBA residual plot
```

<img src="Figs/unnamed-chunk-27-1.jpeg" style="display: block; margin: auto;" />

```
## 
## RMSE stats by Index:
```

```
##        indices RMSE.perc nobs
## 1    FISHERYBS      60.7   20
## 2    FISHERYEI      52.9   22
## 3    FISHERYGS      66.1   16
## 4  FISHERYJOIN      52.7    8
## 5  FISHERYSSIW      52.7   23
## 6     SURVEYBS      95.7   21
## 7     SURVEYEI      79.9   18
## 8     SURVEYGS     115.2   20
## 9   SURVEYJOIN     148.8    7
## 10  SURVEYSSIW      99.7    2
## 11    Combined      81.3  157
```

```
## Plotting JABBA residual plot
```

<img src="Figs/unnamed-chunk-27-2.jpeg" style="display: block; margin: auto;" />

```
## 
## RMSE stats by Index:
```

```
##        indices RMSE.perc nobs
## 1    FISHERYBS      62.1   20
## 2    FISHERYEI      50.2   22
## 3    FISHERYGS      82.2   16
## 4  FISHERYJOIN      46.0    8
## 5  FISHERYSSIW      33.8   23
## 6     SURVEYBS     134.7   20
## 7     SURVEYEI      88.4   18
## 8     SURVEYGS      98.4   20
## 9   SURVEYJOIN     131.8    8
## 10  SURVEYSSIW     127.7    2
## 11    PREDATOR       NaN    0
## 12    Combined      85.7  157
```

```
## Plotting JABBA residual plot
```

<img src="Figs/unnamed-chunk-27-3.jpeg" style="display: block; margin: auto;" />

```
## 
## RMSE stats by Index:
```

```
##        indices RMSE.perc nobs
## 1    FISHERYBS      63.7   20
## 2    FISHERYEI      50.0   22
## 3    FISHERYGS      70.3   16
## 4  FISHERYJOIN      46.2    8
## 5  FISHERYSSIW      50.1   23
## 6     SURVEYBS     121.9   20
## 7     SURVEYEI      94.3   18
## 8     SURVEYGS     119.7   21
## 9   SURVEYJOIN     123.7    7
## 10  SURVEYSSIW     131.0    2
## 11    Combined      87.0  157
```

```
## Plotting JABBA residual plot
```

<img src="Figs/unnamed-chunk-27-4.jpeg" style="display: block; margin: auto;" />

```
## 
## RMSE stats by Index:
```

```
##        indices RMSE.perc nobs
## 1    FISHERYBS      62.5   20
## 2    FISHERYEI      48.2   22
## 3    FISHERYGS      81.0   16
## 4  FISHERYJOIN      42.1    8
## 5  FISHERYSSIW      32.8   23
## 6     SURVEYBS     127.5   20
## 7     SURVEYEI      91.5   18
## 8     SURVEYGS     112.8   21
## 9   SURVEYJOIN     129.3    8
## 10  SURVEYSSIW     132.7    2
## 11    PREDATOR       NaN    0
## 12    Combined      86.6  158
```



### Comparision RMSE


```
##     Model1.1         Model1.2         Model1.3         Model1.4     
##  Min.   :0.5268   Min.   :0.3375   Min.   :0.4619   Min.   :0.3279  
##  1st Qu.:0.5480   1st Qu.:0.5314   1st Qu.:0.5347   1st Qu.:0.5176  
##  Median :0.7302   Median :0.8531   Median :0.8229   Median :0.8625  
##  Mean   :0.8826   Mean   :0.8969   Mean   :0.9325   Mean   :0.8845  
##  3rd Qu.:0.9867   3rd Qu.:1.2493   3rd Qu.:1.2814   3rd Qu.:1.2519  
##  Max.   :1.8820   Max.   :1.5809   Max.   :1.6408   Max.   :1.5163
```

<img src="Figs/unnamed-chunk-28-1.jpeg" style="display: block; margin: auto;" />

```
##                               Df Sum Sq Mean Sq F value Pr(>F)
## rep(1:4, each = nrow(dfrmse))  1  0.001 0.00085   0.005  0.945
## Residuals                     38  6.638 0.17469
```

```
## 
## 	Welch Two Sample t-test
## 
## data:  dfrmse$Model1.1 and dfrmse$Model1.2
## t = -0.07429, df = 17.971, p-value = 0.9416
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##  -0.4192226  0.3905904
## sample estimates:
## mean of x mean of y 
## 0.8825568 0.8968729
```

```
## 
## 	Welch Two Sample t-test
## 
## data:  dfrmse$Model1.1 and dfrmse$Model1.3
## t = -0.25543, df = 17.998, p-value = 0.8013
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##  -0.4604222  0.3606026
## sample estimates:
## mean of x mean of y 
## 0.8825568 0.9324666
```

```
## 
## 	Welch Two Sample t-test
## 
## data:  dfrmse$Model1.2 and dfrmse$Model1.3
## t = -0.18582, df = 17.985, p-value = 0.8547
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##  -0.4380513  0.3668639
## sample estimates:
## mean of x mean of y 
## 0.8968729 0.9324666
```

```
## 
## 	Welch Two Sample t-test
## 
## data:  dfrmse$Model1.3 and dfrmse$Model1.4
## t = 0.25137, df = 17.978, p-value = 0.8044
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##  -0.3531612  0.4491482
## sample estimates:
## mean of x mean of y 
## 0.9324666 0.8844731
```

```
##                               Df Sum Sq Mean Sq F value Pr(>F)
## rep(1:4, each = nrow(dfrmse))  1  0.001 0.00085   0.005  0.945
## Residuals                     38  6.638 0.17469
```

<img src="Figs/unnamed-chunk-28-2.jpeg" style="display: block; margin: auto;" />
This boxplot compares a summary of the Root Mean Square Error (RMSE) across four different models (s1.1, s1.2, s1.3, and s1.4) used to evaluate recruitment estimates of Antarctic krill. RMSE serves as an indicator of model accuracy, with lower values representing better predictive performance.

s1.1 exhibits the lowest median RMSE, suggesting it has the best overall fit among the four models. In contrast, Models 1.2, 1.3, and 1.4 show higher RMSE values, indicating comparatively lower predictive accuracy. The interquartile range (IQR) of these models is relatively similar, suggesting comparable variability in RMSE across models. Additionally, s1.1 has an outlier above 1.5 RMSE, which could indicate a case where the model's predictions deviated significantly from observed values.

Overall, this analysis highlights that incorporating different environmental or predator-related variables in the models impacts their predictive ability. The differences in RMSE suggest that some models may overfit or underfit the recruitment patterns of krill, emphasizing the need to refine model selection based on ecological and statistical considerations.


### Relationship Stock-Recruit

\[
R = \frac{aS}{1 + bS}
\]

Where:  
- \( S \) is the spawning stock biomass.  
- \( R \) is the predicted recruitment.  
- \( a \) is the maximum recruitment capacity.  
- \( b \) regulates density dependence (higher values of \( b \) result in a lower plateau).  

The blue line will show the asymptotic curve that describes the relationship between spawning stock biomass and recruitment.


<img src="Figs/unnamed-chunk-29-1.jpeg" style="display: block; margin: auto;" />

### Retrospective Analysis in Model Evaluation

Retrospective analyses provide insights into the differences in estimation patterns (underestimation or overestimation) among the models evaluated. These analyses assess the consistency and reliability of stock assessment models by systematically removing the most recent years of data and comparing the resulting estimates with the full dataset.  

In this study, we conducted a retrospective analysis to examine the sensitivity of our recruitment and spawning stock biomass (SSB) estimates to the inclusion or exclusion of recent data. By applying this approach to multiple models, we identified potential biases and evaluated the stability of the recruitment estimates over time.  

The retrospective patterns were assessed by calculating the relative error between the predictions of truncated datasets and the full dataset. These differences allowed us to detect trends in model performance, such as systematic overestimation or underestimation of key population parameters. Understanding these deviations is crucial for improving the robustness of the stock assessment models and ensuring more reliable projections for fisheries management.








<img src="Figs/unnamed-chunk-33-1.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-33-2.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-33-3.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-33-4.jpeg" style="display: block; margin: auto;" />


### Hindcast Cross-Validation and Prediction Skill

The Hindcast Cross-Validation (HCxval) diagnostic in Stock Synthesis is implemented using the model outputs generated by the `r4ss::SS_doRetro()` function. This diagnostic evaluates the predictive performance of the model by comparing hindcast predictions with observed data.

To assess prediction skill, we employ the Mean Absolute Scaled Error (MASE) as a robust metric. MASE is calculated by scaling the mean absolute error of the model predictions relative to the mean absolute error of a naïve baseline prediction. Specifically, the MASE score is computed as follows:

- A MASE score greater than 1 indicates that the model’s average forecasts are less accurate than a random walk model.
- A MASE score equal to 1 suggests that the model’s accuracy is similar to that of a random walk.
- A MASE score less than 1 indicates that the model performs better than a random walk.
- A MASE score of 0.5, for example, indicates that the model’s forecasts are twice as accurate as the naïve baseline prediction, suggesting the model has predictive skill.

This approach provides a rigorous evaluation of model forecasting capabilities and helps identify improvements for model calibration.


<img src="Figs/unnamed-chunk-34-1.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-34-2.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-34-3.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-34-4.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-34-5.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-34-6.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-34-7.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-34-8.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-34-9.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-34-10.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-34-11.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-34-12.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-34-13.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-34-14.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-34-15.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-34-16.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-34-17.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-34-18.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-34-19.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-34-20.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-34-21.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-34-22.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-34-23.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-34-24.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-34-25.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-34-26.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-34-27.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-34-28.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-34-29.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-34-30.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-34-31.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-34-32.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-34-33.jpeg" style="display: block; margin: auto;" /><img src="Figs/unnamed-chunk-34-34.jpeg" style="display: block; margin: auto;" />

### Kobe (status)



another



\begin{table}[H]
\centering
\caption{\label{tab:unnamed-chunk-37}Rho parameter in SSB model s01}
\centering
\begin{tabular}[t]{llrr}
\toprule
type & peel & Rho & ForcastRho\\
\midrule
SSB & 2019 & -0.2221760 & -0.2029340\\
SSB & 2018 & -0.1592795 & -0.3508103\\
SSB & 2017 & -0.1020015 & -0.1995048\\
SSB & 2016 & -0.1008203 & -0.1079496\\
SSB & Combined & -0.1460693 & -0.2152997\\
\bottomrule
\end{tabular}
\end{table}

\begin{table}[H]
\centering
\caption{\label{tab:unnamed-chunk-37}Rho parameter in F model s01}
\centering
\begin{tabular}[t]{llrr}
\toprule
type & peel & Rho & ForcastRho\\
\midrule
F & 2019 & 0.6088250 & 1.7133649\\
F & 2018 & 0.4184129 & 1.0573244\\
F & 2017 & 0.5151146 & 0.6784906\\
F & 2016 & 0.2009759 & 0.7418092\\
F & Combined & 0.4358321 & 1.0477473\\
\bottomrule
\end{tabular}
\end{table}

\begin{table}[H]
\centering
\caption{\label{tab:unnamed-chunk-37}Rho parameter in SSB model s2}
\centering
\begin{tabular}[t]{llrr}
\toprule
type & peel & Rho & ForcastRho\\
\midrule
SSB & 2019 & -0.0399511 & -0.0738296\\
SSB & 2018 & 0.0503928 & -0.0303679\\
SSB & 2017 & -0.0103780 & -0.0071376\\
SSB & 2016 & 0.1531692 & 0.0241755\\
SSB & Combined & 0.0383082 & -0.0217899\\
\bottomrule
\end{tabular}
\end{table}

\begin{table}[H]
\centering
\caption{\label{tab:unnamed-chunk-37}Rho parameter in F model s2}
\centering
\begin{tabular}[t]{llrr}
\toprule
type & peel & Rho & ForcastRho\\
\midrule
F & 2019 & 0.3867815 & 1.3192677\\
F & 2018 & 0.0328011 & 0.5865243\\
F & 2017 & 0.0269262 & 0.1437923\\
F & 2016 & -0.0676379 & 0.0448928\\
F & Combined & 0.0947177 & 0.5236193\\
\bottomrule
\end{tabular}
\end{table}

\begin{table}[H]
\centering
\caption{\label{tab:unnamed-chunk-37}Rho parameter in SSB model s3}
\centering
\begin{tabular}[t]{llrr}
\toprule
type & peel & Rho & ForcastRho\\
\midrule
SSB & 2019 & -0.2221760 & -0.2029340\\
SSB & 2018 & -0.1592795 & -0.3508103\\
SSB & 2017 & -0.1020015 & -0.1995048\\
SSB & 2016 & -0.1008203 & -0.1079496\\
SSB & Combined & -0.1460693 & -0.2152997\\
\bottomrule
\end{tabular}
\end{table}

\begin{table}[H]
\centering
\caption{\label{tab:unnamed-chunk-37}Rho parameter in F model s3}
\centering
\begin{tabular}[t]{llrr}
\toprule
type & peel & Rho & ForcastRho\\
\midrule
F & 2019 & 0.6088250 & 1.7133649\\
F & 2018 & 0.4184129 & 1.0573244\\
F & 2017 & 0.5151146 & 0.6784906\\
F & 2016 & 0.2009759 & 0.7418092\\
F & Combined & 0.4358321 & 1.0477473\\
\bottomrule
\end{tabular}
\end{table}

\begin{table}[H]
\centering
\caption{\label{tab:unnamed-chunk-37}Rho parameter in SSB model s4}
\centering
\begin{tabular}[t]{llrr}
\toprule
type & peel & Rho & ForcastRho\\
\midrule
SSB & 2019 & -0.1979996 & -0.2312302\\
SSB & 2018 & -0.3231815 & -0.3628268\\
SSB & 2017 & -0.3733517 & -0.4005422\\
SSB & 2016 & -0.3076141 & -0.3528780\\
SSB & Combined & -0.3005367 & -0.3368693\\
\bottomrule
\end{tabular}
\end{table}

\begin{table}[H]
\centering
\caption{\label{tab:unnamed-chunk-37}Rho parameter in F model s4}
\centering
\begin{tabular}[t]{llrr}
\toprule
type & peel & Rho & ForcastRho\\
\midrule
F & 2019 & 0.5374308 & 1.6132591\\
F & 2018 & 0.5862939 & 1.2685401\\
F & 2017 & 0.6675260 & 0.9032683\\
F & 2016 & 0.4829955 & 0.7001844\\
F & Combined & 0.5685616 & 1.1213130\\
\bottomrule
\end{tabular}
\end{table}

<table class="table" style="color: black; margin-left: auto; margin-right: auto;">
<caption>Rho parameter by model and quantity (SSB and F)</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Model </th>
   <th style="text-align:left;"> Quant </th>
   <th style="text-align:left;"> Rho.type </th>
   <th style="text-align:left;"> Rho.peel </th>
   <th style="text-align:right;"> Rho.Rho </th>
   <th style="text-align:right;"> Rho.ForcastRho </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> s1.1 </td>
   <td style="text-align:left;"> SSB </td>
   <td style="text-align:left;"> SSB </td>
   <td style="text-align:left;"> 2019 </td>
   <td style="text-align:right;"> -0.2221760 </td>
   <td style="text-align:right;"> -0.2029340 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> s1.1 </td>
   <td style="text-align:left;"> SSB </td>
   <td style="text-align:left;"> SSB </td>
   <td style="text-align:left;"> 2018 </td>
   <td style="text-align:right;"> -0.1592795 </td>
   <td style="text-align:right;"> -0.3508103 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> s1.1 </td>
   <td style="text-align:left;"> SSB </td>
   <td style="text-align:left;"> SSB </td>
   <td style="text-align:left;"> 2017 </td>
   <td style="text-align:right;"> -0.1020015 </td>
   <td style="text-align:right;"> -0.1995048 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> s1.1 </td>
   <td style="text-align:left;"> SSB </td>
   <td style="text-align:left;"> SSB </td>
   <td style="text-align:left;"> 2016 </td>
   <td style="text-align:right;"> -0.1008203 </td>
   <td style="text-align:right;"> -0.1079496 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> s1.1 </td>
   <td style="text-align:left;"> SSB </td>
   <td style="text-align:left;"> SSB </td>
   <td style="text-align:left;"> Combined </td>
   <td style="text-align:right;"> -0.1460693 </td>
   <td style="text-align:right;"> -0.2152997 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> s1.1 </td>
   <td style="text-align:left;"> F </td>
   <td style="text-align:left;"> F </td>
   <td style="text-align:left;"> 2019 </td>
   <td style="text-align:right;"> 0.6088250 </td>
   <td style="text-align:right;"> 1.7133649 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> s1.1 </td>
   <td style="text-align:left;"> F </td>
   <td style="text-align:left;"> F </td>
   <td style="text-align:left;"> 2018 </td>
   <td style="text-align:right;"> 0.4184129 </td>
   <td style="text-align:right;"> 1.0573244 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> s1.1 </td>
   <td style="text-align:left;"> F </td>
   <td style="text-align:left;"> F </td>
   <td style="text-align:left;"> 2017 </td>
   <td style="text-align:right;"> 0.5151146 </td>
   <td style="text-align:right;"> 0.6784906 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> s1.1 </td>
   <td style="text-align:left;"> F </td>
   <td style="text-align:left;"> F </td>
   <td style="text-align:left;"> 2016 </td>
   <td style="text-align:right;"> 0.2009759 </td>
   <td style="text-align:right;"> 0.7418092 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> s1.1 </td>
   <td style="text-align:left;"> F </td>
   <td style="text-align:left;"> F </td>
   <td style="text-align:left;"> Combined </td>
   <td style="text-align:right;"> 0.4358321 </td>
   <td style="text-align:right;"> 1.0477473 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> s1.2 </td>
   <td style="text-align:left;"> SSB </td>
   <td style="text-align:left;"> SSB </td>
   <td style="text-align:left;"> 2019 </td>
   <td style="text-align:right;"> -0.0399511 </td>
   <td style="text-align:right;"> -0.0738296 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> s1.2 </td>
   <td style="text-align:left;"> SSB </td>
   <td style="text-align:left;"> SSB </td>
   <td style="text-align:left;"> 2018 </td>
   <td style="text-align:right;"> 0.0503928 </td>
   <td style="text-align:right;"> -0.0303679 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> s1.2 </td>
   <td style="text-align:left;"> SSB </td>
   <td style="text-align:left;"> SSB </td>
   <td style="text-align:left;"> 2017 </td>
   <td style="text-align:right;"> -0.0103780 </td>
   <td style="text-align:right;"> -0.0071376 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> s1.2 </td>
   <td style="text-align:left;"> SSB </td>
   <td style="text-align:left;"> SSB </td>
   <td style="text-align:left;"> 2016 </td>
   <td style="text-align:right;"> 0.1531692 </td>
   <td style="text-align:right;"> 0.0241755 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> s1.2 </td>
   <td style="text-align:left;"> SSB </td>
   <td style="text-align:left;"> SSB </td>
   <td style="text-align:left;"> Combined </td>
   <td style="text-align:right;"> 0.0383082 </td>
   <td style="text-align:right;"> -0.0217899 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> s1.2 </td>
   <td style="text-align:left;"> F </td>
   <td style="text-align:left;"> F </td>
   <td style="text-align:left;"> 2019 </td>
   <td style="text-align:right;"> 0.3867815 </td>
   <td style="text-align:right;"> 1.3192677 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> s1.2 </td>
   <td style="text-align:left;"> F </td>
   <td style="text-align:left;"> F </td>
   <td style="text-align:left;"> 2018 </td>
   <td style="text-align:right;"> 0.0328011 </td>
   <td style="text-align:right;"> 0.5865243 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> s1.2 </td>
   <td style="text-align:left;"> F </td>
   <td style="text-align:left;"> F </td>
   <td style="text-align:left;"> 2017 </td>
   <td style="text-align:right;"> 0.0269262 </td>
   <td style="text-align:right;"> 0.1437923 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> s1.2 </td>
   <td style="text-align:left;"> F </td>
   <td style="text-align:left;"> F </td>
   <td style="text-align:left;"> 2016 </td>
   <td style="text-align:right;"> -0.0676379 </td>
   <td style="text-align:right;"> 0.0448928 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> s1.2 </td>
   <td style="text-align:left;"> F </td>
   <td style="text-align:left;"> F </td>
   <td style="text-align:left;"> Combined </td>
   <td style="text-align:right;"> 0.0947177 </td>
   <td style="text-align:right;"> 0.5236193 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> s1.3 </td>
   <td style="text-align:left;"> SSB </td>
   <td style="text-align:left;"> SSB </td>
   <td style="text-align:left;"> 2019 </td>
   <td style="text-align:right;"> -0.2221760 </td>
   <td style="text-align:right;"> -0.2029340 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> s1.3 </td>
   <td style="text-align:left;"> SSB </td>
   <td style="text-align:left;"> SSB </td>
   <td style="text-align:left;"> 2018 </td>
   <td style="text-align:right;"> -0.1592795 </td>
   <td style="text-align:right;"> -0.3508103 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> s1.3 </td>
   <td style="text-align:left;"> SSB </td>
   <td style="text-align:left;"> SSB </td>
   <td style="text-align:left;"> 2017 </td>
   <td style="text-align:right;"> -0.1020015 </td>
   <td style="text-align:right;"> -0.1995048 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> s1.3 </td>
   <td style="text-align:left;"> SSB </td>
   <td style="text-align:left;"> SSB </td>
   <td style="text-align:left;"> 2016 </td>
   <td style="text-align:right;"> -0.1008203 </td>
   <td style="text-align:right;"> -0.1079496 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> s1.3 </td>
   <td style="text-align:left;"> SSB </td>
   <td style="text-align:left;"> SSB </td>
   <td style="text-align:left;"> Combined </td>
   <td style="text-align:right;"> -0.1460693 </td>
   <td style="text-align:right;"> -0.2152997 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> s1.3 </td>
   <td style="text-align:left;"> F </td>
   <td style="text-align:left;"> F </td>
   <td style="text-align:left;"> 2019 </td>
   <td style="text-align:right;"> 0.6088250 </td>
   <td style="text-align:right;"> 1.7133649 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> s1.3 </td>
   <td style="text-align:left;"> F </td>
   <td style="text-align:left;"> F </td>
   <td style="text-align:left;"> 2018 </td>
   <td style="text-align:right;"> 0.4184129 </td>
   <td style="text-align:right;"> 1.0573244 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> s1.3 </td>
   <td style="text-align:left;"> F </td>
   <td style="text-align:left;"> F </td>
   <td style="text-align:left;"> 2017 </td>
   <td style="text-align:right;"> 0.5151146 </td>
   <td style="text-align:right;"> 0.6784906 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> s1.3 </td>
   <td style="text-align:left;"> F </td>
   <td style="text-align:left;"> F </td>
   <td style="text-align:left;"> 2016 </td>
   <td style="text-align:right;"> 0.2009759 </td>
   <td style="text-align:right;"> 0.7418092 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> s1.3 </td>
   <td style="text-align:left;"> F </td>
   <td style="text-align:left;"> F </td>
   <td style="text-align:left;"> Combined </td>
   <td style="text-align:right;"> 0.4358321 </td>
   <td style="text-align:right;"> 1.0477473 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> s1.4 </td>
   <td style="text-align:left;"> SSB </td>
   <td style="text-align:left;"> SSB </td>
   <td style="text-align:left;"> 2019 </td>
   <td style="text-align:right;"> -0.1979996 </td>
   <td style="text-align:right;"> -0.2312302 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> s1.4 </td>
   <td style="text-align:left;"> SSB </td>
   <td style="text-align:left;"> SSB </td>
   <td style="text-align:left;"> 2018 </td>
   <td style="text-align:right;"> -0.3231815 </td>
   <td style="text-align:right;"> -0.3628268 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> s1.4 </td>
   <td style="text-align:left;"> SSB </td>
   <td style="text-align:left;"> SSB </td>
   <td style="text-align:left;"> 2017 </td>
   <td style="text-align:right;"> -0.3733517 </td>
   <td style="text-align:right;"> -0.4005422 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> s1.4 </td>
   <td style="text-align:left;"> SSB </td>
   <td style="text-align:left;"> SSB </td>
   <td style="text-align:left;"> 2016 </td>
   <td style="text-align:right;"> -0.3076141 </td>
   <td style="text-align:right;"> -0.3528780 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> s1.4 </td>
   <td style="text-align:left;"> SSB </td>
   <td style="text-align:left;"> SSB </td>
   <td style="text-align:left;"> Combined </td>
   <td style="text-align:right;"> -0.3005367 </td>
   <td style="text-align:right;"> -0.3368693 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> s1.4 </td>
   <td style="text-align:left;"> F </td>
   <td style="text-align:left;"> F </td>
   <td style="text-align:left;"> 2019 </td>
   <td style="text-align:right;"> 0.5374308 </td>
   <td style="text-align:right;"> 1.6132591 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> s1.4 </td>
   <td style="text-align:left;"> F </td>
   <td style="text-align:left;"> F </td>
   <td style="text-align:left;"> 2018 </td>
   <td style="text-align:right;"> 0.5862939 </td>
   <td style="text-align:right;"> 1.2685401 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> s1.4 </td>
   <td style="text-align:left;"> F </td>
   <td style="text-align:left;"> F </td>
   <td style="text-align:left;"> 2017 </td>
   <td style="text-align:right;"> 0.6675260 </td>
   <td style="text-align:right;"> 0.9032683 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> s1.4 </td>
   <td style="text-align:left;"> F </td>
   <td style="text-align:left;"> F </td>
   <td style="text-align:left;"> 2016 </td>
   <td style="text-align:right;"> 0.4829955 </td>
   <td style="text-align:right;"> 0.7001844 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> s1.4 </td>
   <td style="text-align:left;"> F </td>
   <td style="text-align:left;"> F </td>
   <td style="text-align:left;"> Combined </td>
   <td style="text-align:right;"> 0.5685616 </td>
   <td style="text-align:right;"> 1.1213130 </td>
  </tr>
</tbody>
</table>

### Likelihood tables



<img src="Figs/unnamed-chunk-39-1.jpeg" style="display: block; margin: auto;" />

### Likelihood Profile 




### `SSplotProfile()`



### Convergence Criteria

The convergence criterion used for model calibration is set to a final threshold of **0.0001** (or equivalently **1.0e-04**). This criterion defines the minimum acceptable difference between successive model iterations. Convergence is considered achieved when the absolute change in the objective function value or key parameters falls below this threshold. A smaller convergence value ensures that the model achieves a high degree of accuracy and stability in its final estimates, indicating that further iterations are unlikely to result in significant changes to the parameter estimates.




piner Plot





## Outputs

### Outputs Model `s1.1`

<table class=" lightable-paper lightable-hover table" style='color: black; font-family: "Arial Narrow", arial, helvetica, sans-serif; margin-left: auto; margin-right: auto; font-size: 9px; color: black; font-family: arial; width: auto !important; margin-left: auto; margin-right: auto;'>
<caption style="font-size: initial !important;">Main variables outputs from stock asssessment krill in WAP `s1.1`</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:right;"> Yr </th>
   <th style="text-align:left;"> Era </th>
   <th style="text-align:right;"> Seas </th>
   <th style="text-align:right;"> Bio_all </th>
   <th style="text-align:right;"> Bio_smry </th>
   <th style="text-align:right;"> SpawnBio </th>
   <th style="text-align:right;"> Recruit_0 </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> 1254 </td>
   <td style="text-align:right;"> 1989 </td>
   <td style="text-align:left;"> VIRG </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2184230 </td>
   <td style="text-align:right;"> 2176360 </td>
   <td style="text-align:right;"> 3565180 </td>
   <td style="text-align:right;"> 107962000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1255 </td>
   <td style="text-align:right;"> 1990 </td>
   <td style="text-align:left;"> INIT </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1498570 </td>
   <td style="text-align:right;"> 1490900 </td>
   <td style="text-align:right;"> 2259200 </td>
   <td style="text-align:right;"> 105278000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1256 </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1498570 </td>
   <td style="text-align:right;"> 1490900 </td>
   <td style="text-align:right;"> 2259200 </td>
   <td style="text-align:right;"> 105278000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1257 </td>
   <td style="text-align:right;"> 1992 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1616910 </td>
   <td style="text-align:right;"> 1609190 </td>
   <td style="text-align:right;"> 2452620 </td>
   <td style="text-align:right;"> 105844000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1258 </td>
   <td style="text-align:right;"> 1993 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1723130 </td>
   <td style="text-align:right;"> 1715370 </td>
   <td style="text-align:right;"> 2661750 </td>
   <td style="text-align:right;"> 106370000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1259 </td>
   <td style="text-align:right;"> 1994 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1814140 </td>
   <td style="text-align:right;"> 1806360 </td>
   <td style="text-align:right;"> 2839670 </td>
   <td style="text-align:right;"> 106759000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1260 </td>
   <td style="text-align:right;"> 1995 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1889790 </td>
   <td style="text-align:right;"> 1881980 </td>
   <td style="text-align:right;"> 2987350 </td>
   <td style="text-align:right;"> 107049000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1261 </td>
   <td style="text-align:right;"> 1996 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1951400 </td>
   <td style="text-align:right;"> 1943580 </td>
   <td style="text-align:right;"> 3107870 </td>
   <td style="text-align:right;"> 107266000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1262 </td>
   <td style="text-align:right;"> 1997 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2000910 </td>
   <td style="text-align:right;"> 1993080 </td>
   <td style="text-align:right;"> 3204890 </td>
   <td style="text-align:right;"> 107430000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1263 </td>
   <td style="text-align:right;"> 1998 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2031670 </td>
   <td style="text-align:right;"> 2031470 </td>
   <td style="text-align:right;"> 3280300 </td>
   <td style="text-align:right;"> 2722690 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1264 </td>
   <td style="text-align:right;"> 1999 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1950370 </td>
   <td style="text-align:right;"> 1950080 </td>
   <td style="text-align:right;"> 3329570 </td>
   <td style="text-align:right;"> 3861330 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1265 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1709860 </td>
   <td style="text-align:right;"> 1703160 </td>
   <td style="text-align:right;"> 3365450 </td>
   <td style="text-align:right;"> 91895800 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1266 </td>
   <td style="text-align:right;"> 2001 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1523110 </td>
   <td style="text-align:right;"> 1504210 </td>
   <td style="text-align:right;"> 2802010 </td>
   <td style="text-align:right;"> 259242000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1267 </td>
   <td style="text-align:right;"> 2002 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1638890 </td>
   <td style="text-align:right;"> 1627610 </td>
   <td style="text-align:right;"> 2264810 </td>
   <td style="text-align:right;"> 154705000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1268 </td>
   <td style="text-align:right;"> 2003 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1971710 </td>
   <td style="text-align:right;"> 1971470 </td>
   <td style="text-align:right;"> 2294470 </td>
   <td style="text-align:right;"> 3332310 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1269 </td>
   <td style="text-align:right;"> 2004 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2079960 </td>
   <td style="text-align:right;"> 2078730 </td>
   <td style="text-align:right;"> 3317380 </td>
   <td style="text-align:right;"> 16879800 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1270 </td>
   <td style="text-align:right;"> 2005 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1916790 </td>
   <td style="text-align:right;"> 1913490 </td>
   <td style="text-align:right;"> 3747190 </td>
   <td style="text-align:right;"> 45270000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1271 </td>
   <td style="text-align:right;"> 2006 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1724010 </td>
   <td style="text-align:right;"> 1708750 </td>
   <td style="text-align:right;"> 3238060 </td>
   <td style="text-align:right;"> 209287000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1272 </td>
   <td style="text-align:right;"> 2007 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1640040 </td>
   <td style="text-align:right;"> 1631050 </td>
   <td style="text-align:right;"> 2612060 </td>
   <td style="text-align:right;"> 123361000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1273 </td>
   <td style="text-align:right;"> 2008 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1833350 </td>
   <td style="text-align:right;"> 1832360 </td>
   <td style="text-align:right;"> 2343170 </td>
   <td style="text-align:right;"> 13566800 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1274 </td>
   <td style="text-align:right;"> 2009 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1869200 </td>
   <td style="text-align:right;"> 1864810 </td>
   <td style="text-align:right;"> 3037610 </td>
   <td style="text-align:right;"> 60221700 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1275 </td>
   <td style="text-align:right;"> 2010 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1731220 </td>
   <td style="text-align:right;"> 1719710 </td>
   <td style="text-align:right;"> 3226670 </td>
   <td style="text-align:right;"> 157914000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1276 </td>
   <td style="text-align:right;"> 2011 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1606630 </td>
   <td style="text-align:right;"> 1586690 </td>
   <td style="text-align:right;"> 2567950 </td>
   <td style="text-align:right;"> 273609000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1277 </td>
   <td style="text-align:right;"> 2012 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1905570 </td>
   <td style="text-align:right;"> 1872960 </td>
   <td style="text-align:right;"> 2385900 </td>
   <td style="text-align:right;"> 447447000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1278 </td>
   <td style="text-align:right;"> 2013 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2520170 </td>
   <td style="text-align:right;"> 2519760 </td>
   <td style="text-align:right;"> 2744410 </td>
   <td style="text-align:right;"> 5517500 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1279 </td>
   <td style="text-align:right;"> 2014 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2918840 </td>
   <td style="text-align:right;"> 2914270 </td>
   <td style="text-align:right;"> 3602640 </td>
   <td style="text-align:right;"> 62737200 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1280 </td>
   <td style="text-align:right;"> 2015 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2758580 </td>
   <td style="text-align:right;"> 2740280 </td>
   <td style="text-align:right;"> 5255400 </td>
   <td style="text-align:right;"> 251086000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1281 </td>
   <td style="text-align:right;"> 2016 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2672990 </td>
   <td style="text-align:right;"> 2619030 </td>
   <td style="text-align:right;"> 4425950 </td>
   <td style="text-align:right;"> 740188000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1282 </td>
   <td style="text-align:right;"> 2017 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 3269820 </td>
   <td style="text-align:right;"> 3269180 </td>
   <td style="text-align:right;"> 3819450 </td>
   <td style="text-align:right;"> 8874990 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1283 </td>
   <td style="text-align:right;"> 2018 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 4057150 </td>
   <td style="text-align:right;"> 3997160 </td>
   <td style="text-align:right;"> 4289280 </td>
   <td style="text-align:right;"> 823040000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1284 </td>
   <td style="text-align:right;"> 2019 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 4780510 </td>
   <td style="text-align:right;"> 4672090 </td>
   <td style="text-align:right;"> 7517290 </td>
   <td style="text-align:right;"> 1487330000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1285 </td>
   <td style="text-align:right;"> 2020 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 6934500 </td>
   <td style="text-align:right;"> 6933840 </td>
   <td style="text-align:right;"> 6701380 </td>
   <td style="text-align:right;"> 8978140 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1286 </td>
   <td style="text-align:right;"> 2021 </td>
   <td style="text-align:left;"> FORE </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 8884260 </td>
   <td style="text-align:right;"> 8876160 </td>
   <td style="text-align:right;"> 10056300 </td>
   <td style="text-align:right;"> 111127000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1287 </td>
   <td style="text-align:right;"> 2022 </td>
   <td style="text-align:left;"> FORE </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 8472730 </td>
   <td style="text-align:right;"> 8464580 </td>
   <td style="text-align:right;"> 16411100 </td>
   <td style="text-align:right;"> 111824000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1288 </td>
   <td style="text-align:right;"> 2023 </td>
   <td style="text-align:left;"> FORE </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 7532870 </td>
   <td style="text-align:right;"> 7524730 </td>
   <td style="text-align:right;"> 14262700 </td>
   <td style="text-align:right;"> 111657000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1289 </td>
   <td style="text-align:right;"> 2024 </td>
   <td style="text-align:left;"> FORE </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 6398190 </td>
   <td style="text-align:right;"> 6390070 </td>
   <td style="text-align:right;"> 11986300 </td>
   <td style="text-align:right;"> 111416000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1290 </td>
   <td style="text-align:right;"> 2025 </td>
   <td style="text-align:left;"> FORE </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 5398930 </td>
   <td style="text-align:right;"> 5390840 </td>
   <td style="text-align:right;"> 9988720 </td>
   <td style="text-align:right;"> 111115000 </td>
  </tr>
</tbody>
</table>
### Outputs Model `s1.2`

<table class=" lightable-paper lightable-hover table" style='color: black; font-family: "Arial Narrow", arial, helvetica, sans-serif; margin-left: auto; margin-right: auto; font-size: 9px; color: black; font-family: arial; width: auto !important; margin-left: auto; margin-right: auto;'>
<caption style="font-size: initial !important;">Main variables outputs from stock asssessment krill in WAP in `s1.2`</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:right;"> Yr </th>
   <th style="text-align:left;"> Era </th>
   <th style="text-align:right;"> Seas </th>
   <th style="text-align:right;"> Bio_all </th>
   <th style="text-align:right;"> Bio_smry </th>
   <th style="text-align:right;"> SpawnBio </th>
   <th style="text-align:right;"> Recruit_0 </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> 1354 </td>
   <td style="text-align:right;"> 1989 </td>
   <td style="text-align:left;"> VIRG </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2299170 </td>
   <td style="text-align:right;"> 2268860 </td>
   <td style="text-align:right;"> 2213450 </td>
   <td style="text-align:right;"> 415800000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1355 </td>
   <td style="text-align:right;"> 1990 </td>
   <td style="text-align:left;"> INIT </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2140700 </td>
   <td style="text-align:right;"> 2110590 </td>
   <td style="text-align:right;"> 1919210 </td>
   <td style="text-align:right;"> 413006000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1356 </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2140700 </td>
   <td style="text-align:right;"> 2110590 </td>
   <td style="text-align:right;"> 1919210 </td>
   <td style="text-align:right;"> 413006000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1357 </td>
   <td style="text-align:right;"> 1992 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2210510 </td>
   <td style="text-align:right;"> 2180300 </td>
   <td style="text-align:right;"> 2052100 </td>
   <td style="text-align:right;"> 414362000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1358 </td>
   <td style="text-align:right;"> 1993 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2249080 </td>
   <td style="text-align:right;"> 2218830 </td>
   <td style="text-align:right;"> 2126300 </td>
   <td style="text-align:right;"> 415049000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1359 </td>
   <td style="text-align:right;"> 1994 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2270970 </td>
   <td style="text-align:right;"> 2240690 </td>
   <td style="text-align:right;"> 2163880 </td>
   <td style="text-align:right;"> 415380000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1360 </td>
   <td style="text-align:right;"> 1995 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2283380 </td>
   <td style="text-align:right;"> 2253090 </td>
   <td style="text-align:right;"> 2185490 </td>
   <td style="text-align:right;"> 415565000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1361 </td>
   <td style="text-align:right;"> 1996 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2290340 </td>
   <td style="text-align:right;"> 2260040 </td>
   <td style="text-align:right;"> 2197820 </td>
   <td style="text-align:right;"> 415669000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1362 </td>
   <td style="text-align:right;"> 1997 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2294230 </td>
   <td style="text-align:right;"> 2263930 </td>
   <td style="text-align:right;"> 2204700 </td>
   <td style="text-align:right;"> 415727000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1363 </td>
   <td style="text-align:right;"> 1998 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2266810 </td>
   <td style="text-align:right;"> 2265650 </td>
   <td style="text-align:right;"> 2207770 </td>
   <td style="text-align:right;"> 15962500 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1364 </td>
   <td style="text-align:right;"> 1999 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1867210 </td>
   <td style="text-align:right;"> 1863690 </td>
   <td style="text-align:right;"> 2202490 </td>
   <td style="text-align:right;"> 48340700 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1365 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1196690 </td>
   <td style="text-align:right;"> 1191800 </td>
   <td style="text-align:right;"> 2199340 </td>
   <td style="text-align:right;"> 67016200 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1366 </td>
   <td style="text-align:right;"> 2001 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 828069 </td>
   <td style="text-align:right;"> 768871 </td>
   <td style="text-align:right;"> 1232060 </td>
   <td style="text-align:right;"> 812129000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1367 </td>
   <td style="text-align:right;"> 2002 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1347830 </td>
   <td style="text-align:right;"> 1298870 </td>
   <td style="text-align:right;"> 737765 </td>
   <td style="text-align:right;"> 671607000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1368 </td>
   <td style="text-align:right;"> 2003 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2369680 </td>
   <td style="text-align:right;"> 2367790 </td>
   <td style="text-align:right;"> 534842 </td>
   <td style="text-align:right;"> 25993000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1369 </td>
   <td style="text-align:right;"> 2004 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2358800 </td>
   <td style="text-align:right;"> 2347400 </td>
   <td style="text-align:right;"> 2222130 </td>
   <td style="text-align:right;"> 156448000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1370 </td>
   <td style="text-align:right;"> 2005 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1692350 </td>
   <td style="text-align:right;"> 1681210 </td>
   <td style="text-align:right;"> 2907030 </td>
   <td style="text-align:right;"> 152806000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1371 </td>
   <td style="text-align:right;"> 2006 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1334460 </td>
   <td style="text-align:right;"> 1282450 </td>
   <td style="text-align:right;"> 1706020 </td>
   <td style="text-align:right;"> 713509000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1372 </td>
   <td style="text-align:right;"> 2007 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1587260 </td>
   <td style="text-align:right;"> 1564820 </td>
   <td style="text-align:right;"> 1167630 </td>
   <td style="text-align:right;"> 307877000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1373 </td>
   <td style="text-align:right;"> 2008 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2058080 </td>
   <td style="text-align:right;"> 2050430 </td>
   <td style="text-align:right;"> 968864 </td>
   <td style="text-align:right;"> 104953000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1374 </td>
   <td style="text-align:right;"> 2009 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1799590 </td>
   <td style="text-align:right;"> 1784940 </td>
   <td style="text-align:right;"> 2225020 </td>
   <td style="text-align:right;"> 200938000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1375 </td>
   <td style="text-align:right;"> 2010 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1401810 </td>
   <td style="text-align:right;"> 1386880 </td>
   <td style="text-align:right;"> 1981840 </td>
   <td style="text-align:right;"> 204876000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1376 </td>
   <td style="text-align:right;"> 2011 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1141310 </td>
   <td style="text-align:right;"> 1130440 </td>
   <td style="text-align:right;"> 1172540 </td>
   <td style="text-align:right;"> 149095000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1377 </td>
   <td style="text-align:right;"> 2012 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1076390 </td>
   <td style="text-align:right;"> 1042010 </td>
   <td style="text-align:right;"> 1058820 </td>
   <td style="text-align:right;"> 471730000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1378 </td>
   <td style="text-align:right;"> 2013 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1258030 </td>
   <td style="text-align:right;"> 1225100 </td>
   <td style="text-align:right;"> 995034 </td>
   <td style="text-align:right;"> 451783000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1379 </td>
   <td style="text-align:right;"> 2014 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1685050 </td>
   <td style="text-align:right;"> 1599720 </td>
   <td style="text-align:right;"> 774750 </td>
   <td style="text-align:right;"> 1170600000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1380 </td>
   <td style="text-align:right;"> 2015 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2619570 </td>
   <td style="text-align:right;"> 2612840 </td>
   <td style="text-align:right;"> 1328470 </td>
   <td style="text-align:right;"> 92363200 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1381 </td>
   <td style="text-align:right;"> 2016 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2961350 </td>
   <td style="text-align:right;"> 2947640 </td>
   <td style="text-align:right;"> 1691030 </td>
   <td style="text-align:right;"> 188112000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1382 </td>
   <td style="text-align:right;"> 2017 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2137730 </td>
   <td style="text-align:right;"> 2126280 </td>
   <td style="text-align:right;"> 3483620 </td>
   <td style="text-align:right;"> 157048000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1383 </td>
   <td style="text-align:right;"> 2018 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1632790 </td>
   <td style="text-align:right;"> 1493160 </td>
   <td style="text-align:right;"> 2050430 </td>
   <td style="text-align:right;"> 1915550000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1384 </td>
   <td style="text-align:right;"> 2019 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 3002460 </td>
   <td style="text-align:right;"> 2903520 </td>
   <td style="text-align:right;"> 1450160 </td>
   <td style="text-align:right;"> 1357410000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1385 </td>
   <td style="text-align:right;"> 2020 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 5247580 </td>
   <td style="text-align:right;"> 5235720 </td>
   <td style="text-align:right;"> 1111080 </td>
   <td style="text-align:right;"> 162708000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1386 </td>
   <td style="text-align:right;"> 2021 </td>
   <td style="text-align:left;"> FORE </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 5161170 </td>
   <td style="text-align:right;"> 5130090 </td>
   <td style="text-align:right;"> 5069530 </td>
   <td style="text-align:right;"> 426398000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1387 </td>
   <td style="text-align:right;"> 2022 </td>
   <td style="text-align:left;"> FORE </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 3655000 </td>
   <td style="text-align:right;"> 3623850 </td>
   <td style="text-align:right;"> 5768290 </td>
   <td style="text-align:right;"> 427421000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1388 </td>
   <td style="text-align:right;"> 2023 </td>
   <td style="text-align:left;"> FORE </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2833070 </td>
   <td style="text-align:right;"> 2802300 </td>
   <td style="text-align:right;"> 3345400 </td>
   <td style="text-align:right;"> 422101000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1389 </td>
   <td style="text-align:right;"> 2024 </td>
   <td style="text-align:left;"> FORE </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2415010 </td>
   <td style="text-align:right;"> 2384550 </td>
   <td style="text-align:right;"> 2502690 </td>
   <td style="text-align:right;"> 417931000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1390 </td>
   <td style="text-align:right;"> 2025 </td>
   <td style="text-align:left;"> FORE </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2214670 </td>
   <td style="text-align:right;"> 2184410 </td>
   <td style="text-align:right;"> 2127620 </td>
   <td style="text-align:right;"> 415061000 </td>
  </tr>
</tbody>
</table>



### Outputs Model `s1.3`

<table class=" lightable-paper lightable-hover table" style='color: black; font-family: "Arial Narrow", arial, helvetica, sans-serif; margin-left: auto; margin-right: auto; font-size: 9px; color: black; font-family: arial; width: auto !important; margin-left: auto; margin-right: auto;'>
<caption style="font-size: initial !important;">Main variables outputs from stock asssessment krill in WAP in `s1.3`</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:right;"> Yr </th>
   <th style="text-align:left;"> Era </th>
   <th style="text-align:right;"> Seas </th>
   <th style="text-align:right;"> Bio_all </th>
   <th style="text-align:right;"> Bio_smry </th>
   <th style="text-align:right;"> SpawnBio </th>
   <th style="text-align:right;"> Recruit_0 </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> 1305 </td>
   <td style="text-align:right;"> 1989 </td>
   <td style="text-align:left;"> VIRG </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1354540 </td>
   <td style="text-align:right;"> 1349660 </td>
   <td style="text-align:right;"> 2210920 </td>
   <td style="text-align:right;"> 66952200 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1306 </td>
   <td style="text-align:right;"> 1990 </td>
   <td style="text-align:left;"> INIT </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 925937 </td>
   <td style="text-align:right;"> 921186 </td>
   <td style="text-align:right;"> 1367470 </td>
   <td style="text-align:right;"> 65178600 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1307 </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 925937 </td>
   <td style="text-align:right;"> 921186 </td>
   <td style="text-align:right;"> 1367470 </td>
   <td style="text-align:right;"> 65178600 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1308 </td>
   <td style="text-align:right;"> 1992 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1012370 </td>
   <td style="text-align:right;"> 1007590 </td>
   <td style="text-align:right;"> 1539740 </td>
   <td style="text-align:right;"> 65688900 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1309 </td>
   <td style="text-align:right;"> 1993 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1082790 </td>
   <td style="text-align:right;"> 1077970 </td>
   <td style="text-align:right;"> 1679460 </td>
   <td style="text-align:right;"> 66030400 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1310 </td>
   <td style="text-align:right;"> 1994 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1139590 </td>
   <td style="text-align:right;"> 1134760 </td>
   <td style="text-align:right;"> 1789740 </td>
   <td style="text-align:right;"> 66264200 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1311 </td>
   <td style="text-align:right;"> 1995 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1184920 </td>
   <td style="text-align:right;"> 1180070 </td>
   <td style="text-align:right;"> 1878070 </td>
   <td style="text-align:right;"> 66432800 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1312 </td>
   <td style="text-align:right;"> 1996 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1220820 </td>
   <td style="text-align:right;"> 1215970 </td>
   <td style="text-align:right;"> 1948280 </td>
   <td style="text-align:right;"> 66556400 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1313 </td>
   <td style="text-align:right;"> 1997 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1249200 </td>
   <td style="text-align:right;"> 1244350 </td>
   <td style="text-align:right;"> 2003870 </td>
   <td style="text-align:right;"> 66648400 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1314 </td>
   <td style="text-align:right;"> 1998 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1266420 </td>
   <td style="text-align:right;"> 1266130 </td>
   <td style="text-align:right;"> 2046680 </td>
   <td style="text-align:right;"> 3933970 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1315 </td>
   <td style="text-align:right;"> 1999 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1216010 </td>
   <td style="text-align:right;"> 1215500 </td>
   <td style="text-align:right;"> 2071380 </td>
   <td style="text-align:right;"> 7024060 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1316 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1072540 </td>
   <td style="text-align:right;"> 1067770 </td>
   <td style="text-align:right;"> 2089420 </td>
   <td style="text-align:right;"> 65411200 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1317 </td>
   <td style="text-align:right;"> 2001 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 972011 </td>
   <td style="text-align:right;"> 956267 </td>
   <td style="text-align:right;"> 1743630 </td>
   <td style="text-align:right;"> 215989000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1318 </td>
   <td style="text-align:right;"> 2002 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1109210 </td>
   <td style="text-align:right;"> 1100090 </td>
   <td style="text-align:right;"> 1431580 </td>
   <td style="text-align:right;"> 125160000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1319 </td>
   <td style="text-align:right;"> 2003 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1429620 </td>
   <td style="text-align:right;"> 1429580 </td>
   <td style="text-align:right;"> 1495100 </td>
   <td style="text-align:right;"> 561097 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1320 </td>
   <td style="text-align:right;"> 2004 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1554480 </td>
   <td style="text-align:right;"> 1552980 </td>
   <td style="text-align:right;"> 2429710 </td>
   <td style="text-align:right;"> 20540100 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1321 </td>
   <td style="text-align:right;"> 2005 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1457100 </td>
   <td style="text-align:right;"> 1454260 </td>
   <td style="text-align:right;"> 2840910 </td>
   <td style="text-align:right;"> 39008600 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1322 </td>
   <td style="text-align:right;"> 2006 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1336990 </td>
   <td style="text-align:right;"> 1324330 </td>
   <td style="text-align:right;"> 2463950 </td>
   <td style="text-align:right;"> 173714000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1323 </td>
   <td style="text-align:right;"> 2007 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1281790 </td>
   <td style="text-align:right;"> 1274680 </td>
   <td style="text-align:right;"> 2002810 </td>
   <td style="text-align:right;"> 97556700 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1324 </td>
   <td style="text-align:right;"> 2008 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1457730 </td>
   <td style="text-align:right;"> 1456870 </td>
   <td style="text-align:right;"> 1826580 </td>
   <td style="text-align:right;"> 11786600 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1325 </td>
   <td style="text-align:right;"> 2009 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1495420 </td>
   <td style="text-align:right;"> 1492040 </td>
   <td style="text-align:right;"> 2433300 </td>
   <td style="text-align:right;"> 46468300 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1326 </td>
   <td style="text-align:right;"> 2010 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1380600 </td>
   <td style="text-align:right;"> 1374330 </td>
   <td style="text-align:right;"> 2577450 </td>
   <td style="text-align:right;"> 86071200 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1327 </td>
   <td style="text-align:right;"> 2011 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1216340 </td>
   <td style="text-align:right;"> 1201580 </td>
   <td style="text-align:right;"> 2007830 </td>
   <td style="text-align:right;"> 202457000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1328 </td>
   <td style="text-align:right;"> 2012 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1370300 </td>
   <td style="text-align:right;"> 1353670 </td>
   <td style="text-align:right;"> 1857780 </td>
   <td style="text-align:right;"> 228170000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1329 </td>
   <td style="text-align:right;"> 2013 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1695430 </td>
   <td style="text-align:right;"> 1695250 </td>
   <td style="text-align:right;"> 1914900 </td>
   <td style="text-align:right;"> 2452510 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1330 </td>
   <td style="text-align:right;"> 2014 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1790520 </td>
   <td style="text-align:right;"> 1786460 </td>
   <td style="text-align:right;"> 2457000 </td>
   <td style="text-align:right;"> 55652700 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1331 </td>
   <td style="text-align:right;"> 2015 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1629480 </td>
   <td style="text-align:right;"> 1613420 </td>
   <td style="text-align:right;"> 3067990 </td>
   <td style="text-align:right;"> 220458000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1332 </td>
   <td style="text-align:right;"> 2016 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1591680 </td>
   <td style="text-align:right;"> 1567250 </td>
   <td style="text-align:right;"> 2434430 </td>
   <td style="text-align:right;"> 335175000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1333 </td>
   <td style="text-align:right;"> 2017 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1924560 </td>
   <td style="text-align:right;"> 1917300 </td>
   <td style="text-align:right;"> 2100330 </td>
   <td style="text-align:right;"> 99619900 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1334 </td>
   <td style="text-align:right;"> 2018 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2324930 </td>
   <td style="text-align:right;"> 2262040 </td>
   <td style="text-align:right;"> 2686920 </td>
   <td style="text-align:right;"> 862770000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1335 </td>
   <td style="text-align:right;"> 2019 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 3241680 </td>
   <td style="text-align:right;"> 3138230 </td>
   <td style="text-align:right;"> 3990880 </td>
   <td style="text-align:right;"> 1419210000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1336 </td>
   <td style="text-align:right;"> 2020 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 5615900 </td>
   <td style="text-align:right;"> 5614770 </td>
   <td style="text-align:right;"> 4015250 </td>
   <td style="text-align:right;"> 15552100 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1337 </td>
   <td style="text-align:right;"> 2021 </td>
   <td style="text-align:left;"> FORE </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 7713090 </td>
   <td style="text-align:right;"> 7708050 </td>
   <td style="text-align:right;"> 8063680 </td>
   <td style="text-align:right;"> 69167000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1338 </td>
   <td style="text-align:right;"> 2022 </td>
   <td style="text-align:left;"> FORE </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 7512020 </td>
   <td style="text-align:right;"> 7506950 </td>
   <td style="text-align:right;"> 14559700 </td>
   <td style="text-align:right;"> 69554800 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1339 </td>
   <td style="text-align:right;"> 2023 </td>
   <td style="text-align:left;"> FORE </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 6671280 </td>
   <td style="text-align:right;"> 6666210 </td>
   <td style="text-align:right;"> 12838900 </td>
   <td style="text-align:right;"> 69490000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1340 </td>
   <td style="text-align:right;"> 2024 </td>
   <td style="text-align:left;"> FORE </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 5619480 </td>
   <td style="text-align:right;"> 5614420 </td>
   <td style="text-align:right;"> 10736700 </td>
   <td style="text-align:right;"> 69382900 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1341 </td>
   <td style="text-align:right;"> 2025 </td>
   <td style="text-align:left;"> FORE </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 4656920 </td>
   <td style="text-align:right;"> 4651870 </td>
   <td style="text-align:right;"> 8812160 </td>
   <td style="text-align:right;"> 69240500 </td>
  </tr>
</tbody>
</table>

### Outputs Model `s1.4`

<table class=" lightable-paper lightable-hover table" style='color: black; font-family: "Arial Narrow", arial, helvetica, sans-serif; margin-left: auto; margin-right: auto; font-size: 9px; color: black; font-family: arial; width: auto !important; margin-left: auto; margin-right: auto;'>
<caption style="font-size: initial !important;">Main variables outputs from stock asssessment krill in WAP in `s1.4`</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:right;"> Yr </th>
   <th style="text-align:left;"> Era </th>
   <th style="text-align:right;"> Seas </th>
   <th style="text-align:right;"> Bio_all </th>
   <th style="text-align:right;"> Bio_smry </th>
   <th style="text-align:right;"> SpawnBio </th>
   <th style="text-align:right;"> Recruit_0 </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> 1305 </td>
   <td style="text-align:right;"> 1989 </td>
   <td style="text-align:left;"> VIRG </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1354540 </td>
   <td style="text-align:right;"> 1349660 </td>
   <td style="text-align:right;"> 2210920 </td>
   <td style="text-align:right;"> 66952200 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1306 </td>
   <td style="text-align:right;"> 1990 </td>
   <td style="text-align:left;"> INIT </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 925937 </td>
   <td style="text-align:right;"> 921186 </td>
   <td style="text-align:right;"> 1367470 </td>
   <td style="text-align:right;"> 65178600 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1307 </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 925937 </td>
   <td style="text-align:right;"> 921186 </td>
   <td style="text-align:right;"> 1367470 </td>
   <td style="text-align:right;"> 65178600 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1308 </td>
   <td style="text-align:right;"> 1992 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1012370 </td>
   <td style="text-align:right;"> 1007590 </td>
   <td style="text-align:right;"> 1539740 </td>
   <td style="text-align:right;"> 65688900 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1309 </td>
   <td style="text-align:right;"> 1993 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1082790 </td>
   <td style="text-align:right;"> 1077970 </td>
   <td style="text-align:right;"> 1679460 </td>
   <td style="text-align:right;"> 66030400 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1310 </td>
   <td style="text-align:right;"> 1994 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1139590 </td>
   <td style="text-align:right;"> 1134760 </td>
   <td style="text-align:right;"> 1789740 </td>
   <td style="text-align:right;"> 66264200 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1311 </td>
   <td style="text-align:right;"> 1995 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1184920 </td>
   <td style="text-align:right;"> 1180070 </td>
   <td style="text-align:right;"> 1878070 </td>
   <td style="text-align:right;"> 66432800 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1312 </td>
   <td style="text-align:right;"> 1996 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1220820 </td>
   <td style="text-align:right;"> 1215970 </td>
   <td style="text-align:right;"> 1948280 </td>
   <td style="text-align:right;"> 66556400 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1313 </td>
   <td style="text-align:right;"> 1997 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1249200 </td>
   <td style="text-align:right;"> 1244350 </td>
   <td style="text-align:right;"> 2003870 </td>
   <td style="text-align:right;"> 66648400 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1314 </td>
   <td style="text-align:right;"> 1998 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1266420 </td>
   <td style="text-align:right;"> 1266130 </td>
   <td style="text-align:right;"> 2046680 </td>
   <td style="text-align:right;"> 3933970 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1315 </td>
   <td style="text-align:right;"> 1999 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1216010 </td>
   <td style="text-align:right;"> 1215500 </td>
   <td style="text-align:right;"> 2071380 </td>
   <td style="text-align:right;"> 7024060 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1316 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1072540 </td>
   <td style="text-align:right;"> 1067770 </td>
   <td style="text-align:right;"> 2089420 </td>
   <td style="text-align:right;"> 65411200 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1317 </td>
   <td style="text-align:right;"> 2001 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 972011 </td>
   <td style="text-align:right;"> 956267 </td>
   <td style="text-align:right;"> 1743630 </td>
   <td style="text-align:right;"> 215989000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1318 </td>
   <td style="text-align:right;"> 2002 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1109210 </td>
   <td style="text-align:right;"> 1100090 </td>
   <td style="text-align:right;"> 1431580 </td>
   <td style="text-align:right;"> 125160000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1319 </td>
   <td style="text-align:right;"> 2003 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1429620 </td>
   <td style="text-align:right;"> 1429580 </td>
   <td style="text-align:right;"> 1495100 </td>
   <td style="text-align:right;"> 561097 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1320 </td>
   <td style="text-align:right;"> 2004 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1554480 </td>
   <td style="text-align:right;"> 1552980 </td>
   <td style="text-align:right;"> 2429710 </td>
   <td style="text-align:right;"> 20540100 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1321 </td>
   <td style="text-align:right;"> 2005 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1457100 </td>
   <td style="text-align:right;"> 1454260 </td>
   <td style="text-align:right;"> 2840910 </td>
   <td style="text-align:right;"> 39008600 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1322 </td>
   <td style="text-align:right;"> 2006 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1336990 </td>
   <td style="text-align:right;"> 1324330 </td>
   <td style="text-align:right;"> 2463950 </td>
   <td style="text-align:right;"> 173714000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1323 </td>
   <td style="text-align:right;"> 2007 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1281790 </td>
   <td style="text-align:right;"> 1274680 </td>
   <td style="text-align:right;"> 2002810 </td>
   <td style="text-align:right;"> 97556700 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1324 </td>
   <td style="text-align:right;"> 2008 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1457730 </td>
   <td style="text-align:right;"> 1456870 </td>
   <td style="text-align:right;"> 1826580 </td>
   <td style="text-align:right;"> 11786600 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1325 </td>
   <td style="text-align:right;"> 2009 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1495420 </td>
   <td style="text-align:right;"> 1492040 </td>
   <td style="text-align:right;"> 2433300 </td>
   <td style="text-align:right;"> 46468300 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1326 </td>
   <td style="text-align:right;"> 2010 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1380600 </td>
   <td style="text-align:right;"> 1374330 </td>
   <td style="text-align:right;"> 2577450 </td>
   <td style="text-align:right;"> 86071200 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1327 </td>
   <td style="text-align:right;"> 2011 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1216340 </td>
   <td style="text-align:right;"> 1201580 </td>
   <td style="text-align:right;"> 2007830 </td>
   <td style="text-align:right;"> 202457000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1328 </td>
   <td style="text-align:right;"> 2012 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1370300 </td>
   <td style="text-align:right;"> 1353670 </td>
   <td style="text-align:right;"> 1857780 </td>
   <td style="text-align:right;"> 228170000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1329 </td>
   <td style="text-align:right;"> 2013 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1695430 </td>
   <td style="text-align:right;"> 1695250 </td>
   <td style="text-align:right;"> 1914900 </td>
   <td style="text-align:right;"> 2452510 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1330 </td>
   <td style="text-align:right;"> 2014 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1790520 </td>
   <td style="text-align:right;"> 1786460 </td>
   <td style="text-align:right;"> 2457000 </td>
   <td style="text-align:right;"> 55652700 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1331 </td>
   <td style="text-align:right;"> 2015 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1629480 </td>
   <td style="text-align:right;"> 1613420 </td>
   <td style="text-align:right;"> 3067990 </td>
   <td style="text-align:right;"> 220458000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1332 </td>
   <td style="text-align:right;"> 2016 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1591680 </td>
   <td style="text-align:right;"> 1567250 </td>
   <td style="text-align:right;"> 2434430 </td>
   <td style="text-align:right;"> 335175000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1333 </td>
   <td style="text-align:right;"> 2017 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1924560 </td>
   <td style="text-align:right;"> 1917300 </td>
   <td style="text-align:right;"> 2100330 </td>
   <td style="text-align:right;"> 99619900 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1334 </td>
   <td style="text-align:right;"> 2018 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2324930 </td>
   <td style="text-align:right;"> 2262040 </td>
   <td style="text-align:right;"> 2686920 </td>
   <td style="text-align:right;"> 862770000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1335 </td>
   <td style="text-align:right;"> 2019 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 3241680 </td>
   <td style="text-align:right;"> 3138230 </td>
   <td style="text-align:right;"> 3990880 </td>
   <td style="text-align:right;"> 1419210000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1336 </td>
   <td style="text-align:right;"> 2020 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 5615900 </td>
   <td style="text-align:right;"> 5614770 </td>
   <td style="text-align:right;"> 4015250 </td>
   <td style="text-align:right;"> 15552100 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1337 </td>
   <td style="text-align:right;"> 2021 </td>
   <td style="text-align:left;"> FORE </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 7713090 </td>
   <td style="text-align:right;"> 7708050 </td>
   <td style="text-align:right;"> 8063680 </td>
   <td style="text-align:right;"> 69167000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1338 </td>
   <td style="text-align:right;"> 2022 </td>
   <td style="text-align:left;"> FORE </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 7512020 </td>
   <td style="text-align:right;"> 7506950 </td>
   <td style="text-align:right;"> 14559700 </td>
   <td style="text-align:right;"> 69554800 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1339 </td>
   <td style="text-align:right;"> 2023 </td>
   <td style="text-align:left;"> FORE </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 6671280 </td>
   <td style="text-align:right;"> 6666210 </td>
   <td style="text-align:right;"> 12838900 </td>
   <td style="text-align:right;"> 69490000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1340 </td>
   <td style="text-align:right;"> 2024 </td>
   <td style="text-align:left;"> FORE </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 5619480 </td>
   <td style="text-align:right;"> 5614420 </td>
   <td style="text-align:right;"> 10736700 </td>
   <td style="text-align:right;"> 69382900 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1341 </td>
   <td style="text-align:right;"> 2025 </td>
   <td style="text-align:left;"> FORE </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 4656920 </td>
   <td style="text-align:right;"> 4651870 </td>
   <td style="text-align:right;"> 8812160 </td>
   <td style="text-align:right;"> 69240500 </td>
  </tr>
</tbody>
</table>


## Comparison

### Comparison outputs betwwen scenarios



\begin{table}
\centering
\caption{\label{tab:unnamed-chunk-50}Comparision s1.1, s1.2, s1.3, s1.4}
\centering
\resizebox{\ifdim\width>\linewidth\linewidth\else\width\fi}{!}{
\begin{tabular}[t]{lrrrr}
\toprule
Label & s1.1 & s1.2 & s1.3 & s1.4\\
\midrule
TOTAL\_like & 1.29104e+03 & 2.59639e+04 & 1.59304e+03 & 2.51910e+04\\
Survey\_like & 4.12880e+02 & 2.33441e+04 & 6.45708e+02 & 2.33124e+04\\
Length\_comp\_like & 8.46103e+02 & 2.59308e+03 & 9.33128e+02 & 1.86049e+03\\
Parm\_priors\_like & 4.80866e-01 & 9.38168e+00 & 5.01968e+00 & 9.26159e+00\\
Recr\_Virgin\_billions & 1.07962e+02 & 4.15800e+02 & 6.69522e+01 & 3.70176e+02\\
\addlinespace
SR\_LN(R0) & 1.84973e+01 & 1.98457e+01 & 1.80195e+01 & 1.97295e+01\\
SR\_LN(R0)\_dev\_se & NA & NA & 5.00000e-01 & 5.00000e-01\\
SR\_LN(R0)\_dev\_autocorr & NA & NA & 0.00000e+00 & 0.00000e+00\\
SR\_LN(R0)\_DEVmult\_2000 & NA & NA & 4.34695e-02 & -1.04940e-01\\
SR\_LN(R0)\_DEVmult\_2001 & NA & NA & 1.89547e-01 & 1.21437e-01\\
\addlinespace
SR\_LN(R0)\_DEVmult\_2002 & NA & NA & 1.25269e-01 & 1.24922e-01\\
SR\_LN(R0)\_DEVmult\_2003 & NA & NA & -5.46661e-01 & -5.70889e-01\\
SR\_LN(R0)\_DEVmult\_2004 & NA & NA & -8.97766e-02 & -9.99512e-02\\
SR\_LN(R0)\_DEVmult\_2005 & NA & NA & -1.67758e-02 & -5.39612e-02\\
SR\_LN(R0)\_DEVmult\_2006 & NA & NA & 1.54264e-01 & 1.17783e-01\\
\addlinespace
SR\_LN(R0)\_DEVmult\_2007 & NA & NA & 8.98382e-02 & 4.17424e-02\\
SR\_LN(R0)\_DEVmult\_2008 & NA & NA & -1.54424e-01 & -1.77853e-01\\
SR\_LN(R0)\_DEVmult\_2009 & NA & NA & 3.66770e-03 & -6.51849e-02\\
SR\_LN(R0)\_DEVmult\_2010 & NA & NA & 7.30214e-02 & -4.09490e-02\\
SR\_LN(R0)\_DEVmult\_2011 & NA & NA & 1.77147e-01 & 1.98271e-02\\
\addlinespace
SR\_LN(R0)\_DEVmult\_2012 & NA & NA & 1.94671e-01 & 9.71856e-02\\
SR\_LN(R0)\_DEVmult\_2013 & NA & NA & -3.48419e-01 & -5.35570e-03\\
SR\_LN(R0)\_DEVmult\_2014 & NA & NA & 2.40483e-02 & 6.96487e-02\\
SR\_LN(R0)\_DEVmult\_2015 & NA & NA & 1.78475e-01 & 3.34469e-02\\
SR\_LN(R0)\_DEVmult\_2016 & NA & NA & 2.32444e-01 & 6.14681e-02\\
\addlinespace
SR\_LN(R0)\_DEVmult\_2017 & NA & NA & 7.81743e-02 & -4.48100e-03\\
SR\_LN(R0)\_DEVmult\_2018 & NA & NA & 3.39813e-01 & 1.99747e-01\\
SR\_LN(R0)\_DEVmult\_2019 & NA & NA & 3.77102e-01 & 1.82378e-01\\
SR\_LN(R0)\_DEVmult\_2020 & NA & NA & -1.68514e-01 & -3.38553e-01\\
SR\_BH\_steep & 8.50000e-01 & 8.50000e-01 & 8.50000e-01 & 8.50000e-01\\
\addlinespace
NatM\_uniform\_Fem\_GP\_1 & 2.70000e-01 & 2.70000e-01 & 2.70000e-01 & 2.70000e-01\\
L\_at\_Amax\_Fem\_GP\_1 & 5.00000e+00 & 5.00000e+00 & 5.00000e+00 & 5.00000e+00\\
VonBert\_K\_Fem\_GP\_1 & 4.70000e-01 & 4.70000e-01 & 4.70000e-01 & 4.70000e-01\\
SSB\_Virgin & 3.56518e+06 & 2.21345e+06 & 2.21092e+06 & 2.03602e+06\\
Bratio\_2020 & 1.87968e+00 & 5.01969e-01 & 1.81610e+00 & 8.34203e-01\\
\addlinespace
SPRratio\_2020 & 1.44309e-01 & 1.20734e-01 & 1.76125e-01 & 1.04390e-01\\
\bottomrule
\end{tabular}}
\end{table}



Comparison between select models `Ref Model: No Env-Predator` and `S1.1 w/ Env and Predator data`



### Comparsion in sd long term time series

<img src="Figs/unnamed-chunk-53-1.jpeg" style="display: block; margin: auto;" />

### Autocorrelation in Recruit 

To evaluate the temporal correlation structure of krill recruitment under different model configurations, we performed an Autocorrelation Function (ACF) analysis. The ACF measures the correlation between observations at different time lags, helping to assess whether recruitment estimates exhibit persistence or randomness across time.

The analysis was conducted on recruitment estimates derived from four model scenarios:

A reference model without environmental or predator influences (Ref Model: No Env-Predator).
A model incorporating predator data (S1.1 w/ Predator data).
A model incorporating environmental data (S1.1 w/ Env data).
A model incorporating both environmental and predator data (S1.1 w/ Env and Predator data).
Each model's residuals were extracted, and the autocorrelation function (ACF) was computed for a time lag range of up to 15 years. The dashed blue lines in the plots represent the 95% confidence intervals, indicating the threshold beyond which correlation values are statistically significant. If autocorrelation values remain within this range, it suggests that the recruitment estimates behave as a random process with no significant dependence on past values. Conversely, autocorrelation values exceeding these bounds indicate recruitment persistence or cyclic patterns.

<img src="Figs/unnamed-chunk-54-1.jpeg" style="display: block; margin: auto;" />

The ACF plots indicate that the reference model (without environmental or predator data) exhibits weak but noticeable positive autocorrelation at certain lags, suggesting some degree of recruitment dependence over time. However, this autocorrelation does not appear strong or systematic.

The model incorporating only predator data shows a slight reduction in autocorrelation magnitude, suggesting that predator-driven recruitment variability may have captured part of the temporal structure in the data.

The model with only environmental data exhibits a further reduction in autocorrelation, implying that environmental variability explains a larger portion of recruitment trends than predator effects alone.

Finally, the model that includes both environmental and predator data presents the lowest autocorrelation values, with nearly all bars remaining within the confidence bounds. This suggests that incorporating both factors provides the most effective explanation of recruitment fluctuations, reducing unexplained temporal structure.

Overall, these results indicate that recruitment variability is at least partially driven by environmental and predator influences, and models integrating these factors provide more robust and independent recruitment estimates, minimizing systematic dependencies over time.

### Recruit deviation

<img src="Figs/unnamed-chunk-55-1.jpeg" style="display: block; margin: auto;" />



<img src="Figs/unnamed-chunk-56-1.jpeg" style="display: block; margin: auto;" />

### Platoons analisis

<img src="Figs/unnamed-chunk-57-1.jpeg" style="display: block; margin: auto;" />
### AKL

In a catch-at-length model like krill assessment the AKL matrix is modelled trought parametrization process

<div class="figure" style="text-align: center">
<img src="Figs/AKL-1.jpeg" alt="Representation of ALK Matrix to krill in 48.1" width="60%" />
<p class="caption">Representation of ALK Matrix to krill in 48.1</p>
</div>


\newpage

# REFERENCES
