-- SUBSAMPLING TABLE 'PhotoExtract' ---

 -- Insert subset into destination table
 INSERT [SkyNode_GALEX_STAT].[dbo].[PhotoExtract] WITH (TABLOCKX)
    ([photoExtractID], [imgID], [sourceFileNPath], [simple], [bitpix], [naxis], [extend], [origin], [nuvfile], [fuvfile], [nuvwtfil], [fuvwtfil], [nuvcntfi], [fuvcntfi], [nuvintfi], [fuvintfi], [nuvlwtfi], [fuvlwtfi], [nuvskyfi], [fuvskyfi], [nuvflgfi], [fuvflgfi], [mchfile], [starcat], [nstar], [nmch], [rmean], [rmeansd], [rstddev], [rmin], [rmax], [acnmch], [acrave], [acravsd], [acrsd], [acrmin], [acrmax], [nuvs2n], [fuvs2n], [nuvs2ncu], [fuvs2ncu], [nuvnum], [fuvnum], [seplim], [autosep], [problim], [rposerr], [ra_cent], [dec_cent], [rao], [deco], [cx], [cy], [cz], [htmID], [zoneID], [totnum], [totfill], [totufn], [totuff], [lrgnuvid], [glono], [glato], [n_zpmag], [f_zpmag], [n_zpscal], [f_zpscal], [calmag], [n_cuj], [f_cuj], [r1], [r2], [r3], [n_flderr], [f_flderr], [ibf_err], [n_back], [f_back], [medsepa], [medsep], [medsepsg], [matden], [nufden], [fufden], [dyfcor], [fuvtemp], [dyf0], [dyf1], [n_ambg0], [n_ambg1], [n_ambg2], [n_ambg3], [n_ambg4], [n_ambg5], [n_ambg6], [n_ambgm6], [n_ambgm1], [f_ambg0], [f_ambg1], [f_ambg2], [f_ambg3], [f_ambg4], [f_ambg5], [f_ambg6], [f_ambgm6], [f_ambgm1], [filename], [directry], [vsn], [tilenum], [type], [ow], [prod], [img], [try], [epoch], [object], [crval1], [crval2], [crpix1], [crpix2], [cdelt1], [cdelt2], [crota1], [crota2], [grelease], [equinox], [eclipse], [leg], [mpsnpos], [visit], [subvis], [roll], [obs_date], [obsdatim], [tilename], [planid], [mpsphase], [mpsplan], [mpstype], [avaspra], [avaspdec], [avasprol], [avaspok], [num_aper], [sxaper1], [sxaper2], [sxaper3], [sxaper4], [sxaper5], [sxaper6], [sxaper7], [num_fol], [sxfrac1], [sxfrac2], [sxfrac3], [sxfrac4], [sxfrac5], [abscal], [calinfo], [statfile], [abspipe], [prundat0], [prundat1], [nlegs], [nhvnom], [nhvnomn], [nhvnomf], [mpscow], [longstrn], [pipestat], [nepoch], [nobject], [norigin], [ncrval1], [ncrval2], [ncrpix1], [ncrpix2], [ncdelt1], [ncdelt2], [ncrota1], [ncrota2], [nsximasx], [nsximasy], [nsxstrsy], [nsximabp], [nsxpixs], [nsxsfwhm], [nsxnnwf], [nsxgain], [nsxbkgnd], [nsxbkdev], [nsxbkthd], [nsxconff], [nsxdett], [nsxthldt], [nsxthld], [nsxminar], [nsxconv], [nsxconvn], [nsxconvf], [nsxdbldn], [nsxdbldc], [nsxcln], [nsxclnpa], [nsxclnst], [nsxaperd], [nsxapek1], [nsxapek2], [nsxapek3], [nsxsatlv], [nsxmgzpt], [nsxmggam], [nsxbkgsx], [nsxbkgsy], [nsxbkgfx], [nsxbkgfy], [nsxpbkgt], [nsxpbkgs], [nsxpixsk], [nsxfbufs], [nsxisapr], [nsxndet], [nsxnfin], [nsxnpara], [ngreleas], [nctype1], [nctype2], [nequinox], [nra_cent], [ndec_cen], [ntwist], [neclipse], [ngrspa], [nleg], [nmpsnpos], [nvisit], [nsubvis], [nminivis], [now], [nband], [nroll], [nexptime], [nexpstar], [nexpend], [nobs_dat], [ntime_ob], [nobssecs], [nobsdati], [ntilenam], [ntilenum], [nplanid], [nmpsphas], [nmpsplan], [nmpstype], [nimagszx], [nimagszy], [navaspra], [navaspde], [navaspx], [navaspy], [navaspro], [navaspok], [ncalpath], [nflatfl], [nintimag], [nphofile], [nnvalidp], [nfiltere], [npsffwhm], [ncnvfwhm], [npoisbg], [nsigthre], [nabsthre], [nsxdbgrm], [nareadet], [npsigdet], [npmedbg], [npmedrr], [npthrbg], [npthresh], [navepefi], [nminpefi], [nmaxpefi], [navepea], [nminpea], [nmaxpea], [nsxwd], [nacoxyav], [nacoxyme], [nacoxysd], [nacoxymn], [nacoxymx], [nabscal], [ncalinfo], [nstatfil], [nabspipe], [nprunda0], [nprunda1], [npipecmn], [nnlegs], [nmpscow], [nnhvnom], [nnhvnomn], [nnhvnomf], [npipesta], [nlongstr], [fepoch], [fobject], [forigin], [fcrval1], [fcrval2], [fcrpix1], [fcrpix2], [fcdelt1], [fcdelt2], [fcrota1], [fcrota2], [fsximasx], [fsximasy], [fsxstrsy], [fsximabp], [fsxpixs], [fsxsfwhm], [fsxnnwf], [fsxgain], [fsxbkgnd], [fsxbkdev], [fsxbkthd], [fsxconff], [fsxdett], [fsxthldt], [fsxthld], [fsxminar], [fsxconv], [fsxconvn], [fsxconvf], [fsxdbldn], [fsxdbldc], [fsxcln], [fsxclnpa], [fsxclnst], [fsxaperd], [fsxapek1], [fsxapek2], [fsxapek3], [fsxsatlv], [fsxmgzpt], [fsxmggam], [fsxbkgsx], [fsxbkgsy], [fsxbkgfx], [fsxbkgfy], [fsxpbkgt], [fsxpbkgs], [fsxpixsk], [fsxfbufs], [fsxisapr], [fsxndet], [fsxnfin], [fsxnpara], [fgreleas], [fctype1], [fctype2], [fequinox], [fra_cent], [fdec_cen], [ftwist], [feclipse], [fgrspa], [fleg], [fmpsnpos], [fvisit], [fsubvis], [fminivis], [fow], [fband], [froll], [fexptime], [fexpstar], [fexpend], [fobs_dat], [ftime_ob], [fobssecs], [fobsdati], [ftilenam], [ftilenum], [fplanid], [fmpsphas], [fmpsplan], [fmpstype], [fimagszx], [fimagszy], [favaspra], [favaspde], [favaspx], [favaspy], [favaspro], [favaspok], [fcalpath], [fflatfl], [fintimag], [fphofile], [fnvalidp], [ffiltere], [fpsffwhm], [fcnvfwhm], [fpoisbg], [fsigthre], [fabsthre], [fsxdbgrm], [fareadet], [fpsigdet], [fpmedbg], [fpmedrr], [fpthrbg], [fpthresh], [favepefi], [fminpefi], [fmaxpefi], [favepea], [fminpea], [fmaxpea], [fsxwd], [facoxyav], [facoxyme], [facoxysd], [facoxymn], [facoxymx], [fabscal], [fcalinfo], [fstatfil], [fabspipe], [fprunda0], [fprunda1], [fpipecmn], [fnlegs], [fmpscow], [fnhvnom], [fnhvnomn], [fnhvnomf], [fpipesta], [flongstr], [artflagb], [nnadded], [fnadded], [date], [ndtdet], [ndttdc], [ndtampa], [ndtampb], [ndtcon], [itnuvoba], [ndthvps], [ndtlvps], [ndtdib], [ndhvmon], [ndhimon], [ndsfhv], [ndctec], [ndcfec], [ndcdec], [fdtdet], [fdttdc], [fdtampa], [fdtampb], [fdtcon], [itfuvoba], [fdthvps], [fdtlvps], [fdtdib], [fdhvmon], [fdhimon], [fdsfhv], [fdctec], [fdcfec], [fdcdec], [itm1hshl], [itm2hub], [itcylbaf], [bqn_nc0], [bqn_nc1], [bqn_nc2], [bqn_nc3], [bqf_nc0], [bqf_nc1], [bqf_nc2], [bqf_nc3], [bqnum], [bqddxmed], [bqddymed], [bqddxrms], [bqddyrms], [bqddxmrm], [bqddymrm], [bqddxinn], [bqddyinn], [bqddxout], [bqddyout], [bqsdxmed], [bqsdymed], [bqsdxrms], [bqsdyrms], [bqsdxmrm], [bqsdymrm], [bqangmed], [bqprobmd], [bqsepmed], [bqnfxmed], [bqffxmed], [bqnaxmed], [bqfaxmed], [bqnelmed], [bqnaamed], [bqfaamed], [bqnbckmd], [bqfbckmd], [aexptime], [exptime], [subGridId], [gridId], [GRReleaseNumber])
 SELECT sourcetablealias.[photoExtractID], sourcetablealias.[imgID], sourcetablealias.[sourceFileNPath], sourcetablealias.[simple], sourcetablealias.[bitpix], sourcetablealias.[naxis], sourcetablealias.[extend], sourcetablealias.[origin], sourcetablealias.[nuvfile], sourcetablealias.[fuvfile], sourcetablealias.[nuvwtfil], sourcetablealias.[fuvwtfil], sourcetablealias.[nuvcntfi], sourcetablealias.[fuvcntfi], sourcetablealias.[nuvintfi], sourcetablealias.[fuvintfi], sourcetablealias.[nuvlwtfi], sourcetablealias.[fuvlwtfi], sourcetablealias.[nuvskyfi], sourcetablealias.[fuvskyfi], sourcetablealias.[nuvflgfi], sourcetablealias.[fuvflgfi], sourcetablealias.[mchfile], sourcetablealias.[starcat], sourcetablealias.[nstar], sourcetablealias.[nmch], sourcetablealias.[rmean], sourcetablealias.[rmeansd], sourcetablealias.[rstddev], sourcetablealias.[rmin], sourcetablealias.[rmax], sourcetablealias.[acnmch], sourcetablealias.[acrave], sourcetablealias.[acravsd], sourcetablealias.[acrsd], sourcetablealias.[acrmin], sourcetablealias.[acrmax], sourcetablealias.[nuvs2n], sourcetablealias.[fuvs2n], sourcetablealias.[nuvs2ncu], sourcetablealias.[fuvs2ncu], sourcetablealias.[nuvnum], sourcetablealias.[fuvnum], sourcetablealias.[seplim], sourcetablealias.[autosep], sourcetablealias.[problim], sourcetablealias.[rposerr], sourcetablealias.[ra_cent], sourcetablealias.[dec_cent], sourcetablealias.[rao], sourcetablealias.[deco], sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmID], sourcetablealias.[zoneID], sourcetablealias.[totnum], sourcetablealias.[totfill], sourcetablealias.[totufn], sourcetablealias.[totuff], sourcetablealias.[lrgnuvid], sourcetablealias.[glono], sourcetablealias.[glato], sourcetablealias.[n_zpmag], sourcetablealias.[f_zpmag], sourcetablealias.[n_zpscal], sourcetablealias.[f_zpscal], sourcetablealias.[calmag], sourcetablealias.[n_cuj], sourcetablealias.[f_cuj], sourcetablealias.[r1], sourcetablealias.[r2], sourcetablealias.[r3], sourcetablealias.[n_flderr], sourcetablealias.[f_flderr], sourcetablealias.[ibf_err], sourcetablealias.[n_back], sourcetablealias.[f_back], sourcetablealias.[medsepa], sourcetablealias.[medsep], sourcetablealias.[medsepsg], sourcetablealias.[matden], sourcetablealias.[nufden], sourcetablealias.[fufden], sourcetablealias.[dyfcor], sourcetablealias.[fuvtemp], sourcetablealias.[dyf0], sourcetablealias.[dyf1], sourcetablealias.[n_ambg0], sourcetablealias.[n_ambg1], sourcetablealias.[n_ambg2], sourcetablealias.[n_ambg3], sourcetablealias.[n_ambg4], sourcetablealias.[n_ambg5], sourcetablealias.[n_ambg6], sourcetablealias.[n_ambgm6], sourcetablealias.[n_ambgm1], sourcetablealias.[f_ambg0], sourcetablealias.[f_ambg1], sourcetablealias.[f_ambg2], sourcetablealias.[f_ambg3], sourcetablealias.[f_ambg4], sourcetablealias.[f_ambg5], sourcetablealias.[f_ambg6], sourcetablealias.[f_ambgm6], sourcetablealias.[f_ambgm1], sourcetablealias.[filename], sourcetablealias.[directry], sourcetablealias.[vsn], sourcetablealias.[tilenum], sourcetablealias.[type], sourcetablealias.[ow], sourcetablealias.[prod], sourcetablealias.[img], sourcetablealias.[try], sourcetablealias.[epoch], sourcetablealias.[object], sourcetablealias.[crval1], sourcetablealias.[crval2], sourcetablealias.[crpix1], sourcetablealias.[crpix2], sourcetablealias.[cdelt1], sourcetablealias.[cdelt2], sourcetablealias.[crota1], sourcetablealias.[crota2], sourcetablealias.[grelease], sourcetablealias.[equinox], sourcetablealias.[eclipse], sourcetablealias.[leg], sourcetablealias.[mpsnpos], sourcetablealias.[visit], sourcetablealias.[subvis], sourcetablealias.[roll], sourcetablealias.[obs_date], sourcetablealias.[obsdatim], sourcetablealias.[tilename], sourcetablealias.[planid], sourcetablealias.[mpsphase], sourcetablealias.[mpsplan], sourcetablealias.[mpstype], sourcetablealias.[avaspra], sourcetablealias.[avaspdec], sourcetablealias.[avasprol], sourcetablealias.[avaspok], sourcetablealias.[num_aper], sourcetablealias.[sxaper1], sourcetablealias.[sxaper2], sourcetablealias.[sxaper3], sourcetablealias.[sxaper4], sourcetablealias.[sxaper5], sourcetablealias.[sxaper6], sourcetablealias.[sxaper7], sourcetablealias.[num_fol], sourcetablealias.[sxfrac1], sourcetablealias.[sxfrac2], sourcetablealias.[sxfrac3], sourcetablealias.[sxfrac4], sourcetablealias.[sxfrac5], sourcetablealias.[abscal], sourcetablealias.[calinfo], sourcetablealias.[statfile], sourcetablealias.[abspipe], sourcetablealias.[prundat0], sourcetablealias.[prundat1], sourcetablealias.[nlegs], sourcetablealias.[nhvnom], sourcetablealias.[nhvnomn], sourcetablealias.[nhvnomf], sourcetablealias.[mpscow], sourcetablealias.[longstrn], sourcetablealias.[pipestat], sourcetablealias.[nepoch], sourcetablealias.[nobject], sourcetablealias.[norigin], sourcetablealias.[ncrval1], sourcetablealias.[ncrval2], sourcetablealias.[ncrpix1], sourcetablealias.[ncrpix2], sourcetablealias.[ncdelt1], sourcetablealias.[ncdelt2], sourcetablealias.[ncrota1], sourcetablealias.[ncrota2], sourcetablealias.[nsximasx], sourcetablealias.[nsximasy], sourcetablealias.[nsxstrsy], sourcetablealias.[nsximabp], sourcetablealias.[nsxpixs], sourcetablealias.[nsxsfwhm], sourcetablealias.[nsxnnwf], sourcetablealias.[nsxgain], sourcetablealias.[nsxbkgnd], sourcetablealias.[nsxbkdev], sourcetablealias.[nsxbkthd], sourcetablealias.[nsxconff], sourcetablealias.[nsxdett], sourcetablealias.[nsxthldt], sourcetablealias.[nsxthld], sourcetablealias.[nsxminar], sourcetablealias.[nsxconv], sourcetablealias.[nsxconvn], sourcetablealias.[nsxconvf], sourcetablealias.[nsxdbldn], sourcetablealias.[nsxdbldc], sourcetablealias.[nsxcln], sourcetablealias.[nsxclnpa], sourcetablealias.[nsxclnst], sourcetablealias.[nsxaperd], sourcetablealias.[nsxapek1], sourcetablealias.[nsxapek2], sourcetablealias.[nsxapek3], sourcetablealias.[nsxsatlv], sourcetablealias.[nsxmgzpt], sourcetablealias.[nsxmggam], sourcetablealias.[nsxbkgsx], sourcetablealias.[nsxbkgsy], sourcetablealias.[nsxbkgfx], sourcetablealias.[nsxbkgfy], sourcetablealias.[nsxpbkgt], sourcetablealias.[nsxpbkgs], sourcetablealias.[nsxpixsk], sourcetablealias.[nsxfbufs], sourcetablealias.[nsxisapr], sourcetablealias.[nsxndet], sourcetablealias.[nsxnfin], sourcetablealias.[nsxnpara], sourcetablealias.[ngreleas], sourcetablealias.[nctype1], sourcetablealias.[nctype2], sourcetablealias.[nequinox], sourcetablealias.[nra_cent], sourcetablealias.[ndec_cen], sourcetablealias.[ntwist], sourcetablealias.[neclipse], sourcetablealias.[ngrspa], sourcetablealias.[nleg], sourcetablealias.[nmpsnpos], sourcetablealias.[nvisit], sourcetablealias.[nsubvis], sourcetablealias.[nminivis], sourcetablealias.[now], sourcetablealias.[nband], sourcetablealias.[nroll], sourcetablealias.[nexptime], sourcetablealias.[nexpstar], sourcetablealias.[nexpend], sourcetablealias.[nobs_dat], sourcetablealias.[ntime_ob], sourcetablealias.[nobssecs], sourcetablealias.[nobsdati], sourcetablealias.[ntilenam], sourcetablealias.[ntilenum], sourcetablealias.[nplanid], sourcetablealias.[nmpsphas], sourcetablealias.[nmpsplan], sourcetablealias.[nmpstype], sourcetablealias.[nimagszx], sourcetablealias.[nimagszy], sourcetablealias.[navaspra], sourcetablealias.[navaspde], sourcetablealias.[navaspx], sourcetablealias.[navaspy], sourcetablealias.[navaspro], sourcetablealias.[navaspok], sourcetablealias.[ncalpath], sourcetablealias.[nflatfl], sourcetablealias.[nintimag], sourcetablealias.[nphofile], sourcetablealias.[nnvalidp], sourcetablealias.[nfiltere], sourcetablealias.[npsffwhm], sourcetablealias.[ncnvfwhm], sourcetablealias.[npoisbg], sourcetablealias.[nsigthre], sourcetablealias.[nabsthre], sourcetablealias.[nsxdbgrm], sourcetablealias.[nareadet], sourcetablealias.[npsigdet], sourcetablealias.[npmedbg], sourcetablealias.[npmedrr], sourcetablealias.[npthrbg], sourcetablealias.[npthresh], sourcetablealias.[navepefi], sourcetablealias.[nminpefi], sourcetablealias.[nmaxpefi], sourcetablealias.[navepea], sourcetablealias.[nminpea], sourcetablealias.[nmaxpea], sourcetablealias.[nsxwd], sourcetablealias.[nacoxyav], sourcetablealias.[nacoxyme], sourcetablealias.[nacoxysd], sourcetablealias.[nacoxymn], sourcetablealias.[nacoxymx], sourcetablealias.[nabscal], sourcetablealias.[ncalinfo], sourcetablealias.[nstatfil], sourcetablealias.[nabspipe], sourcetablealias.[nprunda0], sourcetablealias.[nprunda1], sourcetablealias.[npipecmn], sourcetablealias.[nnlegs], sourcetablealias.[nmpscow], sourcetablealias.[nnhvnom], sourcetablealias.[nnhvnomn], sourcetablealias.[nnhvnomf], sourcetablealias.[npipesta], sourcetablealias.[nlongstr], sourcetablealias.[fepoch], sourcetablealias.[fobject], sourcetablealias.[forigin], sourcetablealias.[fcrval1], sourcetablealias.[fcrval2], sourcetablealias.[fcrpix1], sourcetablealias.[fcrpix2], sourcetablealias.[fcdelt1], sourcetablealias.[fcdelt2], sourcetablealias.[fcrota1], sourcetablealias.[fcrota2], sourcetablealias.[fsximasx], sourcetablealias.[fsximasy], sourcetablealias.[fsxstrsy], sourcetablealias.[fsximabp], sourcetablealias.[fsxpixs], sourcetablealias.[fsxsfwhm], sourcetablealias.[fsxnnwf], sourcetablealias.[fsxgain], sourcetablealias.[fsxbkgnd], sourcetablealias.[fsxbkdev], sourcetablealias.[fsxbkthd], sourcetablealias.[fsxconff], sourcetablealias.[fsxdett], sourcetablealias.[fsxthldt], sourcetablealias.[fsxthld], sourcetablealias.[fsxminar], sourcetablealias.[fsxconv], sourcetablealias.[fsxconvn], sourcetablealias.[fsxconvf], sourcetablealias.[fsxdbldn], sourcetablealias.[fsxdbldc], sourcetablealias.[fsxcln], sourcetablealias.[fsxclnpa], sourcetablealias.[fsxclnst], sourcetablealias.[fsxaperd], sourcetablealias.[fsxapek1], sourcetablealias.[fsxapek2], sourcetablealias.[fsxapek3], sourcetablealias.[fsxsatlv], sourcetablealias.[fsxmgzpt], sourcetablealias.[fsxmggam], sourcetablealias.[fsxbkgsx], sourcetablealias.[fsxbkgsy], sourcetablealias.[fsxbkgfx], sourcetablealias.[fsxbkgfy], sourcetablealias.[fsxpbkgt], sourcetablealias.[fsxpbkgs], sourcetablealias.[fsxpixsk], sourcetablealias.[fsxfbufs], sourcetablealias.[fsxisapr], sourcetablealias.[fsxndet], sourcetablealias.[fsxnfin], sourcetablealias.[fsxnpara], sourcetablealias.[fgreleas], sourcetablealias.[fctype1], sourcetablealias.[fctype2], sourcetablealias.[fequinox], sourcetablealias.[fra_cent], sourcetablealias.[fdec_cen], sourcetablealias.[ftwist], sourcetablealias.[feclipse], sourcetablealias.[fgrspa], sourcetablealias.[fleg], sourcetablealias.[fmpsnpos], sourcetablealias.[fvisit], sourcetablealias.[fsubvis], sourcetablealias.[fminivis], sourcetablealias.[fow], sourcetablealias.[fband], sourcetablealias.[froll], sourcetablealias.[fexptime], sourcetablealias.[fexpstar], sourcetablealias.[fexpend], sourcetablealias.[fobs_dat], sourcetablealias.[ftime_ob], sourcetablealias.[fobssecs], sourcetablealias.[fobsdati], sourcetablealias.[ftilenam], sourcetablealias.[ftilenum], sourcetablealias.[fplanid], sourcetablealias.[fmpsphas], sourcetablealias.[fmpsplan], sourcetablealias.[fmpstype], sourcetablealias.[fimagszx], sourcetablealias.[fimagszy], sourcetablealias.[favaspra], sourcetablealias.[favaspde], sourcetablealias.[favaspx], sourcetablealias.[favaspy], sourcetablealias.[favaspro], sourcetablealias.[favaspok], sourcetablealias.[fcalpath], sourcetablealias.[fflatfl], sourcetablealias.[fintimag], sourcetablealias.[fphofile], sourcetablealias.[fnvalidp], sourcetablealias.[ffiltere], sourcetablealias.[fpsffwhm], sourcetablealias.[fcnvfwhm], sourcetablealias.[fpoisbg], sourcetablealias.[fsigthre], sourcetablealias.[fabsthre], sourcetablealias.[fsxdbgrm], sourcetablealias.[fareadet], sourcetablealias.[fpsigdet], sourcetablealias.[fpmedbg], sourcetablealias.[fpmedrr], sourcetablealias.[fpthrbg], sourcetablealias.[fpthresh], sourcetablealias.[favepefi], sourcetablealias.[fminpefi], sourcetablealias.[fmaxpefi], sourcetablealias.[favepea], sourcetablealias.[fminpea], sourcetablealias.[fmaxpea], sourcetablealias.[fsxwd], sourcetablealias.[facoxyav], sourcetablealias.[facoxyme], sourcetablealias.[facoxysd], sourcetablealias.[facoxymn], sourcetablealias.[facoxymx], sourcetablealias.[fabscal], sourcetablealias.[fcalinfo], sourcetablealias.[fstatfil], sourcetablealias.[fabspipe], sourcetablealias.[fprunda0], sourcetablealias.[fprunda1], sourcetablealias.[fpipecmn], sourcetablealias.[fnlegs], sourcetablealias.[fmpscow], sourcetablealias.[fnhvnom], sourcetablealias.[fnhvnomn], sourcetablealias.[fnhvnomf], sourcetablealias.[fpipesta], sourcetablealias.[flongstr], sourcetablealias.[artflagb], sourcetablealias.[nnadded], sourcetablealias.[fnadded], sourcetablealias.[date], sourcetablealias.[ndtdet], sourcetablealias.[ndttdc], sourcetablealias.[ndtampa], sourcetablealias.[ndtampb], sourcetablealias.[ndtcon], sourcetablealias.[itnuvoba], sourcetablealias.[ndthvps], sourcetablealias.[ndtlvps], sourcetablealias.[ndtdib], sourcetablealias.[ndhvmon], sourcetablealias.[ndhimon], sourcetablealias.[ndsfhv], sourcetablealias.[ndctec], sourcetablealias.[ndcfec], sourcetablealias.[ndcdec], sourcetablealias.[fdtdet], sourcetablealias.[fdttdc], sourcetablealias.[fdtampa], sourcetablealias.[fdtampb], sourcetablealias.[fdtcon], sourcetablealias.[itfuvoba], sourcetablealias.[fdthvps], sourcetablealias.[fdtlvps], sourcetablealias.[fdtdib], sourcetablealias.[fdhvmon], sourcetablealias.[fdhimon], sourcetablealias.[fdsfhv], sourcetablealias.[fdctec], sourcetablealias.[fdcfec], sourcetablealias.[fdcdec], sourcetablealias.[itm1hshl], sourcetablealias.[itm2hub], sourcetablealias.[itcylbaf], sourcetablealias.[bqn_nc0], sourcetablealias.[bqn_nc1], sourcetablealias.[bqn_nc2], sourcetablealias.[bqn_nc3], sourcetablealias.[bqf_nc0], sourcetablealias.[bqf_nc1], sourcetablealias.[bqf_nc2], sourcetablealias.[bqf_nc3], sourcetablealias.[bqnum], sourcetablealias.[bqddxmed], sourcetablealias.[bqddymed], sourcetablealias.[bqddxrms], sourcetablealias.[bqddyrms], sourcetablealias.[bqddxmrm], sourcetablealias.[bqddymrm], sourcetablealias.[bqddxinn], sourcetablealias.[bqddyinn], sourcetablealias.[bqddxout], sourcetablealias.[bqddyout], sourcetablealias.[bqsdxmed], sourcetablealias.[bqsdymed], sourcetablealias.[bqsdxrms], sourcetablealias.[bqsdyrms], sourcetablealias.[bqsdxmrm], sourcetablealias.[bqsdymrm], sourcetablealias.[bqangmed], sourcetablealias.[bqprobmd], sourcetablealias.[bqsepmed], sourcetablealias.[bqnfxmed], sourcetablealias.[bqffxmed], sourcetablealias.[bqnaxmed], sourcetablealias.[bqfaxmed], sourcetablealias.[bqnelmed], sourcetablealias.[bqnaamed], sourcetablealias.[bqfaamed], sourcetablealias.[bqnbckmd], sourcetablealias.[bqfbckmd], sourcetablealias.[aexptime], sourcetablealias.[exptime], sourcetablealias.[subGridId], sourcetablealias.[gridId], sourcetablealias.[GRReleaseNumber]
 FROM   [SkyNode_GALEX].[dbo].[PhotoExtract] sourcetablealias WITH (NOLOCK)
	;
 

