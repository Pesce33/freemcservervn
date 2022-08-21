-- SUBSAMPLING TABLE 'SourceObj' ---

 -- Insert subset into destination table
 TRUNCATE TABLE [SkyNode_ROSAT2RXS_STAT].[dbo].[SourceObj];

 GO
 -- Create temporary table for the random ID list
 IF EXISTS( SELECT * FROM tempdb.dbo.sysobjects WHERE ID = OBJECT_ID(N'tempdb..##temporaryidlist'))
 DROP TABLE ##temporaryidlist;
 GO

 CREATE TABLE ##temporaryidlist
 (
	[IAU_NAME] char(21)
 );
 
 -- Collect IDs
 WITH temporaryidlistquery AS
 (
	SELECT sourcetablealias.[IAU_NAME], gw.RandomDouble() AS randomnumber
	FROM [SkyNode_ROSAT2RXS].[dbo].[SourceObj] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [IAU_NAME]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.1;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_ROSAT2RXS_STAT].[dbo].[SourceObj] WITH (TABLOCKX)
	([cx], [cy], [cz], [htmid], [zoneid], [IAU_NAME], [SEQ_ID], [IND_DET], [EXI_ML], [CTS], [CERR], [RATE], [ERATE], [EXPOSURE], [RA], [DEC], [RA_HMS], [DEC_DMS], [LII], [BII], [LAMBDA], [BETA], [EXT], [EXTERR], [EXT_ML], [HR_1], [HR_1_err], [HR_2], [HR_2_err], [USKY], [Masked], [FLAG_all], [S_flag], [INDEX], [AMPL_MAX], [CM], [CD], [CTS_lc], [CMIN], [CMAX], [EMIN], [EMAX], [CHI2_lc], [EXCESS_VAR], [UNCERTAINTY], [Sigma_Excess], [NH_gal], [NH_fit_p], [NH_err_p], [NORM_p], [NORM_err_p], [GAMMA_p], [GAMMA_err_p], [CTR_spec_p], [FLUX_p], [Chi2red_spec_p], [Chi2_spec_p], [Num_Data_pts_p], [Num_Deg_free_p], [NH_fit_m], [NH_err_m], [NORM_m], [NORM_err_m], [Temp_fit_m], [Temp_err_m], [CTR_spec_m], [FLUX_m], [Chi2red_spec_m], [Chi2_spec_m], [Num_Data_pts_m], [Num_Deg_free_m], [NH_fit_b], [NH_err_b], [NORM_b], [NORM_err_b], [Temp_fit_b], [Temp_err_b], [CTR_spec_b], [FLUX_b], [Chi2red_spec_b], [Chi2_spec_b], [Num_Data_pts_b], [Num_Deg_free_b], [X_IMA], [Y_IMA], [XERR], [YERR], [X_SKY], [Y_SKY], [CUT_RAD], [FA], [TOTNUM], [BGR], [VIG_COR], [REMARKS], [SB1], [SB2], [SB3], [SB4], [B1], [B2], [B3], [B4], [B_SPA], [S1], [S2], [S3], [S4], [mult_xmmsl1], [entr_xmmsl1], [dist_xmmsl1], [RA_xmmsl1], [DEC_xmmsl1], [SRCNAME_xmmsl1], [RATE_B0_xmmsl1], [RATE_B0e_xmmsl1], [RATE_B5_xmmsl1], [RATE_B5e_xmmsl1], [mult_3xmm], [entr_3xmm], [dist_3xmm], [RA_3xmm], [DEC_3xmm], [SRCNAME_3xmm], [RATE_EP8_3xmm], [RATE_EP8e_3xmm], [FLUX_R_3xmm], [FLUX_R_err_3xmm], [mult_2rxp], [entr_2rxp], [dist_2rxp], [RA_2rxp], [DEC_2rxp], [SRCNAME_2rxp], [CRATE_2rxp], [CRATE_err_2rxp], [ExpTime_2rxp], [ObsID_2rxp], [mult_1rxs], [entr_1rxs], [dist_1rxs], [RA_1rxs], [DEC_1rxs], [SRCNAME_1rxs], [RATE_1rxs], [RATE_err_1rxs], [CTS_1rxs], [CTS_err_1rxs], [EXI_ML_1rxs], [EXPOS_1rxs], [HR1_1rxs], [HR1e_1rxs], [HR2_1rxs], [HR2e_1rxs], [mult_vv10], [entr_vv10], [dist_vv10], [NAME_vv10], [Type_vv10], [Vmag_vv10], [z_vv10], [Index_vv10], [RA_vv10], [DEC_vv10], [mult_tyc2], [entr_tyc2], [dist_tyc2], [RA_tyc2], [DEC_tyc2], [RecNo_tyc2], [VTmag_tyc2], [BTmag_tyc2], [TYC1_tyc2], [TYC2_tyc2], [TYC3_tyc2], [mult_bri], [entr_bri], [dist_bri], [RA_bri], [DEC_bri], [Vmag_bri], [SpType_bri], [RecNo_bri], [HD_bri], [mult_hmxb], [entr_hmxb], [dist_hmxb], [RA_hmxb], [DEC_hmxb], [Name_hmxb], [Name2_hmxb], [Vmag_hmxb], [mult_lmxb], [entr_lmxb], [dist_lmxb], [RA_lmxb], [DEC_lmxb], [Name_lmxb], [Name2_lmxb], [Vmag_lmxb], [mult_atnf], [entr_atnf], [dist_atnf], [RA_atnf], [DEC_atnf], [Name_atnf], [Type_atnf], [Period_atnf], [mult_fuh], [entr_fuh], [dist_fuh], [RA_fuh], [DEC_fuh], [Seq_fuh], [Name_fuh], [mult_1sxps], [entr_1sxps], [dist_1sxps], [RA_1sxps], [DEC_1sxps], [Expos_1sxps], [DET_1sxps], [DET0_1sxps], [DET1_1sxps], [DET2_1sxps], [DET3_1sxps], [INDEX_1sxps], [Rate0_1sxps], [ERate0_1sxps], [mult_1rxh], [entr_1rxh], [dist_1rxh], [RA_1rxh], [DEC_1rxh], [SRCNAME_1rxh], [CRATE_1rxh], [CRATE_err_1rxh], [ExpTime_1rxh], [SNR_1rxh], [mult_flem], [entr_flem], [dist_flem], [RA_flem], [DEC_flem], [SRCNAME_flem], [Type_flem], [WFC_flem], [Rate_flem], [e_Rate_flem], [mult_wd], [entr_wd], [dist_wd], [RA_wd], [DEC_wd], [SRCNAME_wd], [Vmag_wd], [Vsphot_wd], [mult_sdss], [entr_sdss], [dist_sdss], [RA_sdss], [DEC_sdss], [SDSS_NAME], [LAMBDA_sdss], [BETA_sdss], [mult_2rxs], [entr_2rxs], [dist_2rxs], [INDEX_2rxs], [SEQ_ID_2rxs], [IND_DET_2rxs], [EXI_ML_2rxs], [RATE_2rxs], [RA_2rxs], [DEC_2rxs], [USKY_2rxs], [FLAG_2rxs], [BKG_id], [X_BKG_1], [Y_BKG_1], [X_BKG_2], [Y_BKG_2], [BGR_1rxs], [BGR_2rxs], [LFLAG], [CM6], [CD6], [EXCESSVAR6], [UNCERTAINTY6], [NBINS_A], [NBINS_6], [NBINS_1], [NBINS_N], [CMIN6], [CMAX6], [EMIN6], [EMAX6], [CTS_lc6], [SIGMA_excess6], [CM_plus_CD], [SPX], [LCX], [OBS_CLOCK_1], [OBS_CLOCK_2], [OBS_DATE_1], [OBS_UT_1], [OBS_DATE_2], [OBS_UT_2], [IND_2RXS])
 SELECT sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmid], sourcetablealias.[zoneid], sourcetablealias.[IAU_NAME], sourcetablealias.[SEQ_ID], sourcetablealias.[IND_DET], sourcetablealias.[EXI_ML], sourcetablealias.[CTS], sourcetablealias.[CERR], sourcetablealias.[RATE], sourcetablealias.[ERATE], sourcetablealias.[EXPOSURE], sourcetablealias.[RA], sourcetablealias.[DEC], sourcetablealias.[RA_HMS], sourcetablealias.[DEC_DMS], sourcetablealias.[LII], sourcetablealias.[BII], sourcetablealias.[LAMBDA], sourcetablealias.[BETA], sourcetablealias.[EXT], sourcetablealias.[EXTERR], sourcetablealias.[EXT_ML], sourcetablealias.[HR_1], sourcetablealias.[HR_1_err], sourcetablealias.[HR_2], sourcetablealias.[HR_2_err], sourcetablealias.[USKY], sourcetablealias.[Masked], sourcetablealias.[FLAG_all], sourcetablealias.[S_flag], sourcetablealias.[INDEX], sourcetablealias.[AMPL_MAX], sourcetablealias.[CM], sourcetablealias.[CD], sourcetablealias.[CTS_lc], sourcetablealias.[CMIN], sourcetablealias.[CMAX], sourcetablealias.[EMIN], sourcetablealias.[EMAX], sourcetablealias.[CHI2_lc], sourcetablealias.[EXCESS_VAR], sourcetablealias.[UNCERTAINTY], sourcetablealias.[Sigma_Excess], sourcetablealias.[NH_gal], sourcetablealias.[NH_fit_p], sourcetablealias.[NH_err_p], sourcetablealias.[NORM_p], sourcetablealias.[NORM_err_p], sourcetablealias.[GAMMA_p], sourcetablealias.[GAMMA_err_p], sourcetablealias.[CTR_spec_p], sourcetablealias.[FLUX_p], sourcetablealias.[Chi2red_spec_p], sourcetablealias.[Chi2_spec_p], sourcetablealias.[Num_Data_pts_p], sourcetablealias.[Num_Deg_free_p], sourcetablealias.[NH_fit_m], sourcetablealias.[NH_err_m], sourcetablealias.[NORM_m], sourcetablealias.[NORM_err_m], sourcetablealias.[Temp_fit_m], sourcetablealias.[Temp_err_m], sourcetablealias.[CTR_spec_m], sourcetablealias.[FLUX_m], sourcetablealias.[Chi2red_spec_m], sourcetablealias.[Chi2_spec_m], sourcetablealias.[Num_Data_pts_m], sourcetablealias.[Num_Deg_free_m], sourcetablealias.[NH_fit_b], sourcetablealias.[NH_err_b], sourcetablealias.[NORM_b], sourcetablealias.[NORM_err_b], sourcetablealias.[Temp_fit_b], sourcetablealias.[Temp_err_b], sourcetablealias.[CTR_spec_b], sourcetablealias.[FLUX_b], sourcetablealias.[Chi2red_spec_b], sourcetablealias.[Chi2_spec_b], sourcetablealias.[Num_Data_pts_b], sourcetablealias.[Num_Deg_free_b], sourcetablealias.[X_IMA], sourcetablealias.[Y_IMA], sourcetablealias.[XERR], sourcetablealias.[YERR], sourcetablealias.[X_SKY], sourcetablealias.[Y_SKY], sourcetablealias.[CUT_RAD], sourcetablealias.[FA], sourcetablealias.[TOTNUM], sourcetablealias.[BGR], sourcetablealias.[VIG_COR], sourcetablealias.[REMARKS], sourcetablealias.[SB1], sourcetablealias.[SB2], sourcetablealias.[SB3], sourcetablealias.[SB4], sourcetablealias.[B1], sourcetablealias.[B2], sourcetablealias.[B3], sourcetablealias.[B4], sourcetablealias.[B_SPA], sourcetablealias.[S1], sourcetablealias.[S2], sourcetablealias.[S3], sourcetablealias.[S4], sourcetablealias.[mult_xmmsl1], sourcetablealias.[entr_xmmsl1], sourcetablealias.[dist_xmmsl1], sourcetablealias.[RA_xmmsl1], sourcetablealias.[DEC_xmmsl1], sourcetablealias.[SRCNAME_xmmsl1], sourcetablealias.[RATE_B0_xmmsl1], sourcetablealias.[RATE_B0e_xmmsl1], sourcetablealias.[RATE_B5_xmmsl1], sourcetablealias.[RATE_B5e_xmmsl1], sourcetablealias.[mult_3xmm], sourcetablealias.[entr_3xmm], sourcetablealias.[dist_3xmm], sourcetablealias.[RA_3xmm], sourcetablealias.[DEC_3xmm], sourcetablealias.[SRCNAME_3xmm], sourcetablealias.[RATE_EP8_3xmm], sourcetablealias.[RATE_EP8e_3xmm], sourcetablealias.[FLUX_R_3xmm], sourcetablealias.[FLUX_R_err_3xmm], sourcetablealias.[mult_2rxp], sourcetablealias.[entr_2rxp], sourcetablealias.[dist_2rxp], sourcetablealias.[RA_2rxp], sourcetablealias.[DEC_2rxp], sourcetablealias.[SRCNAME_2rxp], sourcetablealias.[CRATE_2rxp], sourcetablealias.[CRATE_err_2rxp], sourcetablealias.[ExpTime_2rxp], sourcetablealias.[ObsID_2rxp], sourcetablealias.[mult_1rxs], sourcetablealias.[entr_1rxs], sourcetablealias.[dist_1rxs], sourcetablealias.[RA_1rxs], sourcetablealias.[DEC_1rxs], sourcetablealias.[SRCNAME_1rxs], sourcetablealias.[RATE_1rxs], sourcetablealias.[RATE_err_1rxs], sourcetablealias.[CTS_1rxs], sourcetablealias.[CTS_err_1rxs], sourcetablealias.[EXI_ML_1rxs], sourcetablealias.[EXPOS_1rxs], sourcetablealias.[HR1_1rxs], sourcetablealias.[HR1e_1rxs], sourcetablealias.[HR2_1rxs], sourcetablealias.[HR2e_1rxs], sourcetablealias.[mult_vv10], sourcetablealias.[entr_vv10], sourcetablealias.[dist_vv10], sourcetablealias.[NAME_vv10], sourcetablealias.[Type_vv10], sourcetablealias.[Vmag_vv10], sourcetablealias.[z_vv10], sourcetablealias.[Index_vv10], sourcetablealias.[RA_vv10], sourcetablealias.[DEC_vv10], sourcetablealias.[mult_tyc2], sourcetablealias.[entr_tyc2], sourcetablealias.[dist_tyc2], sourcetablealias.[RA_tyc2], sourcetablealias.[DEC_tyc2], sourcetablealias.[RecNo_tyc2], sourcetablealias.[VTmag_tyc2], sourcetablealias.[BTmag_tyc2], sourcetablealias.[TYC1_tyc2], sourcetablealias.[TYC2_tyc2], sourcetablealias.[TYC3_tyc2], sourcetablealias.[mult_bri], sourcetablealias.[entr_bri], sourcetablealias.[dist_bri], sourcetablealias.[RA_bri], sourcetablealias.[DEC_bri], sourcetablealias.[Vmag_bri], sourcetablealias.[SpType_bri], sourcetablealias.[RecNo_bri], sourcetablealias.[HD_bri], sourcetablealias.[mult_hmxb], sourcetablealias.[entr_hmxb], sourcetablealias.[dist_hmxb], sourcetablealias.[RA_hmxb], sourcetablealias.[DEC_hmxb], sourcetablealias.[Name_hmxb], sourcetablealias.[Name2_hmxb], sourcetablealias.[Vmag_hmxb], sourcetablealias.[mult_lmxb], sourcetablealias.[entr_lmxb], sourcetablealias.[dist_lmxb], sourcetablealias.[RA_lmxb], sourcetablealias.[DEC_lmxb], sourcetablealias.[Name_lmxb], sourcetablealias.[Name2_lmxb], sourcetablealias.[Vmag_lmxb], sourcetablealias.[mult_atnf], sourcetablealias.[entr_atnf], sourcetablealias.[dist_atnf], sourcetablealias.[RA_atnf], sourcetablealias.[DEC_atnf], sourcetablealias.[Name_atnf], sourcetablealias.[Type_atnf], sourcetablealias.[Period_atnf], sourcetablealias.[mult_fuh], sourcetablealias.[entr_fuh], sourcetablealias.[dist_fuh], sourcetablealias.[RA_fuh], sourcetablealias.[DEC_fuh], sourcetablealias.[Seq_fuh], sourcetablealias.[Name_fuh], sourcetablealias.[mult_1sxps], sourcetablealias.[entr_1sxps], sourcetablealias.[dist_1sxps], sourcetablealias.[RA_1sxps], sourcetablealias.[DEC_1sxps], sourcetablealias.[Expos_1sxps], sourcetablealias.[DET_1sxps], sourcetablealias.[DET0_1sxps], sourcetablealias.[DET1_1sxps], sourcetablealias.[DET2_1sxps], sourcetablealias.[DET3_1sxps], sourcetablealias.[INDEX_1sxps], sourcetablealias.[Rate0_1sxps], sourcetablealias.[ERate0_1sxps], sourcetablealias.[mult_1rxh], sourcetablealias.[entr_1rxh], sourcetablealias.[dist_1rxh], sourcetablealias.[RA_1rxh], sourcetablealias.[DEC_1rxh], sourcetablealias.[SRCNAME_1rxh], sourcetablealias.[CRATE_1rxh], sourcetablealias.[CRATE_err_1rxh], sourcetablealias.[ExpTime_1rxh], sourcetablealias.[SNR_1rxh], sourcetablealias.[mult_flem], sourcetablealias.[entr_flem], sourcetablealias.[dist_flem], sourcetablealias.[RA_flem], sourcetablealias.[DEC_flem], sourcetablealias.[SRCNAME_flem], sourcetablealias.[Type_flem], sourcetablealias.[WFC_flem], sourcetablealias.[Rate_flem], sourcetablealias.[e_Rate_flem], sourcetablealias.[mult_wd], sourcetablealias.[entr_wd], sourcetablealias.[dist_wd], sourcetablealias.[RA_wd], sourcetablealias.[DEC_wd], sourcetablealias.[SRCNAME_wd], sourcetablealias.[Vmag_wd], sourcetablealias.[Vsphot_wd], sourcetablealias.[mult_sdss], sourcetablealias.[entr_sdss], sourcetablealias.[dist_sdss], sourcetablealias.[RA_sdss], sourcetablealias.[DEC_sdss], sourcetablealias.[SDSS_NAME], sourcetablealias.[LAMBDA_sdss], sourcetablealias.[BETA_sdss], sourcetablealias.[mult_2rxs], sourcetablealias.[entr_2rxs], sourcetablealias.[dist_2rxs], sourcetablealias.[INDEX_2rxs], sourcetablealias.[SEQ_ID_2rxs], sourcetablealias.[IND_DET_2rxs], sourcetablealias.[EXI_ML_2rxs], sourcetablealias.[RATE_2rxs], sourcetablealias.[RA_2rxs], sourcetablealias.[DEC_2rxs], sourcetablealias.[USKY_2rxs], sourcetablealias.[FLAG_2rxs], sourcetablealias.[BKG_id], sourcetablealias.[X_BKG_1], sourcetablealias.[Y_BKG_1], sourcetablealias.[X_BKG_2], sourcetablealias.[Y_BKG_2], sourcetablealias.[BGR_1rxs], sourcetablealias.[BGR_2rxs], sourcetablealias.[LFLAG], sourcetablealias.[CM6], sourcetablealias.[CD6], sourcetablealias.[EXCESSVAR6], sourcetablealias.[UNCERTAINTY6], sourcetablealias.[NBINS_A], sourcetablealias.[NBINS_6], sourcetablealias.[NBINS_1], sourcetablealias.[NBINS_N], sourcetablealias.[CMIN6], sourcetablealias.[CMAX6], sourcetablealias.[EMIN6], sourcetablealias.[EMAX6], sourcetablealias.[CTS_lc6], sourcetablealias.[SIGMA_excess6], sourcetablealias.[CM_plus_CD], sourcetablealias.[SPX], sourcetablealias.[LCX], sourcetablealias.[OBS_CLOCK_1], sourcetablealias.[OBS_CLOCK_2], sourcetablealias.[OBS_DATE_1], sourcetablealias.[OBS_UT_1], sourcetablealias.[OBS_DATE_2], sourcetablealias.[OBS_UT_2], sourcetablealias.[IND_2RXS]
 FROM   [SkyNode_ROSAT2RXS].[dbo].[SourceObj] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.[IAU_NAME] = sourcetablealias.[IAU_NAME]
	;


GO

