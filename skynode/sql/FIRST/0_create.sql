--/ <dataset>
--/ <summary> The VLA FIRST Survey - Faint Images of the Radio Sky at Twenty-Centimeters  </summary>
--/ <remarks>
--/ A source catalog including peak and integrated flux densities and size information derived from 
--/ fitting two-dimensional Gaussians to the sources is generated from the coadded images. The 
--/ astrometric reference frame of the maps is accurate to 0.05", and individual sources have 90% 
--/ confidence error circles of radius &lt; 0.5" at the 3 mJy level and 1" at the survey threshold. The 
--/ survey area has been chosen to coincide with that of the Sloan Digital Sky Survey (SDSS); at the 
--/ mv~23 limit of SDSS, ~30% of the optical counterparts to FIRST sources are detected. unambiguous 
--/ optical identifications (&lt;5% false rates) are achievable to mv~24. 
--/ </remarks>
--/ <url>http://sundog.stsci.edu/index.html</url>
--/ <icon>first.png</icon>
--/ <docpage>first.html</docpage>
--/ </dataset>
 GO



-- CREATE PhotoObj TABLE

--/ <summary> Source catalog (version 14dec17) </summary>
--/ <remarks>  A catalog from the 1993 through 2011 images (containing ~946,000 sources and covering 
--/ ~10,575 square degrees) has been constructed and tested to ensure reliability and completeness.
--/ </remarks>

