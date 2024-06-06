---
title: "Integrated approach to modeling to krill population dynamics in Wester Antarctic Peninsula: spatial and ecosystem considerations"
subtitle: "Working Paper to be submitted in a CCAMLR EMM-WG 2024"
author: "Mardones, M; Cárdenas, C., Krüger, L., Santa Cruz, F."
date:  "06 June, 2024"
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




```
## [1] 16
```


```r
dir01 <- here("s01")  # agreggate data (no spatial diferences)
dir1 <- here("s1")  # Data strata flishery
dir2 <- here("s2")  # Same 9 with areas (SubStrata) as fleet. Dif size comoposition and dif CPUE and dif survey length and biomass data by strata
dir3 <- here("s3")  # whitout S-R
dir4 <- here("s4")  # 
dir5 <- here("s5")  # 
dir6 <- here("s6")  # 
dir7 <- here("s7")  # 2 set parametres EMM-2024/23 (Mardones)
dirtest <- here("test")
Figs <- here("Figs")  # S
```

# OVERVIEW

In a simple way, the core of Stock Synthesis is its population dynamics
model, which represents the dynamics of krill populations over time.
This model incorporates key biological, environmental and predator data
sources. The model is typically formulated using mathematical equations
that describe how these parameters interact to determine the abundance
and distribution of krill in the study area.

## Statistical model (SS3)

Stock Synthesis v.3.30.21 is a widely used software tool for assessing
fish and invertebrate populations, including krill (Euphausia superba)
in the Antarctic Peninsula region. The methodology employed by Stock
Synthesis involves a comprehensive and integrated approach, utilizing
various data sources and modeling techniques to estimate the main
population variables of krill in WAP.

The stock assesment model was configured using Stock Synthesis (SS3
hereafter)[SS3](https://vlab.noaa.gov/web/stock-synthesis) [@Methot2013;
@methot2020stock] with the most updated version (V.3.30.21). SS3 is a
structured age and size stock evaluation model, in the class of models
called *"Integrated stock evaluation analysis model"*. SS3 has a stock
population sub-model that simulates growth, maturity, fecundity,
recruitment, movement, and mortality processes, and observation
sub-models and expected values for different types of data. The model is
coded in `C++` with estimation parameters enabled by automatic
differentiation (ADMB) [@Fournier2012; @Methot2013]. The analysis of
results and outputs uses R tools and the graphical interface of the
*r4ss* and *ss3diags* library [@Taylor2019; @Winker2023].

By integrating data from multiple sources and considering spatial
heterogeneity, the assessment methodology using Stock Synthesis
v.3.30.21 provides a robust framework for evaluating the status of krill
populations in the Antarctic Peninsula region. This information is
essential for supporting management decisions aimed at ensuring the
sustainable use of krill resources in this ecologically sensitive area.

## Parametres

read files








<table class=" lightable-paper lightable-hover table" style='color: black; font-family: "Arial Narrow", arial, helvetica, sans-serif; width: auto !important; margin-left: auto; margin-right: auto; font-size: 9px; color: black; width: auto !important; margin-left: auto; margin-right: auto;'>
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
  <tr grouplength="1"><td colspan="5" style="border-bottom: 1px solid;"><strong>Mortalidad natural</strong></td></tr>
<tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Nat M </td>
   <td style="text-align:right;"> 0.20 </td>
   <td style="text-align:right;"> 0.50 </td>
   <td style="text-align:right;"> 0.400000 </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
  <tr grouplength="5"><td colspan="5" style="border-bottom: 1px solid;"><strong>Crecimiento</strong></td></tr>
<tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Lmin </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 3.00 </td>
   <td style="text-align:right;"> 1.000000 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Lmax </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 10.00 </td>
   <td style="text-align:right;"> 7.000000 </td>
   <td style="text-align:right;"> 4 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> VonBert K </td>
   <td style="text-align:right;"> 0.05 </td>
   <td style="text-align:right;"> 0.80 </td>
   <td style="text-align:right;"> 0.450000 </td>
   <td style="text-align:right;"> 4 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> CV young </td>
   <td style="text-align:right;"> 0.05 </td>
   <td style="text-align:right;"> 0.25 </td>
   <td style="text-align:right;"> 0.050000 </td>
   <td style="text-align:right;"> -3 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> CV old </td>
   <td style="text-align:right;"> 0.05 </td>
   <td style="text-align:right;"> 0.25 </td>
   <td style="text-align:right;"> 0.050000 </td>
   <td style="text-align:right;"> -3 </td>
  </tr>
  <tr grouplength="2"><td colspan="5" style="border-bottom: 1px solid;"><strong>Relación longitud-peso</strong></td></tr>
<tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Wt a </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 3.00 </td>
   <td style="text-align:right;"> 0.000005 </td>
   <td style="text-align:right;"> -3 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Wt b </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 4.00 </td>
   <td style="text-align:right;"> 3.346940 </td>
   <td style="text-align:right;"> -3 </td>
  </tr>
  <tr grouplength="2"><td colspan="5" style="border-bottom: 1px solid;"><strong>Ojiva de madurez</strong></td></tr>
<tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> L50% </td>
   <td style="text-align:right;"> 0.20 </td>
   <td style="text-align:right;"> 5.00 </td>
   <td style="text-align:right;"> 2.400000 </td>
   <td style="text-align:right;"> 4 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Mat slope </td>
   <td style="text-align:right;"> -3.00 </td>
   <td style="text-align:right;"> 3.00 </td>
   <td style="text-align:right;"> -0.250000 </td>
   <td style="text-align:right;"> 4 </td>
  </tr>
  <tr grouplength="5"><td colspan="5" style="border-bottom: 1px solid;"><strong>Relación stock-recluta</strong></td></tr>
<tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> SR_LN(R0) </td>
   <td style="text-align:right;"> 3.00 </td>
   <td style="text-align:right;"> 30.00 </td>
   <td style="text-align:right;"> 10.000000 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> SR_BH_steep </td>
   <td style="text-align:right;"> 0.20 </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 0.750000 </td>
   <td style="text-align:right;"> -4 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> SR_sigmaR </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 2.00 </td>
   <td style="text-align:right;"> 0.600000 </td>
   <td style="text-align:right;"> -4 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> SR_regime </td>
   <td style="text-align:right;"> -5.00 </td>
   <td style="text-align:right;"> 5.00 </td>
   <td style="text-align:right;"> 0.000000 </td>
   <td style="text-align:right;"> -4 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> SR_autocorr </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 0.000000 </td>
   <td style="text-align:right;"> -99 </td>
  </tr>
  <tr grouplength="2"><td colspan="5" style="border-bottom: 1px solid;"><strong>Capturabilidad</strong></td></tr>
<tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> LnQ_base_FISHERYBS(1) </td>
   <td style="text-align:right;"> -25.00 </td>
   <td style="text-align:right;"> 25.00 </td>
   <td style="text-align:right;"> -3.722310 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Q_extraSD_FISHERYBS(1) </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 0.000000 </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
  <tr grouplength="4"><td colspan="5" style="border-bottom: 1px solid;"><strong>Selectividad</strong></td></tr>
<tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> SizeSel_P_1_FISHERYBS(1) </td>
   <td style="text-align:right;"> 0.01 </td>
   <td style="text-align:right;"> 8.00 </td>
   <td style="text-align:right;"> 2.500000 </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> SizeSel_P_2_FISHERYBS(1) </td>
   <td style="text-align:right;"> 1.50 </td>
   <td style="text-align:right;"> 8.00 </td>
   <td style="text-align:right;"> 2.000000 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> SizeSel_P_1_FISHERYEI(2) </td>
   <td style="text-align:right;"> 0.01 </td>
   <td style="text-align:right;"> 8.00 </td>
   <td style="text-align:right;"> 2.500000 </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> SizeSel_P_2_FISHERYEI(2) </td>
   <td style="text-align:right;"> 1.50 </td>
   <td style="text-align:right;"> 8.00 </td>
   <td style="text-align:right;"> 2.000000 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SizeSel_P_1_FISHERYGS(3) </td>
   <td style="text-align:right;"> 0.01 </td>
   <td style="text-align:right;"> 8.00 </td>
   <td style="text-align:right;"> 2.500000 </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SizeSel_P_2_FISHERYGS(3) </td>
   <td style="text-align:right;"> 1.50 </td>
   <td style="text-align:right;"> 8.00 </td>
   <td style="text-align:right;"> 2.000000 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SizeSel_P_1_FISHERYJOIN(4) </td>
   <td style="text-align:right;"> 0.01 </td>
   <td style="text-align:right;"> 8.00 </td>
   <td style="text-align:right;"> 2.500000 </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SizeSel_P_2_FISHERYJOIN(4) </td>
   <td style="text-align:right;"> 1.50 </td>
   <td style="text-align:right;"> 8.00 </td>
   <td style="text-align:right;"> 2.000000 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SizeSel_P_1_FISHERYSSIW(5) </td>
   <td style="text-align:right;"> 0.01 </td>
   <td style="text-align:right;"> 8.00 </td>
   <td style="text-align:right;"> 2.500000 </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SizeSel_P_2_FISHERYSSIW(5) </td>
   <td style="text-align:right;"> 1.50 </td>
   <td style="text-align:right;"> 8.00 </td>
   <td style="text-align:right;"> 2.000000 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SizeSel_P_1_SURVEYBS(6) </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 7.00 </td>
   <td style="text-align:right;"> 2.000000 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SizeSel_P_2_SURVEYBS(6) </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 7.00 </td>
   <td style="text-align:right;"> 1.000000 </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SizeSel_P_1_SURVEYEI(7) </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 7.00 </td>
   <td style="text-align:right;"> 2.000000 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SizeSel_P_2_SURVEYEI(7) </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 7.00 </td>
   <td style="text-align:right;"> 1.000000 </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SizeSel_P_1_SURVEYGS(8) </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 7.00 </td>
   <td style="text-align:right;"> 2.000000 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SizeSel_P_2_SURVEYGS(8) </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 7.00 </td>
   <td style="text-align:right;"> 1.000000 </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SizeSel_P_1_SURVEYJOIN(9) </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 7.00 </td>
   <td style="text-align:right;"> 2.000000 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SizeSel_P_2_SURVEYJOIN(9) </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 7.00 </td>
   <td style="text-align:right;"> 1.000000 </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SizeSel_P_1_SURVEYSSIW(10) </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 7.00 </td>
   <td style="text-align:right;"> 2.000000 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SizeSel_P_2_SURVEYSSIW(10) </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 7.00 </td>
   <td style="text-align:right;"> 1.000000 </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SizeSel_P_1_PREDATOR(11) </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 7.00 </td>
   <td style="text-align:right;"> 0.500000 </td>
   <td style="text-align:right;"> -2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SizeSel_P_2_PREDATOR(11) </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 7.00 </td>
   <td style="text-align:right;"> 3.500000 </td>
   <td style="text-align:right;"> -3 </td>
  </tr>
</tbody>
</table>

## Scenarios

In Table 1 we have ten scenarios to test different option in modeling
about main consideration in assessment of krill population.

| Scenario | Description                                                                          |
|:------------:|:---------------------------------------------------------|
|   s01    | Fishery and Survey (AMLR) data, Predator, Environmental aggregate data in 48.1       |
|    s1    | Fishery and Survey (AMLR) data Length, Index, Catch by strata. Predator and Env data |
|    s2    | "s1" without S-R relation                                                            |
|    s3    | "s1" BH S-R relation weak (0.9 steepness)                                            |
|    s4    | "s1" BH S-R relation strong (0.6 steepness)                                          |
|    s5    | "s1" BH S-R relation mid-strong estimated                                            |
|    s6    | "s1" Ricker S-R relation estimated                                                   |
|    s7    | "s1" w/ set of parameters estimated in @EMM-204/32                                   |

## Run Models





Read outputs


# RESULTS

### Main Variables poulation

Total biomass





Data used en both (spatial and No spatial models)

<img src="index_files/figure-html/unnamed-chunk-12-1.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-2.jpeg" style="display: block; margin: auto;" />


Respecto a los valores y parametros biologicos modelados, los siguientes
graficos identifican los estimadores puntuales del recurso

<img src="index_files/figure-html/unnamed-chunk-13-1.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-13-2.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-13-3.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-13-4.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-13-5.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-13-6.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-13-7.jpeg" style="display: block; margin: auto;" />
<img src="index_files/figure-html/unnamed-chunk-14-1.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-14-2.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-14-3.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-14-4.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-14-5.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-14-6.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-14-7.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-14-8.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-14-9.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-14-10.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-14-11.jpeg" style="display: block; margin: auto;" />





## Diagnosis Base Model

