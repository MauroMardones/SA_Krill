---
title: "Integrated approach to modeling to krill population dynamics in Wester Antarctic Peninsula: spatial and ecosystem considerations"
subtitle: "Working Paper to be submitted in a CCAMLR EMM-WG 2024"
author: "Mardones, M; Cárdenas, C., Krüger, L., Santa Cruz, F."
date:  "31 May, 2024"
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
\hspace{1em}\cellcolor{gray!10}{Nat M} & \cellcolor{gray!10}{0.05} & \cellcolor{gray!10}{0.80} & \cellcolor{gray!10}{0.40000} & \cellcolor{gray!10}{3}\\
\addlinespace[0.3em]
\multicolumn{5}{l}{\textbf{Crecimiento}}\\
\hspace{1em}Lmin & 0.10 & 10.00 & 0.50000 & 2\\
\hspace{1em}\cellcolor{gray!10}{Lmax} & \cellcolor{gray!10}{1.00} & \cellcolor{gray!10}{40.00} & \cellcolor{gray!10}{6.60000} & \cellcolor{gray!10}{4}\\
\hspace{1em}VonBert K & 0.05 & 0.80 & 0.45000 & 4\\
\hspace{1em}\cellcolor{gray!10}{CV young} & \cellcolor{gray!10}{0.05} & \cellcolor{gray!10}{0.25} & \cellcolor{gray!10}{0.10000} & \cellcolor{gray!10}{-3}\\
\hspace{1em}CV old & 0.05 & 0.25 & 0.10000 & -3\\
\addlinespace[0.3em]
\multicolumn{5}{l}{\textbf{Relación longitud-peso}}\\
\hspace{1em}\cellcolor{gray!10}{Wt a} & \cellcolor{gray!10}{0.00} & \cellcolor{gray!10}{3.00} & \cellcolor{gray!10}{0.00040} & \cellcolor{gray!10}{-3}\\
\hspace{1em}Wt b & 1.00 & 4.00 & 3.34694 & -3\\
\addlinespace[0.3em]
\multicolumn{5}{l}{\textbf{Ojiva de madurez}}\\
\hspace{1em}\cellcolor{gray!10}{L50\%} & \cellcolor{gray!10}{0.20} & \cellcolor{gray!10}{5.00} & \cellcolor{gray!10}{3.40000} & \cellcolor{gray!10}{-3}\\
\hspace{1em}Mat slope & -3.00 & 3.00 & -0.25000 & -3\\
\addlinespace[0.3em]
\multicolumn{5}{l}{\textbf{Relación stock-recluta}}\\
\hspace{1em}\cellcolor{gray!10}{SR\_LN(R0)} & \cellcolor{gray!10}{6.00} & \cellcolor{gray!10}{30.00} & \cellcolor{gray!10}{17.00000} & \cellcolor{gray!10}{-1}\\
\hspace{1em}SR\_BH\_steep & 0.20 & 1.00 & 0.80000 & -4\\
\hspace{1em}\cellcolor{gray!10}{SR\_sigmaR} & \cellcolor{gray!10}{0.00} & \cellcolor{gray!10}{2.00} & \cellcolor{gray!10}{0.60000} & \cellcolor{gray!10}{-4}\\
\hspace{1em}SR\_regime & -5.00 & 5.00 & 0.00000 & -4\\
\hspace{1em}\cellcolor{gray!10}{SR\_autocorr} & \cellcolor{gray!10}{0.00} & \cellcolor{gray!10}{0.00} & \cellcolor{gray!10}{0.00000} & \cellcolor{gray!10}{-99}\\
\addlinespace[0.3em]
\multicolumn{5}{l}{\textbf{Capturabilidad}}\\
\hspace{1em}LnQ\_base\_FISHERYBS(1) & -25.00 & 25.00 & -3.72231 & 1\\
\hspace{1em}\cellcolor{gray!10}{Q\_extraSD\_FISHERYBS(1)} & \cellcolor{gray!10}{0.00} & \cellcolor{gray!10}{1.00} & \cellcolor{gray!10}{0.00000} & \cellcolor{gray!10}{-3}\\
\addlinespace[0.3em]
\multicolumn{5}{l}{\textbf{Selectividad}}\\
\hspace{1em}SizeSel\_P\_1\_FISHERYBS(1) & 0.01 & 8.00 & 5.50000 & 3\\
\hspace{1em}\cellcolor{gray!10}{SizeSel\_P\_2\_FISHERYBS(1)} & \cellcolor{gray!10}{-1.50} & \cellcolor{gray!10}{8.00} & \cellcolor{gray!10}{6.60000} & \cellcolor{gray!10}{2}\\
\hspace{1em}SizeSel\_P\_1\_FISHERYEI(2) & 0.01 & 8.00 & 5.50000 & 3\\
\hspace{1em}\cellcolor{gray!10}{SizeSel\_P\_2\_FISHERYEI(2)} & \cellcolor{gray!10}{-1.50} & \cellcolor{gray!10}{8.00} & \cellcolor{gray!10}{6.60000} & \cellcolor{gray!10}{2}\\
SizeSel\_P\_1\_FISHERYGS(3) & 0.01 & 8.00 & 5.50000 & 3\\
\cellcolor{gray!10}{SizeSel\_P\_2\_FISHERYGS(3)} & \cellcolor{gray!10}{-1.50} & \cellcolor{gray!10}{8.00} & \cellcolor{gray!10}{6.60000} & \cellcolor{gray!10}{2}\\
SizeSel\_P\_1\_FISHERYJOIN(4) & 0.01 & 8.00 & 5.50000 & 3\\
\cellcolor{gray!10}{SizeSel\_P\_2\_FISHERYJOIN(4)} & \cellcolor{gray!10}{-1.50} & \cellcolor{gray!10}{8.00} & \cellcolor{gray!10}{6.60000} & \cellcolor{gray!10}{2}\\
SizeSel\_P\_1\_FISHERYSSIW(5) & 0.01 & 8.00 & 5.50000 & 3\\
\cellcolor{gray!10}{SizeSel\_P\_2\_FISHERYSSIW(5)} & \cellcolor{gray!10}{-1.50} & \cellcolor{gray!10}{8.00} & \cellcolor{gray!10}{6.60000} & \cellcolor{gray!10}{2}\\
SizeSel\_P\_1\_SURVEYBS(6) & 1.00 & 7.00 & 2.50000 & 2\\
\cellcolor{gray!10}{SizeSel\_P\_2\_SURVEYBS(6)} & \cellcolor{gray!10}{1.00} & \cellcolor{gray!10}{7.00} & \cellcolor{gray!10}{5.50000} & \cellcolor{gray!10}{3}\\
SizeSel\_P\_1\_SURVEYEI(7) & 1.00 & 7.00 & 2.50000 & 2\\
\cellcolor{gray!10}{SizeSel\_P\_2\_SURVEYEI(7)} & \cellcolor{gray!10}{1.00} & \cellcolor{gray!10}{7.00} & \cellcolor{gray!10}{1.50000} & \cellcolor{gray!10}{3}\\
SizeSel\_P\_1\_SURVEYGS(8) & 1.00 & 7.00 & 2.50000 & 2\\
\cellcolor{gray!10}{SizeSel\_P\_2\_SURVEYGS(8)} & \cellcolor{gray!10}{1.00} & \cellcolor{gray!10}{7.00} & \cellcolor{gray!10}{1.50000} & \cellcolor{gray!10}{3}\\
SizeSel\_P\_1\_SURVEYJOIN(9) & 1.00 & 7.00 & 2.50000 & 2\\
\cellcolor{gray!10}{SizeSel\_P\_2\_SURVEYJOIN(9)} & \cellcolor{gray!10}{1.00} & \cellcolor{gray!10}{7.00} & \cellcolor{gray!10}{1.50000} & \cellcolor{gray!10}{3}\\
SizeSel\_P\_1\_SURVEYSSIW(10) & 1.00 & 7.00 & 2.50000 & 2\\
\cellcolor{gray!10}{SizeSel\_P\_2\_SURVEYSSIW(10)} & \cellcolor{gray!10}{1.00} & \cellcolor{gray!10}{7.00} & \cellcolor{gray!10}{1.50000} & \cellcolor{gray!10}{3}\\
SizeSel\_P\_1\_PREDATOR(11) & 1.00 & 7.00 & 1.50000 & 2\\
\cellcolor{gray!10}{SizeSel\_P\_2\_PREDATOR(11)} & \cellcolor{gray!10}{1.00} & \cellcolor{gray!10}{7.00} & \cellcolor{gray!10}{2.50000} & \cellcolor{gray!10}{3}\\
\bottomrule
\end{tabular}
\end{table}

