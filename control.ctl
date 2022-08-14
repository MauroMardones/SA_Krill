# Brama_2022 Operating model. Developed by Mauricio Mardones - Jun 2020
#_data_and_control_files: ss.dat, control.ctl
#V3.30.15.00-trans;_2018_01_09;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_11.6
#_data_and_control_files: ss.dat // control.ctl
#_user_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_user_info_available_at:https://vlab.ncep.noaa.gov/group/stock-synthesis

0  # 0 means do not read wtatage.ss; 1 means read and use wtatage.ss and also read and use growth parameters
1  #_N_Growth_Patterns
1 #_N_platoons_Within_GrowthPattern 
#_Cond 1 #_Morph_between/within_stdev_ratio (no read if N_morphs=1)
#_Cond  1 #vector_Morphdist_(-1_in_first_val_gives_normal_approx)
#
4 # recr_dist_method for parameters:  2=main effects for GP, Settle timing, Area; 3=each Settle entity; 4=none when N_GP*Nsettle*pop==1
1 # not yet implemented; Future usage: Spawner-Recruitment: 1=global; 2=by area
1 #  number of recruitment settlement assignments 
0 # unused option
#GPattern month  area  age (for each settlement assignment)
 1 1 1 0
#
#_Cond 0 # N_movement_definitions goes here if Nareas > 1
#_Cond 1.0 # first age that moves (real age at begin of season, not integer) also cond on do_migration>0
#_Cond 1 1 1 2 4 10 # example move definition for seas=1, morph=1, source=1 dest=2, age1=4, age2=10
#
1 #_Nblock_Patterns
1 #_blocks_per_pattern 
# begin and end years of blocks
1996 2021 
#
# controls for all timevary parameters 
1 #_env/block/dev_adjust_method for all time-vary parms (1=warn relative to base parm bounds; 3=no bound check)
#  autogen
0 0 0 0 0 # autogen: 1st element for biology, 2nd for SR, 3rd for Q, 4th reserved, 5th for selex
# where: 0 = autogen all time-varying parms; 1 = read each time-varying parm line; 2 = read then autogen if parm min==-12345
# 
#
# setup for M, growth, maturity, fecundity, recruitment distibution, movement 
#
0 #_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate
  #_no additional input for selected M option; read 1P per morph