Step to do a good practice in model diagnosis is;

-     1.  Convergence. Final convergence criteria is 1.0e-04

-     2.  Residual (visual and metrics)

-     3.  Retrospective analysis (Mhon Parameter)

-    4.  Likelihood profile

all this framework try to follow recommendations of @Carvalho2021b

## Residual consistency 


```
## 
##  Running Runs Test Diagnosics for Mean length 
## Plotting Residual Runs Tests
```

<img src="index_files/figure-html/unnamed-chunk-16-1.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-16-2.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-16-3.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-16-4.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-16-5.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-16-6.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-16-7.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-16-8.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-16-9.jpeg" style="display: block; margin: auto;" />

```
## 
## Runs Test stats by Mean length:
```

```
##          Index runs.p     test  sigma3.lo sigma3.hi type
## 1    FISHERYBS  0.500   Passed -0.1816665 0.1816665  len
## 2    FISHERYEI  0.145   Passed -0.2319052 0.2319052  len
## 3    FISHERYGS  0.338   Passed -0.1813395 0.1813395  len
## 4  FISHERYJOIN     NA Excluded         NA        NA  len
## 5  FISHERYSSIW  0.406   Passed -0.1476043 0.1476043  len
## 6     SURVEYBS  0.189   Passed -0.2452391 0.2452391  len
## 7     SURVEYEI  0.148   Passed -0.2482065 0.2482065  len
## 8     SURVEYGS  0.334   Passed -0.3723597 0.3723597  len
## 9   SURVEYJOIN  0.500   Passed -0.5749614 0.5749614  len
## 10    PREDATOR  0.599   Passed -0.3154527 0.3154527  len
```







```
## 
##  Running Runs Test Diagnosics for Index 
## Plotting Residual Runs Tests
```

<img src="index_files/figure-html/unnamed-chunk-18-1.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-18-2.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-18-3.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-18-4.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-18-5.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-18-6.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-18-7.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-18-8.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-18-9.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-18-10.jpeg" style="display: block; margin: auto;" />

```
## 
## Runs Test stats by Index:
```

```
##          Index runs.p     test  sigma3.lo sigma3.hi type
## 1    FISHERYBS  0.010   Failed -0.8521502 0.8521502 cpue
## 2    FISHERYEI  0.179   Passed -1.1048793 1.1048793 cpue
## 3    FISHERYGS  0.018   Failed -1.9450662 1.9450662 cpue
## 4  FISHERYJOIN  0.819   Passed -1.9136749 1.9136749 cpue
## 5  FISHERYSSIW  0.025   Failed -0.5893076 0.5893076 cpue
## 6     SURVEYBS  0.278   Passed -2.8964975 2.8964975 cpue
## 7     SURVEYEI  0.708   Passed -2.5384240 2.5384240 cpue
## 8     SURVEYGS  0.753   Passed -3.2473271 3.2473271 cpue
## 9   SURVEYJOIN  0.268   Passed -2.6879583 2.6879583 cpue
## 10  SURVEYSSIW     NA Excluded         NA        NA cpue
## 11    PREDATOR  0.002   Failed -0.7168626 0.7168626 cpue
```







```
## Plotting JABBA residual plot
```

<img src="index_files/figure-html/unnamed-chunk-21-1.jpeg" style="display: block; margin: auto;" />

```
## 
## RMSE stats by Index:
```

```
##    indices RMSE.perc nobs
## 1  FISHERY      44.7   21
## 2  SURVEY1      82.6   24
## 3 PREDATOR      25.8   41
## 4 Combined      52.1   86
```

```
## Plotting JABBA residual plot
```

<img src="index_files/figure-html/unnamed-chunk-21-2.jpeg" style="display: block; margin: auto;" />

```
## 
## RMSE stats by Index:
```

```
##        indices RMSE.perc nobs
## 1    FISHERYBS      54.3   18
## 2    FISHERYEI      40.7   20
## 3    FISHERYGS      72.8   14
## 4  FISHERYJOIN      65.6    6
## 5  FISHERYSSIW      33.8   21
## 6     SURVEYBS     102.9   21
## 7     SURVEYEI      80.5   18
## 8     SURVEYGS     111.5   20
## 9   SURVEYJOIN     108.4    8
## 10  SURVEYSSIW      52.6    2
## 11    PREDATOR      39.4   41
## 12    Combined      71.3  189
```

```
## Plotting JABBA residual plot
```

<img src="index_files/figure-html/unnamed-chunk-21-3.jpeg" style="display: block; margin: auto;" />

```
## 
## RMSE stats by Index:
```

```
##        indices RMSE.perc nobs
## 1    FISHERYBS      54.2   18
## 2    FISHERYEI      40.8   20
## 3    FISHERYGS      72.5   14
## 4  FISHERYJOIN      66.2    6
## 5  FISHERYSSIW      33.8   21
## 6     SURVEYBS     102.5   21
## 7     SURVEYEI      80.3   18
## 8     SURVEYGS     111.5   20
## 9   SURVEYJOIN     108.1    8
## 10  SURVEYSSIW      53.3    2
## 11    PREDATOR      39.4   41
## 12    Combined      71.2  189
```

```
## Plotting JABBA residual plot
```

<img src="index_files/figure-html/unnamed-chunk-21-4.jpeg" style="display: block; margin: auto;" />

```
## 
## RMSE stats by Index:
```

```
##        indices RMSE.perc nobs
## 1    FISHERYBS      54.2   18
## 2    FISHERYEI      40.8   20
## 3    FISHERYGS      72.5   14
## 4  FISHERYJOIN      66.2    6
## 5  FISHERYSSIW      33.8   21
## 6     SURVEYBS     102.5   21
## 7     SURVEYEI      80.3   18
## 8     SURVEYGS     111.5   20
## 9   SURVEYJOIN     108.1    8
## 10  SURVEYSSIW      53.3    2
## 11    PREDATOR      39.4   41
## 12    Combined      71.2  189
```

```
## Plotting JABBA residual plot
```

<img src="index_files/figure-html/unnamed-chunk-21-5.jpeg" style="display: block; margin: auto;" />

```
## 
## RMSE stats by Index:
```

