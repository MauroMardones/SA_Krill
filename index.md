---
title: "Integrated approach to modeling to krill population dynamics in Wester Antarctic Peninsula: spatial and ecosystem considerations"
subtitle: "Working Paper to be submitted in a CCAMLR EMM-WG 2024"
author: "Mardones, M; Cárdenas, C., Krüger, L., Santa Cruz, F."
date:  "04 June, 2024"
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





\begin{table}[ht!]
\centering\centering
\caption{\label{tab:unnamed-chunk-5}\label{Tab1}Input parameters for the initial SS3 model of krill. Each parameter line contains a minimum value (LO), maximum value (HI), and initial value (INIT). If the phase (PHASE) for the parameter is negative, the parameter is fixed as input}
\centering
\fontsize{9}{11}\selectfont
\begin{tabular}[t]{lrrrr}
\toprule
  & LO & HI & INIT & PHASE\\
\midrule
\addlinespace[0.3em]
\multicolumn{5}{l}{\textbf{Mortalidad natural}}\\
\hspace{1em}\cellcolor{gray!10}{Nat M} & \cellcolor{gray!10}{0.20} & \cellcolor{gray!10}{0.50} & \cellcolor{gray!10}{0.400000} & \cellcolor{gray!10}{3}\\
\addlinespace[0.3em]
\multicolumn{5}{l}{\textbf{Crecimiento}}\\
\hspace{1em}Lmin & 0.00 & 3.00 & 1.000000 & 2\\
\hspace{1em}\cellcolor{gray!10}{Lmax} & \cellcolor{gray!10}{1.00} & \cellcolor{gray!10}{10.00} & \cellcolor{gray!10}{7.000000} & \cellcolor{gray!10}{4}\\
\hspace{1em}VonBert K & 0.05 & 0.80 & 0.450000 & 4\\
\hspace{1em}\cellcolor{gray!10}{CV young} & \cellcolor{gray!10}{0.05} & \cellcolor{gray!10}{0.25} & \cellcolor{gray!10}{0.050000} & \cellcolor{gray!10}{-3}\\
\hspace{1em}CV old & 0.05 & 0.25 & 0.050000 & -3\\
\addlinespace[0.3em]
\multicolumn{5}{l}{\textbf{Relación longitud-peso}}\\
\hspace{1em}\cellcolor{gray!10}{Wt a} & \cellcolor{gray!10}{0.00} & \cellcolor{gray!10}{3.00} & \cellcolor{gray!10}{0.000005} & \cellcolor{gray!10}{-3}\\
\hspace{1em}Wt b & 1.00 & 4.00 & 3.346940 & -3\\
\addlinespace[0.3em]
\multicolumn{5}{l}{\textbf{Ojiva de madurez}}\\
\hspace{1em}\cellcolor{gray!10}{L50\%} & \cellcolor{gray!10}{0.20} & \cellcolor{gray!10}{5.00} & \cellcolor{gray!10}{2.400000} & \cellcolor{gray!10}{4}\\
\hspace{1em}Mat slope & -3.00 & 3.00 & -0.250000 & 4\\
\addlinespace[0.3em]
\multicolumn{5}{l}{\textbf{Relación stock-recluta}}\\
\hspace{1em}\cellcolor{gray!10}{SR\_LN(R0)} & \cellcolor{gray!10}{3.00} & \cellcolor{gray!10}{30.00} & \cellcolor{gray!10}{10.000000} & \cellcolor{gray!10}{1}\\
\hspace{1em}SR\_BH\_steep & 0.20 & 1.00 & 0.750000 & -4\\
\hspace{1em}\cellcolor{gray!10}{SR\_sigmaR} & \cellcolor{gray!10}{0.00} & \cellcolor{gray!10}{2.00} & \cellcolor{gray!10}{0.600000} & \cellcolor{gray!10}{-4}\\
\hspace{1em}SR\_regime & -5.00 & 5.00 & 0.000000 & -4\\
\hspace{1em}\cellcolor{gray!10}{SR\_autocorr} & \cellcolor{gray!10}{0.00} & \cellcolor{gray!10}{0.00} & \cellcolor{gray!10}{0.000000} & \cellcolor{gray!10}{-99}\\
\addlinespace[0.3em]
\multicolumn{5}{l}{\textbf{Capturabilidad}}\\
\hspace{1em}LnQ\_base\_FISHERYBS(1) & -25.00 & 25.00 & -3.722310 & 1\\
\hspace{1em}\cellcolor{gray!10}{Q\_extraSD\_FISHERYBS(1)} & \cellcolor{gray!10}{0.00} & \cellcolor{gray!10}{1.00} & \cellcolor{gray!10}{0.000000} & \cellcolor{gray!10}{3}\\
\addlinespace[0.3em]
\multicolumn{5}{l}{\textbf{Selectividad}}\\
\hspace{1em}SizeSel\_P\_1\_FISHERYBS(1) & 0.01 & 8.00 & 2.500000 & 3\\
\hspace{1em}\cellcolor{gray!10}{SizeSel\_P\_2\_FISHERYBS(1)} & \cellcolor{gray!10}{1.50} & \cellcolor{gray!10}{8.00} & \cellcolor{gray!10}{2.000000} & \cellcolor{gray!10}{2}\\
\hspace{1em}SizeSel\_P\_1\_FISHERYEI(2) & 0.01 & 8.00 & 2.500000 & 3\\
\hspace{1em}\cellcolor{gray!10}{SizeSel\_P\_2\_FISHERYEI(2)} & \cellcolor{gray!10}{1.50} & \cellcolor{gray!10}{8.00} & \cellcolor{gray!10}{2.000000} & \cellcolor{gray!10}{2}\\
SizeSel\_P\_1\_FISHERYGS(3) & 0.01 & 8.00 & 2.500000 & 3\\
\cellcolor{gray!10}{SizeSel\_P\_2\_FISHERYGS(3)} & \cellcolor{gray!10}{1.50} & \cellcolor{gray!10}{8.00} & \cellcolor{gray!10}{2.000000} & \cellcolor{gray!10}{2}\\
SizeSel\_P\_1\_FISHERYJOIN(4) & 0.01 & 8.00 & 2.500000 & 3\\
\cellcolor{gray!10}{SizeSel\_P\_2\_FISHERYJOIN(4)} & \cellcolor{gray!10}{1.50} & \cellcolor{gray!10}{8.00} & \cellcolor{gray!10}{2.000000} & \cellcolor{gray!10}{2}\\
SizeSel\_P\_1\_FISHERYSSIW(5) & 0.01 & 8.00 & 2.500000 & 3\\
\cellcolor{gray!10}{SizeSel\_P\_2\_FISHERYSSIW(5)} & \cellcolor{gray!10}{1.50} & \cellcolor{gray!10}{8.00} & \cellcolor{gray!10}{2.000000} & \cellcolor{gray!10}{2}\\
SizeSel\_P\_1\_SURVEYBS(6) & 1.00 & 7.00 & 2.000000 & 2\\
\cellcolor{gray!10}{SizeSel\_P\_2\_SURVEYBS(6)} & \cellcolor{gray!10}{1.00} & \cellcolor{gray!10}{7.00} & \cellcolor{gray!10}{1.000000} & \cellcolor{gray!10}{3}\\
SizeSel\_P\_1\_SURVEYEI(7) & 1.00 & 7.00 & 2.000000 & 2\\
\cellcolor{gray!10}{SizeSel\_P\_2\_SURVEYEI(7)} & \cellcolor{gray!10}{1.00} & \cellcolor{gray!10}{7.00} & \cellcolor{gray!10}{1.000000} & \cellcolor{gray!10}{3}\\
SizeSel\_P\_1\_SURVEYGS(8) & 1.00 & 7.00 & 2.000000 & 2\\
\cellcolor{gray!10}{SizeSel\_P\_2\_SURVEYGS(8)} & \cellcolor{gray!10}{1.00} & \cellcolor{gray!10}{7.00} & \cellcolor{gray!10}{1.000000} & \cellcolor{gray!10}{3}\\
SizeSel\_P\_1\_SURVEYJOIN(9) & 1.00 & 7.00 & 2.000000 & 2\\
\cellcolor{gray!10}{SizeSel\_P\_2\_SURVEYJOIN(9)} & \cellcolor{gray!10}{1.00} & \cellcolor{gray!10}{7.00} & \cellcolor{gray!10}{1.000000} & \cellcolor{gray!10}{3}\\
SizeSel\_P\_1\_SURVEYSSIW(10) & 1.00 & 7.00 & 2.000000 & 2\\
\cellcolor{gray!10}{SizeSel\_P\_2\_SURVEYSSIW(10)} & \cellcolor{gray!10}{1.00} & \cellcolor{gray!10}{7.00} & \cellcolor{gray!10}{1.000000} & \cellcolor{gray!10}{3}\\
SizeSel\_P\_1\_PREDATOR(11) & 0.00 & 7.00 & 0.500000 & -2\\
\cellcolor{gray!10}{SizeSel\_P\_2\_PREDATOR(11)} & \cellcolor{gray!10}{1.00} & \cellcolor{gray!10}{7.00} & \cellcolor{gray!10}{3.500000} & \cellcolor{gray!10}{-3}\\
\bottomrule
\end{tabular}
\end{table}

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