GO

-- SUBSAMPLING TABLE 'PhotoExtractPrimary' ---

 -- Insert subset into destination table
 INSERT [SkyNode_GALEX_STAT].[dbo].[PhotoExtractPrimary] WITH (TABLOCKX)
    ([PhotoExtractID], [MpsType], [SkyGridID], [Radius], [Area], [RegionBinary])
 SELECT sourcetablealias.[PhotoExtractID], sourcetablealias.[MpsType], sourcetablealias.[SkyGridID], sourcetablealias.[Radius], sourcetablealias.[Area], sourcetablealias.[RegionBinary]
 FROM   [SkyNode_GALEX].[dbo].[PhotoExtractPrimary] sourcetablealias WITH (NOLOCK)
	;
 

GO

-- SUBSAMPLING TABLE 'PhotoObjAll' ---

 -- Create temporary table for the random ID list
 IF EXISTS( SELECT * FROM tempdb.dbo.sysobjects WHERE ID = OBJECT_ID(N'tempdb..##temporaryidlist'))
 DROP TABLE ##temporaryidlist;
 GO

 CREATE TABLE ##temporaryidlist
 (
	[objid] bigint
 );
 
 -- Collect IDs
 WITH temporaryidlistquery AS
 (
	SELECT sourcetablealias.[objid], gw.RandomDouble() AS randomnumber
	FROM [SkyNode_GALEX].[dbo].[PhotoObjAll] sourcetablealias
	
 )
 INSERT ##temporaryidlist WITH (TABLOCKX)
 SELECT [objid]
 FROM temporaryidlistquery
 WHERE randomnumber < 0.001;
 
 -- Insert subset into destination table
 
 INSERT [SkyNode_GALEX_STAT].[dbo].[PhotoObjAll] WITH (TABLOCKX)
	([objid], [photoExtractID], [vsn], [tilenum], [type], [ow], [prod], [img], [try], [band], [id], [subvisit], [leg], [ra], [dec], [cx], [cy], [cz], [htmID], [zoneID], [alpha_j2000_merged], [delta_j2000_merged], [prob], [sep], [e_bv], [glon], [glat], [primary_flag], [fov_radius], [nuv_det_x], [nuv_det_y], [fuv_det_x], [fuv_det_y], [chkobj_type], [chkobj_id], [chkobj_r], [chkobj_pa], [misc_flags], [nuv_flux], [nuv_fluxerr], [nuv_mag], [nuv_magerr], [fuv_flux], [fuv_fluxerr], [fuv_mag], [fuv_magerr], [nuv_s2n], [fuv_s2n], [nuv_fcat_flux], [nuv_fcat_fluxerr], [fuv_ncat_flux], [fuv_ncat_fluxerr], [nuv_nc_r1], [nuv_nc_r2], [nuv_nc_r3], [fuv_nc_r1], [fuv_nc_r2], [fuv_nc_r3], [nuv_nf_r1], [nuv_nf_r2], [nuv_nf_r3], [fuv_nf_r1], [fuv_nf_r2], [fuv_nf_r3], [cn_radius], [cn_pa], [cn_mag_nuv], [cn_mag_fuv], [nuv_skybg], [fuv_skybg], [nuv_weight], [fuv_weight], [nuv_int], [fuv_int], [nuv_thres], [fuv_thres], [nuv_contrast], [fuv_contrast], [nuv_maskpix], [fuv_maskpix], [nuv_artifact], [fuv_artifact], [nuv_scx], [nuv_scy], [fuv_scx], [fuv_scy], [nuv_Q], [fuv_Q], [nuv_ambg], [fuv_ambg], [nuv_nc], [fuv_nc], [nuv_cid1], [fuv_cid1], [nuv_cid2], [fuv_cid2], [nuv_cid3], [fuv_cid3], [nuv_poserr], [fuv_poserr], [nuv_pperr], [fuv_pperr], [match_density], [nuv_unmatched_density], [fuv_unmatched_density], [reliability], [sourcepa], [objtype], [quality], [adj_sep], [adj_fuv_det_y], [nuv_number], [nuv_flux_iso], [nuv_fluxerr_iso], [nuv_mag_iso], [nuv_magerr_iso], [nuv_flux_isocor], [nuv_fluxerr_isocor], [nuv_mag_isocor], [nuv_magerr_isocor], [nuv_flux_aper_1], [nuv_flux_aper_2], [nuv_flux_aper_3], [nuv_flux_aper_4], [nuv_flux_aper_5], [nuv_flux_aper_6], [nuv_flux_aper_7], [nuv_fluxerr_aper_1], [nuv_fluxerr_aper_2], [nuv_fluxerr_aper_3], [nuv_fluxerr_aper_4], [nuv_fluxerr_aper_5], [nuv_fluxerr_aper_6], [nuv_fluxerr_aper_7], [nuv_mag_aper_1], [nuv_mag_aper_2], [nuv_mag_aper_3], [nuv_mag_aper_4], [nuv_mag_aper_5], [nuv_mag_aper_6], [nuv_mag_aper_7], [nuv_magerr_aper_1], [nuv_magerr_aper_2], [nuv_magerr_aper_3], [nuv_magerr_aper_4], [nuv_magerr_aper_5], [nuv_magerr_aper_6], [nuv_magerr_aper_7], [nuv_flux_auto], [nuv_fluxerr_auto], [nuv_mag_auto], [nuv_magerr_auto], [nuv_flux_best], [nuv_fluxerr_best], [nuv_mag_best], [nuv_magerr_best], [nuv_flux_radius_1], [nuv_flux_radius_2], [nuv_flux_radius_3], [nuv_flux_radius_4], [nuv_flux_radius_5], [nuv_zpmag], [nuv_kron_radius], [nuv_background], [nuv_threshold], [nuv_mu_threshold], [nuv_flux_max], [nuv_mu_max], [nuv_isoarea_image], [nuv_isoarea_world], [nuv_isoareaf_image], [nuv_isoareaf_world], [nuv_xmin_image], [nuv_ymin_image], [nuv_xmax_image], [nuv_ymax_image], [nuv_x_image], [nuv_y_image], [nuv_xpeak_image], [nuv_ypeak_image], [nuv_ra], [nuv_dec], [nuv_x2_image], [nuv_y2_image], [nuv_xy_image], [nuv_x2_world], [nuv_y2_world], [nuv_xy_world], [nuv_cxx_image], [nuv_cyy_image], [nuv_cxy_image], [nuv_cxx_world], [nuv_cyy_world], [nuv_cxy_world], [nuv_a_image], [nuv_b_image], [nuv_a_world], [nuv_b_world], [nuv_theta_image], [nuv_theta_world], [nuv_theta_j2000], [nuv_elongation], [nuv_ellipticity], [nuv_errx2_image], [nuv_erry2_image], [nuv_errxy_image], [nuv_errx2_world], [nuv_erry2_world], [nuv_errxy_world], [nuv_errcxx_image], [nuv_errcyy_image], [nuv_errcxy_image], [nuv_errcxx_world], [nuv_errcyy_world], [nuv_errcxy_world], [nuv_erra_image], [nuv_errb_image], [nuv_erra_world], [nuv_errb_world], [nuv_errtheta_image], [nuv_errtheta_world], [nuv_errtheta_j2000], [nuv_fwhm_image], [nuv_fwhm_world], [nuv_flags], [nuv_class_star], [fuv_number], [fuv_flux_iso], [fuv_fluxerr_iso], [fuv_mag_iso], [fuv_magerr_iso], [fuv_flux_isocor], [fuv_fluxerr_isocor], [fuv_mag_isocor], [fuv_magerr_isocor], [fuv_flux_aper_1], [fuv_flux_aper_2], [fuv_flux_aper_3], [fuv_flux_aper_4], [fuv_flux_aper_5], [fuv_flux_aper_6], [fuv_flux_aper_7], [fuv_fluxerr_aper_1], [fuv_fluxerr_aper_2], [fuv_fluxerr_aper_3], [fuv_fluxerr_aper_4], [fuv_fluxerr_aper_5], [fuv_fluxerr_aper_6], [fuv_fluxerr_aper_7], [fuv_mag_aper_1], [fuv_mag_aper_2], [fuv_mag_aper_3], [fuv_mag_aper_4], [fuv_mag_aper_5], [fuv_mag_aper_6], [fuv_mag_aper_7], [fuv_magerr_aper_1], [fuv_magerr_aper_2], [fuv_magerr_aper_3], [fuv_magerr_aper_4], [fuv_magerr_aper_5], [fuv_magerr_aper_6], [fuv_magerr_aper_7], [fuv_flux_auto], [fuv_fluxerr_auto], [fuv_mag_auto], [fuv_magerr_auto], [fuv_flux_best], [fuv_fluxerr_best], [fuv_mag_best], [fuv_magerr_best], [fuv_flux_radius_1], [fuv_flux_radius_2], [fuv_flux_radius_3], [fuv_flux_radius_4], [fuv_flux_radius_5], [fuv_zpmag], [fuv_kron_radius], [fuv_background], [fuv_threshold], [fuv_mu_threshold], [fuv_flux_max], [fuv_mu_max], [fuv_isoarea_image], [fuv_isoarea_world], [fuv_isoareaf_image], [fuv_isoareaf_world], [fuv_xmin_image], [fuv_ymin_image], [fuv_xmax_image], [fuv_ymax_image], [fuv_x_image], [fuv_y_image], [fuv_xpeak_image], [fuv_ypeak_image], [fuv_ra], [fuv_dec], [fuv_x2_image], [fuv_y2_image], [fuv_xy_image], [fuv_x2_world], [fuv_y2_world], [fuv_xy_world], [fuv_cxx_image], [fuv_cyy_image], [fuv_cxy_image], [fuv_cxx_world], [fuv_cyy_world], [fuv_cxy_world], [fuv_a_image], [fuv_b_image], [fuv_a_world], [fuv_b_world], [fuv_theta_image], [fuv_theta_world], [fuv_theta_j2000], [fuv_elongation], [fuv_ellipticity], [fuv_errx2_image], [fuv_erry2_image], [fuv_errxy_image], [fuv_errx2_world], [fuv_erry2_world], [fuv_errxy_world], [fuv_errcxx_image], [fuv_errcyy_image], [fuv_errcxy_image], [fuv_errcxx_world], [fuv_errcyy_world], [fuv_errcxy_world], [fuv_erra_image], [fuv_errb_image], [fuv_erra_world], [fuv_errb_world], [fuv_errtheta_image], [fuv_errtheta_world], [fuv_errtheta_j2000], [fuv_fwhm_image], [fuv_fwhm_world], [fuv_flags], [fuv_class_star], [isThereSpectrum], [mode])
 SELECT sourcetablealias.[objid], sourcetablealias.[photoExtractID], sourcetablealias.[vsn], sourcetablealias.[tilenum], sourcetablealias.[type], sourcetablealias.[ow], sourcetablealias.[prod], sourcetablealias.[img], sourcetablealias.[try], sourcetablealias.[band], sourcetablealias.[id], sourcetablealias.[subvisit], sourcetablealias.[leg], sourcetablealias.[ra], sourcetablealias.[dec], sourcetablealias.[cx], sourcetablealias.[cy], sourcetablealias.[cz], sourcetablealias.[htmID], sourcetablealias.[zoneID], sourcetablealias.[alpha_j2000_merged], sourcetablealias.[delta_j2000_merged], sourcetablealias.[prob], sourcetablealias.[sep], sourcetablealias.[e_bv], sourcetablealias.[glon], sourcetablealias.[glat], sourcetablealias.[primary_flag], sourcetablealias.[fov_radius], sourcetablealias.[nuv_det_x], sourcetablealias.[nuv_det_y], sourcetablealias.[fuv_det_x], sourcetablealias.[fuv_det_y], sourcetablealias.[chkobj_type], sourcetablealias.[chkobj_id], sourcetablealias.[chkobj_r], sourcetablealias.[chkobj_pa], sourcetablealias.[misc_flags], sourcetablealias.[nuv_flux], sourcetablealias.[nuv_fluxerr], sourcetablealias.[nuv_mag], sourcetablealias.[nuv_magerr], sourcetablealias.[fuv_flux], sourcetablealias.[fuv_fluxerr], sourcetablealias.[fuv_mag], sourcetablealias.[fuv_magerr], sourcetablealias.[nuv_s2n], sourcetablealias.[fuv_s2n], sourcetablealias.[nuv_fcat_flux], sourcetablealias.[nuv_fcat_fluxerr], sourcetablealias.[fuv_ncat_flux], sourcetablealias.[fuv_ncat_fluxerr], sourcetablealias.[nuv_nc_r1], sourcetablealias.[nuv_nc_r2], sourcetablealias.[nuv_nc_r3], sourcetablealias.[fuv_nc_r1], sourcetablealias.[fuv_nc_r2], sourcetablealias.[fuv_nc_r3], sourcetablealias.[nuv_nf_r1], sourcetablealias.[nuv_nf_r2], sourcetablealias.[nuv_nf_r3], sourcetablealias.[fuv_nf_r1], sourcetablealias.[fuv_nf_r2], sourcetablealias.[fuv_nf_r3], sourcetablealias.[cn_radius], sourcetablealias.[cn_pa], sourcetablealias.[cn_mag_nuv], sourcetablealias.[cn_mag_fuv], sourcetablealias.[nuv_skybg], sourcetablealias.[fuv_skybg], sourcetablealias.[nuv_weight], sourcetablealias.[fuv_weight], sourcetablealias.[nuv_int], sourcetablealias.[fuv_int], sourcetablealias.[nuv_thres], sourcetablealias.[fuv_thres], sourcetablealias.[nuv_contrast], sourcetablealias.[fuv_contrast], sourcetablealias.[nuv_maskpix], sourcetablealias.[fuv_maskpix], sourcetablealias.[nuv_artifact], sourcetablealias.[fuv_artifact], sourcetablealias.[nuv_scx], sourcetablealias.[nuv_scy], sourcetablealias.[fuv_scx], sourcetablealias.[fuv_scy], sourcetablealias.[nuv_Q], sourcetablealias.[fuv_Q], sourcetablealias.[nuv_ambg], sourcetablealias.[fuv_ambg], sourcetablealias.[nuv_nc], sourcetablealias.[fuv_nc], sourcetablealias.[nuv_cid1], sourcetablealias.[fuv_cid1], sourcetablealias.[nuv_cid2], sourcetablealias.[fuv_cid2], sourcetablealias.[nuv_cid3], sourcetablealias.[fuv_cid3], sourcetablealias.[nuv_poserr], sourcetablealias.[fuv_poserr], sourcetablealias.[nuv_pperr], sourcetablealias.[fuv_pperr], sourcetablealias.[match_density], sourcetablealias.[nuv_unmatched_density], sourcetablealias.[fuv_unmatched_density], sourcetablealias.[reliability], sourcetablealias.[sourcepa], sourcetablealias.[objtype], sourcetablealias.[quality], sourcetablealias.[adj_sep], sourcetablealias.[adj_fuv_det_y], sourcetablealias.[nuv_number], sourcetablealias.[nuv_flux_iso], sourcetablealias.[nuv_fluxerr_iso], sourcetablealias.[nuv_mag_iso], sourcetablealias.[nuv_magerr_iso], sourcetablealias.[nuv_flux_isocor], sourcetablealias.[nuv_fluxerr_isocor], sourcetablealias.[nuv_mag_isocor], sourcetablealias.[nuv_magerr_isocor], sourcetablealias.[nuv_flux_aper_1], sourcetablealias.[nuv_flux_aper_2], sourcetablealias.[nuv_flux_aper_3], sourcetablealias.[nuv_flux_aper_4], sourcetablealias.[nuv_flux_aper_5], sourcetablealias.[nuv_flux_aper_6], sourcetablealias.[nuv_flux_aper_7], sourcetablealias.[nuv_fluxerr_aper_1], sourcetablealias.[nuv_fluxerr_aper_2], sourcetablealias.[nuv_fluxerr_aper_3], sourcetablealias.[nuv_fluxerr_aper_4], sourcetablealias.[nuv_fluxerr_aper_5], sourcetablealias.[nuv_fluxerr_aper_6], sourcetablealias.[nuv_fluxerr_aper_7], sourcetablealias.[nuv_mag_aper_1], sourcetablealias.[nuv_mag_aper_2], sourcetablealias.[nuv_mag_aper_3], sourcetablealias.[nuv_mag_aper_4], sourcetablealias.[nuv_mag_aper_5], sourcetablealias.[nuv_mag_aper_6], sourcetablealias.[nuv_mag_aper_7], sourcetablealias.[nuv_magerr_aper_1], sourcetablealias.[nuv_magerr_aper_2], sourcetablealias.[nuv_magerr_aper_3], sourcetablealias.[nuv_magerr_aper_4], sourcetablealias.[nuv_magerr_aper_5], sourcetablealias.[nuv_magerr_aper_6], sourcetablealias.[nuv_magerr_aper_7], sourcetablealias.[nuv_flux_auto], sourcetablealias.[nuv_fluxerr_auto], sourcetablealias.[nuv_mag_auto], sourcetablealias.[nuv_magerr_auto], sourcetablealias.[nuv_flux_best], sourcetablealias.[nuv_fluxerr_best], sourcetablealias.[nuv_mag_best], sourcetablealias.[nuv_magerr_best], sourcetablealias.[nuv_flux_radius_1], sourcetablealias.[nuv_flux_radius_2], sourcetablealias.[nuv_flux_radius_3], sourcetablealias.[nuv_flux_radius_4], sourcetablealias.[nuv_flux_radius_5], sourcetablealias.[nuv_zpmag], sourcetablealias.[nuv_kron_radius], sourcetablealias.[nuv_background], sourcetablealias.[nuv_threshold], sourcetablealias.[nuv_mu_threshold], sourcetablealias.[nuv_flux_max], sourcetablealias.[nuv_mu_max], sourcetablealias.[nuv_isoarea_image], sourcetablealias.[nuv_isoarea_world], sourcetablealias.[nuv_isoareaf_image], sourcetablealias.[nuv_isoareaf_world], sourcetablealias.[nuv_xmin_image], sourcetablealias.[nuv_ymin_image], sourcetablealias.[nuv_xmax_image], sourcetablealias.[nuv_ymax_image], sourcetablealias.[nuv_x_image], sourcetablealias.[nuv_y_image], sourcetablealias.[nuv_xpeak_image], sourcetablealias.[nuv_ypeak_image], sourcetablealias.[nuv_ra], sourcetablealias.[nuv_dec], sourcetablealias.[nuv_x2_image], sourcetablealias.[nuv_y2_image], sourcetablealias.[nuv_xy_image], sourcetablealias.[nuv_x2_world], sourcetablealias.[nuv_y2_world], sourcetablealias.[nuv_xy_world], sourcetablealias.[nuv_cxx_image], sourcetablealias.[nuv_cyy_image], sourcetablealias.[nuv_cxy_image], sourcetablealias.[nuv_cxx_world], sourcetablealias.[nuv_cyy_world], sourcetablealias.[nuv_cxy_world], sourcetablealias.[nuv_a_image], sourcetablealias.[nuv_b_image], sourcetablealias.[nuv_a_world], sourcetablealias.[nuv_b_world], sourcetablealias.[nuv_theta_image], sourcetablealias.[nuv_theta_world], sourcetablealias.[nuv_theta_j2000], sourcetablealias.[nuv_elongation], sourcetablealias.[nuv_ellipticity], sourcetablealias.[nuv_errx2_image], sourcetablealias.[nuv_erry2_image], sourcetablealias.[nuv_errxy_image], sourcetablealias.[nuv_errx2_world], sourcetablealias.[nuv_erry2_world], sourcetablealias.[nuv_errxy_world], sourcetablealias.[nuv_errcxx_image], sourcetablealias.[nuv_errcyy_image], sourcetablealias.[nuv_errcxy_image], sourcetablealias.[nuv_errcxx_world], sourcetablealias.[nuv_errcyy_world], sourcetablealias.[nuv_errcxy_world], sourcetablealias.[nuv_erra_image], sourcetablealias.[nuv_errb_image], sourcetablealias.[nuv_erra_world], sourcetablealias.[nuv_errb_world], sourcetablealias.[nuv_errtheta_image], sourcetablealias.[nuv_errtheta_world], sourcetablealias.[nuv_errtheta_j2000], sourcetablealias.[nuv_fwhm_image], sourcetablealias.[nuv_fwhm_world], sourcetablealias.[nuv_flags], sourcetablealias.[nuv_class_star], sourcetablealias.[fuv_number], sourcetablealias.[fuv_flux_iso], sourcetablealias.[fuv_fluxerr_iso], sourcetablealias.[fuv_mag_iso], sourcetablealias.[fuv_magerr_iso], sourcetablealias.[fuv_flux_isocor], sourcetablealias.[fuv_fluxerr_isocor], sourcetablealias.[fuv_mag_isocor], sourcetablealias.[fuv_magerr_isocor], sourcetablealias.[fuv_flux_aper_1], sourcetablealias.[fuv_flux_aper_2], sourcetablealias.[fuv_flux_aper_3], sourcetablealias.[fuv_flux_aper_4], sourcetablealias.[fuv_flux_aper_5], sourcetablealias.[fuv_flux_aper_6], sourcetablealias.[fuv_flux_aper_7], sourcetablealias.[fuv_fluxerr_aper_1], sourcetablealias.[fuv_fluxerr_aper_2], sourcetablealias.[fuv_fluxerr_aper_3], sourcetablealias.[fuv_fluxerr_aper_4], sourcetablealias.[fuv_fluxerr_aper_5], sourcetablealias.[fuv_fluxerr_aper_6], sourcetablealias.[fuv_fluxerr_aper_7], sourcetablealias.[fuv_mag_aper_1], sourcetablealias.[fuv_mag_aper_2], sourcetablealias.[fuv_mag_aper_3], sourcetablealias.[fuv_mag_aper_4], sourcetablealias.[fuv_mag_aper_5], sourcetablealias.[fuv_mag_aper_6], sourcetablealias.[fuv_mag_aper_7], sourcetablealias.[fuv_magerr_aper_1], sourcetablealias.[fuv_magerr_aper_2], sourcetablealias.[fuv_magerr_aper_3], sourcetablealias.[fuv_magerr_aper_4], sourcetablealias.[fuv_magerr_aper_5], sourcetablealias.[fuv_magerr_aper_6], sourcetablealias.[fuv_magerr_aper_7], sourcetablealias.[fuv_flux_auto], sourcetablealias.[fuv_fluxerr_auto], sourcetablealias.[fuv_mag_auto], sourcetablealias.[fuv_magerr_auto], sourcetablealias.[fuv_flux_best], sourcetablealias.[fuv_fluxerr_best], sourcetablealias.[fuv_mag_best], sourcetablealias.[fuv_magerr_best], sourcetablealias.[fuv_flux_radius_1], sourcetablealias.[fuv_flux_radius_2], sourcetablealias.[fuv_flux_radius_3], sourcetablealias.[fuv_flux_radius_4], sourcetablealias.[fuv_flux_radius_5], sourcetablealias.[fuv_zpmag], sourcetablealias.[fuv_kron_radius], sourcetablealias.[fuv_background], sourcetablealias.[fuv_threshold], sourcetablealias.[fuv_mu_threshold], sourcetablealias.[fuv_flux_max], sourcetablealias.[fuv_mu_max], sourcetablealias.[fuv_isoarea_image], sourcetablealias.[fuv_isoarea_world], sourcetablealias.[fuv_isoareaf_image], sourcetablealias.[fuv_isoareaf_world], sourcetablealias.[fuv_xmin_image], sourcetablealias.[fuv_ymin_image], sourcetablealias.[fuv_xmax_image], sourcetablealias.[fuv_ymax_image], sourcetablealias.[fuv_x_image], sourcetablealias.[fuv_y_image], sourcetablealias.[fuv_xpeak_image], sourcetablealias.[fuv_ypeak_image], sourcetablealias.[fuv_ra], sourcetablealias.[fuv_dec], sourcetablealias.[fuv_x2_image], sourcetablealias.[fuv_y2_image], sourcetablealias.[fuv_xy_image], sourcetablealias.[fuv_x2_world], sourcetablealias.[fuv_y2_world], sourcetablealias.[fuv_xy_world], sourcetablealias.[fuv_cxx_image], sourcetablealias.[fuv_cyy_image], sourcetablealias.[fuv_cxy_image], sourcetablealias.[fuv_cxx_world], sourcetablealias.[fuv_cyy_world], sourcetablealias.[fuv_cxy_world], sourcetablealias.[fuv_a_image], sourcetablealias.[fuv_b_image], sourcetablealias.[fuv_a_world], sourcetablealias.[fuv_b_world], sourcetablealias.[fuv_theta_image], sourcetablealias.[fuv_theta_world], sourcetablealias.[fuv_theta_j2000], sourcetablealias.[fuv_elongation], sourcetablealias.[fuv_ellipticity], sourcetablealias.[fuv_errx2_image], sourcetablealias.[fuv_erry2_image], sourcetablealias.[fuv_errxy_image], sourcetablealias.[fuv_errx2_world], sourcetablealias.[fuv_erry2_world], sourcetablealias.[fuv_errxy_world], sourcetablealias.[fuv_errcxx_image], sourcetablealias.[fuv_errcyy_image], sourcetablealias.[fuv_errcxy_image], sourcetablealias.[fuv_errcxx_world], sourcetablealias.[fuv_errcyy_world], sourcetablealias.[fuv_errcxy_world], sourcetablealias.[fuv_erra_image], sourcetablealias.[fuv_errb_image], sourcetablealias.[fuv_erra_world], sourcetablealias.[fuv_errb_world], sourcetablealias.[fuv_errtheta_image], sourcetablealias.[fuv_errtheta_world], sourcetablealias.[fuv_errtheta_j2000], sourcetablealias.[fuv_fwhm_image], sourcetablealias.[fuv_fwhm_world], sourcetablealias.[fuv_flags], sourcetablealias.[fuv_class_star], sourcetablealias.[isThereSpectrum], sourcetablealias.[mode]
 FROM   [SkyNode_GALEX].[dbo].[PhotoObjAll] sourcetablealias WITH (NOLOCK)
	INNER JOIN ##temporaryidlist ON ##temporaryidlist.objid = sourcetablealias.objid
	;


GO