## Scenarios

In Table 1 we have ten scenarios to test different option in modeling
about main consideration in assessment of krill population.

| Scenario | Description                                                                          |
|:------------:|:---------------------------------------------------------|
|   s01    | Fishery and Survey (AMLR) data, Predator, Environmental aggregate data in 48.1       |
|    s1    | Fishery data (Length, Index, Catch) by strata and Predator and Env data              |
|    s2    | Fishery and Survey (AMLR) data Length, Index, Catch by strata. Predator and Env data |
|    s3    | "s2" without S-R relation                                                            |
|    s4    | "s2" Ricker S-R relation estimated                                                   |
|    s5    | "s2" BH S-R relation weak (0.9 steepness)                                            |
|    s6    | "s2" BH S-R relation strong (0.6 steepness)                                          |
|    s7    | "s2" BH S-R relation mid-strong (0.65 steepness) estimated                           |
|    s8    | "s2" w/ set of parameters estimated in @EMM-204/32                                   |

## Run Models





Read outputs





<img src="index_files/figure-html/unnamed-chunk-10-1.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-10-2.jpeg" style="display: block; margin: auto;" />

Respecto a los valores y parametros biologicos modelados, los siguientes
graficos identifican los estimadores puntuales del recurso

<img src="index_files/figure-html/unnamed-chunk-11-1.jpeg" style="display: block; margin: auto;" />
<img src="index_files/figure-html/unnamed-chunk-12-1.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-2.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-3.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-4.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-5.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-6.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-7.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-8.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-9.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-10.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-11.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-12.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-13.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-14.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-15.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-16.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-17.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-18.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-19.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-20.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-21.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-22.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-23.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-24.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-25.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-26.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-27.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-28.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-29.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-30.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-31.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-32.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-33.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-34.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-35.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-36.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-37.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-38.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-39.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-40.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-41.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-42.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-43.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-44.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-45.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-46.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-47.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-48.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-49.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-50.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-51.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-52.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-53.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-54.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-55.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-56.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-57.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-58.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-59.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-60.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-61.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-62.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-63.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-64.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-65.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-66.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-67.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-68.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-69.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-70.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-71.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-72.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-73.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-74.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-75.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-76.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-77.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-78.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-79.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-80.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-81.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-82.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-83.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-84.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-85.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-86.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-87.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-88.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-89.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-90.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-91.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-92.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-93.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-94.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-95.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-96.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-97.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-98.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-99.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-100.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-101.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-102.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-103.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-104.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-105.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-106.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-107.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-108.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-109.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-110.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-111.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-112.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-113.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-114.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-115.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-116.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-117.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-118.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-119.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-120.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-121.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-122.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-123.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-124.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-125.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-126.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-127.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-128.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-129.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-130.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-131.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-132.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-133.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-134.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-135.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-136.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-137.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-138.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-139.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-140.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-141.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-142.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-143.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-144.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-145.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-146.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-147.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-148.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-149.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-150.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-151.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-152.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-153.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-154.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-155.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-156.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-157.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-158.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-159.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-160.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-161.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-162.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-163.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-164.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-165.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-166.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-167.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-168.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-169.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-170.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-171.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-172.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-173.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-174.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-175.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-176.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-177.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-178.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-179.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-180.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-181.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-182.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-183.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-184.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-185.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-186.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-187.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-188.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-189.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-190.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-191.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-192.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-193.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-194.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-195.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-196.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-197.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-198.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-199.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-200.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-201.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-202.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-203.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-204.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-205.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-206.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-207.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-208.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-209.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-210.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-211.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-212.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-213.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-214.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-215.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-216.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-217.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-218.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-219.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-220.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-221.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-222.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-223.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-224.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-225.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-226.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-227.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-228.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-229.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-230.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-231.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-232.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-233.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-234.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-235.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-236.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-237.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-238.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-239.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-240.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-241.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-242.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-243.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-244.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-245.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-246.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-247.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-248.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-249.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-250.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-251.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-252.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-253.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-254.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-255.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-256.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-257.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-258.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-259.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-260.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-261.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-262.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-263.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-264.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-265.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-266.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-267.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-268.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-269.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-270.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-12-271.jpeg" style="display: block; margin: auto;" />