<img src="index_files/figure-html/unnamed-chunk-9-1.jpeg" style="display: block; margin: auto;" />



Data used en both (spatial and No spatial models)

<img src="index_files/figure-html/unnamed-chunk-11-1.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-11-2.jpeg" style="display: block; margin: auto;" />


Respecto a los valores y parametros biologicos modelados, los siguientes
graficos identifican los estimadores puntuales del recurso

<img src="index_files/figure-html/unnamed-chunk-12-1.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-2.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-3.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-4.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-5.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-6.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-7.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-8.jpeg" style="display: block; margin: auto;" />





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

<img src="index_files/figure-html/unnamed-chunk-14-1.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-14-2.jpeg" style="display: block; margin: auto;" />

```
## 
## Runs Test stats by Mean length:
```

```
##     Index runs.p   test  sigma3.lo sigma3.hi type
## 1 FISHERY  0.709 Passed -0.2430108 0.2430108  len
## 2 SURVEY1  0.254 Passed -0.2548105 0.2548105  len
```

```
## 
##  Running Runs Test Diagnosics for Mean length 
## Plotting Residual Runs Tests
```

<img src="index_files/figure-html/unnamed-chunk-14-3.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-14-4.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-14-5.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-14-6.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-14-7.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-14-8.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-14-9.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-14-10.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-14-11.jpeg" style="display: block; margin: auto;" />

```
## 
## Runs Test stats by Mean length:
```

```
##          Index runs.p     test  sigma3.lo sigma3.hi type
## 1    FISHERYBS  0.500   Passed -0.1816665 0.1816665  len
## 2    FISHERYEI  0.145   Passed -0.2319052 0.2319052  len
## 3    FISHERYGS  0.338   Passed -0.1813394 0.1813394  len
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
##  Running Runs Test Diagnosics for Mean length 
## Plotting Residual Runs Tests
```

<img src="index_files/figure-html/unnamed-chunk-14-12.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-14-13.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-14-14.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-14-15.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-14-16.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-14-17.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-14-18.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-14-19.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-14-20.jpeg" style="display: block; margin: auto;" />

```
## 
## Runs Test stats by Mean length:
```

```
##          Index runs.p     test  sigma3.lo sigma3.hi type
## 1    FISHERYBS  0.500   Passed -0.1749806 0.1749806  len
## 2    FISHERYEI  0.145   Passed -0.2305068 0.2305068  len
## 3    FISHERYGS  0.179   Passed -0.1714212 0.1714212  len
## 4  FISHERYJOIN     NA Excluded         NA        NA  len
## 5  FISHERYSSIW  0.451   Passed -0.1443901 0.1443901  len
## 6     SURVEYBS  0.500   Passed -0.2456727 0.2456727  len
## 7     SURVEYEI  0.148   Passed -0.2462956 0.2462956  len
## 8     SURVEYGS  0.270   Passed -0.3662464 0.3662464  len
## 9   SURVEYJOIN  0.500   Passed -0.5589689 0.5589689  len
## 10    PREDATOR  0.662   Passed -0.3149107 0.3149107  len
```

```
## 
##  Running Runs Test Diagnosics for Mean length 
## Plotting Residual Runs Tests
```

<img src="index_files/figure-html/unnamed-chunk-14-21.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-14-22.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-14-23.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-14-24.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-14-25.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-14-26.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-14-27.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-14-28.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-14-29.jpeg" style="display: block; margin: auto;" />

