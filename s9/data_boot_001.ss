#V3.30.21.00;_safe;_compile_date:_Feb 10 2023;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_13.1
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Fri Sep  6 12:03:26 2024
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1725617006 first rand#: 0.644973
#V3.30.21.00;_safe;_compile_date:_Feb 10 2023;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_13.1
1978 #_StartYr
2020 #_EndYr
1 #_Nseas
 12 #_months/season
2 #_Nsubseasons (even number, minimum is 2)
1 #_spawn_month
1 #_Ngenders: 1, 2, -1  (use -1 for 1 sex setup with SSB multiplied by female_frac parameter)
7 #_Nages=accumulator age, first age is always age 0
1 #_Nareas
11 #_Nfleets (including surveys)
#_fleet_type: 1=catch fleet; 2=bycatch only fleet; 3=survey; 4=predator(M2) 
#_sample_timing: -1 for fishing fleet to use season-long catch-at-age for observations, or 1 to use observation month;  (always 1 for surveys)
#_fleet_area:  area the fleet/survey operates in 
#_units of catch:  1=bio; 2=num (ignored for surveys; their units read later)
#_catch_mult: 0=no; 1=yes
#_rows are fleets
#_fleet_type fishery_timing area catch_units need_catch_mult fleetname
 1 -1 1 1 0 FISHERYBS  # 1
 1 -1 1 1 0 FISHERYEI  # 2
 1 -1 1 1 0 FISHERYGS  # 3
 1 -1 1 1 0 FISHERYJOIN  # 4
 1 -1 1 1 0 FISHERYSSIW  # 5
 3 1 1 2 0 SURVEYBS  # 6
 3 1 1 2 0 SURVEYEI  # 7
 3 1 1 2 0 SURVEYGS  # 8
 3 1 1 2 0 SURVEYJOIN  # 9
 3 1 1 2 0 SURVEYSSIW  # 10
 4 1 1 1 0 PREDATOR  # 11
#Bycatch_fleet_input_goes_next
#a:  fleet index
#b:  1=include dead bycatch in total dead catch for F0.1 and MSY optimizations and forecast ABC; 2=omit from total catch for these purposes (but still include the mortality)
#c:  1=Fmult scales with other fleets; 2=bycatch F constant at input value; 3=bycatch F from range of years
#d:  F or first year of range
#e:  last year of range
#f:  not used
# a   b   c   d   e   f 
#_catch_biomass(mtons):_columns_are_fisheries,year,season
#_catch:_columns_are_year,season,fleet,catch,catch_se
#_Catch data: yr, seas, fleet, catch, catch_se
-999 1 1 0 1
1978 1 1 2.04204 0.02
1979 1 1 1019.49 0.02
1980 1 1 176609 0.02
1981 1 1 60851.3 0.02
1982 1 1 253867 0.02
1983 1 1 125465 0.02
1984 1 1 64782.7 0.02
1985 1 1 144693 0.02
1986 1 1 229144 0.02
1987 1 1 18982.1 0.02
1988 1 1 99408.2 0.02
1989 1 1 86275.2 0.02
1990 1 1 219451 0.02
1991 1 1 161286 0.02
1992 1 1 118882 0.02
1993 1 1 12705.1 0.02
1994 1 1 19535.2 0.02
1995 1 1 48784.4 0.02
1996 1 1 2784.3 0.02
1997 1 1 103.865 0.02
1998 1 1 6385.57 0.02
1999 1 1 507.646 0.02
2000 1 1 4010.97 0.02
2001 1 1 2833.7 0.02
2002 1 1 348.851 0.02
2003 1 1 0 0.01
2004 1 1 55.3147 0.02
2005 1 1 8.48978 0.02
2006 1 1 33142.7 0.02
2007 1 1 613.944 0.02
2008 1 1 0 0.01
2009 1 1 10954 0.02
2010 1 1 112805 0.02
2011 1 1 11661.1 0.02
2012 1 1 12332.4 0.02
2013 1 1 114243 0.02
2014 1 1 104747 0.02
2015 1 1 98703.6 0.02
2016 1 1 100665 0.02
2017 1 1 82880.7 0.02
2018 1 1 17062.4 0.02
2019 1 1 17150 0.02
2020 1 1 16833.7 0.02
-999 1 2 0 0.01
1978 1 2 0 0.01
1979 1 2 0 0.01
1980 1 2 0 0.01
1981 1 2 0 0.01
1982 1 2 0 0.01
1983 1 2 0 0.01
1984 1 2 0 0.01
1985 1 2 0 0.01
1986 1 2 0 0.01
1987 1 2 0 0.01
1988 1 2 0 0.01
1989 1 2 0 0.01
1990 1 2 0 0.01
1991 1 2 0 0.01
1992 1 2 0 0.01
1993 1 2 0 0.01
1994 1 2 0 0.01
1995 1 2 0 0.01
1996 1 2 0 0.01
1997 1 2 637.287 0.02
1998 1 2 0 0.01
1999 1 2 3902.28 0.02
2000 1 2 2881.82 0.02
2001 1 2 245.32 0.02
2002 1 2 1133.12 0.02
2003 1 2 63.4211 0.02
2004 1 2 511.821 0.02
2005 1 2 0 0.01
2006 1 2 2713.74 0.02
2007 1 2 2019.88 0.02
2008 1 2 1440.87 0.02
2009 1 2 4261.79 0.02
2010 1 2 1747.11 0.02
2011 1 2 13.8853 0.02
2012 1 2 178.363 0.02
2013 1 2 5681.24 0.02
2014 1 2 1307.06 0.02
2015 1 2 7150.41 0.02
2016 1 2 4523.69 0.02
2017 1 2 278.713 0.02
2018 1 2 1431.85 0.02
2019 1 2 1471.53 0.02
2020 1 2 1493.75 0.02
-999 1 3 0 0.01
1978 1 3 0 0.01
1979 1 3 0 0.01
1980 1 3 0 0.01
1981 1 3 0 0.01
1982 1 3 0 0.01
1983 1 3 0 0.01
1984 1 3 0 0.01
1985 1 3 0 0.01
1986 1 3 0 0.01
1987 1 3 0 0.01
1988 1 3 0 0.01
1989 1 3 0 0.01
1990 1 3 0 0.01
1991 1 3 0 0.01
1992 1 3 0 0.01
1993 1 3 0 0.01
1994 1 3 0 0.01
1995 1 3 0 0.01
1996 1 3 0 0.01
1997 1 3 0 0.01
1998 1 3 0 0.01
1999 1 3 0 0.01
2000 1 3 0 0.01
2001 1 3 19.1152 0.02
2002 1 3 0 0.01
2003 1 3 0 0.01
2004 1 3 1.96898 0.02
2005 1 3 0 0.01
2006 1 3 52.3464 0.02
2007 1 3 3.84533 0.02
2008 1 3 0 0.01
2009 1 3 11.1691 0.02
2010 1 3 13616.4 0.02
2011 1 3 66.4258 0.02
2012 1 3 27130.4 0.02
2013 1 3 29446.4 0.02
2014 1 3 9952.52 0.02
2015 1 3 55036.5 0.02
2016 1 3 35914.5 0.02
2017 1 3 52582.6 0.02
2018 1 3 28416.8 0.02
2019 1 3 28025.4 0.02
2020 1 3 29016.6 0.02
-999 1 4 0 0.01
1978 1 4 0 0.01
1979 1 4 0 0.01
1980 1 4 0 0.01
1981 1 4 0 0.01
1982 1 4 0 0.01
1983 1 4 0 0.01
1984 1 4 0 0.01
1985 1 4 0 0.01
1986 1 4 0 0.01
1987 1 4 0 0.01
1988 1 4 0 0.01
1989 1 4 0 0.01
1990 1 4 0 0.01
1991 1 4 0 0.01
1992 1 4 0 0.01
1993 1 4 0 0.01
1994 1 4 0 0.01
1995 1 4 0 0.01
1996 1 4 0 0.01
1997 1 4 0 0.01
1998 1 4 0 0.01
1999 1 4 27.5675 0.02
2000 1 4 0 0.01
2001 1 4 0 0.01
2002 1 4 0 0.01
2003 1 4 0 0.01
2004 1 4 0 0.01
2005 1 4 0 0.01
2006 1 4 0 0.01
2007 1 4 0 0.01
2008 1 4 0 0.01
2009 1 4 10629.7 0.02
2010 1 4 0 0.01
2011 1 4 0 0.01
2012 1 4 19.9363 0.02
2013 1 4 0 0.01
2014 1 4 0 0.01
2015 1 4 0 0.01
2016 1 4 9.96127 0.02
2017 1 4 184.887 0.02
2018 1 4 1.38771 0.02
2019 1 4 1.38656 0.02
2020 1 4 1.37031 0.02
-999 1 5 0 0.01
1978 1 5 0 0.01
1979 1 5 0 0.01
1980 1 5 0 0.01
1981 1 5 0 0.01
1982 1 5 0 0.01
1983 1 5 0 0.01
1984 1 5 0 0.01
1985 1 5 0 0.01
1986 1 5 0 0.01
1987 1 5 0 0.01
1988 1 5 0 0.01
1989 1 5 0 0.01
1990 1 5 0 0.01
1991 1 5 0 0.01
1992 1 5 0 0.01
1993 1 5 0 0.01
1994 1 5 0 0.01
1995 1 5 0 0.01
1996 1 5 0 0.01
1997 1 5 0 0.01
1998 1 5 287.791 0.02
1999 1 5 2435.84 0.02
2000 1 5 7607.72 0.02
2001 1 5 6157.48 0.02
2002 1 5 2.95679 0.02
2003 1 5 1659.66 0.02
2004 1 5 138.131 0.02
2005 1 5 414.953 0.02
2006 1 5 49310.4 0.02
2007 1 5 7367.46 0.02
2008 1 5 345.032 0.02
2009 1 5 4982.04 0.02
2010 1 5 19386.7 0.02
2011 1 5 5608.3 0.02
2012 1 5 25982 0.02
2013 1 5 14796.7 0.02
2014 1 5 16403.6 0.02
2015 1 5 1946.34 0.02
2016 1 5 1116.06 0.02
2017 1 5 16900.6 0.02
2018 1 5 5855.52 0.02
2019 1 5 5739.88 0.02
2020 1 5 5938.91 0.02
-9999 0 0 0 0
#
 #_CPUE_and_surveyabundance_observations