# RESULTS

## Diagnosis Base Model

Step to do a good practice in model diagnosis is;

-     1.  Convergence. Final convergence criteria is 1.0e-04

-     2.  Residual (visual and metrics)

-     3.  Retrospective analysis (Mhon Parameter)

-    4.  Likelihood profile

all this framework try to follow recommendations of @Carvalho2021b

## Residual consistency in `s2`




```
## Plotting JABBA residual plot
```

<img src="index_files/figure-html/unnamed-chunk-14-1.jpeg" style="display: block; margin: auto;" />

```
## 
## RMSE stats by Index:
```

```
##    indices RMSE.perc nobs
## 1  FISHERY       8.3   18
## 2  SURVEY1       6.2   21
## 3 Combined       7.2   39
```

```
## Plotting JABBA residual plot
```

<img src="index_files/figure-html/unnamed-chunk-14-2.jpeg" style="display: block; margin: auto;" />

```
## 
## RMSE stats by Index:
```

```
##       indices RMSE.perc nobs
## 1   FISHERYBS       3.7   16
## 2   FISHERYEI      10.4   14
## 3   FISHERYEX       4.7   12
## 4 FISHERYJOIN       6.6    3
## 5 FISHERYSSIW       4.3   17
## 6     SURVEY1       6.9   21
## 7    PREDATOR       5.1   34
## 8    Combined       6.1  117
```

