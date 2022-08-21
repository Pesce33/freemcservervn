SELECT
	objID,
	skyVersion,
	run,
	rerun,
	camcol,
	field,
	obj,
	mode,
	nChild,
	type,
	clean,
	probPSF,
	insideMask,
	flags,
	sky_u,
	sky_g,
	sky_r,
	sky_i,
	sky_z,
	skyIvar_u,
	skyIvar_g,
	skyIvar_r,
	skyIvar_i,
	skyIvar_z,
	psfMag_u,
	psfMag_g,
	psfMag_r,
	psfMag_i,
	psfMag_z,
	psfMagErr_u,
	psfMagErr_g,
	psfMagErr_r,
	psfMagErr_i,
	psfMagErr_z,
	fiberMag_u,
	fiberMag_g,
	fiberMag_r,
	fiberMag_i,
	fiberMag_z,
	fiberMagErr_u,
	fiberMagErr_g,
	fiberMagErr_r,
	fiberMagErr_i,
	fiberMagErr_z,
	fiber2Mag_u,
	fiber2Mag_g,
	fiber2Mag_r,
	fiber2Mag_i,
	fiber2Mag_z,
	fiber2MagErr_u,
	fiber2MagErr_g,
	fiber2MagErr_r,
	fiber2MagErr_i,
	fiber2MagErr_z,
	petroMag_u,
	petroMag_g,
	petroMag_r,
	petroMag_i,
	petroMag_z,
	petroMagErr_u,
	petroMagErr_g,
	petroMagErr_r,
	petroMagErr_i,
	petroMagErr_z,
	psfFlux_u,
	psfFlux_g,
	psfFlux_r,
	psfFlux_i,
	psfFlux_z,
	psfFluxIvar_u,
	psfFluxIvar_g,
	psfFluxIvar_r,
	psfFluxIvar_i,
	psfFluxIvar_z,
	fiberFlux_u,
	fiberFlux_g,
	fiberFlux_r,
	fiberFlux_i,
	fiberFlux_z,
	fiberFluxIvar_u,
	fiberFluxIvar_g,
	fiberFluxIvar_r,
	fiberFluxIvar_i,
	fiberFluxIvar_z,
	fiber2Flux_u,
	fiber2Flux_g,
	fiber2Flux_r,
	fiber2Flux_i,
	fiber2Flux_z,
	fiber2FluxIvar_u,
	fiber2FluxIvar_g,
	fiber2FluxIvar_r,
	fiber2FluxIvar_i,
	fiber2FluxIvar_z,
	petroFlux_u,
	petroFlux_g,
	petroFlux_r,
	petroFlux_i,
	petroFlux_z,
	petroFluxIvar_u,
	petroFluxIvar_g,
	petroFluxIvar_r,
	petroFluxIvar_i,
	petroFluxIvar_z,
	petroRad_u,
	petroRad_g,
	petroRad_r,
	petroRad_i,
	petroRad_z,
	petroRadErr_u,
	petroRadErr_g,
	petroRadErr_r,
	petroRadErr_i,
	petroRadErr_z,
	petroR50_u,
	petroR50_g,
	petroR50_r,
	petroR50_i,
	petroR50_z,
	petroR50Err_u,
	petroR50Err_g,
	petroR50Err_r,
	petroR50Err_i,
	petroR50Err_z,
	petroR90_u,
	petroR90_g,
	petroR90_r,
	petroR90_i,
	petroR90_z,
	petroR90Err_u,
	petroR90Err_g,
	petroR90Err_r,
	petroR90Err_i,
	petroR90Err_z,
	lnLStar_u,
	lnLStar_g,
	lnLStar_r,
	lnLStar_i,
	lnLStar_z,
	lnLExp_u,
	lnLExp_g,
	lnLExp_r,
	lnLExp_i,
	lnLExp_z,
	lnLDeV_u,
	lnLDeV_g,
	lnLDeV_r,
	lnLDeV_i,
	lnLDeV_z,
	fracDeV_u,
	fracDeV_g,
	fracDeV_r,
	fracDeV_i,
	fracDeV_z,
	ra,
	dec,
	cx,
	cy,
	cz,
	raErr,
	decErr,
	b,
	l,
	extinction_u,
	extinction_g,
	extinction_r,
	extinction_i,
	extinction_z,
	mjd,
	airmass_u,
	airmass_g,
	airmass_r,
	airmass_i,
	airmass_z,
	loadVersion,
	htmID,
	fieldID,
	parentID,
	specObjID,
	u,
	g,
	r,
	i,
	z,
	err_u,
	err_g,
	err_r,
	err_i,
	err_z,
	dered_u,
	dered_g,
	dered_r,
	dered_i,
	dered_z,
	resolveStatus,
	thingId,
	balkanId,
	nObserve,
	nDetect,
	nEdge,
	score,
	calibStatus_u,
	calibStatus_g,
	calibStatus_r,
	calibStatus_i,
	calibStatus_z,
	TAI_u,
	TAI_g,
	TAI_r,
	TAI_i,
	TAI_z
FROM PhotoObjAll
WHERE objid >= 1237645876861272065 AND objid < 1237651735200924423
ORDER BY objID