1 # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age_specific_K; 4=not implemented
2 #_Age(post-settlement)_for_L1;linear growth below this
999 #_Growth_Age_for_L2 (999 to use as Linf)
-999 #_exponential decay for growth above maxage (fixed at 0.2 in 3.24; value should approx initial Z; -999 replicates 3.24)
0  #_placeholder for future growth feature
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
0 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
1 	#_maturity_option:1=length_logistic;2=age_logistic;3=read_age-maturity_matrix;4=readage-fecundity;5=disabled;6=read_length-maturity
#0.001	0.001	0.002	0.003	0.006	0.01	0.018	0.032	0.057	0.959	0.977	0.987	0.993	0.996	0.998	0.999	0.999	1	1	1	1	1	1	1	1	1	1	1
#_Age_Maturity by growth pattern
#0 0 0 0.5 0.95 1 1 1 1 1 1 1 
3 #_First_Mature_Age
1 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option:  0=none; 1=female-to-male age-specific fxn; -1=male-to-female age-specific fxn
1 #_parameter_offset_approach (1=none, 2= M, G, CV_G as offset from female-GP1, 3=like SS2 V1.x)
#
#_growth_parms
#_ LO HI INIT PRIOR PR_SD PR_type PHASE env_var&link dev_link dev_minyr dev_maxyr dev_PH Block Block_Fxn
0.05	0.5	0.4	0.4	0.5	0	-3	0	0	0	0	0	0	0	#	NatM_p_1_Fem_GP_1	
-10	10	3	2	0.5	6	2	0	0	0	0	0	0	0	#	L_at_Amin_Fem_GP_1	
1	9	6	6	0.5	6	4	0	0	0	0	0	0	0	#	L_at_Amax_Fem_GP_1	
0.05	1	0.45	0.4	0.5	6	4	0	0	0	0	0	0	0		#	VonBert_K_Fem_GP_1	
0.05	0.25	0.1	0.1	0.5	0	-3	0	0	0	0	0	0	0	#	CV_young_Fem_GP_1	
0.05	0.25	0.1	0.1	0.5	0	-3	0	0	0	0	0	0	0	#	CV_old_Fem_GP_1	
-3 3 2.44e-06 2.44e-06 0.8 0 -3 0 0 0 0 0 0 0 	#	Wtlen_1_Fem	
-3 4 3.34694 3.34694 0.8 0 -3 0 0 0 0 0 0 0	#	Wtlen_2_Fem	
0.2	6	3.4	3	0.8	0	-3	0	0	0	0	0	0	0	#	Mat50%_Fem	
-3	3	-0.25	-0.25	0.8	0	-3	0	0	0	0	0	0	0	#	Mat_slope_Fem	
-3	3	1	1	0.8	0	-3	0	0	0	0	0	0	0	#	Eggs/kg_inter_Fem	
-3	3	0	0	0.8	0	-3	0	0	0	0	0	0	0	#	Eggs/kg_slope_wt_Fem	
#0	2	1	1	0.05	0	-50	0	0	0	0	0	0	0	#	RecrDist_GP_1	
#0	2	1	1	0.05	0	-50	0	0	0	0	0	0	0	#	RecrDist_Area_1	
#0	10	1	1	0.05	0	-3	0	0	0	0	0	0	0	#	RecrDist_timing_1	
0.1	10	1	1	0.05	0	-1	0	0	0	0	0	0	0	#	CohortGrowDev	
1e-06 0.999999 0.5 0.5 0.5 0 0 0 0 0 0 0 0 0	#	FracFemale_GP_1	
#
#_no timevary MG parameters
#
#_seasonal_effects_on_biology_parms
0 0 0 0 0 0 0 0 0 0 #_femwtlen1,femwtlen2,mat1,mat2,fec1,fec2,Malewtlen1,malewtlen2,L1,K
#_ LO HI INIT PRIOR PR_SD PR_type PHASE
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no seasonal MG parameters
#
#_Spawner-Recruitment,
3 #_SR_function: 2=Ricker; 3=std_B-H; 4=SCAA; 5=Hockey; 6=B-H_flattop; 7=survival_3Parm; 8=Shepard_3Parm
1 # 0/1 to use steepness in initial equ recruitment calculation
0  #  future feature:  0/1 to make realized sigmaR a function of SR curvature
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn #  parm_name
3	16	6	6	0	0	1	0	0	0	0	0	0	0	#	SR_LN(R0)
0.2	1	0.8	0.8	0.15	0	-2	0	0	0	0	0	0	0	#	SR_BH_steep
0	1	0.6	0.6	99	6	-4	0	0	0	0	0	0	0	#	SR_sigmaR
-5	1	0.6	0.6	99	6	-6	0	0	0	0	0	0	0	#	SR_regime
0	0.5	0	1	99	6	-3	0	0	0	0	0	0	0	#	SR_autocorr

1 #do_recdev:  0=none; 1=devvector; 2=simple deviations
1996 # first year of main recr_devs; early devs can preceed this era
2020 # last year of main recr_devs; forecast devs start in following year
1 #_recdev phase 
0 # (0/1) to read 13 advanced options
#_Cond 0 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
#_Cond 0 #_recdev_early_phase
#_Cond 0 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
#_Cond 1 #_lambda for Fcast_recr_like occurring before endyr+1
#_Cond 991 #_last_early_yr_nobias_adj_in_MPD
#_Cond 1990 #_first_yr_fullbias_adj_in_MPD
#_Cond 2021 #_last_yr_fullbias_adj_in_MPD
#_Cond 2021 #_first_recent_yr_nobias_adj_in_MPD
#_Cond 1 #_max_bias_adj_in_MPD (-1 to override ramp and set biasadj=1.0 for all estimated recdevs)
#_Cond 0 #_period of cycles in recruitment (N parms read below)
#_Cond -5 #min rec_dev
#_Cond 5 #max rec_dev
#_Cond 0 #_read_recdevs
#_end of advanced SR options
#_end of advanced SR options
#
# read specified recr devs
#_Yr Input_value