```
## Plotting JABBA residual plot
```

<img src="index_files/figure-html/unnamed-chunk-14-3.jpeg" style="display: block; margin: auto;" />

```
## 
## RMSE stats by Index:
```

```
##        indices RMSE.perc nobs
## 1    FISHERYBS       3.6   16
## 2    FISHERYEI      10.8   14
## 3    FISHERYGS       5.7   12
## 4  FISHERYJOIN       6.2    3
## 5  FISHERYSSIW       4.3   17
## 6     SURVEYBS       7.5   20
## 7     SURVEYEI       5.6   21
## 8     SURVEYGS       7.5   19
## 9   SURVEYJOIN       9.5   12
## 10    PREDATOR       5.1   34
## 11    Combined       6.7  168
```

```
## Plotting JABBA residual plot
```

<img src="index_files/figure-html/unnamed-chunk-14-4.jpeg" style="display: block; margin: auto;" />

```
## 
## RMSE stats by Index:
```

```
##        indices RMSE.perc nobs
## 1    FISHERYBS       3.6   16
## 2    FISHERYEI      10.8   14
## 3    FISHERYGS       5.8   12
## 4  FISHERYJOIN       5.9    3
## 5  FISHERYSSIW       4.3   17
## 6     SURVEYBS       7.2   20
## 7     SURVEYEI       5.4   21
## 8     SURVEYGS       7.2   19
## 9   SURVEYJOIN       9.1   12
## 10    PREDATOR       5.1   34
## 11    Combined       6.6  168
```

```
## Plotting JABBA residual plot
```

<img src="index_files/figure-html/unnamed-chunk-14-5.jpeg" style="display: block; margin: auto;" />

```
## 
## RMSE stats by Index:
```

```
##        indices RMSE.perc nobs
## 1    FISHERYBS       3.7   16
## 2    FISHERYEI      11.2   14
## 3    FISHERYGS       5.7   12
## 4  FISHERYJOIN       6.3    3
## 5  FISHERYSSIW       4.5   17
## 6     SURVEYBS       7.3   20
## 7     SURVEYEI       5.6   21
## 8     SURVEYGS       7.9   19
## 9   SURVEYJOIN      10.1   12
## 10    PREDATOR       5.1   34
## 11    Combined       6.8  168
```

```
## Plotting JABBA residual plot
```

<img src="index_files/figure-html/unnamed-chunk-14-6.jpeg" style="display: block; margin: auto;" />

```
## 
## RMSE stats by Index:
```