#_Units:  0=numbers; 1=biomass; 2=F; 30=spawnbio; 31=recdev; 32=spawnbio*recdev; 33=recruitment; 34=depletion(&see Qsetup); 35=parm_dev(&see Qsetup)
#_Errtype:  -1=normal; 0=lognormal; >0=T
#_SD_Report: 0=no sdreport; 1=enable sdreport
#_Fleet Units Errtype SD_Report
1 1 0 0 # FISHERYBS
2 1 0 0 # FISHERYEI
3 1 0 0 # FISHERYGS
4 1 0 0 # FISHERYJOIN
5 1 0 0 # FISHERYSSIW
6 1 0 1 # SURVEYBS
7 1 0 1 # SURVEYEI
8 1 0 1 # SURVEYGS
9 1 0 1 # SURVEYJOIN
10 1 0 1 # SURVEYSSIW
11 2 0 0 # PREDATOR
#_year month index obs err
1999 7 1 4.60684 0.5 #_orig_obs: 7.57 FISHERYBS
2000 7 1 3.05338 0.5 #_orig_obs: 3.11 FISHERYBS
2001 7 1 3.48484 0.5 #_orig_obs: 4.4 FISHERYBS
2002 7 1 9.41156 0.5 #_orig_obs: 4.57 FISHERYBS
2004 7 1 11.9045 0.5 #_orig_obs: 4.01 FISHERYBS
2005 7 1 16.6416 0.5 #_orig_obs: 1.12 FISHERYBS
2006 7 1 3.0445 0.5 #_orig_obs: 11.83 FISHERYBS
2007 7 1 15.3928 0.5 #_orig_obs: 10.08 FISHERYBS
2009 7 1 13.2092 0.5 #_orig_obs: 14.71 FISHERYBS
2010 7 1 8.44069 0.5 #_orig_obs: 12 FISHERYBS
2011 7 1 14.4234 0.5 #_orig_obs: 6.66 FISHERYBS
2012 7 1 7.38873 0.5 #_orig_obs: 7.22 FISHERYBS
2013 7 1 12.6675 0.5 #_orig_obs: 9.38 FISHERYBS
2014 7 1 11.6818 0.5 #_orig_obs: 10.71 FISHERYBS
2015 7 1 4.87081 0.5 #_orig_obs: 8.52 FISHERYBS
2016 7 1 14.9174 0.5 #_orig_obs: 9.78 FISHERYBS
2017 7 1 6.44955 0.5 #_orig_obs: 8.71 FISHERYBS
2018 7 1 7.81156 0.5 #_orig_obs: 10.49 FISHERYBS
1997 7 2 1.28463 0.5 #_orig_obs: 2.59 FISHERYEI
1999 7 2 5.32494 0.5 #_orig_obs: 8.01 FISHERYEI
2000 7 2 5.07689 0.5 #_orig_obs: 5.69 FISHERYEI
2001 7 2 1.39802 0.5 #_orig_obs: 4.65 FISHERYEI
2002 7 2 4.9665 0.5 #_orig_obs: 7.62 FISHERYEI
2003 7 2 13.1677 0.5 #_orig_obs: 6.19 FISHERYEI
2004 7 2 2.42409 0.5 #_orig_obs: 4.51 FISHERYEI
2006 7 2 3.05056 0.5 #_orig_obs: 9.16 FISHERYEI
2007 7 2 10.1994 0.5 #_orig_obs: 4.56 FISHERYEI
2008 7 2 8.70746 0.5 #_orig_obs: 5.08 FISHERYEI
2009 7 2 7.35332 0.5 #_orig_obs: 5.98 FISHERYEI
2010 7 2 8.50088 0.5 #_orig_obs: 13.78 FISHERYEI
2011 7 2 5.04269 0.5 #_orig_obs: 2.72 FISHERYEI
2012 7 2 14.5668 0.5 #_orig_obs: 3.91 FISHERYEI
2013 7 2 9.03756 0.5 #_orig_obs: 7.93 FISHERYEI
2014 7 2 5.81637 0.5 #_orig_obs: 7.47 FISHERYEI
2015 7 2 7.97156 0.5 #_orig_obs: 7.92 FISHERYEI
2016 7 2 13.3732 0.5 #_orig_obs: 5.98 FISHERYEI
2017 7 2 6.48397 0.5 #_orig_obs: 3.82 FISHERYEI
2018 7 2 5.40045 0.5 #_orig_obs: 6.2 FISHERYEI
2001 7 3 1.20253 0.5 #_orig_obs: 3.46 FISHERYGS
2004 7 3 0.5463 0.5 #_orig_obs: 0.75 FISHERYGS
2006 7 3 4.69528 0.5 #_orig_obs: 4.27 FISHERYGS
2007 7 3 10.6134 0.5 #_orig_obs: 1.07 FISHERYGS
2009 7 3 10.2534 0.5 #_orig_obs: 7.22 FISHERYGS
2010 7 3 7.50847 0.5 #_orig_obs: 9.52 FISHERYGS
2011 7 3 4.54657 0.5 #_orig_obs: 3.2 FISHERYGS
2012 7 3 5.43411 0.5 #_orig_obs: 6.67 FISHERYGS
2013 7 3 9.2397 0.5 #_orig_obs: 7.32 FISHERYGS
2014 7 3 11.3791 0.5 #_orig_obs: 8.54 FISHERYGS
2015 7 3 3.73865 0.5 #_orig_obs: 7.84 FISHERYGS
2016 7 3 9.20083 0.5 #_orig_obs: 8.35 FISHERYGS
2017 7 3 6.32227 0.5 #_orig_obs: 8.01 FISHERYGS
2018 7 3 5.8274 0.5 #_orig_obs: 11.61 FISHERYGS
1999 7 4 2.18106 0.5 #_orig_obs: 3.51 FISHERYJOIN
2009 7 4 9.05228 0.5 #_orig_obs: 12.28 FISHERYJOIN
2012 7 4 17.5932 0.5 #_orig_obs: 8 FISHERYJOIN
2016 7 4 3.22912 0.5 #_orig_obs: 4.62 FISHERYJOIN
2017 7 4 3.28544 0.5 #_orig_obs: 5.8 FISHERYJOIN
2018 7 4 3.88637 0.5 #_orig_obs: 1.58 FISHERYJOIN
1998 7 5 6.06508 0.5 #_orig_obs: 6.32 FISHERYSSIW
1999 7 5 11.475 0.5 #_orig_obs: 5.84 FISHERYSSIW
2000 7 5 2.8336 0.5 #_orig_obs: 6.03 FISHERYSSIW
2001 7 5 5.5657 0.5 #_orig_obs: 4.31 FISHERYSSIW
2002 7 5 6.18395 0.5 #_orig_obs: 1.96 FISHERYSSIW
2003 7 5 2.70078 0.5 #_orig_obs: 5.42 FISHERYSSIW
2004 7 5 7.3029 0.5 #_orig_obs: 4.64 FISHERYSSIW
2005 7 5 4.70227 0.5 #_orig_obs: 3.13 FISHERYSSIW
2006 7 5 4.89534 0.5 #_orig_obs: 9.15 FISHERYSSIW
2007 7 5 13.7522 0.5 #_orig_obs: 9.67 FISHERYSSIW
2008 7 5 5.56227 0.5 #_orig_obs: 9.52 FISHERYSSIW
2009 7 5 9.7182 0.5 #_orig_obs: 6.08 FISHERYSSIW
2010 7 5 6.85518 0.5 #_orig_obs: 10.92 FISHERYSSIW
2011 7 5 7.76474 0.5 #_orig_obs: 7.98 FISHERYSSIW
2012 7 5 8.11256 0.5 #_orig_obs: 7.57 FISHERYSSIW
2013 7 5 10.9503 0.5 #_orig_obs: 7.82 FISHERYSSIW
2014 7 5 10.3455 0.5 #_orig_obs: 6.31 FISHERYSSIW
2015 7 5 5.23737 0.5 #_orig_obs: 6.58 FISHERYSSIW
2016 7 5 9.44156 0.5 #_orig_obs: 6.73 FISHERYSSIW
2017 7 5 8.71758 0.5 #_orig_obs: 8.03 FISHERYSSIW
2018 7 5 26.4578 0.5 #_orig_obs: 7.52 FISHERYSSIW
1997 2 6 1.13078e+06 0.56 #_orig_obs: 302205 SURVEYBS
1998 2 6 1.93978e+06 0.36 #_orig_obs: 274253 SURVEYBS
1999 2 6 1.03289e+06 0.1 #_orig_obs: 133683 SURVEYBS
2000 2 6 508471 0.81 #_orig_obs: 653831 SURVEYBS
2001 2 6 745044 0.39 #_orig_obs: 126391 SURVEYBS
2002 2 6 169491 0.76 #_orig_obs: 182369 SURVEYBS
2003 2 6 170660 0.3 #_orig_obs: 1.23007e+06 SURVEYBS
2004 2 6 5.17695e+06 0.93 #_orig_obs: 39166 SURVEYBS
2005 2 6 105832 0.42 #_orig_obs: 460022 SURVEYBS
2006 2 6 137230 0.44 #_orig_obs: 372081 SURVEYBS
2007 2 6 484247 0.33 #_orig_obs: 1.24108e+06 SURVEYBS
2008 2 6 251380 0.55 #_orig_obs: 767417 SURVEYBS
2009 2 6 874410 0.26 #_orig_obs: 509163 SURVEYBS
2010 2 6 612203 0.54 #_orig_obs: 149322 SURVEYBS
2011 2 6 701845 0.49 #_orig_obs: 851869 SURVEYBS
2014 2 6 684982 0.24 #_orig_obs: 563314 SURVEYBS
2015 2 6 392599 0.46 #_orig_obs: 394970 SURVEYBS
2016 2 6 1.58996e+06 0.33 #_orig_obs: 1.0345e+06 SURVEYBS
2018 2 6 606272 0.33 #_orig_obs: 798010 SURVEYBS
2019 2 6 1.75049e+06 0.19 #_orig_obs: 2.21188e+06 SURVEYBS
2020 2 6 281435 0.21 #_orig_obs: 6.37586e+06 SURVEYBS
1996 2 7 448258 0.26 #_orig_obs: 4.43484e+06 SURVEYEI
1997 2 7 4.98622e+06 0.3 #_orig_obs: 9.74748e+06 SURVEYEI
1998 2 7 3.93625e+06 0.17 #_orig_obs: 2.62332e+06 SURVEYEI
1999 2 7 2.13067e+06 0.3 #_orig_obs: 1.26478e+06 SURVEYEI
2000 2 7 5.40325e+06 0.22 #_orig_obs: 3.60055e+06 SURVEYEI
2001 2 7 3.43062e+06 0.2 #_orig_obs: 1.11475e+06 SURVEYEI
2002 2 7 1.86419e+07 0.39 #_orig_obs: 561472 SURVEYEI
2003 2 7 2.02679e+06 0.14 #_orig_obs: 1.99366e+06 SURVEYEI
2004 2 7 885994 0.29 #_orig_obs: 616303 SURVEYEI
2005 2 7 2.37973e+06 0.43 #_orig_obs: 872913 SURVEYEI
2006 2 7 1.10717e+06 0.41 #_orig_obs: 1.69319e+06 SURVEYEI
2007 2 7 935592 0.43 #_orig_obs: 4.53564e+06 SURVEYEI
2008 2 7 828958 0.38 #_orig_obs: 2.2744e+06 SURVEYEI
2009 2 7 1.68685e+06 0.16 #_orig_obs: 5.13528e+06 SURVEYEI
2010 2 7 2.17541e+06 0.09 #_orig_obs: 881687 SURVEYEI
2011 2 7 909748 0.24 #_orig_obs: 3.68905e+06 SURVEYEI
2019 2 7 1.88542e+06 0.37 #_orig_obs: 2.45782e+06 SURVEYEI
2020 2 7 2.50927e+06 0.08 #_orig_obs: 6.19714e+06 SURVEYEI
1997 2 8 650579 0.23 #_orig_obs: 4.84574e+06 SURVEYGS
1998 2 8 1.9021e+06 0.21 #_orig_obs: 4.03129e+06 SURVEYGS
1999 2 8 353428 0.38 #_orig_obs: 850310 SURVEYGS
2000 2 8 2.49589e+06 0.28 #_orig_obs: 3.67443e+06 SURVEYGS
2001 2 8 302185 0.63 #_orig_obs: 85372 SURVEYGS
2002 2 8 275742 0.79 #_orig_obs: 53934 SURVEYGS
2003 2 8 346829 0.32 #_orig_obs: 2.68705e+06 SURVEYGS
2004 2 8 2.56681e+06 0.31 #_orig_obs: 751218 SURVEYGS
2005 2 8 1.75013e+06 1.04 #_orig_obs: 1.13838e+06 SURVEYGS
2006 2 8 4.41119e+06 0.55 #_orig_obs: 1.19039e+06 SURVEYGS
2007 2 8 1.4342e+06 0.17 #_orig_obs: 5.26623e+06 SURVEYGS
2008 2 8 428125 0.42 #_orig_obs: 2.70824e+06 SURVEYGS
2009 2 8 1.22467e+06 0.11 #_orig_obs: 1.9658e+06 SURVEYGS
2010 2 8 2.42916e+06 0.14 #_orig_obs: 452013 SURVEYGS
2011 2 8 1.14183e+06 0.18 #_orig_obs: 1.90694e+06 SURVEYGS
2014 2 8 756386 0.35 #_orig_obs: 418271 SURVEYGS
2015 2 8 3.36766e+06 0.43 #_orig_obs: 399952 SURVEYGS
2016 2 8 3.71241e+06 0.26 #_orig_obs: 896428 SURVEYGS
2018 2 8 1.89391e+06 0.19 #_orig_obs: 1.79402e+06 SURVEYGS
2019 2 8 4.41795e+06 0.36 #_orig_obs: 1.05174e+06 SURVEYGS
2020 2 8 1.17958e+06 0.26 #_orig_obs: 8.8388e+06 SURVEYGS
2002 2 9 1.36442e+06 0.62 #_orig_obs: 151074 SURVEYJOIN
2004 2 9 2.55691e+06 0.59 #_orig_obs: 56207 SURVEYJOIN
2005 2 9 1.19662e+06 0.65 #_orig_obs: 214762 SURVEYJOIN
2008 2 9 1.84703e+06 0.2 #_orig_obs: 1.24808e+06 SURVEYJOIN
2009 2 9 2.76245e+06 0.4 #_orig_obs: 555490 SURVEYJOIN
2010 2 9 425681 0.59 #_orig_obs: 309719 SURVEYJOIN
2011 2 9 202833 0.59 #_orig_obs: 1.39256e+06 SURVEYJOIN
2019 2 9 1.45153e+06 0.32 #_orig_obs: 1.50675e+06 SURVEYJOIN
2000 2 10 3.70087e+06 0.16 #_orig_obs: 6.61694e+06 SURVEYSSIW
2019 2 10 2.427e+06 0.24 #_orig_obs: 3.2949e+06 SURVEYSSIW
1979 7 11 15753.6 0.4 #_orig_obs: 47124 PREDATOR
1980 7 11 8411.81 0.4 #_orig_obs: 28772 PREDATOR
1981 7 11 116299 0.4 #_orig_obs: 33545 PREDATOR
1982 7 11 15459.4 0.4 #_orig_obs: 16471 PREDATOR
1983 7 11 46325 0.4 #_orig_obs: 9232 PREDATOR
1984 7 11 18776.3 0.4 #_orig_obs: 19132 PREDATOR
1985 7 11 18689.2 0.4 #_orig_obs: 17146 PREDATOR
1986 7 11 14782.1 0.4 #_orig_obs: 27862 PREDATOR
1987 7 11 5330.08 0.4 #_orig_obs: 16065 PREDATOR
1988 7 11 7763.57 0.4 #_orig_obs: 35142 PREDATOR
1989 7 11 37278 0.4 #_orig_obs: 27700 PREDATOR
1990 7 11 19601.1 0.4 #_orig_obs: 25925 PREDATOR
1991 7 11 37227.5 0.4 #_orig_obs: 28588 PREDATOR
1992 7 11 10185.6 0.4 #_orig_obs: 32498 PREDATOR
1993 7 11 8720.06 0.4 #_orig_obs: 17408 PREDATOR
1994 7 11 4305.08 0.4 #_orig_obs: 33903 PREDATOR
1995 7 11 10860.1 0.4 #_orig_obs: 34899 PREDATOR
1996 7 11 24196.5 0.4 #_orig_obs: 29639 PREDATOR
1997 7 11 8797.61 0.4 #_orig_obs: 33016 PREDATOR
1998 7 11 5969.67 0.4 #_orig_obs: 32062 PREDATOR
1999 7 11 6524.09 0.4 #_orig_obs: 24824 PREDATOR
2000 7 11 64927.6 0.4 #_orig_obs: 26319 PREDATOR
2001 7 11 45576.9 0.4 #_orig_obs: 24853 PREDATOR
2002 7 11 9919.42 0.4 #_orig_obs: 19077 PREDATOR
2003 7 11 3883.53 0.4 #_orig_obs: 17019 PREDATOR
2004 7 11 33060.7 0.4 #_orig_obs: 15180 PREDATOR
2005 7 11 12939.7 0.4 #_orig_obs: 14817 PREDATOR
2006 7 11 33448.2 0.4 #_orig_obs: 16220 PREDATOR
2007 7 11 26601.5 0.4 #_orig_obs: 14682 PREDATOR
2008 7 11 68616.2 0.4 #_orig_obs: 19886 PREDATOR
2009 7 11 8498.29 0.4 #_orig_obs: 17744 PREDATOR
2010 7 11 23932.2 0.4 #_orig_obs: 27051 PREDATOR
2011 7 11 98720.6 0.4 #_orig_obs: 24651 PREDATOR
2012 7 11 38548.9 0.4 #_orig_obs: 23269 PREDATOR
2013 7 11 20380.9 0.4 #_orig_obs: 29370 PREDATOR
2014 7 11 9037.29 0.4 #_orig_obs: 24124 PREDATOR
2015 7 11 48409.9 0.4 #_orig_obs: 20993 PREDATOR
2016 7 11 25830.5 0.4 #_orig_obs: 26671 PREDATOR
2017 7 11 22382.4 0.4 #_orig_obs: 22937 PREDATOR
2018 7 11 15473.5 0.4 #_orig_obs: 9554 PREDATOR
2019 7 11 3418.04 0.4 #_orig_obs: 8359 PREDATOR
2020 7 11 27909.7 0.4 #_orig_obs: 192 PREDATOR
-9999 1 1 1 1 # terminator for survey observations 
#
0 #_N_fleets_with_discard
#_discard_units (1=same_as_catchunits(bio/num); 2=fraction; 3=numbers)
#_discard_errtype:  >0 for DF of T-dist(read CV below); 0 for normal with CV; -1 for normal with se; -2 for lognormal; -3 for trunc normal with CV
# note: only enter units and errtype for fleets with discard 
# note: discard data is the total for an entire season, so input of month here must be to a month in that season
#_Fleet units errtype
# -9999 0 0 0.0 0.0 # terminator for discard data 
#
0 #_use meanbodysize_data (0/1)
#_COND_0 #_DF_for_meanbodysize_T-distribution_like
# note:  type=1 for mean length; type=2 for mean body weight 
#_yr month fleet part type obs stderr
#  -9999 0 0 0 0 0 0 # terminator for mean body size data 
#
# set up population length bin structure (note - irrelevant if not using size data and using empirical wtatage
2 # length bin method: 1=use databins; 2=generate from binwidth,min,max below; 3=read vector
0.2 # binwidth for population size comp 
1 # minimum size in the population (lower edge of first bin and size at age 0.00) 
7 # maximum size in the population (lower edge of last bin) 
1 # use length composition data (0/1/2) where 2 invokes new comp_comtrol format
#_mintailcomp: upper and lower distribution for females and males separately are accumulated until exceeding this level.
#_addtocomp:  after accumulation of tails; this value added to all bins
#_combM+F: males and females treated as combined gender below this bin number 
#_compressbins: accumulate upper tail by this number of bins; acts simultaneous with mintailcomp; set=0 for no forced accumulation
#_Comp_Error:  0=multinomial, 1=dirichlet using Theta*n, 2=dirichlet using beta, 3=MV_Tweedie
#_ParmSelect:  consecutive index for dirichlet or MV_Tweedie
#_minsamplesize: minimum sample size; set to 1 to match 3.24, minimum value is 0.001
#
#_Using old format for composition controls
#_mintailcomp addtocomp combM+F CompressBins CompError ParmSelect minsamplesize
-1 0.0001 0 0 0 0 0.1 #_fleet:1_FISHERYBS
-1 0.0001 0 0 0 0 0.1 #_fleet:2_FISHERYEI
-1 0.0001 0 0 0 0 0.1 #_fleet:3_FISHERYGS
-1 0.0001 0 0 0 0 0.1 #_fleet:4_FISHERYJOIN
-1 0.0001 0 0 0 0 0.1 #_fleet:5_FISHERYSSIW
-1 0.0001 0 0 0 0 0.1 #_fleet:6_SURVEYBS
-1 0.0001 0 0 0 0 0.1 #_fleet:7_SURVEYEI
-1 0.0001 0 0 0 0 0.1 #_fleet:8_SURVEYGS
-1 0.0001 0 0 0 0 0.1 #_fleet:9_SURVEYJOIN
-1 0.0001 0 0 0 0 0.1 #_fleet:10_SURVEYSSIW
-1 0.0001 0 0 0 0 0.1 #_fleet:11_PREDATOR
28 #_N_LengthBins
 1.2 1.4 1.6 1.8 2 2.2 2.4 2.6 2.8 3 3.2 3.4 3.6 3.8 4 4.2 4.4 4.6 4.8 5 5.2 5.4 5.6 5.8 6 6.2 6.4 6.6