#
#Fishing Mortality info 
0.2 # F ballpark
-1995 # F ballpark year (neg value to disable)
3 # F_Method:  1=Pope; 2=instan. F; 3=hybrid (hybrid is recommended)
4 # max F or harvest rate, depends on F_Method
# no additional F input needed for Fmethod 1
# if Fmethod=2; read overall start F value; overall phase; N detailed inputs to read
# if Fmethod=3; read N iterations for tuning for Fmethod 3
3  # N iterations for tuning F in hybrid method (recommend 3 to 7)
#
#_initial_F_parms; count = 0
#_ LO HI INIT PRIOR PR_SD  PR_type  PHASE
#2015 2032
# F rates by fleet
#Yr:	1979	1980	1981	1982	1983	1984	1985	1986	1987	1988	1989	1990	1991	1992	1993	1994	1995	1996	1997	1998	1999	2000	2001	2002	2003	2004	2005	2006	2007	2008	2009	2010	2011	2012	2013	2014	2015	2016	2017	2018	2019
#seas:	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1
#ALBN01-ESP_BBrec	0	0	0.090719	0.0898746	0.135089	0.0401786	0.0791598	0.0850566	0.114943	0.140982	0.112384	0.110768	0.0622264	0.0715338	0.0701627	0.0665131	0.0776918	0.0720464	0.0608724	0.0715539	0.0750461	0.0794972	0.0418394	0.0491296	0.0749748	0.0530744	0.0642104	0.110186	0.0572822	0.0604155	0.0306891	0.0389455	0.072983	0.072983	0.072983	0.072983	0.072983	0.072983	0.072983	0.072983	0.072983
#_Q_setup for fleets with cpue or survey data
#_1:  link type: (1=simple q, 1 parm; 2=mirror simple q, 1 mirrored parm; 3=q and power, 2 parm)
#_2:  extra input for link, i.e. mirror fleet
#_3:  0/1 to select extra sd parameter
#_4:  0/1 for biasadj or not
#_5:  0/1 to float
#_   fleet      link link_info  extra_se   biasadj     float  #  fleetname
1         1         0         0         0         0  # FISHERY1
2         1         0         0         0         0  # SURVEY1
-999 0 0 0 0 0
#
#_Q_parms(if_any);Qunits_are_ln(q)
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
-15           15      -5.29894             0             1             0          1          0          0          0          0          0          0          0 #  LnQ_base_FISHERY1(1)
-15           15      -5.29894             0             1             0          1          0          0          0          0          0          0          0 #  LnQ_base_SURVEY1(2)
#_no timevary Q parameters
#
#_size_selex_patterns
#Pattern:_0; parm=0; selex=1.0 for all sizes
#Pattern:_1; parm=2; logistic; with 95% width specification
#Pattern:_5; parm=2; mirror another size selex; PARMS pick the min-max bin to mirror
#Pattern:_15; parm=0; mirror another age or length selex
#Pattern:_6; parm=2+special; non-parm len selex
#Pattern:_43; parm=2+special+2;  like 6, with 2 additional param for scaling (average over bin range)
#Pattern:_8; parm=8; New doublelogistic with smooth transitions and constant above Linf option
#Pattern:_9; parm=6; simple 4-parm double logistic with starting length; parm 5 is first length; parm 6=1 does desc as offset
#Pattern:_21; parm=2+special; non-parm len selex, read as pairs of size, then selex
#Pattern:_22; parm=4; double_normal as in CASAL
#Pattern:_23; parm=6; double_normal where final value is directly equal to sp(6) so can be >1.0
#Pattern:_24; parm=6; double_normal with sel(minL) and sel(maxL), using joiners
#Pattern:_25; parm=3; exponential-logistic in size
#Pattern:_27; parm=3+special; cubic spline 
#Pattern:_42; parm=2+special+3; // like 27, with 2 additional param for scaling (average over bin range)
#_discard_options:_0=none;_1=define_retention;_2=retention&mortality;_3=all_discarded_dead;_4=define_dome-shaped_retention
#_Pattern Discard Male Special
0 0 0 0 # 1 FISHERY1
0 0 0 0 # 2 SURVEY1
#
#_age_selex_types
#Pattern:_0; parm=0; selex=1.0 for ages 0 to maxage
#Pattern:_10; parm=0; selex=1.0 for ages 1 to maxage
#Pattern:_11; parm=2; selex=1.0  for specified min-max age
#Pattern:_12; parm=2; age logistic
#Pattern:_13; parm=8; age double logistic
#Pattern:_14; parm=nages+1; age empirical
#Pattern:_15; parm=0; mirror another age or length selex
#Pattern:_16; parm=2; Coleraine - Gaussian
#Pattern:_17; parm=nages+1; empirical as random walk  N parameters to read can be overridden by setting special to non-zero
#Pattern:_41; parm=2+nages+1; // like 17, with 2 additional param for scaling (average over bin range)
#Pattern:_18; parm=8; double logistic - smooth transition
#Pattern:_19; parm=6; simple 4-parm double logistic with starting age
#Pattern:_20; parm=6; double_normal,using joiners
#Pattern:_26; parm=3; exponential-logistic in age
#Pattern:_27; parm=3+special; cubic spline in age
#Pattern:_42; parm=2+nages+1; // cubic spline; with 2 additional param for scaling (average over bin range)
#_Pattern Discard Male Special
12 0 0 0 # 1 FISHERY1
12 0 0 0 # 2 SURVEY1
#
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
1.9            8.0       3.37265            3.0          0.01             1          2          0          0          0          0          0          0          0	#	SizeSel_P1_FISHERY(1)
0.01            8.0       7.5            7.5         0.01             1          3          0          0          0          0          0          0          0 #	SizeSel_P2_FISHERY(1)
  0            4            4             4            99             0        -99          0          0          0          0          0          0          0 	#	AgeSel_P1_FISHERY(1)
  0            8            6             6            99             0        -99          0          0          0          0          0          0          0		#	AgeSel_P2_FISHERY(1)