```
##        indices RMSE.perc nobs
## 1    FISHERYBS       3.7   16
## 2    FISHERYEI      10.8   14
## 3    FISHERYGS       5.8   12
## 4  FISHERYJOIN       5.9    3
## 5  FISHERYSSIW       4.3   17
## 6     SURVEYBS       7.2   20
## 7     SURVEYEI       5.4   21
## 8     SURVEYGS       7.2   19
## 9   SURVEYJOIN       9.1   12
## 10    PREDATOR       5.1   34
## 11    Combined       6.6  168
```

```
## Plotting JABBA residual plot
```

<img src="index_files/figure-html/unnamed-chunk-14-7.jpeg" style="display: block; margin: auto;" />

```
## 
## RMSE stats by Index:
```

```
##        indices RMSE.perc nobs
## 1    FISHERYBS       3.7   16
## 2    FISHERYEI      11.2   14
## 3    FISHERYGS       5.7   12
## 4  FISHERYJOIN       6.2    3
## 5  FISHERYSSIW       4.5   17
## 6     SURVEYBS       7.3   20
## 7     SURVEYEI       5.6   21
## 8     SURVEYGS       7.9   19
## 9   SURVEYJOIN      10.1   12
## 10    PREDATOR       5.1   34
## 11    Combined       6.8  168
```

```
## Plotting JABBA residual plot
```

<img src="index_files/figure-html/unnamed-chunk-14-8.jpeg" style="display: block; margin: auto;" />

```
## 
## RMSE stats by Index:
```

```
##        indices RMSE.perc nobs
## 1    FISHERYBS       3.8   16
## 2    FISHERYEI      10.9   14
## 3    FISHERYGS       5.7   12
## 4  FISHERYJOIN       6.1    3
## 5  FISHERYSSIW       4.3   17
## 6     SURVEYBS       7.3   20
## 7     SURVEYEI       5.6   21
## 8     SURVEYGS       7.5   19
## 9   SURVEYJOIN       9.6   12
## 10    PREDATOR       5.1   34
## 11    Combined       6.7  168
```

```
## Plotting JABBA residual plot
```

<img src="index_files/figure-html/unnamed-chunk-14-9.jpeg" style="display: block; margin: auto;" />

```
## 
## RMSE stats by Index:
```

```
##        indices RMSE.perc nobs
## 1    FISHERYBS       3.8   16
## 2    FISHERYEI      10.9   14
## 3    FISHERYGS       5.7   12
## 4  FISHERYJOIN       6.1    3
## 5  FISHERYSSIW       4.3   17
## 6     SURVEYBS       7.3   20
## 7     SURVEYEI       5.6   21
## 8     SURVEYGS       7.5   19
## 9   SURVEYJOIN       9.6   12
## 10    PREDATOR       5.1   34
## 11    Combined       6.7  168
```

## Relationship Stock-Recruit



## Retrospective analysis

Los análisis retrospectivo, dan cuenta de diferencias de estimación
(sub - sobreestimación) en los patrones entre modelos evaluados.





<img src="index_files/figure-html/echo FALSE-1.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/echo FALSE-2.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/echo FALSE-3.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/echo FALSE-4.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/echo FALSE-5.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/echo FALSE-6.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/echo FALSE-7.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/echo FALSE-8.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/echo FALSE-9.jpeg" style="display: block; margin: auto;" />


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

<img src="index_files/figure-html/unnamed-chunk-18-1.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-18-2.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-18-3.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-18-4.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-18-5.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-18-6.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-18-7.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-18-8.jpeg" style="display: block; margin: auto;" /><img src="index_files/figure-html/unnamed-chunk-18-9.jpeg" style="display: block; margin: auto;" />

## Kobe (status)


```
## 
##  starter.sso with Bratio: SSB/SSB0 and F: _abs_F 
## 
```

<img src="index_files/figure-html/unnamed-chunk-19-1.jpeg" style="display: block; margin: auto;" />

```
## 
##  starter.sso with Bratio: SSB/SSB0 and F: _abs_F 
## 
```

<img src="index_files/figure-html/unnamed-chunk-19-2.jpeg" style="display: block; margin: auto;" />

```
## 
##  starter.sso with Bratio: SSB/SSB0 and F: _abs_F 
## 
```