# sex codes:  0=combined; 1=use female only; 2=use male only; 3=use both as joint sexxlength distribution
# partition codes:  (0=combined; 1=discard; 2=retained
#_yr month fleet sex part Nsamp datavector(female-male)
 2001 3 1 0 0 75  0 0 0 0 0 0 0 3 0 3 2 9 2 4 1 3 6 11 11 8 7 4 1 0 0 0 0 0
 2004 3 1 0 0 75  0 0 0 0 0 0 0 0 0 1 4 2 6 11 12 9 7 4 4 4 8 3 0 0 0 0 0 0
 2005 3 1 0 0 75  0 0 1 0 0 0 0 1 2 2 3 2 3 4 5 13 8 12 6 8 4 0 1 0 0 0 0 0
 2006 3 1 0 0 75  0 0 0 0 0 0 0 4 5 5 2 2 1 2 1 4 12 6 15 9 3 2 1 0 1 0 0 0
 2007 3 1 0 0 75  0 0 0 1 0 0 0 1 7 2 8 7 2 4 4 2 5 11 6 10 2 2 0 1 0 0 0 0
 2010 3 1 0 0 75  0 0 1 0 0 0 0 3 7 3 0 6 1 6 8 1 8 9 8 8 2 4 0 0 0 0 0 0
 2011 3 1 0 0 75  0 0 0 0 0 0 1 3 7 3 3 4 2 3 5 7 7 7 13 4 3 3 0 0 0 0 0 0
 2012 3 1 0 0 75  0 0 0 0 0 0 0 2 4 3 2 12 8 6 2 5 9 4 4 7 5 0 1 1 0 0 0 0
 2013 3 1 0 0 75  0 0 0 0 0 0 0 0 2 2 3 6 6 7 9 10 2 6 8 5 1 7 1 0 0 0 0 0
 2014 3 1 0 0 75  0 0 0 1 0 0 0 0 5 0 0 2 7 12 5 9 8 5 7 4 7 2 1 0 0 0 0 0
 2015 3 1 0 0 75  0 0 0 0 0 0 0 0 2 4 0 5 3 1 12 8 9 5 9 9 7 1 0 0 0 0 0 0
 2016 3 1 0 0 75  0 0 0 0 0 0 0 3 9 2 3 4 1 3 3 4 5 10 12 5 7 2 2 0 0 0 0 0
 2017 3 1 0 0 75  0 0 0 1 0 0 0 0 3 1 4 6 4 6 6 5 3 14 8 5 6 2 1 0 0 0 0 0
 2018 3 1 0 0 75  0 0 1 0 0 0 0 0 3 0 4 1 3 7 9 6 2 4 8 14 6 7 0 0 0 0 0 0
 2019 3 1 0 0 75  0 0 1 0 0 0 1 1 1 2 3 3 3 4 4 4 10 4 8 13 10 3 0 0 0 0 0 0
 2020 3 1 0 0 75  0 0 0 0 0 0 0 3 3 2 2 8 4 2 4 3 10 11 5 6 9 3 0 0 0 0 0 0
 2001 3 2 0 0 75  0 0 0 0 0 0 0 0 0 0 2 4 1 4 5 2 6 9 12 16 9 4 1 0 0 0 0 0
 2004 3 2 0 0 75  0 0 0 0 0 0 0 0 1 0 0 0 6 7 13 13 7 4 6 10 5 3 0 0 0 0 0 0
 2007 3 2 0 0 75  0 0 0 0 0 0 0 2 6 2 3 3 4 0 2 4 11 8 10 12 3 4 1 0 0 0 0 0
 2008 3 2 0 0 75  0 1 0 1 0 0 0 1 3 0 1 5 6 6 6 7 0 8 6 16 1 5 2 0 0 0 0 0
 2009 3 2 0 0 75  0 0 1 1 0 0 0 1 1 1 1 2 8 5 6 5 6 6 11 10 9 1 0 0 0 0 0 0
 2010 3 2 0 0 75  0 0 0 0 0 0 1 0 4 0 2 6 2 9 5 7 4 9 11 9 3 3 0 0 0 0 0 0
 2012 3 2 0 0 75  0 0 0 0 0 0 0 5 2 3 2 3 5 3 2 8 10 8 10 6 3 4 1 0 0 0 0 0
 2013 3 2 0 0 75  0 0 3 0 0 0 0 1 0 0 2 5 9 6 7 5 6 4 9 10 7 1 0 0 0 0 0 0
 2014 3 2 0 0 75  0 0 0 0 0 0 0 1 1 3 1 2 6 11 10 5 5 8 5 10 4 2 1 0 0 0 0 0
 2015 3 2 0 0 75  0 0 0 1 0 0 0 0 2 0 0 4 3 4 3 12 7 9 9 7 10 3 1 0 0 0 0 0
 2016 3 2 0 0 75  0 0 0 0 0 0 0 0 2 0 0 4 2 5 3 3 11 12 13 10 8 2 0 0 0 0 0 0
 2017 3 2 0 0 75  0 0 0 0 0 0 0 0 0 0 3 4 6 10 5 4 3 6 7 12 11 4 0 0 0 0 0 0
 2018 3 2 0 0 75  0 0 0 0 0 0 0 1 2 2 0 2 2 3 6 5 4 5 15 11 11 5 1 0 0 0 0 0
 2019 3 2 0 0 75  0 0 0 1 0 0 0 0 1 1 5 1 2 5 6 1 11 6 10 10 11 3 1 0 0 0 0 0
 2006 4 3 0 0 75  0 0 1 0 0 0 1 4 14 2 4 3 1 2 7 7 4 8 5 7 3 2 0 0 0 0 0 0
 2007 4 3 0 0 75  0 0 0 0 0 0 1 3 7 8 7 6 4 2 2 4 7 6 8 8 2 0 0 0 0 0 0 0
 2010 4 3 0 0 75  0 0 0 0 0 0 0 1 5 4 2 6 2 8 3 4 9 9 8 5 7 1 1 0 0 0 0 0
 2012 4 3 0 0 75  0 0 0 0 0 0 0 2 9 5 5 6 10 6 3 3 7 4 5 7 2 1 0 0 0 0 0 0
 2013 4 3 0 0 75  0 0 0 0 0 0 0 0 3 2 4 12 12 5 3 5 5 5 6 7 4 2 0 0 0 0 0 0
 2014 4 3 0 0 75  0 0 0 0 0 0 0 0 5 0 2 3 7 11 9 15 3 6 4 4 2 3 1 0 0 0 0 0
 2015 4 3 0 0 75  0 0 0 0 0 0 0 2 6 3 3 3 2 3 5 14 12 7 4 6 4 1 0 0 0 0 0 0
 2016 4 3 0 0 75  0 0 0 0 0 0 0 3 4 1 7 6 8 4 2 7 7 8 11 2 3 1 1 0 0 0 0 0
 2017 4 3 0 0 75  0 0 2 0 0 0 0 2 2 3 4 7 8 7 5 4 4 8 10 4 1 2 2 0 0 0 0 0
 2018 4 3 0 0 75  0 0 0 0 0 0 0 1 5 1 1 3 8 5 8 9 10 4 6 8 4 2 0 0 0 0 0 0
 2019 4 3 0 0 75  0 0 0 0 0 0 0 0 5 1 3 9 5 4 6 6 4 7 3 7 10 3 2 0 0 0 0 0
 2020 4 3 0 0 75  0 0 0 0 0 0 0 2 4 1 5 9 4 2 5 3 3 7 9 8 11 2 0 0 0 0 0 0
 2016 4 4 0 0 75  0 0 0 0 0 0 0 0 0 0 2 2 2 4 8 3 11 12 8 13 6 2 2 0 0 0 0 0
 2017 4 4 0 0 75  0 0 0 0 0 0 0 0 0 0 1 6 2 5 10 4 5 6 11 11 8 6 0 0 0 0 0 0
 2019 4 4 0 0 75  0 0 0 0 0 0 0 0 1 0 1 2 5 6 6 3 8 5 15 12 8 1 2 0 0 0 0 0
 2001 3 5 0 0 75  0 0 0 0 0 0 0 0 3 1 3 6 2 2 1 6 8 8 12 8 10 4 1 0 0 0 0 0
 2004 3 5 0 0 75  1 0 0 0 0 0 0 0 0 0 3 3 6 4 6 7 9 7 12 7 4 3 2 1 0 0 0 0
 2005 3 5 0 0 75  0 0 0 1 0 0 0 1 0 0 0 1 4 3 4 8 9 14 15 8 7 0 0 0 0 0 0 0
 2006 3 5 0 0 75  0 0 0 1 0 0 0 0 1 0 1 0 2 2 2 6 13 8 12 16 8 2 1 0 0 0 0 0
 2007 3 5 0 0 75  0 0 0 0 0 0 0 0 2 0 2 2 3 4 1 1 4 11 15 16 12 2 0 0 0 0 0 0
 2009 3 5 0 0 75  0 0 0 0 0 0 0 0 0 0 1 3 0 5 11 5 6 6 4 13 15 5 1 0 0 0 0 0
 2010 3 5 0 0 75  0 0 0 0 0 0 0 0 0 1 0 1 3 4 12 11 6 8 8 7 10 3 1 0 0 0 0 0
 2011 3 5 0 0 75  0 0 0 0 0 0 0 0 1 0 1 2 2 1 4 7 7 9 13 14 9 5 0 0 0 0 0 0
 2012 3 5 0 0 75  0 0 0 0 0 0 0 0 0 0 1 1 6 2 8 5 7 11 12 7 10 3 2 0 0 0 0 0
 2013 3 5 0 0 75  0 0 0 0 0 0 0 0 0 0 1 1 2 4 7 10 7 9 9 13 8 2 2 0 0 0 0 0
 2014 3 5 0 0 75  0 0 0 0 0 0 0 0 0 0 2 3 1 6 8 8 11 10 8 7 8 1 2 0 0 0 0 0
 2015 3 5 0 0 75  0 1 0 0 0 0 0 1 0 1 3 1 2 0 4 7 19 15 6 10 4 1 0 0 0 0 0 0
 2016 3 5 0 0 75  0 0 0 0 0 0 0 0 0 0 0 2 1 0 5 3 6 21 11 10 9 6 1 0 0 0 0 0
 2017 3 5 0 0 75  0 0 0 0 0 0 0 0 0 0 0 0 3 4 3 3 9 10 17 10 12 2 2 0 0 0 0 0
 2018 3 5 0 0 75  0 0 0 0 0 0 0 0 0 0 0 0 4 5 4 3 5 9 10 21 10 4 0 0 0 0 0 0
 2019 3 5 0 0 75  0 0 0 0 0 0 0 0 0 0 1 1 0 4 3 7 6 10 13 15 11 3 1 0 0 0 0 0
 2020 3 5 0 0 75  0 0 0 0 0 0 0 0 0 0 2 1 0 5 5 6 6 12 16 8 13 0 1 0 0 0 0 0
 1991 2 6 0 0 75  1 0 0 0 0 0 3 0 1 4 1 3 2 2 5 3 4 3 13 17 10 3 0 0 0 0 0 0
 1993 2 6 0 0 75  0 0 0 0 0 0 0 0 1 3 3 3 3 5 8 10 9 7 10 5 3 5 0 0 0 0 0 0
 1994 2 6 0 0 75  0 0 0 0 0 0 2 0 0 0 3 1 3 4 8 9 7 4 9 11 8 4 2 0 0 0 0 0
 1995 2 6 0 0 75  0 0 0 0 0 2 2 2 0 1 3 1 2 5 3 6 11 10 11 5 7 3 1 0 0 0 0 0
 1996 2 6 0 0 75  1 0 0 0 1 0 2 0 0 3 1 1 1 2 1 2 10 10 12 14 9 4 1 0 0 0 0 0
 1997 2 6 0 0 75  0 0 0 0 0 0 1 0 2 2 2 2 6 1 2 4 5 9 15 9 12 1 1 0 1 0 0 0
 1998 2 6 0 0 75  0 0 0 0 0 0 1 0 0 3 4 2 3 2 7 6 5 7 13 13 7 1 1 0 0 0 0 0
 1999 2 6 0 0 75  3 0 0 0 0 0 0 0 0 2 2 1 0 6 4 5 11 6 7 11 11 5 1 0 0 0 0 0
 2000 2 6 0 0 75  0 0 0 0 0 1 2 1 1 0 0 0 3 3 2 6 10 7 8 17 9 4 1 0 0 0 0 0
 2001 2 6 0 0 75  1 0 0 0 0 0 1 0 1 6 0 0 0 0 3 3 14 8 8 12 11 5 2 0 0 0 0 0
 2002 2 6 0 0 75  1 0 0 0 0 1 3 0 0 2 6 1 3 2 3 3 3 7 8 20 7 4 1 0 0 0 0 0
 2003 2 6 0 0 75  0 0 0 0 0 0 1 1 0 0 4 3 5 5 5 3 9 4 8 12 10 5 0 0 0 0 0 0
 2004 2 6 0 0 75  0 0 0 0 0 0 0 0 0 0 3 3 6 9 5 5 5 9 12 7 4 6 1 0 0 0 0 0
 2005 2 6 0 0 75  0 0 0 0 0 0 2 1 0 1 2 1 1 4 8 12 13 6 8 11 2 2 1 0 0 0 0 0
 2006 2 6 0 0 75  0 0 0 0 0 1 3 1 1 2 1 0 1 2 3 9 11 10 12 10 5 2 1 0 0 0 0 0
 2007 2 6 0 0 75  1 0 0 0 0 0 2 1 1 5 1 2 1 2 2 2 5 5 14 14 14 3 0 0 0 0 0 0
 2008 2 6 0 0 75  1 0 0 0 0 2 0 1 1 3 2 2 5 4 1 4 4 4 18 9 8 5 1 0 0 0 0 0
 2009 2 6 0 0 75  1 0 0 0 0 1 0 1 1 1 1 3 7 7 6 4 3 3 11 14 10 1 0 0 0 0 0 0
 2010 2 6 0 0 75  0 0 0 0 0 1 2 1 0 1 0 1 4 5 7 4 15 6 6 14 6 2 0 0 0 0 0 0
 2011 2 6 0 0 75  0 0 0 0 0 1 2 0 0 0 3 3 7 2 5 4 12 8 4 13 9 1 1 0 0 0 0 0
 1991 2 7 0 0 75  0 0 0 0 0 1 1 1 5 6 10 4 5 6 3 2 2 5 5 9 7 3 0 0 0 0 0 0
 1992 2 7 0 0 75  1 0 0 0 0 2 1 1 0 4 5 5 5 5 5 6 0 5 9 11 8 1 1 0 0 0 0 0
 1993 2 7 0 0 75  1 0 0 0 0 0 0 1 1 3 3 4 9 5 11 9 5 4 3 9 4 3 0 0 0 0 0 0
 1994 2 7 0 0 75  1 0 0 0 0 0 1 0 0 1 0 1 5 5 11 7 7 10 8 10 1 4 3 0 0 0 0 0
 1995 2 7 0 0 75  2 0 0 0 0 0 0 1 0 1 2 1 1 4 5 5 6 14 10 13 8 2 0 0 0 0 0 0
 1996 2 7 0 0 75  0 0 0 0 0 0 2 1 1 3 4 5 4 4 2 5 10 7 12 7 5 3 0 0 0 0 0 0
 1997 2 7 0 0 75  1 0 0 0 0 0 2 1 0 8 2 2 5 3 5 1 2 7 12 9 11 4 0 0 0 0 0 0
 1998 2 7 0 0 75  0 0 0 0 0 0 2 0 0 2 4 1 4 8 3 6 5 9 10 9 6 3 2 0 1 0 0 0
 1999 2 7 0 0 75  2 0 0 0 0 0 1 0 0 2 3 1 4 8 6 13 7 4 5 8 8 2 0 1 0 0 0 0
 2000 2 7 0 0 75  1 0 0 0 0 0 3 1 0 0 0 1 3 5 5 10 11 5 11 7 7 4 1 0 0 0 0 0
 2001 2 7 0 0 75  0 0 0 0 0 0 1 2 2 3 8 1 0 1 5 4 11 9 8 10 7 3 0 0 0 0 0 0
 2002 2 7 0 0 75  2 0 0 0 0 0 4 1 1 3 6 1 3 3 3 5 7 5 2 17 6 6 0 0 0 0 0 0
 2003 2 7 0 0 75  0 0 0 0 0 0 0 1 1 5 8 1 10 4 6 5 3 7 7 7 7 2 0 1 0 0 0 0
 2004 2 7 0 0 75  0 0 0 0 0 0 0 0 1 4 4 2 5 8 10 8 6 7 7 3 7 1 2 0 0 0 0 0
 2005 2 7 0 0 75  2 0 0 0 0 3 0 0 0 0 2 1 4 2 8 8 5 13 11 9 6 1 0 0 0 0 0 0
 2006 2 7 0 0 75  1 0 0 0 0 1 3 1 1 0 3 2 3 6 5 8 9 9 6 9 5 3 0 0 0 0 0 0
 2007 2 7 0 0 75  0 0 0 0 0 0 0 0 1 2 4 5 2 1 3 9 6 12 8 12 7 3 0 0 0 0 0 0
 2008 2 7 0 0 75  0 0 0 0 0 0 1 1 0 2 0 4 6 7 2 2 3 9 11 15 8 4 0 0 0 0 0 0
 2009 2 7 0 0 75  0 0 0 0 0 0 0 0 0 0 2 3 4 11 6 6 4 2 11 17 7 2 0 0 0 0 0 0
 2010 2 7 0 0 75  1 0 0 0 0 1 4 0 1 0 3 0 2 3 3 10 10 7 9 7 9 5 0 0 0 0 0 0
 2011 2 7 0 0 75  3 0 0 0 0 0 4 1 0 1 4 2 1 2 3 7 13 6 8 12 5 2 1 0 0 0 0 0
 1993 2 8 0 0 75  1 0 0 0 0 1 3 3 0 7 7 4 7 5 7 7 5 2 6 6 4 0 0 0 0 0 0 0
 1994 2 8 0 0 75  0 0 0 0 0 3 6 1 0 2 1 0 4 7 7 9 13 9 8 3 1 1 0 0 0 0 0 0
 1995 2 8 0 0 75  0 0 0 0 0 3 6 1 1 5 4 2 2 6 3 10 8 9 8 2 2 2 1 0 0 0 0 0
 1996 2 8 0 0 75  0 0 0 0 0 2 7 1 2 4 5 4 4 2 5 3 10 4 9 8 2 3 0 0 0 0 0 0
 1997 2 8 0 0 75  0 0 0 0 0 0 3 1 3 4 4 6 5 6 2 3 5 8 7 9 7 2 0 0 0 0 0 0
 1998 2 8 0 0 75  0 0 0 0 0 2 2 1 0 3 5 5 7 6 8 8 7 6 5 3 5 2 0 0 0 0 0 0
 1999 2 8 0 0 75  2 0 0 0 0 0 2 0 1 2 2 3 7 5 7 5 7 9 7 10 3 0 3 0 0 0 0 0
 2000 2 8 0 0 75  2 0 0 0 0 0 11 5 0 0 2 1 5 5 3 11 7 4 8 4 6 1 0 0 0 0 0 0
 2001 2 8 0 0 75  2 0 0 0 0 4 9 2 0 6 6 5 2 1 3 4 6 5 7 8 5 0 0 0 0 0 0 0
 2002 2 8 0 0 75  0 0 0 0 0 3 8 3 4 9 7 6 4 7 1 2 2 10 4 2 2 1 0 0 0 0 0 0
 2003 2 8 0 0 75  0 0 0 0 0 2 3 1 2 13 8 5 7 6 3 1 2 1 7 5 6 3 0 0 0 0 0 0
 2004 2 8 0 0 75  0 0 0 0 0 1 3 1 3 5 4 5 7 9 12 7 1 7 2 5 2 1 0 0 0 0 0 0
 2005 2 8 0 0 75  0 0 0 0 0 1 1 0 1 3 0 6 3 5 11 8 7 7 8 8 6 0 0 0 0 0 0 0
 2006 2 8 0 0 75  1 0 0 0 0 3 9 2 3 2 3 2 2 3 1 8 5 10 12 4 3 2 0 0 0 0 0 0
 2007 2 8 0 0 75  0 0 0 0 0 3 5 5 0 5 8 6 4 3 2 5 7 2 6 9 3 0 1 1 0 0 0 0
 2008 2 8 0 0 75  0 0 0 0 0 2 5 2 1 8 13 4 2 6 4 2 4 3 7 4 4 2 1 1 0 0 0 0
 2009 2 8 0 0 75  0 0 0 0 0 0 4 2 2 3 5 8 7 11 6 3 1 4 7 6 6 0 0 0 0 0 0 0
 2010 2 8 0 0 75  1 0 0 0 0 2 2 4 0 7 5 2 2 4 13 5 3 8 7 7 3 0 0 0 0 0 0 0
 2011 2 8 0 0 75  0 0 0 0 0 3 6 3 3 8 8 3 3 3 4 7 3 8 7 3 1 1 1 0 0 0 0 0
 1997 2 9 0 0 75  1 0 1 0 0 3 3 5 2 6 8 1 6 4 3 4 3 4 3 13 3 2 0 0 0 0 0 0
 2000 2 9 0 0 75  0 0 0 0 0 4 6 5 0 5 0 2 2 3 6 5 7 6 5 14 2 3 0 0 0 0 0 0
 2002 2 9 0 0 75  0 0 0 0 0 2 5 3 2 7 8 2 8 4 3 2 4 5 9 7 2 2 0 0 0 0 0 0
 2003 2 9 0 0 75  0 0 0 0 0 1 4 1 0 14 12 2 7 7 5 2 1 3 5 8 0 3 0 0 0 0 0 0
 2004 2 9 0 0 75  0 0 0 0 0 1 1 1 1 3 2 5 10 5 7 7 5 6 8 7 4 2 0 0 0 0 0 0
 2005 2 9 0 0 75  1 0 0 0 0 1 7 1 1 1 6 2 4 6 7 8 10 4 7 7 1 1 0 0 0 0 0 0
 2006 2 9 0 0 75  0 0 0 0 0 4 6 0 2 8 5 1 4 2 2 11 4 8 4 12 0 0 2 0 0 0 0 0
 2007 2 9 0 0 75  1 0 0 0 0 1 4 5 4 6 7 5 3 1 3 5 3 9 7 7 3 1 0 0 0 0 0 0
 2008 2 9 0 0 75  2 0 0 0 0 1 5 0 6 6 6 4 5 5 5 3 4 5 7 4 6 1 0 0 0 0 0 0
 2009 2 9 0 0 75  0 0 0 0 0 1 4 1 3 4 2 9 8 7 3 4 4 6 6 9 4 0 0 0 0 0 0 0
 2010 2 9 0 0 75  1 0 0 0 0 5 5 0 1 4 3 3 4 5 7 4 7 7 9 5 4 1 0 0 0 0 0 0
 2011 2 9 0 0 75  1 0 0 0 1 3 7 7 4 6 3 3 1 2 3 7 7 6 4 7 1 1 1 0 0 0 0 0
 1978 6 11 0 0 75  0 0 13 7 0 0 0 4 1 1 7 5 6 1 1 4 3 4 4 6 4 3 1 0 0 0 0 0
 1981 6 11 0 0 75  0 0 2 0 0 0 0 2 6 1 5 9 9 5 4 3 4 5 7 7 4 2 0 0 0 0 0 0
 1982 6 11 0 0 75  0 0 5 0 0 0 1 4 2 1 7 3 7 6 10 6 5 3 5 4 4 2 0 0 0 0 0 0
 1983 6 11 0 0 75  0 0 3 1 0 0 0 1 0 2 6 1 4 6 9 9 7 3 9 6 6 1 1 0 0 0 0 0
 1988 6 11 0 0 75  0 0 7 5 0 0 1 6 8 5 5 2 2 3 3 1 5 2 5 11 3 0 0 1 0 0 0 0
 1992 6 11 0 0 75  0 0 5 1 0 0 1 0 8 2 6 3 8 8 6 6 3 5 6 6 0 1 0 0 0 0 0 0
 1993 6 11 0 0 75  0 1 9 4 0 0 0 2 2 4 1 2 3 7 10 5 5 5 7 5 2 1 0 0 0 0 0 0
 1994 6 11 0 0 75  0 3 15 4 0 0 0 1 6 3 1 2 2 2 6 8 5 6 5 3 3 0 0 0 0 0 0 0
 1995 6 11 0 0 75  0 1 22 5 0 0 1 3 5 2 2 4 0 2 4 3 7 2 5 4 2 1 0 0 0 0 0 0
 1996 6 11 0 0 75  0 0 12 5 0 0 0 8 8 4 5 7 3 2 2 2 1 4 4 3 4 1 0 0 0 0 0 0
 1997 6 11 0 0 75  0 1 3 2 0 0 0 2 8 5 9 4 2 10 4 3 5 3 2 6 3 1 2 0 0 0 0 0
 1998 6 11 0 0 75  0 0 3 0 0 0 0 4 5 1 7 3 4 6 4 6 6 3 5 10 6 1 1 0 0 0 0 0
 1999 6 11 0 0 75  0 2 15 2 0 0 0 0 2 0 5 4 1 6 4 6 8 5 7 3 5 0 0 0 0 0 0 0
 2000 6 11 0 0 75  0 4 17 7 0 0 0 8 7 3 2 0 0 2 3 1 4 6 2 6 2 0 1 0 0 0 0 0
 2001 6 11 0 0 75  0 0 13 6 0 0 0 4 6 5 3 3 6 2 1 5 4 3 3 6 3 1 1 0 0 0 0 0
 2002 6 11 0 0 75  0 0 6 2 0 0 0 2 10 4 4 9 5 6 1 4 4 1 7 4 5 1 0 0 0 0 0 0
 2003 6 11 0 0 75  0 0 3 1 0 0 1 4 6 2 9 9 10 5 7 2 2 4 2 1 5 0 1 1 0 0 0 0
 2004 6 11 0 0 75  0 0 13 3 0 0 0 6 4 0 2 5 2 3 7 3 3 6 6 5 4 3 0 0 0 0 0 0
 2005 6 11 0 0 75  0 1 14 7 0 0 0 1 6 2 1 4 2 4 6 6 1 5 7 5 2 1 0 0 0 0 0 0
 2006 6 11 0 0 75  0 0 17 4 0 0 0 8 11 3 1 3 0 0 0 3 3 2 7 5 7 1 0 0 0 0 0 0
 2007 6 11 0 0 75  0 3 7 2 0 0 0 7 4 4 6 7 3 2 0 1 7 8 7 4 1 1 1 0 0 0 0 0
 2008 6 11 0 0 75  0 0 9 4 0 0 1 3 4 6 4 7 6 3 3 5 2 1 6 6 4 1 0 0 0 0 0 0
 2009 6 11 0 0 75  0 1 18 5 0 0 0 4 3 1 2 6 3 7 9 2 4 3 2 4 0 1 0 0 0 0 0 0
 2010 6 11 0 0 75  0 0 12 7 0 0 0 6 9 4 1 3 4 3 3 6 3 3 1 3 5 1 1 0 0 0 0 0
 2011 6 11 0 0 75  0 2 15 7 0 0 0 8 7 1 5 4 1 3 1 3 5 2 3 3 3 2 0 0 0 0 0 0
 2012 6 11 0 0 75  0 0 3 2 0 0 2 4 11 5 2 3 4 9 7 2 7 1 10 1 1 1 0 0 0 0 0 0
 2013 6 11 0 0 75  0 0 10 3 0 0 1 1 4 4 6 7 4 6 4 4 2 3 6 5 3 1 1 0 0 0 0 0
 2014 6 11 0 0 75  0 0 13 5 0 0 0 2 3 1 2 1 2 6 9 7 8 8 1 5 2 0 0 0 0 0 0 0
 2015 6 11 0 0 75  0 0 12 3 0 0 1 7 4 2 0 3 2 1 6 5 7 6 8 4 4 0 0 0 0 0 0 0
 2016 6 11 0 0 75  0 0 6 4 0 0 1 6 12 5 1 4 5 2 0 4 5 6 9 2 2 0 1 0 0 0 0 0
 2017 6 11 0 0 75  0 0 10 4 0 0 0 3 6 1 1 2 4 5 2 5 5 8 10 6 1 1 1 0 0 0 0 0
 2018 6 11 0 0 75  0 0 8 6 0 0 1 1 4 4 1 2 3 3 5 7 4 1 9 14 0 1 1 0 0 0 0 0
 2019 6 11 0 0 75  0 1 9 2 0 0 0 3 10 4 3 2 2 2 4 5 5 5 7 7 2 1 1 0 0 0 0 0
 2020 6 11 0 0 75  0 0 3 2 0 0 0 2 2 3 3 7 1 3 4 7 6 7 5 12 4 2 2 0 0 0 0 0