```
##        indices RMSE.perc nobs
## 1    FISHERYBS      57.3   18
## 2    FISHERYEI      39.9   20
## 3    FISHERYGS      79.3   14
## 4  FISHERYJOIN      50.7    6
## 5  FISHERYSSIW      35.4   21
## 6     SURVEYBS     111.9   21
## 7     SURVEYEI      87.7   18
## 8     SURVEYGS     115.8   20
## 9   SURVEYJOIN     114.3    8
## 10  SURVEYSSIW      37.5    2
## 11    PREDATOR      39.4   41
## 12    Combined      74.9  189
```

```
## Plotting JABBA residual plot
```

<img src="index_files/figure-html/unnamed-chunk-21-6.jpeg" style="display: block; margin: auto;" />

```
## 
## RMSE stats by Index:
```

```
##        indices RMSE.perc nobs
## 1    FISHERYBS      71.4   18
## 2    FISHERYEI      46.5   20
## 3    FISHERYGS      98.4   14
## 4  FISHERYJOIN      39.6    6
## 5  FISHERYSSIW      48.0   21
## 6     SURVEYBS     118.7   20
## 7     SURVEYEI     101.1   18
## 8     SURVEYGS     110.3   19
## 9   SURVEYJOIN     136.3    8
## 10  SURVEYSSIW      14.5    2
## 11    PREDATOR      29.9   41
## 12    Combined      80.5  187
```

```
## Plotting JABBA residual plot
```

<img src="index_files/figure-html/unnamed-chunk-21-7.jpeg" style="display: block; margin: auto;" />

```
## 
## RMSE stats by Index:
```

```
##        indices RMSE.perc nobs
## 1    FISHERYBS      72.5   18
## 2    FISHERYEI      47.9   20
## 3    FISHERYGS     100.2   14
## 4  FISHERYJOIN      37.4    6
## 5  FISHERYSSIW      49.1   21
## 6     SURVEYBS     120.8   20
## 7     SURVEYEI     105.1   18
## 8     SURVEYGS     112.5   19
## 9   SURVEYJOIN     138.8    8
## 10  SURVEYSSIW      19.6    2
## 11    PREDATOR      39.4   41
## 12    Combined      83.1  187
```

```
## Plotting JABBA residual plot
```

<img src="index_files/figure-html/unnamed-chunk-21-8.jpeg" style="display: block; margin: auto;" />

```
## 
## RMSE stats by Index:
```

```
##        indices RMSE.perc nobs
## 1    FISHERYBS      56.2   18
## 2    FISHERYEI      40.0   20
## 3    FISHERYGS      77.3   14
## 4  FISHERYJOIN      53.6    6
## 5  FISHERYSSIW      34.7   21
## 6     SURVEYBS     109.2   21
## 7     SURVEYEI      86.5   18
## 8     SURVEYGS     115.0   20
## 9   SURVEYJOIN     112.2    8
## 10  SURVEYSSIW      42.7    2
## 11    PREDATOR      39.4   41
## 12    Combined      73.9  189
```


## Relationship Stock-Recruit



## Retrospective analysis

Los análisis retrospectivo, dan cuenta de diferencias de estimación
(sub - sobreestimación) en los patrones entre modelos evaluados.











<img src="index_files/figure-html/unnamed-chunk-27-1.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-27-2.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-27-3.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-27-4.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-27-5.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-27-6.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-27-7.jpeg" style="display: block; margin: auto;" />





## Hindcast Cross-Validation and prediction skill