<img src="index_files/figure-html/unnamed-chunk-19-3.jpeg" style="display: block; margin: auto;" />

```
## 
##  starter.sso with Bratio: SSB/SSB0 and F: _abs_F 
## 
```

<img src="index_files/figure-html/unnamed-chunk-19-4.jpeg" style="display: block; margin: auto;" />

```
## 
##  starter.sso with Bratio: SSB/SSB0 and F: _abs_F 
## 
```

<img src="index_files/figure-html/unnamed-chunk-19-5.jpeg" style="display: block; margin: auto;" />

```
## 
##  starter.sso with Bratio: SSB/SSB0 and F: _abs_F 
## 
```

<img src="index_files/figure-html/unnamed-chunk-19-6.jpeg" style="display: block; margin: auto;" />

```
## 
##  starter.sso with Bratio: SSB/SSB0 and F: _abs_F 
## 
```

<img src="index_files/figure-html/unnamed-chunk-19-7.jpeg" style="display: block; margin: auto;" />

```
## 
##  starter.sso with Bratio: SSB/SSB0 and F: _abs_F 
## 
```

<img src="index_files/figure-html/unnamed-chunk-19-8.jpeg" style="display: block; margin: auto;" />

```
## 
##  starter.sso with Bratio: SSB/SSB0 and F: _abs_F 
## 
```

<img src="index_files/figure-html/unnamed-chunk-19-9.jpeg" style="display: block; margin: auto;" />


\begin{table}[H]
\centering
\caption{\label{tab:unnamed-chunk-20}Rho parameter in SSB model s01}
\centering
\begin{tabular}[t]{llrr}
\toprule
type & peel & Rho & ForcastRho\\
\midrule
SSB & 2019 & 0.1499521 & 0.1828931\\
SSB & 2018 & 0.1706864 & 0.2241443\\
SSB & 2017 & 0.2891842 & 0.4346332\\
SSB & 2016 & 0.4043597 & 0.7342953\\
SSB & 2015 & 0.2580072 & 0.2625625\\
\addlinespace
SSB & Combined & 0.2544379 & 0.3677057\\
\bottomrule
\end{tabular}
\end{table}

\begin{table}[H]
\centering
\caption{\label{tab:unnamed-chunk-20}Rho parameter in F model s01}
\centering
\begin{tabular}[t]{llrr}
\toprule
type & peel & Rho & ForcastRho\\
\midrule
F & 2019 & -0.1468222 & -0.1428393\\
F & 2018 & -0.1668240 & -0.1846555\\
F & 2017 & -0.2738010 & -0.3298933\\
F & 2016 & -0.3639673 & -0.4231564\\
F & 2015 & -0.2180665 & -0.2777913\\
\addlinespace
F & Combined & -0.2338962 & -0.2716672\\
\bottomrule
\end{tabular}
\end{table}

\begin{table}[H]
\centering
\caption{\label{tab:unnamed-chunk-20}Rho parameter in SSB model s2}
\centering
\begin{tabular}[t]{llrr}
\toprule
type & peel & Rho & ForcastRho\\
\midrule
SSB & 2019 & -0.6294838 & -0.6780375\\
SSB & 2018 & -0.7346483 & -0.7577344\\
SSB & 2017 & -0.8070733 & -0.9118075\\
SSB & 2016 & -0.7172111 & -0.7909660\\
SSB & 2015 & -0.7319552 & -0.7914732\\
\addlinespace
SSB & Combined & -0.7240743 & -0.7860037\\
\bottomrule
\end{tabular}
\end{table}

\begin{table}[H]
\centering
\caption{\label{tab:unnamed-chunk-20}Rho parameter in F model s2}
\centering
\begin{tabular}[t]{llrr}
\toprule
type & peel & Rho & ForcastRho\\
\midrule
SSB & 2019 & -0.6294838 & -0.6780375\\
SSB & 2018 & -0.7346483 & -0.7577344\\
SSB & 2017 & -0.8070733 & -0.9118075\\
SSB & 2016 & -0.7172111 & -0.7909660\\
SSB & 2015 & -0.7319552 & -0.7914732\\
\addlinespace
SSB & Combined & -0.7240743 & -0.7860037\\
\bottomrule
\end{tabular}
\end{table}