```
## 
## Runs Test stats by Mean length:
```

```
##          Index runs.p     test  sigma3.lo sigma3.hi type
## 1    FISHERYBS  0.500   Passed -0.1818845 0.1818845  len
## 2    FISHERYEI  0.145   Passed -0.2318971 0.2318971  len
## 3    FISHERYGS  0.338   Passed -0.1816864 0.1816864  len
## 4  FISHERYJOIN     NA Excluded         NA        NA  len
## 5  FISHERYSSIW  0.406   Passed -0.1476270 0.1476270  len
## 6     SURVEYBS  0.189   Passed -0.2453130 0.2453130  len
## 7     SURVEYEI  0.148   Passed -0.2482887 0.2482887  len
## 8     SURVEYGS  0.334   Passed -0.3725888 0.3725888  len
## 9   SURVEYJOIN  0.500   Passed -0.5752936 0.5752936  len
## 10    PREDATOR  0.599   Passed -0.3153551 0.3153551  len
```

```
## 
##  Running Runs Test Diagnosics for Mean length 
## Plotting Residual Runs Tests
```

<img src="index_files/figure-html/unnamed-chunk-14-30.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-14-31.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-14-32.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-14-33.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-14-34.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-14-35.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-14-36.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-14-37.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-14-38.jpeg" style="display: block; margin: auto;" />

```
## 
## Runs Test stats by Mean length:
```

```
##          Index runs.p     test  sigma3.lo sigma3.hi type
## 1    FISHERYBS  0.500   Passed -0.1737353 0.1737353  len
## 2    FISHERYEI  0.145   Passed -0.2304893 0.2304893  len
## 3    FISHERYGS  0.179   Passed -0.1694860 0.1694860  len
## 4  FISHERYJOIN     NA Excluded         NA        NA  len
## 5  FISHERYSSIW  0.451   Passed -0.1441670 0.1441670  len
## 6     SURVEYBS  0.500   Passed -0.2450065 0.2450065  len
## 7     SURVEYEI  0.148   Passed -0.2456669 0.2456669  len
## 8     SURVEYGS  0.270   Passed -0.3646529 0.3646529  len
## 9   SURVEYJOIN  0.500   Passed -0.5565613 0.5565613  len
## 10    PREDATOR  0.599   Passed -0.3158392 0.3158392  len
```

```
## 
##  Running Runs Test Diagnosics for Mean length 
## Plotting Residual Runs Tests
```

<img src="index_files/figure-html/unnamed-chunk-14-39.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-14-40.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-14-41.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-14-42.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-14-43.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-14-44.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-14-45.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-14-46.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-14-47.jpeg" style="display: block; margin: auto;" />

```
## 
## Runs Test stats by Mean length:
```

```
##          Index runs.p     test  sigma3.lo sigma3.hi type
## 1    FISHERYBS  0.842   Passed -0.1765162 0.1765162  len
## 2    FISHERYEI  0.145   Passed -0.2325618 0.2325618  len
## 3    FISHERYGS  0.338   Passed -0.1688385 0.1688385  len
## 4  FISHERYJOIN     NA Excluded         NA        NA  len
## 5  FISHERYSSIW  0.451   Passed -0.1476926 0.1476926  len
## 6     SURVEYBS  0.189   Passed -0.2403031 0.2403031  len
## 7     SURVEYEI  0.148   Passed -0.2460309 0.2460309  len
## 8     SURVEYGS  0.270   Passed -0.3664355 0.3664355  len
## 9   SURVEYJOIN  0.500   Passed -0.5667153 0.5667153  len
## 10    PREDATOR  0.662   Passed -0.3085015 0.3085015  len
```

```
## 
##  Running Runs Test Diagnosics for Mean length 
## Plotting Residual Runs Tests
```

<img src="index_files/figure-html/unnamed-chunk-14-48.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-14-49.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-14-50.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-14-51.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-14-52.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-14-53.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-14-54.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-14-55.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-14-56.jpeg" style="display: block; margin: auto;" />

```
## 
## Runs Test stats by Mean length:
```

```
##          Index runs.p     test  sigma3.lo sigma3.hi type
## 1    FISHERYBS  0.842   Passed -0.1596431 0.1596431  len
## 2    FISHERYEI  0.013   Failed -0.2265191 0.2265191  len
## 3    FISHERYGS  0.338   Passed -0.1506492 0.1506492  len
## 4  FISHERYJOIN     NA Excluded         NA        NA  len
## 5  FISHERYSSIW  0.451   Passed -0.1386304 0.1386304  len
## 6     SURVEYBS  0.500   Passed -0.2364697 0.2364697  len
## 7     SURVEYEI  0.415   Passed -0.2343651 0.2343651  len
## 8     SURVEYGS  0.270   Passed -0.3349930 0.3349930  len
## 9   SURVEYJOIN  0.500   Passed -0.5078385 0.5078385  len
## 10    PREDATOR  0.662   Passed -0.3134572 0.3134572  len
```

```
## 
##  Running Runs Test Diagnosics for Mean length 
## Plotting Residual Runs Tests
```

<img src="index_files/figure-html/unnamed-chunk-14-57.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-14-58.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-14-59.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-14-60.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-14-61.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-14-62.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-14-63.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-14-64.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-14-65.jpeg" style="display: block; margin: auto;" />

```
## 
## Runs Test stats by Mean length:
```

```
##          Index runs.p     test  sigma3.lo sigma3.hi type
## 1    FISHERYBS  0.842   Passed -0.1633150 0.1633150  len
## 2    FISHERYEI  0.013   Failed -0.2266033 0.2266033  len
## 3    FISHERYGS  0.179   Passed -0.1545744 0.1545744  len
## 4  FISHERYJOIN     NA Excluded         NA        NA  len
## 5  FISHERYSSIW  0.451   Passed -0.1390665 0.1390665  len
## 6     SURVEYBS  0.500   Passed -0.2401749 0.2401749  len
## 7     SURVEYEI  0.415   Passed -0.2367449 0.2367449  len
## 8     SURVEYGS  0.270   Passed -0.3409538 0.3409538  len
## 9   SURVEYJOIN  0.500   Passed -0.5164933 0.5164933  len
## 10    PREDATOR  0.662   Passed -0.3120771 0.3120771  len
```



```
## 
##  Running Runs Test Diagnosics for Index 
## Plotting Residual Runs Tests
```