#25	55	40.37	40.37	99	0	-2	0	0	0	0	0	0	0	#	SizeSel_P1_FISHERY(2)
#1	10	5.2	5.2	99	0	-2	0	0	0	0	0	0	0	#	SizeSel_P2_FISHERY(2)
#3	12	6	5	99	0	-2	0	0	0	0	0.5	0	0	#	AgeSel_P1_FISHERY(2)
#2	10	3	3	99	0	-2	0	0	0	0	0.5	0	0	#	AgeSel_P2_FISHERY(2)
#
0   #  use 2D_AR1 selectivity(0/1):  experimental feature
#_no 2D_AR1 selex offset used
#
# Tag loss and Tag reporting parameters go next
0  # TG_custom:  0=no read; 1=read if tags exist
#_Cond -6 6 1 1 2 0.01 -4 0 0 0 0 0 0 0  #_placeholder if no parameters
#
# no timevary parameters
#
#
# Input variance adjustments factors: 
 #_1=add_to_survey_CV
 #_2=add_to_discard_stddev
 #_3=add_to_bodywt_CV
 #_4=mult_by_lencomp_N
 #_5=mult_by_agecomp_N
 #_6=mult_by_size-at-age_N
 #_7=mult_by_generalized_sizecomp
#_Factor  Fleet  Value
 #4 1 0.0045
 #4 2 0.0051
-9999   1    0 # terminator
#
4 #_maxlambdaphase
1 #_sd_offset; must be 1 if any growthCV, sigmaR, or survey extraSD is an estimated parameter
# read 0 changes to default Lambdas (default value is 1.0)
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=SizeFreq; 7=sizeage; 8=catch; 9=init_equ_catch; 
# 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin; 17=F_ballpark
#like_comp fleet  phase  value  sizefreq_method
1 2 2 1 1
2 2 2 1 1
-9999  1  1  1  1  #  terminator
#
# lambdas (for info only; columns are phases)
#  0 #_CPUE/survey:_1
#  1 #_CPUE/survey:_2
#  1 #_CPUE/survey:_3
#  1 #_CPUE/survey:_4
#  0 #_lencomp:_1
#  0 #_lencomp:_2
#  1 #_lencomp:_3
#  0 #_lencomp:_4
#  1 #_agecomp:_1
#  1 #_agecomp:_2
#  1 #_agecomp:_3
#  0 #_agecomp:_4
#  1 #_init_equ_catch
#  1 #_recruitments
#  1 #_parameter-priors
#  1 #_parameter-dev-vectors
#  1 #_crashPenLambda
#  0 # F_ballpark_lambda
0 # (0/1) read specs for more stddev reporting 
 # 0 1 -1 5 1 5 1 -1 5 # placeholder for selex type, len/age, year, N selex bins, Growth pattern, N growth ages, NatAge_area(-1 for all), NatAge_yr, N Natages
 # placeholder for vector of selex bins to be reported
 # placeholder for vector of growth ages to be reported
 # placeholder for vector of NatAges ages to be reported
999