Implementing the Hindcast Cross-Validation (HCxval) diagnostic in Stock
Synthesis requires the same model outputs generated by
`r4ss:SS_doRetro()`. As a robust measure of prediction skill, we
implemented the mean absolute scaled error (MASE). In brief, the MASE
score scales the mean absolute. Regarding (A MASE score \> 1 indicates
that the average model forecasts are worse than a random walk.
Conversely, a MASE score of 0.5 indicates that the model forecasts twice
as accurately as a naïve baseline prediction; thus, the model has
prediction skill.

<img src="index_files/figure-html/unnamed-chunk-29-1.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-29-2.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-29-3.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-29-4.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-29-5.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-29-6.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-29-7.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-29-8.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-29-9.jpeg" style="display: block; margin: auto;" />




## Kobe (status)



```
## 
##  starter.sso with Bratio: SSB/SSB0 and F: _abs_F 
## 
```

<img src="index_files/figure-html/unnamed-chunk-31-1.jpeg" style="display: block; margin: auto;" />



another



\begin{table}[H]
\centering
\caption{\label{tab:unnamed-chunk-34}Rho parameter in SSB model s01}
\centering
\begin{tabular}[t]{llrr}
\toprule
type & peel & Rho & ForcastRho\\
\midrule
SSB & 2019 & 4.509789 & 8.326964\\
SSB & 2018 & 10.338135 & 17.428334\\
SSB & 2017 & 3.196628 & 4.137175\\
SSB & 2016 & 5.813868 & 6.795591\\
SSB & 2015 & 2.625185 & 2.448968\\
\addlinespace
SSB & Combined & 5.296721 & 7.827407\\
\bottomrule
\end{tabular}
\end{table}

\begin{table}[H]
\centering
\caption{\label{tab:unnamed-chunk-34}Rho parameter in F model s01}
\centering
\begin{tabular}[t]{llrr}
\toprule
type & peel & Rho & ForcastRho\\
\midrule
F & 2019 & 0.4019133 & -0.0000373\\
F & 2018 & -0.7121151 & -0.8225786\\
F & 2017 & 0.6197296 & 0.2864178\\
F & 2016 & -0.8575338 & -0.8769841\\
F & 2015 & 1.0133559 & 0.7646734\\
\addlinespace
F & Combined & 0.0930700 & -0.1297017\\
\bottomrule
\end{tabular}
\end{table}

\begin{table}[H]
\centering
\caption{\label{tab:unnamed-chunk-34}Rho parameter in SSB model s1}
\centering
\begin{tabular}[t]{llrr}
\toprule
type & peel & Rho & ForcastRho\\
\midrule
SSB & 2019 & -0.7342780 & -0.7458262\\
SSB & 2018 & 1.0773073 & 1.0740867\\
SSB & 2017 & 1.1324387 & 1.0628622\\
SSB & 2016 & -0.9314696 & -0.9495751\\
SSB & 2015 & 0.0143851 & 0.0006834\\
\addlinespace
SSB & Combined & 0.1116767 & 0.0884462\\
\bottomrule
\end{tabular}
\end{table}

\begin{table}[H]
\centering
\caption{\label{tab:unnamed-chunk-34}Rho parameter in F model s1}
\centering
\begin{tabular}[t]{llrr}
\toprule
type & peel & Rho & ForcastRho\\
\midrule
F & 2019 & 3.0449792 & 3.3280459\\
F & 2018 & -0.3164207 & -0.2828047\\
F & 2017 & -0.3300691 & -0.2882840\\
F & 2016 & 21.0612735 & 30.1487123\\
F & 2015 & 0.0252787 & 0.1237112\\
\addlinespace
F & Combined & 4.6970083 & 6.6058762\\
\bottomrule
\end{tabular}
\end{table}

\begin{table}[H]
\centering
\caption{\label{tab:unnamed-chunk-34}Rho parameter in SSB model s2}
\centering
\begin{tabular}[t]{llrr}
\toprule
type & peel & Rho & ForcastRho\\
\midrule
SSB & 2019 & -0.7021212 & -0.7124965\\
SSB & 2018 & -0.7459423 & -0.7421169\\
SSB & 2017 & -0.4666246 & -0.4724862\\
SSB & 2016 & -0.9548791 & -0.9759169\\
SSB & 2015 & 237.0280889 & 232.6659425\\
\addlinespace
SSB & Combined & 46.8317044 & 45.9525852\\
\bottomrule
\end{tabular}
\end{table}

\begin{table}[H]
\centering
\caption{\label{tab:unnamed-chunk-34}Rho parameter in F model s2}
\centering
\begin{tabular}[t]{llrr}
\toprule
type & peel & Rho & ForcastRho\\
\midrule
F & 2019 & 2.5984341 & 2.8140975\\
F & 2018 & 3.1275956 & 3.3450672\\
F & 2017 & 1.0525800 & 1.2060771\\
F & 2016 & 35.6454947 & 70.7634181\\
F & 2015 & -0.9925648 & -0.9921405\\
\addlinespace
F & Combined & 8.2863079 & 15.4273039\\
\bottomrule
\end{tabular}
\end{table}

\begin{table}[H]
\centering
\caption{\label{tab:unnamed-chunk-34}Rho parameter in SSB model s3}
\centering
\begin{tabular}[t]{llrr}
\toprule
type & peel & Rho & ForcastRho\\
\midrule
SSB & 2019 & -0.7021212 & -0.7124965\\
SSB & 2018 & -0.7459423 & -0.7421169\\
SSB & 2017 & -0.4666246 & -0.4724862\\
SSB & 2016 & -0.9548791 & -0.9759169\\
SSB & 2015 & 237.0280889 & 232.6659425\\
\addlinespace
SSB & Combined & 46.8317044 & 45.9525852\\
\bottomrule
\end{tabular}
\end{table}

\begin{table}[H]
\centering
\caption{\label{tab:unnamed-chunk-34}Rho parameter in F model s3}
\centering
\begin{tabular}[t]{llrr}
\toprule
type & peel & Rho & ForcastRho\\
\midrule
F & 2019 & 2.5984341 & 2.8140975\\
F & 2018 & 3.1275956 & 3.3450672\\
F & 2017 & 1.0525800 & 1.2060771\\
F & 2016 & 35.6454947 & 70.7634181\\
F & 2015 & -0.9925648 & -0.9921405\\
\addlinespace
F & Combined & 8.2863079 & 15.4273039\\
\bottomrule
\end{tabular}
\end{table}

\begin{table}[H]
\centering
\caption{\label{tab:unnamed-chunk-34}Rho parameter in SSB model s4}
\centering
\begin{tabular}[t]{llrr}
\toprule
type & peel & Rho & ForcastRho\\
\midrule
SSB & 2019 & 15.2058682 & 15.8909531\\
SSB & 2018 & 6.4897765 & 6.3527518\\
SSB & 2017 & 0.7425434 & 0.8207574\\
SSB & 2016 & -0.3384086 & -0.3839870\\
SSB & 2015 & 2.3431054 & 2.6416770\\
\addlinespace
SSB & Combined & 4.8885770 & 5.0644304\\
\bottomrule
\end{tabular}
\end{table}

\begin{table}[H]
\centering
\caption{\label{tab:unnamed-chunk-34}Rho parameter in F model s4}
\centering
\begin{tabular}[t]{llrr}
\toprule
type & peel & Rho & ForcastRho\\
\midrule
F & 2019 & -0.9007255 & -0.8989871\\
F & 2018 & -0.8552130 & -0.8493289\\
F & 2017 & -0.3745545 & -0.3501075\\
F & 2016 & 1.3459804 & 1.4381330\\
F & 2015 & -0.6904536 & -0.6936131\\
\addlinespace
F & Combined & -0.2949932 & -0.2707807\\
\bottomrule
\end{tabular}
\end{table}

\begin{table}[H]
\centering
\caption{\label{tab:unnamed-chunk-34}Rho parameter in SSB model s5}
\centering
\begin{tabular}[t]{llrr}
\toprule
type & peel & Rho & ForcastRho\\
\midrule
SSB & 2019 & -0.0207541 & -0.0431084\\
SSB & 2018 & -0.6357467 & -0.6950685\\
SSB & 2017 & -0.1889217 & -0.3171198\\
SSB & 2016 & -0.3097383 & -0.3531028\\
SSB & 2015 & -0.3736358 & -0.3940944\\
\addlinespace
SSB & Combined & -0.3057593 & -0.3604988\\
\bottomrule
\end{tabular}
\end{table}

\begin{table}[H]
\centering
\caption{\label{tab:unnamed-chunk-34}Rho parameter in F model s5}
\centering
\begin{tabular}[t]{llrr}
\toprule
type & peel & Rho & ForcastRho\\
\midrule
F & 2019 & 0.0029924 & 0.0773224\\
F & 2018 & 0.5260910 & 0.9017474\\
F & 2017 & 0.2378430 & 0.5092305\\
F & 2016 & 0.1690848 & 0.4452645\\
F & 2015 & 0.1607843 & 0.3965503\\
\addlinespace
F & Combined & 0.2193591 & 0.4660230\\
\bottomrule
\end{tabular}
\end{table}

\begin{table}[H]
\centering
\caption{\label{tab:unnamed-chunk-34}Rho parameter in SSB model s6}
\centering
\begin{tabular}[t]{llrr}
\toprule
type & peel & Rho & ForcastRho\\
\midrule
SSB & 2019 & -0.9997909 & -0.9997689\\
SSB & 2018 & 0.3928776 & 0.3962100\\
SSB & 2017 & 0.0329058 & -0.0569819\\
SSB & 2016 & 0.0229911 & -0.0448413\\
SSB & 2015 & -0.0229126 & -0.0954036\\
\addlinespace
SSB & Combined & -0.1147858 & -0.1601572\\
\bottomrule
\end{tabular}
\end{table}

\begin{table}[H]
\centering
\caption{\label{tab:unnamed-chunk-34}Rho parameter in F model s6}
\centering
\begin{tabular}[t]{llrr}
\toprule
type & peel & Rho & ForcastRho\\
\midrule
F & 2019 & -0.9521691 & -0.9653539\\
F & 2018 & 0.1569053 & 0.2914685\\
F & 2017 & 0.0949931 & 0.2667731\\
F & 2016 & 0.0984891 & 0.3079502\\
F & 2015 & 0.0798716 & 0.2843993\\
\addlinespace
F & Combined & -0.1043820 & 0.0370475\\
\bottomrule
\end{tabular}
\end{table}

\begin{table}[H]
\centering
\caption{\label{tab:unnamed-chunk-34}Rho parameter in SSB model s7}
\centering
\begin{tabular}[t]{llrr}
\toprule
type & peel & Rho & ForcastRho\\
\midrule
SSB & 2019 & 5.7716173 & 5.9824690\\
SSB & 2018 & 0.0788580 & 0.0605044\\
SSB & 2017 & 1.2792026 & 1.4170139\\
SSB & 2016 & -0.7959879 & -0.8557903\\
SSB & 2015 & -0.7248527 & -0.7894464\\
\addlinespace
SSB & Combined & 1.1217675 & 1.1629501\\
\bottomrule
\end{tabular}
\end{table}

\begin{table}[H]
\centering
\caption{\label{tab:unnamed-chunk-34}Rho parameter in F model s7}
\centering
\begin{tabular}[t]{llrr}
\toprule
type & peel & Rho & ForcastRho\\
\midrule
F & 2019 & -0.8315056 & -0.8261288\\
F & 2018 & -0.0101992 & 0.0581418\\
F & 2017 & -0.5252922 & -0.5109121\\
F & 2016 & 5.2111879 & 8.0167688\\
F & 2015 & 4.0823330 & 5.2151694\\
\addlinespace
F & Combined & 1.5853048 & 2.3906078\\
\bottomrule
\end{tabular}
\end{table}

## Likelihood



<img src="index_files/figure-html/unnamed-chunk-36-1.jpeg" style="display: block; margin: auto;" />





## Convergence criteria

0.0001 final convergence criteria (e.g. 1.0e-04) 




## Outputs Model Base

<table class=" lightable-paper lightable-hover table" style='color: black; font-family: "Arial Narrow", arial, helvetica, sans-serif; margin-left: auto; margin-right: auto; font-size: 9px; color: black; width: auto !important; margin-left: auto; margin-right: auto;'>
<caption style="font-size: initial !important;">Main variables outputs from stock asssessment krill in WAP</caption>
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
   <td style="text-align:left;"> 1679 </td>
   <td style="text-align:right;"> 1976 </td>
   <td style="text-align:left;"> VIRG </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 3244530 </td>
   <td style="text-align:right;"> 3235450 </td>
   <td style="text-align:right;"> 1144730 </td>
   <td style="text-align:right;"> 1319640000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1680 </td>
   <td style="text-align:right;"> 1977 </td>
   <td style="text-align:left;"> INIT </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 3244530 </td>
   <td style="text-align:right;"> 3235450 </td>
   <td style="text-align:right;"> 1144730 </td>
   <td style="text-align:right;"> 1319640000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1681 </td>
   <td style="text-align:right;"> 1978 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 3249980 </td>
   <td style="text-align:right;"> 3235450 </td>
   <td style="text-align:right;"> 1144730 </td>
   <td style="text-align:right;"> 2112190000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1682 </td>
   <td style="text-align:right;"> 1979 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 3307530 </td>
   <td style="text-align:right;"> 3287650 </td>
   <td style="text-align:right;"> 1144730 </td>
   <td style="text-align:right;"> 2890610000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1683 </td>
   <td style="text-align:right;"> 1980 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 3450930 </td>
   <td style="text-align:right;"> 3441500 </td>
   <td style="text-align:right;"> 1144340 </td>
   <td style="text-align:right;"> 1371580000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1684 </td>
   <td style="text-align:right;"> 1981 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 3428230 </td>
   <td style="text-align:right;"> 3424240 </td>
   <td style="text-align:right;"> 1083240 </td>
   <td style="text-align:right;"> 580747000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1685 </td>
   <td style="text-align:right;"> 1982 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 3449600 </td>
   <td style="text-align:right;"> 3447050 </td>
   <td style="text-align:right;"> 1075260 </td>
   <td style="text-align:right;"> 371065000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1686 </td>
   <td style="text-align:right;"> 1983 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 3179940 </td>
   <td style="text-align:right;"> 3176410 </td>
   <td style="text-align:right;"> 1019690 </td>
   <td style="text-align:right;"> 512862000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1687 </td>
   <td style="text-align:right;"> 1984 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2974100 </td>
   <td style="text-align:right;"> 2963260 </td>
   <td style="text-align:right;"> 1027460 </td>
   <td style="text-align:right;"> 1575930000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1688 </td>
   <td style="text-align:right;"> 1985 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2862610 </td>
   <td style="text-align:right;"> 2858110 </td>
   <td style="text-align:right;"> 1096720 </td>
   <td style="text-align:right;"> 654349000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1689 </td>
   <td style="text-align:right;"> 1986 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2678740 </td>
   <td style="text-align:right;"> 2674570 </td>
   <td style="text-align:right;"> 1121100 </td>
   <td style="text-align:right;"> 606217000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1690 </td>
   <td style="text-align:right;"> 1987 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2338860 </td>
   <td style="text-align:right;"> 2331870 </td>
   <td style="text-align:right;"> 957885 </td>
   <td style="text-align:right;"> 1017320000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1691 </td>
   <td style="text-align:right;"> 1988 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2224460 </td>
   <td style="text-align:right;"> 2214040 </td>
   <td style="text-align:right;"> 851661 </td>
   <td style="text-align:right;"> 1514860000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1692 </td>
   <td style="text-align:right;"> 1989 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2115770 </td>
   <td style="text-align:right;"> 2098060 </td>
   <td style="text-align:right;"> 739424 </td>
   <td style="text-align:right;"> 2574280000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1693 </td>
   <td style="text-align:right;"> 1990 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2160480 </td>
   <td style="text-align:right;"> 2149170 </td>
   <td style="text-align:right;"> 676793 </td>
   <td style="text-align:right;"> 1645000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1694 </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2175200 </td>
   <td style="text-align:right;"> 2170750 </td>
   <td style="text-align:right;"> 638855 </td>
   <td style="text-align:right;"> 647486000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1695 </td>
   <td style="text-align:right;"> 1992 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2180870 </td>
   <td style="text-align:right;"> 2178150 </td>
   <td style="text-align:right;"> 574259 </td>
   <td style="text-align:right;"> 395134000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1696 </td>
   <td style="text-align:right;"> 1993 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2168580 </td>
   <td style="text-align:right;"> 2161130 </td>
   <td style="text-align:right;"> 560105 </td>
   <td style="text-align:right;"> 1082420000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1697 </td>
   <td style="text-align:right;"> 1994 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2244840 </td>
   <td style="text-align:right;"> 2233240 </td>
   <td style="text-align:right;"> 632549 </td>
   <td style="text-align:right;"> 1686260000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1698 </td>
   <td style="text-align:right;"> 1995 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2339890 </td>
   <td style="text-align:right;"> 2329540 </td>
   <td style="text-align:right;"> 738052 </td>
   <td style="text-align:right;"> 1505020000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1699 </td>
   <td style="text-align:right;"> 1996 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2448890 </td>
   <td style="text-align:right;"> 2442610 </td>
   <td style="text-align:right;"> 860906 </td>
   <td style="text-align:right;"> 913517000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1700 </td>
   <td style="text-align:right;"> 1997 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2521570 </td>
   <td style="text-align:right;"> 2517950 </td>
   <td style="text-align:right;"> 883197 </td>
   <td style="text-align:right;"> 526178000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1701 </td>
   <td style="text-align:right;"> 1998 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2508190 </td>
   <td style="text-align:right;"> 2504250 </td>
   <td style="text-align:right;"> 832332 </td>
   <td style="text-align:right;"> 573318000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1702 </td>
   <td style="text-align:right;"> 1999 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2462280 </td>
   <td style="text-align:right;"> 2447050 </td>
   <td style="text-align:right;"> 799843 </td>
   <td style="text-align:right;"> 2213040000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1703 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2520000 </td>
   <td style="text-align:right;"> 2504520 </td>
   <td style="text-align:right;"> 846772 </td>
   <td style="text-align:right;"> 2250720000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1704 </td>
   <td style="text-align:right;"> 2001 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2668140 </td>
   <td style="text-align:right;"> 2653410 </td>
   <td style="text-align:right;"> 916344 </td>
   <td style="text-align:right;"> 2141880000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1705 </td>
   <td style="text-align:right;"> 2002 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2855370 </td>
   <td style="text-align:right;"> 2850270 </td>
   <td style="text-align:right;"> 935110 </td>
   <td style="text-align:right;"> 741167000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1706 </td>
   <td style="text-align:right;"> 2003 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2985590 </td>
   <td style="text-align:right;"> 2978960 </td>
   <td style="text-align:right;"> 902888 </td>
   <td style="text-align:right;"> 965164000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1707 </td>
   <td style="text-align:right;"> 2004 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 3057050 </td>
   <td style="text-align:right;"> 3049840 </td>
   <td style="text-align:right;"> 879122 </td>
   <td style="text-align:right;"> 1048360000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1708 </td>
   <td style="text-align:right;"> 2005 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 3101830 </td>
   <td style="text-align:right;"> 3085190 </td>
   <td style="text-align:right;"> 914406 </td>
   <td style="text-align:right;"> 2418740000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1709 </td>
   <td style="text-align:right;"> 2006 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 3259220 </td>
   <td style="text-align:right;"> 3244510 </td>
   <td style="text-align:right;"> 1084860 </td>
   <td style="text-align:right;"> 2138280000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1710 </td>
   <td style="text-align:right;"> 2007 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 3330550 </td>
   <td style="text-align:right;"> 3322930 </td>
   <td style="text-align:right;"> 1158320 </td>
   <td style="text-align:right;"> 1108000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1711 </td>
   <td style="text-align:right;"> 2008 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 3435280 </td>
   <td style="text-align:right;"> 3423810 </td>
   <td style="text-align:right;"> 1197020 </td>
   <td style="text-align:right;"> 1666820000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1712 </td>
   <td style="text-align:right;"> 2009 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 3479050 </td>
   <td style="text-align:right;"> 3460490 </td>
   <td style="text-align:right;"> 1124160 </td>
   <td style="text-align:right;"> 2698050000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1713 </td>
   <td style="text-align:right;"> 2010 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 3589180 </td>
   <td style="text-align:right;"> 3569310 </td>
   <td style="text-align:right;"> 1104040 </td>
   <td style="text-align:right;"> 2888260000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1714 </td>
   <td style="text-align:right;"> 2011 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 3672680 </td>
   <td style="text-align:right;"> 3654360 </td>
   <td style="text-align:right;"> 1083760 </td>
   <td style="text-align:right;"> 2663620000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1715 </td>
   <td style="text-align:right;"> 2012 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 3988290 </td>
   <td style="text-align:right;"> 3982610 </td>
   <td style="text-align:right;"> 1205830 </td>
   <td style="text-align:right;"> 825836000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1716 </td>
   <td style="text-align:right;"> 2013 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 4136720 </td>
   <td style="text-align:right;"> 4127180 </td>
   <td style="text-align:right;"> 1254410 </td>
   <td style="text-align:right;"> 1386190000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1717 </td>
   <td style="text-align:right;"> 2014 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 4060520 </td>
   <td style="text-align:right;"> 4046150 </td>
   <td style="text-align:right;"> 1210280 </td>
   <td style="text-align:right;"> 2089470000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1718 </td>
   <td style="text-align:right;"> 2015 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 4025220 </td>
   <td style="text-align:right;"> 4013810 </td>
   <td style="text-align:right;"> 1254770 </td>
   <td style="text-align:right;"> 1659130000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1719 </td>
   <td style="text-align:right;"> 2016 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 3967690 </td>
   <td style="text-align:right;"> 3960880 </td>
   <td style="text-align:right;"> 1346260 </td>
   <td style="text-align:right;"> 989842000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1720 </td>
   <td style="text-align:right;"> 2017 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 3863280 </td>
   <td style="text-align:right;"> 3855110 </td>
   <td style="text-align:right;"> 1396420 </td>
   <td style="text-align:right;"> 1188290000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1721 </td>
   <td style="text-align:right;"> 2018 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 3689970 </td>
   <td style="text-align:right;"> 3682420 </td>
   <td style="text-align:right;"> 1373480 </td>
   <td style="text-align:right;"> 1098610000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1722 </td>
   <td style="text-align:right;"> 2019 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 3507920 </td>
   <td style="text-align:right;"> 3502770 </td>
   <td style="text-align:right;"> 1265680 </td>
   <td style="text-align:right;"> 748826000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1723 </td>
   <td style="text-align:right;"> 2020 </td>
   <td style="text-align:left;"> TIME </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 3346120 </td>
   <td style="text-align:right;"> 3343480 </td>
   <td style="text-align:right;"> 1234730 </td>
   <td style="text-align:right;"> 384541000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1724 </td>
   <td style="text-align:right;"> 2021 </td>
   <td style="text-align:left;"> FORE </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 3177260 </td>
   <td style="text-align:right;"> 3168120 </td>
   <td style="text-align:right;"> 1247410 </td>
   <td style="text-align:right;"> 1328760000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1725 </td>
   <td style="text-align:right;"> 2022 </td>
   <td style="text-align:left;"> FORE </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2968650 </td>
   <td style="text-align:right;"> 2959540 </td>
   <td style="text-align:right;"> 1193720 </td>
   <td style="text-align:right;"> 1324170000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1726 </td>
   <td style="text-align:right;"> 2023 </td>
   <td style="text-align:left;"> FORE </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2782530 </td>
   <td style="text-align:right;"> 2773490 </td>
   <td style="text-align:right;"> 1093730 </td>
   <td style="text-align:right;"> 1314540000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1727 </td>
   <td style="text-align:right;"> 2024 </td>
   <td style="text-align:left;"> FORE </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2674910 </td>
   <td style="text-align:right;"> 2665920 </td>
   <td style="text-align:right;"> 1020370 </td>
   <td style="text-align:right;"> 1306380000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1728 </td>
   <td style="text-align:right;"> 2025 </td>
   <td style="text-align:left;"> FORE </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2613310 </td>
   <td style="text-align:right;"> 2604390 </td>
   <td style="text-align:right;"> 944772 </td>
   <td style="text-align:right;"> 1296770000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> NA </td>
  </tr>
  <tr>
   <td style="text-align:left;"> NA.1 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> NA </td>
  </tr>
  <tr>
   <td style="text-align:left;"> NA.2 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> NA </td>
  </tr>
</tbody>
</table>

## Comparision outputs betwwen scenarios






\begin{table}
\centering
\caption{\label{tab:unnamed-chunk-42}Comparacion likelihood y parámetros s01, s1, s2, s3, s4, s5, s6 y s7}
\centering
\resizebox{\ifdim\width>\linewidth\linewidth\else\width\fi}{!}{
\begin{tabular}[t]{lrrrrrrrr}
\toprule
Label & s01 & s1 & s2 & s3 & s4 & s5 & s6 & s7\\
\midrule
TOTAL\_like & 786.986000 & 5598.010000 & 5598.550000 & 5598.550000 & 5520.910000 & 5.51002e+03 & 5.52762e+03 & 5526.910000\\
Survey\_like & 6.826170 & 35.826400 & 35.644400 & 35.644400 & 43.956300 & 7.55391e+01 & 8.70720e+01 & 41.603500\\
Length\_comp\_like & 773.034000 & 5544.750000 & 5545.350000 & 5545.350000 & 5449.940000 & 5.40542e+03 & 5.41755e+03 & 5455.200000\\
Parm\_priors\_like & 4.381280 & 8.491980 & 8.496400 & 8.496400 & 11.395800 & 9.82623e+00 & 8.31715e+00 & 10.781200\\
Recr\_Virgin\_billions & 1807.100000 & 1319.640000 & 1433.780000 & 1433.780000 & 421.301000 & 1.09212e+03 & 9.37786e+02 & 415.514000\\
\addlinespace
SR\_LN(R0) & 21.315000 & 21.000600 & 21.083600 & 21.083600 & 19.858900 & 2.08114e+01 & 2.06590e+01 & 19.845000\\
SR\_BH\_steep & 0.750000 & 0.750000 & 0.900000 & 0.900000 & 0.600000 & 2.00000e-01 & NA & 0.750000\\
NatM\_uniform\_Fem\_GP\_1 & 0.200000 & 0.200000 & 0.200000 & 0.200000 & 0.200000 & 2.00000e-01 & 2.00000e-01 & 0.200002\\
L\_at\_Amax\_Fem\_GP\_1 & 5.602860 & 5.505070 & 5.504660 & 5.504660 & 5.390460 & 5.46459e+00 & 5.52755e+00 & 5.388550\\
VonBert\_K\_Fem\_GP\_1 & 0.228099 & 0.246238 & 0.246077 & 0.246077 & 0.303792 & 2.63098e-01 & 2.46561e-01 & 0.303601\\
\addlinespace
SSB\_Virgin\_thousand\_mt & 329.118000 & 1144.730000 & 1241.810000 & 1241.810000 & 464.263000 & 2.01123e+03 & 8.42907e+02 & 456.256000\\
Bratio\_2020 & 0.109152 & 1.078620 & 1.126930 & 1.126930 & 0.422269 & 6.02531e-02 & 5.12443e-02 & 0.532341\\
SPRratio\_2020 & 4.799030 & 0.514616 & 0.459701 & 0.459701 & 2.104990 & 3.37645e+00 & 3.77571e+00 & 1.842100\\
\bottomrule
\end{tabular}}
\end{table}

comparision between select models `No spatial`and `Spatial implicit` and `Spatial W/ new set parametres`



comparision between select models `Old Paramters` and `New Parameters WG SAM 2024/23`



## Comparsion in sd long term time series

<img src="index_files/figure-html/unnamed-chunk-45-1.jpeg" style="display: block; margin: auto;" />

## Autocorrelation in Recruit and Biomas

<img src="index_files/figure-html/unnamed-chunk-46-1.jpeg" style="display: block; margin: auto;" />

## Recruit deviation

<img src="index_files/figure-html/unnamed-chunk-47-1.jpeg" style="display: block; margin: auto;" />


\newpage

# REFERENCES