-9999 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
#
0 #_N_age_bins
# 0 #_N_ageerror_definitions
#_mintailcomp: upper and lower distribution for females and males separately are accumulated until exceeding this level.
#_addtocomp:  after accumulation of tails; this value added to all bins
#_combM+F: males and females treated as combined gender below this bin number 
#_compressbins: accumulate upper tail by this number of bins; acts simultaneous with mintailcomp; set=0 for no forced accumulation
#_Comp_Error:  0=multinomial, 1=dirichlet using Theta*n, 2=dirichlet using beta, 3=MV_Tweedie
#_ParmSelect:  consecutive index for dirichlet or MV_Tweedie
#_minsamplesize: minimum sample size; set to 1 to match 3.24, minimum value is 0.001
#
#_mintailcomp addtocomp combM+F CompressBins CompError ParmSelect minsamplesize
# 0 0 0 0 0 0 0 #_fleet:1_FISHERYBS
# 0 0 0 0 0 0 0 #_fleet:2_FISHERYEI
# 0 0 0 0 0 0 0 #_fleet:3_FISHERYGS
# 0 0 0 0 0 0 0 #_fleet:4_FISHERYJOIN
# 0 0 0 0 0 0 0 #_fleet:5_FISHERYSSIW
# 0 0 0 0 0 0 0 #_fleet:6_SURVEYBS
# 0 0 0 0 0 0 0 #_fleet:7_SURVEYEI
# 0 0 0 0 0 0 0 #_fleet:8_SURVEYGS
# 0 0 0 0 0 0 0 #_fleet:9_SURVEYJOIN
# 0 0 0 0 0 0 0 #_fleet:10_SURVEYSSIW
# 0 0 0 0 0 0 0 #_fleet:11_PREDATOR
# 0 #_Lbin_method_for_Age_Data: 1=poplenbins; 2=datalenbins; 3=lengths
# sex codes:  0=combined; 1=use female only; 2=use male only; 3=use both as joint sex*length distribution
# partition codes:  (0=combined; 1=discard; 2=retained
#_yr month fleet sex part ageerr Lbin_lo Lbin_hi Nsamp datavector(female-male)
# -9999  0 0 0 0 0 0 0 0
#
0 #_Use_MeanSize-at-Age_obs (0/1)
#
1 #_N_environ_variables
# -2 in yr will subtract mean for that env_var; -1 will subtract mean and divide by stddev (e.g. Z-score)
#Yr Variable Value
 2000 1 1.13
 2001 1 0.684
 2002 1 0.693
 2003 1 0.737
 2004 1 0.683
 2005 1 0.716
 2006 1 0.693
 2007 1 0.67
 2008 1 0.708
 2009 1 0.653
 2010 1 0.699
 2011 1 0.642
 2012 1 0.647
 2013 1 0.672
 2014 1 0.658
 2015 1 0.694
 2016 1 0.764
 2017 1 0.675
 2018 1 0.724
 2019 1 0.662
 2020 1 0.622
 -1 1 1
-9999 0 0
#
# Sizefreq data. Defined by method because a fleet can use multiple methods
0 # N sizefreq methods to read (or -1 for expanded options)
#
0 # do tags (0/1)
#
0 #    morphcomp data(0/1) 
#  Nobs, Nmorphs, mincomp
#  yr, seas, type, partition, Nsamp, datavector_by_Nmorphs
#
0  #  Do dataread for selectivity priors(0/1)
 # Yr, Seas, Fleet,  Age/Size,  Bin,  selex_prior,  prior_sd
 # feature not yet implemented
#
999