CREATE TABLE dbo.PhotoObj 
(
	--/ <summary>FIRST primary key.</summary>
	--/ <quantity>meta.id</quantity>
	[objID] bigint NOT NULL,

	--/ <summary> RA (right ascension, J2000). The accuracy of the position depends on the brightness and size of 
	--/ the source and the noise in the map. Point sources at the detection limit of the catalog have positions 
	--/ accurate to better than 1 arcsec at 90% confidence; 2 mJy point sources in regions with typical noise 
	--/ levels have positions good to 0.5 arcsec. An empirical expression for the positional accuracy is
	--/ unc(90% confidence) = Size  (1/SNR + 1/20)  arcsec
	--/ where Size is either the major or minor axis fitted FWHM (fMaj or fMin) as given in the catalog and SNR 
	--/ is the peak flux density signal-to-noise ratio:
	--/ SNR = (Fpeak-0.25) / Rms
	--/ (The positional uncertainty is of course elliptical for elliptical sources.) The best possible positional 
	--/ uncertainty is limited to about 0.1 arcsec by our ability to fit source positions in maps with 1.8 arcsec 
	--/ pixels and by various calibration uncertainties. Systematic errors in the positions are smaller than 0.05 arcsec. </summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[ra] float NOT NULL,

	--/ <summary> Dec (declination, J2000). The accuracy of the position depends on the brightness and size of 
	--/ the source and the noise in the map. Point sources at the detection limit of the catalog have positions 
	--/ accurate to better than 1 arcsec at 90% confidence; 2 mJy point sources in regions with typical noise 
	--/ levels have positions good to 0.5 arcsec. An empirical expression for the positional accuracy is
	--/ unc(90% confidence) = Size  (1/SNR + 1/20)  arcsec
	--/ where Size is either the major or minor axis fitted FWHM (fMaj or fMin) as given in the catalog and SNR 
	--/ is the peak flux density signal-to-noise ratio:
	--/ SNR = (Fpeak-0.25) / Rms
	--/ (The positional uncertainty is of course elliptical for elliptical sources.) The best possible positional 
	--/ uncertainty is limited to about 0.1 arcsec by our ability to fit source positions in maps with 1.8 arcsec 
	--/ pixels and by various calibration uncertainties. Systematic errors in the positions are smaller than 0.05 arcsec. </summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[dec] float NOT NULL,

	--/ <summary>Cartesian X (J2000)</summary>
	--/ <quantity>pos.eq.x;pos.frame=j2000</quantity>
	[cx] [float] NOT NULL,

	--/ <summary>Cartesian Y (J2000)</summary>
	--/ <quantity>pos.eq.y;pos.frame=j2000</quantity>
	[cy] [float] NOT NULL,

	--/ <summary>Cartesian Z (J2000)</summary>
	--/ <quantity>pos.eq.z;pos.frame=j2000</quantity>
	[cz] [float] NOT NULL,

	--/ <summary>HTM ID (J2000)</summary>
	--/ <quantity>pos.eq.HTM;pos.frame=j2000</quantity>
	[htmid] [bigint] NOT NULL,

	--/ <summary> Zone ID </summary>
	--/ <quantity>pos.eq.zone;pos.frame=j2000</quantity>
	[zoneid] int NOT NULL,

	--/ <summary> Ps indicates the probability that the source is spurious (most commonly because it is a sidelobe 
	--/ of a nearby bright source.) Low values mean the source is unlikely to be spurious. Here is the distribution  
	--/ of Ps values in the catalog: 
	--/ Probability Range	Fraction of sources 
	--/ 0.00 &lt; PS &lt; 0.05	76.3% 
	--/ 0.05 &lt; PS &lt; 0.15	7.0% 
	--/ 0.15 &lt; PS &lt; 0.25	4.4% 
	--/ 0.25 &lt; PS &lt; 0.35	3.5% 
	--/ 0.35 &lt; PS &lt; 0.45	2.1% 
	--/ 0.45 &lt; PS &lt; 0.55	1.7% 
	--/ 0.55 &lt; PS &lt; 0.65	1.6% 
	--/ 0.65 &lt; PS &lt; 0.75	1.5% 
	--/ 0.75 &lt; PS &lt; 0.85	1.1% 
	--/ 0.85 &lt; PS &lt; 0.90	0.8%  
	--/ Sidelobe probabilities for this version of the catalog have been computed using an improved algorithm based  
	--/ on multiple voting oblique decision tree classifiers. The classifiers were trained using deep VLA fields  
	--/ that give reliable assessments of the reality of FIRST sources. The algorithm will be described in detail  
	--/ in a future paper on the final FIRST catalog; we believe it is a substantial improvement over the previous  
	--/ sidelobe flagging approach. Nevertheless, we still recommend checking the images using the FIRST Cutout Server  
	--/ if there is doubt about the reality of particular sources. This is easily done when using the FIRST Search  
	--/ Engine to search the catalog, since each source selected in the search has a link to the Cutout Server. </summary>
	--/ <quantity>stat.probability</quantity>
	[Ps]  real NOT NULL,

	--/ <summary> Fpeak is the peak flux density measured in mJy. It is derived by fitting an 
	--/ elliptical Gaussian model to the source. To correct for the "CLEAN bias" effect, 0.25 mJy has been added to 
	--/ the peak flux density (see our Astrophysical Journal paper and our catalog paper for more details.)
	--/ The uncertainty in Fpeak is given by the rms noise at the source position. For bright sources the accuracies of Fpeak is
	--/ limited to about 5% by systematic effects. </summary>
	--/ <quantity>phot.flux.density</quantity>
	--/ <unit>mJy</unit>
	[Fpeak] real NOT NULL,

	--/ <summary> Fint is the integrated flux density measured in mJy. It is derived by fitting an 
	--/ elliptical Gaussian model to the source. To correct for the "CLEAN bias" effect the integrated flux density has been 
	--/ multiplied by (1+0.25/Fpeak) (see our Astrophysical Journal paper and our catalog paper for more details.)
	--/ The uncertainty in Fpeak is given by the rms noise at the source position, while the uncertainty in Fint can be 
	--/ considerably greater depending on the source size and morphology. For bright sources the accuracies of Fint 
	--/ are limited to about 5% by systematic effects. Note that for sources that are not well-described by an elliptical Gaussian 
	--/ model, Fint is not an accurate measure of the integrated flux density. </summary>
	--/ <quantity>phot.flux.density</quantity>
	--/ <unit>mJy</unit>
	[Fint] real NOT NULL,

	--/ <summary> Rms is a local noise estimate at the source position measured in mJy. Rms is computed by combining the measured 
	--/ noise from all grid pointing images contributing to this coadded map position. Note that the significance of detection 
	--/ for a source is (Fpeak-0.25)/Rms, not Fpeak/Rms, because of the CLEAN bias correction to the peak flux density. The catalog 
	--/ includes only sources brighter than 5 Rms. </summary>
	--/ <quantity>instr.det.noise</quantity>
	--/ <unit>mJy</unit>
	[RMS] real NOT NULL,

	--/ <summary> Maj gives the major axis (FWHM in arcsec)  
	--/ derived from the elliptical Gaussian model for the source. Maj and Min have been deconvolved to remove blurring by the 
	--/ elliptical Gaussian point-spread function. (The fitted parameters before deconvolution are given in the fMaj, fMin, and 
	--/ fPA columns.) In the north the beam is circular 5.4 arcsec FWHM; south of declination +4�33'21", the beam is elliptical, 
	--/ 6.4x5.4 arcsec FWHM, with the major axis running north-south. In the southern Galactic cap (RA = 21hrs to 3hrs), the 
	--/ elliptical beam size increases further to 6.8x5.4 arcsec south of declination -2�30'25".
	--/ Noise can cause the fitted values of the major and minor axes (before deconvolution) to be smaller than the beam. 
	--/ The corresponding deconvolved size is given as zero in that case.
	--/ The uncertainties in the deconvolved sizes depend on both the brightness and the sizes. Objects at the catalog flux 
	--/ density limit have uncertainties of about 2 arcsec in their sizes (so faint objects with Maj &lt;; 2 arcsec are consistent 
	--/ with point sources.) A simple empirical estimate of the uncertainty is
	--/ Sigma(Size) = 10 arcsec  (1/SNR + 1/75)
	--/ where SNR is the signal-to-noise ratio defined above. </summary>
	--/ <quantity>phys.angSize.smajAxis</quantity>
	--/ <unit>arcsec</unit>
	[Maj] real NOT NULL,

	--/ <summary> Min gives the minor axis (FWHM in arcsec)
	--/ derived from the elliptical Gaussian model for the source. Maj and Min have been deconvolved to remove blurring by the 
	--/ elliptical Gaussian point-spread function. (The fitted parameters before deconvolution are given in the fMaj, fMin, and 
	--/ fPA columns.) In the north the beam is circular 5.4 arcsec FWHM; south of declination +4�33'21", the beam is elliptical, 
	--/ 6.4x5.4 arcsec FWHM, with the major axis running north-south. In the southern Galactic cap (RA = 21hrs to 3hrs), the 
	--/ elliptical beam size increases further to 6.8x5.4 arcsec south of declination -2�30'25".
	--/ Noise can cause the fitted values of the major and minor axes (before deconvolution) to be smaller than the beam. 
	--/ The corresponding deconvolved size is given as zero in that case.
	--/ The uncertainties in the deconvolved sizes depend on both the brightness and the sizes. Objects at the catalog flux 
	--/ density limit have uncertainties of about 2 arcsec in their sizes (so faint objects with Maj &lt;; 2 arcsec are consistent 
	--/ with point sources.) An simple empirical estimate of the uncertainty is
	--/ Sigma(Size) = 10 arcsec  (1/SNR + 1/75)
	--/where SNR is the signal-to-noise ratio defined above. </summary>
	--/ <quantity>phys.angSize.sminAxis</quantity>
	--/ <unit>arcsec</unit>
	[Min] real NOT NULL,

	--/ <summary> PA gives the position angle (degrees east of north) derived from the elliptical Gaussian model for the source. Maj and Min 
	--/ have been deconvolved to remove blurring by the elliptical Gaussian point-spread function. (The fitted parameters before 
	--/ deconvolution are given in the fMaj, fMin, and fPA columns.) </summary>
	--/ <quantity>pos.posAng</quantity>
	[PA] real NOT NULL,

	--/ <summary> fMaj gives the major axis (FWHM in arcsec) derived from the elliptical Gaussian model for the source. 
	--/ This is a fitted size measured directly from the image; the elliptical point-spread function has not been deconvolved. </summary>
	--/ <quantity>phys.angSize.smajAxis;stat.fit</quantity>
	--/ <unit>arcsec</unit>
	[fMaj] real NOT NULL,

	--/ <summary> fMin gives the minor axis (FWHM in arcsec) derived from the elliptical Gaussian model for the source. This 
	--/ is a fitted size measured directly from the image; the elliptical point-spread function has not been deconvolved. </summary>
	--/ <quantity>phys.angSize.sminAxis;stat.fit</quantity>
	--/ <unit>arcsec</unit>
	[fMin] real NOT NULL,

	--/ <summary> fPA gives the position angle (degrees east of north) derived from the elliptical Gaussian model for the source. 
	--/ This a  fitted parameter measured directly from the image; the elliptical point-spread function has not been deconvolved. </summary>
	--/ <quantity>pos.posAng;stat.fit</quantity>
	--/ <unit>Degrees east of north</unit>
	[fPA] real NOT NULL,

	--/ <summary> The Field Name is the name of the coadded image containing the source. Note that the field name encodes the 
	--/ position of the field center: field hhmmm+ddmmm is centered at RA=hh mm.m, Dec=+dd mm.m. The images are available from 
	--/ several archives and through the FIRST Cutout Server.
	--/ All field names in the current catalog end with a letter E through X, depending on the date of the last catalog release 
	--/ in which the image was modified. The W and X fields are new in this catalog, while sources extracted from the E-T fields 
	--/ are essentially identical to those in the previous version of the catalog. The W fields include contributions from EVLA 
	--/ data taken in Spring 2011 and have both a slightly different central frequency (1.335 GHz instead of 1.400 GHz) and typically 
	--/ higher noise levels than the older images. The X fields are images that neighbor the EVLA fields but differ from the previous 
	--/ release in that they omit nearby EVLA observations from the co-adding of overlapping grid images. </summary>
	--/ <quantity>meta.id;obs.field</quantity>
	[Field] char(12) NOT NULL,
	
	--/ <summary> num_SDSS is giving the number of matches within a fiducial radius of 8 arcsec. A count of zero indicates there  
	--/ are no sources within this radius (which is also indicated by a separation of 99.00 and a classification of '-'). For  
	--/ SDSS, a count of -1 indicates that the FIRST source falls outside the SDSS DR10 survey area so that no SDSS data are  
	--/ available. </summary>
	--/ <quantity>meta.number;src</quantity>
	[num_SDSS] smallint NOT NULL,

	--/ <summary> Sep_SDDS is giving the separation for the nearest match from the FIRST position in arcsec. No sources within 
	--/ 8 arcsec radius is indicated by a separation of 99.0. </summary>
	--/ <quantity>pos.angDistance</quantity>
	--/ <unit>arcsec</unit>
	[Sep_SDSS] real NOT NULL,

	--/ <summary>  i_SDSS is the given magnitude for i waveband. For SDSS, a magnitude of -1 indicates that the magnitude in 
	--/ the DR10 catalog was given as -9999. </summary>
	--/ <quantity>phot.mag;em.opt.SDSS.i</quantity>
	[i_SDSS] real NOT NULL,

	--/ <summary> Cl_SDSS is the morphological classification (s=stellar, g=nonstellar/galaxy). A classification of '-' indicates 
	--/ there are no sources within 8 arcsec radius. </summary>
	--/ <quantity>src.class</quantity>
	[Cl_SDSS] char(1) NOT NULL,

	--/ <summary> num_2MASS is giving the number of matches within a fiducial radius of 8 arcsec. A count of zero indicates there  
	--/ are no sources within this radius (which is also indicated by a separation of 99.00 and a classification of '-'). </summary>
	--/ <quantity>meta.number;src</quantity>
	[num_2MASS] smallint NOT NULL,

	--/ <summary> Sep_2MASS is giving the separation for the nearest match from the FIRST position in arcsec. No sources within 
	--/ 8 arcsec radius is indicated by a separation of 99.0. </summary>
	--/ <quantity>pos.angDistance;src</quantity>
	--/ <unit>arcsec</unit>
	[Sep_2MASS] real NOT NULL,

	--/ <summary>  K_2MASS is the given magnitude for K waveband. </summary>
	--/ <quantity>phot.mag;em.IR.K</quantity>
	[K_2MASS] real NOT NULL,

	--/ <summary> The Mean_yr, Mean_MJD and rms_MJD columns give information on the mean epoch of the FIRST flux density measurement. The FIRST survey consists of 
	--/ 3-minute integrations at a grid of points on the sky. But the catalogs are derived from coadded images that use a weighted 
	--/ sum of the individual pointing maps to achieve nearly uniform sensitivity. (See the FIRST survey paper for more details.) 
	--/ That means that each measurement is a weighted sum of multiple observations.
	--/ The Epoch Mean columns give the weighted mean of all the contributing pointing epochs at the position of the source. It is 
	--/ given both in decimal years (Mean_yr) and in MJD (Mean_MJD) for convenience. </summary>
	--/ <quantity>time.epoch;obs</quantity>
	[Mean_yr] real NOT NULL,

	--/ <summary> The Mean_yr, Mean_MJD and rms_MJD columns give information on the mean epoch of the FIRST flux density measurement. The FIRST survey consists of 
	--/ 3-minute integrations at a grid of points on the sky. But the catalogs are derived from coadded images that use a weighted 
	--/ sum of the individual pointing maps to achieve nearly uniform sensitivity. (See the FIRST survey paper for more details.) 
	--/ That means that each measurement is a weighted sum of multiple observations.
	--/ The Epoch Mean columns give the weighted mean of all the contributing pointing epochs at the position of the source. It is 
	--/ given both in decimal years (Mean_yr) and in MJD (Mean_MJD) for convenience. </summary>
	--/ <quantity>time.epoch;obs</quantity>
	[Mean_MJD] float NOT NULL,

	--/ <summary> The Mean_yr, Mean_MJD and rms_MJD columns give information on the mean epoch of the FIRST flux density measurement. The FIRST survey consists of 
	--/ 3-minute integrations at a grid of points on the sky. But the catalogs are derived from coadded images that use a weighted 
	--/ sum of the individual pointing maps to achieve nearly uniform sensitivity. (See the FIRST survey paper for more details.) 
	--/ That means that each measurement is a weighted sum of multiple observations.The Epoch rms column (rms_MJD) gives the weighted rms of the pointing 
	--/ epochs at the source position. It is a measure of the spread in epochs that contribute to the measurement. Many sources 
	--/ have small rms values of only a few minutes (dominated by a single 3-minute pointings or by 2 adjacent pointings), but 
	--/ values of days to weeks are also common (for sources observed in the overlap between declination strips), and some objects 
	--/ have rms values of years (for sources observed at the edges of regions in different observing seasons or that were observed 
	--/ multiple times due to data problems). The largest epoch rms in the survey is 6.8 years.
	--/ The epoch rms should be used as a guide to identify objects that do not have well-defined epochs. The table below gives an 
	--/ indication of the frequency of different epoch rms values in the catalog. Epoch rms range	Fraction
	--/ &lt; 5 minutes	5%
	--/ 5 min - 1 day	29%
	--/ 1 - 10 days	44%
	--/ 10 - 100 days	11%
	--/ 100 days - 1 yr	7%
	--/ 1 - 2 yrs	1%
	--/ 2 - 5 yrs	2%
	--/ &gt; 5 yrs	0.3% </summary>
	--/ <quantity>stat.error;time.epoch;obs</quantity>
	[rms_MJD] real NOT NULL,
 CONSTRAINT [PK_PhotoObj] PRIMARY KEY CLUSTERED 
(
	[objID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