## Verosimilitud



<img src="index_files/figure-html/unnamed-chunk-22-1.jpeg" style="display: block; margin: auto;" />



## SSplotComparisons()



## Outputs Model Base



## Comparision outputs betwwen scenarios



\begin{table}
\centering
\caption{\label{tab:unnamed-chunk-27}Comparacion likelihood y parámetros s01, s1, s2, s3, s4, s5, s6 y s7}
\centering
\resizebox{\ifdim\width>\linewidth\linewidth\else\width\fi}{!}{
\begin{tabular}[t]{lrrrrrrrrr}
\toprule
Label & s01 & s1 & s2 & s3 & s4 & s5 & s6 & s7 & NA\\
\midrule
TOTAL\_like & 872.868000 & 1943.040000 & 3500.690000 & 3563.500000 & 3545.310000 & 3554.400000 & 3549.200000 & 3544.350000 & 3609.630000\\
Survey\_like & 117.427000 & 67.233200 & 351.236000 & 393.585000 & 373.022000 & 395.313000 & 376.512000 & 379.541000 & 448.395000\\
Length\_comp\_like & 714.506000 & 1824.950000 & 3070.700000 & 3081.800000 & 3096.420000 & 3082.620000 & 3098.480000 & 3087.010000 & 3079.860000\\
Parm\_priors\_like & 3.230200 & 3.382410 & 3.255870 & 2.988370 & 3.101160 & 2.988680 & 3.070140 & 3.029340 & 12.838000\\
Recr\_Virgin\_billions & 24.155000 & 24.155000 & 24.155000 & 24.155000 & 24.155000 & 24.155000 & 24.155000 & 24.155000 & 24.155000\\
\addlinespace
SR\_LN(R0) & 17.000000 & 17.000000 & 17.000000 & 17.000000 & 17.000000 & 17.000000 & 17.000000 & 17.000000 & 17.000000\\
SR\_BH\_steep & 0.672184 & 0.800000 & 0.800000 & NA & NA & 0.900000 & 0.600000 & 0.205534 & 1.000000\\
NatM\_uniform\_Fem\_GP\_1 & 0.050000 & 0.400000 & 0.191112 & 0.400000 & 0.400000 & 0.400000 & 0.400000 & 0.400000 & 0.738323\\
L\_at\_Amax\_Fem\_GP\_1 & 4.785850 & 5.036840 & 4.926270 & 4.935460 & 5.035490 & 4.935180 & 5.039670 & 4.978750 & 5.271610\\
VonBert\_K\_Fem\_GP\_1 & 0.728350 & 0.510063 & 0.657908 & 0.688415 & 0.560589 & 0.689065 & 0.560899 & 0.624817 & 0.442474\\
\addlinespace
SSB\_Virgin\_thousand\_mt & 5194.290000 & 718.351000 & 1045.650000 & 499.356000 & 447.315000 & 500.790000 & 464.066000 & 472.255000 & 138.554000\\
Bratio\_2017 & 0.741806 & 1.076270 & 1.603210 & 1.765200 & 1.908870 & 1.626940 & 1.426310 & 3.966610 & 1.249840\\
SPRratio\_2016 & 0.106353 & 0.358123 & 0.647905 & 0.852897 & 0.805414 & 0.909561 & 0.984971 & 0.426757 & 1.510690\\
\bottomrule
\end{tabular}}
\end{table}

comparision between select models


```
##  [1]      NA 4916016      NA      NA      NA      NA      NA      NA      NA
## [10]      NA      NA      NA      NA      NA      NA      NA      NA
```

## Comparsion in sd long term time series

<img src="index_files/figure-html/unnamed-chunk-29-1.jpeg" style="display: block; margin: auto;" />

## Autocorrelation in Recruit and Biomas

<img src="index_files/figure-html/unnamed-chunk-30-1.jpeg" style="display: block; margin: auto;" />

## Recruit deviation

<img src="index_files/figure-html/unnamed-chunk-31-1.jpeg" style="display: block; margin: auto;" />


<img src="index_files/figure-html/unnamed-chunk-32-1.jpeg" style="display: block; margin: auto;" />

\newpage

# REFERENCES