<img src="index_files/figure-html/unnamed-chunk-15-1.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-15-2.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-15-3.jpeg" style="display: block; margin: auto;" />

```
## 
## Runs Test stats by Index:
```

```
##      Index runs.p   test  sigma3.lo sigma3.hi type
## 1  FISHERY  0.010 Failed -0.8900613 0.8900613 cpue
## 2  SURVEY1  0.210 Passed -2.2028219 2.2028219 cpue
## 3 PREDATOR  0.016 Failed -0.6844772 0.6844772 cpue
```

```
## 
##  Running Runs Test Diagnosics for Index 
## Plotting Residual Runs Tests
```

<img src="index_files/figure-html/unnamed-chunk-15-4.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-15-5.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-15-6.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-15-7.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-15-8.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-15-9.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-15-10.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-15-11.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-15-12.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-15-13.jpeg" style="display: block; margin: auto;" />

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
## 5  FISHERYSSIW  0.025   Failed -0.5893074 0.5893074 cpue
## 6     SURVEYBS  0.278   Passed -2.8964975 2.8964975 cpue
## 7     SURVEYEI  0.708   Passed -2.5384240 2.5384240 cpue
## 8     SURVEYGS  0.753   Passed -3.2473271 3.2473271 cpue
## 9   SURVEYJOIN  0.268   Passed -2.6879570 2.6879570 cpue
## 10  SURVEYSSIW     NA Excluded         NA        NA cpue
## 11    PREDATOR  0.002   Failed -0.7168626 0.7168626 cpue
```

```
## 
##  Running Runs Test Diagnosics for Index 
## Plotting Residual Runs Tests
```

<img src="index_files/figure-html/unnamed-chunk-15-14.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-15-15.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-15-16.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-15-17.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-15-18.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-15-19.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-15-20.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-15-21.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-15-22.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-15-23.jpeg" style="display: block; margin: auto;" />

```
## 
## Runs Test stats by Index:
```

```
##          Index runs.p     test  sigma3.lo sigma3.hi type
## 1    FISHERYBS  0.010   Failed -0.8485654 0.8485654 cpue
## 2    FISHERYEI  0.179   Passed -1.0976764 1.0976764 cpue
## 3    FISHERYGS  0.018   Failed -1.9477457 1.9477457 cpue
## 4  FISHERYJOIN  0.819   Passed -1.8811922 1.8811922 cpue
## 5  FISHERYSSIW  0.025   Failed -0.7126518 0.7126518 cpue
## 6     SURVEYBS  0.278   Passed -2.9021286 2.9021286 cpue
## 7     SURVEYEI  0.708   Passed -2.5417802 2.5417802 cpue
## 8     SURVEYGS  0.753   Passed -3.2584102 3.2584102 cpue
## 9   SURVEYJOIN  0.268   Passed -2.7096152 2.7096152 cpue
## 10  SURVEYSSIW     NA Excluded         NA        NA cpue
## 11    PREDATOR  0.002   Failed -0.7168626 0.7168626 cpue
```

```
## 
##  Running Runs Test Diagnosics for Index 
## Plotting Residual Runs Tests
```

<img src="index_files/figure-html/unnamed-chunk-15-24.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-15-25.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-15-26.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-15-27.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-15-28.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-15-29.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-15-30.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-15-31.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-15-32.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-15-33.jpeg" style="display: block; margin: auto;" />

```
## 
## Runs Test stats by Index:
```

```
##          Index runs.p     test  sigma3.lo sigma3.hi type
## 1    FISHERYBS  0.010   Failed -0.8518535 0.8518535 cpue
## 2    FISHERYEI  0.189   Passed -1.1052789 1.1052789 cpue
## 3    FISHERYGS  0.018   Failed -1.9441438 1.9441438 cpue
## 4  FISHERYJOIN  0.819   Passed -1.9225843 1.9225843 cpue
## 5  FISHERYSSIW  0.278   Passed -0.5881417 0.5881417 cpue
## 6     SURVEYBS  0.278   Passed -2.8966238 2.8966238 cpue
## 7     SURVEYEI  0.708   Passed -2.5402281 2.5402281 cpue
## 8     SURVEYGS  0.753   Passed -3.2458944 3.2458944 cpue
## 9   SURVEYJOIN  0.223   Passed -2.6801077 2.6801077 cpue
## 10  SURVEYSSIW     NA Excluded         NA        NA cpue
## 11    PREDATOR  0.002   Failed -0.7168626 0.7168626 cpue
```

```
## 
##  Running Runs Test Diagnosics for Index 
## Plotting Residual Runs Tests
```

<img src="index_files/figure-html/unnamed-chunk-15-34.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-15-35.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-15-36.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-15-37.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-15-38.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-15-39.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-15-40.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-15-41.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-15-42.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-15-43.jpeg" style="display: block; margin: auto;" />

```
## 
## Runs Test stats by Index:
```

```
##          Index runs.p     test  sigma3.lo sigma3.hi type
## 1    FISHERYBS  0.010   Failed -0.8504505 0.8504505 cpue
## 2    FISHERYEI  0.338   Passed -1.0946586 1.0946586 cpue
## 3    FISHERYGS  0.018   Failed -1.9625822 1.9625822 cpue
## 4  FISHERYJOIN  0.819   Passed -1.8235141 1.8235141 cpue
## 5  FISHERYSSIW  0.025   Failed -0.7196705 0.7196705 cpue
## 6     SURVEYBS  0.278   Passed -2.9002439 2.9002439 cpue
## 7     SURVEYEI  0.708   Passed -2.5269653 2.5269653 cpue
## 8     SURVEYGS  0.753   Passed -3.2701935 3.2701935 cpue
## 9   SURVEYJOIN  0.268   Passed -2.7696303 2.7696303 cpue
## 10  SURVEYSSIW     NA Excluded         NA        NA cpue
## 11    PREDATOR  0.002   Failed -0.7168626 0.7168626 cpue
```

```
## 
##  Running Runs Test Diagnosics for Index 
## Plotting Residual Runs Tests
```

<img src="index_files/figure-html/unnamed-chunk-15-44.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-15-45.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-15-46.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-15-47.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-15-48.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-15-49.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-15-50.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-15-51.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-15-52.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-15-53.jpeg" style="display: block; margin: auto;" />

```
## 
## Runs Test stats by Index:
```

```
##          Index runs.p     test  sigma3.lo sigma3.hi type
## 1    FISHERYBS  0.010   Failed -0.9823692 0.9823692 cpue
## 2    FISHERYEI  0.338   Passed -1.1092727 1.1092727 cpue
## 3    FISHERYGS  0.014   Failed -2.2121292 2.2121292 cpue
## 4  FISHERYJOIN  0.921   Passed -1.5290698 1.5290698 cpue
## 5  FISHERYSSIW  0.133   Passed -0.9503127 0.9503127 cpue
## 6     SURVEYBS  0.118   Passed -3.0527981 3.0527981 cpue
## 7     SURVEYEI  0.314   Passed -2.7301363 2.7301363 cpue
## 8     SURVEYGS  0.148   Passed -3.4204450 3.4204450 cpue
## 9   SURVEYJOIN  0.268   Passed -3.3686127 3.3686127 cpue
## 10  SURVEYSSIW     NA Excluded         NA        NA cpue
## 11    PREDATOR  0.002   Failed -0.7168626 0.7168626 cpue
```

```
## 
##  Running Runs Test Diagnosics for Index 
## Plotting Residual Runs Tests
```

<img src="index_files/figure-html/unnamed-chunk-15-54.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-15-55.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-15-56.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-15-57.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-15-58.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-15-59.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-15-60.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-15-61.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-15-62.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-15-63.jpeg" style="display: block; margin: auto;" />

```
## 
## Runs Test stats by Index:
```

```
##          Index runs.p     test  sigma3.lo sigma3.hi type
## 1    FISHERYBS  0.008   Failed -0.9309271 0.9309271 cpue
## 2    FISHERYEI  0.323   Passed -1.0608336 1.0608336 cpue
## 3    FISHERYGS  0.014   Failed -2.1241689 2.1241689 cpue
## 4  FISHERYJOIN  0.819   Passed -1.5195611 1.5195611 cpue
## 5  FISHERYSSIW  0.022   Failed -0.9333423 0.9333423 cpue
## 6     SURVEYBS  0.333   Passed -2.9855109 2.9855109 cpue
## 7     SURVEYEI  0.314   Passed -2.5966236 2.5966236 cpue
## 8     SURVEYGS  0.148   Passed -3.4016378 3.4016378 cpue
## 9   SURVEYJOIN  0.268   Passed -3.1479524 3.1479524 cpue
## 10  SURVEYSSIW     NA Excluded         NA        NA cpue
## 11    PREDATOR  0.002   Failed -0.7168626 0.7168626 cpue
```

```
## 
##  Running Runs Test Diagnosics for Index 
## Plotting Residual Runs Tests
```

<img src="index_files/figure-html/unnamed-chunk-15-64.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-15-65.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-15-66.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-15-67.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-15-68.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-15-69.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-15-70.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-15-71.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-15-72.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-15-73.jpeg" style="display: block; margin: auto;" />

```
## 
## Runs Test stats by Index:
```

```
##          Index runs.p     test  sigma3.lo sigma3.hi type
## 1    FISHERYBS  0.010   Failed -0.8518955 0.8518955 cpue
## 2    FISHERYEI  0.338   Passed -1.0819948 1.0819948 cpue
## 3    FISHERYGS  0.117   Passed -1.9741674 1.9741674 cpue
## 4  FISHERYJOIN  0.819   Passed -1.7833087 1.7833087 cpue
## 5  FISHERYSSIW  0.025   Failed -0.7378487 0.7378487 cpue
## 6     SURVEYBS  0.278   Passed -2.9025232 2.9025232 cpue
## 7     SURVEYEI  0.708   Passed -2.5243079 2.5243079 cpue
## 8     SURVEYGS  0.753   Passed -3.2945195 3.2945195 cpue
## 9   SURVEYJOIN  0.268   Passed -2.8038689 2.8038689 cpue
## 10  SURVEYSSIW     NA Excluded         NA        NA cpue
## 11    PREDATOR  0.000   Failed -0.3745365 0.3745365 cpue
```





```
## Plotting JABBA residual plot
```

<img src="index_files/figure-html/unnamed-chunk-17-1.jpeg" style="display: block; margin: auto;" />

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

<img src="index_files/figure-html/unnamed-chunk-17-2.jpeg" style="display: block; margin: auto;" />

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

<img src="index_files/figure-html/unnamed-chunk-17-3.jpeg" style="display: block; margin: auto;" />

```
## 
## RMSE stats by Index:
```

```
##        indices RMSE.perc nobs
## 1    FISHERYBS      54.3   18
## 2    FISHERYEI      40.4   20
## 3    FISHERYGS      73.1   14
## 4  FISHERYJOIN      64.1    6
## 5  FISHERYSSIW      33.8   21
## 6     SURVEYBS     103.3   21
## 7     SURVEYEI      81.3   18
## 8     SURVEYGS     111.8   20
## 9   SURVEYJOIN     108.5    8
## 10  SURVEYSSIW      53.3    2
## 11    PREDATOR      39.4   41
## 12    Combined      71.5  189
```

```
## Plotting JABBA residual plot
```

<img src="index_files/figure-html/unnamed-chunk-17-4.jpeg" style="display: block; margin: auto;" />

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

<img src="index_files/figure-html/unnamed-chunk-17-5.jpeg" style="display: block; margin: auto;" />

```
## 
## RMSE stats by Index:
```

```
##        indices RMSE.perc nobs
## 1    FISHERYBS      55.4   18
## 2    FISHERYEI      39.6   20
## 3    FISHERYGS      75.5   14
## 4  FISHERYJOIN      59.8    6
## 5  FISHERYSSIW      34.0   21
## 6     SURVEYBS     106.4   21
## 7     SURVEYEI      82.7   18
## 8     SURVEYGS     112.4   20
## 9   SURVEYJOIN     110.8    8
## 10  SURVEYSSIW      47.1    2
## 11    PREDATOR      39.4   41
## 12    Combined      72.4  189
```

```
## Plotting JABBA residual plot
```

<img src="index_files/figure-html/unnamed-chunk-17-6.jpeg" style="display: block; margin: auto;" />

```
## 
## RMSE stats by Index:
```

```
##        indices RMSE.perc nobs
## 1    FISHERYBS      76.7   18
## 2    FISHERYEI      51.1   20
## 3    FISHERYGS     104.9   14
## 4  FISHERYJOIN      39.2    6
## 5  FISHERYSSIW      53.4   21
## 6     SURVEYBS     110.2   19
## 7     SURVEYEI     111.3   18
## 8     SURVEYGS     114.1   19
## 9   SURVEYJOIN     145.2    8
## 10  SURVEYSSIW      33.0    2
## 11    PREDATOR      39.4   41
## 12    Combined      84.2  186
```

```
## Plotting JABBA residual plot
```

<img src="index_files/figure-html/unnamed-chunk-17-7.jpeg" style="display: block; margin: auto;" />

```
## 
## RMSE stats by Index:
```

```
##        indices RMSE.perc nobs
## 1    FISHERYBS      63.7   18
## 2    FISHERYEI      43.0   20
## 3    FISHERYGS      89.0   14
## 4  FISHERYJOIN      38.2    6
## 5  FISHERYSSIW      41.3   21
## 6     SURVEYBS     108.8   20
## 7     SURVEYEI      96.8   18
## 8     SURVEYGS     123.7   20
## 9   SURVEYJOIN     125.4    8
## 10  SURVEYSSIW      11.0    2
## 11    PREDATOR      39.4   41
## 12    Combined      78.8  188
```

```
## Plotting JABBA residual plot
```

<img src="index_files/figure-html/unnamed-chunk-17-8.jpeg" style="display: block; margin: auto;" />

```
## 
## RMSE stats by Index:
```

```
##        indices RMSE.perc nobs
## 1    FISHERYBS      55.2   18
## 2    FISHERYEI      39.8   20
## 3    FISHERYGS      75.5   14
## 4  FISHERYJOIN      57.7    6
## 5  FISHERYSSIW      33.9   21
## 6     SURVEYBS     106.7   21
## 7     SURVEYEI      83.6   18
## 8     SURVEYGS     113.0   20
## 9   SURVEYJOIN     110.4    8
## 10  SURVEYSSIW      46.7    2
## 11    PREDATOR      24.5   41
## 12    Combined      71.2  189
```


## Relationship Stock-Recruit



## Retrospective analysis

Los análisis retrospectivo, dan cuenta de diferencias de estimación
(sub - sobreestimación) en los patrones entre modelos evaluados.











<img src="index_files/figure-html/unnamed-chunk-23-1.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-23-2.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-23-3.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-23-4.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-23-5.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-23-6.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-23-7.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-23-8.jpeg" style="display: block; margin: auto;" />





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

<img src="index_files/figure-html/unnamed-chunk-25-1.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-25-2.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-25-3.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-25-4.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-25-5.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-25-6.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-25-7.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-25-8.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-25-9.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-25-10.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-25-11.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-25-12.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-25-13.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-25-14.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-25-15.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-25-16.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-25-17.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-25-18.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-25-19.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-25-20.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-25-21.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-25-22.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-25-23.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-25-24.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-25-25.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-25-26.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-25-27.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-25-28.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-25-29.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-25-30.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-25-31.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-25-32.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-25-33.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-25-34.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-25-35.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-25-36.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-25-37.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-25-38.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-25-39.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-25-40.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-25-41.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-25-42.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-25-43.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-25-44.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-25-45.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-25-46.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-25-47.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-25-48.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-25-49.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-25-50.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-25-51.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-25-52.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-25-53.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-25-54.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-25-55.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-25-56.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-25-57.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-25-58.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-25-59.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-25-60.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-25-61.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-25-62.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-25-63.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-25-64.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-25-65.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-25-66.jpeg" style="display: block; margin: auto;" />

## Kobe (status)


```
## 
##  starter.sso with Bratio: SSB/SSB0 and F: _abs_F 
## 
```

<img src="index_files/figure-html/unnamed-chunk-26-1.jpeg" style="display: block; margin: auto;" />

```
## 
##  starter.sso with Bratio: SSB/SSB0 and F: _abs_F 
## 
```

<img src="index_files/figure-html/unnamed-chunk-26-2.jpeg" style="display: block; margin: auto;" />

```
## 
##  starter.sso with Bratio: SSB/SSB0 and F: _abs_F 
## 
```

<img src="index_files/figure-html/unnamed-chunk-26-3.jpeg" style="display: block; margin: auto;" />

```
## 
##  starter.sso with Bratio: SSB/SSB0 and F: _abs_F 
## 
```

<img src="index_files/figure-html/unnamed-chunk-26-4.jpeg" style="display: block; margin: auto;" />

```
## 
##  starter.sso with Bratio: SSB/SSB0 and F: _abs_F 
## 
```

<img src="index_files/figure-html/unnamed-chunk-26-5.jpeg" style="display: block; margin: auto;" />

```
## 
##  starter.sso with Bratio: SSB/SSB0 and F: _abs_F 
## 
```

<img src="index_files/figure-html/unnamed-chunk-26-6.jpeg" style="display: block; margin: auto;" />

```
## 
##  starter.sso with Bratio: SSB/SSB0 and F: _abs_F 
## 
```

<img src="index_files/figure-html/unnamed-chunk-26-7.jpeg" style="display: block; margin: auto;" />

```
## 
##  starter.sso with Bratio: SSB/SSB0 and F: _abs_F 
## 
```

<img src="index_files/figure-html/unnamed-chunk-26-8.jpeg" style="display: block; margin: auto;" />

another



\begin{table}[H]
\centering
\caption{\label{tab:unnamed-chunk-28}Rho parameter in SSB model s01}
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
\caption{\label{tab:unnamed-chunk-28}Rho parameter in F model s01}
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
\caption{\label{tab:unnamed-chunk-28}Rho parameter in SSB model s1}
\centering
\begin{tabular}[t]{llrr}
\toprule
type & peel & Rho & ForcastRho\\
\midrule
SSB & 2019 & -0.7342780 & -0.7458262\\
SSB & 2018 & -0.7842007 & -0.7836396\\
SSB & 2017 & -0.5057425 & -0.5164800\\
SSB & 2016 & -0.7415009 & -0.7843120\\
SSB & 2015 & 265.0981694 & 261.1336146\\
\addlinespace
SSB & Combined & 52.4664894 & 51.6606713\\
\bottomrule
\end{tabular}
\end{table}

\begin{table}[H]
\centering
\caption{\label{tab:unnamed-chunk-28}Rho parameter in F model s1}
\centering
\begin{tabular}[t]{llrr}
\toprule
type & peel & Rho & ForcastRho\\
\midrule
F & 2019 & 3.0449792 & 3.3280459\\
F & 2018 & 3.8726685 & 4.1951895\\
F & 2017 & 1.2249297 & 1.4074396\\
F & 2016 & 3.8045985 & 5.0576702\\
F & 2015 & -0.9935365 & -0.9931618\\
\addlinespace
F & Combined & 2.1907279 & 2.5990367\\
\bottomrule
\end{tabular}
\end{table}

\begin{table}[H]
\centering
\caption{\label{tab:unnamed-chunk-28}Rho parameter in SSB model s2}
\centering
\begin{tabular}[t]{llrr}
\toprule
type & peel & Rho & ForcastRho\\
\midrule
SSB & 2019 & -0.9845580 & -0.9795281\\
SSB & 2018 & 0.7414402 & 0.7285750\\
SSB & 2017 & -0.0407414 & -0.0645347\\
SSB & 2016 & 0.4132646 & 0.4053297\\
SSB & 2015 & 10.4448741 & 5.5086786\\
\addlinespace
SSB & Combined & 2.1148559 & 1.1197041\\
\bottomrule
\end{tabular}
\end{table}

\begin{table}[H]
\centering
\caption{\label{tab:unnamed-chunk-28}Rho parameter in F model s2}
\centering
\begin{tabular}[t]{llrr}
\toprule
type & peel & Rho & ForcastRho\\
\midrule
F & 2019 & 45.9498643 & 56.7742937\\
F & 2018 & -0.3756374 & -0.3420009\\
F & 2017 & 0.1576667 & 0.2468249\\
F & 2016 & -0.2258818 & -0.1688946\\
F & 2015 & -0.9956908 & -0.9955057\\
\addlinespace
F & Combined & 8.9020642 & 11.1029435\\
\bottomrule
\end{tabular}
\end{table}

\begin{table}[H]
\centering
\caption{\label{tab:unnamed-chunk-28}Rho parameter in SSB model s3}
\centering
\begin{tabular}[t]{llrr}
\toprule
type & peel & Rho & ForcastRho\\
\midrule
SSB & 2019 & 2.9545559 & 2.9007310\\
SSB & 2018 & 160.9094172 & 164.7094229\\
SSB & 2017 & -0.6357047 & -0.6641888\\
SSB & 2016 & -0.1936947 & -0.2097615\\
SSB & 2015 & 237.0287997 & 232.6666028\\
\addlinespace
SSB & Combined & 80.0126747 & 79.8805613\\
\bottomrule
\end{tabular}
\end{table}

\begin{table}[H]
\centering
\caption{\label{tab:unnamed-chunk-28}Rho parameter in F model s3}
\centering
\begin{tabular}[t]{llrr}
\toprule
type & peel & Rho & ForcastRho\\
\midrule
F & 2019 & -0.5279314 & -0.5094791\\
F & 2018 & -0.9877696 & -0.9872621\\
F & 2017 & 2.2398463 & 2.5687977\\
F & 2016 & 0.3344087 & 0.4564447\\
F & 2015 & -0.9925648 & -0.9921405\\
\addlinespace
F & Combined & 0.0131978 & 0.1072721\\
\bottomrule
\end{tabular}
\end{table}

\begin{table}[H]
\centering
\caption{\label{tab:unnamed-chunk-28}Rho parameter in SSB model s4}
\centering
\begin{tabular}[t]{llrr}
\toprule
type & peel & Rho & ForcastRho\\
\midrule
SSB & 2019 & 3.8305869 & 3.4922703\\
SSB & 2018 & 7.6443852 & 7.7206732\\
SSB & 2017 & -0.2012989 & -0.2449545\\
SSB & 2016 & 0.3447614 & 0.3408295\\
SSB & 2015 & 590.8284775 & 609.5693363\\
\addlinespace
SSB & Combined & 120.4893824 & 124.1756310\\
\bottomrule
\end{tabular}
\end{table}

\begin{table}[H]
\centering
\caption{\label{tab:unnamed-chunk-28}Rho parameter in F model s4}
\centering
\begin{tabular}[t]{llrr}
\toprule
type & peel & Rho & ForcastRho\\
\midrule
F & 2019 & -0.6753093 & -0.6630866\\
F & 2018 & -0.8034888 & -0.7937982\\
F & 2017 & 0.4071684 & 0.5467711\\
F & 2016 & -0.1884274 & -0.1311001\\
F & 2015 & -0.9970978 & -0.9970623\\
\addlinespace
F & Combined & -0.4514310 & -0.4076552\\
\bottomrule
\end{tabular}
\end{table}

\begin{table}[H]
\centering
\caption{\label{tab:unnamed-chunk-28}Rho parameter in SSB model s5}
\centering
\begin{tabular}[t]{llrr}
\toprule
type & peel & Rho & ForcastRho\\
\midrule
SSB & 2019 & -0.7687595 & -0.7313263\\
SSB & 2018 & 125.9226654 & 161.6965056\\
SSB & 2017 & -0.0861508 & -0.1008370\\
SSB & 2016 & 1.2524996 & 1.2560575\\
SSB & 2015 & 0.2755590 & 0.1862512\\
\addlinespace
SSB & Combined & 25.3191628 & 32.4613302\\
\bottomrule
\end{tabular}
\end{table}

\begin{table}[H]
\centering
\caption{\label{tab:unnamed-chunk-28}Rho parameter in F model s5}
\centering
\begin{tabular}[t]{llrr}
\toprule
type & peel & Rho & ForcastRho\\
\midrule
F & 2019 & 1.7985258 & 4.7373464\\
F & 2018 & -0.9853340 & -0.9888724\\
F & 2017 & -0.0297325 & 0.0584731\\
F & 2016 & -0.9993342 & -0.9995348\\
F & 2015 & 0.0144499 & 0.1733263\\
\addlinespace
F & Combined & -0.0402850 & 0.5961477\\
\bottomrule
\end{tabular}
\end{table}

\begin{table}[H]
\centering
\caption{\label{tab:unnamed-chunk-28}Rho parameter in SSB model s6}
\centering
\begin{tabular}[t]{llrr}
\toprule
type & peel & Rho & ForcastRho\\
\midrule
SSB & 2019 & 0.0219982 & -0.0102650\\
SSB & 2018 & -0.2441670 & -0.3154288\\
SSB & 2017 & 428.0923109 & 572.5806407\\
SSB & 2016 & 28.2398345 & 33.6356627\\
SSB & 2015 & -0.9876364 & -0.9919836\\
\addlinespace
SSB & Combined & 91.0244680 & 120.9797252\\
\bottomrule
\end{tabular}
\end{table}

\begin{table}[H]
\centering
\caption{\label{tab:unnamed-chunk-28}Rho parameter in F model s6}
\centering
\begin{tabular}[t]{llrr}
\toprule
type & peel & Rho & ForcastRho\\
\midrule
F & 2019 & 0.0591731 & 0.1721491\\
F & 2018 & 0.4418541 & 0.7176451\\
F & 2017 & -0.9958780 & -0.9965113\\
F & 2016 & -0.9383154 & -0.9507749\\
F & 2015 & -0.9990271 & -0.9991707\\
\addlinespace
F & Combined & -0.4864387 & -0.4113326\\
\bottomrule
\end{tabular}
\end{table}

\begin{table}[H]
\centering
\caption{\label{tab:unnamed-chunk-28}Rho parameter in SSB model s7}
\centering
\begin{tabular}[t]{llrr}
\toprule
type & peel & Rho & ForcastRho\\
\midrule
SSB & 2019 & -0.1005009 & -0.1208302\\
SSB & 2018 & 15.4797451 & 15.1062105\\
SSB & 2017 & -0.0521367 & -0.1153218\\
SSB & 2016 & 894.6053676 & 917.0498651\\
SSB & 2015 & 1114.1205353 & 1128.1806326\\
\addlinespace
SSB & Combined & 404.8106021 & 412.0201113\\
\bottomrule
\end{tabular}
\end{table}

\begin{table}[H]
\centering
\caption{\label{tab:unnamed-chunk-28}Rho parameter in F model s7}
\centering
\begin{tabular}[t]{llrr}
\toprule
type & peel & Rho & ForcastRho\\
\midrule
F & 2019 & 0.2004291 & 0.2960199\\
F & 2018 & -0.8866169 & -0.8790912\\
F & 2017 & 0.2258621 & 0.3598802\\
F & 2016 & -0.9978856 & -0.9979314\\
F & 2015 & -0.9979218 & -0.9979415\\
\addlinespace
F & Combined & -0.4912266 & -0.4438128\\
\bottomrule
\end{tabular}
\end{table}

## Verosimilitud



<img src="index_files/figure-html/unnamed-chunk-30-1.jpeg" style="display: block; margin: auto;" />





## Convergence criteria

0.0001 final convergence criteria (e.g. 1.0e-04) 




## SSplotComparisons()



## Outputs Model Base



## Comparision outputs betwwen scenarios






\begin{table}
\centering
\caption{\label{tab:unnamed-chunk-37}Comparacion likelihood y parámetros s01, s1, s2, s3, s4, s5, s6 y s7}
\centering
\resizebox{\ifdim\width>\linewidth\linewidth\else\width\fi}{!}{
\begin{tabular}[t]{lrrrrrrrr}
\toprule
Label & s01 & s1 & s2 & s3 & s4 & s5 & s6 & s7\\
\midrule
TOTAL\_like & 786.986000 & 5598.010000 & 5568.620000 & 5598.550000 & 5565.440000 & 5.51889e+03 & 5498.880000 & 5524.150000\\
Survey\_like & 6.826170 & 35.826400 & 36.221300 & 35.644400 & 38.164700 & 1.03757e+02 & 61.438200 & 31.011500\\
Length\_comp\_like & 773.034000 & 5544.750000 & 5511.340000 & 5545.350000 & 5506.240000 & 5.38711e+03 & 5413.500000 & 5465.470000\\
Parm\_priors\_like & 4.381280 & 8.491980 & 9.966820 & 8.496400 & 9.951980 & 8.32257e+00 & 11.305600 & 10.220400\\
Recr\_Virgin\_billions & 1807.100000 & 1319.640000 & 871.248000 & 1433.780000 & 687.992000 & 1.11175e+03 & 497.605000 & 529.332000\\
\addlinespace
SR\_LN(R0) & 21.315000 & 21.000600 & 20.585400 & 21.083600 & 20.349300 & 2.08292e+01 & 20.025300 & 20.087100\\
SR\_BH\_steep & 0.750000 & 0.750000 & NA & 0.900000 & 0.600000 & 2.00000e-01 & NA & 0.750000\\
SR\_BH\_flat\_steep & NA & NA & 0.900000 & NA & NA & NA & NA & NA\\
NatM\_uniform\_Fem\_GP\_1 & 0.200000 & 0.200000 & 0.200000 & 0.200000 & 0.200000 & 2.00000e-01 & 0.200000 & 0.200000\\
L\_at\_Amax\_Fem\_GP\_1 & 5.602860 & 5.505070 & 5.448620 & 5.504660 & 5.449920 & 5.52717e+00 & 5.399820 & 5.386220\\
\addlinespace
VonBert\_K\_Fem\_GP\_1 & 0.228099 & 0.246238 & 0.264283 & 0.246077 & 0.266028 & 2.45003e-01 & 0.305597 & 0.302593\\
SSB\_Virgin\_thousand\_mt & 329.118000 & 1144.730000 & 827.025000 & 1241.810000 & 660.469000 & 1.21541e+03 & 560.283000 & 541.802000\\
Bratio\_2020 & 0.109152 & 1.078620 & 0.970263 & 1.126930 & 0.734538 & 3.26882e-02 & 0.126424 & 0.659243\\
SPRratio\_2020 & 4.799030 & 0.514616 & 0.749227 & 0.459701 & 1.132160 & 3.90377e+00 & 3.343560 & 1.405400\\
\bottomrule
\end{tabular}}
\end{table}

comparision between select models `No spatial`and `Spatial implicit`



comparision between select models `Old Paramters` and `New Parameters WG SAM 2024/23`



## Comparsion in sd long term time series

<img src="index_files/figure-html/unnamed-chunk-40-1.jpeg" style="display: block; margin: auto;" />

## Autocorrelation in Recruit and Biomas

<img src="index_files/figure-html/unnamed-chunk-41-1.jpeg" style="display: block; margin: auto;" />

## Recruit deviation

<img src="index_files/figure-html/unnamed-chunk-42-1.jpeg" style="display: block; margin: auto;" />


\newpage

# REFERENCES
