-- SUBSAMPLING TABLE 'PhotoObj' ---

 -- Create temporary table for the random ID list
 IF EXISTS( SELECT * FROM tempdb.dbo.sysobjects WHERE ID = OBJECT_ID(N'tempdb..##temporaryidlist'))
 DROP TABLE ##temporaryidlist;
 --GO

 CREATE TABLE ##temporaryidlist
 (
	[cntr] bigint
 );
 
 -- Collect IDs
 WITH temporaryidlistquery AS
 (
	SELECT sourcetablealias.[cntr], gw.RandomDouble() AS randomnumber
	FROM [SkyNode_WISE].[dbo].[PhotoObj] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [cntr]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.001;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_WISE_STAT].[dbo].[PhotoObj] WITH (TABLOCKX)
	([cntr], [ra], [dec], [cx], [cy], [cz], [htmid], [zoneid], [sigra], [sigdec], [sigradec], [wx], [wy], [coadd_id], [src], [rchi2], [xsc_prox], [tmass_key], [r_2mass], [pa_2mass], [n_2mass], [j_m_2mass], [j_msig_2mass], [h_m_2mass], [h_msig_2mass], [k_m_2mass], [k_msig_2mass], [rho12], [rho23], [rho34], [q12], [q23], [q34], [blend_ext_flags], [w1mpro], [w1sigmpro], [w1snr], [w1rchi2], [w1sat], [w1nm], [w1m], [w1cov], [w1frtr], [w1flux], [w1sigflux], [w1sky], [w1sigsky], [w1conf], [w1mag], [w1sigmag], [w1mcor], [w1magp], [w1sigp1], [w1sigp2], [w1dmag], [w1mjdmin], [w1mjdmax], [w1mjdmean], [w1rsemi], [w1ba], [w1pa], [w1gmag], [w1siggmag], [w1flg], [w1gflg], [ph_qual_det1], [w1ndf], [w1mlq], [w1cc_map], [var_flg1], [moon_lev1], [satnum1], [w2mpro], [w2sigmpro], [w2snr], [w2rchi2], [w2sat], [w2nm], [w2m], [w2cov], [w2frtr], [w2flux], [w2sigflux], [w2sky], [w2sigsky], [w2conf], [w2mag], [w2sigmag], [w2mcor], [w2magp], [w2sigp1], [w2sigp2], [w2dmag], [w2mjdmin], [w2mjdmax], [w2mjdmean], [w2rsemi], [w2ba], [w2pa], [w2gmag], [w2siggmag], [w2flg], [w2gflg], [ph_qual_det2], [w2ndf], [w2mlq], [w2cc_map], [var_flg2], [moon_lev2], [satnum2], [w3mpro], [w3sigmpro], [w3snr], [w3rchi2], [w3sat], [w3nm], [w3m], [w3cov], [w3frtr], [w3flux], [w3sigflux], [w3sky], [w3sigsky], [w3conf], [w3mag], [w3sigmag], [w3mcor], [w3magp], [w3sigp1], [w3sigp2], [w3dmag], [w3mjdmin], [w3mjdmax], [w3mjdmean], [w3rsemi], [w3ba], [w3pa], [w3gmag], [w3siggmag], [w3flg], [w3gflg], [ph_qual_det3], [w3ndf], [w3mlq], [w3cc_map], [var_flg3], [moon_lev3], [satnum3], [w4mpro], [w4sigmpro], [w4snr], [w4rchi2], [w4sat], [w4nm], [w4m], [w4cov], [w4frtr], [w4flux], [w4sigflux], [w4sky], [w4sigsky], [w4conf], [w4mag], [w4sigmag], [w4mcor], [w4magp], [w4sigp1], [w4sigp2], [w4dmag], [w4mjdmin], [w4mjdmax], [w4mjdmean], [w4rsemi], [w4ba], [w4pa], [w4gmag], [w4siggmag], [w4flg], [w4gflg], [ph_qual_det4], [w4ndf], [w4mlq], [w4cc_map], [var_flg4], [moon_lev4], [satnum4], [w1mag_1], [w1sigmag_1], [w1flg_1], [w1mag_2], [w1sigmag_2], [w1flg_2], [w1mag_3], [w1sigmag_3], [w1flg_3], [w1mag_4], [w1sigmag_4], [w1flg_4], [w1mag_5], [w1sigmag_5], [w1flg_5], [w1mag_6], [w1sigmag_6], [w1flg_6], [w1mag_7], [w1sigmag_7], [w1flg_7], [w1mag_8], [w1sigmag_8], [w1flg_8], [w2mag_1], [w2sigmag_1], [w2flg_1], [w2mag_2], [w2sigmag_2], [w2flg_2], [w2mag_3], [w2sigmag_3], [w2flg_3], [w2mag_4], [w2sigmag_4], [w2flg_4], [w2mag_5], [w2sigmag_5], [w2flg_5], [w2mag_6], [w2sigmag_6], [w2flg_6], [w2mag_7], [w2sigmag_7], [w2flg_7], [w2mag_8], [w2sigmag_8], [w2flg_8], [w3mag_1], [w3sigmag_1], [w3flg_1], [w3mag_2], [w3sigmag_2], [w3flg_2], [w3mag_3], [w3sigmag_3], [w3flg_3], [w3mag_4], [w3sigmag_4], [w3flg_4], [w3mag_5], [w3sigmag_5], [w3flg_5], [w3mag_6], [w3sigmag_6], [w3flg_6], [w3mag_7], [w3sigmag_7], [w3flg_7], [w3mag_8], [w3sigmag_8], [w3flg_8], [w4mag_1], [w4sigmag_1], [w4flg_1], [w4mag_2], [w4sigmag_2], [w4flg_2], [w4mag_3], [w4sigmag_3], [w4flg_3], [w4mag_4], [w4sigmag_4], [w4flg_4], [w4mag_5], [w4sigmag_5], [w4flg_5], [w4mag_6], [w4sigmag_6], [w4flg_6], [w4mag_7], [w4sigmag_7], [w4flg_7], [w4mag_8], [w4sigmag_8], [w4flg_8], [glat], [glon], [rjce])
 SELECT sourcetablealias.[cntr], sourcetablealias.[ra], sourcetablealias.[dec], sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmid], sourcetablealias.[zoneid], sourcetablealias.[sigra], sourcetablealias.[sigdec], sourcetablealias.[sigradec], sourcetablealias.[wx], sourcetablealias.[wy], sourcetablealias.[coadd_id], sourcetablealias.[src], sourcetablealias.[rchi2], sourcetablealias.[xsc_prox], sourcetablealias.[tmass_key], sourcetablealias.[r_2mass], sourcetablealias.[pa_2mass], sourcetablealias.[n_2mass], sourcetablealias.[j_m_2mass], sourcetablealias.[j_msig_2mass], sourcetablealias.[h_m_2mass], sourcetablealias.[h_msig_2mass], sourcetablealias.[k_m_2mass], sourcetablealias.[k_msig_2mass], sourcetablealias.[rho12], sourcetablealias.[rho23], sourcetablealias.[rho34], sourcetablealias.[q12], sourcetablealias.[q23], sourcetablealias.[q34], sourcetablealias.[blend_ext_flags], sourcetablealias.[w1mpro], sourcetablealias.[w1sigmpro], sourcetablealias.[w1snr], sourcetablealias.[w1rchi2], sourcetablealias.[w1sat], sourcetablealias.[w1nm], sourcetablealias.[w1m], sourcetablealias.[w1cov], sourcetablealias.[w1frtr], sourcetablealias.[w1flux], sourcetablealias.[w1sigflux], sourcetablealias.[w1sky], sourcetablealias.[w1sigsky], sourcetablealias.[w1conf], sourcetablealias.[w1mag], sourcetablealias.[w1sigmag], sourcetablealias.[w1mcor], sourcetablealias.[w1magp], sourcetablealias.[w1sigp1], sourcetablealias.[w1sigp2], sourcetablealias.[w1dmag], sourcetablealias.[w1mjdmin], sourcetablealias.[w1mjdmax], sourcetablealias.[w1mjdmean], sourcetablealias.[w1rsemi], sourcetablealias.[w1ba], sourcetablealias.[w1pa], sourcetablealias.[w1gmag], sourcetablealias.[w1siggmag], sourcetablealias.[w1flg], sourcetablealias.[w1gflg], sourcetablealias.[ph_qual_det1], sourcetablealias.[w1ndf], sourcetablealias.[w1mlq], sourcetablealias.[w1cc_map], sourcetablealias.[var_flg1], sourcetablealias.[moon_lev1], sourcetablealias.[satnum1], sourcetablealias.[w2mpro], sourcetablealias.[w2sigmpro], sourcetablealias.[w2snr], sourcetablealias.[w2rchi2], sourcetablealias.[w2sat], sourcetablealias.[w2nm], sourcetablealias.[w2m], sourcetablealias.[w2cov], sourcetablealias.[w2frtr], sourcetablealias.[w2flux], sourcetablealias.[w2sigflux], sourcetablealias.[w2sky], sourcetablealias.[w2sigsky], sourcetablealias.[w2conf], sourcetablealias.[w2mag], sourcetablealias.[w2sigmag], sourcetablealias.[w2mcor], sourcetablealias.[w2magp], sourcetablealias.[w2sigp1], sourcetablealias.[w2sigp2], sourcetablealias.[w2dmag], sourcetablealias.[w2mjdmin], sourcetablealias.[w2mjdmax], sourcetablealias.[w2mjdmean], sourcetablealias.[w2rsemi], sourcetablealias.[w2ba], sourcetablealias.[w2pa], sourcetablealias.[w2gmag], sourcetablealias.[w2siggmag], sourcetablealias.[w2flg], sourcetablealias.[w2gflg], sourcetablealias.[ph_qual_det2], sourcetablealias.[w2ndf], sourcetablealias.[w2mlq], sourcetablealias.[w2cc_map], sourcetablealias.[var_flg2], sourcetablealias.[moon_lev2], sourcetablealias.[satnum2], sourcetablealias.[w3mpro], sourcetablealias.[w3sigmpro], sourcetablealias.[w3snr], sourcetablealias.[w3rchi2], sourcetablealias.[w3sat], sourcetablealias.[w3nm], sourcetablealias.[w3m], sourcetablealias.[w3cov], sourcetablealias.[w3frtr], sourcetablealias.[w3flux], sourcetablealias.[w3sigflux], sourcetablealias.[w3sky], sourcetablealias.[w3sigsky], sourcetablealias.[w3conf], sourcetablealias.[w3mag], sourcetablealias.[w3sigmag], sourcetablealias.[w3mcor], sourcetablealias.[w3magp], sourcetablealias.[w3sigp1], sourcetablealias.[w3sigp2], sourcetablealias.[w3dmag], sourcetablealias.[w3mjdmin], sourcetablealias.[w3mjdmax], sourcetablealias.[w3mjdmean], sourcetablealias.[w3rsemi], sourcetablealias.[w3ba], sourcetablealias.[w3pa], sourcetablealias.[w3gmag], sourcetablealias.[w3siggmag], sourcetablealias.[w3flg], sourcetablealias.[w3gflg], sourcetablealias.[ph_qual_det3], sourcetablealias.[w3ndf], sourcetablealias.[w3mlq], sourcetablealias.[w3cc_map], sourcetablealias.[var_flg3], sourcetablealias.[moon_lev3], sourcetablealias.[satnum3], sourcetablealias.[w4mpro], sourcetablealias.[w4sigmpro], sourcetablealias.[w4snr], sourcetablealias.[w4rchi2], sourcetablealias.[w4sat], sourcetablealias.[w4nm], sourcetablealias.[w4m], sourcetablealias.[w4cov], sourcetablealias.[w4frtr], sourcetablealias.[w4flux], sourcetablealias.[w4sigflux], sourcetablealias.[w4sky], sourcetablealias.[w4sigsky], sourcetablealias.[w4conf], sourcetablealias.[w4mag], sourcetablealias.[w4sigmag], sourcetablealias.[w4mcor], sourcetablealias.[w4magp], sourcetablealias.[w4sigp1], sourcetablealias.[w4sigp2], sourcetablealias.[w4dmag], sourcetablealias.[w4mjdmin], sourcetablealias.[w4mjdmax], sourcetablealias.[w4mjdmean], sourcetablealias.[w4rsemi], sourcetablealias.[w4ba], sourcetablealias.[w4pa], sourcetablealias.[w4gmag], sourcetablealias.[w4siggmag], sourcetablealias.[w4flg], sourcetablealias.[w4gflg], sourcetablealias.[ph_qual_det4], sourcetablealias.[w4ndf], sourcetablealias.[w4mlq], sourcetablealias.[w4cc_map], sourcetablealias.[var_flg4], sourcetablealias.[moon_lev4], sourcetablealias.[satnum4], sourcetablealias.[w1mag_1], sourcetablealias.[w1sigmag_1], sourcetablealias.[w1flg_1], sourcetablealias.[w1mag_2], sourcetablealias.[w1sigmag_2], sourcetablealias.[w1flg_2], sourcetablealias.[w1mag_3], sourcetablealias.[w1sigmag_3], sourcetablealias.[w1flg_3], sourcetablealias.[w1mag_4], sourcetablealias.[w1sigmag_4], sourcetablealias.[w1flg_4], sourcetablealias.[w1mag_5], sourcetablealias.[w1sigmag_5], sourcetablealias.[w1flg_5], sourcetablealias.[w1mag_6], sourcetablealias.[w1sigmag_6], sourcetablealias.[w1flg_6], sourcetablealias.[w1mag_7], sourcetablealias.[w1sigmag_7], sourcetablealias.[w1flg_7], sourcetablealias.[w1mag_8], sourcetablealias.[w1sigmag_8], sourcetablealias.[w1flg_8], sourcetablealias.[w2mag_1], sourcetablealias.[w2sigmag_1], sourcetablealias.[w2flg_1], sourcetablealias.[w2mag_2], sourcetablealias.[w2sigmag_2], sourcetablealias.[w2flg_2], sourcetablealias.[w2mag_3], sourcetablealias.[w2sigmag_3], sourcetablealias.[w2flg_3], sourcetablealias.[w2mag_4], sourcetablealias.[w2sigmag_4], sourcetablealias.[w2flg_4], sourcetablealias.[w2mag_5], sourcetablealias.[w2sigmag_5], sourcetablealias.[w2flg_5], sourcetablealias.[w2mag_6], sourcetablealias.[w2sigmag_6], sourcetablealias.[w2flg_6], sourcetablealias.[w2mag_7], sourcetablealias.[w2sigmag_7], sourcetablealias.[w2flg_7], sourcetablealias.[w2mag_8], sourcetablealias.[w2sigmag_8], sourcetablealias.[w2flg_8], sourcetablealias.[w3mag_1], sourcetablealias.[w3sigmag_1], sourcetablealias.[w3flg_1], sourcetablealias.[w3mag_2], sourcetablealias.[w3sigmag_2], sourcetablealias.[w3flg_2], sourcetablealias.[w3mag_3], sourcetablealias.[w3sigmag_3], sourcetablealias.[w3flg_3], sourcetablealias.[w3mag_4], sourcetablealias.[w3sigmag_4], sourcetablealias.[w3flg_4], sourcetablealias.[w3mag_5], sourcetablealias.[w3sigmag_5], sourcetablealias.[w3flg_5], sourcetablealias.[w3mag_6], sourcetablealias.[w3sigmag_6], sourcetablealias.[w3flg_6], sourcetablealias.[w3mag_7], sourcetablealias.[w3sigmag_7], sourcetablealias.[w3flg_7], sourcetablealias.[w3mag_8], sourcetablealias.[w3sigmag_8], sourcetablealias.[w3flg_8], sourcetablealias.[w4mag_1], sourcetablealias.[w4sigmag_1], sourcetablealias.[w4flg_1], sourcetablealias.[w4mag_2], sourcetablealias.[w4sigmag_2], sourcetablealias.[w4flg_2], sourcetablealias.[w4mag_3], sourcetablealias.[w4sigmag_3], sourcetablealias.[w4flg_3], sourcetablealias.[w4mag_4], sourcetablealias.[w4sigmag_4], sourcetablealias.[w4flg_4], sourcetablealias.[w4mag_5], sourcetablealias.[w4sigmag_5], sourcetablealias.[w4flg_5], sourcetablealias.[w4mag_6], sourcetablealias.[w4sigmag_6], sourcetablealias.[w4flg_6], sourcetablealias.[w4mag_7], sourcetablealias.[w4sigmag_7], sourcetablealias.[w4flg_7], sourcetablealias.[w4mag_8], sourcetablealias.[w4sigmag_8], sourcetablealias.[w4flg_8], sourcetablealias.[glat], sourcetablealias.[glon], sourcetablealias.[rjce]
 FROM   [SkyNode_WISE].[dbo].[PhotoObj] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.cntr = sourcetablealias.cntr
	;


GO

