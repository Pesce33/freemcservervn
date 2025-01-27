﻿/****** Object:  Table [dbo].[apogeeDesign]    Script Date: 4/1/2015 5:51:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

--/ <summary> Contains the plate design information for APOGEE plates. </summary>
--/ <remarks> This table contains all the design parameters used in designing plates  for APOGEE spectra. </remarks>
CREATE TABLE [dbo].[apogeeDesign](

	--/ <summary>Design ID from plate design (Primary key)</summary>
	--/ <quantity>meta.id;meta.main</quantity>
	[designid] [varchar](64) NOT NULL,

	--/ <summary>Right ascension, J2000, of plate center</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[ra] [float] NOT NULL,

	--/ <summary>Declination, J2000, of plate center</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[dec] [float] NOT NULL,

	--/ <summary>Location ID (Foreign key)</summary>
	--/ <quantity>meta.id</quantity>
	[location_id] [bigint] NOT NULL,

	--/ <summary>Utilized radius of plate</summary>
	--/ <quantity>phys.angSize;inst.det</quantity>
	--/ <unit>deg</unit>
	[radius] [real] NOT NULL,

	--/ <summary>If set to 1, a plate shared with another survey (0 if not)</summary>
	--/ <quantity>meta.code</quantity>
	[shared] [tinyint] NOT NULL,

	--/ <summary>Additional comments on design</summary>
	--/ <quantity>meta.note</quantity>
	[comments] [varchar](200) NOT NULL,

	--/ <summary>Which of this field's short cohorts is in this design</summary>
	--/ <quantity>meta.id</quantity>
	[short_cohort_version] [int] NOT NULL,

	--/ <summary>Which of this field's medium cohorts is in this design</summary>
	--/ <quantity>meta.id</quantity>
	[medium_cohort_version] [int] NOT NULL,

	--/ <summary>Which of this field's long cohorts is in this design</summary>
	--/ <quantity>meta.id</quantity>
	[long_cohort_version] [int] NOT NULL,

	--/ <summary>Number of fibers alloted to short cohort targets</summary>
	--/ <quantity>meta.id;instr</quantity>
	[number_of_short_fibers] [int] NOT NULL,

	--/ <summary>Number of fibers alloted to medium cohort targets</summary>
	--/ <quantity>meta.id;instr</quantity>
	[number_of_medium_fibers] [int] NOT NULL,

	--/ <summary>Number of fibers alloted to long cohort targets</summary>
	--/ <quantity>meta.id;instr</quantity>
	[number_of_long_fibers] [int] NOT NULL,

	--/ <summary>Minimum H mag of short cohort</summary>
	--/ <quantity>phot.mag;em.IR.H;stat.min</quantity>
	--/ <unit>mag</unit>
	[short_cohort_min_h] [real] NOT NULL,

	--/ <summary>Maximum H mag of short cohort</summary>
	--/ <quantity>phot.mag;em.IR.H;stat.max</quantity>
	--/ <unit>mag</unit>
	[short_cohort_max_h] [real] NOT NULL,

	--/ <summary>Minimum H mag of medium cohort</summary>
	--/ <quantity>phot.mag;em.IR.H;stat.min</quantity>
	--/ <unit>mag</unit>
	[medium_cohort_min_h] [real] NOT NULL,

	--/ <summary>Maximum H mag of medium cohort</summary>
	--/ <quantity>phot.mag;em.IR.H;stat.max</quantity>
	--/ <unit>mag</unit>
	[medium_cohort_max_h] [real] NOT NULL,

	--/ <summary>Minimum H mag of long cohort</summary>
	--/ <quantity>phot.mag;em.IR.H;stat.min</quantity>
	--/ <unit>mag</unit>
	[long_cohort_min_h] [real] NOT NULL,

	--/ <summary>Maximum H mag of long cohort</summary>
	--/ <quantity>phot.mag;em.IR.H;stat.max</quantity>
	--/ <unit>mag</unit>
	[long_cohort_max_h] [real] NOT NULL,

	--/ <summary>Minimum (J-Ks)o for this design; -1 if no color cut applied</summary>
	--/ <quantity>phot.color;em.IR.J;em.IR.H;stat.min</quantity>
	[dereddened_min_j_ks_color] [real] NOT NULL,

	--/ <summary>Total number of visits intended for this design</summary>
	--/ <quantity>meta.number</quantity>
	[number_of_visits] [int] NOT NULL,

	--/ <summary>Number of hot star tellurics on this design (tellurics/science targets may overlap)</summary>
	--/ <quantity>meta.number</quantity>
	[number_of_tellurics] [int] NOT NULL,

	--/ <summary>Number of sky targets on this design</summary>
	--/ <quantity>meta.number</quantity>
	[number_of_sky] [int] NOT NULL,

	--/ <summary>Number of science targets on this design (tellurics/science targets may overlap)</summary>
	--/ <quantity>meta.number</quantity>
	[number_of_science] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[apogeeField]    Script Date: 4/1/2015 5:51:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

--/ <summary> Contains the basic information for an APOGEE field. </summary>
--/ <remarks> This table contains the name, location and number of visits expected  for an APOGEE field. </remarks>
CREATE TABLE [dbo].[apogeeField](

	--/ <summary>Name of field</summary>
	--/ <quantity>meta.id;obs.field</quantity>
	[field_name] [varchar](100) NOT NULL,

	--/ <summary>Location ID (Primary key)</summary>
	--/ <quantity>meta.id</quantity>
	[location_id] [bigint] NOT NULL,

	--/ <summary>Right ascension of field center (J2000)</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[ra] [float] NOT NULL,

	--/ <summary>Declination of field center (J2000)</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[dec] [float] NOT NULL,
	
	--/ <summary>Expected number of visits for this field (not necessarily the number of visits actually achieved)</summary>
	--/ <quantity>meta.number</quantity>
	[expected_no_of_visits] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[apogeeObject]    Script Date: 4/1/2015 5:51:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

--/ <summary> Contains the targeting information for an APOGEE object. </summary>
--/ <remarks> This table contains all the parameters that went into targeting objects  for APOGEE spectra. </remarks>
CREATE TABLE [dbo].[apogeeObject](

	--/ <summary>ID identifying this target object</summary>
	--/ <quantity>meta.id</quantity>
	[apogee_id] [varchar](64) NOT NULL,

	--/ <summary>Unique targeting ID identifying this target object (of form [location_id].[apogee_id])</summary>
	--/ <quantity>meta.id</quantity>
	[target_id] [varchar](64) NOT NULL,

	--/ <summary>Alternate name for non-2MASS objects</summary>
	--/ <quantity>meta.id</quantity>
	[alt_id] [varchar](64) NOT NULL,

	--/ <summary>Location ID</summary>
	--/ <quantity>meta.id</quantity>
	[location_id] [bigint] NOT NULL,

	--/ <summary>Right ascension (J2000)</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[ra] [float] NOT NULL,

	--/ <summary>Declination (J2000)</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[dec] [float] NOT NULL,

	--/ <summary>2MASS J-band magnitude</summary>
	--/ <quantity>phot.mag;em.IR.J</quantity>
	--/ <unit>mag</unit>
	[j] [real] NOT NULL,

	--/ <summary>2MASS J-band magnitude error</summary>
	--/ <quantity>stat;error;phot.mag;em.IR.J</quantity>
	--/ <unit>mag</unit>
	[j_err] [real] NOT NULL,

	--/ <summary>H-band magnitude</summary>
	--/ <quantity>error;phot.mag;em.IR.H</quantity>
	--/ <unit>mag</unit>
	[h] [real] NOT NULL,

	--/ <summary>Source of H magnitude</summary>
	--/ <quantity>meta.ref;error;phot.mag;em.IR.H</quantity>
	[src_h] [varchar](100) NOT NULL,

	--/ <summary>H-band magnitude error</summary>
	--/ <quantity>stat.error;error;phot.mag;em.IR.H</quantity>
	--/ <unit>mag</unit>
	[h_err] [real] NOT NULL,

	--/ <summary>2MASS Ks-band magnitude</summary>
	--/ <quantity>error;phot.mag;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[k] [real] NOT NULL,

	--/ <summary>2MASS Ks-band magnitude error</summary>
	--/ <quantity>stat.error;error;phot.mag;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[k_err] [real] NOT NULL,

	--/ <summary>IRAC 3.6 micron magnitude</summary>
	--/ <quantity>phot.mag;em.IR.Spizter.IRAC36</quantity>
	--/ <unit>mag</unit>
	[irac_3_6] [real] NOT NULL,

	--/ <summary>IRAC 3.6 micron magnitude error</summary>
	--/ <quantity>stat.error;phot.mag;em.IR.Spizter.IRAC36</quantity>
	--/ <unit>mag</unit>
	[irac_3_6_err] [real] NOT NULL,

	--/ <summary>IRAC 4.5 micron magnitude</summary>
	--/ <quantity>phot.mag;em.IR.Spizter.IRAC45</quantity>
	--/ <unit>mag</unit>
	[irac_4_5] [real] NOT NULL,

	--/ <summary>IRAC 4.5 micron magnitude error</summary>
	--/ <quantity>stat.error;phot.mag;em.IR.Spizter.IRAC45</quantity>
	--/ <unit>mag</unit>
	[irac_4_5_err] [real] NOT NULL,

	--/ <summary>source of 4.5 micron magnitude used for targeting</summary>
	--/ <quantity>meta.ref</quantity>
	[src_4_5] [varchar](100) NOT NULL,

	--/ <summary>IRAC 5.4 micron magnitude</summary>
	--/ <quantity>phot.mag;em.IR.Spizter.IRAC54</quantity>
	--/ <unit>mag</unit>
	[irac_5_8] [real] NOT NULL,

	--/ <summary>IRAC 5.4 micron magnitude error</summary>
	--/ <quantity>stat.error;phot.mag;em.IR.Spizter.IRAC45</quantity>
	--/ <unit>mag</unit>
	[irac_5_8_err] [real] NOT NULL,

	--/ <summary>IRAC 8.0 micron magnitude</summary>
	--/ <quantity>phot.mag;em.IR.Spizter.IRAC80</quantity>
	--/ <unit>mag</unit>
	[irac_8_0] [real] NOT NULL,

	--/ <summary>IRAC 8.0 micron magnitude error</summary>
	--/ <quantity>stat.error;phot.mag;em.IR.Spizter.IRAC80</quantity>
	--/ <unit>mag</unit>
	[irac_8_0_err] [real] NOT NULL,

	--/ <summary>WISE allWISE release 4.5 micron magnitude</summary>
	--/ <quantity>phot.mag;em.IR.WISE.w2</quantity>
	--/ <unit>mag</unit>
	[wise_4_5] [real] NOT NULL,

	--/ <summary>WISE allWISE release 4.5 micron magnitude error</summary>
	--/ <quantity>stat.error;phot.mag;em.IR.WISE.w2</quantity>
	--/ <unit>mag</unit>
	[wise_4_5_err] [real] NOT NULL,

	--/ <summary>Ks-band extinction based on WISE allWISE release photometry</summary>
	--/ <quantity>phys.absorption.galactic;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[ak_wise] [real] NOT NULL,
	
	--/ <summary>E(B-V) at object's position in Schlegel, Finkbeiner, &amp; David (1998) maps</summary>
	--/ <quantity>phot.color.excess</quantity>
	--/ <unit>mag</unit>
	[sfd_ebv] [real] NOT NULL,

	--/ <summary>Washington M magnitude</summary>
	--/ <quantity>phot.mag</quantity>
	--/ <unit>mag</unit>
	[wash_m] [real] NOT NULL,

	--/ <summary>Washington M magnitude error</summary>
	--/ <quantity>stat.error;phot.mag</quantity>
	--/ <unit>mag</unit>
	[wash_m_err] [real] NOT NULL,

	--/ <summary>Washington T2 magnitude</summary>
	--/ <quantity>phot.mag</quantity>
	--/ <unit>mag</unit>
	[wash_t2] [real] NOT NULL,

	--/ <summary>Washington T2 magnitude error</summary>
	--/ <quantity>stat.error;phot.mag</quantity>
	--/ <unit>mag</unit>
	[wash_t2_err] [real] NOT NULL,

	--/ <summary>DDO51 magnitude</summary>
	--/ <quantity>phot.mag</quantity>
	--/ <unit>mag</unit>
	[DDO51] [real] NOT NULL,

	--/ <summary>DDO51 magnitude error</summary>
	--/ <quantity>stat.error;phot.mag</quantity>
	--/ <unit>mag</unit>
	[DDO51_err] [real] NOT NULL,

	--/ <summary>Luminosity class classification derived from Wash+DDO51 data (1 = giant, 0 = dwarf, -1 = no data)</summary>
	--/ <quantity>meta.code;src.class.luminosity</quantity>
	[wash_ddo51_giant_flag] [int] NOT NULL,

	--/ <summary>Stellar classification based on Washington+DDO51 data (0=extended, 1=star-like or no data)</summary>
	--/ <quantity>meta.code;src.class.starGalaxy</quantity>
	[wash_ddo51_star_flag] [int] NOT NULL,

	--/ <summary>4.5 micron magnitude used for targeting</summary>
	--/ <quantity>phot.mag;em.IR.4-8um</quantity>
	--/ <unit>mag</unit>
	[targ_4_5] [real] NOT NULL,

	--/ <summary>Error in 4.5 micron magnitude used for targeting</summary>
	--/ <quantity>stat.error;phot.mag;em.IR.4-8um</quantity>
	--/ <unit>mag</unit>
	[targ_4_5_err] [real] NOT NULL,

	--/ <summary>Ks-band extinction used for target selection</summary>
	--/ <quantity>phys.absorption.gal;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[ak_targ] [real] NOT NULL,

	--/ <summary>Method to calculate Ks-band extinction used for target selection (RJCE_IRAC, RJCE_WISE_ALLSKY, RJCE_WISE_PARTSKY, RJCE_WISE_OPS2, RJCE_WISE_OPS, SFD_EBV, NONE)</summary>
	--/ <quantity>meta.note;</quantity>
	[ak_targ_method] [varchar](32) NOT NULL,

	--/ <summary>Proper motion in RA</summary>
	--/ <quantity>pos.pm;pos.eq.ra</quantity>
	--/ <unit>mas yr-1</unit>
	[pmra] [real] NOT NULL,

	--/ <summary>Uncertainty in proper motion in RA</summary>
	--/ <quantity>stat.error;pos.pm;pos.eq.ra</quantity>
	--/ <unit>mas yr-1</unit>
	[pmra_err] [real] NOT NULL,

	--/ <summary>Proper motion in Dec</summary>
	--/ <quantity>pos.pm;pos.eq.dec</quantity>
	--/ <unit>mas yr-1</unit>
	[pmdec] [real] NOT NULL,

	--/ <summary>Uncertainty in proper motion in Dec</summary>
	--/ <quantity>stat.error;pos.pm;pos.eq.dec</quantity>
	--/ <unit>mas yr-1</unit>
	[pmdec_err] [real] NOT NULL,

	--/ <summary>Source of proper motion data</summary>
	--/ <quantity>meta.ref;pos.pm</quantity>
	[pm_src] [varchar](100) NOT NULL,

	--/ <summary>Source of 2MASS optical counterpart</summary>
	--/ <quantity>meta.ref</quantity>
	[tmass_a] [varchar](32) NOT NULL,

	--/ <summary>Position angle of 2MASS optical counterpart (East of North)</summary>
	--/ <quantity>pos.posAng</quantity>
	--/ <unit>deg</unit>
	[tmass_pxpa] [real] NOT NULL,

	--/ <summary>Proximity of 2MASS nearest neighbor</summary>
	--/ <quantity>pos.angDistance</quantity>
	--/ <unit>arcsec</unit>
	[tmass_prox] [real] NOT NULL,

	--/ <summary>2MASS ph_qual flag</summary>
	--/ <quantity>meta.code.qual</quantity>
	[tmass_phqual] [varchar](32) NOT NULL,

	--/ <summary>2MASS read_flag</summary>
	--/ <quantity>meta.code</quantity>
	[tmass_rdflg] [varchar](32) NOT NULL,

	--/ <summary>2MASS contamination flag</summary>
	--/ <quantity>meta.code</quantity>
	[tmass_ccflg] [varchar](32) NOT NULL,

	--/ <summary>2MASS Extended Source Catalog ID of associated source</summary>
	--/ <quantity>meta.id.assoc</quantity>
	[tmass_extkey] [bigint] NOT NULL,

	--/ <summary>2MASS galaxy contamination flag</summary>
	--/ <quantity>meta.code</quantity>
	[tmass_gal_contam] [varchar](32) NOT NULL,
 CONSTRAINT [pk_apogeeObject_target_id] PRIMARY KEY CLUSTERED 
(
	[target_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[apogeePlate]    Script Date: 4/1/2015 5:51:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

--/ <summary> Contains all the information associated with an APOGEE plate. </summary>
--/ <remarks> This table contains the parameters for an APOGEE spectral plate </remarks>
CREATE TABLE [dbo].[apogeePlate](

	--/ <summary>Unique ID for plate visit, of form apogee.[telescope].[cs].plate.mjd (Primary key)</summary>
	--/ <quantity>meta.id</quantity>
	[plate_visit_id] [varchar](64) NOT NULL,

	--/ <summary>Location ID (Foreign key)</summary>
	--/ <quantity>meta.id</quantity>
	[location_id] [bigint] NOT NULL,

	--/ <summary>Plate of this visit</summary>
	--/ <quantity>meta.id;instr.det</quantity>
	[plate] [varchar](32) NOT NULL,

	--/ <summary>MJD of this visit</summary>
	--/ <quantity>time.epoch</quantity>
	[mjd] [bigint] NOT NULL,

	--/ <summary>Visit reduction pipeline version</summary>
	--/ <quantity>meta.version</quantity>
	[apred_version] [varchar](32) NOT NULL,

	--/ <summary>Name of location that this plate belongs to</summary>
	--/ <quantity>met.id</quantity>
	[name] [varchar](64) NOT NULL,

	--/ <summary>Right ascension, J2000, of plate center</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[racen] [float] NOT NULL,

	--/ <summary>Declination, J2000, of plate center</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[deccen] [float] NOT NULL,

	--/ <summary>Utilized radius of plate</summary>
	--/ <quantity>phys.angSize;instr.det</quantity>
	--/ <unit>deg</unit>
	[radius] [real] NOT NULL,

	--/ <summary>If set to 1, a plate shared with another survey (0 if not)</summary>
	--/ <quantity>meta.code</quantity>
	[shared] [tinyint] NOT NULL,

	--/ <summary>Type of field</summary>
	--/ <quantity>meta.code;obs.field</quantity>
	[field_type] [tinyint] NOT NULL,

	--/ <summary>Survey name</summary>
	--/ <quantity>meta.id</quantity>
	[survey] [varchar](64) NOT NULL,

	--/ <summary>Program name within survey</summary>
	--/ <quantity>meta.id</quantity>
	[programname] [varchar](64) NOT NULL,

	--/ <summary>Plate run in which plate was drilled</summary>
	--/ <quantity>meta.note;instr.det</quantity>
	[platerun] [varchar](64) NOT NULL,

	--/ <summary>Design ID associated with plate  (Foreign key)</summary>
	--/ <quantity>meta.id;instr.det</quantity>
	[designid] [bigint] NOT NULL,

	--/ <summary>Number of standard stars on plate</summary>
	--/ <quantity>meta.number;src</quantity>
	[nStandard] [bigint] NOT NULL,

	--/ <summary>Number of science stars on plate</summary>
	--/ <quantity>meta.number;src</quantity>
	[nScience] [bigint] NOT NULL,

	--/ <summary>Number of sky fibers on plate</summary>
	--/ <quantity>meta.number;instr.param</quantity>
	[nSky] [bigint] NOT NULL,

	--/ <summary>Version of platedesign used to create plate design</summary>
	--/ <quantity>meta.version</quantity>
	[platedesign_version] [varchar](10) NOT NULL,
 CONSTRAINT [pk_apogeePlate_plate_visit_id] PRIMARY KEY CLUSTERED 
(
	[plate_visit_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[apogeeStar]    Script Date: 4/1/2015 5:51:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

--/ <summary> Contains data for an APOGEE star combined spectrum. </summary>
--/ <remarks> This table contains the data in the combined spectrum for an APOGEE star.  </remarks>
CREATE TABLE [dbo].[apogeeStar](

	--/ <summary>Unique ID for combined star spectrum of form apogee.[telescope].[cs].apstar_version.location_id.apogee_id (Primary key)</summary>
	--/ <quantity>meta.id</quantity>
	[apstar_id] [varchar](64) NOT NULL,

	--/ <summary>target ID (Foreign key, of form [location_id].[apogee_id])</summary>
	--/ <quantity>meta.id</quantity>
	[target_id] [varchar](64) NOT NULL,

	--/ <summary>ID star identification used within reductions</summary>
	--/ <quantity>meta.id</quantity>
	[reduction_id] [varchar](32) NOT NULL,

	--/ <summary>File base name with combined star spectrum</summary>
	--/ <quantity>meta.id;meta.file</quantity>
	[file] [varchar](128) NOT NULL,

	--/ <summary>2MASS-style star identification</summary>
	--/ <quantity>emeta.id</quantity>
	[apogee_id] [varchar](32) NOT NULL,

	--/ <summary>Telescope where data was taken</summary>
	--/ <quantity>pos;instr.tel</quantity>
	[telescope] [varchar](32) NOT NULL,

	--/ <summary>Location ID for the field this visit is in (Foreign key)</summary>
	--/ <quantity>meta.id</quantity>
	[location_id] [bigint] NOT NULL,

	--/ <summary>Name of field</summary>
	--/ <quantity>meta.id;obs.field</quantity>
	[field] [varchar](100) NOT NULL,

	--/ <summary>Right ascension, J2000</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[ra] [float] NOT NULL,

	--/ <summary>Declination, J2000</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[dec] [float] NOT NULL,

	--/ <summary> Cartesian X (J2000)</summary>
	--/ <quantity>pos.eq.x;pos.frame=j2000</quantity>
	[cx] [float] NOT NULL,

	--/ <summary> Cartesian Y (J2000)</summary>
	--/ <quantity>pos.eq.y;pos.frame=j2000</quantity>
	[cy] [float] NOT NULL,

	--/ <summary> Cartesian Z (J2000)</summary>
	--/ <quantity>pos.eq.z;pos.frame=j2000</quantity>
	[cz] [float] NOT NULL,

	--/ <summary> HTM ID (J2000)</summary>
	--/ <quantity>pos.eq.x;pos.frame=j2000</quantity>
	[htmID] [bigint] NOT NULL,

	--/ <summary> Zone ID</summary>
	--/ <quantity>pos.eq.zone;pos.frame=j2000</quantity>
	[zoneID] [bigint] NOT NULL,

	--/ <summary>Galactic longitude</summary>
	--/ <quantity>pos.galactic.lon</quantity>
	--/ <unit>deg</unit>
	[glon] [float] NOT NULL,

	--/ <summary>Galactic latitude</summary>
	--/ <quantity>pos.galactic.lat</quantity>
	--/ <unit>deg</unit>
	[glat] [float] NOT NULL,

	--/ <summary>APOGEE target flag (first 64 bits)</summary>
	--/ <quantity>meta.code</quantity>
	[apogee_target1] [bigint] NOT NULL,

	--/ <summary>APOGEE target flag (second 64 bits)</summary>
	--/ <quantity>meta.code</quantity>
	[apogee_target2] [bigint] NOT NULL,

	--/ <summary>Shorthand flag to denote not a main survey object</summary>
	--/ <quantity>meta.code</quantity>
	[extratarg] [bigint] NOT NULL,

	--/ <summary>Number of visits contributing to the combined spectrum</summary>
	--/ <quantity>meta.number</quantity>
	[nvisits] [bigint] NOT NULL,

	--/ <summary>Set to 1 if this is commissioning data</summary>
	--/ <quantity>meta.code</quantity>
	[commiss] [bigint] NOT NULL,

	--/ <summary>Median signal-to-noise ratio per pixel</summary>
	--/ <quantity>stat.snr;stat.median</quantity>
	[snr] [real] NOT NULL,

	--/ <summary>Bit mask with APOGEE star flags; each bit is set here if it is set in any visit</summary>
	--/ <quantity>meta.code</quantity>
	[starflag] [bigint] NOT NULL,

	--/ <summary>AND of visit bit mask with APOGEE star flags; each bit is set if set in all visits</summary>
	--/ <quantity>meta.code</quantity>
	[andflag] [bigint] NOT NULL,

	--/ <summary>Signal-to-noise weighted average of heliocentric radial velocity, as determined relative to combined spectrum, with zeropoint from xcorr of combined spectrum with best-fitting template</summary>
	--/ <quantity>spect.dopplerVeloc</quantity>
	--/ <unit>km s-1</unit>
	[vhelio_avg] [real] NOT NULL,

	--/ <summary>Standard deviation of scatter of individual visit RVs around average</summary>
	--/ <quantity>stat.stdev;spect.dopplerVeloc</quantity>
	--/ <unit>km s-1</unit>
	[vscatter] [real] NOT NULL,

	--/ <summary>Weighted error of heliocentric RV</summary>
	--/ <quantity>stat.error;spect.dopplerVeloc</quantity>
	--/ <unit>km s-1</unit>
	[verr] [real] NOT NULL,

	--/ <summary>Median of individual visit RV errors</summary>
	--/ <quantity>spect.dopplerVeloc;stat.median</quantity>
	--/ <unit>km s-1</unit>
	[verr_med] [real] NOT NULL,

	--/ <summary>Signal-to-noise weighted average of heliocentric radial velocity relative to single best-fit synthetic template</summary>
	--/ <quantity>spect.dopplerVeloc</quantity>
	--/ <unit>km s-1</unit>
	[synthvhelio_avg] [real] NOT NULL,

	--/ <summary>Standard deviation of scatter of visit radial velocities determined from combined spectrum and best-fit synthetic template</summary>
	--/ <quantity>stat.stdev;spect.dopplerVeloc</quantity>
	--/ <unit>km s-1</unit>
	[synthvscatter] [real] NOT NULL,

	--/ <summary>Error in signal-to-noise weighted average of heliocentric radial velocity relative to single best-fit synthetic template</summary>
	--/ <quantity>stat.error;spect.dopplerVeloc</quantity>
	--/ <unit>km s-1</unit>
	[synthverr] [real] NOT NULL,

	--/ <summary>Median of individual visit synthetic RV errors</summary>
	--/ <quantity>spect.dopplerVeloc;stat.median</quantity>
	--/ <unit>km s-1</unit>
	[synthverr_med] [real] NOT NULL,

	--/ <summary>effective temperature from RV template match</summary>
	--/ <quantity>phys.temperature</quantity>
	--/ <unit>K</unit>
	[rv_teff] [real] NOT NULL,

	--/ <summary>log g from RV template match</summary>
	--/ <quantity>phys.gravity</quantity>
	--/ <unit>dex</unit>
	[rv_logg] [real] NOT NULL,

	--/ <summary>[Fe/H] from RV template match</summary>
	--/ <quantity>phys.abund.Fe</quantity>
	--/ <unit>dex</unit>
	[rv_feh] [real] NOT NULL,

	--/ <summary>FWHM of cross-correlation peak from combined vs best-match synthetic spectrum</summary>
	--/ <quantity>spect.line.width</quantity>
	--/ <unit>km s-1</unit>
	[rv_ccfwhm] [real] NOT NULL,

	--/ <summary>FWHM of auto-correlation of best-match synthetic spectrum</summary>
	--/ <quantity>spect.line.width</quantity>
	--/ <unit>km s-1</unit>
	[rv_autofwhm] [real] NOT NULL,

	--/ <summary>scatter between RV using combined spectrum and RV using synthetic spectrum</summary>
	--/ <quantity>spect.line.width</quantity>
	--/ <unit>km s-1</unit>
	[synthscatter] [real] NOT NULL,

	--/ <summary>Chi-squared of RV distribution under assumption of a stable single-valued RV; perhaps not currently useful because of issues with understanding RV errors</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[stablerv_chi2] [real] NOT NULL,

	--/ <summary>Reduced chi^2 of RV distribution</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[stablerv_rchi2] [real] NOT NULL,

	--/ <summary>Threshold chi^2 for possible binary determination (not currently valid)</summary>
	--/ <quantity>stat.value;stat.fit.chi2</quantity>
	[chi2_threshold] [real] NOT NULL,

	--/ <summary>Probability of obtaining observed chi^2 under assumption of stable RV</summary>
	--/ <quantity>stat.probability</quantity>
	[stablerv_chi2_prob] [real] NOT NULL,

	--/ <summary>Reduction version of spectrum combination</summary>
	--/ <quantity>meta.version</quantity>
	[apstar_version] [varchar](32) NOT NULL
 CONSTRAINT [pk_apogeeStar_apstar_id] PRIMARY KEY CLUSTERED 
(
	[apstar_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[apogeeStarAllVisit]    Script Date: 4/1/2015 5:51:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

--/ <summary> Links an APOGEE combined star spectrum with all visits for that star. </summary>
--/ <remarks> This is a linking table that links an APOGEE combined star spectrum  with all the visits for that star, including good, bad, commsssioning,  not, etc. </remarks>
CREATE TABLE [dbo].[apogeeStarAllVisit](

	--/ <summary>Unique ID for visit spectrum, of form apogee.[telescope].[cs].[apred_version].plate.mjd.fiberid</summary>
	--/ <quantity>meta.id</quantity>
	[visit_id] [varchar](64) NOT NULL,

	--/ <summary>Unique ID for combined star spectrum of form apogee.[telescope].[cs].apstar_version.location_id.apogee_id</summary>
	--/ <quantity>meta.id</quantity>
	[apstar_id] [varchar](64) NOT NULL,
 CONSTRAINT [pk_apogeeStarAllVisit_visit_id_a] PRIMARY KEY CLUSTERED 
(
	[visit_id] ASC,
	[apstar_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[apogeeStarVisit]    Script Date: 4/1/2015 5:51:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

--/ <summary> Contains the ApogeeStarFlag flag values from DataConstants as binary(4). </summary>
--/ <remarks> Please see the APOGEE_STARFLAG entry in Algorithms under Bitmasks  for further information. </remarks>
CREATE TABLE [dbo].[apogeeStarVisit](

	--/ <summary>Unique ID for visit spectrum, of form apogee.[telescope].[cs].[apred_version].plate.mjd.fiberid</summary>
	--/ <quantity>meta.id</quantity>
	[visit_id] [varchar](64) NOT NULL,

	--/ <summary>Unique ID for combined star spectrum of form apogee.[telescope].[cs].apstar_version.location_id.apogee_id</summary>
	--/ <quantity>meta.id</quantity>
	[apstar_id] [varchar](64) NOT NULL,
 CONSTRAINT [pk_apogeeStarVisit_visit_id] PRIMARY KEY CLUSTERED 
(
	[visit_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[apogeeVisit]    Script Date: 4/1/2015 5:51:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

--/ <summary> Contains data for a particular APOGEE spectrum visit. </summary>
--/ <remarks> This table corresponds to the data in a single spectrum visit in APOGEE  </remarks>
CREATE TABLE [dbo].[apogeeVisit](

	--/ <summary>Unique ID for visit spectrum, of form apogee.[telescope].[cs].[apred_version].plate.mjd.fiberid (Primary key)</summary>
	--/ <quantity>meta.id</quantity>
	[visit_id] [varchar](64) NOT NULL,

	--/ <summary>Visit reduction pipeline version (e.g. "r3")</summary>
	--/ <quantity>meta.version</quantity>
	[apred_version] [varchar](32) NOT NULL,

	--/ <summary>2MASS-style star identification</summary>
	--/ <quantity>meta.id</quantity>
	[apogee_id] [varchar](64) NOT NULL,

	--/ <summary>target ID (Foreign key, of form [location_id].[apogee_id])</summary>
	--/ <quantity>meta.id</quantity>
	[target_id] [varchar](64) NOT NULL,

	--/ <summary>ID star identification used within reductions</summary>
	--/ <quantity>meta.id</quantity>
	[reduction_id] [varchar](32) NOT NULL,

	--/ <summary>File base name with visit spectrum and catalog information</summary>
	--/ <quantity>meta.id;meta.file</quantity>
	[file] [varchar](128) NOT NULL,

	--/ <summary>Telescope where data was taken</summary>
	--/ <quantity>pos;instr.tel</quantity>
	[telescope] [varchar](32) NOT NULL,

	--/ <summary>Fiber ID for this visit</summary>
	--/ <quantity>meta.id;instr.param</quantity>
	[fiberid] [bigint] NOT NULL,

	--/ <summary>Plate of this visit</summary>
	--/ <quantity>meta.id;instr.det</quantity>
	[plate] [varchar](32) NOT NULL,

	--/ <summary>MJD of this visit</summary>
	--/ <quantity>time.epcoh</quantity>
	[mjd] [bigint] NOT NULL,

	--/ <summary>Location ID for the field this visit is in (Foreign key)</summary>
	--/ <quantity>meta.id</quantity>
	[location_id] [bigint] NOT NULL,

	--/ <summary>Right ascension, J2000</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[ra] [float] NOT NULL,

	--/ <summary>Declination, J2000</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[dec] [float] NOT NULL,

	--/ <summary>Galactic longitude</summary>
	--/ <quantity>pos.galactic.lon</quantity>
	--/ <unit>deg</unit>
	[glon] [float] NOT NULL,

	--/ <summary>Galactic latitude</summary>
	--/ <quantity>pos.galactic.lat</quantity>
	--/ <unit>deg</unit>
	[glat] [float] NOT NULL,

	--/ <summary>APOGEE target flag (first 64 bits)</summary>
	--/ <quantity>meta.code</quantity>
	[apogee_target1] [bigint] NOT NULL,

	--/ <summary>APOGEE target flag (second 64 bits)</summary>
	--/ <quantity>meta.code</quantity>
	[apogee_target2] [bigint] NOT NULL,

	--/ <summary>Shorthand flag to denote not a main survey object</summary>
	--/ <quantity>meta.code</quantity>
	[extratarg] [bigint] NOT NULL,

	--/ <summary>Median signal-to-noise ratio per pixel</summary>
	--/ <quantity>stat.snr;stat.median</quantity>
	[snr] [real] NOT NULL,

	--/ <summary>Bit mask with APOGEE star flags</summary>
	--/ <quantity>meta.code</quantity>
	[starflag] [bigint] NOT NULL,

	--/ <summary>Date of observation (YYYY-MM-DDTHH:MM:SS.SSS)</summary>
	--/ <quantity>time.epoch;obs</quantity>
	[dateobs] [varchar](100) NOT NULL,

	--/ <summary>Julian date of observation</summary>
	--/ <quantity>time.epcoh;obs</quantity>
	[jd] [float] NOT NULL,

	--/ <summary>Barycentric correction (VHELIO - VREL)</summary>
	--/ <quantity>phys.veloc</quantity>
	--/ <unit>km s-1</unit>
	[bc] [real] NOT NULL,

	--/ <summary>Radial velocity method (1 = chi-squared, 2 = cross-correlation, 3 = refined cross-correlation)</summary>
	--/ <quantity>meta.code;spect.dopplerVeloc</quantity>
	[vtype] [real] NOT NULL,

	--/ <summary>Derived radial velocity</summary>
	--/ <quantity>spect.dopplerVeloc</quantity>
	--/ <unit>km s-1</unit>
	[vrel] [real] NOT NULL,

	--/ <summary>Derived radial velocity error</summary>
	--/ <quantity>stat.error;spect.dopplerVeloc</quantity>
	--/ <unit>km s-1</unit>
	[vrelerr] [real] NOT NULL,

	--/ <summary>Derived heliocentric radial velocity</summary>
	--/ <quantity>spect.dopplerVeloc</quantity>
	--/ <unit>km s-1</unit>
	[vhelio] [real] NOT NULL,
	
	--/ <summary>Chi-squared of match to TV template</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[chisq] [real] NOT NULL,

	--/ <summary>[Fe/H] of radial velocity template</summary>
	--/ <quantity>phys.abund.Fe</quantity>
	[rv_feh] [real] NOT NULL,

	--/ <summary>Effective temperature of radial velocity template</summary>
	--/ <quantity>phys.temperature</quantity>
	--/ <unit>K</unit>
	[rv_teff] [real] NOT NULL,

	--/ <summary>Log gravity of radial velocity template</summary>
	--/ <quantity>phys.grav</quantity>
	--/ <unit>dex</unit>
	[rv_logg] [real] NOT NULL,

	--/ <summary>[alpha/M] alpha-element abundance</summary>
	--/ <quantity>phys.abund</quantity>
	[rv_alpha] [real] NOT NULL,

	--/ <summary>[C/H] carbon abundance</summary>
	--/ <quantity>phys.abund</quantity>
	[rv_carb] [real] NOT NULL,

	--/ <summary>File name of synthetic grid</summary>
	--/ <quantity>meta.id;meta.file</quantity>
	[synthfile] [varchar](100) NOT NULL,

	--/ <summary>Initial radial velocity method for individual visit RV estimate (1 = chi-squared, 2 = cross-correlation)</summary>
	--/ <quantity>meta.code;spect.dopplerVeloc</quantity>
	[estvtype] [bigint] NOT NULL,

	--/ <summary>Initial radial velocity for individual visit RV estimate</summary>
	--/ <quantity>spect.dopplerVeloc</quantity>
	--/ <unit>km s-1</unit>
	[estvrel] [real] NOT NULL,

	--/ <summary>Error in initial radial velocity for individual visit RV estimate</summary>
	--/ <quantity>stat.error;spect.dopplerVeloc</quantity>
	--/ <unit>km s-1</unit>
	[estvrelerr] [real] NOT NULL,

	--/ <summary>Initial heliocentric radial velocity for individual visit RV estimate</summary>
	--/ <quantity>spect.dopplerVeloc</quantity>
	--/ <unit>km s-1</unit>
	[estvhelio] [real] NOT NULL,

	--/ <summary>Radial velocity from cross-correlation of individual visit against final template</summary>
	--/ <quantity>spect.dopplerVeloc</quantity>
	--/ <unit>km s-1</unit>
	[synthvrel] [real] NOT NULL,

	--/ <summary>Radial velocity error from cross-correlation of individual visit against final template</summary>
	--/ <quantity>stat.error;spect.dopplerVeloc</quantity>
	--/ <unit>km s-1</unit>
	[synthvrelerr] [real] NOT NULL,

	--/ <summary>Heliocentric radial velocity from cross-correlation of individual visit against final template</summary>
	--/ <quantity>spect.dopplerVeloc</quantity>
	--/ <unit>km s-1</unit>
	[synthvhelio] [real] NOT NULL,
 CONSTRAINT [pk_apogeeVisit_visit_id] PRIMARY KEY CLUSTERED 
(
	[visit_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[aspcapStar]    Script Date: 4/1/2015 5:51:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

--/ <summary> Contains data for an APOGEE star ASPCAP entry. </summary>
--/ <remarks> This table contains the data in the ASPCAP entry for an APOGEE star.  </remarks>
CREATE TABLE [dbo].[aspcapStar](

	--/ <summary>Unique ID of combined star spectrum on which these results are based (Foreign key)</summary>
	--/ <quantity>meta.id</quantity>
	[apstar_id] [varchar](64) NOT NULL,

	--/ <summary>target ID (Foreign key, of form [location_id].[apogee_id])</summary>
	--/ <quantity>meta.id</quantity>
	[target_id] [varchar](64) NOT NULL,

	--/ <summary>Unique ID for ASPCAP results of form apogee.[telescope].[cs].results_version.location_id.star (Primary key)</summary>
	--/ <quantity>meta.id</quantity>
	[aspcap_id] [varchar](64) NOT NULL,

	--/ <summary>2MASS-style star identification</summary>
	--/ <quantity>meta.id</quantity>
	[apogee_id] [varchar](32) NOT NULL,

	--/ <summary>reduction version of ASPCAP</summary>
	--/ <quantity>meta.version;obs.param</quantity>
	[aspcap_version] [varchar](32) NOT NULL,

	--/ <summary>reduction version of for post-processing</summary>
	--/ <quantity>meta.vers1d;obs.param</quantity>
	[results_version] [varchar](32) NOT NULL,

	--/ <summary>Empirically calibrated temperature from ASPCAP</summary>
	--/ <quantity>phys.temperature</quantity>
	--/ <unit>K</unit>
	[teff] [real] NOT NULL,

	--/ <summary>external uncertainty estimate for calibrated temperature from ASPCAP</summary>
	--/ <quantity>stat.error;phys.temperature</quantity>
	--/ <unit>K</unit>
	[teff_err] [real] NOT NULL,

	--/ <summary>PARAMFLAG for effective temperature</summary>
	--/ <quantity>meta.code;phys.temperature</quantity>
	[teff_flag] [int] NOT NULL,

	--/ <summary>empirically calibrated log gravity from ASPCAP</summary>
	--/ <quantity>phys.gravity</quantity>
	--/ <unit>dex</unit>
	[logg] [real] NOT NULL,

	--/ <summary>external uncertainty estimate for log gravity from ASPCAP</summary>
	--/ <quantity>stat.error;phys.gravity</quantity>
	--/ <unit>dex</unit>
	[logg_err] [real] NOT NULL,

	--/ <summary>PARAMFLAG for log g</summary>
	--/ <quantity>meta.code;phys.gravity</quantity>
	[logg_flag] [int] NOT NULL,

	--/ <summary>chi^2 of ASPCAP fit</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[aspcap_chi2] [real] NOT NULL,

	--/ <summary>Temperature class of best-fitting spectrum</summary>
	--/ <quantity>phys.temperature</quantity>
	[aspcap_class] [varchar](100) NOT NULL,

	--/ <summary>Bitmask flag relating results of ASPCAP</summary>
	--/ <quantity>meta.code</quantity>
	[aspcapflag] [bigint] NOT NULL,

	--/ <summary>original fit temperature</summary>
	--/ <quantity>phys.temperature</quantity>
	--/ <unit>K</unit>
	[fparam_teff] [real] NOT NULL,

	--/ <summary>original fit log g from 6-parameter FERRE fit</summary>
	--/ <quantity>phys.gravity</quantity>
	--/ <unit>dex</unit>
	[fparam_logg] [real] NOT NULL,

	--/ <summary>log10 of the fit microturbulent velocity in km/s from 6-parameter FERRE fit</summary>
	--/ <quantity>phys.veloc.microTurb</quantity>
	[fparam_logvmicro] [real] NOT NULL,

	--/ <summary>original fit [M/H] from 6-parameter FERRE fit</summary>
	--/ <quantity>phys.abund.Z</quantity>
	--/ <unit>dex</unit>
	[fparam_m_h] [real] NOT NULL,

	--/ <summary>original fit [C/H] from 6-parameter FERRE fit</summary>
	--/ <quantity>phys.abund</quantity>
	--/ <unit>dex</unit>
	[fparam_c_m] [real] NOT NULL,

	--/ <summary>original fit [N/H] from 6-parameter FERRE fit</summary>
	--/ <quantity>phys.abund</quantity>
	--/ <unit>dex</unit>
	[fparam_n_m] [real] NOT NULL,

	--/ <summary>original fit [alpha/M] from 6-parameter FERRE fit</summary>
	--/ <quantity>phys.abund</quantity>
	--/ <unit>dex</unit>
	[fparam_alpha_m] [real] NOT NULL,

	--/ <summary>Empirically calibrated temperature from ASPCAP</summary>
	--/ <quantity>phys.temperature</quantity>
	--/ <unit>K</unit>
	[param_teff] [real] NOT NULL,

	--/ <summary>Empirically calibrated surface gravity from ASPCAP</summary>
	--/ <quantity>phys.gravity</quantity>
	--/ <unit>dex</unit>
	[param_logg] [real] NOT NULL,

	--/ <summary>log10 of the empirically calibrated microturbulent velocity in km/s from ASPCAP</summary>
	--/ <quantity>phys.veloc.microTurb</quantity>
	--/ <unit>dex</unit>
	[param_logvmicro] [real] NOT NULL,

	--/ <summary>PARAMFLAG microturbulent velocity</summary>
	--/ <quantity>meta.code;phys.veloc.microTurb</quantity>
	[param_logvmicro_flag] [int] NOT NULL,

	--/ <summary>empirically calibrated metal abundances [M/H] from ASPCAP</summary>
	--/ <quantity>phys.abund.Z</quantity>
	--/ <unit>dex</unit>
	[param_m_h] [real] NOT NULL,

	--/ <summary>external uncertainty for empirically calibrated metal abundances [M/H] from ASPCAP</summary>
	--/ <quantity>stat.error;phys.abund.Z</quantity>
	--/ <unit>dex</unit>
	[param_m_h_err] [real] NOT NULL,

	--/ <summary>PARAMFLAG for [M/H]</summary>
	--/ <quantity>meta.code;phys.abund.Fe</quantity>
	[param_m_h_flag] [int] NOT NULL,

	--/ <summary>empirically calibrated [C/M] from ASPCAP</summary>
	--/ <quantity>phys.abund</quantity>
	--/ <unit>dex</unit>
	[param_c_m] [real] NOT NULL,

	--/ <summary>PARAMFLAG for [C/M]</summary>
	--/ <quantity>phys.abund</quantity>
	[param_c_m_flag] [int] NOT NULL,

	--/ <summary>empirically calibrated [N/M] from ASPCAP</summary>
	--/ <quantity>phys.abund</quantity>
	--/ <unit>dex</unit>
	[param_n_m] [real] NOT NULL,

	--/ <summary>PARAMFLAG for [N/M]</summary>
	--/ <quantity>meta.code;phys.abund</quantity>
	[param_n_m_flag] [int] NOT NULL,

	--/ <summary>empirically calibrated [alpha/M] from ASPCAP</summary>
	--/ <quantity>phys.abund</quantity>
	--/ <unit>dex</unit>
	[param_alpha_m] [real] NOT NULL,

	--/ <summary>external uncertainty for empirically calibrated [alpha/M] from ASPCAP</summary>
	--/ <quantity>stat.error;phys.abund</quantity>
	--/ <unit>dex</unit>
	[param_alpha_m_err] [real] NOT NULL,

	--/ <summary>PARAMFLAG for [alpha/M]</summary>
	--/ <quantity>meta.code;phys.abund</quantity>
	[param_alpha_m_flag] [int] NOT NULL,

	--/ <summary>empirically calibrated [Al/H] from ASPCAP</summary>
	--/ <quantity>phys.abund</quantity>
	--/ <unit>dex</unit>
	[al_h] [real] NOT NULL,

	--/ <summary>external uncertainty for empirically calibrated [Al/H] from ASPCAP</summary>
	--/ <quantity>stat.error;phys.abund</quantity>
	--/ <unit>dex</unit>
	[al_h_err] [real] NOT NULL,

	--/ <summary>ELEMFLAG for Al</summary>
	--/ <quantity>meta.code;phys.abund</quantity>
	[al_h_flag] [int] NOT NULL,

	--/ <summary>empirically calibrated [C/H] from ASPCAP; [C/H] is calculated as (ASPCAP [C/M])+param_metals</summary>
	--/ <quantity>phys.abund</quantity>
	--/ <unit>dex</unit>
	[c_h] [real] NOT NULL,

	--/ <summary>external uncertainty for empirically calibrated [C/H] from ASPCAP</summary>
	--/ <quantity>meta.code;phys.abund</quantity>
	--/ <unit>dex</unit>
	[c_h_err] [real] NOT NULL,

	--/ <summary>ELEMFLAG for C</summary>
	--/ <quantity>meta.code;phys.abund</quantity>
	[c_h_flag] [int] NOT NULL,

	--/ <summary>empirically calibrated [Ca/H] from ASPCAP ; [Ca/H] is calculated as (ASPCAP [Ca/M])+param_metals</summary>
	--/ <quantity>phys.abund</quantity>
	--/ <unit>dex</unit>
	[ca_h] [real] NOT NULL,

	--/ <summary>external uncertainty for empirically calibrated [Ca/H] from ASPCAP</summary>
	--/ <quantity>stat.error;phys.abund</quantity>
	--/ <unit>dex</unit>
	[ca_h_err] [real] NOT NULL,

	--/ <summary>ELEMFLAG for Ca</summary>
	--/ <quantity>meta.code;phys.abund</quantity>
	[ca_h_flag] [int] NOT NULL,

	--/ <summary>empirically calibrated [Fe/H] from ASPCAP</summary>
	--/ <quantity>phys.abund.Fe</quantity>
	--/ <unit>dex</unit>
	[fe_h] [real] NOT NULL,

	--/ <summary>external uncertainty for empirically calibrated [Fe/H] from ASPCAP</summary>
	--/ <quantity>stat.error;phys.abund.Fe</quantity>
	--/ <unit>dex</unit>
	[fe_h_err] [real] NOT NULL,

	--/ <summary>ELEMFLAG for Fe</summary>
	--/ <quantity>meta.code;phys.abund.Fe</quantity>
	[fe_h_flag] [int] NOT NULL,

	--/ <summary>empirically calibrated [K/H] from ASPCAP</summary>
	--/ <quantity>phys.abund</quantity>
	--/ <unit>dex</unit>
	[k_h] [real] NOT NULL,

	--/ <summary>external uncertainty for empirically calibrated [K/H] from ASPCAP</summary>
	--/ <quantity>stat.error;phys.abund</quantity>
	--/ <unit>dex</unit>
	[k_h_err] [real] NOT NULL,

	--/ <summary>ELEMFLAG for K</summary>
	--/ <quantity>meta.code;phys.abund</quantity>
	[k_h_flag] [int] NOT NULL,

	--/ <summary>empirically calibrated [Mg/H] from ASPCAP; [Mg/H] is calculated as (ASPCAP [Mg/M])+param_metals</summary>
	--/ <quantity>phys.abund</quantity>
	--/ <unit>dex</unit>
	[mg_h] [real] NOT NULL,

	--/ <summary>external uncertainty for empirically calibrated [Mg/H] from ASPCAP</summary>
	--/ <quantity>stat.error;phys.abund</quantity>
	--/ <unit>dex</unit>
	[mg_h_err] [real] NOT NULL,

	--/ <summary>ELEMFLAG for Mg</summary>
	--/ <quantity>meta.code;phys.abund</quantity>
	[mg_h_flag] [int] NOT NULL,

	--/ <summary>empirically calibrated [Mn/H] from ASPCAP</summary>
	--/ <quantity>phys.abund</quantity>
	--/ <unit>dex</unit>
	[mn_h] [real] NOT NULL,

	--/ <summary>external uncertainty for empirically calibrated [Mn/H] from ASPCAP</summary>
	--/ <quantity>stat.error;phys.abund</quantity>
	--/ <unit>dex</unit>
	[mn_h_err] [real] NOT NULL,

	--/ <summary>ELEMFLAG for Mn</summary>
	--/ <quantity>meta.code;phys.abund</quantity>
	[mn_h_flag] [int] NOT NULL,

	--/ <summary>empirically calibrated [Na/H] from ASPCAP</summary>
	--/ <quantity>phys.abund</quantity>
	--/ <unit>dex</unit>
	[na_h] [real] NOT NULL,

	--/ <summary>external uncertainty for empirically calibrated [Na/H] from ASPCAP</summary>
	--/ <quantity>stat.error;phys.abund</quantity>
	--/ <unit>dex</unit>
	[na_h_err] [real] NOT NULL,

	--/ <summary>ELEMFLAG for Na</summary>
	--/ <quantity>meta.code;phys.abund</quantity>
	[na_h_flag] [int] NOT NULL,

	--/ <summary>empirically calibrated [Ni/H] from ASPCAP</summary>
	--/ <quantity>phys.abund</quantity>
	--/ <unit>dex</unit>
	[ni_h] [real] NOT NULL,

	--/ <summary>external uncertainty for empirically calibrated [Ni/H] from ASPCAP</summary>
	--/ <quantity>stat.error;phys.abund</quantity>
	--/ <unit>dex</unit>
	[ni_h_err] [real] NOT NULL,

	--/ <summary>ELEMFLAG for Ni</summary>
	--/ <quantity>meta.code;phys.abund</quantity>
	[ni_h_flag] [int] NOT NULL,

	--/ <summary>empirically calibrated [N/H] from ASPCAP; [N/H] is calculated as (ASPCAP [N/M])+param_metals</summary>
	--/ <quantity>phys.abund</quantity>
	--/ <unit>dex</unit>
	[n_h] [real] NOT NULL,

	--/ <summary>external uncertainty for empirically calibrated [N/H] from ASPCAP</summary>
	--/ <quantity>stat.error;phys.abund</quantity>
	--/ <unit>dex</unit>
	[n_h_err] [real] NOT NULL,

	--/ <summary>ELEMFLAG for N</summary>
	--/ <quantity>meta.code;phys.abund</quantity>
	[n_h_flag] [int] NOT NULL,

	--/ <summary>empirically calibrated [O/H] from ASPCAP; [O/H] is calculated as (ASPCAP [O/M])+param_metals</summary>
	--/ <quantity>phys.abund</quantity>
	--/ <unit>dex</unit>
	[o_h] [real] NOT NULL,

	--/ <summary>external uncertainty for empirically calibrated [O/H] from ASPCAP</summary>
	--/ <quantity>stat.error;phys.abund</quantity>
	--/ <unit>dex</unit>
	[o_h_err] [real] NOT NULL,

	--/ <summary>ELEMFLAG for O</summary>
	--/ <quantity>meta.code;phys.abund</quantity>
	[o_h_flag] [int] NOT NULL,

	--/ <summary>empirically calibrated [Si/H] from ASPCAP; [Si/H] is calculated as (ASPCAP [Si/M])+param_metals</summary>
	--/ <quantity>phys.abund</quantity>
	--/ <unit>dex</unit>
	[si_h] [real] NOT NULL,

	--/ <summary>external uncertainty for empirically calibrated [Si/H] from ASPCAP</summary>
	--/ <quantity>stat.error;phys.abund</quantity>
	--/ <unit>dex</unit>
	[si_h_err] [real] NOT NULL,

	--/ <summary>ELEMFLAG for Si</summary>
	--/ <quantity>meta.code;phys.abund</quantity>
	[si_h_flag] [int] NOT NULL,

	--/ <summary>empirically calibrated [S/H] from ASPCAP; [S/H] is calculated as (ASPCAP [S/M])+param_metals</summary>
	--/ <quantity>phys.abund</quantity>
	--/ <unit>dex</unit>
	[s_h] [real] NOT NULL,

	--/ <summary>external uncertainty for empirically calibrated [S/H] from ASPCAP</summary>
	--/ <quantity>stat.error;phys.abund</quantity>
	--/ <unit>dex</unit>
	[s_h_err] [real] NOT NULL,

	--/ <summary>ELEMFLAG for S</summary>
	--/ <quantity>meta.code;phys.abund</quantity>
	[s_h_flag] [int] NOT NULL,

	--/ <summary>empirically calibrated [Ti/H] from ASPCAP; [Ti/H] is calculated as (ASPCAP [Ti/M])+param_metals</summary>
	--/ <quantity>phys.abund</quantity>
	--/ <unit>dex</unit>
	[ti_h] [real] NOT NULL,

	--/ <summary>external uncertainty for empirically calibrated [Ti/H] from ASPCAP</summary>
	--/ <quantity>stat.error;phys.abund</quantity>
	--/ <unit>dex</unit>
	[ti_h_err] [real] NOT NULL,

	--/ <summary>ELEMFLAG for Ti</summary>
	--/ <quantity>meta.code;phys.abund</quantity>
	[ti_h_flag] [int] NOT NULL,

	--/ <summary>empirically calibrated [V/H] from ASPCAP</summary>
	--/ <quantity>phys.abund</quantity>
	--/ <unit>dex</unit>
	[v_h] [real] NOT NULL,

	--/ <summary>external uncertainty for empirically calibrated [V/H] from ASPCAP</summary>
	--/ <quantity>stat.error;phys.abund</quantity>
	--/ <unit>dex</unit>
	[v_h_err] [real] NOT NULL,

	--/ <summary>ELEMFLAG for V</summary>
	--/ <quantity>meta.code;phys.abund</quantity>
	[v_h_flag] [int] NOT NULL,

	--/ <summary>original fit [Al/H]</summary>
	--/ <quantity>phys.abund</quantity>
	--/ <unit>dex</unit>
	[felem_al_h] [real] NOT NULL,

	--/ <summary>original fit uncertainty [Al/H]</summary>
	--/ <quantity>stat.error;phys.abund</quantity>
	--/ <unit>dex</unit>
	[felem_al_h_err] [real] NOT NULL,

	--/ <summary>original fit [C/M]</summary>
	--/ <quantity>phys.abund</quantity>
	--/ <unit>dex</unit>
	[felem_c_m] [real] NOT NULL,

	--/ <summary>original fit uncertainty [C/M]</summary>
	--/ <quantity>stat.error;phys.abund</quantity>
	--/ <unit>dex</unit>
	[felem_c_m_err] [real] NOT NULL,

	--/ <summary>original fit [Ca/M]</summary>
	--/ <quantity>phys.abund</quantity>
	--/ <unit>dex</unit>
	[felem_ca_m] [real] NOT NULL,

	--/ <summary>original fit uncertainty [Ca/M]</summary>
	--/ <quantity>stat.error;phys.abund</quantity>
	--/ <unit>dex</unit>
	[felem_ca_m_err] [real] NOT NULL,

	--/ <summary>original fit [Fe/H]</summary>
	--/ <quantity>phys.abund.Fe</quantity>
	--/ <unit>dex</unit>
	[felem_fe_h] [real] NOT NULL,

	--/ <summary>original fit uncertainty [Fe/H]</summary>
	--/ <quantity>stat.error;phys.abund.Fe</quantity>
	--/ <unit>dex</unit>
	[felem_fe_h_err] [real] NOT NULL,

	--/ <summary>original fit [K/H]</summary>
	--/ <quantity>phys.abund</quantity>
	[felem_k_h] [real] NOT NULL,

	--/ <summary>original fit uncertainty [K/H]</summary>
	--/ <quantity>stat.error;phys.abund</quantity>
	--/ <unit>dex</unit>
	[felem_k_h_err] [real] NOT NULL,

	--/ <summary>original fit [Mg/M]</summary>
	--/ <quantity>phys.abund</quantity>
	--/ <unit>dex</unit>
	[felem_mg_m] [real] NOT NULL,

	--/ <summary>original fit uncertainty [Mg/M]</summary>
	--/ <quantity>stat.error;phys.abund</quantity>
	--/ <unit>dex</unit>
	[felem_mg_m_err] [real] NOT NULL,

	--/ <summary>original fit [Mn/H]</summary>
	--/ <quantity>phys.abund</quantity>
	--/ <unit>dex</unit>
	[felem_mn_h] [real] NOT NULL,

	--/ <summary>original fit uncertainty [Mn/H]</summary>
	--/ <quantity>stat.error;phys.abund</quantity>
	--/ <unit>dex</unit>
	[felem_mn_h_err] [real] NOT NULL,

	--/ <summary>original fit [Na/H]</summary>
	--/ <quantity>phys.abund</quantity>
	--/ <unit>dex</unit>
	[felem_na_h] [real] NOT NULL,

	--/ <summary>original fit uncertainty [Na/H]</summary>
	--/ <quantity>stat.error;phys.abund</quantity>
	--/ <unit>dex</unit>
	[felem_na_h_err] [real] NOT NULL,

	--/ <summary>original fit [Ni/H]</summary>
	--/ <quantity>phys.abund</quantity>
	--/ <unit>dex</unit>
	[felem_ni_h] [real] NOT NULL,

	--/ <summary>original fit uncertainty [Ni/H]</summary>
	--/ <quantity>stat.error;phys.abund</quantity>
	--/ <unit>dex</unit>
	[felem_ni_h_err] [real] NOT NULL,

	--/ <summary>original fit [N/M]</summary>
	--/ <quantity>phys.abund</quantity>
	--/ <unit>dex</unit>
	[felem_n_m] [real] NOT NULL,

	--/ <summary>original fit uncertainty [N/M]</summary>
	--/ <quantity>stat.error;phys.abund</quantity>
	--/ <unit>dex</unit>
	[felem_n_m_err] [real] NOT NULL,

	--/ <summary>original fit [O/M]</summary>
	--/ <quantity>phys.abund</quantity>
	--/ <unit>dex</unit>
	[felem_o_m] [real] NOT NULL,

	--/ <summary>original fit uncertainty [O/M]</summary>
	--/ <quantity>stat.error;phys.abund</quantity>
	--/ <unit>dex</unit>
	[felem_o_m_err] [real] NOT NULL,

	--/ <summary>original fit [Si/M]</summary>
	--/ <quantity>phys.abund</quantity>
	--/ <unit>dex</unit>
	[felem_si_m] [real] NOT NULL,

	--/ <summary>original fit uncertainty [Si/M]</summary>
	--/ <quantity>stat.error;phys.abund</quantity>
	--/ <unit>dex</unit>
	[felem_si_m_err] [real] NOT NULL,

	--/ <summary>original fit [S/M]</summary>
	--/ <quantity>phys.abund</quantity>
	--/ <unit>dex</unit>
	[felem_s_m] [real] NOT NULL,

	--/ <summary>original fit uncertainty [S/M]</summary>
	--/ <quantity>stat.error;phys.abund</quantity>
	--/ <unit>dex</unit>
	[felem_s_m_err] [real] NOT NULL,

	--/ <summary>original fit [Ti/M]</summary>
	--/ <quantity>phys.abund</quantity>
	--/ <unit>dex</unit>
	[felem_ti_m] [real] NOT NULL,

	--/ <summary>original fit uncertainty [Ti/M]</summary>
	--/ <quantity>stat.error;phys.abund</quantity>
	--/ <unit>dex</unit>
	[felem_ti_m_err] [real] NOT NULL,

	--/ <summary>original fit [V/H]</summary>
	--/ <quantity>phys.abund</quantity>
	--/ <unit>dex</unit>
	[felem_v_h] [real] NOT NULL,

	--/ <summary>original fit uncertainty [V/H]</summary>
	--/ <quantity>stat.error;phys.abund</quantity>
	--/ <unit>dex</unit>
	[felem_v_h_err] [real] NOT NULL,
 CONSTRAINT [pk_aspcapStar_aspcap_id] PRIMARY KEY CLUSTERED 
(
	[aspcap_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[aspcapStarCovar]    Script Date: 4/1/2015 5:51:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

--/ <summary> Contains the covariance information for an APOGEE star ASPCAP entry. </summary>
--/ <remarks> This table contains selected covariance matrix fields for the ASPCAP   entry for an APOGEE star.  </remarks>
CREATE TABLE [dbo].[aspcapStarCovar](

	--/ <summary>Unique ID for this covariance matrix element of form apogee.[telescope].[cs].results_version.location_id.star.param_1.param_2 (Primary key)</summary>
	--/ <quantity>meta.id</quantity>
	[aspcap_covar_id] [varchar](64) NOT NULL,

	--/ <summary>Unique ID for ASPCAP results of form apogee.[telescope].[cs].results_version.location_id.star</summary>
	--/ <quantity>meta.id</quantity>
	[aspcap_id] [varchar](64) NOT NULL,

	--/ <summary>Parameter #1 in covariance (0..6, corresponding to Teff, log(g), log(vmicro), [M/H], [C/M], [N/M], [alpha/M])</summary>
	--/ <quantity>stat.param</quantity>
	[param_1] [tinyint] NOT NULL,

	--/ <summary>Parameter #2 in covariance (0..6, corresponding to Teff, log(g), log(vmicro), [M/H], [C/M], [N/M], [alpha/M])</summary>
	--/ <quantity>stat.param</quantity>
	[param_2] [tinyint] NOT NULL,

	--/ <summary>Covariance between two parameters for this star (external estimate)</summary>
	--/ <quantity>stat.covar</quantity>
	[covar] [real] NOT NULL,

	--/ <summary>Covariance between two parameters for this star (internal estimate for original fit values)</summary>
	--/ <quantity>stat.covar</quantity>
	[fit_covar] [real] NOT NULL,
 CONSTRAINT [pk_aspcapStarCovar_aspcap_covar_] PRIMARY KEY CLUSTERED 
(
	[aspcap_covar_id] ASC,
	[aspcap_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[DataConstants]    Script Date: 4/1/2015 5:51:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

--/ <summary> The table stores the values of various enumerated and bitmask columns. </summary>
--/ <remarks></remarks>
CREATE TABLE [dbo].[DataConstants](

	--/ <summary>Field Name</summary>
	--/ <quantity>meta.id;obs.field</quantity>
	[field] [varchar](128) NOT NULL,

	--/ <summary>Constant Name</summary>
	--/ <quantity>meta.id</quantity>
	[name] [varchar](128) NOT NULL,

	--/ <summary>Type value</summary>
	--/ <quantity>meta.code</quantity>
	[value] [binary](8) NOT NULL,

	--/ <summary>Short description</summary>
	--/ <quantity>meta.note</quantity>
	[description] [varchar](2000) NOT NULL,
 CONSTRAINT [pk_DataConstants_field_name] PRIMARY KEY CLUSTERED 
(
	[field] ASC,
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[detectionIndex]    Script Date: 4/1/2015 5:51:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--/ <summary> Full list of all detections, with associated 'thing' assignment. </summary>
--/ <remarks> Each row in this table corresponds to a single catalog entry,  or 'detection' in the SDSS imaging. For each one, this table  lists a 'thingId', which is common among all detections of   the same object in the catalog. </remarks>
CREATE TABLE [dbo].[detectionIndex](

	--/ <summary>thing ID number</summary>
	--/ <quantity>meta.id</quantity>
	[thingId] [bigint] NOT NULL,

	--/ <summary>object ID number (from run, camcol, field, id, rerun)</summary>
	--/ <quantity>meta.id</quantity>
	[objId] [bigint] NOT NULL,

	--/ <summary>1 if object is primary, 0 if not</summary>
	--/ <quantity>meta.code</quantity>
	[isPrimary] [tinyint] NOT NULL,

	--/ <summary>Load Version</summary>
	--/ <quantity>meta.version</quantity>
	[loadVersion] [int] NOT NULL,
 CONSTRAINT [pk_detectionIndex_thingId_objID] PRIMARY KEY CLUSTERED 
(
	[thingId] ASC,
	[objId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[emissionLinesPort]    Script Date: 4/1/2015 5:51:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

--/ <summary> Emission line kinematics results for SDSS and BOSS galaxies using GANDALF </summary>
--/ <remarks> We fit galaxies using an adaptation of the publicly available Gas AND Absorption  Line Fitting (GANDALF, &lt;a href='http://adsabs.harvard.edu/abs/2006MNRAS.366.1151S'>Sarzi et al. 2006&lt;/a>)  and penalised PiXel Fitting (pPXF, &lt;a href='http://adsabs.harvard.edu/abs/2004PASP..116..138C'>Cappellari &amp; Emsellem 2004&lt;/a>).  Stellar population models for the continuum are from of &lt;a href='http://adsabs.harvard.edu/abs/2011MNRAS.418.2785M'>Maraston &amp; Str&#246;mb&#228;ck (2011)&lt;/a> and  &lt;a href='http://adsabs.harvard.edu/abs/2011MNRAS.412.2183T'>Thomas, Maraston &amp; Johansson (2011)&lt;/a>. </remarks>
CREATE TABLE [dbo].[emissionLinesPort](

	--/ <summary>Unique ID</summary>
	--/ <quantity>meta.id</quantity>
	[specObjID] [bigint] NOT NULL,

	--/ <summary>Plate number</summary>
	--/ <quantity>meta.id;instr.det</quantity>
	[plate] [smallint] NOT NULL,

	--/ <summary>Fiber ID</summary>
	--/ <quantity>meta.id;instr.param</quantity>
	[fiberID] [smallint] NOT NULL,

	--/ <summary>MJD of observation</summary>
	--/ <quantity>time.epoch;obs</quantity>
	--/ <unit>d</unit>
	[mjd] [int] NOT NULL,

	--/ <summary>Right ascension of fiber, J2000</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[ra] [float] NOT NULL,

	--/ <summary>Declination of fiber, J2000</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[dec] [float] NOT NULL,

	--/ <summary>Redshift used (corresponds to z_noqso in specObjAll)</summary>
	--/ <quantity>src.redshift</quantity>
	[z] [real] NOT NULL,

	--/ <summary>Error in z (corresponds to zErr_noqso in specObjAll)</summary>
	--/ <quantity>stat.error;src.redshift</quantity>
	[zErr] [real] NOT NULL,

	--/ <summary>Index of chi^2 minimum corresponding to z_noqso</summary>
	--/ <quantity>meta.code;stat.fit.chi2</quantity>
	[zNum] [int] NOT NULL,

	--/ <summary>stellar velocity</summary>
	--/ <quantity>phys.veloc</quantity>
	--/ <unit>km s-1</unit>
	[velStars] [real] NOT NULL,

	--/ <summary>GANDALF-corrected redshift</summary>
	--/ <quantity>src.redshift</quantity>
	[redshift] [real] NOT NULL,

	--/ <summary>Stellar velocity dispersion</summary>
	--/ <quantity>phys.veloc.dispersion</quantity>
	--/ <unit>km s-1</unit>
	[sigmaStars] [real] NOT NULL,

	--/ <summary>Error on measurement of stellar velocity dispersion</summary>
	--/ <quantity>stat.error;phys.veloc.dispersion</quantity>
	--/ <unit>km s-1</unit>
	[sigmaStarsErr] [real] NOT NULL,

	--/ <summary>chi-squared of best-fit template</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[chisq] [real] NOT NULL,

	--/ <summary>Classification from Kauffmann et al. (2003), Kewley et al. (2001) and Schawinski et al. (2007) for objects with the emission lines H&amp;beta;, [OIII], H&amp;alpha;, [NII] [available] with A/N &gt; 1.5. Possible values: "BLANK" (if emission lines not available), "Star Forming", "Seyfert", "LINER", "Seyfert/LINER", "Composite"</summary>
	--/ <quantity>src.class</quantity>
	[bpt] [varchar](32) NOT NULL,

	--/ <summary>E(B-V) for internal reddening estimated from emission lines</summary>
	--/ <quantity>phot.color.excess</quantity>
	--/ <unit>mag</unit>
	[ebmv] [real] NOT NULL,

	--/ <summary>Error in E(B-V)for internal reddening estimated from emission lines</summary>
	--/ <quantity>stat.error;phot.color.excess</quantity>
	--/ <unit>mag</unit>
	[ebmv_err] [real] NOT NULL,

	--/ <summary>Set to 1 if error calculation failed (errors all set to zero in that case); otherwise, set to 0</summary>
	--/ <quantity>meta.code.error</quantity>
	[Error_Warning] [tinyint] NOT NULL,

	--/ <summary>Velocity of emission line HeII 3203</summary>
	--/ <quantity>phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_HeII_3203] [real] NOT NULL,

	--/ <summary>Error in velocity of emission line HeII 3203</summary>
	--/ <quantity>stat.error;phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_HeII_3203_Err] [real] NOT NULL,

	--/ <summary>Velocity dispersion of emission line HeII 3203</summary>
	--/ <quantity>phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_HeII_3203] [real] NOT NULL,

	--/ <summary>Error in velocity dispersion of emission line HeII 3203</summary>
	--/ <quantity>stat.error;phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_HeII_3203_Err] [real] NOT NULL,

	--/ <summary>Amplitude of emission line HeII 3203</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_HeII_3203] [real] NOT NULL,

	--/ <summary>Error in amplitude of emission line HeII 3203</summary>
	--/ <quantity>stat.error;spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_HeII_3203_Err] [real] NOT NULL,

	--/ <summary>Flux of emission line HeII 3203</summary>
	--/ <quantity>phot.flux;phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_HeII_3203] [real] NOT NULL,

	--/ <summary>Error in flux of emission line HeII 3203</summary>
	--/ <quantity>stat.error;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_HeII_3203_Err] [real] NOT NULL,

	--/ <summary>Equivalent width of emission line HeII 3203</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_HeII_3203] [real] NOT NULL,

	--/ <summary>Error in equivalent width of emission line HeII 3203</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_HeII_3203_Err] [real] NOT NULL,

	--/ <summary>Continuum flux at wavelength of emission line HeII 3203</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_HeII_3203] [real] NOT NULL,

	--/ <summary>Error in continuum flux at wavelength of emission line HeII 3203</summary>
	--/ <quantity>stat.error;phot.flux</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_HeII_3203_Err] [real] NOT NULL,

	--/ <summary>Set to 1 if the emission line falls on a sky line (5577, 6300 or 6363), measurements set to zero in this case; otherwise, this flag is set to 0</summary>
	--/ <quantity>meta.code</quantity>
	[Fit_Warning_HeII_3203] [tinyint] NOT NULL,

	--/ <summary>Amplitude-over-noise of emission line HeII 3203</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>km s-1</unit>
	[AoN_HeII_3203] [real] NOT NULL,

	--/ <summary>Velocity of emission line [NeV] 3345</summary>
	--/ <quantity>phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_NeV_3345] [real] NOT NULL,

	--/ <summary>Error in velocity of emission line [NeV] 3345</summary>
	--/ <quantity>stat.error;phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_NeV_3345_Err] [real] NOT NULL,

	--/ <summary>Velocity dispersion of emission line [NeV] 3345</summary>
	--/ <quantity>phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_NeV_3345] [real] NOT NULL,

	--/ <summary>Error in velocity dispersion of emission line [NeV] 3345</summary>
	--/ <quantity>stat.error;phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_NeV_3345_Err] [real] NOT NULL,

	--/ <summary>Amplitude of emission line [NeV] 3345</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_NeV_3345] [real] NOT NULL,

	--/ <summary>Error in amplitude of emission line [NeV] 3345</summary>
	--/ <quantity>stat.error;spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_NeV_3345_Err] [real] NOT NULL,

	--/ <summary>Flux of emission line [NeV] 3345</summary>
	--/ <quantity>phot.flux;phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_NeV_3345] [real] NOT NULL,

	--/ <summary>Error in flux of emission line [NeV] 3345</summary>
	--/ <quantity>stat.error;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_NeV_3345_Err] [real] NOT NULL,

	--/ <summary>Equivalent width of emission line [NeV] 3345</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_NeV_3345] [real] NOT NULL,

	--/ <summary>Error in equivalent width of emission line [NeV] 3345</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_NeV_3345_Err] [real] NOT NULL,

	--/ <summary>Continuum flux at wavelength of emission line [NeV] 3345</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_NeV_3345] [real] NOT NULL,

	--/ <summary>Error in continuum flux at wavelength of emission line [NeV] 3345</summary>
	--/ <quantity>stat.error;phot.flux</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_NeV_3345_Err] [real] NOT NULL,

	--/ <summary>Set to 1 if the emission line falls on a sky line (5577, 6300 or 6363), measurements set to zero in this case; otherwise, this flag is set to 0</summary>
	--/ <quantity>meta.code</quantity>
	[Fit_Warning_NeV_3345] [tinyint] NOT NULL,

	--/ <summary>Amplitude-over-noise of emission line [NeV] 3345</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>km s-1</unit>
	[AoN_NeV_3345] [real] NOT NULL,

	--/ <summary>Velocity of emission line [NeV] 3425</summary>
	--/ <quantity>phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_NeV_3425] [real] NOT NULL,

	--/ <summary>Error in velocity of emission line [NeV] 3425</summary>
	--/ <quantity>stat.error;phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_NeV_3425_Err] [real] NOT NULL,

	--/ <summary>Velocity dispersion of emission line [NeV] 3425</summary>
	--/ <quantity>phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_NeV_3425] [real] NOT NULL,

	--/ <summary>Error in velocity dispersion of emission line [NeV] 3425</summary>
	--/ <quantity>stat.error;phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_NeV_3425_Err] [real] NOT NULL,

	--/ <summary>Amplitude of emission line [NeV] 3425</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_NeV_3425] [real] NOT NULL,

	--/ <summary>Error in amplitude of emission line [NeV] 3425</summary>
	--/ <quantity>stat.error;spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_NeV_3425_Err] [real] NOT NULL,

	--/ <summary>Flux of emission line [NeV] 3425</summary>
	--/ <quantity>phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_NeV_3425] [real] NOT NULL,

	--/ <summary>Error in flux of emission line [NeV] 3425</summary>
	--/ <quantity>stat.error;phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_NeV_3425_Err] [real] NOT NULL,

	--/ <summary>Equivalent width of emission line [NeV] 3425</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_NeV_3425] [real] NOT NULL,

	--/ <summary>Error in equivalent width of emission line [NeV] 3425</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_NeV_3425_Err] [real] NOT NULL,

	--/ <summary>Continuum flux at wavelength of emission line [NeV] 3425</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_NeV_3425] [real] NOT NULL,

	--/ <summary>Error in continuum flux at wavelength of emission line [NeV] 3425</summary>
	--/ <quantity>stat.error;phot.flux</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_NeV_3425_Err] [real] NOT NULL,

	--/ <summary>Set to 1 if the emission line falls on a sky line (5577, 6300 or 6363), measurements set to zero in this case; otherwise, this flag is set to 0</summary>
	--/ <quantity>meta.code</quantity>
	[Fit_Warning_NeV_3425] [tinyint] NOT NULL,

	--/ <summary>Amplitude-over-noise of emission line [NeV] 3425</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>km s-1</unit>
	[AoN_NeV_3425] [real] NOT NULL,

	--/ <summary>Velocity of emission line [OII] 3726</summary>
	--/ <quantity>phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_OII_3726] [real] NOT NULL,

	--/ <summary>Error in velocity of emission line [OII] 3726</summary>
	--/ <quantity>stat.error;phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_OII_3726_Err] [real] NOT NULL,

	--/ <summary>Velocity dispersion of emission line [OII] 3726</summary>
	--/ <quantity>phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_OII_3726] [real] NOT NULL,

	--/ <summary>Error in velocity dispersion of emission line [OII] 3726</summary>
	--/ <quantity>stat.error;phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_OII_3726_Err] [real] NOT NULL,

	--/ <summary>Amplitude of emission line [OII] 3726</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_OII_3726] [real] NOT NULL,

	--/ <summary>Error in amplitude of emission line [OII] 3726</summary>
	--/ <quantity>stat.error;spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_OII_3726_Err] [real] NOT NULL,

	--/ <summary>Flux of emission line [OII] 3726</summary>
	--/ <quantity>phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_OII_3726] [real] NOT NULL,

	--/ <summary>Error in flux of emission line [OII] 3726</summary>
	--/ <quantity>stat.error;phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_OII_3726_Err] [real] NOT NULL,

	--/ <summary>Equivalent width of emission line [OII] 3726</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_OII_3726] [real] NOT NULL,

	--/ <summary>Error in equivalent width of emission line [OII] 3726</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_OII_3726_Err] [real] NOT NULL,

	--/ <summary>Continuum flux at wavelength of emission line [OII] 3726</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_OII_3726] [real] NOT NULL,

	--/ <summary>Error in continuum flux at wavelength of emission line [OII] 3726</summary>
	--/ <quantity>stat.error;phot.flux</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_OII_3726_Err] [real] NOT NULL,

	--/ <summary>Set to 1 if the emission line falls on a sky line (5577, 6300 or 6363), measurements set to zero in this case; otherwise, this flag is set to 0</summary>
	--/ <quantity>meta.code</quantity>
	[Fit_Warning_OII_3726] [tinyint] NOT NULL,

	--/ <summary>Amplitude-over-noise of emission line [OII] 3726</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>km s-1</unit>
	[AoN_OII_3726] [real] NOT NULL,

	--/ <summary>Velocity of emission line [OII] 3728</summary>
	--/ <quantity>phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_OII_3728] [real] NOT NULL,

	--/ <summary>Error in velocity of emission line [OII] 3728</summary>
	--/ <quantity>stat.error;phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_OII_3728_Err] [real] NOT NULL,

	--/ <summary>Velocity dispersion of emission line [OII] 3728</summary>
	--/ <quantity>phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_OII_3728] [real] NOT NULL,

	--/ <summary>Error in velocity dispersion of emission line [OII] 3728</summary>
	--/ <quantity>stat.error;phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_OII_3728_Err] [real] NOT NULL,

	--/ <summary>Amplitude of emission line [OII] 3728</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_OII_3728] [real] NOT NULL,

	--/ <summary>Error in amplitude of emission line [OII] 3728</summary>
	--/ <quantity>stat.error;spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_OII_3728_Err] [real] NOT NULL,

	--/ <summary>Flux of emission line [OII] 3728</summary>
	--/ <quantity>phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_OII_3728] [real] NOT NULL,

	--/ <summary>Error in flux of emission line [OII] 3728</summary>
	--/ <quantity>stat.error;phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_OII_3728_Err] [real] NOT NULL,

	--/ <summary>Equivalent width of emission line [OII] 3728</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_OII_3728] [real] NOT NULL,

	--/ <summary>Error in equivalent width of emission line [OII] 3728</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_OII_3728_Err] [real] NOT NULL,

	--/ <summary>Continuum flux at wavelength of emission line [OII] 3728</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_OII_3728] [real] NOT NULL,

	--/ <summary>Error in continuum flux at wavelength of emission line [OII] 3728</summary>
	--/ <quantity>stat.error;phot.flux</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_OII_3728_Err] [real] NOT NULL,

	--/ <summary>Set to 1 if the emission line falls on a sky line (5577, 6300 or 6363), measurements set to zero in this case; otherwise, this flag is set to 0</summary>
	--/ <quantity>meta.code</quantity>
	[Fit_Warning_OII_3728] [tinyint] NOT NULL,

	--/ <summary>Amplitude-over-noise of emission line [OII] 3728</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>km s-1</unit>
	[AoN_OII_3728] [real] NOT NULL,

	--/ <summary>Velocity of emission line [NeIII] 3868</summary>
	--/ <quantity>phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_NeIII_3868] [real] NOT NULL,

	--/ <summary>Error in velocity of emission line [NeIII] 3868</summary>
	--/ <quantity>stat.error;phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_NeIII_3868_Err] [real] NOT NULL,

	--/ <summary>Velocity dispersion of emission line [NeIII] 3868</summary>
	--/ <quantity>phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_NeIII_3868] [real] NOT NULL,

	--/ <summary>Error in velocity dispersion of emission line [NeIII] 3868</summary>
	--/ <quantity>stat.error;phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_NeIII_3868_Err] [real] NOT NULL,

	--/ <summary>Amplitude of emission line [NeIII] 3868</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_NeIII_3868] [real] NOT NULL,

	--/ <summary>Error in amplitude of emission line [NeIII] 3868</summary>
	--/ <quantity>stat.error;spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_NeIII_3868_Err] [real] NOT NULL,

	--/ <summary>Flux of emission line [NeIII] 3868</summary>
	--/ <quantity>phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_NeIII_3868] [real] NOT NULL,

	--/ <summary>Error in flux of emission line [NeIII] 3868</summary>
	--/ <quantity>stat.error;phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_NeIII_3868_Err] [real] NOT NULL,

	--/ <summary>Equivalent width of emission line [NeIII] 3868</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_NeIII_3868] [real] NOT NULL,

	--/ <summary>Error in equivalent width of emission line [NeIII] 3868</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_NeIII_3868_Err] [real] NOT NULL,

	--/ <summary>Continuum flux at wavelength of emission line [NeIII] 3868</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_NeIII_3868] [real] NOT NULL,

	--/ <summary>Error in continuum flux at wavelength of emission line [NeIII] 3868</summary>
	--/ <quantity>stat.error;phot.flux</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_NeIII_3868_Err] [real] NOT NULL,

	--/ <summary>Set to 1 if the emission line falls on a sky line (5577, 6300 or 6363), measurements set to zero in this case; otherwise, this flag is set to 0</summary>
	--/ <quantity>meta.code</quantity>
	[Fit_Warning_NeIII_3868] [tinyint] NOT NULL,

	--/ <summary>Amplitude-over-noise of emission line [NeIII] 3868</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>km s-1</unit>
	[AoN_NeIII_3868] [real] NOT NULL,

	--/ <summary>Velocity of emission line [NeIII] 3967</summary>
	--/ <quantity>phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_NeIII_3967] [real] NOT NULL,

	--/ <summary>Error in velocity of emission line [NeIII] 3967</summary>
	--/ <quantity>stat.error;phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_NeIII_3967_Err] [real] NOT NULL,

	--/ <summary>Velocity dispersion of emission line [NeIII] 3967</summary>
	--/ <quantity>phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_NeIII_3967] [real] NOT NULL,

	--/ <summary>Error in velocity dispersion of emission line [NeIII] 3967</summary>
	--/ <quantity>stat.error;phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_NeIII_3967_Err] [real] NOT NULL,

	--/ <summary>Amplitude of emission line [NeIII] 3967</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_NeIII_3967] [real] NOT NULL,

	--/ <summary>Error in amplitude of emission line [NeIII] 3967</summary>
	--/ <quantity>stat.error;spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_NeIII_3967_Err] [real] NOT NULL,

	--/ <summary>Flux of emission line [NeIII] 3967</summary>
	--/ <quantity>phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_NeIII_3967] [real] NOT NULL,

	--/ <summary>Error in flux of emission line [NeIII] 3967</summary>
	--/ <quantity>stat.error;phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_NeIII_3967_Err] [real] NOT NULL,

	--/ <summary>Equivalent width of emission line [NeIII] 3967</summary>
	--/ <quantity>pect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_NeIII_3967] [real] NOT NULL,

	--/ <summary>Error in equivalent width of emission line [NeIII] 3967</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_NeIII_3967_Err] [real] NOT NULL,

	--/ <summary>Continuum flux at wavelength of emission line [NeIII] 3967</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_NeIII_3967] [real] NOT NULL,

	--/ <summary>Error in continuum flux at wavelength of emission line [NeIII] 3967</summary>
	--/ <quantity>stat.error;phot.flux</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_NeIII_3967_Err] [real] NOT NULL,

	--/ <summary>Set to 1 if the emission line falls on a sky line (5577, 6300 or 6363), measurements set to zero in this case; otherwise, this flag is set to 0</summary>
	--/ <quantity>meta.code</quantity>
	[Fit_Warning_NeIII_3967] [tinyint] NOT NULL,

	--/ <summary>Amplitude-over-noise of emission line [NeIII] 3967</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>km s-1</unit>
	[AoN_NeIII_3967] [real] NOT NULL,

	--/ <summary>Velocity of emission line H5 3889</summary>
	--/ <quantity>phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_H5_3889] [real] NOT NULL,

	--/ <summary>Error in velocity of emission line H5 3889</summary>
	--/ <quantity>stat.error;phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_H5_3889_Err] [real] NOT NULL,

	--/ <summary>Velocity dispersion of emission line H5 3889</summary>
	--/ <quantity>phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_H5_3889] [real] NOT NULL,

	--/ <summary>Error in velocity dispersion of emission line H5 3889</summary>
	--/ <quantity>stat.error;phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_H5_3889_Err] [real] NOT NULL,

	--/ <summary>Amplitude of emission line H5 3889</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_H5_3889] [real] NOT NULL,

	--/ <summary>Error in amplitude of emission line H5 3889</summary>
	--/ <quantity>stat.error;spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_H5_3889_Err] [real] NOT NULL,

	--/ <summary>Flux of emission line H5 3889</summary>
	--/ <quantity>phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_H5_3889] [real] NOT NULL,

	--/ <summary>Error in flux of emission line H5 3889</summary>
	--/ <quantity>stat.error;phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_H5_3889_Err] [real] NOT NULL,

	--/ <summary>Equivalent width of emission line H5 3889</summary>
	--/ <quantity>pect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_H5_3889] [real] NOT NULL,

	--/ <summary>Error in equivalent width of emission line H5 3889</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_H5_3889_Err] [real] NOT NULL,

	--/ <summary>Continuum flux at wavelength of emission line H5 3889</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_H5_3889] [real] NOT NULL,

	--/ <summary>Error in continuum flux at wavelength of emission line H5 3889</summary>
	--/ <quantity>stat.error;phot.flux</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_H5_3889_Err] [real] NOT NULL,

	--/ <summary>Set to 1 if the emission line falls on a sky line (5577, 6300 or 6363), measurements set to zero in this case; otherwise, this flag is set to 0</summary>
	--/ <quantity>meta.code</quantity>
	[Fit_Warning_H5_3889] [tinyint] NOT NULL,

	--/ <summary>Amplitude-over-noise of emission line H5 3889</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>km s-1</unit>
	[AoN_H5_3889] [real] NOT NULL,

	--/ <summary>Velocity of emission line He 3970</summary>
	--/ <quantity>phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_He_3970] [real] NOT NULL,

	--/ <summary>Error in velocity of emission line He 3970</summary>
	--/ <quantity>stat.error;phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_He_3970_Err] [real] NOT NULL,

	--/ <summary>Velocity dispersion of emission line He 3970</summary>
	--/ <quantity>phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_He_3970] [real] NOT NULL,

	--/ <summary>Error in velocity dispersion of emission line He 3970</summary>
	--/ <quantity>stat.error;phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_He_3970_Err] [real] NOT NULL,

	--/ <summary>Amplitude of emission line He 3970</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_He_3970] [real] NOT NULL,

	--/ <summary>Error in amplitude of emission line He 3970</summary>
	--/ <quantity>stat.error;spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_He_3970_Err] [real] NOT NULL,

	--/ <summary>Flux of emission line He 3970</summary>
	--/ <quantity>phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_He_3970] [real] NOT NULL,

	--/ <summary>Error in flux of emission line He 3970</summary>
	--/ <quantity>stat.error;phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_He_3970_Err] [real] NOT NULL,

	--/ <summary>Equivalent width of emission line He 3970</summary>
	--/ <quantity>pect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_He_3970] [real] NOT NULL,

	--/ <summary>Error in equivalent width of emission line He 3970</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_He_3970_Err] [real] NOT NULL,

	--/ <summary>Continuum flux at wavelength of emission line He 3970</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_He_3970] [real] NOT NULL,

	--/ <summary>Error in continuum flux at wavelength of emission line He 3970</summary>
	--/ <quantity>stat.error;phot.flux</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_He_3970_Err] [real] NOT NULL,

	--/ <summary>Set to 1 if the emission line falls on a sky line (5577, 6300 or 6363), measurements set to zero in this case; otherwise, this flag is set to 0</summary>
	--/ <quantity>meta.code</quantity>
	[Fit_Warning_He_3970] [tinyint] NOT NULL,

	--/ <summary>Amplitude-over-noise of emission line He 3970</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>km s-1</unit>
	[AoN_He_3970] [real] NOT NULL,

	--/ <summary>Velocity of emission line Hd 4101</summary>
	--/ <quantity>phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_Hd_4101] [real] NOT NULL,

	--/ <summary>Error in velocity of emission line Hd 4101</summary>
	--/ <quantity>stat.error;phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_Hd_4101_Err] [real] NOT NULL,

	--/ <summary>Velocity dispersion of emission line Hd 4101</summary>
	--/ <quantity>phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_Hd_4101] [real] NOT NULL,

	--/ <summary>Error in velocity dispersion of emission line Hd 4101</summary>
	--/ <quantity>stat.error;phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_Hd_4101_Err] [real] NOT NULL,

	--/ <summary>Amplitude of emission line Hd 4101</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_Hd_4101] [real] NOT NULL,

	--/ <summary>Error in amplitude of emission line Hd 4101</summary>
	--/ <quantity>stat.error;spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_Hd_4101_Err] [real] NOT NULL,

	--/ <summary>Flux of emission line Hd 4101</summary>
	--/ <quantity>phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_Hd_4101] [real] NOT NULL,

	--/ <summary>Error in flux of emission line Hd 4101</summary>
	--/ <quantity>stat.error;phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_Hd_4101_Err] [real] NOT NULL,

	--/ <summary>Equivalent width of emission line Hd 4101</summary>
	--/ <quantity>pect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_Hd_4101] [real] NOT NULL,

	--/ <summary>Error in equivalent width of emission line Hd 4101</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_Hd_4101_Err] [real] NOT NULL,

	--/ <summary>Continuum flux at wavelength of emission line Hd 4101</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_Hd_4101] [real] NOT NULL,

	--/ <summary>Error in continuum flux at wavelength of emission line Hd 4101</summary>
	--/ <quantity>stat.error;phot.flux</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_Hd_4101_Err] [real] NOT NULL,

	--/ <summary>Set to 1 if the emission line falls on a sky line (5577, 6300 or 6363), measurements set to zero in this case; otherwise, this flag is set to 0</summary>
	--/ <quantity>meta.code</quantity>
	[Fit_Warning_Hd_4101] [tinyint] NOT NULL,

	--/ <summary>Amplitude-over-noise of emission line Hd 4101</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>km s-1</unit>
	[AoN_Hd_4101] [real] NOT NULL,

	--/ <summary>Velocity of emission line Hg 4340</summary>
	--/ <quantity>phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_Hg_4340] [real] NOT NULL,

	--/ <summary>Error in velocity of emission line Hg 4340</summary>
	--/ <quantity>stat.error;phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_Hg_4340_Err] [real] NOT NULL,

	--/ <summary>Velocity dispersion of emission line Hg 4340</summary>
	--/ <quantity>phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_Hg_4340] [real] NOT NULL,

	--/ <summary>Error in velocity dispersion of emission line Hg 4340</summary>
	--/ <quantity>stat.error;phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_Hg_4340_Err] [real] NOT NULL,

	--/ <summary>Amplitude of emission line Hg 4340</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_Hg_4340] [real] NOT NULL,

	--/ <summary>Error in amplitude of emission line Hg 4340</summary>
	--/ <quantity>stat.error;spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_Hg_4340_Err] [real] NOT NULL,

	--/ <summary>Flux of emission line Hg 4340</summary>
	--/ <quantity>phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_Hg_4340] [real] NOT NULL,

	--/ <summary>Error in flux of emission line Hg 4340</summary>
	--/ <quantity>stat.error;phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_Hg_4340_Err] [real] NOT NULL,

	--/ <summary>Equivalent width of emission line Hg 4340</summary>
	--/ <quantity>pect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_Hg_4340] [real] NOT NULL,

	--/ <summary>Error in equivalent width of emission line Hg 4340</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_Hg_4340_Err] [real] NOT NULL,

	--/ <summary>Continuum flux at wavelength of emission line Hg 4340</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_Hg_4340] [real] NOT NULL,

	--/ <summary>Error in continuum flux at wavelength of emission line Hg 4340</summary>
	--/ <quantity>stat.error;phot.flux</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_Hg_4340_Err] [real] NOT NULL,

	--/ <summary>Set to 1 if the emission line falls on a sky line (5577, 6300 or 6363), measurements set to zero in this case; otherwise, this flag is set to 0</summary>
	--/ <quantity>meta.code</quantity>
	[Fit_Warning_Hg_4340] [tinyint] NOT NULL,

	--/ <summary>Amplitude-over-noise of emission line Hg 4340</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>km s-1</unit>
	[AoN_Hg_4340] [real] NOT NULL,

	--/ <summary>Velocity of emission line [OIII] 4363</summary>
	--/ <quantity>phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_OIII_4363] [real] NOT NULL,

	--/ <summary>Error in velocity of emission line [OIII] 4363</summary>
	--/ <quantity>stat.error;phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_OIII_4363_Err] [real] NOT NULL,

	--/ <summary>Velocity dispersion of emission line [OIII] 4363</summary>
	--/ <quantity>phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_OIII_4363] [real] NOT NULL,

	--/ <summary>Error in velocity dispersion of emission line [OIII] 4363</summary>
	--/ <quantity>stat.error;phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_OIII_4363_Err] [real] NOT NULL,

	--/ <summary>Amplitude of emission line [OIII] 4363</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_OIII_4363] [real] NOT NULL,

	--/ <summary>Error in amplitude of emission line [OIII] 4363</summary>
	--/ <quantity>stat.error;spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_OIII_4363_Err] [real] NOT NULL,

	--/ <summary>Flux of emission line [OIII] 4363</summary>
	--/ <quantity>phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_OIII_4363] [real] NOT NULL,

	--/ <summary>Error in flux of emission line [OIII] 4363</summary>
	--/ <quantity>stat.error;phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_OIII_4363_Err] [real] NOT NULL,

	--/ <summary>Equivalent width of emission line [OIII] 4363</summary>
	--/ <quantity>pect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_OIII_4363] [real] NOT NULL,

	--/ <summary>Error in equivalent width of emission line [OIII] 4363</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_OIII_4363_Err] [real] NOT NULL,

	--/ <summary>Continuum flux at wavelength of emission line [OIII] 4363</summary>
	--/ <quantity>phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_OIII_4363] [real] NOT NULL,

	--/ <summary>Error in continuum flux at wavelength of emission line [OIII] 4363</summary>
	--/ <quantity>stat.error;phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_OIII_4363_Err] [real] NOT NULL,

	--/ <summary>Set to 1 if the emission line falls on a sky line (5577, 6300 or 6363), measurements set to zero in this case; otherwise, this flag is set to 0</summary>
	--/ <quantity>meta.code</quantity>
	[Fit_Warning_OIII_4363] [tinyint] NOT NULL,

	--/ <summary>Amplitude-over-noise of emission line [OIII] 4363</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>km s-1</unit>
	[AoN_OIII_4363] [real] NOT NULL,

	--/ <summary>Velocity of emission line HeII 4685</summary>
	--/ <quantity>phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_HeII_4685] [real] NOT NULL,

	--/ <summary>Error in velocity of emission line HeII 4685</summary>
	--/ <quantity>stat.error;phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_HeII_4685_Err] [real] NOT NULL,

	--/ <summary>Velocity dispersion of emission line HeII 4685</summary>
	--/ <quantity>phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_HeII_4685] [real] NOT NULL,

	--/ <summary>Error in velocity dispersion of emission line HeII 4685</summary>
	--/ <quantity>stat.error;phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_HeII_4685_Err] [real] NOT NULL,

	--/ <summary>Amplitude of emission line HeII 4685</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_HeII_4685] [real] NOT NULL,

	--/ <summary>Error in amplitude of emission line HeII 4685</summary>
	--/ <quantity>stat.error;spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_HeII_4685_Err] [real] NOT NULL,

	--/ <summary>Flux of emission line HeII 4685</summary>
	--/ <quantity>phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_HeII_4685] [real] NOT NULL,

	--/ <summary>Error in flux of emission line HeII 4685</summary>
	--/ <quantity>stat.error;phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_HeII_4685_Err] [real] NOT NULL,

	--/ <summary>Equivalent width of emission line HeII 4685</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_HeII_4685] [real] NOT NULL,

	--/ <summary>Error in equivalent width of emission line HeII 4685</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_HeII_4685_Err] [real] NOT NULL,

	--/ <summary>Continuum flux at wavelength of emission line HeII 4685</summary>
	--/ <quantity>phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_HeII_4685] [real] NOT NULL,

	--/ <summary>Error in continuum flux at wavelength of emission line HeII 4685</summary>
	--/ <quantity>stat.error;phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_HeII_4685_Err] [real] NOT NULL,

	--/ <summary>Set to 1 if the emission line falls on a sky line (5577, 6300 or 6363), measurements set to zero in this case; otherwise, this flag is set to 0</summary>
	--/ <quantity>meta.code</quantity>
	[Fit_Warning_HeII_4685] [tinyint] NOT NULL,

	--/ <summary>Amplitude-over-noise of emission line HeII 4685</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>km s-1</unit>
	[AoN_HeII_4685] [real] NOT NULL,

	--/ <summary>Velocity of emission line [ArIV] 4711</summary>
	--/ <quantity>phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_ArIV_4711] [real] NOT NULL,

	--/ <summary>Error in velocity of emission line [ArIV] 4711</summary>
	--/ <quantity>stat.error;phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_ArIV_4711_Err] [real] NOT NULL,

	--/ <summary>Velocity dispersion of emission line [ArIV] 4711</summary>
	--/ <quantity>phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_ArIV_4711] [real] NOT NULL,

	--/ <summary>Error in velocity dispersion of emission line [ArIV] 4711</summary>
	--/ <quantity>stat.error;phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_ArIV_4711_Err] [real] NOT NULL,

	--/ <summary>Amplitude of emission line [ArIV] 4711</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_ArIV_4711] [real] NOT NULL,

	--/ <summary>Error in amplitude of emission line [ArIV] 4711</summary>
	--/ <quantity>stat.error;spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_ArIV_4711_Err] [real] NOT NULL,

	--/ <summary>Flux of emission line [ArIV] 4711</summary>
	--/ <quantity>phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_ArIV_4711] [real] NOT NULL,

	--/ <summary>Error in flux of emission line [ArIV] 4711</summary>
	--/ <quantity>stat.error;phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_ArIV_4711_Err] [real] NOT NULL,

	--/ <summary>Equivalent width of emission line [ArIV] 4711</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_ArIV_4711] [real] NOT NULL,

	--/ <summary>Error in equivalent width of emission line [ArIV] 4711</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_ArIV_4711_Err] [real] NOT NULL,

	--/ <summary>Continuum flux at wavelength of emission line [ArIV] 4711</summary>
	--/ <quantity>phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_ArIV_4711] [real] NOT NULL,

	--/ <summary>Error in continuum flux at wavelength of emission line [ArIV] 4711</summary>
	--/ <quantity>stat.error;phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_ArIV_4711_Err] [real] NOT NULL,

	--/ <summary>Set to 1 if the emission line falls on a sky line (5577, 6300 or 6363), measurements set to zero in this case; otherwise, this flag is set to 0</summary>
	--/ <quantity>meta.code</quantity>
	[Fit_Warning_ArIV_4711] [tinyint] NOT NULL,

	--/ <summary>Amplitude-over-noise of emission line [ArIV] 4711</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>km s-1</unit>
	[AoN_ArIV_4711] [real] NOT NULL,

	--/ <summary>Velocity of emission line [ArIV] 4740</summary>
	--/ <quantity>phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_ArIV_4740] [real] NOT NULL,

	--/ <summary>Error in velocity of emission line [ArIV] 4740</summary>
	--/ <quantity>stat.error;phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_ArIV_4740_Err] [real] NOT NULL,

	--/ <summary>Velocity dispersion of emission line [ArIV] 4740</summary>
	--/ <quantity>phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_ArIV_4740] [real] NOT NULL,

	--/ <summary>Error in velocity dispersion of emission line [ArIV] 4740</summary>
	--/ <quantity>stat.error;phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_ArIV_4740_Err] [real] NOT NULL,

	--/ <summary>Amplitude of emission line [ArIV] 4740</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_ArIV_4740] [real] NOT NULL,

	--/ <summary>Error in amplitude of emission line [ArIV] 4740</summary>
	--/ <quantity>stat.error;spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_ArIV_4740_Err] [real] NOT NULL,

	--/ <summary>Flux of emission line [ArIV] 4740</summary>
	--/ <quantity>phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_ArIV_4740] [real] NOT NULL,

	--/ <summary>Error in flux of emission line [ArIV] 4740</summary>
	--/ <quantity>stat.error;phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_ArIV_4740_Err] [real] NOT NULL,

	--/ <summary>Equivalent width of emission line [ArIV] 4740</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_ArIV_4740] [real] NOT NULL,

	--/ <summary>Error in equivalent width of emission line [ArIV] 4740</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_ArIV_4740_Err] [real] NOT NULL,

	--/ <summary>Continuum flux at wavelength of emission line [ArIV] 4740</summary>
	--/ <quantity>phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_ArIV_4740] [real] NOT NULL,

	--/ <summary>Error in continuum flux at wavelength of emission line [ArIV] 4740</summary>
	--/ <quantity>stat.error;phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_ArIV_4740_Err] [real] NOT NULL,

	--/ <summary>Set to 1 if the emission line falls on a sky line (5577, 6300 or 6363), measurements set to zero in this case; otherwise, this flag is set to 0</summary>
	--/ <quantity>meta.code</quantity>
	[Fit_Warning_ArIV_4740] [tinyint] NOT NULL,

	--/ <summary>Amplitude-over-noise of emission line [ArIV] 4740</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>km s-1</unit>
	[AoN_ArIV_4740] [real] NOT NULL,

	--/ <summary>Velocity of emission line Hb 4861</summary>
	--/ <quantity>phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_Hb_4861] [real] NOT NULL,

	--/ <summary>Error in velocity of emission line Hb 4861</summary>
	--/ <quantity>stat.error;phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_Hb_4861_Err] [real] NOT NULL,

	--/ <summary>Velocity dispersion of emission line Hb 4861</summary>
	--/ <quantity>phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_Hb_4861] [real] NOT NULL,

	--/ <summary>Error in velocity dispersion of emission line Hb 4861</summary>
	--/ <quantity>stat.error;phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_Hb_4861_Err] [real] NOT NULL,

	--/ <summary>Amplitude of emission line Hb 4861</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_Hb_4861] [real] NOT NULL,

	--/ <summary>Error in amplitude of emission line Hb 4861</summary>
	--/ <quantity>stat.error;spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_Hb_4861_Err] [real] NOT NULL,

	--/ <summary>Flux of emission line Hb 4861</summary>
	--/ <quantity>phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_Hb_4861] [real] NOT NULL,

	--/ <summary>Error in flux of emission line Hb 4861</summary>
	--/ <quantity>stat.error;phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_Hb_4861_Err] [real] NOT NULL,

	--/ <summary>Equivalent width of emission line Hb 4861</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_Hb_4861] [real] NOT NULL,

	--/ <summary>Error in equivalent width of emission line Hb 4861</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_Hb_4861_Err] [real] NOT NULL,

	--/ <summary>Continuum flux at wavelength of emission line Hb 4861</summary>
	--/ <quantity>phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_Hb_4861] [real] NOT NULL,

	--/ <summary>Error in continuum flux at wavelength of emission line Hb 4861</summary>
	--/ <quantity>stat.error;phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_Hb_4861_Err] [real] NOT NULL,

	--/ <summary>Set to 1 if the emission line falls on a sky line (5577, 6300 or 6363), measurements set to zero in this case; otherwise, this flag is set to 0</summary>
	--/ <quantity>meta.code</quantity>
	[Fit_Warning_Hb_4861] [tinyint] NOT NULL,

	--/ <summary>Amplitude-over-noise of emission line Hb 4861</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>km s-1</unit>
	[AoN_Hb_4861] [real] NOT NULL,

	--/ <summary>Velocity of emission line [OIII] 4958</summary>
	--/ <quantity>phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_OIII_4958] [real] NOT NULL,

	--/ <summary>Error in velocity of emission line [OIII] 4958</summary>
	--/ <quantity>stat.error;phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_OIII_4958_Err] [real] NOT NULL,

	--/ <summary>Velocity dispersion of emission line [OIII] 4958</summary>
	--/ <quantity>phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_OIII_4958] [real] NOT NULL,

	--/ <summary>Error in velocity dispersion of emission line [OIII] 4958</summary>
	--/ <quantity>stat.error;phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_OIII_4958_Err] [real] NOT NULL,

	--/ <summary>Amplitude of emission line [OIII] 4958</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_OIII_4958] [real] NOT NULL,

	--/ <summary>Error in amplitude of emission line [OIII] 4958</summary>
	--/ <quantity>stat.error;spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_OIII_4958_Err] [real] NOT NULL,

	--/ <summary>Flux of emission line [OIII] 4958</summary>
	--/ <quantity>phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_OIII_4958] [real] NOT NULL,

	--/ <summary>Error in flux of emission line [OIII] 4958</summary>
	--/ <quantity>stat.error;phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_OIII_4958_Err] [real] NOT NULL,

	--/ <summary>Equivalent width of emission line [OIII] 4958</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_OIII_4958] [real] NOT NULL,

	--/ <summary>Error in equivalent width of emission line [OIII] 4958</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_OIII_4958_Err] [real] NOT NULL,

	--/ <summary>Continuum flux at wavelength of emission line [OIII] 4958</summary>
	--/ <quantity>phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_OIII_4958] [real] NOT NULL,

	--/ <summary>Error in continuum flux at wavelength of emission line [OIII] 4958</summary>
	--/ <quantity>stat.error;phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_OIII_4958_Err] [real] NOT NULL,

	--/ <summary>Set to 1 if the emission line falls on a sky line (5577, 6300 or 6363), measurements set to zero in this case; otherwise, this flag is set to 0</summary>
	--/ <quantity>meta.code</quantity>
	[Fit_Warning_OIII_4958] [tinyint] NOT NULL,

	--/ <summary>Velocity of emission line [OIII] 5006</summary>
	--/ <quantity>phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_OIII_5006] [real] NOT NULL,

	--/ <summary>Error in velocity of emission line [OIII] 5006</summary>
	--/ <quantity>stat.error;phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_OIII_5006_Err] [real] NOT NULL,

	--/ <summary>Velocity dispersion of emission line [OIII] 5006</summary>
	--/ <quantity>phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_OIII_5006] [real] NOT NULL,

	--/ <summary>Error in velocity dispersion of emission line [OIII] 5006</summary>
	--/ <quantity>stat.error;phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_OIII_5006_Err] [real] NOT NULL,

	--/ <summary>Amplitude of emission line [OIII] 5006</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_OIII_5006] [real] NOT NULL,

	--/ <summary>Error in amplitude of emission line [OIII] 5006</summary>
	--/ <quantity>stat.error;spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_OIII_5006_Err] [real] NOT NULL,

	--/ <summary>Flux of emission line [OIII] 5006</summary>
	--/ <quantity>phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_OIII_5006] [real] NOT NULL,

	--/ <summary>Error in flux of emission line [OIII] 5006</summary>
	--/ <quantity>stat.error;phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_OIII_5006_Err] [real] NOT NULL,

	--/ <summary>Equivalent width of emission line [OIII] 5006</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_OIII_5006] [real] NOT NULL,

	--/ <summary>Error in equivalent width of emission line [OIII] 5006</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_OIII_5006_Err] [real] NOT NULL,

	--/ <summary>Continuum flux at wavelength of emission line [OIII] 5006</summary>
	--/ <quantity>phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_OIII_5006] [real] NOT NULL,

	--/ <summary>Error in continuum flux at wavelength of emission line [OIII] 5006</summary>
	--/ <quantity>stat.error;phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_OIII_5006_Err] [real] NOT NULL,

	--/ <summary>Set to 1 if the emission line falls on a sky line (5577, 6300 or 6363), measurements set to zero in this case; otherwise, this flag is set to 0</summary>
	--/ <quantity>meta.code</quantity>
	[Fit_Warning_OIII_5006] [tinyint] NOT NULL,

	--/ <summary>Amplitude-over-noise of emission line [OIII] 5006</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>km s-1</unit>
	[AoN_OIII_5006] [real] NOT NULL,

	--/ <summary>Velocity of emission line [NI] 5197</summary>
	--/ <quantity>phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_NI_5197] [real] NOT NULL,

	--/ <summary>Error in velocity of emission line [NI] 5197</summary>
	--/ <quantity>stat.error;phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_NI_5197_Err] [real] NOT NULL,

	--/ <summary>Velocity dispersion of emission line [NI] 5197</summary>
	--/ <quantity>phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_NI_5197] [real] NOT NULL,

	--/ <summary>Error in velocity dispersion of emission line [NI] 5197</summary>
	--/ <quantity>stat.error;phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_NI_5197_Err] [real] NOT NULL,

	--/ <summary>Amplitude of emission line [NI] 5197</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_NI_5197] [real] NOT NULL,

	--/ <summary>Error in amplitude of emission line [NI] 5197</summary>
	--/ <quantity>stat.error;spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_NI_5197_Err] [real] NOT NULL,

	--/ <summary>Flux of emission line [NI] 5197</summary>
	--/ <quantity>phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_NI_5197] [real] NOT NULL,

	--/ <summary>Error in flux of emission line [NI] 5197</summary>
	--/ <quantity>stat.error;phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_NI_5197_Err] [real] NOT NULL,

	--/ <summary>Equivalent width of emission line [NI] 5197</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_NI_5197] [real] NOT NULL,

	--/ <summary>Error in equivalent width of emission line [NI] 5197</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_NI_5197_Err] [real] NOT NULL,

	--/ <summary>Continuum flux at wavelength of emission line [NI] 5197</summary>
	--/ <quantity>phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_NI_5197] [real] NOT NULL,

	--/ <summary>Error in continuum flux at wavelength of emission line [NI] 5197</summary>
	--/ <quantity>stat.error;phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_NI_5197_Err] [real] NOT NULL,

	--/ <summary>Set to 1 if the emission line falls on a sky line (5577, 6300 or 6363), measurements set to zero in this case; otherwise, this flag is set to 0</summary>
	--/ <quantity>meta.code</quantity>
	[Fit_Warning_NI_5197] [tinyint] NOT NULL,

	--/ <summary>Amplitude-over-noise of emission line [NI] 5197</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>km s-1</unit>
	[AoN_NI_5197] [real] NOT NULL,

	--/ <summary>Velocity of emission line [NI] 5200</summary>
	--/ <quantity>phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_NI_5200] [real] NOT NULL,

	--/ <summary>Error in velocity of emission line [NI] 5200</summary>
	--/ <quantity>stat.error;phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_NI_5200_Err] [real] NOT NULL,

	--/ <summary>Velocity dispersion of emission line [NI] 5200</summary>
	--/ <quantity>phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_NI_5200] [real] NOT NULL,

	--/ <summary>Error in velocity dispersion of emission line [NI] 5200</summary>
	--/ <quantity>stat.error;phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_NI_5200_Err] [real] NOT NULL,

	--/ <summary>Amplitude of emission line [NI] 5200</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_NI_5200] [real] NOT NULL,

	--/ <summary>Error in amplitude of emission line [NI] 5200</summary>
	--/ <quantity>stat.error;spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_NI_5200_Err] [real] NOT NULL,

	--/ <summary>Flux of emission line [NI] 5200</summary>
	--/ <quantity>phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_NI_5200] [real] NOT NULL,

	--/ <summary>Error in flux of emission line [NI] 5200</summary>
	--/ <quantity>stat.error;phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_NI_5200_Err] [real] NOT NULL,

	--/ <summary>Equivalent width of emission line [NI] 5200</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_NI_5200] [real] NOT NULL,

	--/ <summary>Error in equivalent width of emission line [NI] 5200</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_NI_5200_Err] [real] NOT NULL,

	--/ <summary>Continuum flux at wavelength of emission line [NI] 5200</summary>
	--/ <quantity>phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_NI_5200] [real] NOT NULL,

	--/ <summary>Error in continuum flux at wavelength of emission line [NI] 5200</summary>
	--/ <quantity>stat.error;phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_NI_5200_Err] [real] NOT NULL,

	--/ <summary>Set to 1 if the emission line falls on a sky line (5577, 6300 or 6363), measurements set to zero in this case; otherwise, this flag is set to 0</summary>
	--/ <quantity>meta.code</quantity>
	[Fit_Warning_NI_5200] [tinyint] NOT NULL,

	--/ <summary>Amplitude-over-noise of emission line [NI] 5200</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>km s-1</unit>
	[AoN_NI_5200] [real] NOT NULL,

	--/ <summary>Velocity of emission line HeI 5875</summary>
	--/ <quantity>phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_HeI_5875] [real] NOT NULL,

	--/ <summary>Error in velocity of emission line HeI 5875</summary>
	--/ <quantity>stat.error;phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_HeI_5875_Err] [real] NOT NULL,

	--/ <summary>Velocity dispersion of emission line HeI 5875</summary>
	--/ <quantity>phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_HeI_5875] [real] NOT NULL,

	--/ <summary>Error in velocity dispersion of emission line HeI 5875</summary>
	--/ <quantity>stat.error;phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_HeI_5875_Err] [real] NOT NULL,

	--/ <summary>Amplitude of emission line HeI 5875</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_HeI_5875] [real] NOT NULL,

	--/ <summary>Error in amplitude of emission line HeI 5875</summary>
	--/ <quantity>stat.error;spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_HeI_5875_Err] [real] NOT NULL,

	--/ <summary>Flux of emission line HeI 5875</summary>
	--/ <quantity>phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_HeI_5875] [real] NOT NULL,

	--/ <summary>Error in flux of emission line HeI 5875</summary>
	--/ <quantity>stat.error;phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_HeI_5875_Err] [real] NOT NULL,

	--/ <summary>Equivalent width of emission line HeI 5875</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_HeI_5875] [real] NOT NULL,

	--/ <summary>Error in equivalent width of emission line HeI 5875</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_HeI_5875_Err] [real] NOT NULL,

	--/ <summary>Continuum flux at wavelength of emission line HeI 5875</summary>
	--/ <quantity>phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_HeI_5875] [real] NOT NULL,

	--/ <summary>Error in continuum flux at wavelength of emission line HeI 5875</summary>
	--/ <quantity>stat.error;phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_HeI_5875_Err] [real] NOT NULL,

	--/ <summary>Set to 1 if the emission line falls on a sky line (5577, 6300 or 6363), measurements set to zero in this case; otherwise, this flag is set to 0</summary>
	--/ <quantity>meta.code</quantity>
	[Fit_Warning_HeI_5875] [tinyint] NOT NULL,

	--/ <summary>Amplitude-over-noise of emission line HeI 5875</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>km s-1</unit>
	[AoN_HeI_5875] [real] NOT NULL,

	--/ <summary>Velocity of emission line [OI] 6300</summary>
	--/ <quantity>phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_OI_6300] [real] NOT NULL,

	--/ <summary>Error in velocity of emission line [OI] 6300</summary>
	--/ <quantity>stat.error;phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_OI_6300_Err] [real] NOT NULL,

	--/ <summary>Velocity dispersion of emission line [OI] 6300</summary>
	--/ <quantity>phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_OI_6300] [real] NOT NULL,

	--/ <summary>Error in velocity dispersion of emission line [OI] 6300</summary>
	--/ <quantity>stat.error;phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_OI_6300_Err] [real] NOT NULL,

	--/ <summary>Amplitude of emission line [OI] 6300</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_OI_6300] [real] NOT NULL,

	--/ <summary>Error in amplitude of emission line [OI] 6300</summary>
	--/ <quantity>stat.error;spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_OI_6300_Err] [real] NOT NULL,

	--/ <summary>Flux of emission line [OI] 6300</summary>
	--/ <quantity>phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_OI_6300] [real] NOT NULL,

	--/ <summary>Error in flux of emission line [OI] 6300</summary>
	--/ <quantity>stat.error;phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_OI_6300_Err] [real] NOT NULL,

	--/ <summary>Equivalent width of emission line [OI] 6300</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_OI_6300] [real] NOT NULL,

	--/ <summary>Error in equivalent width of emission line [OI] 6300</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_OI_6300_Err] [real] NOT NULL,

	--/ <summary>Continuum flux at wavelength of emission line [OI] 6300</summary>
	--/ <quantity>phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_OI_6300] [real] NOT NULL,

	--/ <summary>Error in continuum flux at wavelength of emission line [OI] 6300</summary>
	--/ <quantity>stat.error;phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_OI_6300_Err] [real] NOT NULL,

	--/ <summary>Set to 1 if the emission line falls on a sky line (5577, 6300 or 6363), measurements set to zero in this case; otherwise, this flag is set to 0</summary>
	--/ <quantity>meta.code</quantity>
	[Fit_Warning_OI_6300] [tinyint] NOT NULL,

	--/ <summary>Amplitude-over-noise of emission line [OI] 6300</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>km s-1</unit>
	[AoN_OI_6300] [real] NOT NULL,

	--/ <summary>Velocity of emission line [OI] 6363</summary>
	--/ <quantity>phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_OI_6363] [real] NOT NULL,

	--/ <summary>Error in velocity of emission line [OI] 6363</summary>
	--/ <quantity>stat.error;phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_OI_6363_Err] [real] NOT NULL,

	--/ <summary>Velocity dispersion of emission line [OI] 6363</summary>
	--/ <quantity>phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_OI_6363] [real] NOT NULL,

	--/ <summary>Error in velocity dispersion of emission line [OI] 6363</summary>
	--/ <quantity>stat.error;phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_OI_6363_Err] [real] NOT NULL,

	--/ <summary>Amplitude of emission line [OI] 6363</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_OI_6363] [real] NOT NULL,

	--/ <summary>Error in amplitude of emission line [OI] 6363</summary>
	--/ <quantity>stat.error;spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_OI_6363_Err] [real] NOT NULL,

	--/ <summary>Flux of emission line [OI] 6363</summary>
	--/ <quantity>phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_OI_6363] [real] NOT NULL,

	--/ <summary>Error in flux of emission line [OI] 6363</summary>
	--/ <quantity>stat.error;phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_OI_6363_Err] [real] NOT NULL,

	--/ <summary>Equivalent width of emission line [OI] 6363</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_OI_6363] [real] NOT NULL,

	--/ <summary>Error in equivalent width of emission line [OI] 6363</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_OI_6363_Err] [real] NOT NULL,

	--/ <summary>Continuum flux at wavelength of emission line [OI] 6363</summary>
	--/ <quantity>phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_OI_6363] [real] NOT NULL,

	--/ <summary>Error in continuum flux at wavelength of emission line [OI] 6363</summary>
	--/ <quantity>stat.error;phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_OI_6363_Err] [real] NOT NULL,

	--/ <summary>Set to 1 if the emission line falls on a sky line (5577, 6300 or 6363), measurements set to zero in this case; otherwise, this flag is set to 0</summary>
	--/ <quantity>meta.code</quantity>
	[Fit_Warning_OI_6363] [tinyint] NOT NULL,

	--/ <summary>Amplitude-over-noise of emission line [OI] 6363</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>km s-1</unit>
	[AoN_OI_6363] [real] NOT NULL,

	--/ <summary>Velocity of emission line [NII] 6547</summary>
	--/ <quantity>phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_NII_6547] [real] NOT NULL,

	--/ <summary>Error in velocity of emission line [NII] 6547</summary>
	--/ <quantity>stat.error;phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_NII_6547_Err] [real] NOT NULL,

	--/ <summary>Velocity dispersion of emission line [NII] 6547</summary>
	--/ <quantity>phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_NII_6547] [real] NOT NULL,

	--/ <summary>Error in velocity dispersion of emission line [NII] 6547</summary>
	--/ <quantity>stat.error;phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_NII_6547_Err] [real] NOT NULL,

	--/ <summary>Amplitude of emission line [NII] 6547</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_NII_6547] [real] NOT NULL,

	--/ <summary>Error in amplitude of emission line [NII] 6547</summary>
	--/ <quantity>stat.error;spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_NII_6547_Err] [real] NOT NULL,

	--/ <summary>Flux of emission line [NII] 6547</summary>
	--/ <quantity>phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_NII_6547] [real] NOT NULL,

	--/ <summary>Error in flux of emission line [NII] 6547</summary>
	--/ <quantity>stat.error;phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_NII_6547_Err] [real] NOT NULL,

	--/ <summary>Equivalent width of emission line [NII] 6547</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_NII_6547] [real] NOT NULL,

	--/ <summary>Error in equivalent width of emission line [NII] 6547</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_NII_6547_Err] [real] NOT NULL,

	--/ <summary>Continuum flux at wavelength of emission line [NII] 6547</summary>
	--/ <quantity>phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_NII_6547] [real] NOT NULL,

	--/ <summary>Error in continuum flux at wavelength of emission line [NII] 6547</summary>
	--/ <quantity>stat.error;phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_NII_6547_Err] [real] NOT NULL,

	--/ <summary>Set to 1 if the emission line falls on a sky line (5577, 6300 or 6363), measurements set to zero in this case; otherwise, this flag is set to 0</summary>
	--/ <quantity>meta.code</quantity>
	[Fit_Warning_NII_6547] [tinyint] NOT NULL,

	--/ <summary>Velocity of emission line Ha 6562</summary>
	--/ <quantity>phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_Ha_6562] [real] NOT NULL,

	--/ <summary>Error in velocity of emission line Ha 6562</summary>
	--/ <quantity>stat.error;phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_Ha_6562_Err] [real] NOT NULL,

	--/ <summary>Velocity dispersion of emission line Ha 6562</summary>
	--/ <quantity>phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_Ha_6562] [real] NOT NULL,

	--/ <summary>Error in velocity dispersion of emission line Ha 6562</summary>
	--/ <quantity>stat.error;phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_Ha_6562_Err] [real] NOT NULL,

	--/ <summary>Amplitude of emission line Ha 6562</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_Ha_6562] [real] NOT NULL,

	--/ <summary>Error in amplitude of emission line Ha 6562</summary>
	--/ <quantity>stat.error;spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_Ha_6562_Err] [real] NOT NULL,

	--/ <summary>Flux of emission line Ha 6562</summary>
	--/ <quantity>phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_Ha_6562] [real] NOT NULL,

	--/ <summary>Error in flux of emission line Ha 6562</summary>
	--/ <quantity>stat.error;phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_Ha_6562_Err] [real] NOT NULL,

	--/ <summary>Equivalent width of emission line Ha 6562</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_Ha_6562] [real] NOT NULL,

	--/ <summary>Error in equivalent width of emission line Ha 6562</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_Ha_6562_Err] [real] NOT NULL,

	--/ <summary>Continuum flux at wavelength of emission line Ha 6562</summary>
	--/ <quantity>phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_Ha_6562] [real] NOT NULL,

	--/ <summary>Error in continuum flux at wavelength of emission line Ha 6562</summary>
	--/ <quantity>stat.error;phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_Ha_6562_Err] [real] NOT NULL,

	--/ <summary>Set to 1 if the emission line falls on a sky line (5577, 6300 or 6363), measurements set to zero in this case; otherwise, this flag is set to 0</summary>
	--/ <quantity>meta.code</quantity>
	[Fit_Warning_Ha_6562] [tinyint] NOT NULL,

	--/ <summary>Amplitude-over-noise of emission line Ha 6562</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>km s-1</unit>
	[AoN_Ha_6562] [real] NOT NULL,

	--/ <summary>Velocity of emission line [NII] 6583</summary>
	--/ <quantity>phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_NII_6583] [real] NOT NULL,

	--/ <summary>Error in velocity of emission line [NII] 6583</summary>
	--/ <quantity>stat.error;phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_NII_6583_Err] [real] NOT NULL,

	--/ <summary>Velocity dispersion of emission line [NII] 6583</summary>
	--/ <quantity>phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_NII_6583] [real] NOT NULL,

	--/ <summary>Error in velocity dispersion of emission line [NII] 6583</summary>
	--/ <quantity>stat.error;phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_NII_6583_Err] [real] NOT NULL,

	--/ <summary>Amplitude of emission line [NII] 6583</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_NII_6583] [real] NOT NULL,

	--/ <summary>Error in amplitude of emission line [NII] 6583</summary>
	--/ <quantity>stat.error;spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_NII_6583_Err] [real] NOT NULL,

	--/ <summary>Flux of emission line [NII] 6583</summary>
	--/ <quantity>phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_NII_6583] [real] NOT NULL,

	--/ <summary>Error in flux of emission line [NII] 6583</summary>
	--/ <quantity>stat.error;phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_NII_6583_Err] [real] NOT NULL,

	--/ <summary>Equivalent width of emission line [NII] 6583</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_NII_6583] [real] NOT NULL,

	--/ <summary>Error in equivalent width of emission line [NII] 6583</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_NII_6583_Err] [real] NOT NULL,

	--/ <summary>Continuum flux at wavelength of emission line [NII] 6583</summary>
	--/ <quantity>phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_NII_6583] [real] NOT NULL,

	--/ <summary>Error in continuum flux at wavelength of emission line [NII] 6583</summary>
	--/ <quantity>stat.error;phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_NII_6583_Err] [real] NOT NULL,

	--/ <summary>Set to 1 if the emission line falls on a sky line (5577, 6300 or 6363), measurements set to zero in this case; otherwise, this flag is set to 0</summary>
	--/ <quantity>meta.code</quantity>
	[Fit_Warning_NII_6583] [tinyint] NOT NULL,

	--/ <summary>Amplitude-over-noise of emission line [NII] 6583</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>km s-1</unit>
	[AoN_NII_6583] [real] NOT NULL,

	--/ <summary>Velocity of emission line [SII] 6716</summary>
	--/ <quantity>phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_SII_6716] [real] NOT NULL,

	--/ <summary>Error in velocity of emission line [SII] 6716</summary>
	--/ <quantity>stat.error;phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_SII_6716_Err] [real] NOT NULL,

	--/ <summary>Velocity dispersion of emission line [SII] 6716</summary>
	--/ <quantity>phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_SII_6716] [real] NOT NULL,

	--/ <summary>Error in velocity dispersion of emission line [SII] 6716</summary>
	--/ <quantity>stat.error;phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_SII_6716_Err] [real] NOT NULL,

	--/ <summary>Amplitude of emission line [SII] 6716</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_SII_6716] [real] NOT NULL,

	--/ <summary>Error in amplitude of emission line [SII] 6716</summary>
	--/ <quantity>stat.error;spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_SII_6716_Err] [real] NOT NULL,

	--/ <summary>Flux of emission line [SII] 6716</summary>
	--/ <quantity>phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_SII_6716] [real] NOT NULL,

	--/ <summary>Error in flux of emission line [SII] 6716</summary>
	--/ <quantity>stat.error;phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_SII_6716_Err] [real] NOT NULL,

	--/ <summary>Equivalent width of emission line [SII] 6716</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_SII_6716] [real] NOT NULL,

	--/ <summary>Error in equivalent width of emission line [SII] 6716</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_SII_6716_Err] [real] NOT NULL,

	--/ <summary>Continuum flux at wavelength of emission line [SII] 6716</summary>
	--/ <quantity>phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_SII_6716] [real] NOT NULL,

	--/ <summary>Error in continuum flux at wavelength of emission line [SII] 6716</summary>
	--/ <quantity>stat.error;phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_SII_6716_Err] [real] NOT NULL,

	--/ <summary>Set to 1 if the emission line falls on a sky line (5577, 6300 or 6363), measurements set to zero in this case; otherwise, this flag is set to 0</summary>
	--/ <quantity>meta.code</quantity>
	[Fit_Warning_SII_6716] [tinyint] NOT NULL,

	--/ <summary>Amplitude-over-noise of emission line [SII] 6716</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>km s-1</unit>
	[AoN_SII_6716] [real] NOT NULL,

	--/ <summary>Velocity of emission line [SII] 6730</summary>
	--/ <quantity>phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_SII_6730] [real] NOT NULL,

	--/ <summary>Error in velocity of emission line [SII] 6730</summary>
	--/ <quantity>stat.error;phys.veloc;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[V_SII_6730_Err] [real] NOT NULL,

	--/ <summary>Velocity dispersion of emission line [SII] 6730</summary>
	--/ <quantity>phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_SII_6730] [real] NOT NULL,

	--/ <summary>Error in velocity dispersion of emission line [SII] 6730</summary>
	--/ <quantity>stat.error;phys.veloc.dispersion;spect.line</quantity>
	--/ <unit>km s-1</unit>
	[Sigma_SII_6730_Err] [real] NOT NULL,

	--/ <summary>Amplitude of emission line [SII] 6730</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_SII_6730] [real] NOT NULL,

	--/ <summary>Error in amplitude of emission line [SII] 6730</summary>
	--/ <quantity>stat.error;spect.line.amplitude</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Amplitude_SII_6730_Err] [real] NOT NULL,

	--/ <summary>Flux of emission line [SII] 6730</summary>
	--/ <quantity>phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_SII_6730] [real] NOT NULL,

	--/ <summary>Error in flux of emission line [SII] 6730</summary>
	--/ <quantity>stat.error;phot.flux;spect.line</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1</unit>
	[Flux_SII_6730_Err] [real] NOT NULL,

	--/ <summary>Equivalent width of emission line [SII] 6730</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_SII_6730] [real] NOT NULL,

	--/ <summary>Error in equivalent width of emission line [SII] 6730</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[EW_SII_6730_Err] [real] NOT NULL,

	--/ <summary>Continuum flux at wavelength of emission line [SII] 6730</summary>
	--/ <quantity>phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_SII_6730] [real] NOT NULL,

	--/ <summary>Error in continuum flux at wavelength of emission line [SII] 6730</summary>
	--/ <quantity>stat.error;phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 ergs cm-2 s-1 AA-1</unit>
	[Flux_Cont_SII_6730_Err] [real] NOT NULL,

	--/ <summary>Set to 1 if the emission line falls on a sky line (5577, 6300 or 6363), measurements set to zero in this case; otherwise, this flag is set to 0</summary>
	--/ <quantity>meta.code</quantity>
	[Fit_Warning_SII_6730] [tinyint] NOT NULL,

	--/ <summary>Amplitude-over-noise of emission line [SII] 6730</summary>
	--/ <quantity>spect.line.amplitude</quantity>
	--/ <unit>km s-1</unit>
	[AoN_SII_6730] [real] NOT NULL,
 CONSTRAINT [pk_emissionLinesPort_specObjID] PRIMARY KEY CLUSTERED 
(
	[specObjID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Field]    Script Date: 4/1/2015 5:51:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--/ <summary> All the measured parameters and calibrations of a photometric field </summary>
--/ <remarks> A field is a 2048x1489 pixel section of a camera column.   This table contains summary results of the photometric   and calibration pipelines for each field. </remarks>
CREATE TABLE [dbo].[Field](

	--/ <summary>Unique SDSS identifier composed from [skyVersion,rerun,run,camcol,field].</summary>
	--/ <quantity>meta.id;meta.main</quantity>
	[fieldID] [bigint] NOT NULL,

	--/ <summary>Layer of catalog (currently only one layer, 0; 0-15 available)</summary>
	--/ <quantity>meta.version</quantity>
	[skyVersion] [tinyint] NOT NULL,

	--/ <summary>Run number</summary>
	--/ <quantity>meta.id</quantity>
	[run] [smallint] NOT NULL,

	--/ <summary>Rerun number</summary>
	--/ <quantity>meta.id</quantity>
	[rerun] [smallint] NOT NULL,

	--/ <summary>Camera column</summary>
	--/ <quantity>meta.id;instr.det</quantity>
	[camcol] [tinyint] NOT NULL,

	--/ <summary>Field number</summary>
	--/ <quantity>meta.id;obs.field</quantity>
	[field] [smallint] NOT NULL,

	--/ <summary>Number of total objects in the field</summary>
	--/ <quantity>meta.number;src</quantity>
	[nTotal] [smallint] NOT NULL,

	--/ <summary>Number of non-bright objects in the field</summary>
	--/ <quantity>meta.number;src</quantity>
	[nObjects] [smallint] NOT NULL,

	--/ <summary>Number of "child" objects in the field</summary>
	--/ <quantity>meta.number</quantity>
	[nChild] [smallint] NOT NULL,

	--/ <summary>Number of objects classified as "galaxy"</summary>
	--/ <quantity>meta.number;src</quantity>
	[nGalaxy] [smallint] NOT NULL,

	--/ <summary>Number of objects classified as "star"</summary>
	--/ <quantity>meta.number;src</quantity>
	[nStars] [smallint] NOT NULL,

	--/ <summary>Number of cosmics in u-band</summary>
	--/ <quantity>meta.number;em.opt.SDSS.u</quantity>
	[nCR_u] [smallint] NOT NULL,

	--/ <summary>Number of cosmics in g-band</summary>
	--/ <quantity>meta.number;em.opt.SDSS.g</quantity>
	[nCR_g] [smallint] NOT NULL,

	--/ <summary>Number of cosmics in r-band</summary>
	--/ <quantity>meta.number;em.opt.SDSS.r</quantity>
	[nCR_r] [smallint] NOT NULL,

	--/ <summary>Number of cosmics in i-band</summary>
	--/ <quantity>meta.number;em.opt.SDSS.i</quantity>
	[nCR_i] [smallint] NOT NULL,

	--/ <summary>Number of cosmics in z-band</summary>
	--/ <quantity>meta.number;em.opt.SDSS.z</quantity>
	[nCR_z] [smallint] NOT NULL,

	--/ <summary>Number of bright objects in u-band</summary>
	--/ <quantity>meta.number;em.opt.SDSS.u</quantity>
	[nBrightObj_u] [smallint] NOT NULL,

	--/ <summary>Number of bright objects in g-band</summary>
	--/ <quantity>meta.number;em.opt.SDSS.g</quantity>
	[nBrightObj_g] [smallint] NOT NULL,

	--/ <summary>Number of bright objects in r-band</summary>
	--/ <quantity>meta.number;em.opt.SDSS.r</quantity>
	[nBrightObj_r] [smallint] NOT NULL,

	--/ <summary>Number of bright objects in i-band</summary>
	--/ <quantity>meta.number;em.opt.SDSS.i</quantity>
	[nBrightObj_i] [smallint] NOT NULL,

	--/ <summary>Number of bright objects in z-band</summary>
	--/ <quantity>meta.number;em.opt.SDSS.z</quantity>
	[nBrightObj_z] [smallint] NOT NULL,

	--/ <summary>Number of faint objects in u-band</summary>
	--/ <quantity>meta.number;em.opt.SDSS.u</quantity>
	[nFaintObj_u] [smallint] NOT NULL,

	--/ <summary>Number of faint objects in g-band</summary>
	--/ <quantity>meta.number;em.opt.SDSS.g</quantity>
	[nFaintObj_g] [smallint] NOT NULL,

	--/ <summary>Number of faint objects in r-band</summary>
	--/ <quantity>meta.number;em.opt.SDSS.r</quantity>
	[nFaintObj_r] [smallint] NOT NULL,

	--/ <summary>Number of faint objects in i-band</summary>
	--/ <quantity>meta.number;em.opt.SDSS.i</quantity>
	[nFaintObj_i] [smallint] NOT NULL,

	--/ <summary>Number of faint objects in z-band</summary>
	--/ <quantity>meta.number;em.opt.SDSS.z</quantity>
	[nFaintObj_z] [smallint] NOT NULL,

	--/ <summary>Quality of field</summary>
	--/ <quantity>meta.code.qual;obs.field</quantity>
	[quality] [int] NOT NULL,

	--/ <summary>MJD(TAI) when row 0 of u-band field was read</summary>
	--/ <quantity>time.epoch;em.opt.SDSS.u</quantity>
	[mjd_u] [float] NOT NULL,

	--/ <summary>MJD(TAI) when row 0 of g-band field was read</summary>
	--/ <quantity>time.epoch;em.opt.SDSS.g</quantity>
	[mjd_g] [float] NOT NULL,

	--/ <summary>MJD(TAI) when row 0 of r-band field was read</summary>
	--/ <quantity>time.epoch;em.opt.SDSS.r</quantity>
	[mjd_r] [float] NOT NULL,

	--/ <summary>MJD(TAI) when row 0 of i-band field was read</summary>
	--/ <quantity>time.epoch;em.opt.SDSS.i</quantity>
	[mjd_i] [float] NOT NULL,

	--/ <summary>MJD(TAI) when row 0 of z-band field was read</summary>
	--/ <quantity>time.epoch;em.opt.SDSS.z</quantity>
	[mjd_z] [float] NOT NULL,

	--/ <summary>a term in astrometry for u-band</summary>
	--/ <quantity>phot;em.opt.SDSS.u</quantity>
	[a_u] [float] NOT NULL,

	--/ <summary>a term in astrometry for g-band</summary>
	--/ <quantity>phot;em.opt.SDSS.g</quantity>
	[a_g] [float] NOT NULL,

	--/ <summary>a term in astrometry for r-band</summary>
	--/ <quantity>phot;em.opt.SDSS.r</quantity>
	[a_r] [float] NOT NULL,

	--/ <summary>a term in astrometry for i-band</summary>
	--/ <quantity>phot;em.opt.SDSS.i</quantity>
	[a_i] [float] NOT NULL,

	--/ <summary>a term in astrometry for z-band</summary>
	--/ <quantity>phot;em.opt.SDSS.z</quantity>
	[a_z] [float] NOT NULL,

	--/ <summary>b term in astrometry for u-band</summary>
	--/ <quantity>phot;em.opt.SDSS.u</quantity>
	[b_u] [float] NOT NULL,

	--/ <summary>b term in astrometry for g-band</summary>
	--/ <quantity>phot;em.opt.SDSS.g</quantity>
	[b_g] [float] NOT NULL,

	--/ <summary>b term in astrometry for r-band</summary>
	--/ <quantity>phot;em.opt.SDSS.r</quantity>
	[b_r] [float] NOT NULL,

	--/ <summary>b term in astrometry for i-band</summary>
	--/ <quantity>phot;em.opt.SDSS.i</quantity>
	[b_i] [float] NOT NULL,

	--/ <summary>b term in astrometry for z-band</summary>
	--/ <quantity>phot;em.opt.SDSS.z</quantity>
	[b_z] [float] NOT NULL,

	--/ <summary>c term in astrometry for u-band</summary>
	--/ <quantity>phot;em.opt.SDSS.i</quantity>
	[c_u] [float] NOT NULL,

	--/ <summary>c term in astrometry for g-band</summary>
	--/ <quantity>phot;em.opt.SDSS.g</quantity>
	[c_g] [float] NOT NULL,

	--/ <summary>c term in astrometry for r-band</summary>
	--/ <quantity>phot;em.opt.SDSS.r</quantity>
	[c_r] [float] NOT NULL,

	--/ <summary>c term in astrometry for i-band</summary>
	--/ <quantity>phot;em.opt.SDSS.i</quantity>
	[c_i] [float] NOT NULL,

	--/ <summary>c term in astrometry for z-band</summary>
	--/ <quantity>phot;em.opt.SDSS.z</quantity>
	[c_z] [float] NOT NULL,

	--/ <summary>d term in astrometry for u-band</summary>
	--/ <quantity>phot;em.opt.SDSS.u</quantity>
	[d_u] [float] NOT NULL,

	--/ <summary>d term in astrometry for g-band</summary>
	--/ <quantity>phot;em.opt.SDSS.g</quantity>
	[d_g] [float] NOT NULL,

	--/ <summary>d term in astrometry for r-band</summary>
	--/ <quantity>phot;em.opt.SDSS.r</quantity>
	[d_r] [float] NOT NULL,

	--/ <summary>d term in astrometry for i-band</summary>
	--/ <quantity>phot;em.opt.SDSS.i</quantity>
	[d_i] [float] NOT NULL,

	--/ <summary>d term in astrometry for z-band</summary>
	--/ <quantity>phot;em.opt.SDSS.z</quantity>
	[d_z] [float] NOT NULL,

	--/ <summary>e term in astrometry for u-band</summary>
	--/ <quantity>phot;em.opt.SDSS.u</quantity>
	[e_u] [float] NOT NULL,

	--/ <summary>e term in astrometry for g-band</summary>
	--/ <quantity>phot;em.opt.SDSS.g</quantity>
	[e_g] [float] NOT NULL,

	--/ <summary>e term in astrometry for r-band</summary>
	--/ <quantity>phot;em.opt.SDSS.r</quantity>
	[e_r] [float] NOT NULL,

	--/ <summary>e term in astrometry for i-band</summary>
	--/ <quantity>phot;em.opt.SDSS.i</quantity>
	[e_i] [float] NOT NULL,

	--/ <summary>e term in astrometry for z-band</summary>
	--/ <quantity>phot;em.opt.SDSS.z</quantity>
	[e_z] [float] NOT NULL,

	--/ <summary>f term in astrometry for u-band</summary>
	--/ <quantity>phot;em.opt.SDSS.u</quantity>
	[f_u] [float] NOT NULL,

	--/ <summary>f term in astrometry for g-band</summary>
	--/ <quantity>phot;em.opt.SDSS.g</quantity>
	[f_g] [float] NOT NULL,

	--/ <summary>f term in astrometry for r-band</summary>
	--/ <quantity>phot;em.opt.SDSS.r</quantity>
	[f_r] [float] NOT NULL,

	--/ <summary>f term in astrometry for i-band</summary>
	--/ <quantity>phot;em.opt.SDSS.i</quantity>
	[f_i] [float] NOT NULL,

	--/ <summary>f term in astrometry for z-band</summary>
	--/ <quantity>phot;em.opt.SDSS.z</quantity>
	[f_z] [float] NOT NULL,

	--/ <summary>Zero-order row distortion coefficient in u-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.u</quantity>
	[dRow0_u] [real] NOT NULL,

	--/ <summary>Zero-order row distortion coefficient in g-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.g</quantity>
	[dRow0_g] [real] NOT NULL,

	--/ <summary>Zero-order row distortion coefficient in r-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.r</quantity>
	[dRow0_r] [real] NOT NULL,

	--/ <summary>Zero-order row distortion coefficient in i-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.i</quantity>
	[dRow0_i] [real] NOT NULL,

	--/ <summary>Zero-order row distortion coefficient in z-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.z</quantity>
	[dRow0_z] [real] NOT NULL,

	--/ <summary>First-order row distortion coefficient in u-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.u</quantity>
	[dRow1_u] [real] NOT NULL,

	--/ <summary>First-order row distortion coefficient in g-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.g</quantity>
	[dRow1_g] [real] NOT NULL,

	--/ <summary>First-order row distortion coefficient in r-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.r</quantity>
	[dRow1_r] [real] NOT NULL,

	--/ <summary>First-order row distortion coefficient in i-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.i</quantity>
	[dRow1_i] [real] NOT NULL,

	--/ <summary>First-order row distortion coefficient in z-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.z</quantity>
	[dRow1_z] [real] NOT NULL,

	--/ <summary>Second-order row distortion coefficient in u-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.u</quantity>
	[dRow2_u] [real] NOT NULL,

	--/ <summary>Second-order row distortion coefficient in g-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.g</quantity>
	[dRow2_g] [real] NOT NULL,

	--/ <summary>Second-order row distortion coefficient in r-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.r</quantity>
	[dRow2_r] [real] NOT NULL,

	--/ <summary>Second-order row distortion coefficient in i-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.i</quantity>
	[dRow2_i] [real] NOT NULL,

	--/ <summary>Second-order row distortion coefficient in z-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.z</quantity>
	[dRow2_z] [real] NOT NULL,

	--/ <summary>Third-order row distortion coefficient in u-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.u</quantity>
	[dRow3_u] [real] NOT NULL,

	--/ <summary>Third-order row distortion coefficient in g-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.g</quantity>
	[dRow3_g] [real] NOT NULL,

	--/ <summary>Third-order row distortion coefficient in r-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.r</quantity>
	[dRow3_r] [real] NOT NULL,

	--/ <summary>Third-order row distortion coefficient in i-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.i</quantity>
	[dRow3_i] [real] NOT NULL,

	--/ <summary>Third-order row distortion coefficient in z-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.z</quantity>
	[dRow3_z] [real] NOT NULL,

	--/ <summary>Zero-order column distortion coefficient in u-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.u</quantity>
	[dCol0_u] [real] NOT NULL,

	--/ <summary>Zero-order column distortion coefficient in g-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.g</quantity>
	[dCol0_g] [real] NOT NULL,

	--/ <summary>Zero-order column distortion coefficient in r-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.r</quantity>
	[dCol0_r] [real] NOT NULL,

	--/ <summary>Zero-order column distortion coefficient in i-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.i</quantity>
	[dCol0_i] [real] NOT NULL,

	--/ <summary>Zero-order column distortion coefficient in z-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.z</quantity>
	[dCol0_z] [real] NOT NULL,

	--/ <summary>First-order column distortion coefficient in u-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.u</quantity>
	[dCol1_u] [real] NOT NULL,

	--/ <summary>First-order column distortion coefficient in g-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.g</quantity>
	[dCol1_g] [real] NOT NULL,

	--/ <summary>First-order column distortion coefficient in r-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.r</quantity>
	[dCol1_r] [real] NOT NULL,

	--/ <summary>First-order column distortion coefficient in i-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.i</quantity>
	[dCol1_i] [real] NOT NULL,

	--/ <summary>First-order column distortion coefficient in z-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.z</quantity>
	[dCol1_z] [real] NOT NULL,

	--/ <summary>Second-order column distortion coefficient in u-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.u</quantity>
	[dCol2_u] [real] NOT NULL,

	--/ <summary>Second-order column distortion coefficient in g-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.g</quantity>
	[dCol2_g] [real] NOT NULL,

	--/ <summary>Second-order column distortion coefficient in r-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.r</quantity>
	[dCol2_r] [real] NOT NULL,

	--/ <summary>Second-order column distortion coefficient in i-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.i</quantity>
	[dCol2_i] [real] NOT NULL,

	--/ <summary>Second-order column distortion coefficient in z-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.z</quantity>
	[dCol2_z] [real] NOT NULL,

	--/ <summary>Third-order column distortion coefficient in u-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.u</quantity>
	[dCol3_u] [real] NOT NULL,

	--/ <summary>Third-order column distortion coefficient in g-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.g</quantity>
	[dCol3_g] [real] NOT NULL,

	--/ <summary>Third-order column distortion coefficient in r-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.r</quantity>
	[dCol3_r] [real] NOT NULL,

	--/ <summary>Third-order column distortion coefficient in i-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.i</quantity>
	[dCol3_i] [real] NOT NULL,

	--/ <summary>Third-order column distortion coefficient in z-band</summary>
	--/ <quantity>obs.param;em.opt.SDSS.z</quantity>
	[dCol3_z] [real] NOT NULL,

	--/ <summary>Slope in row DCR correction for blue objects (u-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.u</quantity>
	[csRow_u] [real] NOT NULL,

	--/ <summary>Slope in row DCR correction for blue objects (g-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.g</quantity>
	[csRow_g] [real] NOT NULL,

	--/ <summary>Slope in row DCR correction for blue objects (r-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.r</quantity>
	[csRow_r] [real] NOT NULL,

	--/ <summary>Slope in row DCR correction for blue objects (i-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.i</quantity>
	[csRow_i] [real] NOT NULL,

	--/ <summary>Slope in row DCR correction for blue objects (z-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.z</quantity>
	[csRow_z] [real] NOT NULL,

	--/ <summary>Slope in column DCR correction for blue objects (u-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.u</quantity>
	[csCol_u] [real] NOT NULL,

	--/ <summary>Slope in column DCR correction for blue objects (g-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.g</quantity>
	[csCol_g] [real] NOT NULL,

	--/ <summary>Slope in column DCR correction for blue objects (r-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.r</quantity>
	[csCol_r] [real] NOT NULL,

	--/ <summary>Slope in column DCR correction for blue objects (i-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.i</quantity>
	[csCol_i] [real] NOT NULL,

	--/ <summary>Slope in column DCR correction for blue objects (z-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.z</quantity>
	[csCol_z] [real] NOT NULL,

	--/ <summary>Constant row DCR correction for blue objects (u-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.u</quantity>
	[ccRow_u] [real] NOT NULL,

	--/ <summary>Constant row DCR correction for blue objects (g-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.g</quantity>
	[ccRow_g] [real] NOT NULL,

	--/ <summary>Constant row DCR correction for blue objects (r-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.r</quantity>
	[ccRow_r] [real] NOT NULL,

	--/ <summary>Constant row DCR correction for blue objects (i-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.i</quantity>
	[ccRow_i] [real] NOT NULL,

	--/ <summary>Constant row DCR correction for blue objects (z-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.z</quantity>
	[ccRow_z] [real] NOT NULL,

	--/ <summary>Constant column DCR correction for blue objects (u-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.u</quantity>
	[ccCol_u] [real] NOT NULL,

	--/ <summary>Constant column DCR correction for blue objects (g-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.g</quantity>
	[ccCol_g] [real] NOT NULL,

	--/ <summary>Constant column DCR correction for blue objects (r-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.r</quantity>
	[ccCol_r] [real] NOT NULL,

	--/ <summary>Constant column DCR correction for blue objects (i-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.i</quantity>
	[ccCol_i] [real] NOT NULL,

	--/ <summary>Constant column DCR correction for blue objects (z-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.z</quantity>
	[ccCol_z] [real] NOT NULL,

	--/ <summary>r-i cutoff between blue and red objects (for u-band astrometry)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.u</quantity>
	[riCut_u] [real] NOT NULL,

	--/ <summary>r-i cutoff between blue and red objects (for g-band astrometry)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.g</quantity>
	[riCut_g] [real] NOT NULL,

	--/ <summary>r-i cutoff between blue and red objects (for r-band astrometry)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.r</quantity>
	[riCut_r] [real] NOT NULL,

	--/ <summary>r-i cutoff between blue and red objects (for i-band astrometry)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.i</quantity>
	[riCut_i] [real] NOT NULL,

	--/ <summary>r-i cutoff between blue and red objects (for z-band astrometry)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.z</quantity>
	[riCut_z] [real] NOT NULL,

	--/ <summary>Airmass for star at frame center (midway through u-band exposure)</summary>
	--/ <quantity>obs.ariMass;em.opt.SDSS.u</quantity>
	--/ <unit>mag</unit>
	[airmass_u] [real] NOT NULL,

	--/ <summary>Airmass for star at frame center (midway through g-band exposure)</summary>
	--/ <quantity>obs.ariMass;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[airmass_g] [real] NOT NULL,

	--/ <summary>Airmass for star at frame center (midway through r-band exposure)</summary>
	--/ <quantity>obs.ariMass;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[airmass_r] [real] NOT NULL,

	--/ <summary>Airmass for star at frame center (midway through i-band exposure)</summary>
	--/ <quantity>obs.ariMass;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[airmass_i] [real] NOT NULL,

	--/ <summary>Airmass for star at frame center (midway through z-band exposure)</summary>
	--/ <quantity>obs.ariMass;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[airmass_z] [real] NOT NULL,

	--/ <summary>Error in mu in astrometric calibration (for u-band)</summary>
	--/ <quantity>stat.error;obs.calib;em.opt.SDSS.u</quantity>
	--/ <unit>arcsec</unit>
	[muErr_u] [real] NOT NULL,

	--/ <summary>Error in mu in astrometric calibration (for g-band)</summary>
	--/ <quantity>stat.error;obs.calib;em.opt.SDSS.g</quantity>
	--/ <unit>arcsec</unit>
	[muErr_g] [real] NOT NULL,

	--/ <summary>Error in mu in astrometric calibration (for r-band)</summary>
	--/ <quantity>stat.error;obs.calib;em.opt.SDSS.r</quantity>
	--/ <unit>arcsec</unit>
	[muErr_r] [real] NOT NULL,

	--/ <summary>Error in mu in astrometric calibration (for i-band)</summary>
	--/ <quantity>stat.error;obs.calib;em.opt.SDSS.i</quantity>
	--/ <unit>arcsec</unit>
	[muErr_i] [real] NOT NULL,

	--/ <summary>Error in mu in astrometric calibration (for z-band)</summary>
	--/ <quantity>stat.error;obs.calib;em.opt.SDSS.z</quantity>
	--/ <unit>arcsec</unit>
	[muErr_z] [real] NOT NULL,

	--/ <summary>Error in nu in astrometric calibration (for u-band)</summary>
	--/ <quantity>stat.error;obs.calib;em.opt.SDSS.u</quantity>
	--/ <unit>arcsec</unit>
	[nuErr_u] [real] NOT NULL,

	--/ <summary>Error in nu in astrometric calibration (for g-band)</summary>
	--/ <quantity>stat.error;obs.calib;em.opt.SDSS.g</quantity>
	--/ <unit>arcsec</unit>
	[nuErr_g] [real] NOT NULL,

	--/ <summary>Error in nu in astrometric calibration (for r-band)</summary>
	--/ <quantity>stat.error;obs.calib;em.opt.SDSS.r</quantity>
	--/ <unit>arcsec</unit>
	[nuErr_r] [real] NOT NULL,

	--/ <summary>Error in nu in astrometric calibration (for i-band)</summary>
	--/ <quantity>stat.error;obs.calib;em.opt.SDSS.i</quantity>
	--/ <unit>arcsec</unit>
	[nuErr_i] [real] NOT NULL,

	--/ <summary>Error in nu in astrometric calibration (for z-band)</summary>
	--/ <quantity>stat.error;obs.calib;em.opt.SDSS.z</quantity>
	--/ <unit>arcsec</unit>
	[nuErr_z] [real] NOT NULL,

	--/ <summary>Center RA of field</summary>
	--/ <quantity>pos.eq.ra;obs.field</quantity>
	--/ <unit>deg</unit>
	[ra] [float] NOT NULL,

	--/ <summary>Center Dec of field</summary>
	--/ <quantity>pos.eq.dec;obs.field</quantity>
	--/ <unit>deg</unit>
	[dec] [float] NOT NULL,

	--/ <summary>Minimum RA of field</summary>
	--/ <quantity>pos.eq.ra;obs.field;stat.min</quantity>
	--/ <unit>deg</unit>
	[raMin] [float] NOT NULL,

	--/ <summary>Maximum RA of field</summary>
	--/ <quantity>pos.eq.ra;obs.field;stat.max</quantity>
	--/ <unit>deg</unit>
	[raMax] [float] NOT NULL,

	--/ <summary>Minimum Dec of field</summary>
	--/ <quantity>pos.eq.dec;obs.field;stat.min</quantity>
	--/ <unit>deg</unit>
	[decMin] [float] NOT NULL,

	--/ <summary>Maximum Dec of field</summary>
	--/ <quantity>pos.eq.dec;obs.field;stat.max</quantity>
	--/ <unit>deg</unit>
	[decMax] [float] NOT NULL,

	--/ <summary>Mean size of pixel (r-band)</summary>
	--/ <quantity>phys.angSize;instr.pixel</quantity>
	--/ <unit>arcsec pix-1</unit>
	[pixScale] [float] NOT NULL,

	--/ <summary>Area covered by primary part of field</summary>
	--/ <quantity>phys.angSize.area</quantity>
	--/ <unit>deg+2</unit>
	[primaryArea] [float] NOT NULL,

	--/ <summary>Frames processing status bitmask</summary>
	--/ <quantity>meta.code.status</quantity>
	[photoStatus] [int] NOT NULL,

	--/ <summary>Offset to add to transformed row coordinates (u-band)</summary>
	--/ <quantity>instr.offset;em.opt.SDSS.u</quantity>
	--/ <unit>pix</unit>
	[rowOffset_u] [real] NOT NULL,

	--/ <summary>Offset to add to transformed row coordinates (g-band)</summary>
	--/ <quantity>instr.offset;em.opt.SDSS.g</quantity>
	--/ <unit>pix</unit>
	[rowOffset_g] [real] NOT NULL,

	--/ <summary>Offset to add to transformed row coordinates (r-band)</summary>
	--/ <quantity>instr.offset;em.opt.SDSS.r</quantity>
	--/ <unit>pix</unit>
	[rowOffset_r] [real] NOT NULL,

	--/ <summary>Offset to add to transformed row coordinates (i-band)</summary>
	--/ <quantity>instr.offset;em.opt.SDSS.i</quantity>
	--/ <unit>pix</unit>
	[rowOffset_i] [real] NOT NULL,

	--/ <summary>Offset to add to transformed row coordinates (z-band)</summary>
	--/ <quantity>instr.offset;em.opt.SDSS.z</quantity>
	--/ <unit>pix</unit>
	[rowOffset_z] [real] NOT NULL,

	--/ <summary>Offset to add to transformed row coordinates (u-band)</summary>
	--/ <quantity>instr.offset;em.opt.SDSS.u</quantity>
	--/ <unit>pix</unit>
	[colOffset_u] [real] NOT NULL,

	--/ <summary>Offset to add to transformed row coordinates (g-band)</summary>
	--/ <quantity>instr.offset;em.opt.SDSS.g</quantity>
	--/ <unit>pix</unit>
	[colOffset_g] [real] NOT NULL,

	--/ <summary>Offset to add to transformed row coordinates (r-band)</summary>
	--/ <quantity>instr.offset;em.opt.SDSS.r</quantity>
	--/ <unit>pix</unit>
	[colOffset_r] [real] NOT NULL,

	--/ <summary>Offset to add to transformed row coordinates (i-band)</summary>
	--/ <quantity>instr.offset;em.opt.SDSS.i</quantity>
	--/ <unit>pix</unit>
	[colOffset_i] [real] NOT NULL,

	--/ <summary>Offset to add to transformed row coordinates (z-band)</summary>
	--/ <quantity>instr.offset;em.opt.SDSS.z</quantity>
	--/ <unit>pix</unit>
	[colOffset_z] [real] NOT NULL,

	--/ <summary>Saturation level in u-band</summary>
	--/ <quantity>instr.saturation;em.opt.SDSS.u</quantity>
	--/ <unit>count</unit>
	[saturationLevel_u] [int] NOT NULL,

	--/ <summary>Saturation level in g-band</summary>
	--/ <quantity>instr.saturation;em.opt.SDSS.g</quantity>
	--/ <unit>count</unit>
	[saturationLevel_g] [int] NOT NULL,

	--/ <summary>Saturation level in r-band</summary>
	--/ <quantity>instr.saturation;em.opt.SDSS.r</quantity>
	--/ <unit>count</unit>
	[saturationLevel_r] [int] NOT NULL,

	--/ <summary>Saturation level in i-band</summary>
	--/ <quantity>instr.saturation;em.opt.SDSS.i</quantity>
	--/ <unit>count</unit>
	[saturationLevel_i] [int] NOT NULL,

	--/ <summary>Saturation level in z-band</summary>
	--/ <quantity>instr.saturation;em.opt.SDSS.z</quantity>
	--/ <unit>count</unit>
	[saturationLevel_z] [int] NOT NULL,

	--/ <summary>Effective area of PSF (u-band)</summary>
	--/ <quantity>phys.size.area;phot.mag.psf;em.opt.SDSS.u</quantity>
	--/ <unit>pix</unit>
	[nEffPsf_u] [real] NOT NULL,

	--/ <summary>Effective area of PSF (g-band)</summary>
	--/ <quantity>phys.size.area;phot.mag.psf;em.opt.SDSS.g</quantity>
	--/ <unit>pix</unit>
	[nEffPsf_g] [real] NOT NULL,

	--/ <summary>Effective area of PSF (r-band)</summary>
	--/ <quantity>phys.size.area;phot.mag.psf;em.opt.SDSS.r</quantity>
	--/ <unit>pix</unit>
	[nEffPsf_r] [real] NOT NULL,

	--/ <summary>Effective area of PSF (i-band)</summary>
	--/ <quantity>phys.size.area;phot.mag.psf;em.opt.SDSS.i</quantity>
	--/ <unit>pix</unit>
	[nEffPsf_i] [real] NOT NULL,

	--/ <summary>Effective area of PSF (z-band)</summary>
	--/ <quantity>phys.size.area;phot.mag.psf;em.opt.SDSS.z</quantity>
	--/ <unit>pix</unit>
	[nEffPsf_z] [real] NOT NULL,

	--/ <summary>Sky estimate from PSP (u-band)</summary>
	--/ <quantity>instr.skyLevel;em.opt.SDSS.u</quantity>
	--/ <unit>nmgy arcsec-2</unit>
	[skyPsp_u] [real] NOT NULL,

	--/ <summary>Sky estimate from PSP (g-band)</summary>
	--/ <quantity>instr.skyLevel;em.opt.SDSS.g</quantity>
	--/ <unit>nmgy arcsec-2</unit>
	[skyPsp_g] [real] NOT NULL,

	--/ <summary>Sky estimate from PSP (r-band)</summary>
	--/ <quantity>instr.skyLevel;em.opt.SDSS.r</quantity>
	--/ <unit>nmgy arcsec-2</unit>
	[skyPsp_r] [real] NOT NULL,

	--/ <summary>Sky estimate from PSP (i-band)</summary>
	--/ <quantity>instr.skyLevel;em.opt.SDSS.i</quantity>
	--/ <unit>nmgy arcsec-2</unit>
	[skyPsp_i] [real] NOT NULL,

	--/ <summary>Sky estimate from PSP (z-band)</summary>
	--/ <quantity>instr.skyLevel;em.opt.SDSS.z</quantity>
	--/ <unit>nmgy arcsec-2</unit>
	[skyPsp_z] [real] NOT NULL,

	--/ <summary>Frames sky value</summary>
	--/ <quantity>instr.skyLevel;em.opt.SDSS.u</quantity>
	--/ <unit>nmgy arcsec-2</unit>
	[skyFrames_u] [real] NOT NULL,

	--/ <summary>Frames sky value</summary>
	--/ <quantity>instr.skyLevel;em.opt.SDSS.g</quantity>
	--/ <unit>nmgy arcsec-2</unit>
	[skyFrames_g] [real] NOT NULL,

	--/ <summary>Frames sky value</summary>
	--/ <quantity>instr.skyLevel;em.opt.SDSS.r</quantity>
	--/ <unit>nmgy arcsec-2</unit>
	[skyFrames_r] [real] NOT NULL,

	--/ <summary>Frames sky value</summary>
	--/ <quantity>instr.skyLevel;em.opt.SDSS.i</quantity>
	--/ <unit>nmgy arcsec-2</unit>
	[skyFrames_i] [real] NOT NULL,

	--/ <summary>Frames sky value</summary>
	--/ <quantity>instr.skyLevel;em.opt.SDSS.z</quantity>
	--/ <unit>nmgy arcsec-2</unit>
	[skyFrames_z] [real] NOT NULL,

	--/ <summary>Frames sky value after object subtraction</summary>
	--/ <quantity>instr.skyLevel;em.opt.SDSS.u</quantity>
	--/ <unit>nmgy arcsec-2</unit>
	[skyFramesSub_u] [real] NOT NULL,

	--/ <summary>Frames sky value after object subtraction</summary>
	--/ <quantity>instr.skyLevel;em.opt.SDSS.g</quantity>
	--/ <unit>nmgy arcsec-2</unit>
	[skyFramesSub_g] [real] NOT NULL,

	--/ <summary>Frames sky value after object subtraction</summary>
	--/ <quantity>instr.skyLevel;em.opt.SDSS.r</quantity>
	--/ <unit>nmgy arcsec-2</unit>
	[skyFramesSub_r] [real] NOT NULL,

	--/ <summary>Frames sky value after object subtraction</summary>
	--/ <quantity>instr.skyLevel;em.opt.SDSS.i</quantity>
	--/ <unit>nmgy arcsec-2</unit>
	[skyFramesSub_i] [real] NOT NULL,

	--/ <summary>Frames sky value after object subtraction</summary>
	--/ <quantity>instr.skyLevel;em.opt.SDSS.z</quantity>
	--/ <unit>nmgy arcsec-2</unit>
	[skyFramesSub_z] [real] NOT NULL,

	--/ <summary>Sigma of pixel values in u-band frame (clipped)</summary>
	--/ <quantity>instr.param;em.opt.SDSS.u</quantity>
	--/ <unit>nmgy arcsec-2</unit>
	[sigPix_u] [real] NOT NULL,

	--/ <summary>Sigma of pixel values in g-band frame (clipped)</summary>
	--/ <quantity>instr.param;em.opt.SDSS.g</quantity>
	--/ <unit>nmgy arcsec-2</unit>
	[sigPix_g] [real] NOT NULL,

	--/ <summary>Sigma of pixel values in r-band frame (clipped)</summary>
	--/ <quantity>instr.param;em.opt.SDSS.r</quantity>
	--/ <unit>nmgy arcsec-2</unit>
	[sigPix_r] [real] NOT NULL,

	--/ <summary>Sigma of pixel values in i-band frame (clipped)</summary>
	--/ <quantity>instr.param;em.opt.SDSS.i</quantity>
	--/ <unit>nmgy arcsec-2</unit>
	[sigPix_i] [real] NOT NULL,

	--/ <summary>Sigma of pixel values in z-band frame (clipped)</summary>
	--/ <quantity>instr.param;em.opt.SDSS.z</quantity>
	--/ <unit>nmgy arcsec-2</unit>
	[sigPix_z] [real] NOT NULL,

	--/ <summary>deV aperture correction (u-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.u</quantity>
	[devApCorrection_u] [real] NOT NULL,

	--/ <summary>deV aperture correction (g-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.g</quantity>
	[devApCorrection_g] [real] NOT NULL,

	--/ <summary>deV aperture correction (r-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.r</quantity>
	[devApCorrection_r] [real] NOT NULL,

	--/ <summary>deV aperture correction (i-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.i</quantity>
	[devApCorrection_i] [real] NOT NULL,

	--/ <summary>deV aperture correction (z-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.z</quantity>
	[devApCorrection_z] [real] NOT NULL,

	--/ <summary>Error in deV aperture correction (u-band)</summary>
	--/ <quantity>stat.error;obs.param;em.opt.SDSS.u</quantity>
	[devApCorrectionErr_u] [real] NOT NULL,

	--/ <summary>Error in deV aperture correction (g-band)</summary>
	--/ <quantity>stat.error;obs.param;em.opt.SDSS.g</quantity>
	[devApCorrectionErr_g] [real] NOT NULL,

	--/ <summary>Error in deV aperture correction (r-band)</summary>
	--/ <quantity>stat.error;obs.param;em.opt.SDSS.r</quantity>
	[devApCorrectionErr_r] [real] NOT NULL,

	--/ <summary>Error in deV aperture correction (i-band)</summary>
	--/ <quantity>stat.error;obs.param;em.opt.SDSS.i</quantity>
	[devApCorrectionErr_i] [real] NOT NULL,

	--/ <summary>Error in deV aperture correction (z-band)</summary>
	--/ <quantity>stat.error;obs.param;em.opt.SDSS.z</quantity>
	[devApCorrectionErr_z] [real] NOT NULL,

	--/ <summary>exponential aperture correction (u-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.u</quantity>
	[expApCorrection_u] [real] NOT NULL,

	--/ <summary>exponential aperture correction (g-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.g</quantity>
	[expApCorrection_g] [real] NOT NULL,

	--/ <summary>exponential aperture correction (r-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.r</quantity>
	[expApCorrection_r] [real] NOT NULL,

	--/ <summary>exponential aperture correction (i-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.i</quantity>
	[expApCorrection_i] [real] NOT NULL,

	--/ <summary>exponential aperture correction (z-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.z</quantity>
	[expApCorrection_z] [real] NOT NULL,

	--/ <summary>Error in exponential aperture correction (u-band)</summary>
	--/ <quantity>stat.error;obs.param;em.opt.SDSS.u</quantity>
	[expApCorrectionErr_u] [real] NOT NULL,

	--/ <summary>Error in exponential aperture correction (g-band)</summary>
	--/ <quantity>stat.error;obs.param;em.opt.SDSS.g</quantity>
	[expApCorrectionErr_g] [real] NOT NULL,

	--/ <summary>Error in exponential aperture correction (r-band)</summary>
	--/ <quantity>stat.error;obs.param;em.opt.SDSS.r</quantity>
	[expApCorrectionErr_r] [real] NOT NULL,

	--/ <summary>Error in exponential aperture correction (i-band)</summary>
	--/ <quantity>stat.error;obs.param;em.opt.SDSS.i</quantity>
	[expApCorrectionErr_i] [real] NOT NULL,

	--/ <summary>Error in exponential aperture correction (z-band)</summary>
	--/ <quantity>stat.error;obs.param;em.opt.SDSS.z</quantity>
	[expApCorrectionErr_z] [real] NOT NULL,

	--/ <summary>model aperture correction, for deV case (u-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.u</quantity>
	[devModelApCorrection_u] [real] NOT NULL,

	--/ <summary>model aperture correction, for deV case (g-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.g</quantity>
	[devModelApCorrection_g] [real] NOT NULL,

	--/ <summary>model aperture correction, for deV case (r-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.r</quantity>
	[devModelApCorrection_r] [real] NOT NULL,

	--/ <summary>model aperture correction, for deV case (i-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.i</quantity>
	[devModelApCorrection_i] [real] NOT NULL,

	--/ <summary>model aperture correction, for deV case (z-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.z</quantity>
	[devModelApCorrection_z] [real] NOT NULL,

	--/ <summary>Error in model aperture correction, for deV case (u-band)</summary>
	--/ <quantity>stat.error;obs.param;em.opt.SDSS.u</quantity>
	[devModelApCorrectionErr_u] [real] NOT NULL,

	--/ <summary>Error in model aperture correction, for deV case (g-band)</summary>
	--/ <quantity>stat.error;obs.param;em.opt.SDSS.g</quantity>
	[devModelApCorrectionErr_g] [real] NOT NULL,

	--/ <summary>Error in model aperture correction, for deV case (r-band)</summary>
	--/ <quantity>stat.error;obs.param;em.opt.SDSS.r</quantity>
	[devModelApCorrectionErr_r] [real] NOT NULL,

	--/ <summary>Error in model aperture correction, for deV case (i-band)</summary>
	--/ <quantity>stat.error;obs.param;em.opt.SDSS.i</quantity>
	[devModelApCorrectionErr_i] [real] NOT NULL,

	--/ <summary>Error in model aperture correction, for deV case (z-band)</summary>
	--/ <quantity>stat.error;obs.param;em.opt.SDSS.z</quantity>
	[devModelApCorrectionErr_z] [real] NOT NULL,

	--/ <summary>model aperture correction, for exponential case (u-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.u</quantity>
	[expModelApCorrection_u] [real] NOT NULL,

	--/ <summary>model aperture correction, for exponential case (g-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.g</quantity>
	[expModelApCorrection_g] [real] NOT NULL,

	--/ <summary>model aperture correction, for exponential case (r-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.r</quantity>
	[expModelApCorrection_r] [real] NOT NULL,

	--/ <summary>model aperture correction, for exponential case (i-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.i</quantity>
	[expModelApCorrection_i] [real] NOT NULL,

	--/ <summary>model aperture correction, for exponential case (z-band)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.z</quantity>
	[expModelApCorrection_z] [real] NOT NULL,

	--/ <summary>Error in model aperture correction, for exponential case (u-band)</summary>
	--/ <quantity>stat.error;obs.param;em.opt.SDSS.u</quantity>
	[expModelApCorrectionErr_u] [real] NOT NULL,

	--/ <summary>Error in model aperture correction, for exponential case (g-band)</summary>
	--/ <quantity>stat.error;obs.param;em.opt.SDSS.g</quantity>
	[expModelApCorrectionErr_g] [real] NOT NULL,

	--/ <summary>Error in model aperture correction, for exponential case (r-band)</summary>
	--/ <quantity>stat.error;obs.param;em.opt.SDSS.r</quantity>
	[expModelApCorrectionErr_r] [real] NOT NULL,

	--/ <summary>Error in model aperture correction, for exponential case (i-band)</summary>
	--/ <quantity>stat.error;obs.param;em.opt.SDSS.i</quantity>
	[expModelApCorrectionErr_i] [real] NOT NULL,

	--/ <summary>Error in model aperture correction, for exponential case (z-band)</summary>
	--/ <quantity>stat.error;obs.param;em.opt.SDSS.z</quantity>
	[expModelApCorrectionErr_z] [real] NOT NULL,

	--/ <summary>Median fiber magnitude of objects (u-band)</summary>
	--/ <quantity>phot.mag.fiber;stat.median;em.opt.SDSS.u</quantity>
	[medianFiberColor_u] [real] NOT NULL,

	--/ <summary>Median fiber magnitude of objects (g-band)</summary>
	--/ <quantity>phot.mag.fiber;stat.median;em.opt.SDSS.g</quantity>
	[medianFiberColor_g] [real] NOT NULL,

	--/ <summary>Median fiber magnitude of objects (r-band)</summary>
	--/ <quantity>phot.mag.fiber;stat.median;em.opt.SDSS.r</quantity>
	[medianFiberColor_r] [real] NOT NULL,

	--/ <summary>Median fiber magnitude of objects (i-band)</summary>
	--/ <quantity>phot.mag.fiber;stat.median;em.opt.SDSS.i</quantity>
	[medianFiberColor_i] [real] NOT NULL,

	--/ <summary>Median fiber magnitude of objects (z-band)</summary>
	--/ <quantity>phot.mag.fiber;stat.median;em.opt.SDSS.z</quantity>
	[medianFiberColor_z] [real] NOT NULL,

	--/ <summary>Median PSF magnitude of objects (u-band)</summary>
	--/ <quantity>phot.mag.psf;stat.median;em.opt.SDSS.u</quantity>
	[medianPsfColor_u] [real] NOT NULL,

	--/ <summary>Median PSF magnitude of objects (g-band)</summary>
	--/ <quantity>phot.mag.psf;stat.median;em.opt.SDSS.g</quantity>
	[medianPsfColor_g] [real] NOT NULL,

	--/ <summary>Median PSF magnitude of objects (r-band)</summary>
	--/ <quantity>phot.mag.psf;stat.median;em.opt.SDSS.r</quantity>
	[medianPsfColor_r] [real] NOT NULL,

	--/ <summary>Median PSF magnitude of objects (i-band)</summary>
	--/ <quantity>phot.mag.psf;stat.median;em.opt.SDSS.i</quantity>
	[medianPsfColor_i] [real] NOT NULL,

	--/ <summary>Median PSF magnitude of objects (z-band)</summary>
	--/ <quantity>phot.mag.psf;stat.median;em.opt.SDSS.z</quantity>
	[medianPsfColor_z] [real] NOT NULL,

	--/ <summary>Means Stokes Q parameter in u-band frame</summary>
	--/ <quantity>phys.polarization.stokes;stat.mean;em.opt.SDSS.u</quantity>
	[q_u] [real] NOT NULL,

	--/ <summary>Means Stokes Q parameter in g-band frame</summary>
	--/ <quantity>phys.polarization.stokes;stat.mean;em.opt.SDSS.g</quantity>
	[q_g] [real] NOT NULL,

	--/ <summary>Means Stokes Q parameter in r-band frame</summary>
	--/ <quantity>phys.polarization.stokes;stat.mean;em.opt.SDSS.r</quantity>
	[q_r] [real] NOT NULL,

	--/ <summary>Means Stokes Q parameter in i-band frame</summary>
	--/ <quantity>phys.polarization.stokes;stat.mean;em.opt.SDSS.i</quantity>
	[q_i] [real] NOT NULL,

	--/ <summary>Means Stokes Q parameter in z-band frame</summary>
	--/ <quantity>phys.polarization.stokes;stat.mean;em.opt.SDSS.z</quantity>
	[q_z] [real] NOT NULL,

	--/ <summary>Means Stokes U parameter in u-band frame</summary>
	--/ <quantity>phys.polarization.stokes;stat.mean;em.opt.SDSS.u</quantity>
	[u_u] [real] NOT NULL,

	--/ <summary>Means Stokes U parameter in g-band frame</summary>
	--/ <quantity>phys.polarization.stokes;stat.mean;em.opt.SDSS.g</quantity>
	[u_g] [real] NOT NULL,

	--/ <summary>Means Stokes U parameter in r-band frame</summary>
	--/ <quantity>phys.polarization.stokes;stat.mean;em.opt.SDSS.r</quantity>
	[u_r] [real] NOT NULL,

	--/ <summary>Means Stokes U parameter in i-band frame</summary>
	--/ <quantity>phys.polarization.stokes;stat.mean;em.opt.SDSS.u</quantity>
	[u_i] [real] NOT NULL,

	--/ <summary>Means Stokes U parameter in z-band frame</summary>
	--/ <quantity>phys.polarization.stokes;stat.mean;em.opt.SDSS.z</quantity>
	[u_z] [real] NOT NULL,

	--/ <summary>Maximum value of PSP (Postage Stamp Pipeline) status over all 5 filters</summary>
	--/ <quantity>meta.code.status;stat.max</quantity>
	[pspStatus] [smallint] NOT NULL,

	--/ <summary>PSP estimate of sky in u-band</summary>
	--/ <quantity>meta.code.status;em.opt.SDSS.u</quantity>
	--/ <unit>nmgy arcsec-2</unit>
	[sky_u] [real] NOT NULL,

	--/ <summary>PSP estimate of sky in g-band</summary>
	--/ <quantity>meta.code.status;em.opt.SDSS.g</quantity>
	--/ <unit>nmgy arcsec-2</unit>
	[sky_g] [real] NOT NULL,

	--/ <summary>PSP estimate of sky in r-band</summary>
	--/ <quantity>meta.code.status;em.opt.SDSS.r</quantity>
	--/ <unit>nmgy arcsec-2</unit>
	[sky_r] [real] NOT NULL,

	--/ <summary>PSP estimate of sky in i-band</summary>
	--/ <quantity>meta.code.status;em.opt.SDSS.i</quantity>
	--/ <unit>nmgy arcsec-2</unit>
	[sky_i] [real] NOT NULL,

	--/ <summary>PSP estimate of sky in z-band</summary>
	--/ <quantity>meta.code.status;em.opt.SDSS.z</quantity>
	--/ <unit>nmgy arcsec-2</unit>
	[sky_z] [real] NOT NULL,

	--/ <summary>Fractional Sigma of Sky Value Distribution, expressed as magnitude. Sky noise = skySig * sky * ln(10)/2.5</summary>
	--/ <quantity>instr.det.noise;em.opt.SDSS.u</quantity>
	--/ <unit>mag</unit>
	[skySig_u] [real] NOT NULL,

	--/ <summary>Fractional Sigma of Sky Value Distribution, expressed as magnitude. Sky noise = skySig * sky * ln(10)/2.5</summary>
	--/ <quantity>instr.det.noise;em.opt.SDSSg</quantity>
	--/ <unit>mag</unit>
	[skySig_g] [real] NOT NULL,

	--/ <summary>Fractional Sigma of Sky Value Distribution, expressed as magnitude. Sky noise = skySig * sky * ln(10)/2.5</summary>
	--/ <quantity>instr.det.noise;em.opt.SDSSr</quantity>
	--/ <unit>mag</unit>
	[skySig_r] [real] NOT NULL,

	--/ <summary>Fractional Sigma of Sky Value Distribution, expressed as magnitude. Sky noise = skySig * sky * ln(10)/2.5</summary>
	--/ <quantity>instr.det.noise;em.opt.SDSSi</quantity>
	--/ <unit>mag</unit>
	[skySig_i] [real] NOT NULL,

	--/ <summary>Fractional Sigma of Sky Value Distribution, expressed as magnitude. Sky noise = skySig * sky * ln(10)/2.5</summary>
	--/ <quantity>instr.det.noise;em.opt.SDSSz</quantity>
	--/ <unit>mag</unit>
	[skySig_z] [real] NOT NULL,

	--/ <summary>Error in PSP estimate of sky in u-band</summary>
	--/ <quantity>stat.error;meta.code.status;em.opt.SDSS.u</quantity>
	--/ <unit>nmgy arcsec-2</unit>
	[skyErr_u] [real] NOT NULL,

	--/ <summary>Error in PSP estimate of sky in g-band</summary>
	--/ <quantity>stat.error;meta.code.status;em.opt.SDSS.g</quantity>
	--/ <unit>nmgy arcsec-2</unit>
	[skyErr_g] [real] NOT NULL,

	--/ <summary>Error in PSP estimate of sky in r-band</summary>
	--/ <quantity>stat.error;meta.code.status;em.opt.SDSS.r</quantity>
	--/ <unit>nmgy arcsec-2</unit>
	[skyErr_r] [real] NOT NULL,

	--/ <summary>Error in PSP estimate of sky in i-band</summary>
	--/ <quantity>stat.error;meta.code.status;em.opt.SDSS.i</quantity>
	--/ <unit>nmgy arcsec-2</unit>
	[skyErr_i] [real] NOT NULL,

	--/ <summary>Error in PSP estimate of sky in z-band</summary>
	--/ <quantity>stat.error;meta.code.status;em.opt.SDSS.z</quantity>
	--/ <unit>nmgy arcsec-2</unit>
	[skyErr_z] [real] NOT NULL,

	--/ <summary>Rate of change in sky value along columns (u-band)</summary>
	--/ <quantity>instr.skyLevel;em.opt.SDSS.u</quantity>
	--/ <unit>nmgy arcsec-2 field-1</unit>
	[skySlope_u] [real] NOT NULL,

	--/ <summary>Rate of change in sky value along columns (g-band)</summary>
	--/ <quantity>instr.skyLevel;em.opt.SDSS.g</quantity>
	--/ <unit>nmgy arcsec-2 field-1</unit>
	[skySlope_g] [real] NOT NULL,

	--/ <summary>Rate of change in sky value along columns (r-band)</summary>
	--/ <quantity>instr.skyLevel;em.opt.SDSS.r</quantity>
	--/ <unit>nmgy arcsec-2 field-1</unit>
	[skySlope_r] [real] NOT NULL,

	--/ <summary>Rate of change in sky value along columns (i-band)</summary>
	--/ <quantity>instr.skyLevel;em.opt.SDSS.i</quantity>
	--/ <unit>nmgy arcsec-2 field-1</unit>
	[skySlope_i] [real] NOT NULL,

	--/ <summary>Rate of change in sky value along columns (z-band)</summary>
	--/ <quantity>instr.skyLevel;em.opt.SDSS.z</quantity>
	--/ <unit>nmgy arcsec-2 field-1</unit>
	[skySlope_z] [real] NOT NULL,

	--/ <summary>Left-hand amplifier bias level (u-band)		XXX make sure to apply DSCALE, counts or ADU?</summary>
	--/ <quantity>instr.param;em.opt.SDSS.u</quantity>
	--/ <unit>adu</unit>
	[lbias_u] [real] NOT NULL,

	--/ <summary>Left-hand amplifier bias level (g-band)</summary>
	--/ <quantity>instr.param;em.opt.SDSS.g</quantity>
	--/ <unit>adu</unit>
	[lbias_g] [real] NOT NULL,

	--/ <summary>Left-hand amplifier bias level (r-band)</summary>
	--/ <quantity>instr.param;em.opt.SDSS.r</quantity>
	--/ <unit>adu</unit>
	[lbias_r] [real] NOT NULL,

	--/ <summary>Left-hand amplifier bias level (i-band)</summary>
	--/ <quantity>instr.param;em.opt.SDSS.i</quantity>
	--/ <unit>adu</unit>
	[lbias_i] [real] NOT NULL,

	--/ <summary>Left-hand amplifier bias level (z-band)</summary>
	--/ <quantity>instr.param;em.opt.SDSS.z</quantity>
	--/ <unit>adu</unit>
	[lbias_z] [real] NOT NULL,

	--/ <summary>Right-hand amplifier bias level (u-band)</summary>
	--/ <quantity>instr.param;em.opt.SDSS.u</quantity>
	--/ <unit>adu</unit>
	[rbias_u] [real] NOT NULL,

	--/ <summary>Right-hand amplifier bias level (g-band)</summary>
	--/ <quantity>instr.param;em.opt.SDSS.g</quantity>
	--/ <unit>adu</unit>
	[rbias_g] [real] NOT NULL,

	--/ <summary>Right-hand amplifier bias level (r-band)</summary>
	--/ <quantity>instr.param;em.opt.SDSS.r</quantity>
	--/ <unit>adu</unit>
	[rbias_r] [real] NOT NULL,

	--/ <summary>Right-hand amplifier bias level (i-band)</summary>
	--/ <quantity>instr.param;em.opt.SDSS.i</quantity>
	--/ <unit>adu</unit>
	[rbias_i] [real] NOT NULL,

	--/ <summary>Right-hand amplifier bias level (z-band)</summary>
	--/ <quantity>instr.param;em.opt.SDSS.z</quantity>
	--/ <unit>adu</unit>
	[rbias_z] [real] NOT NULL,

	--/ <summary>Number of bins in PSF profile (in fieldProfile table)</summary>
	--/ <quantity>meta.number;em.opt.SDSS.u</quantity>
	[nProf_u] [int] NOT NULL,

	--/ <summary>Number of bins in PSF profile (in fieldProfile table)</summary>
	--/ <quantity>meta.number;em.opt.SDSS.g</quantity>
	[nProf_g] [int] NOT NULL,

	--/ <summary>Number of bins in PSF profile (in fieldProfile table)</summary>
	--/ <quantity>meta.numberf;em.opt.SDSS.r</quantity>
	[nProf_r] [int] NOT NULL,

	--/ <summary>Number of bins in PSF profile (in fieldProfile table)</summary>
	--/ <quantity>meta.number;em.opt.SDSS.i</quantity>
	[nProf_i] [int] NOT NULL,

	--/ <summary>Number of bins in PSF profile (in fieldProfile table)</summary>
	--/ <quantity>meta.number;em.opt.SDSS.z</quantity>
	[nProf_z] [int] NOT NULL,

	--/ <summary>Number of stars used in PSF measurement (u-band)</summary>
	--/ <quantity>meta.number;em.opt.SDSS.u</quantity>
	[psfNStar_u] [int] NOT NULL,

	--/ <summary>Number of stars used in PSF measurement (g-band)</summary>
	--/ <quantity>meta.number;em.opt.SDSS.g</quantity>
	[psfNStar_g] [int] NOT NULL,

	--/ <summary>Number of stars used in PSF measurement (r-band)</summary>
	--/ <quantity>meta.number;em.opt.SDSS.r</quantity>
	[psfNStar_r] [int] NOT NULL,

	--/ <summary>Number of stars used in PSF measurement (i-band)</summary>
	--/ <quantity>meta.number;em.opt.SDSS.i</quantity>
	[psfNStar_i] [int] NOT NULL,

	--/ <summary>Number of stars used in PSF measurement (z-band)</summary>
	--/ <quantity>meta.number;em.opt.SDSS.z</quantity>
	[psfNStar_z] [int] NOT NULL,

	--/ <summary>Photometric uncertainty due to imperfect PSF model (u-band)</summary>
	--/ <quantity>stat.error;phot.mag;em.opt.SDSS.u</quantity>
	--/ <unit>mag</unit>
	[psfApCorrectionErr_u] [real] NOT NULL,

	--/ <summary>Photometric uncertainty due to imperfect PSF model (g-band)</summary>
	--/ <quantity>stat.error;phot.mag;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[psfApCorrectionErr_g] [real] NOT NULL,

	--/ <summary>Photometric uncertainty due to imperfect PSF model (r-band)</summary>
	--/ <quantity>stat.error;phot.mag;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[psfApCorrectionErr_r] [real] NOT NULL,

	--/ <summary>Photometric uncertainty due to imperfect PSF model (i-band)</summary>
	--/ <quantity>stat.error;phot.mag;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[psfApCorrectionErr_i] [real] NOT NULL,

	--/ <summary>Photometric uncertainty due to imperfect PSF model (z-band)</summary>
	--/ <quantity>stat.error;phot.mag;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[psfApCorrectionErr_z] [real] NOT NULL,

	--/ <summary>Inner gaussian sigma for composite fit</summary>
	--/ <quantity>instr.param;em.opt.SDSS.u</quantity>
	--/ <unit>arcsec</unit>
	[psfSigma1_u] [real] NOT NULL,

	--/ <summary>Inner gaussian sigma for composite fit</summary>
	--/ <quantity>instr.param;em.opt.SDSS.g</quantity>
	--/ <unit>arcsec</unit>
	[psfSigma1_g] [real] NOT NULL,

	--/ <summary>Inner gaussian sigma for composite fit</summary>
	--/ <quantity>instr.param;em.opt.SDSS.r</quantity>
	--/ <unit>arcsec</unit>
	[psfSigma1_r] [real] NOT NULL,

	--/ <summary>Inner gaussian sigma for composite fit</summary>
	--/ <quantity>instr.param;em.opt.SDSS.i</quantity>
	--/ <unit>arcsec</unit>
	[psfSigma1_i] [real] NOT NULL,

	--/ <summary>Inner gaussian sigma for composite fit</summary>
	--/ <quantity>instr.param;em.opt.SDSS.z</quantity>
	--/ <unit>arcsec</unit>
	[psfSigma1_z] [real] NOT NULL,

	--/ <summary>Outer gaussian sigma for composite fit</summary>
	--/ <quantity>instr.param;em.opt.SDSS.u</quantity>
	--/ <unit>arcsec</unit>
	[psfSigma2_u] [real] NOT NULL,

	--/ <summary>Outer gaussian sigma for composite fit</summary>
	--/ <quantity>instr.param;em.opt.SDSS.g</quantity>
	--/ <unit>arcsec</unit>
	[psfSigma2_g] [real] NOT NULL,

	--/ <summary>Outer gaussian sigma for composite fit</summary>
	--/ <quantity>instr.param;em.opt.SDSS.r</quantity>
	--/ <unit>arcsec</unit>
	[psfSigma2_r] [real] NOT NULL,

	--/ <summary>Outer gaussian sigma for composite fit</summary>
	--/ <quantity>instr.param;em.opt.SDSS.i</quantity>
	--/ <unit>arcsec</unit>
	[psfSigma2_i] [real] NOT NULL,

	--/ <summary>Outer gaussian sigma for composite fit</summary>
	--/ <quantity>instr.param;em.opt.SDSS.z</quantity>
	--/ <unit>arcsec</unit>
	[psfSigma2_z] [real] NOT NULL,

	--/ <summary>Ratio of inner to outer components at origin (composite fit)</summary>
	--/ <quantity>instr.param;arith.ratio;em.opt.SDSS.u</quantity>
	[psfB_u] [real] NOT NULL,

	--/ <summary>Ratio of inner to outer components at origin (composite fit)</summary>
	--/ <quantity>instr.param;arith.ratio;em.opt.SDSS.g</quantity>
	[psfB_g] [real] NOT NULL,

	--/ <summary>Ratio of inner to outer components at origin (composite fit)</summary>
	--/ <quantity>instr.param;arith.ratio;em.opt.SDSS.r</quantity>
	[psfB_r] [real] NOT NULL,

	--/ <summary>Ratio of inner to outer components at origin (composite fit)</summary>
	--/ <quantity>instr.param;arith.ratio;em.opt.SDSS.i</quantity>
	[psfB_i] [real] NOT NULL,

	--/ <summary>Ratio of inner to outer components at origin (composite fit)</summary>
	--/ <quantity>instr.param;arith.ratio;em.opt.SDSS.z</quantity>
	[psfB_z] [real] NOT NULL,

	--/ <summary>Value of power law at origin in composite fit  XXX</summary>
	--/ <quantity>stat.fit.param;em.opt.SDSS.u</quantity>
	[psfP0_u] [real] NOT NULL,

	--/ <summary>Value of power law at origin in composite fit  XXX</summary>
	--/ <quantity>stat.fit.param;em.opt.SDSS.g</quantity>
	[psfP0_g] [real] NOT NULL,

	--/ <summary>Value of power law at origin in composite fit  XXX</summary>
	--/ <quantity>stat.fit.param;em.opt.SDSS.r</quantity>
	[psfP0_r] [real] NOT NULL,

	--/ <summary>Value of power law at origin in composite fit  XXX</summary>
	--/ <quantity>stat.fit.param;em.opt.SDSS.i</quantity>
	[psfP0_i] [real] NOT NULL,

	--/ <summary>Value of power law at origin in composite fit  XXX</summary>
	--/ <quantity>stat.fit.param;em.opt.SDSS.z</quantity>
	[psfP0_z] [real] NOT NULL,

	--/ <summary>Slope of power law in composite fit</summary>
	--/ <quantity>stat.fit.param;em.opt.SDSS.u</quantity>
	[psfBeta_u] [real] NOT NULL,

	--/ <summary>Slope of power law in composite fit</summary>
	--/ <quantity>stat.fit.param;em.opt.SDSS.g</quantity>
	[psfBeta_g] [real] NOT NULL,

	--/ <summary>Slope of power law in composite fit</summary>
	--/ <quantity>stat.fit.param;em.opt.SDSS.r</quantity>
	[psfBeta_r] [real] NOT NULL,

	--/ <summary>Slope of power law in composite fit</summary>
	--/ <quantity>stat.fit.param;em.opt.SDSS.i</quantity>
	[psfBeta_i] [real] NOT NULL,

	--/ <summary>Slope of power law in composite fit</summary>
	--/ <quantity>stat.fit.param;em.opt.SDSS.z</quantity>
	[psfBeta_z] [real] NOT NULL,

	--/ <summary>Width of power law in composite fit</summary>
	--/ <quantity>stat.fit.param;em.opt.SDSS.u</quantity>
	[psfSigmaP_u] [real] NOT NULL,

	--/ <summary>Width of power law in composite fit</summary>
	--/ <quantity>stat.fit.param;em.opt.SDSS.g</quantity>
	[psfSigmaP_g] [real] NOT NULL,

	--/ <summary>Width of power law in composite fit</summary>
	--/ <quantity>stat.fit.param;em.opt.SDSS.r</quantity>
	[psfSigmaP_r] [real] NOT NULL,

	--/ <summary>Width of power law in composite fit</summary>
	--/ <quantity>stat.fit.param;em.opt.SDSS.i</quantity>
	[psfSigmaP_i] [real] NOT NULL,

	--/ <summary>Width of power law in composite fit</summary>
	--/ <quantity>stat.fit.param;em.opt.SDSS.z</quantity>
	[psfSigmaP_z] [real] NOT NULL,

	--/ <summary>Effective PSF width from 2-Gaussian fit (u-band)</summary>
	--/ <quantity>stat.fit.param;em.opt.SDSS.u</quantity>
	--/ <unit>arcsec</unit>
	[psfWidth_u] [real] NOT NULL,

	--/ <summary>Effective PSF width from 2-Gaussian fit (g-band)</summary>
	--/ <quantity>stat.fit.param;em.opt.SDSS.g</quantity>
	--/ <unit>arcsec</unit>
	[psfWidth_g] [real] NOT NULL,

	--/ <summary>Effective PSF width from 2-Gaussian fit (r-band)</summary>
	--/ <quantity>stat.fit.param;em.opt.SDSS.r</quantity>
	--/ <unit>arcsec</unit>
	[psfWidth_r] [real] NOT NULL,

	--/ <summary>Effective PSF width from 2-Gaussian fit (i-band)</summary>
	--/ <quantity>stat.fit.param;em.opt.SDSS.i</quantity>
	--/ <unit>arcsec</unit>
	[psfWidth_i] [real] NOT NULL,

	--/ <summary>Effective PSF width from 2-Gaussian fit (z-band)</summary>
	--/ <quantity>stat.fit.param;em.opt.SDSS.z</quantity>
	--/ <unit>arcsec</unit>
	[psfWidth_z] [real] NOT NULL,

	--/ <summary>Flux via fit to PSF (u-band) XXX</summary>
	--/ <quantity>phot.flux.psf;em.opt.SDSS.u</quantity>
	--/ <unit>count</unit>
	[psfPsfCounts_u] [real] NOT NULL,

	--/ <summary>Flux via fit to PSF (g-band) XXX</summary>
	--/ <quantity>phot.flux.psf;em.opt.SDSS.g</quantity>
	--/ <unit>count</unit>
	[psfPsfCounts_g] [real] NOT NULL,

	--/ <summary>Flux via fit to PSF (r-band) XXX</summary>
	--/ <quantity>phot.flux.psf;em.opt.SDSS.r</quantity>
	--/ <unit>count</unit>
	[psfPsfCounts_r] [real] NOT NULL,

	--/ <summary>Flux via fit to PSF (i-band) XXX</summary>
	--/ <quantity>phot.flux.psf;em.opt.SDSS.i</quantity>
	--/ <unit>count</unit>
	[psfPsfCounts_i] [real] NOT NULL,

	--/ <summary>Flux via fit to PSF (z-band) XXX</summary>
	--/ <quantity>phot.flux.psf;em.opt.SDSS.z</quantity>
	--/ <unit>count</unit>
	[psfPsfCounts_z] [real] NOT NULL,

	--/ <summary>Sigma of inner gaussian in 2-Gaussian fit (u-band)</summary>
	--/ <quantity>stat.fit.param;em.opt.SDSS.u</quantity>
	--/ <unit>arcsec</unit>
	[psf2GSigma1_u] [real] NOT NULL,

	--/ <summary>Sigma of inner gaussian in 2-Gaussian fit (g-band)</summary>
	--/ <quantity>stat.fit.param;em.opt.SDSS.g</quantity>
	--/ <unit>arcsec</unit>
	[psf2GSigma1_g] [real] NOT NULL,

	--/ <summary>Sigma of inner gaussian in 2-Gaussian fit (r-band)</summary>
	--/ <quantity>stat.fit.param;em.opt.SDSS.r</quantity>
	--/ <unit>arcsec</unit>
	[psf2GSigma1_r] [real] NOT NULL,

	--/ <summary>Sigma of inner gaussian in 2-Gaussian fit (i-band)</summary>
	--/ <quantity>stat.fit.param;em.opt.SDSS.i</quantity>
	--/ <unit>arcsec</unit>
	[psf2GSigma1_i] [real] NOT NULL,

	--/ <summary>Sigma of inner gaussian in 2-Gaussian fit (z-band)</summary>
	--/ <quantity>stat.fit.param;em.opt.SDSS.z</quantity>
	--/ <unit>arcsec</unit>
	[psf2GSigma1_z] [real] NOT NULL,

	--/ <summary>Sigma of outer gaussian in 2-Gaussian fit (u-band)</summary>
	--/ <quantity>stat.error;</quantity>
	--/ <unit>arcsec</unit>
	[psf2GSigma2_u] [real] NOT NULL,

	--/ <summary>Sigma of outer gaussian in 2-Gaussian fit (g-band)</summary>
	--/ <quantity>stat.fit.param;em.opt.SDSS.g</quantity>
	--/ <unit>arcsec</unit>
	[psf2GSigma2_g] [real] NOT NULL,

	--/ <summary>Sigma of outer gaussian in 2-Gaussian fit (r-band)</summary>
	--/ <quantity>stat.fit.param;em.opt.SDSS.r</quantity>
	--/ <unit>arcsec</unit>
	[psf2GSigma2_r] [real] NOT NULL,

	--/ <summary>Sigma of outer gaussian in 2-Gaussian fit (i-band)</summary>
	--/ <quantity>stat.fit.param;em.opt.SDSS.i</quantity>
	--/ <unit>arcsec</unit>
	[psf2GSigma2_i] [real] NOT NULL,

	--/ <summary>Sigma of outer gaussian in 2-Gaussian fit (z-band)</summary>
	--/ <quantity>stat.fit.param;em.opt.SDSS.z</quantity>
	--/ <unit>arcsec</unit>
	[psf2GSigma2_z] [real] NOT NULL,

	--/ <summary>Ratio of inner to outer components at origin (2-Gaussian fit)</summary>
	--/ <quantity>stat.fit.param;arith.ratio;em.opt.SDSS.u</quantity>
	[psf2GB_u] [real] NOT NULL,

	--/ <summary>Ratio of inner to outer components at origin (2-Gaussian fit)</summary>
	--/ <quantity>stat.fit.param;arith.ratio;em.opt.SDSS.g</quantity>
	[psf2GB_g] [real] NOT NULL,

	--/ <summary>Ratio of inner to outer components at origin (2-Gaussian fit)</summary>
	--/ <quantity>stat.fit.param;arith.ratio;em.opt.SDSS.r</quantity>
	[psf2GB_r] [real] NOT NULL,

	--/ <summary>Ratio of inner to outer components at origin (2-Gaussian fit)</summary>
	--/ <quantity>stat.fit.param;arith.ratio;em.opt.SDSS.i</quantity>
	[psf2GB_i] [real] NOT NULL,

	--/ <summary>Ratio of inner to outer components at origin (2-Gaussian fit)</summary>
	--/ <quantity>stat.fit.param;arith.ratio;em.opt.SDSS.z</quantity>
	[psf2GB_z] [real] NOT NULL,

	--/ <summary>PSF counts XXX</summary>
	--/ <quantity>phot.count;em.opt.SDSS.u</quantity>
	--/ <unit>count</unit>
	[psfCounts_u] [real] NOT NULL,

	--/ <summary>PSF counts XXX</summary>
	--/ <quantity>phot.count;em.opt.SDSS.g</quantity>
	--/ <unit>count</unit>
	[psfCounts_g] [real] NOT NULL,

	--/ <summary>PSF counts XXX</summary>
	--/ <quantity>phot.count;em.opt.SDSS.r</quantity>
	--/ <unit>count</unit>
	[psfCounts_r] [real] NOT NULL,

	--/ <summary>PSF counts XXX</summary>
	--/ <quantity>phot.count;em.opt.SDSS.i</quantity>
	--/ <unit>count</unit>
	[psfCounts_i] [real] NOT NULL,

	--/ <summary>PSF counts XXX</summary>
	--/ <quantity>phot.count;em.opt.SDSS.z</quantity>
	--/ <unit>count</unit>
	[psfCounts_z] [real] NOT NULL,

	--/ <summary>Gain averaged over amplifiers</summary>
	--/ <quantity>instr.param;em.opt.SDSS.u</quantity>
	--/ <unit>count DN-1</unit>
	[gain_u] [real] NOT NULL,

	--/ <summary>Gain averaged over amplifiers</summary>
	--/ <quantity>instr.param;em.opt.SDSS.g</quantity>
	--/ <unit>count DN-1</unit>
	[gain_g] [real] NOT NULL,

	--/ <summary>Gain averaged over amplifiers</summary>
	--/ <quantity>instr.param;em.opt.SDSS.r</quantity>
	--/ <unit>count DN-1</unit>
	[gain_r] [real] NOT NULL,

	--/ <summary>Gain averaged over amplifiers</summary>
	--/ <quantity>instr.param;em.opt.SDSS.i</quantity>
	--/ <unit>count DN-1</unit>
	[gain_i] [real] NOT NULL,

	--/ <summary>Gain averaged over amplifiers</summary>
	--/ <quantity>instr.param;em.opt.SDSS.z</quantity>
	--/ <unit>electrons DN-1</unit>
	[gain_z] [real] NOT NULL,

	--/ <summary>Dark variance</summary>
	--/ <quantity>instr.param;em.opt.SDSS.u</quantity>
	[darkVariance_u] [real] NOT NULL,

	--/ <summary>Dark variance</summary>
	--/ <quantity>instr.param;em.opt.SDSS.g</quantity>
	[darkVariance_g] [real] NOT NULL,

	--/ <summary>Dark variance</summary>
	--/ <quantity>instr.param;em.opt.SDSS.r</quantity>
	[darkVariance_r] [real] NOT NULL,

	--/ <summary>Dark variance</summary>
	--/ <quantity>instr.param;em.opt.SDSS.i</quantity>
	[darkVariance_i] [real] NOT NULL,

	--/ <summary>Dark variance</summary>
	--/ <quantity>instr.param;em.opt.SDSS.z</quantity>
	[darkVariance_z] [real] NOT NULL,

	--/ <summary>Quality of field (0-1)</summary>
	--/ <quantity>meta.code.qual;obs.field</quantity>
	[score] [real] NOT NULL,

	--/ <summary>nanomaggies per count due to instrument</summary>
	--/ <quantity>instr.param;em.opt.SDSS.u</quantity>
	--/ <unit>nmgy count-1</unit>
	[aterm_u] [real] NOT NULL,

	--/ <summary>nanomaggies per count due to instrument</summary>
	--/ <quantity>instr.param;em.opt.SDSS.g</quantity>
	--/ <unit>nmgy count-1</unit>
	[aterm_g] [real] NOT NULL,

	--/ <summary>nanomaggies per count due to instrument</summary>
	--/ <quantity>instr.param;em.opt.SDSS.r</quantity>
	--/ <unit>nmgy count-1</unit>
	[aterm_r] [real] NOT NULL,

	--/ <summary>nanomaggies per count due to instrument</summary>
	--/ <quantity>instr.param;em.opt.SDSS.i</quantity>
	--/ <unit>nmgy count-1</unit>
	[aterm_i] [real] NOT NULL,

	--/ <summary>nanomaggies per count due to instrument</summary>
	--/ <quantity>instr.param;em.opt.SDSS.z</quantity>
	--/ <unit>nmgy count-1</unit>
	[aterm_z] [real] NOT NULL,

	--/ <summary>atmospheric k-term at reference time in calibration</summary>
	--/ <quantity>obs.atmos;em.opt.SDSS.u</quantity>
	[kterm_u] [real] NOT NULL,

	--/ <summary>atmospheric k-term at reference time in calibration</summary>
	--/ <quantity>obs.atmos;em.opt.SDSS.g</quantity>
	[kterm_g] [real] NOT NULL,

	--/ <summary>atmospheric k-term at reference time in calibration</summary>
	--/ <quantity>obs.atmos;em.opt.SDSS.r</quantity>
	[kterm_r] [real] NOT NULL,

	--/ <summary>atmospheric k-term at reference time in calibration</summary>
	--/ <quantity>obs.atmos;em.opt.SDSS.i</quantity>
	[kterm_i] [real] NOT NULL,

	--/ <summary>atmospheric k-term at reference time in calibration</summary>
	--/ <quantity>obs.atmos;em.opt.SDSS.z</quantity>
	[kterm_z] [real] NOT NULL,

	--/ <summary>linear time variation of atmospheric k-term</summary>
	--/ <quantity>src.var;obs.atmos;em.opt.SDSS.u</quantity>
	--/ <unit>s-1</unit>
	[kdot_u] [real] NOT NULL,

	--/ <summary>linear time variation of atmospheric k-term</summary>
	--/ <quantity>src.var;obs.atmos;em.opt.SDSS.g</quantity>
	--/ <unit>s-1</unit>
	[kdot_g] [real] NOT NULL,

	--/ <summary>linear time variation of atmospheric k-term</summary>
	--/ <quantity>src.var;obs.atmos;em.opt.SDSS.r</quantity>
	--/ <unit>s-1</unit>
	[kdot_r] [real] NOT NULL,

	--/ <summary>linear time variation of atmospheric k-term</summary>
	--/ <quantity>src.var;obs.atmos;em.opt.SDSS.i</quantity>
	--/ <unit>s-1</unit>
	[kdot_i] [real] NOT NULL,

	--/ <summary>linear time variation of atmospheric k-term</summary>
	--/ <quantity>src.var;obs.atmos;em.opt.SDSS.z</quantity>
	--/ <unit>s-1</unit>
	[kdot_z] [real] NOT NULL,

	--/ <summary>reference TAI used for k-term</summary>
	--/ <quantity>time.epoch;em.opt.SDSS.u</quantity>
	--/ <unit>s</unit>
	[reftai_u] [float] NOT NULL,

	--/ <summary>reference TAI used for k-term</summary>
	--/ <quantity>time.epoch;em.opt.SDSS.g</quantity>
	--/ <unit>s</unit>
	[reftai_g] [float] NOT NULL,

	--/ <summary>reference TAI used for k-term</summary>
	--/ <quantity>time.epoch;em.opt.SDSS.r</quantity>
	--/ <unit>s</unit>
	[reftai_r] [float] NOT NULL,

	--/ <summary>reference TAI used for k-term</summary>
	--/ <quantity>time.epoch;em.opt.SDSS.i</quantity>
	--/ <unit>s</unit>
	[reftai_i] [float] NOT NULL,

	--/ <summary>reference TAI used for k-term</summary>
	--/ <quantity>time.epoch;em.opt.SDSS.z</quantity>
	--/ <unit>s</unit>
	[reftai_z] [float] NOT NULL,

	--/ <summary>TAI used for k-term</summary>
	--/ <quantity>time.epoch;em.opt.SDSS.u</quantity>
	--/ <unit>s</unit>
	[tai_u] [float] NOT NULL,

	--/ <summary>TAI used for k-term</summary>
	--/ <quantity>time.epoch;em.opt.SDSS.g</quantity>
	--/ <unit>s</unit>
	[tai_g] [float] NOT NULL,

	--/ <summary>TAI used for k-term</summary>
	--/ <quantity>time.epoch;em.opt.SDSS.r</quantity>
	--/ <unit>s</unit>
	[tai_r] [float] NOT NULL,

	--/ <summary>TAI used for k-term</summary>
	--/ <quantity>time.epoch;em.opt.SDSS.i</quantity>
	--/ <unit>s</unit>
	[tai_i] [float] NOT NULL,

	--/ <summary>TAI used for k-term</summary>
	--/ <quantity>time.epoch;em.opt.SDSS.z</quantity>
	--/ <unit>s</unit>
	[tai_z] [float] NOT NULL,

	--/ <summary>number of stars used for fieldOffset determination</summary>
	--/ <quantity>meta.number;src;em.opt.SDSS.u</quantity>
	[nStarsOffset_u] [int] NOT NULL,

	--/ <summary>number of stars used for fieldOffset determination</summary>
	--/ <quantity>meta.number;src;em.opt.SDSS.g</quantity>
	[nStarsOffset_g] [int] NOT NULL,

	--/ <summary>number of stars used for fieldOffset determination</summary>
	--/ <quantity>meta.number;src;em.opt.SDSS.r</quantity>
	[nStarsOffset_r] [int] NOT NULL,

	--/ <summary>number of stars used for fieldOffset determination</summary>
	--/ <quantity>meta.number;src;em.opt.SDSS.i</quantity>
	[nStarsOffset_i] [int] NOT NULL,

	--/ <summary>number of stars used for fieldOffset determination</summary>
	--/ <quantity>meta.number;src;em.opt.SDSS.z</quantity>
	[nStarsOffset_z] [int] NOT NULL,

	--/ <summary>offset of field from initial calibration (final minus initial magnitudes)</summary>
	--/ <quantity>phot.mag;arith.diff;em.opt.SDSS.u</quantity>
	--/ <unit>mag</unit>
	[fieldOffset_u] [real] NOT NULL,

	--/ <summary>offset of field from initial calibration (final minus initial magnitudes)</summary>
	--/ <quantity>phot.mag;arith.diff;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[fieldOffset_g] [real] NOT NULL,

	--/ <summary>offset of field from initial calibration (final minus initial magnitudes)</summary>
	--/ <quantity>phot.mag;arith.diff;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[fieldOffset_r] [real] NOT NULL,

	--/ <summary>offset of field from initial calibration (final minus initial magnitudes)</summary>
	--/ <quantity>phot.mag;arith.diff;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[fieldOffset_i] [real] NOT NULL,

	--/ <summary>offset of field from initial calibration (final minus initial magnitudes)</summary>
	--/ <quantity>phot.mag;arith.diff;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[fieldOffset_z] [real] NOT NULL,

	--/ <summary>calibration status bitmask</summary>
	--/ <quantity>meta.code.status;obs.calib;em.opt.SDSS.u</quantity>
	[calibStatus_u] [int] NOT NULL,

	--/ <summary>calibration status bitmask</summary>
	--/ <quantity>meta.code.status;obs.calib;em.opt.SDSS.g</quantity>
	[calibStatus_g] [int] NOT NULL,

	--/ <summary>calibration status bitmask</summary>
	--/ <quantity>meta.code.status;obs.calib;em.opt.SDSS.r</quantity>
	[calibStatus_r] [int] NOT NULL,

	--/ <summary>calibration status bitmask</summary>
	--/ <quantity>meta.code.status;obs.calib;em.opt.SDSS.i</quantity>
	[calibStatus_i] [int] NOT NULL,

	--/ <summary>calibration status bitmask</summary>
	--/ <quantity>meta.code.status;obs.calib;em.opt.SDSS.z</quantity>
	[calibStatus_z] [int] NOT NULL,

	--/ <summary>image status bitmask</summary>
	--/ <quantity>meta.code.status;obs.image;em.opt.SDSS.u</quantity>
	[imageStatus_u] [int] NOT NULL,

	--/ <summary>image status bitmask</summary>
	--/ <quantity>meta.code.status;obs.image;em.opt.SDSS.g</quantity>
	[imageStatus_g] [int] NOT NULL,

	--/ <summary>image status bitmask</summary>
	--/ <quantity>meta.code.status;obs.image;em.opt.SDSS.r</quantity>
	[imageStatus_r] [int] NOT NULL,

	--/ <summary>image status bitmask</summary>
	--/ <quantity>meta.code.status;obs.image;em.opt.SDSS.i</quantity>
	[imageStatus_i] [int] NOT NULL,

	--/ <summary>image status bitmask</summary>
	--/ <quantity>meta.code.status;obs.image;em.opt.SDSS.z</quantity>
	[imageStatus_z] [int] NOT NULL,

	--/ <summary>nanomaggies per count in u-band</summary>
	--/ <quantity>phot;em.opt.SDSS.u</quantity>
	--/ <unit>nmgy count-1</unit>
	[nMgyPerCount_u] [real] NOT NULL,

	--/ <summary>nanomaggies per count in g-band</summary>
	--/ <quantity>phot;em.opt.SDSS.g</quantity>
	--/ <unit>nmgy count-1</unit>
	[nMgyPerCount_g] [real] NOT NULL,

	--/ <summary>nanomaggies per count in r-band</summary>
	--/ <quantity>phot;em.opt.SDSS.r</quantity>
	--/ <unit>nmgy count-1</unit>
	[nMgyPerCount_r] [real] NOT NULL,

	--/ <summary>nanomaggies per count in i-band</summary>
	--/ <quantity>phot;em.opt.SDSS.i</quantity>
	--/ <unit>nmgy count-1</unit>
	[nMgyPerCount_i] [real] NOT NULL,

	--/ <summary>nanomaggies per count in z-band</summary>
	--/ <quantity>phot;em.opt.SDSS.z</quantity>
	--/ <unit>nmgy count-1</unit>
	[nMgyPerCount_z] [real] NOT NULL,

	--/ <summary>Inverse variance of nanomaggies per count in u-band</summary>
	--/ <quantity>stat.variance;phot;em.opt.SDSS.u</quantity>
	--/ <unit>nmgy-2 count+2</unit>
	[nMgyPerCountIvar_u] [real] NOT NULL,

	--/ <summary>Inverse variance of nanomaggies per count in g-band</summary>
	--/ <quantity>stat.variance;phot;em.opt.SDSS.g</quantity>
	--/ <unit>nmgy-2 count+2</unit>
	[nMgyPerCountIvar_g] [real] NOT NULL,

	--/ <summary>Inverse variance of nanomaggies per count in r-band</summary>
	--/ <quantity>stat.variance;phot;em.opt.SDSS.r</quantity>
	--/ <unit>nmgy-2 count+2</unit>
	[nMgyPerCountIvar_r] [real] NOT NULL,

	--/ <summary>Inverse variance of nanomaggies per count in i-band</summary>
	--/ <quantity>stat.variance;phot;em.opt.SDSS.i</quantity>
	--/ <unit>nmgy-2 count+2</unit>
	[nMgyPerCountIvar_i] [real] NOT NULL,

	--/ <summary>Inverse variance of nanomaggies per count in z-band</summary>
	--/ <quantity>stat.variance;phot;em.opt.SDSS.z</quantity>
	--/ <unit>nmgy-2 count+2</unit>
	[nMgyPerCountIvar_z] [real] NOT NULL,

	--/ <summary>field id used by resolve pipeline</summary>
	--/ <quantity>meta.id;obs;field</quantity>
	[ifield] [int] NOT NULL,

	--/ <summary>start of field in stripe coords (parallel to scan direction, 64 pixels clipped)</summary>
	--/ <quantity>pos</quantity>
	--/ <unit>arcsec</unit>
	[muStart] [float] NOT NULL,

	--/ <summary>end of field in stripe coords (parallel to scan direction, 64 pixels clipped)</summary>
	--/ <quantity>pos</quantity>
	--/ <unit>arcsec</unit>
	[muEnd] [float] NOT NULL,

	--/ <summary>start of field in stripe coords (perpendicular to scan direction, 64 pixels clipped)</summary>
	--/ <quantity>pos</quantity>
	--/ <unit>arcsec</unit>
	[nuStart] [float] NOT NULL,

	--/ <summary>end of field in stripe coords (perpendicular to scan direction, 64 pixels clipped)</summary>
	--/ <quantity>pos</quantity>
	--/ <unit>arcsec</unit>
	[nuEnd] [float] NOT NULL,

	--/ <summary>first entry for this field in the "findx" table matching fields and balkans</summary>
	--/ <quantity>meta.id</quantity>
	[ifindx] [int] NOT NULL,

	--/ <summary>number of balkans contained in this field (and corresponding number of entries in the "findx" table)</summary>
	--/ <quantity>meta.number</quantity>
	[nBalkans] [int] NOT NULL,

	--/ <summary>Load Version</summary>
	--/ <quantity>meta.version</quantity>
	[loadVersion] [int] NOT NULL,
 CONSTRAINT [pk_Field_fieldID] PRIMARY KEY CLUSTERED 
(
	[fieldID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FieldProfile]    Script Date: 4/1/2015 5:51:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--/ <summary> The mean PSF profile for the field as determined from bright stars. </summary>
--/ <remarks> For the profile radii, see the ProfileDefs table. </remarks>
CREATE TABLE [dbo].[FieldProfile](
	--/ <summary>bin number (0..14)</summary>
	--/ <quantity>meta.code</quantity>
	[bin] [tinyint] NOT NULL,

	--/ <summary>u,g,r,i,z (0..4)</summary>
	--/ <quantity>meta.code;instr.bandpass</quantity>
	[band] [tinyint] NOT NULL,

	--/ <summary>Mean pixel flux in annulus</summary>
	--/ <quantity>phot.flux;stat.mean</quantity>
	--/ <unit>nmgy arcsec-2</unit>
	[profMean] [real] NOT NULL,

	--/ <summary>Median profile</summary>
	--/ <quantity>phot.flux;stat.median</quantity>
	--/ <unit>nmgy arcsec-2</unit>
	[profMed] [real] NOT NULL,

	--/ <summary>Sigma of profile</summary>
	--/ <quantity>stat.error;phot.flux</quantity>
	--/ <unit>nmgy arcsec-2</unit>
	[profSig] [real] NOT NULL,

	--/ <summary>links to the field object</summary>
	--/ <quantity>meta.id</quantity>
	[fieldID] [bigint] NOT NULL,
 CONSTRAINT [pk_FieldProfile_fieldID_bin_band] PRIMARY KEY CLUSTERED 
(
	[fieldID] ASC,
	[bin] ASC,
	[band] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Frame]    Script Date: 4/1/2015 5:51:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

--/ <summary> Contains JPEG images of fields at various zoom factors, and their astrometry. </summary>
--/ <remarks> The frame is the basic image unit. The table contains   false color JPEG images of the fields, and their most  relevant parameters, in particular the coefficients of  the astrometric transformation, and position info.   The images are stored at several zoom levels. </remarks>
CREATE TABLE [dbo].[Frame](

	--/ <summary>Link to the field table</summary>
	--/ <quantity>meta.id</quantity>
	[fieldID] [bigint] NOT NULL,

	--/ <summary>Zoom level 2^(zoom/10)</summary>
	--/ <quantity>obs.param</quantity>
	[zoom] [int] NOT NULL,

	--/ <summary>Run number</summary>
	--/ <quantity>meta.id</quantity>
	[run] [int] NOT NULL,

	--/ <summary>Rerun number</summary>
	--/ <quantity>meta.id</quantity>
	[rerun] [int] NOT NULL,

	--/ <summary>Camera column</summary>
	--/ <quantity>meta.id;instr.det</quantity>
	[camcol] [int] NOT NULL,

	--/ <summary>Field number</summary>
	--/ <quantity>meta.id;obs.field</quantity>
	[field] [int] NOT NULL,

	--/ <summary>Stripe number</summary>
	--/ <quantity>meta.id;obs.param</quantity>
	[stripe] [int] NOT NULL,

	--/ <summary>Strip number (N or S)</summary>
	--/ <quantity>meta.id;obs.param</quantity>
	[strip] [varchar](32) NOT NULL,

	--/ <summary>Astrometric coefficient</summary>
	--/ <quantity>obs.param;pos</quantity>
	--/ <unit>deg</unit>
	[a] [float] NOT NULL,

	--/ <summary>Astrometric coefficient</summary>
	--/ <quantity>obs.param;pos</quantity>
	--/ <unit>deg pix-1</unit>
	[b] [float] NOT NULL,

	--/ <summary>Astrometric coefficient</summary>
	--/ <quantity>obs.param;pos</quantity>
	--/ <unit>deg pix-1</unit>
	[c] [float] NOT NULL,

	--/ <summary>Astrometric coefficient</summary>
	--/ <quantity>obs.param;pos</quantity>
	--/ <unit>deg</unit>
	[d] [float] NOT NULL,

	--/ <summary>Astrometric coefficient</summary>
	--/ <quantity>obs.param;pos</quantity>
	--/ <unit>deg pix-1</unit>
	[e] [float] NOT NULL,

	--/ <summary>Astrometric coefficient</summary>
	--/ <quantity>obs.param;pos</quantity>
	--/ <unit>deg pix-1</unit>
	[f] [float] NOT NULL,

	--/ <summary>Astrometric coefficient</summary>
	--/ <quantity>obs.param;pos</quantity>
	--/ <unit>deg</unit>
	[node] [float] NOT NULL,

	--/ <summary>Astrometric coefficient</summary>
	--/ <quantity>obs.param;pos</quantity>
	--/ <unit>deg</unit>
	[incl] [float] NOT NULL,

	--/ <summary>Min of ra</summary>
	--/ <quantity>pos.eq.ra;stat.min</quantity>
	--/ <unit>deg</unit>
	[raMin] [float] NOT NULL,

	--/ <summary>Max of ra</summary>
	--/ <quantity>pos.eq.ra;stat.max</quantity>
	--/ <unit>deg</unit>
	[raMax] [float] NOT NULL,

	--/ <summary>Min of dec</summary>
	--/ <quantity>pos.eq.dec;stat.min</quantity>
	--/ <unit>deg</unit>
	[decMin] [float] NOT NULL,

	--/ <summary>Max of dec</summary>
	--/ <quantity>pos.eq.dec;stat.max</quantity>
	--/ <unit>deg</unit>
	[decMax] [float] NOT NULL,

	--/ <summary>Survey mu of frame center</summary>
	--/ <quantity>obs.param</quantity>
	--/ <unit>deg</unit>
	[mu] [float] NOT NULL,

	--/ <summary>Survey nu of frame center</summary>
	--/ <quantity>obs.param</quantity>
	--/ <unit>deg</unit>
	[nu] [float] NOT NULL,

	--/ <summary>Ra of frame center</summary>
	--/ <quantity>pos.eq.ra</quantity>
	--/ <unit>deg</unit>
	[ra] [float] NOT NULL,

	--/ <summary>Dec of frame center</summary>
	--/ <quantity>pos.eq.dec</quantity>
	--/ <unit>deg</unit>
	[dec] [float] NOT NULL,

	--/ <summary>Cartesian x of frame center</summary>
	--/ <quantity>pos.eq.x</quantity>
	[cx] [float] NOT NULL,

	--/ <summary>Cartesian y of frame center</summary>
	--/ <quantity>pos.eq.y</quantity>
	[cy] [float] NOT NULL,

	--/ <summary>Cartesian z of frame center</summary>
	--/ <quantity>pos.eq.r</quantity>
	[cz] [float] NOT NULL,

	--/ <summary>The htmID for point at frame center</summary>
	--/ <quantity>pos.eq.HTM</quantity>
	[htmID] [bigint] NOT NULL,

	--/ <summary>Zone ID</summary>
	--/ <quantity>pos.eq.zone</quantity>
	[zoneID] [bigint] NOT NULL,
	
	--[img] [varbinary](max) NOT NULL DEFAULT (0x1111),
 CONSTRAINT [pk_Frame_fieldID_zoom] PRIMARY KEY CLUSTERED 
(
	[fieldID] ASC,
	[zoom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
--TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[galSpecExtra]    Script Date: 4/1/2015 5:51:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--/ <summary> Estimated physical parameters for all galaxies in the MPA-JHU spectroscopic catalogue. </summary>
--/ <remarks> These parameters give the probability distribution of each parameter in terms  of its percent quantiles. These estimates are derived in the manner described  in Brinchmann et al. 2004 </remarks>
CREATE TABLE [dbo].[galSpecExtra](

	--/ <summary>Unique ID</summary>
	--/ <quantity>meta.id;meta.main</quantity>
	[specObjID] [bigint] NOT NULL,

	--/ <summary>Emission line classification based on the BPT diagram using the methodology described in Brinchmann et al (2004). -1 means unclassifiable, 1 is star-forming, 2 means low S/N star-forming, 3 is composite, 4 AGN (excluding liners) and 5 is a low S/N LINER.</summary>
	--/ <quantity>src.class;spect.line</quantity>
	[bptclass] [smallint] NOT NULL,

	--/ <summary>The 2.5 percentile of the Oxygen abundance derived using Charlot &amp; Longhetti models. The values are reported as 12 + Log O/H. See Tremonti et al (2004) and Brinchmann et al (2004) for details.</summary>
	--/ <quantity>phys.abund</quantity>
	[oh_p2p5] [real] NOT NULL,

	--/ <summary>The 16 percentile of the Oxygen abundance derived using Charlot &amp; Longhetti models. The values are reported as 12 + Log O/H. See Tremonti et al (2004) and Brinchmann et al (2004) for details.</summary>
	--/ <quantity>phys.abund</quantity>
	[oh_p16] [real] NOT NULL,

	--/ <summary>The median estimate of the Oxygen abundance derived using Charlot &amp; Longhetti models. The values are reported as 12 + Log O/H. See Tremonti et al (2004) and Brinchmann et al (2004) for details.</summary>
	--/ <quantity>phys.abund;stat.median</quantity>
	[oh_p50] [real] NOT NULL,

	--/ <summary>The 84th percentile of the Oxygen abundance derived using Charlot &amp; Longhetti models. The values are reported as 12 + Log O/H. See Tremonti et al (2004) and Brinchmann et al (2004) for details.</summary>
	--/ <quantity>phys.abund</quantity>
	[oh_p84] [real] NOT NULL,

	--/ <summary>The 97.5 percentile of the Oxygen abundance derived using Charlot &amp; Longhetti models. The values are reported as 12 + Log O/H. See Tremonti et al (2004) and Brinchmann et al (2004) for details.</summary>
	--/ <quantity>phys.abund</quantity>
	[oh_p97p5] [real] NOT NULL,

	--/ <summary>The entropy (Sum p*lg(p)) of the PDF of 12 + Log O/H</summary>
	--/ <quantity>phys.entropy</quantity>
	[oh_entropy] [real] NOT NULL,

	--/ <summary>The 2.5 percentile of the Log total stellar mass PDF using model photometry.</summary>
	--/ <quantity>phys.mass</quantity>
	--/ <unit>log(M_sol)</unit>
	[lgm_tot_p2p5] [real] NOT NULL,

	--/ <summary>The 16th percentile of the Log total stellar mass PDF using model photometry.</summary>
	--/ <quantity>phys.mass</quantity>
	--/ <unit>log(M_sol)</unit>
	[lgm_tot_p16] [real] NOT NULL,

	--/ <summary>The median estimate of the Log total stellar mass PDF using model photometry.</summary>
	--/ <quantity>phys.mass;stat.median</quantity>
	--/ <unit>log(M_sol)</unit>
	[lgm_tot_p50] [real] NOT NULL,

	--/ <summary>The 84th percentile of the Log total stellar mass PDF using model photometry.</summary>
	--/ <quantity>phys.mass</quantity>
	--/ <unit>log(M_sol)</unit>
	[lgm_tot_p84] [real] NOT NULL,

	--/ <summary>The 97.5 percentile of the Log total stellar mass PDF using model photometry.</summary>
	--/ <quantity>phys.mass</quantity>
	--/ <unit>log(M_sol)</unit>
	[lgm_tot_p97p5] [real] NOT NULL,

	--/ <summary>The 2.5 percentile of the Log stellar mass within the fibre PDF using fibre photometry.</summary>
	--/ <quantity>phys.mass</quantity>
	--/ <unit>log(M_sol)</unit>
	[lgm_fib_p2p5] [real] NOT NULL,

	--/ <summary>The 16th percentile of the Log stellar mass within the fibre PDF using fibre photometry.</summary>
	--/ <quantity>phys.mass</quantity>
	--/ <unit>log(M_sol)</unit>
	[lgm_fib_p16] [real] NOT NULL,

	--/ <summary>The median estimate of the Log stellar mass within the fibre PDF using fibre photometry.</summary>
	--/ <quantity>phys.mass;stat.median</quantity>
	--/ <unit>log(M_sol)</unit>
	[lgm_fib_p50] [real] NOT NULL,

	--/ <summary>The 84th percentile of the Log stellar mass within the fibre PDF using fibre photometry.</summary>
	--/ <quantity>phys.mass</quantity>
	--/ <unit>log(M_sol)</unit>
	[lgm_fib_p84] [real] NOT NULL,

	--/ <summary>The 97.5 percentile of the Log stellar mass within the fibre PDF using fibre photometry.</summary>
	--/ <quantity>phys.mass</quantity>
	--/ <unit>log(M_sol)</unit>
	[lgm_fib_p97p5] [real] NOT NULL,

	--/ <summary>The 2.5 percentile of the Log total SFR PDF. This is derived by combining emission line measurements from within the fibre where possible and aperture corrections are done by fitting models ala Gallazzi et al (2005), Salim et al (2007) to the photometry outside the fibre. For those objects where the emission lines within the fibre do not provide an estimate of the SFR, model fits were made to the integrated photometry.</summary>
	--/ <quantity>phys.SFR</quantity>
	--/ <unit>log(M_sol yr-1)</unit>
	[sfr_tot_p2p5] [real] NOT NULL,

	--/ <summary>The 16th percentile of the Log total SFR PDF. This is derived by combining emission line measurements from within the fibre where possible and aperture corrections are done by fitting models ala Gallazzi et al (2005), Salim et al (2007) to the photometry outside the fibre. For those objects where the emission lines within the fibre do not provide an estimate of the SFR, model fits were made to the integrated photometry.</summary>
	--/ <quantity>phys.SFR</quantity>
	--/ <unit>log(M_sol yr-1)</unit>
	[sfr_tot_p16] [real] NOT NULL,

	--/ <summary>The median estimate of the Log total SFR PDF. This is derived by combining emission line measurements from within the fibre where possible and aperture corrections are done by fitting models ala Gallazzi et al (2005), Salim et al (2007) to the photometry outside the fibre. For those objects where the emission lines within the fibre do not provide an estimate of the SFR, model fits were made to the integrated photometry.</summary>
	--/ <quantity>phys.SFR;stat.median</quantity>
	--/ <unit>log(M_sol yr-1)</unit>
	[sfr_tot_p50] [real] NOT NULL,

	--/ <summary>The 84th percentile of the Log total SFR PDF. This is derived by combining emission line measurements from within the fibre where possible and aperture corrections are done by fitting models ala Gallazzi et al (2005), Salim et al (2007) to the photometry outside the fibre. For those objects where the emission lines within the fibre do not provide an estimate of the SFR, model fits were made to the integrated photometry.</summary>
	--/ <quantity>phys.SFR</quantity>
	--/ <unit>log(M_sol yr-1)</unit>
	[sfr_tot_p84] [real] NOT NULL,

	--/ <summary>The 97.5 percentile of the Log total SFR PDF. This is derived by combining emission line measurements from within the fibre where possible and aperture corrections are done by fitting models ala Gallazzi et al (2005), Salim et al (2007) to the photometry outside the fibre. For those objects where the emission lines within the fibre do not provide an estimate of the SFR, model fits were made to the integrated photometry.</summary>
	--/ <quantity>phys.SFR</quantity>
	--/ <unit>log(M_sol yr-1)</unit>
	[sfr_tot_p97p5] [real] NOT NULL,

	--/ <summary>The entropy (Sum p*lg(p)) of the PDF of the total SFR</summary>
	--/ <quantity>phys.entropy</quantity>
	[sfr_tot_entropy] [real] NOT NULL,

	--/ <summary>The 2.5 percentile of the Log SFR within the fiber PDF. For galaxies of the star-forming class, emission lines were used (c.f. Brinchmann et al 2004) while for others models were fit to the fibre photometry..</summary>
	--/ <quantity>phys.SFR</quantity>
	--/ <unit>log(M_sol yr-1)</unit>
	[sfr_fib_p2p5] [real] NOT NULL,

	--/ <summary>The 16th percentile of the Log SFR within the fiber PDF. For galaxies of the star-forming class, emission lines were used (c.f. Brinchmann et al 2004) while for others models were fit to the fibre photometry..</summary>
	--/ <quantity>phys.SFR</quantity>
	--/ <unit>log(M_sol yr-1)</unit>
	[sfr_fib_p16] [real] NOT NULL,

	--/ <summary>The median estimate of the Log SFR within the fiber PDF. For galaxies of the star-forming class, emission lines were used (c.f. Brinchmann et al 2004) while for others models were fit to the fibre photometry..</summary>
	--/ <quantity>phys.SFR;stat.median</quantity>
	--/ <unit>log(M_sol yr-1)</unit>
	[sfr_fib_p50] [real] NOT NULL,

	--/ <summary>The 84th percentile of the Log SFR within the fiber PDF. For galaxies of the star-forming class, emission lines were used (c.f. Brinchmann et al 2004) while for others models were fit to the fibre photometry..</summary>
	--/ <quantity>phys.SFR</quantity>
	--/ <unit>log(M_sol yr-1)</unit>
	[sfr_fib_p84] [real] NOT NULL,

	--/ <summary>The 97.5 percentile of the Log SFR within the fiber PDF. For galaxies of the star-forming class, emission lines were used (c.f. Brinchmann et al 2004) while for others models were fit to the fibre photometry..</summary>
	--/ <quantity>phys.SFR</quantity>
	--/ <unit>log(M_sol yr-1)</unit>
	[sfr_fib_p97p5] [real] NOT NULL,

	--/ <summary>The entropy (Sum p*lg(p)) of the PDF of the fiber SFR</summary>
	--/ <quantity>phys.entropy</quantity>
	[sfr_fib_entropy] [real] NOT NULL,

	--/ <summary>The 2.5 percentile of the Log total SPECSFR PDF. This is derived by combining emission line measurements from within the fibre where possible and aperture corrections are done by fitting models ala Gallazzi et al (2005), Salim et al (2007) to the photometry outside the fibre. For those objects where the emission lines within the fibre do not provide an estimate of the SFR, model fits were made to the integrated photometry.</summary>
	--/ <quantity>phys.SFR</quantity>
	--/ <unit>log(M_sol yr-1)</unit>
	[specsfr_tot_p2p5] [real] NOT NULL,

	--/ <summary>The 16th percentile of the Log total SPECSFR PDF. This is derived by combining emission line measurements from within the fibre where possible and aperture corrections are done by fitting models ala Gallazzi et al (2005), Salim et al (2007) to the photometry outside the fibre. For those objects where the emission lines within the fibre do not provide an estimate of the SFR, model fits were made to the integrated photometry.</summary>
	--/ <quantity>phys.SFR</quantity>
	--/ <unit>log(M_sol yr-1)</unit>
	[specsfr_tot_p16] [real] NOT NULL,

	--/ <summary>The median estimate of the Log total SPECSFR PDF. This is derived by combining emission line measurements from within the fibre where possible and aperture corrections are done by fitting models ala Gallazzi et al (2005), Salim et al (2007) to the photometry outside the fibre. For those objects where the emission lines within the fibre do not provide an estimate of the SFR, model fits were made to the integrated photometry.</summary>
	--/ <quantity>phys.SFR;stat.median</quantity>
	--/ <unit>log(M_sol yr-1)</unit>
	[specsfr_tot_p50] [real] NOT NULL,

	--/ <summary>The 84th percentile of the Log total SPECSFR PDF. This is derived by combining emission line measurements from within the fibre where possible and aperture corrections are done by fitting models ala Gallazzi et al (2005), Salim et al (2007) to the photometry outside the fibre. For those objects where the emission lines within the fibre do not provide an estimate of the SFR, model fits were made to the integrated photometry.</summary>
	--/ <quantity>phys.SFR</quantity>
	--/ <unit>log(M_sol yr-1)</unit>
	[specsfr_tot_p84] [real] NOT NULL,

	--/ <summary>The 97.5 percentile of the Log total SPECSFR PDF. This is derived by combining emission line measurements from within the fibre where possible and aperture corrections are done by fitting models ala Gallazzi et al (2005), Salim et al (2007) to the photometry outside the fibre. For those objects where the emission lines within the fibre do not provide an estimate of the SFR, model fits were made to the integrated photometry.</summary>
	--/ <quantity>phys.SFR</quantity>
	--/ <unit>log(M_sol yr-1)</unit>
	[specsfr_tot_p97p5] [real] NOT NULL,

	--/ <summary>The entropy (Sum p*lg(p)) of the PDF of the total SPECSFR</summary>
	--/ <quantity>phys.entropy</quantity>
	[specsfr_tot_entropy] [real] NOT NULL,

	--/ <summary>The 2.5 percentile of the Log SPECSFR within the fiber PDF. For galaxies of the star-forming class, emission lines were used (c.f. Brinchmann et al 2004) while for others models were fit to the fibre photometry..</summary>
	--/ <quantity>phys.SFR</quantity>
	--/ <unit>log(M_sol yr-1)</unit>
	[specsfr_fib_p2p5] [real] NOT NULL,

	--/ <summary>The 16th percentile of the Log SPECSFR within the fiber PDF. For galaxies of the star-forming class, emission lines were used (c.f. Brinchmann et al 2004) while for others models were fit to the fibre photometry..</summary>
	--/ <quantity>phys.SFR</quantity>
	--/ <unit>log(M_sol yr-1)</unit>
	[specsfr_fib_p16] [real] NOT NULL,

	--/ <summary>The median estimate of the Log SPECSFR within the fiber PDF. For galaxies of the star-forming class, emission lines were used (c.f. Brinchmann et al 2004) while for others models were fit to the fibre photometry..</summary>
	--/ <quantity>phys.SFR;stat.median</quantity>
	--/ <unit>log(M_sol yr-1)</unit>
	[specsfr_fib_p50] [real] NOT NULL,

	--/ <summary>The 84th percentile of the Log SPECSFR within the fiber PDF. For galaxies of the star-forming class, emission lines were used (c.f. Brinchmann et al 2004) while for others models were fit to the fibre photometry..</summary>
	--/ <quantity>phys.SFR</quantity>
	--/ <unit>log(M_sol yr-1)</unit>
	[specsfr_fib_p84] [real] NOT NULL,

	--/ <summary>The 97.5 percentile of the Log SPECSFR within the fiber PDF. For galaxies of the star-forming class, emission lines were used (c.f. Brinchmann et al 2004) while for others models were fit to the fibre photometry..</summary>
	--/ <quantity>phys.SFR</quantity>
	--/ <unit>log(M_sol yr-1)</unit>
	[specsfr_fib_p97p5] [real] NOT NULL,

	--/ <summary>The entropy (Sum p*lg(p)) of the PDF of the fiber SPECSFR</summary>
	--/ <quantity>phys.SFR;stat.median</quantity>
	[specsfr_fib_entropy] [real] NOT NULL,
 CONSTRAINT [pk_galSpecExtra_specObjID] PRIMARY KEY CLUSTERED 
(
	[specObjID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[galSpecIndx]    Script Date: 4/1/2015 5:51:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--/ <summary> Index measurements of spectra from the MPA-JHU spectroscopic catalogue. </summary>
--/ <remarks> For each index, we give our estimate and error bar.  Measurements  performed as described in Brinchmann et al. 2004. </remarks>
CREATE TABLE [dbo].[galSpecIndx](

	--/ <summary>Unique ID</summary>
	--/ <quantity>meta.id;meta.main</quantity>
	[specObjID] [bigint] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[lick_cn1] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>mag</unit>
	[lick_cn1_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[lick_cn1_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[lick_cn1_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>mag</unit>
	[lick_cn1_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[lick_cn2] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>mag</unit>
	[lick_cn2_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[lick_cn2_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[lick_cn2_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>mag</unit>
	[lick_cn2_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_ca4227] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_ca4227_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_ca4227_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_ca4227_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_ca4227_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_g4300] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_g4300_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_g4300_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_g4300_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_g4300_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_fe4383] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_fe4383_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_fe4383_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_fe4383_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_fe4383_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_ca4455] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_ca4455_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_ca4455_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_ca4455_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_ca4455_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_fe4531] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_fe4531_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_fe4531_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_fe4531_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_fe4531_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_c4668] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_c4668_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_c4668_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_c4668_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_c4668_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_hb] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_hb_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_hb_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_hb_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_hb_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_fe5015] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_fe5015_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_fe5015_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_fe5015_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_fe5015_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[lick_mg1] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>mag</unit>
	[lick_mg1_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[lick_mg1_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[lick_mg1_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>mag</unit>
	[lick_mg1_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[lick_mg2] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>mag</unit>
	[lick_mg2_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[lick_mg2_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[lick_mg2_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>mag</unit>
	[lick_mg2_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_mgb] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_mgb_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_mgb_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_mgb_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_mgb_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_fe5270] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_fe5270_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_fe5270_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_fe5270_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_fe5270_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_fe5335] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_fe5335_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_fe5335_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_fe5335_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_fe5335_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_fe5406] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_fe5406_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_fe5406_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_fe5406_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;</quantity>
	--/ <unit>AA</unit>
	[lick_fe5406_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_fe5709] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_fe5709_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_fe5709_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_fe5709_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_fe5709_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_fe5782] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_fe5782_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_fe5782_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_fe5782_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_fe5782_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_nad] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_nad_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_nad_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_nad_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;</quantity>
	--/ <unit>AA</unit>
	[lick_nad_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[lick_tio1] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>mag</unit>
	[lick_tio1_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[lick_tio1_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[lick_tio1_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>mag</unit>
	[lick_tio1_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[lick_tio2] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>mag</unit>
	[lick_tio2_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[lick_tio2_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[lick_tio2_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>mag</unit>
	[lick_tio2_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_hd_a] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_hd_a_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_hd_a_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_hd_a_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_hd_a_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_hg_a] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_hg_a_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_hg_a_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_hg_a_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_hg_a_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_hd_f] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_hd_f_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_hd_f_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_hd_f_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_hd_f_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_hg_f] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_hg_f_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_hg_f_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_hg_f_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>AA</unit>
	[lick_hg_f_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>AA</unit>
	[dtt_caii8498] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>AA</unit>
	[dtt_caii8498_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>AA</unit>
	[dtt_caii8498_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>AA</unit>
	[dtt_caii8498_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>AA</unit>
	[dtt_caii8498_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>AA</unit>
	[dtt_caii8542] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>AA</unit>
	[dtt_caii8542_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>AA</unit>
	[dtt_caii8542_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>AA</unit>
	[dtt_caii8542_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>AA</unit>
	[dtt_caii8542_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>AA</unit>
	[dtt_caii8662] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>AA</unit>
	[dtt_caii8662_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>AA</unit>
	[dtt_caii8662_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>AA</unit>
	[dtt_caii8662_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>AA</unit>
	[dtt_caii8662_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>AA</unit>
	[dtt_mgi8807] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>spect.index;stat.error;spect.index</quantity>
	--/ <unit>AA</unit>
	[dtt_mgi8807_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>AA</unit>
	[dtt_mgi8807_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>AA</unit>
	[dtt_mgi8807_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>AA</unit>
	[dtt_mgi8807_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_cnb] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_cnb_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_cnb_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_cnb_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_cnb_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_hk] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_hk_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_hk_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_hk_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_hk_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_cai] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_cai_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_cai_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_cai_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_cai_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_g] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_g_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_g_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_g_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_g_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_hb] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_hb_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_hb_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_hb_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_hb_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_mgg] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_mgg_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_mgg_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_mgg_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_mgg_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_mh] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_mh_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_mh_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_mh_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_mh_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_fc] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_fc_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_fc_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_fc_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_fc_sub_err] [real] NOT NULL,

	--/ <summary>Restframe index measurement</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_nad] [real] NOT NULL,

	--/ <summary>Error on index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_nad_err] [real] NOT NULL,

	--/ <summary>Index of best fit model spectrum</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_nad_model] [real] NOT NULL,

	--/ <summary>Restframe index measurement on the data after subtracting all 3-sigma emission lines</summary>
	--/ <quantity>spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_nad_sub] [real] NOT NULL,

	--/ <summary>Error in the above index measurement</summary>
	--/ <quantity>stat.error;spect.index</quantity>
	--/ <unit>mag</unit>
	[bh_nad_sub_err] [real] NOT NULL,

	--/ <summary>4000AA break, Bruzual (1983) definition</summary>
	--/ <quantity>spect.continuum.break</quantity>
	[d4000] [real] NOT NULL,

	--/ <summary>Uncertainty estimate for 4000AA break, Bruzual (1983) definition</summary>
	--/ <quantity>stat.error;spect.continuum.break</quantity>
	[d4000_err] [real] NOT NULL,

	--/ <summary>4000AA break, Bruzual (1983) definition measured off best-fit CB08 model</summary>
	--/ <quantity>spect.continuum.break</quantity>
	[d4000_model] [real] NOT NULL,

	--/ <summary>4000AA break, Bruzual (1983) definition after correction for emission lines</summary>
	--/ <quantity>spect.continuum.break</quantity>
	[d4000_sub] [real] NOT NULL,

	--/ <summary>Uncertainty estimate for 4000AA break, Bruzual (1983) definition after correction for emission lines</summary>
	--/ <quantity>stat.error;spect.continuum.break</quantity>
	[d4000_sub_err] [real] NOT NULL,

	--/ <summary>4000AA break, Balogh et al (1999) definition</summary>
	--/ <quantity>spect.continuum.break</quantity>
	[d4000_n] [real] NOT NULL,

	--/ <summary>Uncertainty estimate for 4000AA break, Balogh et al (1999) definition</summary>
	--/ <quantity>stat.error;spect.continuum.break</quantity>
	[d4000_n_err] [real] NOT NULL,

	--/ <summary>4000AA break, Balogh et al (1999) definition measured off best-fit CB08 model</summary>
	--/ <quantity>spect.continuum.break</quantity>
	[d4000_n_model] [real] NOT NULL,

	--/ <summary>4000AA break, Balogh et al (1999) definition after correction for emission lines</summary>
	--/ <quantity>spect.continuum.break</quantity>
	[d4000_n_sub] [real] NOT NULL,

	--/ <summary>Uncertainty estimate for 4000AA break, Balogh et al (1999) definition after correction for emission lines</summary>
	--/ <quantity>stat.error;spect.continuum.break</quantity>
	[d4000_n_sub_err] [real] NOT NULL,

	--/ <summary>The flux in the red window of the Bruzual (1983) definition of D4000</summary>
	--/ <quantity>phot.flux</quantity>
	[d4000_red] [real] NOT NULL,

	--/ <summary>The flux in the blue window of the Bruzual (1983) definition of D4000</summary>
	--/ <quantity>phot.flux</quantity>
	[d4000_blue] [real] NOT NULL,

	--/ <summary>The flux in the red window of the Balogh et al (1999) definition of D4000</summary>
	--/ <quantity>phot.flux</quantity>
	[d4000_n_red] [real] NOT NULL,

	--/ <summary>The flux in the blue window of the Balogh et al (1999) definition of D4000</summary>
	--/ <quantity>phot.flux</quantity>
	[d4000_n_blue] [real] NOT NULL,

	--/ <summary>The flux in the red window of the Bruzual (1983) definition of D4000 after subtraction of emission lines</summary>
	--/ <quantity>phot.flux</quantity>
	[d4000_sub_red] [real] NOT NULL,

	--/ <summary>The flux in the blue window of the Bruzual (1983) definition of D4000 after subtraction of emission lines</summary>
	--/ <quantity>phot.flux</quantity>
	[d4000_sub_blue] [real] NOT NULL,

	--/ <summary>The flux in the red window of the Balogh et al (1999) definition of D4000 after subtraction of emission lines</summary>
	--/ <quantity>phot.flux</quantity>
	[d4000_n_sub_red] [real] NOT NULL,

	--/ <summary>The flux in the blue window of the Balogh et al (1999)q definition of D4000 after subtraction of emission lines</summary>
	--/ <quantity>phot.flux</quantity>
	[d4000_n_sub_blue] [real] NOT NULL,

	--/ <summary>Dust attenuation of the best fit Z=0.004 CB08 model</summary>
	--/ <quantity>stat.fit.param</quantity>
	[tauv_model_040] [real] NOT NULL,

	--/ <summary>The scaling coefficients of the best fit Z=0.004 CB08 model</summary>
	--/ <quantity>stat.fit.param</quantity>
	[model_coef_040] [real] NOT NULL,

	--/ <summary>The chi^2 of the best fit Z=0.004 CB08 model</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[model_chisq_040] [real] NOT NULL,

	--/ <summary>Dust attenuation of the best fit Z=0.008 CB08 model</summary>
	--/ <quantity>stat.fit.param</quantity>
	[tauv_model_080] [real] NOT NULL,

	--/ <summary>The scaling coefficients of the best fit Z=0.008 CB08 model</summary>
	--/ <quantity>stat.fit.param</quantity>
	[model_coef_080] [real] NOT NULL,

	--/ <summary>The chi^2 of the best fit Z=0.008 CB08 model</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[model_chisq_080] [real] NOT NULL,

	--/ <summary>Dust attenuation of the best fit Z=0.017 CB08 model</summary>
	--/ <quantity>stat.fit.param</quantity>
	[tauv_model_170] [real] NOT NULL,

	--/ <summary>The scaling coefficients of the best fit Z=0.017 CB08 model</summary>
	--/ <quantity>stat.fit.param</quantity>
	[model_coef_170] [real] NOT NULL,

	--/ <summary>The chi^2 of the best fit Z=0.017 CB08 model</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[model_chisq_170] [real] NOT NULL,

	--/ <summary>Dust attenuation of the best fit Z=0.04 CB08 model</summary>
	--/ <quantity>stat.fit.param</quantity>
	[tauv_model_400] [real] NOT NULL,

	--/ <summary>The scaling coefficients of the best fit Z=0.04 CB08 model</summary>
	--/ <quantity>stat.fit.param</quantity>
	[model_coef_400] [real] NOT NULL,

	--/ <summary>The chi^2 of the best fit Z=0.04 CB08 model</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[model_chisq_400] [real] NOT NULL,

	--/ <summary>Metallicity of best fitting (min chisq) model Z = 0.004 / 0.017 / 0.050 (0.2 1.0, 2.5 x solar)</summary>
	--/ <quantity>phys.abund.Z</quantity>
	[best_model_z] [real] NOT NULL,

	--/ <summary>V-band optical depth (TauV = A_V / 1.086) affecting the stars from best fit model (best of 4 Z's)</summary>
	--/ <quantity>phys.absorption.opticalDepth;em.opt.V</quantity>
	[tauv_cont] [real] NOT NULL,

	--/ <summary>Coeficients of best fit model (best of 4 Z's)</summary>
	--/ <quantity>stat.fit.param</quantity>
	[model_coef] [real] NOT NULL,

	--/ <summary>Reduced chi-squared of best fit model (best of 4 Z's)</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[model_chisq] [real] NOT NULL,
 CONSTRAINT [pk_galSpecIndx_specObjID] PRIMARY KEY CLUSTERED 
(
	[specObjID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[galSpecInfo]    Script Date: 4/1/2015 5:51:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

--/ <summary> General information for the MPA-JHU spectroscopic re-analysis </summary>
--/ <remarks> This table contains one entry per spectroscopic observation  It may be joined with the other galSpec tables with the  measurements, or to specObjAll, using specObjId.  Numbers  given here are for the version of data used by the MPA-JHU  and may not be in perfect agreement with specObjAll. </remarks>
CREATE TABLE [dbo].[galSpecInfo](

	--/ <summary>Unique ID</summary>
	--/ <quantity>meta.id;meta.main</quantity>
	[specObjID] [bigint] NOT NULL,

	--/ <summary>Plate number</summary>
	--/ <quantity>meta.id</quantity>
	[plateid] [smallint] NOT NULL,

	--/ <summary>Modified Julian Date of plate observation</summary>
	--/ <quantity>time.epoch;obs</quantity>
	[mjd] [int] NOT NULL,

	--/ <summary>Fiber number (1 - 640)</summary>
	--/ <quantity>meta.id;instr.param</quantity>
	[fiberid] [smallint] NOT NULL,

	--/ <summary>Right Ascention of drilled fiber position</summary>
	--/ <quantity>pos.eq.ra</quantity>
	--/ <unit>deg</unit>
	[ra] [real] NOT NULL,

	--/ <summary>Declination of drilled fiber position</summary>
	--/ <quantity>pos.eq.dec</quantity>
	--/ <unit>deg</unit>
	[dec] [real] NOT NULL,

	--/ <summary>Primary Target Flag (MAIN galaxy = 64)</summary>
	--/ <quantity>meta.code</quantity>
	[primtarget] [smallint] NOT NULL,

	--/ <summary>Secondary Target Flag (QA = 8)</summary>
	--/ <quantity>meta.code</quantity>
	[sectarget] [smallint] NOT NULL,

	--/ <summary>Text version of primary target (GALAXY/QA/QSO/ROSAT_D)</summary>
	--/ <quantity>meta.note</quantity>
	[targettype] [varchar](32) NOT NULL,

	--/ <summary>Schlegel classification of spectrum ... code is only run where this is set to "GALAXY"</summary>
	--/ <quantity>src.class</quantity>
	[spectrotype] [varchar](32) NOT NULL,

	--/ <summary>Schlegel subclass from PCA analysis -- not alwasy correct!! AGN/BROADLINE/STARBURST/STARFORMING</summary>
	--/ <quantity>src.class</quantity>
	[subclass] [varchar](32) NOT NULL,

	--/ <summary>Redshift from Schlegel</summary>
	--/ <quantity>src.redshift</quantity>
	[z] [real] NOT NULL,

	--/ <summary>Redshift error</summary>
	--/ <quantity>stat.error;src.redshift</quantity>
	[z_err] [real] NOT NULL,

	--/ <summary>Bad redshift if this is non-zero -- see Schlegel data model</summary>
	--/ <quantity>meta.code;src.redshift</quantity>
	[z_warning] [smallint] NOT NULL,

	--/ <summary>Velocity dispersion from Schlegel</summary>
	--/ <quantity>phys.veloc.dispersion</quantity>
	--/ <unit>km s-1</unit>
	[v_disp] [real] NOT NULL,

	--/ <summary>Velocity dispersion error (negative for invalid fit)</summary>
	--/ <quantity>stat.error;phys.veloc.dispersion</quantity>
	--/ <unit>km s-1</unit>
	[v_disp_err] [real] NOT NULL,

	--/ <summary>Median S/N per pixel of the whole spectrum</summary>
	--/ <quantity>stat.snr;stat.median</quantity>
	[sn_median] [real] NOT NULL,

	--/ <summary>E(B-V) of foreground reddening from SFD maps</summary>
	--/ <quantity>phot.color.excess</quantity>
	[e_bv_sfd] [real] NOT NULL,

	--/ <summary>Data Release (dr1/dr2/dr3/dr4)</summary>
	--/ <quantity>meta.version</quantity>
	[release] [varchar](32) NOT NULL,

	--/ <summary>has "reliable" line measurements and physical parameters</summary>
	--/ <quantity>meta.code</quantity>
	[reliable] [smallint] NOT NULL,
 CONSTRAINT [pk_galSpecInfo_specObjID] PRIMARY KEY CLUSTERED 
(
	[specObjID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[galSpecLine]    Script Date: 4/1/2015 5:51:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--/ <summary> Emission line measurements from MPA-JHU spectroscopic reanalysis </summary>
--/ <remarks> The table contains one entry per spectroscopic observation derived as   described in Tremonti et al (2004) and Brinchmann et al (2004). </remarks>
CREATE TABLE [dbo].[galSpecLine](

	--/ <summary>Unique ID</summary>
	--/ <quantity>meta.id;meta.main</quantity>
	[specObjID] [bigint] NOT NULL,

	--/ <summary>Velocity dispersion (sigma not FWHM) measured simultaneously in all of the Balmer lines</summary>
	--/ <quantity>phys.veloc.dispersion</quantity>
	--/ <unit>km s-1</unit>
	[sigma_balmer] [real] NOT NULL,

	--/ <summary>Error in the above</summary>
	--/ <quantity>stat.error;phys.veloc.dispersion</quantity>
	--/ <unit>km s-1</unit>
	[sigma_balmer_err] [real] NOT NULL,

	--/ <summary>Velocity dispersion (sigma not FWHM) measured simultaneously in all the forbidden lines</summary>
	--/ <quantity>phys.veloc.dispersion</quantity>
	--/ <unit>km s-1</unit>
	[sigma_forbidden] [real] NOT NULL,

	--/ <summary>Error in the above</summary>
	--/ <quantity>stat.error;phys.veloc.dispersion</quantity>
	--/ <unit>km s-1</unit>
	[sigma_forbidden_err] [real] NOT NULL,

	--/ <summary>Velocity offset of the Balmer lines from the measured redshift</summary>
	--/ <quantity>phys.veloc</quantity>
	--/ <unit>km s-1</unit>
	[v_off_balmer] [real] NOT NULL,

	--/ <summary>Error in the above</summary>
	--/ <quantity>stat.error;phys.veloc</quantity>
	--/ <unit>km s-1</unit>
	[v_off_balmer_err] [real] NOT NULL,

	--/ <summary>Velocity offset of the forbidden lines from the measured redshift</summary>
	--/ <quantity>phys.veloc</quantity>
	--/ <unit>km s-1</unit>
	[v_off_forbidden] [real] NOT NULL,

	--/ <summary>Error in the above</summary>
	--/ <quantity>stat.error;phys.veloc</quantity>
	--/ <unit>km s-1</unit>
	[v_off_forbidden_err] [real] NOT NULL,

	--/ <summary>Continuum at line center from 200 pixel median smoothing of the emission-line subtracted continuum</summary>
	--/ <quantity>phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 erg s-1 cm-2 AA-1</unit>
	[oii_3726_cont] [real] NOT NULL,

	--/ <summary>Error in the continuum computed from the variance in the band pass</summary>
	--/ <quantity>stat.error;phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 erg s-1 cm-2 AA-1</unit>
	[oii_3726_cont_err] [real] NOT NULL,

	--/ <summary>The equivalent width of the continuum-subtracted emission line computed from straight integration over the bandpasses listed below (emisison is negative). In this case the continuum comes from a running 200 pixel median and does not properly account for stellar absorption. In general the EQW measurements provide a better measure of the true equivalent width. The purpose of this measurement is to help characterize the stellar absorption effecting the line. (EW_stellar = REQW - EQW)</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[oii_3726_reqw] [real] NOT NULL,

	--/ <summary>Error in the equivalent width described above</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[oii_3726_reqw_err] [real] NOT NULL,

	--/ <summary>The equivalent width of the CB08 continuum-subtracted emission line computed from straight integration over the bandpasses listed below (emisison is negative) . This properly takes into account stellar absorption. Note that it will not be correct in the case of blended lines (ie NII &amp; H-alpha) -- instead use FLUX/CONT.</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[oii_3726_eqw] [real] NOT NULL,

	--/ <summary>Error in the equivalent width described above</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[oii_3726_eqw_err] [real] NOT NULL,

	--/ <summary>Flux from Gaussian fit to continuum subtracted data. (Note that the fit is done simultaneously to all the lines so de-blending happens automatically)</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[oii_3726_flux] [real] NOT NULL,

	--/ <summary>Error in the flux</summary>
	--/ <quantity>stat.error;phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[oii_3726_flux_err] [real] NOT NULL,

	--/ <summary>Instrumental resolution at the line center (measured for each spectrum from the ARC lamps)</summary>
	--/ <quantity>spect.resolution</quantity>
	--/ <unit>km s-1</unit>
	[oii_3726_inst_res] [real] NOT NULL,

	--/ <summary>Reduced chi-squared of the line fit over the bandpass used for the EW measurement</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[oii_3726_chisq] [real] NOT NULL,

	--/ <summary>Continuum at line center from 200 pixel median smoothing of the emission-line subtracted continuum</summary>
	--/ <quantity>phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 erg s-1 cm-2 AA-1</unit>
	[oii_3729_cont] [real] NOT NULL,

	--/ <summary>Error in the continuum computed from the variance in the band pass</summary>
	--/ <quantity>stat.error;phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 erg s-1 cm-2 AA-1</unit>
	[oii_3729_cont_err] [real] NOT NULL,

	--/ <summary>The equivalent width of the continuum-subtracted emission line computed from straight integration over the bandpasses listed below (emisison is negative). In this case the continuum comes from a running 200 pixel median and does not properly account for stellar absorption. In general the EQW measurements provide a better measure of the true equivalent width. The purpose of this measurement is to help characterize the stellar absorption effecting the line. (EW_stellar = REQW - EQW)</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[oii_3729_reqw] [real] NOT NULL,

	--/ <summary>Error in the equivalent width described above</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[oii_3729_reqw_err] [real] NOT NULL,

	--/ <summary>The equivalent width of the CB08 continuum-subtracted emission line computed from straight integration over the bandpasses listed below (emisison is negative) . This properly takes into account stellar absorption. Note that it will not be correct in the case of blended lines (ie NII &amp; H-alpha) -- instead use FLUX/CONT.</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[oii_3729_eqw] [real] NOT NULL,

	--/ <summary>Error in the equivalent width described above</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[oii_3729_eqw_err] [real] NOT NULL,

	--/ <summary>Flux from Gaussian fit to continuum subtracted data. (Note that the fit is done simultaneously to all the lines so de-blending happens automatically)</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[oii_3729_flux] [real] NOT NULL,

	--/ <summary>Error in the flux</summary>
	--/ <quantity>stat.error;phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[oii_3729_flux_err] [real] NOT NULL,

	--/ <summary>Instrumental resolution at the line center (measured for each spectrum from the ARC lamps)</summary>
	--/ <quantity>spect.resolution</quantity>
	--/ <unit>km s-1</unit>
	[oii_3729_inst_res] [real] NOT NULL,

	--/ <summary>Reduced chi-squared of the line fit over the bandpass used for the EW measurement</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[oii_3729_chisq] [real] NOT NULL,

	--/ <summary>Continuum at line center from 200 pixel median smoothing of the emission-line subtracted continuum</summary>
	--/ <quantity>phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 erg s-1 cm-2 AA-1</unit>
	[neiii_3869_cont] [real] NOT NULL,

	--/ <summary>Error in the continuum computed from the variance in the band pass</summary>
	--/ <quantity>stat.error;phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 erg s-1 cm-2 AA-1</unit>
	[neiii_3869_cont_err] [real] NOT NULL,

	--/ <summary>The equivalent width of the continuum-subtracted emission line computed from straight integration over the bandpasses listed below (emisison is negative). In this case the continuum comes from a running 200 pixel median and does not properly account for stellar absorption. In general the EQW measurements provide a better measure of the true equivalent width. The purpose of this measurement is to help characterize the stellar absorption effecting the line. (EW_stellar = REQW - EQW)</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[neiii_3869_reqw] [real] NOT NULL,

	--/ <summary>Error in the equivalent width described above</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[neiii_3869_reqw_err] [real] NOT NULL,

	--/ <summary>The equivalent width of the CB08 continuum-subtracted emission line computed from straight integration over the bandpasses listed below (emisison is negative) . This properly takes into account stellar absorption. Note that it will not be correct in the case of blended lines (ie NII &amp; H-alpha) -- instead use FLUX/CONT.</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[neiii_3869_eqw] [real] NOT NULL,

	--/ <summary>Error in the equivalent width described above</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[neiii_3869_eqw_err] [real] NOT NULL,

	--/ <summary>Flux from Gaussian fit to continuum subtracted data. (Note that the fit is done simultaneously to all the lines so de-blending happens automatically)</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[neiii_3869_flux] [real] NOT NULL,

	--/ <summary>Error in the flux</summary>
	--/ <quantity>stat.error;phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[neiii_3869_flux_err] [real] NOT NULL,

	--/ <summary>Instrumental resolution at the line center (measured for each spectrum from the ARC lamps)</summary>
	--/ <quantity>spect.resolution</quantity>
	--/ <unit>km s-1</unit>
	[neiii_3869_inst_res] [real] NOT NULL,

	--/ <summary>Reduced chi-squared of the line fit over the bandpass used for the EW measurement</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[neiii_3869_chisq] [real] NOT NULL,

	--/ <summary>Continuum at line center from 200 pixel median smoothing of the emission-line subtracted continuum</summary>
	--/ <quantity>phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 erg s-1 cm-2 AA-1</unit>
	[h_delta_cont] [real] NOT NULL,

	--/ <summary>Error in the continuum computed from the variance in the band pass</summary>
	--/ <quantity>stat.error;phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 erg s-1 cm-2 AA-1</unit>
	[h_delta_cont_err] [real] NOT NULL,

	--/ <summary>The equivalent width of the continuum-subtracted emission line computed from straight integration over the bandpasses listed below (emisison is negative). In this case the continuum comes from a running 200 pixel median and does not properly account for stellar absorption. In general the EQW measurements provide a better measure of the true equivalent width. The purpose of this measurement is to help characterize the stellar absorption effecting the line. (EW_stellar = REQW - EQW)</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[h_delta_reqw] [real] NOT NULL,

	--/ <summary>Error in the equivalent width described above</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[h_delta_reqw_err] [real] NOT NULL,

	--/ <summary>The equivalent width of the CB08 continuum-subtracted emission line computed from straight integration over the bandpasses listed below (emisison is negative) . This properly takes into account stellar absorption. Note that it will not be correct in the case of blended lines (ie NII &amp; H-alpha) -- instead use FLUX/CONT.</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[h_delta_eqw] [real] NOT NULL,

	--/ <summary>Error in the equivalent width described above</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[h_delta_eqw_err] [real] NOT NULL,

	--/ <summary>Flux from Gaussian fit to continuum subtracted data. (Note that the fit is done simultaneously to all the lines so de-blending happens automatically)</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[h_delta_flux] [real] NOT NULL,

	--/ <summary>Error in the flux</summary>
	--/ <quantity>stat.error;phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[h_delta_flux_err] [real] NOT NULL,

	--/ <summary>Instrumental resolution at the line center (measured for each spectrum from the ARC lamps)</summary>
	--/ <quantity>spect.resolution</quantity>
	--/ <unit>km s-1</unit>
	[h_delta_inst_res] [real] NOT NULL,

	--/ <summary>Reduced chi-squared of the line fit over the bandpass used for the EW measurement</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[h_delta_chisq] [real] NOT NULL,

	--/ <summary>Continuum at line center from 200 pixel median smoothing of the emission-line subtracted continuum</summary>
	--/ <quantity>phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 erg s-1 cm-2 AA-1</unit>
	[h_gamma_cont] [real] NOT NULL,

	--/ <summary>Error in the continuum computed from the variance in the band pass</summary>
	--/ <quantity>stat.error;phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 erg s-1 cm-2 AA-1</unit>
	[h_gamma_cont_err] [real] NOT NULL,

	--/ <summary>The equivalent width of the continuum-subtracted emission line computed from straight integration over the bandpasses listed below (emisison is negative). In this case the continuum comes from a running 200 pixel median and does not properly account for stellar absorption. In general the EQW measurements provide a better measure of the true equivalent width. The purpose of this measurement is to help characterize the stellar absorption effecting the line. (EW_stellar = REQW - EQW)</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[h_gamma_reqw] [real] NOT NULL,

	--/ <summary>Error in the equivalent width described above</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[h_gamma_reqw_err] [real] NOT NULL,

	--/ <summary>The equivalent width of the CB08 continuum-subtracted emission line computed from straight integration over the bandpasses listed below (emisison is negative) . This properly takes into account stellar absorption. Note that it will not be correct in the case of blended lines (ie NII &amp; H-alpha) -- instead use FLUX/CONT.</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[h_gamma_eqw] [real] NOT NULL,

	--/ <summary>Error in the equivalent width described above</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[h_gamma_eqw_err] [real] NOT NULL,

	--/ <summary>Flux from Gaussian fit to continuum subtracted data. (Note that the fit is done simultaneously to all the lines so de-blending happens automatically)</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[h_gamma_flux] [real] NOT NULL,

	--/ <summary>Error in the flux</summary>
	--/ <quantity>stat.error;phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[h_gamma_flux_err] [real] NOT NULL,

	--/ <summary>Instrumental resolution at the line center (measured for each spectrum from the ARC lamps)</summary>
	--/ <quantity>spect.resolution</quantity>
	--/ <unit>km s-1</unit>
	[h_gamma_inst_res] [real] NOT NULL,

	--/ <summary>Reduced chi-squared of the line fit over the bandpass used for the EW measurement</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[h_gamma_chisq] [real] NOT NULL,

	--/ <summary>Continuum at line center from 200 pixel median smoothing of the emission-line subtracted continuum</summary>
	--/ <quantity>phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 erg s-1 cm-2 AA-1</unit>
	[oiii_4363_cont] [real] NOT NULL,

	--/ <summary>Error in the continuum computed from the variance in the band pass</summary>
	--/ <quantity>stat.error;phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 erg s-1 cm-2 AA-1</unit>
	[oiii_4363_cont_err] [real] NOT NULL,

	--/ <summary>The equivalent width of the continuum-subtracted emission line computed from straight integration over the bandpasses listed below (emisison is negative). In this case the continuum comes from a running 200 pixel median and does not properly account for stellar absorption. In general the EQW measurements provide a better measure of the true equivalent width. The purpose of this measurement is to help characterize the stellar absorption effecting the line. (EW_stellar = REQW - EQW)</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[oiii_4363_reqw] [real] NOT NULL,

	--/ <summary>Error in the equivalent width described above</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[oiii_4363_reqw_err] [real] NOT NULL,

	--/ <summary>The equivalent width of the CB08 continuum-subtracted emission line computed from straight integration over the bandpasses listed below (emisison is negative) . This properly takes into account stellar absorption. Note that it will not be correct in the case of blended lines (ie NII &amp; H-alpha) -- instead use FLUX/CONT.</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[oiii_4363_eqw] [real] NOT NULL,

	--/ <summary>Error in the equivalent width described above</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[oiii_4363_eqw_err] [real] NOT NULL,

	--/ <summary>Flux from Gaussian fit to continuum subtracted data. (Note that the fit is done simultaneously to all the lines so de-blending happens automatically)</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[oiii_4363_flux] [real] NOT NULL,

	--/ <summary>Error in the flux</summary>
	--/ <quantity>stat.error;phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[oiii_4363_flux_err] [real] NOT NULL,

	--/ <summary>Instrumental resolution at the line center (measured for each spectrum from the ARC lamps)</summary>
	--/ <quantity>spect.resolution</quantity>
	--/ <unit>km s-1</unit>
	[oiii_4363_inst_res] [real] NOT NULL,

	--/ <summary>Reduced chi-squared of the line fit over the bandpass used for the EW measurement</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[oiii_4363_chisq] [real] NOT NULL,

	--/ <summary>Continuum at line center from 200 pixel median smoothing of the emission-line subtracted continuum</summary>
	--/ <quantity>phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 erg s-1 cm-2 AA-1</unit>
	[h_beta_cont] [real] NOT NULL,

	--/ <summary>Error in the continuum computed from the variance in the band pass</summary>
	--/ <quantity>stat.error;phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 erg s-1 cm-2 AA-1</unit>
	[h_beta_cont_err] [real] NOT NULL,

	--/ <summary>The equivalent width of the continuum-subtracted emission line computed from straight integration over the bandpasses listed below (emisison is negative). In this case the continuum comes from a running 200 pixel median and does not properly account for stellar absorption. In general the EQW measurements provide a better measure of the true equivalent width. The purpose of this measurement is to help characterize the stellar absorption effecting the line. (EW_stellar = REQW - EQW)</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[h_beta_reqw] [real] NOT NULL,

	--/ <summary>Error in the equivalent width described above</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[h_beta_reqw_err] [real] NOT NULL,

	--/ <summary>The equivalent width of the CB08 continuum-subtracted emission line computed from straight integration over the bandpasses listed below (emisison is negative) . This properly takes into account stellar absorption. Note that it will not be correct in the case of blended lines (ie NII &amp; H-alpha) -- instead use FLUX/CONT.</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[h_beta_eqw] [real] NOT NULL,

	--/ <summary>Error in the equivalent width described above</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[h_beta_eqw_err] [real] NOT NULL,

	--/ <summary>Flux from Gaussian fit to continuum subtracted data. (Note that the fit is done simultaneously to all the lines so de-blending happens automatically)</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[h_beta_flux] [real] NOT NULL,

	--/ <summary>Error in the flux</summary>
	--/ <quantity>stat.error;phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[h_beta_flux_err] [real] NOT NULL,

	--/ <summary>Instrumental resolution at the line center (measured for each spectrum from the ARC lamps)</summary>
	--/ <quantity>spect.resolution</quantity>
	--/ <unit>km s-1</unit>
	[h_beta_inst_res] [real] NOT NULL,

	--/ <summary>Reduced chi-squared of the line fit over the bandpass used for the EW measurement</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[h_beta_chisq] [real] NOT NULL,

	--/ <summary>Continuum at line center from 200 pixel median smoothing of the emission-line subtracted continuum</summary>
	--/ <quantity>phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 erg s-1 cm-2 AA-1</unit>
	[oiii_4959_cont] [real] NOT NULL,

	--/ <summary>Error in the continuum computed from the variance in the band pass</summary>
	--/ <quantity>stat.error;phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 erg s-1 cm-2 AA-1</unit>
	[oiii_4959_cont_err] [real] NOT NULL,

	--/ <summary>The equivalent width of the continuum-subtracted emission line computed from straight integration over the bandpasses listed below (emisison is negative). In this case the continuum comes from a running 200 pixel median and does not properly account for stellar absorption. In general the EQW measurements provide a better measure of the true equivalent width. The purpose of this measurement is to help characterize the stellar absorption effecting the line. (EW_stellar = REQW - EQW)</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[oiii_4959_reqw] [real] NOT NULL,

	--/ <summary>Error in the equivalent width described above</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[oiii_4959_reqw_err] [real] NOT NULL,

	--/ <summary>The equivalent width of the CB08 continuum-subtracted emission line computed from straight integration over the bandpasses listed below (emisison is negative) . This properly takes into account stellar absorption. Note that it will not be correct in the case of blended lines (ie NII &amp; H-alpha) -- instead use FLUX/CONT.</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[oiii_4959_eqw] [real] NOT NULL,

	--/ <summary>Error in the equivalent width described above</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[oiii_4959_eqw_err] [real] NOT NULL,

	--/ <summary>Flux from Gaussian fit to continuum subtracted data. (Note that the fit is done simultaneously to all the lines so de-blending happens automatically)</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[oiii_4959_flux] [real] NOT NULL,

	--/ <summary>Error in the flux</summary>
	--/ <quantity>stat.error;phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[oiii_4959_flux_err] [real] NOT NULL,

	--/ <summary>Instrumental resolution at the line center (measured for each spectrum from the ARC lamps)</summary>
	--/ <quantity>spect.resolution</quantity>
	--/ <unit>km s-1</unit>
	[oiii_4959_inst_res] [real] NOT NULL,

	--/ <summary>Reduced chi-squared of the line fit over the bandpass used for the EW measurement</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[oiii_4959_chisq] [real] NOT NULL,

	--/ <summary>Continuum at line center from 200 pixel median smoothing of the emission-line subtracted continuum</summary>
	--/ <quantity>phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 erg s-1 cm-2 AA-1</unit>
	[oiii_5007_cont] [real] NOT NULL,

	--/ <summary>Error in the continuum computed from the variance in the band pass</summary>
	--/ <quantity>stat.error;phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 erg s-1 cm-2 AA-1</unit>
	[oiii_5007_cont_err] [real] NOT NULL,

	--/ <summary>The equivalent width of the continuum-subtracted emission line computed from straight integration over the bandpasses listed below (emisison is negative). In this case the continuum comes from a running 200 pixel median and does not properly account for stellar absorption. In general the EQW measurements provide a better measure of the true equivalent width. The purpose of this measurement is to help characterize the stellar absorption effecting the line. (EW_stellar = REQW - EQW)</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[oiii_5007_reqw] [real] NOT NULL,

	--/ <summary>Error in the equivalent width described above</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[oiii_5007_reqw_err] [real] NOT NULL,

	--/ <summary>The equivalent width of the CB08 continuum-subtracted emission line computed from straight integration over the bandpasses listed below (emisison is negative) . This properly takes into account stellar absorption. Note that it will not be correct in the case of blended lines (ie NII &amp; H-alpha) -- instead use FLUX/CONT.</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[oiii_5007_eqw] [real] NOT NULL,

	--/ <summary>Error in the equivalent width described above</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[oiii_5007_eqw_err] [real] NOT NULL,

	--/ <summary>Flux from Gaussian fit to continuum subtracted data. (Note that the fit is done simultaneously to all the lines so de-blending happens automatically)</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[oiii_5007_flux] [real] NOT NULL,

	--/ <summary>Error in the flux</summary>
	--/ <quantity>stat.error;phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[oiii_5007_flux_err] [real] NOT NULL,

	--/ <summary>Instrumental resolution at the line center (measured for each spectrum from the ARC lamps)</summary>
	--/ <quantity>spect.resolution</quantity>
	--/ <unit>km s-1</unit>
	[oiii_5007_inst_res] [real] NOT NULL,

	--/ <summary>Reduced chi-squared of the line fit over the bandpass used for the EW measurement</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[oiii_5007_chisq] [real] NOT NULL,

	--/ <summary>Continuum at line center from 200 pixel median smoothing of the emission-line subtracted continuum</summary>
	--/ <quantity>phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 erg s-1 cm-2 AA-1</unit>
	[hei_5876_cont] [real] NOT NULL,

	--/ <summary>Error in the continuum computed from the variance in the band pass</summary>
	--/ <quantity>stat.error;phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 erg s-1 cm-2 AA-1</unit>
	[hei_5876_cont_err] [real] NOT NULL,

	--/ <summary>The equivalent width of the continuum-subtracted emission line computed from straight integration over the bandpasses listed below (emisison is negative). In this case the continuum comes from a running 200 pixel median and does not properly account for stellar absorption. In general the EQW measurements provide a better measure of the true equivalent width. The purpose of this measurement is to help characterize the stellar absorption effecting the line. (EW_stellar = REQW - EQW)</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[hei_5876_reqw] [real] NOT NULL,

	--/ <summary>Error in the equivalent width described above</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[hei_5876_reqw_err] [real] NOT NULL,

	--/ <summary>The equivalent width of the CB08 continuum-subtracted emission line computed from straight integration over the bandpasses listed below (emisison is negative) . This properly takes into account stellar absorption. Note that it will not be correct in the case of blended lines (ie NII &amp; H-alpha) -- instead use FLUX/CONT.</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[hei_5876_eqw] [real] NOT NULL,

	--/ <summary>Error in the equivalent width described above</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[hei_5876_eqw_err] [real] NOT NULL,

	--/ <summary>Flux from Gaussian fit to continuum subtracted data. (Note that the fit is done simultaneously to all the lines so de-blending happens automatically)</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[hei_5876_flux] [real] NOT NULL,

	--/ <summary>Error in the flux</summary>
	--/ <quantity>stat.error;phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[hei_5876_flux_err] [real] NOT NULL,

	--/ <summary>Instrumental resolution at the line center (measured for each spectrum from the ARC lamps)</summary>
	--/ <quantity>spect.resolution</quantity>
	--/ <unit>km s-1</unit>
	[hei_5876_inst_res] [real] NOT NULL,

	--/ <summary>Reduced chi-squared of the line fit over the bandpass used for the EW measurement</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[hei_5876_chisq] [real] NOT NULL,

	--/ <summary>Continuum at line center from 200 pixel median smoothing of the emission-line subtracted continuum</summary>
	--/ <quantity>phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 erg s-1 cm-2 AA-1</unit>
	[oi_6300_cont] [real] NOT NULL,

	--/ <summary>Error in the continuum computed from the variance in the band pass</summary>
	--/ <quantity>stat.error;phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 erg s-1 cm-2 AA-1</unit>
	[oi_6300_cont_err] [real] NOT NULL,

	--/ <summary>The equivalent width of the continuum-subtracted emission line computed from straight integration over the bandpasses listed below (emisison is negative). In this case the continuum comes from a running 200 pixel median and does not properly account for stellar absorption. In general the EQW measurements provide a better measure of the true equivalent width. The purpose of this measurement is to help characterize the stellar absorption effecting the line. (EW_stellar = REQW - EQW)</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[oi_6300_reqw] [real] NOT NULL,

	--/ <summary>Error in the equivalent width described above</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[oi_6300_reqw_err] [real] NOT NULL,

	--/ <summary>The equivalent width of the CB08 continuum-subtracted emission line computed from straight integration over the bandpasses listed below (emisison is negative) . This properly takes into account stellar absorption. Note that it will not be correct in the case of blended lines (ie NII &amp; H-alpha) -- instead use FLUX/CONT.</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[oi_6300_eqw] [real] NOT NULL,

	--/ <summary>Error in the equivalent width described above</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[oi_6300_eqw_err] [real] NOT NULL,

	--/ <summary>Flux from Gaussian fit to continuum subtracted data. (Note that the fit is done simultaneously to all the lines so de-blending happens automatically)</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[oi_6300_flux] [real] NOT NULL,

	--/ <summary>Error in the flux</summary>
	--/ <quantity>stat.error;phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[oi_6300_flux_err] [real] NOT NULL,

	--/ <summary>Instrumental resolution at the line center (measured for each spectrum from the ARC lamps)</summary>
	--/ <quantity>spect.resolution</quantity>
	--/ <unit>km s-1</unit>
	[oi_6300_inst_res] [real] NOT NULL,

	--/ <summary>Reduced chi-squared of the line fit over the bandpass used for the EW measurement</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[oi_6300_chisq] [real] NOT NULL,

	--/ <summary>Continuum at line center from 200 pixel median smoothing of the emission-line subtracted continuum</summary>
	--/ <quantity>phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 erg s-1 cm-2 AA-1</unit>
	[nii_6548_cont] [real] NOT NULL,

	--/ <summary>Error in the continuum computed from the variance in the band pass</summary>
	--/ <quantity>stat.error;phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 erg s-1 cm-2 AA-1</unit>
	[nii_6548_cont_err] [real] NOT NULL,

	--/ <summary>The equivalent width of the continuum-subtracted emission line computed from straight integration over the bandpasses listed below (emisison is negative). In this case the continuum comes from a running 200 pixel median and does not properly account for stellar absorption. In general the EQW measurements provide a better measure of the true equivalent width. The purpose of this measurement is to help characterize the stellar absorption effecting the line. (EW_stellar = REQW - EQW)</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[nii_6548_reqw] [real] NOT NULL,

	--/ <summary>Error in the equivalent width described above</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[nii_6548_reqw_err] [real] NOT NULL,

	--/ <summary>The equivalent width of the CB08 continuum-subtracted emission line computed from straight integration over the bandpasses listed below (emisison is negative) . This properly takes into account stellar absorption. Note that it will not be correct in the case of blended lines (ie NII &amp; H-alpha) -- instead use FLUX/CONT.</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[nii_6548_eqw] [real] NOT NULL,

	--/ <summary>Error in the equivalent width described above</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[nii_6548_eqw_err] [real] NOT NULL,

	--/ <summary>Flux from Gaussian fit to continuum subtracted data. (Note that the fit is done simultaneously to all the lines so de-blending happens automatically)</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[nii_6548_flux] [real] NOT NULL,

	--/ <summary>Error in the flux</summary>
	--/ <quantity>stat.error;phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[nii_6548_flux_err] [real] NOT NULL,

	--/ <summary>Instrumental resolution at the line center (measured for each spectrum from the ARC lamps)</summary>
	--/ <quantity>spect.resolution</quantity>
	--/ <unit>km s-1</unit>
	[nii_6548_inst_res] [real] NOT NULL,

	--/ <summary>Reduced chi-squared of the line fit over the bandpass used for the EW measurement</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[nii_6548_chisq] [real] NOT NULL,

	--/ <summary>Continuum at line center from 200 pixel median smoothing of the emission-line subtracted continuum</summary>
	--/ <quantity>phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 erg s-1 cm-2 AA-1</unit>
	[h_alpha_cont] [real] NOT NULL,

	--/ <summary>Error in the continuum computed from the variance in the band pass</summary>
	--/ <quantity>stat.error;phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 erg s-1 cm-2 AA-1</unit>
	[h_alpha_cont_err] [real] NOT NULL,

	--/ <summary>The equivalent width of the continuum-subtracted emission line computed from straight integration over the bandpasses listed below (emisison is negative). In this case the continuum comes from a running 200 pixel median and does not properly account for stellar absorption. In general the EQW measurements provide a better measure of the true equivalent width. The purpose of this measurement is to help characterize the stellar absorption effecting the line. (EW_stellar = REQW - EQW)</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[h_alpha_reqw] [real] NOT NULL,

	--/ <summary>Error in the equivalent width described above</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[h_alpha_reqw_err] [real] NOT NULL,

	--/ <summary>The equivalent width of the CB08 continuum-subtracted emission line computed from straight integration over the bandpasses listed below (emisison is negative) . This properly takes into account stellar absorption. Note that it will not be correct in the case of blended lines (ie NII &amp; H-alpha) -- instead use FLUX/CONT.</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[h_alpha_eqw] [real] NOT NULL,

	--/ <summary>Error in the equivalent width described above</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[h_alpha_eqw_err] [real] NOT NULL,

	--/ <summary>Flux from Gaussian fit to continuum subtracted data. (Note that the fit is done simultaneously to all the lines so de-blending happens automatically)</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[h_alpha_flux] [real] NOT NULL,

	--/ <summary>Error in the flux</summary>
	--/ <quantity>stat.error;phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[h_alpha_flux_err] [real] NOT NULL,

	--/ <summary>Instrumental resolution at the line center (measured for each spectrum from the ARC lamps)</summary>
	--/ <quantity>spect.resolution</quantity>
	--/ <unit>km s-1</unit>
	[h_alpha_inst_res] [real] NOT NULL,

	--/ <summary>Reduced chi-squared of the line fit over the bandpass used for the EW measurement</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[h_alpha_chisq] [real] NOT NULL,

	--/ <summary>Continuum at line center from 200 pixel median smoothing of the emission-line subtracted continuum</summary>
	--/ <quantity>phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 erg s-1 cm-2 AA-1</unit>
	[nii_6584_cont] [real] NOT NULL,

	--/ <summary>Error in the continuum computed from the variance in the band pass</summary>
	--/ <quantity>stat.error;phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 erg s-1 cm-2 AA-1</unit>
	[nii_6584_cont_err] [real] NOT NULL,

	--/ <summary>The equivalent width of the continuum-subtracted emission line computed from straight integration over the bandpasses listed below (emisison is negative). In this case the continuum comes from a running 200 pixel median and does not properly account for stellar absorption. In general the EQW measurements provide a better measure of the true equivalent width. The purpose of this measurement is to help characterize the stellar absorption effecting the line. (EW_stellar = REQW - EQW)</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[nii_6584_reqw] [real] NOT NULL,

	--/ <summary>Error in the equivalent width described above</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[nii_6584_reqw_err] [real] NOT NULL,

	--/ <summary>The equivalent width of the CB08 continuum-subtracted emission line computed from straight integration over the bandpasses listed below (emisison is negative) . This properly takes into account stellar absorption. Note that it will not be correct in the case of blended lines (ie NII &amp; H-alpha) -- instead use FLUX/CONT.</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[nii_6584_eqw] [real] NOT NULL,

	--/ <summary>Error in the equivalent width described above</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[nii_6584_eqw_err] [real] NOT NULL,

	--/ <summary>Flux from Gaussian fit to continuum subtracted data. (Note that the fit is done simultaneously to all the lines so de-blending happens automatically)</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[nii_6584_flux] [real] NOT NULL,

	--/ <summary>Error in the flux</summary>
	--/ <quantity>stat.error;phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[nii_6584_flux_err] [real] NOT NULL,

	--/ <summary>Instrumental resolution at the line center (measured for each spectrum from the ARC lamps)</summary>
	--/ <quantity>spect.resolution</quantity>
	--/ <unit>km s-1</unit>
	[nii_6584_inst_res] [real] NOT NULL,

	--/ <summary>Reduced chi-squared of the line fit over the bandpass used for the EW measurement</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[nii_6584_chisq] [real] NOT NULL,

	--/ <summary>Continuum at line center from 200 pixel median smoothing of the emission-line subtracted continuum</summary>
	--/ <quantity>phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 erg s-1 cm-2 AA-1</unit>
	[sii_6717_cont] [real] NOT NULL,

	--/ <summary>Error in the continuum computed from the variance in the band pass</summary>
	--/ <quantity>stat.error;phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 erg s-1 cm-2 AA-1</unit>
	[sii_6717_cont_err] [real] NOT NULL,

	--/ <summary>The equivalent width of the continuum-subtracted emission line computed from straight integration over the bandpasses listed below (emisison is negative). In this case the continuum comes from a running 200 pixel median and does not properly account for stellar absorption. In general the EQW measurements provide a better measure of the true equivalent width. The purpose of this measurement is to help characterize the stellar absorption effecting the line. (EW_stellar = REQW - EQW)</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[sii_6717_reqw] [real] NOT NULL,

	--/ <summary>Error in the equivalent width described above</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[sii_6717_reqw_err] [real] NOT NULL,

	--/ <summary>The equivalent width of the CB08 continuum-subtracted emission line computed from straight integration over the bandpasses listed below (emisison is negative) . This properly takes into account stellar absorption. Note that it will not be correct in the case of blended lines (ie NII &amp; H-alpha) -- instead use FLUX/CONT.</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[sii_6717_eqw] [real] NOT NULL,

	--/ <summary>Error in the equivalent width described above</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[sii_6717_eqw_err] [real] NOT NULL,

	--/ <summary>Flux from Gaussian fit to continuum subtracted data. (Note that the fit is done simultaneously to all the lines so de-blending happens automatically)</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[sii_6717_flux] [real] NOT NULL,

	--/ <summary>Error in the flux</summary>
	--/ <quantity>stat.error;phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[sii_6717_flux_err] [real] NOT NULL,

	--/ <summary>Instrumental resolution at the line center (measured for each spectrum from the ARC lamps)</summary>
	--/ <quantity>spect.resolution</quantity>
	--/ <unit>km s-1</unit>
	[sii_6717_inst_res] [real] NOT NULL,

	--/ <summary>Reduced chi-squared of the line fit over the bandpass used for the EW measurement</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[sii_6717_chisq] [real] NOT NULL,

	--/ <summary>Continuum at line center from 200 pixel median smoothing of the emission-line subtracted continuum</summary>
	--/ <quantity>phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 erg s-1 cm-2 AA-1</unit>
	[sii_6731_cont] [real] NOT NULL,

	--/ <summary>Error in the continuum computed from the variance in the band pass</summary>
	--/ <quantity>stat.error;phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 erg s-1 cm-2 AA-1</unit>
	[sii_6731_cont_err] [real] NOT NULL,

	--/ <summary>The equivalent width of the continuum-subtracted emission line computed from straight integration over the bandpasses listed below (emisison is negative). In this case the continuum comes from a running 200 pixel median and does not properly account for stellar absorption. In general the EQW measurements provide a better measure of the true equivalent width. The purpose of this measurement is to help characterize the stellar absorption effecting the line. (EW_stellar = REQW - EQW)</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[sii_6731_reqw] [real] NOT NULL,

	--/ <summary>Error in the equivalent width described above</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[sii_6731_reqw_err] [real] NOT NULL,

	--/ <summary>The equivalent width of the CB08 continuum-subtracted emission line computed from straight integration over the bandpasses listed below (emisison is negative) . This properly takes into account stellar absorption. Note that it will not be correct in the case of blended lines (ie NII &amp; H-alpha) -- instead use FLUX/CONT.</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[sii_6731_eqw] [real] NOT NULL,

	--/ <summary>Error in the equivalent width described above</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[sii_6731_eqw_err] [real] NOT NULL,

	--/ <summary>Flux from Gaussian fit to continuum subtracted data. (Note that the fit is done simultaneously to all the lines so de-blending happens automatically)</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[sii_6731_flux] [real] NOT NULL,

	--/ <summary>Error in the flux</summary>
	--/ <quantity>stat.error;phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[sii_6731_flux_err] [real] NOT NULL,

	--/ <summary>Instrumental resolution at the line center (measured for each spectrum from the ARC lamps)</summary>
	--/ <quantity>spect.resolution</quantity>
	--/ <unit>km s-1</unit>
	[sii_6731_inst_res] [real] NOT NULL,

	--/ <summary>Reduced chi-squared of the line fit over the bandpass used for the EW measurement</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[sii_6731_chisq] [real] NOT NULL,

	--/ <summary>Continuum at line center from 200 pixel median smoothing of the emission-line subtracted continuum</summary>
	--/ <quantity>phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 erg s-1 cm-2 AA-1</unit>
	[ariii7135_cont] [real] NOT NULL,

	--/ <summary>Error in the continuum computed from the variance in the band pass</summary>
	--/ <quantity>stat.error;phot.flux;spect.continuum</quantity>
	--/ <unit>1e-17 erg s-1 cm-2 AA-1</unit>
	[ariii7135_cont_err] [real] NOT NULL,

	--/ <summary>The equivalent width of the continuum-subtracted emission line computed from straight integration over the bandpasses listed below (emisison is negative). In this case the continuum comes from a running 200 pixel median and does not properly account for stellar absorption. In general the EQW measurements provide a better measure of the true equivalent width. The purpose of this measurement is to help characterize the stellar absorption effecting the line. (EW_stellar = REQW - EQW)</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[ariii7135_reqw] [real] NOT NULL,

	--/ <summary>Error in the equivalent width described above</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[ariii7135_reqw_err] [real] NOT NULL,

	--/ <summary>The equivalent width of the CB08 continuum-subtracted emission line computed from straight integration over the bandpasses listed below (emisison is negative) . This properly takes into account stellar absorption. Note that it will not be correct in the case of blended lines (ie NII &amp; H-alpha) -- instead use FLUX/CONT.</summary>
	--/ <quantity>spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[ariii7135_eqw] [real] NOT NULL,

	--/ <summary>Error in the equivalent width described above</summary>
	--/ <quantity>stat.error;spect.line.eqWidth</quantity>
	--/ <unit>AA</unit>
	[ariii7135_eqw_err] [real] NOT NULL,

	--/ <summary>Flux from Gaussian fit to continuum subtracted data. (Note that the fit is done simultaneously to all the lines so de-blending happens automatically)</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[ariii7135_flux] [real] NOT NULL,

	--/ <summary>Error in the flux</summary>
	--/ <quantity>stat.error;phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[ariii7135_flux_err] [real] NOT NULL,

	--/ <summary>Instrumental resolution at the line center (measured for each spectrum from the ARC lamps)</summary>
	--/ <quantity>spect.resolution</quantity>
	--/ <unit>km s-1</unit>
	[ariii7135_inst_res] [real] NOT NULL,

	--/ <summary>Reduced chi-squared of the line fit over the bandpass used for the EW measurement</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[ariii7135_chisq] [real] NOT NULL,

	--/ <summary>The width of the [O II] line in a free fit (ie. not tied to other emission lines)</summary>
	--/ <quantity>spect.line.width</quantity>
	--/ <unit>km s-1</unit>
	[oii_sigma] [real] NOT NULL,

	--/ <summary>The flux of the [O II] doublet from a free fit.</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[oii_flux] [real] NOT NULL,

	--/ <summary>The estimated uncertainty on OII_FLUX</summary>
	--/ <quantity>stat.error;phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[oii_flux_err] [real] NOT NULL,

	--/ <summary>The velocity offset of the [O II] doublet from a free fit</summary>
	--/ <quantity>spect.dopplerVeloc</quantity>
	--/ <unit>km s-1</unit>
	[oii_voff] [real] NOT NULL,

	--/ <summary>chi^2 of the fit to the [O II] line in free fit</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[oii_chi2] [real] NOT NULL,

	--/ <summary>The width of the [O III]5007 line in a free fit (ie. not tied to other emission lines)</summary>
	--/ <quantity>spect.line.width</quantity>
	--/ <unit>km s-1</unit>
	[oiii_sigma] [real] NOT NULL,

	--/ <summary>The flux of the [O III]5007 line from a free fit.</summary>
	--/ <quantity>phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[oiii_flux] [real] NOT NULL,

	--/ <summary>The estimated uncertainty on OIII_FLUX</summary>
	--/ <quantity>stat.error;phot.flux</quantity>
	--/ <unit>1e-17 erg s-1 cm-2</unit>
	[oiii_flux_err] [real] NOT NULL,

	--/ <summary>The velocity offset of the [O III]5007 line from a free fit</summary>
	--/ <quantity>spect.dopplerVeloc</quantity>
	--/ <unit>km s-1</unit>
	[oiii_voff] [real] NOT NULL,

	--/ <summary>chi^2 of the fit to the [O III]5007 line in free fit</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[oiii_chi2] [real] NOT NULL,

	--/ <summary>The multiplicative scale factor applied to the original flux and error spectra prior to measurement of the emission lines to improve the spectrophotometric accuracy.  The rescaling insures that a synthetic r-band magnitude computed from the spectrum matches the r-band fiber magnitude measured by the photometric pipeline.</summary>
	--/ <quantity>obs.param;phot.flux</quantity>
	[spectofiber] [real] NOT NULL,
 CONSTRAINT [pk_galSpecLine_specObjID] PRIMARY KEY CLUSTERED 
(
	[specObjID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HalfSpace]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--/ <summary> The constraints for boundaries of the the different regions </summary>
--/ <remarks> Boundaries are represented as the equation of a 3D plane,  intersecting the unit sphere. These intersections are  great and small circles. THe representation is in terms  of a 4-vector, (x,y,z,c), where (x,y,z) are the components  of a 3D normal vector pointing along the normal of the plane  into the half-scape inside our boundary, and c is the shift  of the plane along the normal from the origin. Thus, c=0  constraints represent great circles. If c&lt;0, the small circle  contains more than half of the sky.  See also the Region and RegionConvex tables </remarks>
CREATE TABLE [dbo].[HalfSpace](

	--/ <summary>id for the constraint</summary>
	--/ <quantity>meta.id</quantity>
	[constraintid] [bigint] NOT NULL,

	--/ <summary>pointer to RegionDefs</summary>
	--/ <quantity>meta.id</quantity>
	[regionid] [bigint] NOT NULL,

	--/ <summary>unique id for the convex</summary>
	--/ <quantity>meta.id</quantity>
	[convexid] [bigint] NOT NULL,

	--/ <summary>x component of normal</summary>
	--/ <quantity>pos.cartesian.x</quantity>
	[x] [float] NOT NULL,

	--/ <summary>y component of normal</summary>
	--/ <quantity>pos.cartesian.y</quantity>
	[y] [float] NOT NULL,

	--/ <summary>z component of normal</summary>
	--/ <quantity>pos.cartesian.z</quantity>
	[z] [float] NOT NULL,

	--/ <summary>offset from center along normal</summary>
	--/ <quantity>pos.distance</quantity>
	[c] [float] NOT NULL,
 CONSTRAINT [pk_HalfSpace_constraintid] PRIMARY KEY CLUSTERED 
(
	[constraintid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[marvelsStar]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

--/ <summary> Contains data for a MARVELS star. </summary>
--/ <remarks> This table corresponds to the data for a star whose velocity curve is  measured in MARVELS.  </remarks>
CREATE TABLE [dbo].[marvelsStar](

	--/ <summary>The primary name of the star (STARNAME)</summary>
	--/ <quantity>meta.id</quantity>
	[STARNAME] [varchar](64) NOT NULL,

	--/ <summary>2MASS Star Catalog Name</summary>
	--/ <quantity>meta.id.cross</quantity>
	[TWOMASS_NAME] [varchar](64) NOT NULL,

	--/ <summary>Plate Name</summary>
	--/ <quantity>meta.id;instr.det</quantity>
	[Plate] [varchar](32) NOT NULL,

	--/ <summary>Guide Star Catalog Name</summary>
	--/ <quantity>meta.id.cross</quantity>
	[GSC_Name] [varchar](64) NOT NULL,

	--/ <summary>Tycho Star Catalog Name</summary>
	--/ <quantity>meta.id.cross</quantity>
	[TYC_Name] [varchar](64) NOT NULL,

	--/ <summary>Hipparcos Star Catalog Name</summary>
	--/ <quantity>meta.id.cross</quantity>
	[HIP_Name] [varchar](62) NOT NULL,

	--/ <summary>Star Right Ascension (in degrees)</summary>
	--/ <quantity>pos.eq.ra</quantity>
	--/ <unit>deg</unit>
	[RA_Final] [float] NOT NULL,

	--/ <summary>Star Declination (in degrees)</summary>
	--/ <quantity>pos.eq.dec</quantity>
	--/ <unit>deg</unit>
	[DEC_Final] [float] NOT NULL,

	--/ <summary>GSC B Magnitude (in mags)</summary>
	--/ <quantity>phot.mag;em.opt.B</quantity>
	--/ <unit>mag</unit>
	[GSC_B] [float] NOT NULL,

	--/ <summary>GSC V Magnitude (in mags)</summary>
	--/ <quantity>phot.mag;em.opt.V</quantity>
	--/ <unit>mag</unit>
	[GSC_V] [float] NOT NULL,

	--/ <summary>2MASS J Magnitude (in mags)</summary>
	--/ <quantity>phot.mag;em.IR.J</quantity>
	--/ <unit>mag</unit>
	[TWOMASS_J] [real] NOT NULL,

	--/ <summary>2MASS H Magnitude (in mags)</summary>
	--/ <quantity>phot.mag;em.IR.H</quantity>
	--/ <unit>mag</unit>
	[TWOMASS_H] [real] NOT NULL,

	--/ <summary>2MASS K Magnitude (in mags)</summary>
	--/ <quantity>phot.mag;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[TWOMASS_K] [real] NOT NULL,

	--/ <summary>Hipparcos Spectral type 1</summary>
	--/ <quantity>src.spType</quantity>
	[SP1] [varchar](16) NOT NULL,

	--/ <summary>Hipparcos Spectral type 2</summary>
	--/ <quantity>src.spType</quantity>
	[SP2] [varchar](16) NOT NULL,

	--/ <summary>Luminosity Class from SSPP* (Mainseq/Giant/Refstar) Refstar means it is a known planet host (different method used for year34 - see docs)</summary>
	--/ <quantity>src.class.luminosity</quantity>
	[RPM_LOG_g] [varchar](32) NOT NULL,

	--/ <summary>SSPP* effective temperature (in Kelvin) (different method used for year34 - see docs)</summary>
	--/ <quantity>phys.temperature.effective</quantity>
	[Teff] [real] NOT NULL,

	--/ <summary>SSPP* Surface gravity (different method used for year34 - see docs)</summary>
	--/ <quantity>phys.gravity</quantity>
	[log_g] [real] NOT NULL,

	--/ <summary>SSPP* Metallicity (different method used for year34 - see docs)</summary>
	--/ <quantity>phys.abund.Fe</quantity>
	[FeH] [real] NOT NULL,

	--/ <summary>Error in GSC B Magnitude (in mags)</summary>
	--/ <quantity>stat.error;phot.mag;em.opt.B</quantity>
	--/ <unit>mag</unit>
	[GSC_B_E] [real] NOT NULL,

	--/ <summary>Error in GSC V Magnitude (in mags)</summary>
	--/ <quantity>stat.error;phot.mag;em.opt.V</quantity>
	--/ <unit>mag</unit>
	[GSC_V_E] [real] NOT NULL,

	--/ <summary>Error in 2MASS J Magnitude (in mags)</summary>
	--/ <quantity>stat.error;phot.mag;em.IR.J</quantity>
	--/ <unit>mag</unit>
	[TWOMASS_J_E] [real] NOT NULL,

	--/ <summary>Error in 2MASS H Magnitude (in mags)</summary>
	--/ <quantity>stat.error;phot.mag;em.IR.H</quantity>
	--/ <unit>mag</unit>
	[TWOMASS_H_E] [real] NOT NULL,

	--/ <summary>Error in 2MASS K Magnitude (in mags)</summary>
	--/ <quantity>stat.error;phot.mag;em.IR.K</quantity>
	--/ <unit>mag</unit>
	[TWOMASS_K_E] [real] NOT NULL,

	--/ <summary>Error in SSPP* effective temperature (in Kelvin)</summary>
	--/ <quantity>stat.error;phys.temperature.effective</quantity>
	--/ <unit>K</unit>
	[Teff_E] [real] NOT NULL,

	--/ <summary>Error in SSPP* Surface gravity (different method used for year34 - see docs) (different method used for year34 - see docs)</summary>
	--/ <quantity>stat.error;phys.gravity</quantity>
	[log_g_E] [real] NOT NULL,

	--/ <summary>Error in SSPP* Metallicity (different method used for year34 - see docs)</summary>
	--/ <quantity>stat.error;phys.abund.Fe</quantity>
	[FeH_E] [real] NOT NULL,

	--/ <summary>Epoch 0</summary>
	--/ <quantity>time.epoch</quantity>
	[Epoch_0] [real] NOT NULL,

	--/ <summary>Right Ascension at Epoch 0 (in degrees)</summary>
	--/ <quantity>pos.eq.ra</quantity>
	--/ <unit>deg</unit>
	[RA_0] [float] NOT NULL,

	--/ <summary>Declination at Epoch 0 (in degrees)</summary>
	--/ <quantity>pos.eq.dec</quantity>
	--/ <unit>deg</unit>
	[DEC_0] [float] NOT NULL,

	--/ <summary>2MASS Right Ascension (in degrees)</summary>
	--/ <quantity>pos.eq.ra</quantity>
	--/ <unit>deg</unit>
	[RA_TWOMASS] [float] NOT NULL,

	--/ <summary>2MASS Declination (in degrees)</summary>
	--/ <quantity>pos.eq.dec</quantity>
	--/ <unit>deg</unit>
	[DEC_TWOMASS] [float] NOT NULL,

	--/ <summary>GSC Proper Motion in RA pmra * cos(dec) (in mas)</summary>
	--/ <quantity>pos.pm;pos.eq.ra</quantity>
	--/ <unit>mas</unit>
	[GSC_PM_RA] [float] NOT NULL,

	--/ <summary>GSC Proper Motion in DEC (in mas)</summary>
	--/ <quantity>pos.pm;pos.eq.dec</quantity>
	--/ <unit>mas</unit>
	[GSC_PM_DEC] [float] NOT NULL,

	--/ <summary>Error in GSC Proper Motion in RA pmra * cos(dec) (in mas)</summary>
	--/ <unit>mag</unit>
	--/ <quantity>stat.error;pos.pm;pos.eq.ra</quantity>
	[GSC_PM_RA_E] [float] NOT NULL,

	--/ <summary>Error in GSC Proper MOtion in DEC (in mas)</summary>
	--/ <quantity>stat.error;pos.pm;pos.eq.dec</quantity>
	--/ <unit>mas</unit>
	[GSC_PM_DEC_E] [float] NOT NULL,

	--/ <summary>Tycho B Magnitude (in mag)</summary>
	--/ <quantity>phot.mag;em.opt.B</quantity>
	--/ <unit>mag</unit>
	[TYC_B] [real] NOT NULL,

	--/ <summary>Error in Tycho B Magnitude (in mag)</summary>
	--/ <quantity>stat.error;phot.mag;em.opt.B</quantity>
	--/ <unit>mag</unit>
	[TYC_B_E] [real] NOT NULL,

	--/ <summary>Tycho V Magnitude (in mag)</summary>
	--/ <quantity>phot.mag;em.opt.V</quantity>
	--/ <unit>mag</unit>
	[TYC_V] [real] NOT NULL,

	--/ <summary>Error in Tycho V Magnitude (in mag)</summary>
	--/ <quantity>stat.error;phot.mag;em.opt.V</quantity>
	--/ <unit>mag</unit>
	[TYC_V_E] [real] NOT NULL,

	--/ <summary>Hipparcos Parallax (in mas)</summary>
	--/ <quantity>pos.parallax</quantity>
	--/ <unit>mas</unit>
	[HIP_PLX] [real] NOT NULL,

	--/ <summary>Error in Hipparcos Parallax (in mas)</summary>
	--/ <quantity>stat.error;pos.parallax</quantity>
	--/ <unit>mas</unit>
	[HIP_PLX_E] [real] NOT NULL,

	--/ <summary>Hipparcos Spectral Type</summary>
	--/ <quantity>src.spType</quantity>
	[HIP_SPTYPE] [varchar](32) NOT NULL,
 CONSTRAINT [pk_marvelsStar_STARNAME_PLATE] PRIMARY KEY CLUSTERED 
(
	[STARNAME] ASC,
	[Plate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[marvelsVelocityCurveUF1D]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

--/ <summary> Contains data for a particular MARVELS velocity curve using UF1D technique. </summary>
--/ <remarks> This table corresponds to the data in a single velocity curve measurement </remarks>
CREATE TABLE [dbo].[marvelsVelocityCurveUF1D](

	--/ <summary>The primary name of the star (STARNAME)</summary>
	--/ <quantity>meta.id;</quantity>
	[STARNAME] [varchar](64) NOT NULL,

	--/ <summary>The flux centered Julian Date</summary>
	--/ <quantity>time.epoch</quantity>
	[FCJD] [float] NOT NULL,

	--/ <summary>The fully corrected radial velocity measurement</summary>
	--/ <quantity>spect.dopplerVeloc</quantity>
	[RV] [float] NOT NULL,

	--/ <summary>Photon limit of observation</summary>
	--/ <quantity>stat.error</quantity>
	[PHOTONERR] [float] NOT NULL,

	--/ <summary>Observed Precision in the measurement of the RV data point</summary>
	--/ <quantity>stat.error;spect.dopplerVeloc</quantity>
	[STATERROR] [float] NOT NULL,

	--/ <summary>Expected RV error for each order</summary>
	--/ <quantity>stat.error;spect.dopplerVeloc</quantity>
	[OFFSETERROR] [float] NOT NULL,

	--/ <summary>Good or rejected measurement</summary>
	--/ <quantity>meta.code</quantity>
	[Keep] [float] NOT NULL,

	--/ <summary>Sum of the photons</summary>
	--/ <quantity>meta.number</quantity>
	[TOTALPHOTONS] [bigint] NOT NULL,

	--/ <summary>The calculated barycentric velocity (m/s)</summary>
	--/ <quantity>phys.veloc;pos.barycenter</quantity>
	--/ <unit>m s-1</unit>
	[BARYCENTRICVEL] [float] NOT NULL,

	--/ <summary>Spectrum number (1 is bottom; 120 is top)</summary>
	--/ <quantity>meta.id;spect</quantity>
	[SPECNO] [smallint] NOT NULL,

	--/ <summary>Name of the aggregated file for this epoch</summary>
	--/ <quantity>meta.id;meta.file</quantity>
	[EPOCHFILE] [varchar](256) NOT NULL,

	--/ <summary>Number of the MJD that was used as the template</summary>
	--/ <quantity>meta.id;meta.file</quantity>
	[TEMPLATEFILE] [varchar](256) NOT NULL,

	--/ <summary>Plate Name composed from RA and DEC (From image header)</summary>
	--/ <quantity>meta.id;instr.det</quantity>
	[RADECID] [varchar](32) NOT NULL,

	--/ <summary>Plate Name (From image header)</summary>
	--/ <quantity>meta.id;instr.det</quantity>
	[OBJECT] [varchar](32) NOT NULL,

	--/ <summary>Exposure Type (Valid values include STAR/TIO/THAR etc.) (From image header)</summary>
	--/ <quantity>meta.note;obs.exposure</quantity>
	[EXPTYPE] [varchar](32) NOT NULL,

	--/ <summary>Plate Name (From image header)</summary>
	--/ <quantity>meta.id;instr.det</quantity>
	[PLATEID] [varchar](32) NOT NULL,

	--/ <summary>Id of the cartridge used for this image (From image header)</summary>
	--/ <quantity>meta.id;instr.param</quantity>
	[CARTID] [int] NOT NULL,

	--/ <summary>Exposure time in seconds (From image header)</summary>
	--/ <quantity>time.duration;obs.exposure</quantity>
	[EXPTIME] [int] NOT NULL,

	--/ <summary>UT of observation Format is YYYY-MM-DDThh:mm:ss.ss (From image header)</summary>
	--/ <quantity>time.epoch;obs</quantity>
	[DATE-OBS] [varchar](64) NOT NULL,

	--/ <summary>Start &amp; Stop of Exposure (From image header)</summary>
	--/ <quantity>time.start;time.end</quantity>
	[TIME] [varchar](64) NOT NULL,

	--/ <summary>UTC of Start of Exposure (From image header)</summary>
	--/ <quantity>time.epoch;obs</quantity>
	[UTC-OBS] [varchar](32) NOT NULL,

	--/ <summary>LST of Start of Exposure (From image header)</summary>
	--/ <quantity>time.start;obs.exposure</quantity>
	[LST-OBS] [varchar](32) NOT NULL,

	--/ <summary>Julian date at start of observation (From image header)</summary>
	--/ <quantity>time.start;obs</quantity>
	[JD] [real] NOT NULL,

	--/ <summary>Flux centered Julian date (From image header)</summary>
	--/ <quantity>time.epoch</quantity>
	[FCJD_IMG] [real] NOT NULL,

	--/ <summary>Modified Julian date at start of observation (From image header)</summary>
	--/ <quantity>time.start</quantity>
	[MJD] [real] NOT NULL,

	--/ <summary>RA of tel. boresight (in degrees) (From image header)</summary>
	--/ <quantity>pos.eq.ra</quantity>
	--/ <unit>deg</unit>
	[RA] [float] NOT NULL,

	--/ <summary>DEC of tel. boresight (in degrees) (From image header)</summary>
	--/ <quantity>pos.eq.dec</quantity>
	--/ <unit>deg</unit>
	[DEC] [float] NOT NULL,

	--/ <summary>Epoch of Coordinates (From image header)</summary>
	--/ <quantity>time.epoch</quantity>
	[EPOCH] [int] NOT NULL,

	--/ <summary>Altitude (encoder) of telescope (From image header)</summary>
	--/ <quantity>pos.az.alt;instr.tel</quantity>
	[ALT] [real] NOT NULL,

	--/ <summary>Azimuth (encoder) of telescope (From image header)</summary>
	--/ <quantity>pos.az.azi;instr.tel</quantity>
	[AZ] [real] NOT NULL,

	--/ <summary>Average PMT (rough flux over whole plate) during observation (in counts) (From image header)</summary>
	--/ <quantity>phot.count;stat.mean</quantity>
	--/ <unit>count</unit>	
	[PMTAVG] [real] NOT NULL,

	--/ <summary>RMS deviation of PMT counts during obs (in counts) (From image header)</summary>
	--/ <quantity>stat.error;phot.count</quantity>
	--/ <unit>count</unit>	
	[PMTRMS] [real] NOT NULL,

	--/ <summary>Minimum PMT counts during obsservation (in counts) (From image header)</summary>
	--/ <quantity>phot.count;stat.min</quantity>
	--/ <unit>count</unit>	
	[PMTMIN] [real] NOT NULL,

	--/ <summary>Maximum PMT counts during observation (in counts) (From image header)</summary>
	--/ <quantity>phot.count;stat.max</quantity>
	--/ <unit>count</unit>	
	[PMTMAX] [real] NOT NULL,

	--/ <summary>Exp. Quality Flag (OK/UNSURE/JUNK) (From image header)</summary>
	--/ <quantity>meta.code.qual;obs</quantity>
	[OBSFLAG] [varchar](16) NOT NULL,

	--/ <summary>Average counts per pixel in the image (in counts) (From image header)</summary>
	--/ <quantity>phot.count;stat.mean</quantity>
	--/ <unit>count</unit>	
	[IMGAVG] [real] NOT NULL,

	--/ <summary>Maximum counts per pixel in the image (in counts) (From image header)</summary>
	--/ <quantity>phot.count;stat.max</quantity>
	--/ <unit>count</unit>	
	[IMGMAX] [real] NOT NULL,

	--/ <summary>Minimum counts per pixel in the image (in counts) (From image header)</summary>
	--/ <quantity>phot.count;stat.min</quantity>
	--/ <unit>count</unit>	
	[IMGMIN] [real] NOT NULL,

	--/ <summary>Maximum signal to noise per pixel in the image (From image header)</summary>
	--/ <quantity>stat.snr;stat.max</quantity>
	[SNRMAX] [real] NOT NULL,

	--/ <summary>Median signal to noise per pixel in the image (From image header)</summary>
	--/ <quantity>stat.snr;stat.median</quantity>
	[SNRMEDN] [real] NOT NULL,

	--/ <summary>Minimum signal to noise per pixel in the image (From image header)</summary>
	--/ <quantity>stat.snr;stat.min</quantity>
	[SNRMIN] [real] NOT NULL,

	--/ <summary>Average signal to noise per pixel in the image (From image header)</summary>
	--/ <quantity>stat.snr;stat.mean</quantity>
	[SNRAVG] [real] NOT NULL,

	--/ <summary>RMS deviation signal to noise per pixel in the image (From image header)</summary>
	--/ <quantity>stat.snr;stat.stdev</quantity>
	[SNRSTDEV] [real] NOT NULL,

	--/ <summary>Average seeing during the exposure (in arcsec) (From image header)</summary>
	--/ <quantity>instr.obsty;seeing;stat.mean</quantity>
	--/ <unit>arcsec</unit>
	[SEEING] [real] NOT NULL,

	--/ <summary>CCD Chip Temp. in Deg. Celsius (approx -106 normal) (From image header)</summary>
	--/ <quantity>phys.temperature;instr.det</quantity>
	--/ <unit>Celsius</unit>
	[CCDTEMP] [real] NOT NULL,

	--/ <summary>CCD Dewar Pressure in Torr (below &lt; 0.001) normal (From image header)</summary>
	--/ <quantity>phys.pressure;instr.det</quantity>
	[CCDPRES] [real] NOT NULL,

	--/ <summary>Mean Pressure(PSI) of Regulator (From image header)</summary>
	--/ <quantity>phys.pressure;stat.mean</quantity>
	[P1] [real] NOT NULL,

	--/ <summary>RMS Pressure(PSI) of Regulator (From image header)</summary>
	--/ <quantity>stat.error;phys.pressure</quantity>
	[P1RMS] [real] NOT NULL,

	--/ <summary>Mean Pressure(PSI) of Chamber (From image header)</summary>
	--/ <quantity>phys.pressure;stat.mean</quantity>
	[P2] [real] NOT NULL,

	--/ <summary>RMS Pressure(PSI) of Chamber (From image header)</summary>
	--/ <quantity>stat.error;phys.pressure</quantity>
	[P2RMS] [real] NOT NULL,

	--/ <summary>Mean Pressure(PSI) of Atmosphere (From image header)</summary>
	--/ <quantity>phys.pressure;obs.atmos</quantity>
	[P3] [real] NOT NULL,

	--/ <summary>RMS Pressure(PSI) of Atmosphere (From image header)</summary>
	--/ <quantity>stat.error;phys.pressure;obs.atmos</quantity>
	[P3RMS] [real] NOT NULL,

	--/ <summary>Mean Temp. of North Chamber wall in deg. Celsius (From image header)</summary>
	--/ <quantity>phys.temp;instr;stat.mean</quantity>
	--/ <unit>Celsius</unit>
	[T1] [real] NOT NULL,

	--/ <summary>RMS Temp. of North Chamber wall in deg. Celsius (From image header)</summary>
	--/ <quantity>stat.error;phys.temp;instr</quantity>
	--/ <unit>Celsius</unit>
	[T1RMS] [real] NOT NULL,

	--/ <summary>Mean Temp. of South Chamber wallin deg. Celsius (From image header)</summary>
	--/ <quantity>phys.temp;instr;stat.mean</quantity>
	--/ <unit>Celsius</unit>
	[T2] [real] NOT NULL,

	--/ <summary>RMS Temp. of South Chamber wallin deg. Celsius (From image header)</summary>
	--/ <quantity>stat.error;phys.temp;instr</quantity>
	--/ <unit>Celsius</unit>
	[T2RMS] [real] NOT NULL,

	--/ <summary>Mean Temp. of East Chamber wallin deg. Celsius (From image header)</summary>
	--/ <quantity>phys.temp;instr;stat.mean</quantity>
	--/ <unit>Celsius</unit>
	[T3] [real] NOT NULL,

	--/ <summary>RMS Temp. of East Chamber wallin deg. Celsius (From image header)</summary>
	--/ <quantity>stat.error;phys.temp;instr</quantity>
	--/ <unit>Celsius</unit>
	[T3RMS] [real] NOT NULL,

	--/ <summary>Mean Temp. of West Chamber wallin deg. Celsius (From image header)</summary>
	--/ <quantity>phys.temp;instr;stat.mean</quantity>
	--/ <unit>Celsius</unit>
	[T4] [real] NOT NULL,

	--/ <summary>RMS Temp. of West Chamber wallin deg. Celsius (From image header)</summary>
	--/ <quantity>stat.error;phys.temp;instr</quantity>
	--/ <unit>Celsius</unit>
	[T4RMS] [real] NOT NULL,

	--/ <summary>Mean Temp. of Top Chamber wallin deg. Celsius (From image header)</summary>
	--/ <quantity>phys.temp;instr;stat.mean</quantity>
	--/ <unit>Celsius</unit>
	[T5] [real] NOT NULL,

	--/ <summary>RMS Temp. of Top Chamber wallin deg. Celsius (From image header)</summary>
	--/ <quantity>stat.error;phys.temp;instr</quantity>
	--/ <unit>Celsius</unit>
	[T5RMS] [real] NOT NULL,

	--/ <summary>Mean Temp. of Bottom Chamber wallin deg. Celsius (From image header)</summary>
	--/ <quantity>phys.temp;instr;stat.mean</quantity>
	--/ <unit>Celsius</unit>
	[T6] [real] NOT NULL,

	--/ <summary>RMS Temp. of Bottom Chamber wallin deg. Celsius (From image header)</summary>
	--/ <quantity>stat.error;phys.temp;instr</quantity>
	--/ <unit>Celsius</unit>
	[T6RMS] [real] NOT NULL,

	--/ <summary>Mean Temp. of CCD skin in deg. Celsius (From image header)</summary>
	--/ <quantity>phys.temp;instr;stat.mean</quantity>
	--/ <unit>Celsius</unit>
	[T7] [real] NOT NULL,

	--/ <summary>RMS Temp. of CCD skin in deg. Celsius (From image header)</summary>
	--/ <quantity>stat.error;phys.temp;instr</quantity>
	--/ <unit>Celsius</unit>
	[T7RMS] [real] NOT NULL,

	--/ <summary>Mean Temp. of CCD house in deg. Celsius (From image header)</summary>
	--/ <quantity>phys.temp;instr;stat.mean</quantity>
	--/ <unit>Celsius</unit>
	[T8] [real] NOT NULL,

	--/ <summary>RMS Temp. of CCD house in deg. Celsius (From image header)</summary>
	--/ <quantity>stat.error;phys.temp;instr</quantity>
	--/ <unit>Celsius</unit>
	[T8RMS] [real] NOT NULL,

	--/ <summary>Mean Temp. of Iodine_Cell in deg. Celsius (From image header)</summary>
	--/ <quantity>phys.temp;instr;stat.mean</quantity>
	--/ <unit>Celsius</unit>
	[T9] [real] NOT NULL,

	--/ <summary>RMS Temp. of Iodine_Cell in deg. Celsius (From image header)</summary>
	--/ <quantity>stat.error;phys.temp;instr</quantity>
	--/ <unit>Celsius</unit>
	[T9RMS] [real] NOT NULL,

	--/ <summary>Mean Temp of CCD Air in deg. Celsius (From image header)</summary>
	--/ <quantity>phys.temp;instr;stat.mean</quantity>
	--/ <unit>Celsius</unit>
	[T10] [real] NOT NULL,

	--/ <summary>RMS Temp of CCD Air in deg. Celsius (From image header)</summary>
	--/ <quantity>stat.error;phys.temp;instr</quantity>
	--/ <unit>Celsius</unit>
	[T10RMS] [real] NOT NULL,

	--/ <summary>Mean Temp of Interferometer top in deg. Celsius (From image header)</summary>
	--/ <quantity>phys.temp;instr;stat.mean</quantity>
	--/ <unit>Celsius</unit>
	[T11] [real] NOT NULL,

	--/ <summary>RMS Temp of Interferometer top in deg. Celsius (From image header)</summary>
	--/ <quantity>stat.error;phys.temp;instr</quantity>
	--/ <unit>Celsius</unit>
	[T11RMS] [real] NOT NULL,

	--/ <summary>Mean Temp of Chamber Center in deg. Celsius (From image header)</summary>
	--/ <quantity>phys.temp;instr;stat.mean</quantity>
	--/ <unit>Celsius</unit>
	[T12] [real] NOT NULL,

	--/ <summary>RMSTemp of Chamber Center in deg. Celsius (From image header)</summary>
	--/ <quantity>stat.error;phys.temp;instr</quantity>
	--/ <unit>Celsius</unit>
	[T12RMS] [real] NOT NULL,

	--/ <summary>Mean Temp of Grating in deg. Celsius (From image header)</summary>
	--/ <quantity>phys.temp;instr;stat.mean</quantity>
	--/ <unit>Celsius</unit>
	[T13] [real] NOT NULL,

	--/ <summary>RMSTemp of Grating in deg. Celsius (From image header)</summary>
	--/ <quantity>stat.error;phys.temp;instr</quantity>
	--/ <unit>Celsius</unit>
	[T13RMS] [real] NOT NULL,

	--/ <summary>Mean Temp of CCD area in deg. Celsius (From image header)</summary>
	--/ <quantity>phys.temp;instr;stat.mean</quantity>
	--/ <unit>Celsius</unit>
	[T14] [real] NOT NULL,

	--/ <summary>RMSTemp of CCD area in deg. Celsius (From image header)</summary>
	--/ <quantity>stat.error;phys.temp;instr</quantity>
	--/ <unit>Celsius</unit>
	[T14RMS] [real] NOT NULL,

	--/ <summary>Mean Temp of Chamber input in deg. Celsius (From image header)</summary>
	--/ <quantity>phys.temp;instr;stat.mean</quantity>
	--/ <unit>Celsius</unit>
	[T15] [real] NOT NULL,

	--/ <summary>RMS Temp of Chamber input in deg. Celsius (From image header)</summary>
	--/ <quantity>stat.error;phys.temp;instr</quantity>
	--/ <unit>Celsius</unit>
	[T15RMS] [real] NOT NULL,

	--/ <summary>Mean Temp of Ambient in deg. Celsius (From image header)</summary>
	--/ <quantity>phys.temp;instr;stat.mean</quantity>
	--/ <unit>Celsius</unit>
	[T16] [real] NOT NULL,

	--/ <summary>RMS Temp of Ambient in deg. Celsius (From image header)</summary>
	--/ <quantity>stat.error;phys.temp;instr</quantity>
	--/ <unit>Celsius</unit>
	[T16RMS] [real] NOT NULL,

	--/ <summary>Beam ID (1 or 2)</summary>
	--/ <quantity>meta.id</quantity>
	[BEAM] [tinyint] NOT NULL,

	--/ <summary>Indicates survey phase ('year12' or 'year34')</summary>
	--/ <quantity>meta.note;time</quantity>
	[SURVEY] [varchar](16) NOT NULL,
 CONSTRAINT [pk_marvelsVelocityCurveUF1D_STAR] PRIMARY KEY CLUSTERED 
(
	[STARNAME] ASC,
	[BEAM] ASC,
	[RADECID] ASC,
	[FCJD] ASC,
	[LST-OBS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Mask]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

--/ <summary> Contains a record describing the each mask object </summary>
--/ <remarks> </remarks>
CREATE TABLE [dbo].[Mask](

	--/ <summary>Unique Id number, composed of skyversion, rerun, run, camcol, field, filter, mask</summary>
	--/ <quantity></quantity>
	[maskID] [bigint] NOT NULL,

	--/ <summary>Run number</summary>
	--/ <quantity></quantity>
	[run] [smallint] NOT NULL,

	--/ <summary>Rerun number</summary>
	--/ <quantity></quantity>
	[rerun] [smallint] NOT NULL,

	--/ <summary>Camera column</summary>
	--/ <quantity></quantity>
	[camcol] [tinyint] NOT NULL,

	--/ <summary>Field number</summary>
	--/ <quantity></quantity>
	[field] [smallint] NOT NULL,

	--/ <summary>The object id within a field. Usually changes between reruns of the same field.</summary>
	--/ <quantity></quantity>
	[mask] [smallint] NOT NULL,

	--/ <summary>The enumerated filter [0..4]</summary>
	--/ <quantity></quantity>
	[filter] [tinyint] NOT NULL,

	--/ <summary>J2000 right ascension (r')</summary>
	--/ <quantity></quantity>
	--/ <unit>deg</unit>
	[ra] [float] NOT NULL,

	--/ <summary>J2000 declination (r')</summary>
	--/ <quantity></quantity>
	--/ <unit>deg</unit>
	[dec] [float] NOT NULL,

	--/ <summary>the radius of the bounding circle</summary>
	--/ <quantity></quantity>
	--/ <unit>deg</unit>
	[radius] [float] NOT NULL,

	--/ <summary>Area descriptor for the mask object</summary>
	--/ <quantity></quantity>
	[area] [varchar](4096) NOT NULL,

	--/ <summary>enumerated type of mask</summary>
	--/ <quantity></quantity>
	[type] [int] NOT NULL,

	--/ <summary>seeing width</summary>
	--/ <quantity></quantity>
	--/ <unit>arcsec</unit>
	[seeing] [real] NOT NULL,

	--/ <summary>unit vector for ra+dec</summary>
	--/ <quantity>pos.eq.x</quantity>
	[cx] [float] NOT NULL,

	--/ <summary>unit vector for ra+dec</summary>
	--/ <quantity>pos.eq.y</quantity>
	[cy] [float] NOT NULL,

	--/ <summary>unit vector for ra+dec</summary>
	--/ <quantity>pos.eq.z</quantity>
	[cz] [float] NOT NULL,

	--/ <summary>20-deep hierarchical trangular mesh ID of this object</summary>
	--/ <quantity>pos.eq.HTM</quantity>
	[htmID] [bigint] NOT NULL,

	--/ <summary>zone ID</summary>
	--/ <quantity>pos.eq.zone</quantity>
	[zoneID] [bigint] NOT NULL,
 CONSTRAINT [pk_Mask_maskID] PRIMARY KEY CLUSTERED 
(
	[maskID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[MaskedObject]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--/ <summary> Contains the objects inside a specific mask </summary>
--/ <remarks> This is a list of all masked objects. Each object may appear  multiple times, if it is masked for multiple reasons. </remarks>
CREATE TABLE [dbo].[MaskedObject](

	--/ <summary>pointer to a PhotoObj</summary>
	--/ <quantity>meta.id</quantity>
	[objid] [bigint] NOT NULL,

	--/ <summary>Unique maskid</summary>
	--/ <quantity>meta.id</quantity>
	[maskID] [bigint] NOT NULL,

	--/ <summary>enumerated type of mask</summary>
	--/ <quantity>meta.code</quantity>
	[maskType] [int] NOT NULL,
 CONSTRAINT [pk_MaskedObject_objid_maskid] PRIMARY KEY CLUSTERED 
(
	[objid] ASC,
	[maskID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhotoObjDR7]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--/ <summary> Contains the spatial cross-match between DR8 photoobj and DR7 photoobj. </summary>
--/ <remarks> This is a unique match between a DR8 photoobj and a DR7 photoobj,   and matches are restricted to the same run/camcol/field.	The match radius is 1 arcsec, and within this radius preference is  given to a photoprimary match over a secondary.  If no primary match  exists, the nearest secondary match is chosen.  If more than one  match of a given mode exists, the nearest one is chosen.  The table  contains the DR8 and DR7 objids and modes, the distance between them,   and the DR7 phototag quantities. </remarks>
CREATE TABLE [dbo].[PhotoObjDR7](

	--/ <summary>Unique DR7 identifier composed from [skyVersion,rerun,run,camcol,field,obj].</summary>
	--/ <quantity>meta.id</quantity>
	[dr7objid] [bigint] NOT NULL,

	--/ <summary>Unique DR8 identifier composed from [skyVersion,rerun,run,camcol,field,obj].</summary>
	--/ <quantity>meta.id</quantity>
	[dr8objid] [bigint] NOT NULL,

	--/ <summary>Distance in arcmin between the DR7 and DR8 positions</summary>
	--/ <quantity>pos.angDistance</quantity>
	--/ <unit>arcmin</unit>
	[distance] [float] NOT NULL,

	--/ <summary>DR7 mode, 1: primary, 2: secondary, 3: family object.</summary>
	--/ <quantity>meta.code</quantity>
	[modeDR7] [tinyint] NOT NULL,

	--/ <summary>DR8 mode, 1: primary, 2: secondary, 3: family object.</summary>
	--/ <quantity>meta.code</quantity>
	[modeDR8] [tinyint] NOT NULL,

	--/ <summary>0 = OPDB target, 1 = OPDB best</summary>
	--/ <quantity>meta.code</quantity>
	[skyVersion] [tinyint] NOT NULL,

	--/ <summary>Run number</summary>
	--/ <quantity>meta.id</quantity>
	[run] [smallint] NOT NULL,

	--/ <summary>Rerun number</summary>
	--/ <quantity>meta.id</quantity>
	[rerun] [smallint] NOT NULL,

	--/ <summary>Camera column</summary>
	--/ <quantity>meta.id;instr.det</quantity>
	[camcol] [tinyint] NOT NULL,

	--/ <summary>Field number</summary>
	--/ <quantity>meta.id;obs.field</quantity>
	[field] [smallint] NOT NULL,

	--/ <summary>The object id within a field. Usually changes between reruns of the same field.</summary>
	--/ <quantity>meta.id</quantity>
	[obj] [smallint] NOT NULL,

	--/ <summary>Number of children if this is a composite object that has been deblended. BRIGHT (in a flags sense) objects also have nchild == 1, the non-BRIGHT sibling.</summary>
	--/ <quantity>meta.id</quantity>
	[nChild] [smallint] NOT NULL,

	--/ <summary>Morphological type classification of the object.</summary>
	--/ <quantity>src.class;src.morph</quantity>
	[type] [smallint] NOT NULL,

	--/ <summary>Probability that the object is a star. Currently 0 if type == 3 (galaxy), 1 if type == 6 (star).</summary>
	--/ <quantity>stat.probability;src.class.starGalaxy</quantity>
	[probPSF] [real] NOT NULL,

	--/ <summary>Flag to indicate whether object is inside a mask and why</summary>
	--/ <quantity>meta.code</quantity>
	[insideMask] [tinyint] NOT NULL,

	--/ <summary>Photo Object Attribute Flags</summary>
	--/ <quantity>meta.code</quantity>
	[flags] [bigint] NOT NULL,

	--/ <summary>PSF flux</summary>
	--/ <quantity>phot.mag.PSF;em.opt.SDSS.u</quantity>
	--/ <unit>mag</unit>
	[psfMag_u] [real] NOT NULL,

	--/ <summary>PSF flux</summary>
	--/ <quantity>phot.mag.PSF;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[psfMag_g] [real] NOT NULL,

	--/ <summary>PSF flux</summary>
	--/ <quantity>phot.mag.PSF;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[psfMag_r] [real] NOT NULL,

	--/ <summary>PSF flux</summary>
	--/ <quantity>phot.mag.PSF;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[psfMag_i] [real] NOT NULL,

	--/ <summary>PSF flux</summary>
	--/ <quantity>phot.mag.PSF;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[psfMag_z] [real] NOT NULL,

	--/ <summary>PSF flux error</summary>
	--/ <quantity>stat.error;phot.mag.PSF;em.opt.SDSS.u</quantity>
	--/ <unit>mag</unit>
	[psfMagErr_u] [real] NOT NULL,

	--/ <summary>PSF flux error</summary>
	--/ <quantity>stat.error;phot.mag.PSF;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[psfMagErr_g] [real] NOT NULL,

	--/ <summary>PSF flux error</summary>
	--/ <quantity>stat.error;phot.mag.PSF;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[psfMagErr_r] [real] NOT NULL,

	--/ <summary>PSF flux error</summary>
	--/ <quantity>stat.error;phot.mag.PSF;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[psfMagErr_i] [real] NOT NULL,

	--/ <summary>PSF flux error</summary>
	--/ <quantity>stat.error;phot.mag.PSF;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[psfMagErr_z] [real] NOT NULL,

	--/ <summary>Petrosian flux</summary>
	--/ <quantity>phot.mag.petrosian;em.opt.SDSS.u</quantity>
	--/ <unit>mag</unit>
	[petroMag_u] [real] NOT NULL,

	--/ <summary>Petrosian flux</summary>
	--/ <quantity>phot.mag.petrosian;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[petroMag_g] [real] NOT NULL,

	--/ <summary>Petrosian flux</summary>
	--/ <quantity>phot.mag.petrosian;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[petroMag_r] [real] NOT NULL,

	--/ <summary>Petrosian flux</summary>
	--/ <quantity>phot.mag.petrosian;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[petroMag_i] [real] NOT NULL,

	--/ <summary>Petrosian flux</summary>
	--/ <quantity>phot.mag.petrosian;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[petroMag_z] [real] NOT NULL,

	--/ <summary>Petrosian flux error</summary>
	--/ <quantity>stat.error;phot.mag.petrosian;em.opt.SDSS.u</quantity>
	--/ <unit>mag</unit>
	[petroMagErr_u] [real] NOT NULL,

	--/ <summary>Petrosian flux error</summary>
	--/ <quantity>stat.error;phot.mag.petrosian;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[petroMagErr_g] [real] NOT NULL,

	--/ <summary>Petrosian flux error</summary>
	--/ <quantity>stat.error;phot.mag.petrosian;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[petroMagErr_r] [real] NOT NULL,

	--/ <summary>Petrosian flux error</summary>
	--/ <quantity>stat.error;phot.mag.petrosian;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[petroMagErr_i] [real] NOT NULL,

	--/ <summary>Petrosian flux error</summary>
	--/ <quantity>stat.error;phot.mag.petrosian;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[petroMagErr_z] [real] NOT NULL,

	--/ <summary>Radius containing 50% of Petrosian flux</summary>
	--/ <quantity>phys.angSize;em.opt.SDSS.r</quantity>
	--/ <unit>arcsec</unit>
	[petroR50_r] [real] NOT NULL,

	--/ <summary>Radius containing 90% of Petrosian flux</summary>
	--/ <quantity>phys.angSize;em.opt.SDSS.r</quantity>
	--/ <unit>arcsec</unit>
	[petroR90_r] [real] NOT NULL,

	--/ <summary>better of DeV/Exp magnitude fit</summary>
	--/ <quantity>phot.mag;meta.modelled;em.opt.SDSS.u</quantity>
	--/ <unit>mag</unit>
	[modelMag_u] [real] NOT NULL,

	--/ <summary>better of DeV/Exp magnitude fit</summary>
	--/ <quantity>phot.mag;meta.modelled;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[modelMag_g] [real] NOT NULL,

	--/ <summary>better of DeV/Exp magnitude fit</summary>
	--/ <quantity>phot.mag;meta.modelled;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[modelMag_r] [real] NOT NULL,

	--/ <summary>better of DeV/Exp magnitude fit</summary>
	--/ <quantity>phot.mag;meta.modelled;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[modelMag_i] [real] NOT NULL,

	--/ <summary>better of DeV/Exp magnitude fit</summary>
	--/ <quantity>phot.mag;meta.modelled;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[modelMag_z] [real] NOT NULL,

	--/ <summary>better of DeV/Exp magnitude fit error</summary>
	--/ <quantity>stat.error;phot.mag;meta.modelled;em.opt.SDSS.u</quantity>
	--/ <unit>mag</unit>
	[modelMagErr_u] [real] NOT NULL,

	--/ <summary>better of DeV/Exp magnitude fit error</summary>
	--/ <quantity>stat.error;phot.mag;meta.modelled;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[modelMagErr_g] [real] NOT NULL,

	--/ <summary>better of DeV/Exp magnitude fit error</summary>
	--/ <quantity>stat.error;phot.mag;meta.modelled;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[modelMagErr_r] [real] NOT NULL,

	--/ <summary>better of DeV/Exp magnitude fit error</summary>
	--/ <quantity>stat.error;phot.mag;meta.modelled;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[modelMagErr_i] [real] NOT NULL,

	--/ <summary>better of DeV/Exp magnitude fit error</summary>
	--/ <quantity>stat.error;phot.mag;meta.modelled;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[modelMagErr_z] [real] NOT NULL,

	--/ <summary>Adaptive (&lt;r^2&gt; + &lt;c^2&gt;)</summary>
	--/ <quantity>obs.param</quantity>
	[mRrCc_r] [real] NOT NULL,

	--/ <summary>Error in adaptive (&lt;r^2&gt; + &lt;c^2&gt;)</summary>
	--/ <quantity>stat.error;obs.param</quantity>
	[mRrCcErr_r] [real] NOT NULL,

	--/ <summary>Star ln(likelihood)</summary>
	--/ <quantity>stat.likelihood;em.opt.SDSS.r</quantity>
	[lnLStar_r] [real] NOT NULL,

	--/ <summary>Exponential disk fit ln(likelihood)</summary>
	--/ <quantity>stat.likelihood;em.opt.SDSS.r</quantity>
	[lnLExp_r] [real] NOT NULL,

	--/ <summary>DeVaucouleurs fit ln(likelihood)</summary>
	--/ <quantity>stat.likelihood;em.opt.SDSS.r</quantity>
	[lnLDeV_r] [real] NOT NULL,

	--/ <summary>Status of the object in the survey</summary>
	--/ <quantity>meta.code.status</quantity>
	[status] [int] NOT NULL,

	--/ <summary>J2000 right ascension (r')</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000;em.opt.SDSS.r</quantity>
	--/ <unit>deg</unit>
	[ra] [float] NOT NULL,

	--/ <summary>J2000 declination (r')</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000;em.opt.SDSS.r</quantity>
	--/ <unit>deg</unit>
	[dec] [float] NOT NULL,

	--/ <summary>unit vector for ra+dec</summary>
	--/ <quantity>pos.eq.x;pos.frame=j2000</quantity>
	[cx] [float] NOT NULL,

	--/ <summary>unit vector for ra+dec</summary>
	--/ <quantity>pos.eq.y;pos.frame=j2000</quantity>
	[cy] [float] NOT NULL,

	--/ <summary>unit vector for ra+dec</summary>
	--/ <quantity>pos.eq.z;pos.frame=j2000</quantity>
	[cz] [float] NOT NULL,

	--/ <summary>20-deep hierarchical trangular mesh ID of this object</summary>
	--/ <quantity>pos.eq.HTM; pos.frame=j2000</quantity>
	[htmID] [bigint] NOT NULL,

	--/ <summary>zone.id</summary>
	--/ <quantity>pos.eq.zone</quantity>
	[zoneID] [bigint] NOT NULL,

	--/ <summary>Bit mask of primary target categories the object was selected in.</summary>
	--/ <quantity>meta.code</quantity>
	[primTarget] [int] NOT NULL,

	--/ <summary>Bit mask of secondary target categories the object was selected in.</summary>
	--/ <quantity>meta.code</quantity>
	[secTarget] [int] NOT NULL,

	--/ <summary>Extinction in each filter</summary>
	--/ <quantity>phys.absorption.gal;em.opt.SDSS.u</quantity>
	--/ <unit>mag</unit>
	[extinction_u] [real] NOT NULL,

	--/ <summary>Extinction in each filter</summary>
	--/ <quantity>phys.absorption.gal;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[extinction_g] [real] NOT NULL,

	--/ <summary>Extinction in each filter</summary>
	--/ <quantity>phys.absorption.gal;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[extinction_r] [real] NOT NULL,

	--/ <summary>Extinction in each filter</summary>
	--/ <quantity>phys.absorption.gal;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[extinction_i] [real] NOT NULL,

	--/ <summary>Extinction in each filter</summary>
	--/ <quantity>phys.absorption.gal;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[extinction_z] [real] NOT NULL,

	--/ <summary>Link to the field this object is in</summary>
	--/ <quantity>meta.id;obs.field</quantity>
	[fieldID] [bigint] NOT NULL,

	--/ <summary>Pointer to the spectrum of object, if exists, else 0</summary>
	--/ <quantity>meta.id;spect</quantity>
	[SpecObjID] [bigint] NOT NULL,

	--/ <summary>computed: =SQRT(mRrCc_r/2.0)</summary>
	--/ <quantity>obs.param</quantity>
	[size] [real] NOT NULL,
 CONSTRAINT [pk_PhotoOBJDR7_DR8OBJID] PRIMARY KEY CLUSTERED 
(
	[dr8objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhotoPrimaryDR7]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--/ <summary> Contains the spatial cross-match between DR8 primaries and DR7 primaries. </summary>
--/ <remarks> This is a unique match between a DR8 photoprimary and a DR7 photoprimary,   and matches between different run/camcol/field are allowed.  The match  radius is 1 arcsec.  The table contains the DR8 and DR7 objids, the  distance between them and the DR7 phototag quantities. </remarks>
CREATE TABLE [dbo].[PhotoPrimaryDR7](

	--/ <summary>Unique DR7 identifier composed from [skyVersion,rerun,run,camcol,field,obj].</summary>
	--/ <quantity>meta.id</quantity>
	[dr7objid] [bigint] NOT NULL,

	--/ <summary>Unique DR8 identifier composed from [skyVersion,rerun,run,camcol,field,obj].</summary>
	--/ <quantity>meta.id</quantity>
	[dr8objid] [bigint] NOT NULL,

	--/ <summary>Distance in arcmin between the DR7 and DR8 positions</summary>
	--/ <quantity>pos.angDistance</quantity>
	--/ <unit>arcmin</unit>
	[distance] [float] NULL,

	--/ <summary>0 = OPDB target, 1 = OPDB best</summary>
	--/ <quantity>meta.code</quantity>
	[skyVersion] [tinyint] NULL,

	--/ <summary>Run number</summary>
	--/ <quantity>meta.id</quantity>
	[run] [smallint] NULL,

	--/ <summary>Rerun number</summary>
	--/ <quantity>meta.id</quantity>
	[rerun] [smallint] NULL,

	--/ <summary>Camera column</summary>
	--/ <quantity>meta.id;instr.det</quantity>
	[camcol] [tinyint] NULL,

	--/ <summary>Field number</summary>
	--/ <quantity>meta.id;obs.field</quantity>
	[field] [smallint] NULL,

	--/ <summary>The object id within a field. Usually changes between reruns of the same field.</summary>
	--/ <quantity>meta.id</quantity>
	[obj] [smallint] NULL,

	--/ <summary>Number of children if this is a composite object that has been deblended. BRIGHT (in a flags sense) objects also have nchild == 1, the non-BRIGHT sibling.</summary>
	--/ <quantity>meta.id</quantity>
	[nChild] [smallint] NULL,

	--/ <summary>Morphological type classification of the object.</summary>
	--/ <quantity>src.class;src.morph</quantity>
	[type] [smallint] NULL,

	--/ <summary>Probability that the object is a star. Currently 0 if type == 3 (galaxy), 1 if type == 6 (star).</summary>
	--/ <quantity>stat.probability;src.class.starGalaxy</quantity>
	[probPSF] [real] NULL,

	--/ <summary>Flag to indicate whether object is inside a mask and why</summary>
	--/ <quantity>meta.code</quantity>
	[insideMask] [tinyint] NULL,

	--/ <summary>Photo Object Attribute Flags</summary>
	--/ <quantity>meta.code</quantity>
	[flags] [bigint] NULL,

	--/ <summary>PSF flux</summary>
	--/ <quantity>phot.mag.PSF;em.opt.SDSS.u</quantity>
	--/ <unit>mag</unit>
	[psfMag_u] [real] NULL,

	--/ <summary>PSF flux</summary>
	--/ <quantity>phot.mag.PSF;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[psfMag_g] [real] NULL,

	--/ <summary>PSF flux</summary>
	--/ <quantity>phot.mag.PSF;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[psfMag_r] [real] NULL,

	--/ <summary>PSF flux</summary>
	--/ <quantity>phot.mag.PSF;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[psfMag_i] [real] NULL,

	--/ <summary>PSF flux</summary>
	--/ <quantity>phot.mag.PSF;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[psfMag_z] [real] NULL,

	--/ <summary>PSF flux error</summary>
	--/ <quantity>stat.error;phot.mag.PSF;em.opt.SDSS.u</quantity>
	--/ <unit>mag</unit>
	[psfMagErr_u] [real] NULL,

	--/ <summary>PSF flux error</summary>
	--/ <quantity>stat.error;phot.mag.PSF;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[psfMagErr_g] [real] NULL,

	--/ <summary>PSF flux error</summary>
	--/ <quantity>stat.error;phot.mag.PSF;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[psfMagErr_r] [real] NULL,

	--/ <summary>PSF flux error</summary>
	--/ <quantity>stat.error;phot.mag.PSF;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[psfMagErr_i] [real] NULL,

	--/ <summary>PSF flux error</summary>
	--/ <quantity>stat.error;phot.mag.PSF;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[psfMagErr_z] [real] NULL,

	--/ <summary>Petrosian flux</summary>
	--/ <quantity>phot.mag.petrosian;em.opt.SDSS.u</quantity>
	--/ <unit>mag</unit>
	[petroMag_u] [real] NULL,

	--/ <summary>Petrosian flux</summary>
	--/ <quantity>phot.mag.petrosian;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[petroMag_g] [real] NULL,

	--/ <summary>Petrosian flux</summary>
	--/ <quantity>phot.mag.petrosian;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[petroMag_r] [real] NULL,

	--/ <summary>Petrosian flux</summary>
	--/ <quantity>phot.mag.petrosian;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[petroMag_i] [real] NULL,

	--/ <summary>Petrosian flux</summary>
	--/ <quantity>phot.mag.petrosian;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[petroMag_z] [real] NULL,

	--/ <summary>Petrosian flux error</summary>
	--/ <quantity>stat.error;phot.mag.petrosian;em.opt.SDSS.u</quantity>
	--/ <unit>mag</unit>
	[petroMagErr_u] [real] NULL,

	--/ <summary>Petrosian flux error</summary>
	--/ <quantity>stat.error;phot.mag.petrosian;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[petroMagErr_g] [real] NULL,

	--/ <summary>Petrosian flux error</summary>
	--/ <quantity>stat.error;phot.mag.petrosian;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[petroMagErr_r] [real] NULL,

	--/ <summary>Petrosian flux error</summary>
	--/ <quantity>stat.error;phot.mag.petrosian;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[petroMagErr_i] [real] NULL,

	--/ <summary>Petrosian flux error</summary>
	--/ <quantity>stat.error;phot.mag.petrosian;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[petroMagErr_z] [real] NULL,

	--/ <summary>Radius containing 50% of Petrosian flux</summary>
	--/ <quantity>phys.angSize;em.opt.SDSS.r</quantity>
	--/ <unit>arcsec</unit>
	[petroR50_r] [real] NULL,

	--/ <summary>Radius containing 90% of Petrosian flux</summary>
	--/ <quantity>phys.angSize;em.opt.SDSS.r</quantity>
	--/ <unit>arcsec</unit>
	[petroR90_r] [real] NULL,

	--/ <summary>better of DeV/Exp magnitude fit</summary>
	--/ <quantity>phot.mag;meta.modelled;em.opt.SDSS.u</quantity>
	--/ <unit>mag</unit>
	[modelMag_u] [real] NULL,

	--/ <summary>better of DeV/Exp magnitude fit</summary>
	--/ <quantity>phot.mag;meta.modelled;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[modelMag_g] [real] NULL,

	--/ <summary>better of DeV/Exp magnitude fit</summary>
	--/ <quantity>phot.mag;meta.modelled;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[modelMag_r] [real] NULL,

	--/ <summary>better of DeV/Exp magnitude fit</summary>
	--/ <quantity>phot.mag;meta.modelled;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[modelMag_i] [real] NULL,

	--/ <summary>better of DeV/Exp magnitude fit</summary>
	--/ <quantity>phot.mag;meta.modelled;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[modelMag_z] [real] NULL,

	--/ <summary>better of DeV/Exp magnitude fit error</summary>
	--/ <quantity>stat.error;phot.mag;meta.modelled;em.opt.SDSS.u</quantity>
	--/ <unit>mag</unit>
	[modelMagErr_u] [real] NULL,

	--/ <summary>better of DeV/Exp magnitude fit error</summary>
	--/ <quantity>stat.error;phot.mag;meta.modelled;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[modelMagErr_g] [real] NULL,

	--/ <summary>better of DeV/Exp magnitude fit error</summary>
	--/ <quantity>stat.error;phot.mag;meta.modelled;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[modelMagErr_r] [real] NULL,

	--/ <summary>better of DeV/Exp magnitude fit error</summary>
	--/ <quantity>stat.error;phot.mag;meta.modelled;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[modelMagErr_i] [real] NULL,

	--/ <summary>better of DeV/Exp magnitude fit error</summary>
	--/ <quantity>stat.error;phot.mag;meta.modelled;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[modelMagErr_z] [real] NULL,

	--/ <summary>Adaptive (&lt;r^2&gt; + &lt;c^2&gt;)</summary>
	--/ <quantity>obs.param</quantity>
	[mRrCc_r] [real] NULL,

	--/ <summary>Error in adaptive (&lt;r^2&gt; + &lt;c^2&gt;)</summary>
	--/ <quantity>stat.error;obs.param</quantity>
	[mRrCcErr_r] [real] NULL,

	--/ <summary>Star ln(likelihood)</summary>
	--/ <quantity>stat.likelihood;em.opt.SDSS.r</quantity>
	[lnLStar_r] [real] NULL,

	--/ <summary>Exponential disk fit ln(likelihood)</summary>
	--/ <quantity>stat.likelihood;em.opt.SDSS.r</quantity>
	[lnLExp_r] [real] NULL,

	--/ <summary>DeVaucouleurs fit ln(likelihood)</summary>
	--/ <quantity>stat.likelihood;em.opt.SDSS.r</quantity>
	[lnLDeV_r] [real] NULL,

	--/ <summary>Status of the object in the survey</summary>
	--/ <quantity>meta.code.status</quantity>
	[status] [int] NULL,

	--/ <summary>J2000 right ascension (r')</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000;em.opt.SDSS.r</quantity>
	--/ <unit>deg</unit>
	[ra] [float] NULL,

	--/ <summary>J2000 declination (r')</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000;em.opt.SDSS.r</quantity>
	--/ <unit>deg</unit>
	[dec] [float] NULL,

	--/ <summary>unit vector for ra+dec</summary>
	--/ <quantity>pos.eq.x;pos.frame=j2000</quantity>
	[cx] [float] NULL,

	--/ <summary>unit vector for ra+dec</summary>
	--/ <quantity>pos.eq.y;pos.frame=j2000</quantity>
	[cy] [float] NULL,

	--/ <summary>unit vector for ra+dec</summary>
	--/ <quantity>pos.eq.z;pos.frame=j2000</quantity>
	[cz] [float] NULL,

	--/ <summary>Bit mask of primary target categories the object was selected in.</summary>
	--/ <quantity>meta.code</quantity>
	[primTarget] [int] NULL,

	--/ <summary>Bit mask of secondary target categories the object was selected in.</summary>
	--/ <quantity>meta.code</quantity>
	[secTarget] [int] NULL,

	--/ <summary>Extinction in each filter</summary>
	--/ <quantity>phys.absorption.gal;em.opt.SDSS.u</quantity>
	--/ <unit>mag</unit>
	[extinction_u] [real] NULL,

	--/ <summary>Extinction in each filter</summary>
	--/ <quantity>phys.absorption.gal;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[extinction_g] [real] NULL,

	--/ <summary>Extinction in each filter</summary>
	--/ <quantity>phys.absorption.gal;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[extinction_r] [real] NULL,

	--/ <summary>Extinction in each filter</summary>
	--/ <quantity>phys.absorption.gal;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[extinction_i] [real] NULL,

	--/ <summary>Extinction in each filter</summary>
	--/ <quantity>phys.absorption.gal;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[extinction_z] [real] NULL,

	--/ <summary>20-deep hierarchical trangular mesh ID of this object</summary>
	--/ <quantity>pos.eq.HTM; pos.frame=j2000</quantity>
	[htmID] [bigint] NULL,

	--/ <summary>zone.id</summary>
	--/ <quantity>pos.eq.zone</quantity>
	[zoneID] [bigint] NULL,

	--/ <summary>Link to the field this object is in</summary>
	--/ <quantity>meta.id;obs.field</quantity>
	[fieldID] [bigint] NULL,

	--/ <summary>Pointer to the spectrum of object, if exists, else 0</summary>
	--/ <quantity>meta.id;spect</quantity>
	[SpecObjID] [bigint] NULL,

	--/ <summary>computed: =SQRT(mRrCc_r/2.0)</summary>
	--/ <quantity>obs.param</quantity>
	[size] [real] NULL,
 CONSTRAINT [pk_PhotoPrimaryDR7_DR8OBJID] PRIMARY KEY CLUSTERED 
(
	[dr8objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Photoz]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--/ <summary> The photometrically estimated redshifts for all objects in the GalaxyTag view. </summary>
--/ <remarks> Estimation is based on a robust fit on spectroscopically observed objects  with similar colors and r magnitude.&lt;br>  Please see the &lt;b>Photometric Redshifts&lt;/b> entry in Algorithms for more  information about this table. &lt;br>  &lt;i>NOTE: This table may be empty initially because the values  are computed in a separate calculation after the main data release.&lt;/i> </remarks>
CREATE TABLE [dbo].[Photoz](

	--/ <summary>unique ID pointing to GalaxyTag table</summary>
	--/ <quantity>meta.id</quantity>
	[objID] [bigint] NOT NULL,

	--/ <summary>photometric redshift; estimated by robust fit to nearest neighbors in a reference set</summary>
	--/ <quantity>src.redshift;phot</quantity>
	[z] [real] NOT NULL,

	--/ <summary>estimated error of the photometric redshift; if zErr=-9999, the fit failed, but the neighbors' average redshift might still be available</summary>
	--/ <quantity>stat.error;src.redshift;phot</quantity>
	[zErr] [real] NOT NULL,

	--/ <summary>number of nearest neighbors after excluding the outliers; maximal value is 100, a much smaller value indicates a poor estimate</summary>
	--/ <quantity>meta.number</quantity>
	[nnCount] [smallint] NOT NULL,

	--/ <summary>gives the color space bounding volume of the nnCount nearest neighbors; a large value indicates a poor estimate</summary>
	--/ <quantity></quantity>
	[nnVol] [real] NOT NULL,

	--/ <summary></summary>
	--/ <quantity></quantity>
	[nnIsInside] [smallint] NOT NULL,

	--/ <summary>objID of the (first) nearest neighbor</summary>
	--/ <quantity>meta.id</quantity>
	[nnObjID] [bigint] NOT NULL,

	--/ <summary>spectroscopic redshift	of the (first) nearest neighbor</summary>
	--/ <quantity>src.redshift</quantity>
	[nnSpecz] [real] NOT NULL,

	--/ <summary>objID of the farthest neighbor</summary>
	--/ <quantity>meta.id</quantity>
	[nnFarObjID] [bigint] NOT NULL,

	--/ <summary>average redshift of the nearest neighbors; if significantly different from z, this might be a better estimate than z</summary>
	--/ <quantity>src.redshift;stat.mean</quantity>
	[nnAvgZ] [real] NOT NULL,

	--/ <summary>the distance modulus for Omega=0.2739, Lambda=0.726, h=0.705 cosmology</summary>
	--/ <quantity>phot.mag.distMod</quantity>
	[distMod] [real] NOT NULL,

	--/ <summary>the luminosity distance in Mpc for Omega=0.2739, Lambda=0.726, h=0.705 cosmology</summary>
	--/ <quantity>pos.distance.lum</quantity>
	[lumDist] [real] NOT NULL,

	--/ <summary>the chi-square value for the minimum chi-square template fit (non-reduced, 4 degrees of freedom)</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[chisq] [real] NOT NULL,

	--/ <summary>the residual Euclidean norm value for the minimum chi-square template fit</summary>
	--/ <quantity>stat.fit.param</quantity>
	[rnorm] [real] NOT NULL,

	--/ <summary></summary>
	--/ <quantity></quantity>
	[nTemplates] [int] NOT NULL,

	--/ <summary>synthetic u' magnitude calculated from the fitted template</summary>
	--/ <quantity>phot.mag;em.opt.SDSS.u</quantity>
	--/ <unit>mag</unit>
	[synthU] [real] NOT NULL,

	--/ <summary>synthetic g' magnitude calculated from the fitted template</summary>
	--/ <quantity>phot.mag;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[synthG] [real] NOT NULL,

	--/ <summary>synthetic r' magnitude calculated from the fitted template</summary>
	--/ <quantity>phot.mag;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[synthR] [real] NOT NULL,

	--/ <summary>synthetic i' magnitude calculated from the fitted template</summary>
	--/ <quantity>phot.mag;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[synthI] [real] NOT NULL,

	--/ <summary>synthetic z' magnitude calculated from the fitted template</summary>
	--/ <quantity>phot.mag;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[synthZ] [real] NOT NULL,

	--/ <summary>k correction for z=0</summary>
	--/ <quantity>phot.mag.kc;em.opt.SDSS.u</quantity>
	[kcorrU] [real] NOT NULL,

	--/ <summary>k correction for z=0</summary>
	--/ <quantity>phot.mag.kc;em.opt.SDSS.g</quantity>
	[kcorrG] [real] NOT NULL,

	--/ <summary>k correction for z=0</summary>
	--/ <quantity>phot.mag.kc;em.opt.SDSS.r</quantity>
	[kcorrR] [real] NOT NULL,

	--/ <summary>k correction for z=0</summary>
	--/ <quantity>phot.mag.kc;em.opt.SDSS.i</quantity>
	[kcorrI] [real] NOT NULL,

	--/ <summary>k correction for z=0</summary>
	--/ <quantity>phot.mag.kc;em.opt.SDSS.z</quantity>
	[kcorrZ] [real] NOT NULL,

	--/ <summary>k correction for z=0.1</summary>
	--/ <quantity>phot.mag.kc;em.opt.SDSS.u</quantity>
	[kcorrU01] [real] NOT NULL,

	--/ <summary>k correction for z=0.1</summary>
	--/ <quantity>phot.mag.kc;em.opt.SDSS.g</quantity>
	[kcorrG01] [real] NOT NULL,

	--/ <summary>k correction for z=0.1</summary>
	--/ <quantity>phot.mag.kc;em.opt.SDSS.r</quantity>
	[kcorrR01] [real] NOT NULL,

	--/ <summary>k correction for z=0.1</summary>
	--/ <quantity>phot.mag.kc;em.opt.SDSS.i</quantity>
	[kcorrI01] [real] NOT NULL,

	--/ <summary>k correction for z=0.1</summary>
	--/ <quantity>phot.mag.kc;em.opt.SDSS.z</quantity>
	[kcorrZ01] [real] NOT NULL,

	--/ <summary>rest frame u' abs magnitude</summary>
	--/ <quantity>phot.mag.abs;em.opt.SDSS.u</quantity>
	--/ <unit>mag</unit>
	[absMagU] [real] NOT NULL,

	--/ <summary>rest frame g' abs magnitude</summary>
	--/ <quantity>phot.mag.abs;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[absMagG] [real] NOT NULL,

	--/ <summary>rest frame r' abs magnitude</summary>
	--/ <quantity>phot.mag.abs;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[absMagR] [real] NOT NULL,

	--/ <summary>rest frame i' abs magnitude</summary>
	--/ <quantity>phot.mag.abs;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[absMagI] [real] NOT NULL,

	--/ <summary>rest frame z' abs magnitude</summary>
	--/ <quantity>phot.mag.abs;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[absMagZ] [real] NOT NULL,
 CONSTRAINT [pk_Photoz_objID] PRIMARY KEY CLUSTERED 
(
	[objID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhotozRF]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--/ <summary></summary>
--/ <remarks></remarks>
CREATE TABLE [dbo].[PhotozRF](

	--/ <summary>unique ID pointing to GalaxyTag table</summary>
	--/ <quantity>meta.id</quantity>
	[objID] [bigint] NOT NULL,

	--/ <summary>photometric redshift; estimated by robust fit to nearest neighbors in a reference set</summary>
	--/ <quantity>src.redshift;phot</quantity>
	[z] [real] NOT NULL,

	--/ <summary>estimated error of the photometric redshift; if zErr=-9999, the fit failed, but the neighbors' average redshift might still be available</summary>
	--/ <quantity>stat.error;src.redshift;phot</quantity>
	[zErr] [real] NOT NULL,

	--/ <summary>the distance modulus for Omega=0.2739, Lambda=0.726, h=0.705 cosmology</summary>
	--/ <quantity>phot.mag.distMod</quantity>
	[distMod] [real] NOT NULL,

	--/ <summary>the luminosity distance in Mpc for Omega=0.2739, Lambda=0.726, h=0.705 cosmology</summary>
	--/ <quantity>pos.distance.lum</quantity>
	[lumDist] [real] NOT NULL,

	--/ <summary>the chi-square value for the minimum chi-square template fit (non-reduced, 4 degrees of freedom)</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[chisq] [real] NOT NULL,

	--/ <summary>the residual Euclidean norm value for the minimum chi-square template fit</summary>
	--/ <quantity>stat.fit.param</quantity>
	[rnorm] [real] NOT NULL,

	--/ <summary></summary>
	--/ <quantity></quantity>
	[nTemplates] [int] NOT NULL,

	--/ <summary>synthetic u' magnitude calculated from the fitted template</summary>
	--/ <quantity>phot.mag;em.opt.SDSS.u</quantity>
	--/ <unit>mag</unit>
	[synthU] [real] NOT NULL,

	--/ <summary>synthetic g' magnitude calculated from the fitted template</summary>
	--/ <quantity>phot.mag;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[synthG] [real] NOT NULL,

	--/ <summary>synthetic r' magnitude calculated from the fitted template</summary>
	--/ <quantity>phot.mag;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[synthR] [real] NOT NULL,

	--/ <summary>synthetic i' magnitude calculated from the fitted template</summary>
	--/ <quantity>phot.mag;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[synthI] [real] NOT NULL,

	--/ <summary>synthetic z' magnitude calculated from the fitted template</summary>
	--/ <quantity>phot.mag;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[synthZ] [real] NOT NULL,

	--/ <summary>k correction for z=0</summary>
	--/ <quantity>phot.mag.kc;em.opt.SDSS.u</quantity>
	[kcorrU] [real] NOT NULL,

	--/ <summary>k correction for z=0</summary>
	--/ <quantity>phot.mag.kc;em.opt.SDSS.g</quantity>
	[kcorrG] [real] NOT NULL,

	--/ <summary>k correction for z=0</summary>
	--/ <quantity>phot.mag.kc;em.opt.SDSS.r</quantity>
	[kcorrR] [real] NOT NULL,

	--/ <summary>k correction for z=0</summary>
	--/ <quantity>phot.mag.kc;em.opt.SDSS.i</quantity>
	[kcorrI] [real] NOT NULL,

	--/ <summary>k correction for z=0</summary>
	--/ <quantity>phot.mag.kc;em.opt.SDSS.z</quantity>
	[kcorrZ] [real] NOT NULL,

	--/ <summary>k correction for z=0.1</summary>
	--/ <quantity>phot.mag.kc;em.opt.SDSS.u</quantity>
	[kcorrU01] [real] NOT NULL,

	--/ <summary>k correction for z=0.1</summary>
	--/ <quantity>phot.mag.kc;em.opt.SDSS.g</quantity>
	[kcorrG01] [real] NOT NULL,

	--/ <summary>k correction for z=0.1</summary>
	--/ <quantity>phot.mag.kc;em.opt.SDSS.r</quantity>
	[kcorrR01] [real] NOT NULL,

	--/ <summary>k correction for z=0.1</summary>
	--/ <quantity>phot.mag.kc;em.opt.SDSS.i</quantity>
	[kcorrI01] [real] NOT NULL,

	--/ <summary>k correction for z=0.1</summary>
	--/ <quantity>phot.mag.kc;em.opt.SDSS.z</quantity>
	[kcorrZ01] [real] NOT NULL,

	--/ <summary>rest frame u' abs magnitude</summary>
	--/ <quantity>phot.mag.abs;em.opt.SDSS.u</quantity>
	--/ <unit>mag</unit>
	[absMagU] [real] NOT NULL,

	--/ <summary>rest frame g' abs magnitude</summary>
	--/ <quantity>phot.mag.abs;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[absMagG] [real] NOT NULL,

	--/ <summary>rest frame r' abs magnitude</summary>
	--/ <quantity>phot.mag.abs;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[absMagR] [real] NOT NULL,

	--/ <summary>rest frame i' abs magnitude</summary>
	--/ <quantity>phot.mag.abs;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[absMagI] [real] NOT NULL,

	--/ <summary>rest frame z' abs magnitude</summary>
	--/ <quantity>phot.mag.abs;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[absMagZ] [real] NOT NULL,
 CONSTRAINT [pk_PhotozRF_objID] PRIMARY KEY CLUSTERED 
(
	[objID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhotozRFTemplateCoeff]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--/ <summary></summary>
--/ <remarks></remarks>
CREATE TABLE [dbo].[PhotozRFTemplateCoeff](

	--/ <summary>primary key</summary>
	--/ <quantity>meta.id</quantity>
	[objID] [bigint] NOT NULL,

	--/ <summary>template id</summary>
	--/ <quantity>meta.id</quantity>
	[templateID] [int] NOT NULL,

	--/ <summary></summary>
	--/ <quantity></quantity>
	[coeff] [real] NOT NULL,
 CONSTRAINT [pk_PhotozRFTemplateCoeff_objID_t] PRIMARY KEY CLUSTERED 
(
	[objID] ASC,
	[templateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhotozTemplateCoeff]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--/ <summary></summary>
--/ <remarks></remarks>
CREATE TABLE [dbo].[PhotozTemplateCoeff](

	--/ <summary>primary key</summary>
	--/ <quantity>meta.id</quantity>
	[objID] [bigint] NOT NULL,

	--/ <summary>template ID</summary>
	--/ <quantity>meta.id</quantity>
	[templateID] [int] NOT NULL,

	--/ <summary></summary>
	--/ <quantity></quantity>
	[coeff] [real] NOT NULL,
 CONSTRAINT [pk_PhotozTemplateCoeff_objID_tem] PRIMARY KEY CLUSTERED 
(
	[objID] ASC,
	[templateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Plate2Target]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--/ <summary> Which objects are in the coverage area of which plates? </summary>
--/ <remarks> This table has an entry for each case of a target from the   sppTargets table having been targetable by a given plate.  Can be joined with plateX on the PLATEID column, and with  sppTargets on the OBJID column. Some plates are included  that were never observed; the PLATEID values for these   will not match any entries in the plateX table. </remarks>
CREATE TABLE [dbo].[Plate2Target](

	--/ <summary>primary key</summary>
	--/ <quantity>meta.id;meta.main</quantity>
	[plate2targetid] [int] NOT NULL,

	--/ <summary>plate number</summary>
	--/ <quantity>meta.id;instr.det</quantity>
	[plate] [int] NOT NULL,

	--/ <summary>plate identification number in plateX</summary>
	--/ <quantity></quantity>
	[plateid] [bigint] NOT NULL,

	--/ <summary>object identification number in sppTargets</summary>
	--/ <quantity>meta.id.cross</quantity>
	[objid] [bigint] NOT NULL,

	--/ <summary>Load Version</summary>
	--/ <quantity>meta.version</quantity>
	[loadVersion] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PlateX]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

--/ <summary> Contains data from a given plate used for spectroscopic observations. </summary>
--/ <remarks> Each SDSS spectrograph plate has 640 observed spectra, whereas each BOSS   spectrograph plate has 1000 observed spectra.  </remarks>
CREATE TABLE [dbo].[PlateX](

	--/ <summary>Unique ID, composite of plate number and MJD</summary>
	--/ <quantity>meta.id;meta.main</quantity>
	[plateID] [bigint] NOT NULL,

	--/ <summary>Name of release that this plate/mjd/rerun was first distributed in</summary>
	--/ <quantity>meta.id</quantity>
	[firstRelease] [varchar](32) NOT NULL,

	--/ <summary>Plate number</summary>
	--/ <quantity>meta.id</quantity>
	[plate] [smallint] NOT NULL,

	--/ <summary>MJD of observation (last)</summary>
	--/ <quantity>time.epoch;obs</quantity>
	--/ <unit>d</unit>
	[mjd] [int] NOT NULL,

	--/ <summary>List of contributing MJDs [from spPlate header]</summary>
	--/ <quantity>time.epoch</quantity>
	[mjdList] [varchar](512) NOT NULL,

	--/ <summary>Name of survey [from platelist product]</summary>
	--/ <quantity>meta.id</quantity>
	[survey] [varchar](32) NOT NULL,

	--/ <summary>Name of program [from platelist product]</summary>
	--/ <quantity>meta.id</quantity>
	[programName] [varchar](32) NOT NULL,

	--/ <summary>Instrument used (SDSS or BOSS spectrograph)</summary>
	--/ <quantity>instr</quantity>
	[instrument] [varchar](32) NOT NULL,

	--/ <summary>Name of tiling chunk  [from platelist product]</summary>
	--/ <quantity>meta.id;instr.param</quantity>
	[chunk] [varchar](32) NOT NULL,

	--/ <summary>Drilling run for plate [from platelist product]</summary>
	--/ <quantity>meta.note</quantity>
	[plateRun] [varchar](32) NOT NULL,

	--/ <summary>Comments on the plate design from plate plans [from platelist product]</summary>
	--/ <quantity>meta.note</quantity>
	[designComments] [varchar](128) NOT NULL,

	--/ <summary>Characterization of plate quality</summary>
	--/ <quantity>meta.code.qual</quantity>
	[plateQuality] [varchar](32) NOT NULL,

	--/ <summary>Comments on reason for plate quality</summary>
	--/ <quantity>meta.note</quantity>
	[qualityComments] [varchar](100) NOT NULL,

	--/ <summary>Overall signal to noise measure for plate (only set for SDSS plates)</summary>
	--/ <quantity>stat.snr</quantity>
	[plateSN2] [real] NOT NULL,

	--/ <summary>Dereddened overall signal to noise measure for plate (only set for BOSS plates)</summary>
	--/ <quantity>stat.snr</quantity>
	[deredSN2] [real] NOT NULL,

	--/ <summary>RA, J2000 [from spPlate header]</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[ra] [float] NOT NULL,

	--/ <summary>Dec, J2000 [from spPlate header]</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[dec] [float] NOT NULL,

	--/ <summary>2D reduction rerun of plate</summary>
	--/ <quantity>meta.note</quantity>
	[run2d] [varchar](32) NOT NULL,

	--/ <summary>1D reduction rerun of plate</summary>
	--/ <quantity>meta.note</quantity>
	[run1d] [varchar](32) NOT NULL,

	--/ <summary>SSPP reduction rerun of plate  ("none" if not run)</summary>
	--/ <quantity>meta.note</quantity>
	[runsspp] [varchar](32) NOT NULL,

	--/ <summary>Tile number for SDSS-I, -II plates (-1 for SDSS-III) [from platelist product]</summary>
	--/ <quantity>meta.id</quantity>
	[tile] [smallint] NOT NULL,

	--/ <summary>Design number number for SDSS-III plates (-1 for SDSS-I, -II) [from platelist product]</summary>
	--/ <quantity>meta.id</quantity>
	[designID] [int] NOT NULL,

	--/ <summary>Location number number for SDSS-III plates (-1 for SDSS-I, -II) [from platelist product]</summary>
	--/ <quantity>meta.id</quantity>
	[locationID] [int] NOT NULL,

	--/ <summary>IOP Version [from spPlate header]</summary>
	--/ <quantity>meta.version</quantity>
	[iopVersion] [varchar](64) NOT NULL,

	--/ <summary>Camera code version  [from spPlate header]</summary>
	--/ <quantity>meta.version;instr.det</quantity>
	[camVersion] [varchar](64) NOT NULL,

	--/ <summary>Time in string format [from spPlate header]</summary>
	--/ <quantity>time.epoch</quantity>
	[taiHMS] [varchar](64) NOT NULL,

	--/ <summary>Date of 1st row [from spPlate header]</summary>
	--/ <quantity>time.epoch</quantity>
	[dateObs] [varchar](32) NOT NULL,

	--/ <summary>Time System [from spPlate header]</summary>
	--/ <quantity>meta.code</quantity>
	[timeSys] [varchar](8) NOT NULL,

	--/ <summary>x of Normal unit vector in J2000</summary>
	--/ <quantity>pos.eq.x;pos.frame=j2000</quantity>
	[cx] [float] NOT NULL,

	--/ <summary>y of Normal unit vector in J2000</summary>
	--/ <quantity>pos.eq.y;pos.frame=j2000</quantity>
	[cy] [float] NOT NULL,

	--/ <summary>z of Normal unit vector in J2000</summary>
	--/ <quantity>pos.eq.z;pos.frame=j2000</quantity>
	[cz] [float] NOT NULL,

	--/ <summary>ID of cartridge used for the observation [from spPlate header]</summary>
	--/ <quantity>meta.id</quantity>
	[cartridgeID] [smallint] NOT NULL,

	--/ <summary>Mean time (TAI) [from spPlate header]</summary>
	--/ <quantity>time.epoch;obs;stat.mean</quantity>
	--/ <unit>s</unit>
	[tai] [float] NOT NULL,

	--/ <summary>Beginning time (TAI) [from spPlate header]</summary>
	--/ <quantity>time.start</quantity>
	--/ <unit>s</unit>
	[taiBegin] [float] NOT NULL,

	--/ <summary>Ending time (TAI) [from spPlate header]</summary>
	--/ <quantity>time.end</quantity>
	--/ <unit>s</unit>
	[taiEnd] [float] NOT NULL,

	--/ <summary>Airmass at central TAI time [from spPlate header]</summary>
	--/ <quantity>obs.airmass</quantity>
	[airmass] [real] NOT NULL,

	--/ <summary>Map MJD [from spPlate header]</summary>
	--/ <quantity>time.epoch</quantity>
	--/ <unit>d</unit>
	[mapMjd] [int] NOT NULL,

	--/ <summary>ID of mapping file [from spPlate header]</summary>
	--/ <quantity>meta.id;meta.file</quantity>
	[mapName] [varchar](32) NOT NULL,

	--/ <summary>Full name of mapping file [from spPlate header]</summary>
	--/ <quantity>meta.id;meta.file</quantity>
	[plugFile] [varchar](32) NOT NULL,

	--/ <summary>Total Exposure time [from spPlate header]</summary>
	--/ <quantity>time.duration;obs.exposure</quantity>
	--/ <unit>s</unit>
	[expTime] [real] NOT NULL,

	--/ <summary>exposure time in B1 spectrograph [from spPlate header]</summary>
	--/ <quantity>time.duration;obs.exposure</quantity>
	--/ <unit>s</unit>
	[expTimeB1] [real] NOT NULL,

	--/ <summary>exposure time in B2 spectrograph [from spPlate header]</summary>
	--/ <quantity>time.duration;obs.exposure</quantity>
	--/ <unit>s</unit>
	[expTimeB2] [real] NOT NULL,

	--/ <summary>exposure time in R1 spectrograph [from spPlate header]</summary>
	--/ <quantity>time.duration;obs.exposure</quantity>
	--/ <unit>s</unit>
	[expTimeR1] [real] NOT NULL,

	--/ <summary>exposure time in R2 spectrograph [from spPlate header]</summary>
	--/ <quantity>time.duration;obs.exposure</quantity>
	--/ <unit>s</unit>
	[expTimeR2] [real] NOT NULL,

	--/ <summary>idlspec2d version used during 2d reduction [from spPlate header]</summary>
	--/ <quantity>meta.version</quantity>
	[vers2d] [varchar](32) NOT NULL,

	--/ <summary>idlspec2d version used during combination of multiple exposures [from spPlate header]</summary>
	--/ <quantity>meta.version</quantity>
	[verscomb] [varchar](32) NOT NULL,

	--/ <summary>idlspec2d version used during redshift fitting [from spPlate header]</summary>
	--/ <quantity>meta.version</quantity>
	[vers1d] [varchar](32) NOT NULL,

	--/ <summary>Signal to noise measure for MS turnoff stars on plate (-9999 if not appropriate)</summary>
	--/ <quantity>stat.snr</quantity>
	[snturnoff] [real] NOT NULL,

	--/ <summary>Number of MS turnoff stars on plate</summary>
	--/ <quantity>meta.number</quantity>
	[nturnoff] [real] NOT NULL,

	--/ <summary>Number of exposures total [from spPlate header]</summary>
	--/ <quantity>meta.number</quantity>
	[nExp] [smallint] NOT NULL,

	--/ <summary>Number of exposures in B1 spectrograph  [from spPlate header]</summary>
	--/ <quantity>meta.number</quantity>
	[nExpB1] [smallint] NOT NULL,

	--/ <summary>Number of exposures in B2 spectrograph  [from spPlate header]</summary>
	--/ <quantity>meta.number</quantity>
	[nExpB2] [smallint] NOT NULL,

	--/ <summary>Number of exposures in R1 spectrograph  [from spPlate header]</summary>
	--/ <quantity>meta.number</quantity>
	[nExpR1] [smallint] NOT NULL,

	--/ <summary>Number of exposures in R2 spectrograph  [from spPlate header]</summary>
	--/ <quantity>meta.number</quantity>
	[nExpR2] [smallint] NOT NULL,

	--/ <summary>(S/N)^2 at g=20.20 for spectrograph #1 [from spPlate header]</summary>
	--/ <quantity>stat.value;em.opt.SDSS.g</quantity>
	[sn1_g] [real] NOT NULL,

	--/ <summary>(S/N)^2 at r=20.25 for spectrograph #1 [from spPlate header]</summary>
	--/ <quantity>stat.value;em.opt.SDSS.r</quantity>
	[sn1_r] [real] NOT NULL,

	--/ <summary>(S/N)^2 at i=19.90 for spectrograph #1 [from spPlate header]</summary>
	--/ <quantity>stat.value;em.opt.SDSS.i</quantity>
	[sn1_i] [real] NOT NULL,

	--/ <summary>(S/N)^2 at g=20.20 for spectrograph #2 [from spPlate header]</summary>
	--/ <quantity>stat.value;em.opt.SDSS.g</quantity>
	[sn2_g] [real] NOT NULL,

	--/ <summary>(S/N)^2 at r=20.25 for spectrograph #2 [from spPlate header]</summary>
	--/ <quantity>stat.value;em.opt.SDSS.r</quantity>
	[sn2_r] [real] NOT NULL,

	--/ <summary>(S/N)^2 at i=19.90 for spectrograph #2 [from spPlate header]</summary>
	--/ <quantity>stat.value;em.opt.SDSS.i</quantity>
	[sn2_i] [real] NOT NULL,

	--/ <summary>Dereddened (S/N)^2 at g=20.20 for spectrograph #1 [from spPlate header]</summary>
	--/ <quantity>stat.value;em.opt.SDSS.g</quantity>
	[dered_sn1_g] [real] NOT NULL,

	--/ <summary>Dereddened (S/N)^2 at r=20.25 for spectrograph #1 [from spPlate header]</summary>
	--/ <quantity>stat.value;em.opt.SDSS.r</quantity>
	[dered_sn1_r] [real] NOT NULL,

	--/ <summary>Dereddened (S/N)^2 at i=19.90 for spectrograph #1 [from spPlate header]</summary>
	--/ <quantity>stat.value;em.opt.SDSS.i</quantity>
	[dered_sn1_i] [real] NOT NULL,

	--/ <summary>Dereddened (S/N)^2 at g=20.20 for spectrograph #2 [from spPlate header]</summary>
	--/ <quantity>stat.value;em.opt.SDSS.g</quantity>
	[dered_sn2_g] [real] NOT NULL,

	--/ <summary>Dereddened (S/N)^2 at r=20.25 for spectrograph #2 [from spPlate header]</summary>
	--/ <quantity>stat.value;em.opt.SDSS.r</quantity>
	[dered_sn2_r] [real] NOT NULL,

	--/ <summary>Dereddened (S/N)^2 at i=19.90 for spectrograph #2 [from spPlate header]</summary>
	--/ <quantity>stat.value;em.opt.SDSS.i</quantity>
	[dered_sn2_i] [real] NOT NULL,

	--/ <summary>Heliocentric velocity correction [from spPlate header]</summary>
	--/ <quantity>spect.dopplerVeloc;pos.heliocentric</quantity>
	--/ <unit>km s-1</unit>
	[helioRV] [real] NOT NULL,

	--/ <summary>Mean g-band mag difference (spectro - photo) for standards [from spPlate header]</summary>
	--/ <quantity>phot.mag;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[gOffStd] [real] NOT NULL,

	--/ <summary>Standard deviation of g-band mag difference (spectro - photo) for standards [from spPlate header]</summary>
	--/ <quantity>stat.stdev;phot.mag;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[gRMSStd] [real] NOT NULL,

	--/ <summary>Mean r-band mag difference (spectro - photo) for standards [from spPlate header]</summary>
	--/ <quantity>phot.mag;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[rOffStd] [real] NOT NULL,

	--/ <summary>Standard deviation of r-band mag difference (spectro - photo) for standards [from spPlate header]</summary>
	--/ <quantity>stat.stdev;phot.mag;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[rRMSStd] [real] NOT NULL,

	--/ <summary>Mean i-band mag difference (spectro - photo) for standards [from spPlate header]</summary>
	--/ <quantity>phot.mag;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[iOffStd] [real] NOT NULL,

	--/ <summary>Standard deviation of i-band mag difference (spectro - photo) for standards [from spPlate header]</summary>
	--/ <quantity>stat.stdev;phot.mag;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[iRMSStd] [real] NOT NULL,

	--/ <summary>Mean g-band mag difference (spectro - photo) for standards [from spPlate header]</summary>
	--/ <quantity>phot.mag;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[grOffStd] [real] NOT NULL,

	--/ <summary>Standard deviation of g-band mag difference (spectro - photo) for standards [from spPlate header]</summary>
	--/ <quantity>stat.stdev;phot.mag;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[grRMSStd] [real] NOT NULL,

	--/ <summary>Mean r-band mag difference (spectro - photo) for standards [from spPlate header]</summary>
	--/ <quantity>phot.mag;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[riOffStd] [real] NOT NULL,

	--/ <summary>Standard deviation of r-band mag difference (spectro - photo) for standards [from spPlate header]</summary>
	--/ <quantity>stat.stdev;phot.mag;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[riRMSStd] [real] NOT NULL,

	--/ <summary>Mean g-band mag difference (spectro - photo) for galaxies [from spPlate header]</summary>
	--/ <quantity>phot.mag;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[gOffGal] [real] NOT NULL,

	--/ <summary>Standard deviation of g-band mag difference (spectro - photo) for galaxies [from spPlate header]</summary>
	--/ <quantity>stat.stdev;phot.mag;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[gRMSGal] [real] NOT NULL,

	--/ <summary>Mean r-band mag difference (spectro - photo) for galaxies [from spPlate header]</summary>
	--/ <quantity>phot.mag;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[rOffGal] [real] NOT NULL,

	--/ <summary>Standard deviation of r-band mag difference (spectro - photo) for galaxies [from spPlate header]</summary>
	--/ <quantity>stat.stdev;phot.mag;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[rRMSGal] [real] NOT NULL,

	--/ <summary>Mean i-band mag difference (spectro - photo) for galaxies [from spPlate header]</summary>
	--/ <quantity>phot.mag;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[iOffGal] [real] NOT NULL,

	--/ <summary>Standard deviation of i-band mag difference (spectro - photo) for galaxies [from spPlate header]</summary>
	--/ <quantity>stat.stdev;phot.mag;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[iRMSGal] [real] NOT NULL,

	--/ <summary>Mean g-band mag difference (spectro - photo) for galaxies [from spPlate header]</summary>
	--/ <quantity>phot.mag;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[grOffGal] [real] NOT NULL,

	--/ <summary>Standard deviation of g-band mag difference (spectro - photo) for galaxies [from spPlate header]</summary>
	--/ <quantity>stat.stdev;phot.mag;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[grRMSGal] [real] NOT NULL,

	--/ <summary>Mean r-band mag difference (spectro - photo) for galaxies [from spPlate header]</summary>
	--/ <quantity>phot.mag;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[riOffGal] [real] NOT NULL,

	--/ <summary>Standard deviation of r-band mag difference (spectro - photo) for galaxies [from spPlate header]</summary>
	--/ <quantity>stat.stdev;phot.mag;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[riRMSGal] [real] NOT NULL,

	--/ <summary>Number of guider camera frames taken during the exposure [from spPlate header]</summary>
	--/ <quantity>meta.number</quantity>
	[nGuide] [int] NOT NULL,

	--/ <summary>20th-percentile of seeing during exposure (arcsec) [from spPlate header]</summary>
	--/ <quantity>instr.obsty.seeing</quantity>
	[seeing20] [real] NOT NULL,

	--/ <summary>50th-percentile of seeing during exposure (arcsec) [from spPlate header]</summary>
	--/ <quantity>instr.obsty.seeing</quantity>
	[seeing50] [real] NOT NULL,

	--/ <summary>80th-percentile of seeing during exposure (arcsec) [from spPlate header]</summary>
	--/ <quantity>instr.obsty.seeing</quantity>
	[seeing80] [real] NOT NULL,

	--/ <summary>20th-percentile of RMS offset of guide fibers (arcsec) [from spPlate header]</summary>
	--/ <quantity>instr.obsty.seeing</quantity>
	[rmsoff20] [real] NOT NULL,

	--/ <summary>50th-percentile of RMS offset of guide fibers (arcsec) [from spPlate header]</summary>
	--/ <quantity>instr.obsty.seeing</quantity>
	[rmsoff50] [real] NOT NULL,

	--/ <summary>80th-percentile of RMS offset of guide fibers (arcsec) [from spPlate header]</summary>
	--/ <quantity>instr.obsty.seeing</quantity>
	[rmsoff80] [real] NOT NULL,

	--/ <summary>Air temperature in the dome [from spPlate header]</summary>
	--/ <quantity>phys.temperature;instr</quantity>
	--/ <unit>Celsius</unit>
	[airtemp] [real] NOT NULL,

	--/ <summary>Were the SFD dust maps applied to the output spectrum? (0 = no, 1 = yes)</summary>
	--/ <quantity>meta.code</quantity>
	[sfd_used] [tinyint] NOT NULL,

	--/ <summary>sigma of gaussian fit to spatial profile[from spPlate header]</summary>
	--/ <quantity>stat.error;stat.fit</quantity>
	[xSigma] [real] NOT NULL,

	--/ <summary>minimum of xSigma for all exposures [from spPlate header]</summary>
	--/ <quantity>stat.error;stat.min</quantity>
	[xSigMin] [real] NOT NULL,

	--/ <summary>maximum of xSigma for all exposures [from spPlate header]</summary>
	--/ <quantity>stat.error;stat.max</quantity>
	[xSigMax] [real] NOT NULL,

	--/ <summary>sigma of gaussian fit to arc-line profiles in wavelength direction [from spPlate header]</summary>
	--/ <quantity>stat.error;stat.fit</quantity>
	[wSigma] [real] NOT NULL,

	--/ <summary>minimum of wSigma for all exposures [from spPlate header]</summary>
	--/ <quantity>stat.error;stat.min</quantity>
	[wSigMin] [real] NOT NULL,

	--/ <summary>maximum of wSigma for all exposures [from spPlate header]</summary>
	--/ <quantity>stat.error;stat.max</quantity>
	[wSigMax] [real] NOT NULL,

	--/ <summary>[from spPlate header]</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[xChi2] [real] NOT NULL,

	--/ <summary>[from spPlate header]</summary>
	--/ <quantity>stat.fit.chi2;stat.min</quantity>
	[xChi2Min] [real] NOT NULL,

	--/ <summary>[from spPlate header]</summary>
	--/ <quantity>stat.fit.chi2;stat.max</quantity>
	[xChi2Max] [real] NOT NULL,

	--/ <summary>average chi-squared from sky subtraction from all exposures [from spPlate header]</summary>
	--/ <quantity>stat.fit.chi2;stat.mean</quantity>
	[skyChi2] [real] NOT NULL,

	--/ <summary>minimum skyChi2 over all exposures [from spPlate header]</summary>
	--/ <quantity>stat.fit.chi2;stat.min</quantity>
	[skyChi2Min] [real] NOT NULL,

	--/ <summary>maximum skyChi2 over all exposures [from spPlate header]</summary>
	--/ <quantity>stat.fit.chi2;stat.max</quantity>
	[skyChi2Max] [real] NOT NULL,

	--/ <summary>Fraction of pixels that are bad (total) [from spPlate header]</summary>
	--/ <quantity>meta.number;arith.ratio;instr.pixel</quantity>
	[fBadPix] [real] NOT NULL,

	--/ <summary>Fraction of pixels that are bad (spectrograph #1) [from spPlate header]</summary>
	--/ <quantity>meta.number;arith.ratio;instr.pixel</quantity>
	[fBadPix1] [real] NOT NULL,

	--/ <summary>Fraction of pixels that are bad (spectrograph #2) [from spPlate header]</summary>
	--/ <quantity>meta.number;arith.ratio;instr.pixel</quantity>
	[fBadPix2] [real] NOT NULL,

	--/ <summary>Status of 2D extraction</summary>
	--/ <quantity>meta.code.status</quantity>
	[status2d] [varchar](32) NOT NULL,

	--/ <summary>Status of combination of multiple MJDs</summary>
	--/ <quantity>meta.code.status</quantity>
	[statuscombine] [varchar](32) NOT NULL,

	--/ <summary>Status of 1D reductions</summary>
	--/ <quantity>meta.code.status</quantity>
	[status1d] [varchar](32) NOT NULL,

	--/ <summary>Number of objects total [calculated from spZbest file]</summary>
	--/ <quantity>meta.code.status</quantity>
	[nTotal] [int] NOT NULL,

	--/ <summary>Number of objects classified as galaxy [calculated from spZbest file]</summary>
	--/ <quantity>meta.number</quantity>
	[nGalaxy] [int] NOT NULL,

	--/ <summary>Number of objects classified as QSO [calculated from spZbest file]</summary>
	--/ <quantity>meta.number</quantity>
	[nQSO] [int] NOT NULL,

	--/ <summary>Number of objects classified as Star [calculated from spZbest file]</summary>
	--/ <quantity>meta.number</quantity>
	[nStar] [int] NOT NULL,

	--/ <summary>Number of sky objects  [calculated from spZbest file]</summary>
	--/ <quantity>meta.number</quantity>
	[nSky] [int] NOT NULL,

	--/ <summary>Number of objects with zWarning set non-zero (such objects still classified as star, galaxy or QSO) [calculated from spZbest file]</summary>
	--/ <quantity>meta.number</quantity>
	[nUnknown] [int] NOT NULL,

	--/ <summary>is this plateX entry the best observation of the plate</summary>
	--/ <quantity>meta.code</quantity>
	[isBest] [tinyint] NOT NULL,

	--/ <summary>is this plateX entry both good and the best observation of the plate</summary>
	--/ <quantity>meta.code</quantity>
	[isPrimary] [tinyint] NOT NULL,

	--/ <summary>is this plate the best representative  of its tile (only set for "legacy" program plates)</summary>
	--/ <quantity>meta.code</quantity>
	[isTile] [tinyint] NOT NULL,

	--/ <summary>hour angle of design [from plPlugMapM file]</summary>
	--/ <quantity>pos.eq.ha</quantity>
	--/ <unit>deg</unit>
	[ha] [real] NOT NULL,

	--/ <summary>MJD designed for [from plPlugMapM file]</summary>
	--/ <quantity>time.epoch</quantity>
	[mjdDesign] [int] NOT NULL,

	--/ <summary>cartridge position angle [from plPlugMapM file]</summary>
	--/ <quantity>pos.posAng</quantity>
	[theta] [real] NOT NULL,

	--/ <summary>version of fiber scanning software [from plPlugMapM file]</summary>
	--/ <quantity>meta.version</quantity>
	[fscanVersion] [varchar](32) NOT NULL,

	--/ <summary>version of fiber mapping software [from plPlugMapM file]</summary>
	--/ <quantity>meta.version</quantity>
	[fmapVersion] [varchar](32) NOT NULL,

	--/ <summary>'slow', 'fast', or 'extreme' [from plPlugMapM file]</summary>
	--/ <quantity>meta.note</quantity>
	[fscanMode] [varchar](32) NOT NULL,

	--/ <summary>speed of scan [from plPlugMapM file]</summary>
	--/ <quantity>obs.param</quantity>
	[fscanSpeed] [int] NOT NULL,

	--/ <summary>20 deep Hierarchical Triangular Mesh ID</summary>
	--/ <quantity>pos.eq.HTM</quantity>
	[htmID] [bigint] NOT NULL,

	--/ <summary>Zone ID</summary>
	--/ <quantity>pos.eq.zone</quantity>
	[zoneID] [bigint] NOT NULL,

	--/ <summary>Load Version</summary>
	--/ <quantity>meta.version</quantity>
	[loadVersion] [int] NOT NULL,
 CONSTRAINT [pk_PlateX_plateID] PRIMARY KEY CLUSTERED 
(
	[plateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[ProperMotions]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--/ <summary> Proper motions combining SDSS and recalibrated USNO-B astrometry. </summary>
--/ <remarks> These results are based on the technique described in  Munn et al. 2004, AJ, 127, 3034 </remarks>
CREATE TABLE [dbo].[ProperMotions](

	--/ <summary>Distance between this object and the nearest matching USNO-B object.</summary>
	--/ <quantity>pos.angDistance</quantity>
	--/ <unit>arcsec</unit>
	[delta] [real] NOT NULL,

	--/ <summary>Number of objects in USNO-B which matched this object within a 1 arcsec radius.  If negative, then the nearest matching USNO-B object itself matched more than 1 SDSS object.</summary>
	--/ <quantity>meta.number</quantity>
	[match] [int] NOT NULL,

	--/ <summary>Proper motion in galactic longitude.</summary>
	--/ <quantity>pos.pm;pos.galactic.lon</quantity>
	--/ <unit>mas year-1</unit>
	[pmL] [real] NOT NULL,

	--/ <summary>Proper motion in galactic latitude.</summary>
	--/ <quantity>pos.pm;pos.galactic.lat</quantity>
	--/ <unit>mas year-1</unit>
	[pmB] [real] NOT NULL,

	--/ <summary>Proper motion in right ascension.</summary>
	--/ <quantity>pos.pm;pos.eq.ra</quantity>
	--/ <unit>mas year-1</unit>
	[pmRa] [real] NOT NULL,

	--/ <summary>Proper motion in declination.</summary>
	--/ <quantity>pos.pm;pos.eq.dec</quantity>
	--/ <unit>mas year-1</unit>
	[pmDec] [real] NOT NULL,

	--/ <summary>Error in proper motion in right ascension.</summary>
	--/ <quantity>stat.error;pos.pm;pos.eq.ra</quantity>
	--/ <unit>mas year-1</unit>
	[pmRaErr] [real] NOT NULL,

	--/ <summary>Error in proper motion in declination.</summary>
	--/ <quantity>stat.error;pos.pm;pos.eq.dec</quantity>
	--/ <unit>mas year-1</unit>
	[pmDecErr] [real] NOT NULL,

	--/ <summary>RMS residual for the proper motion fit in r.a.</summary>
	--/ <quantity>stat.fit.residual</quantity>
	--/ <unit>mas</unit>
	[sigRa] [real] NOT NULL,

	--/ <summary>RMS residual for the proper motion fit in dec.</summary>
	--/ <quantity>stat.error;stat.fit.residual</quantity>
	--/ <unit>mas</unit>
	[sigDec] [real] NOT NULL,

	--/ <summary>Number of detections used in the fit including the SDSS detection (thus, the number of plates the object was detected on in USNO-B plus one).</summary>
	--/ <quantity>meta.nubmer</quantity>
	[nFit] [int] NOT NULL,

	--/ <summary>Recalibrated USNO-B O magnitude,  recalibrated to SDSS g</summary>
	--/ <quantity>phot.mag</quantity>
	--/ <unit>mag</unit>
	[O] [real] NOT NULL,

	--/ <summary>Recalibrated USNO-B E magnitude,  recalibrated to SDSS r</summary>
	--/ <quantity>phot.mag</quantity>
	--/ <unit>mag</unit>
	[E] [real] NOT NULL,

	--/ <summary>Recalibrated USNO-B J magnitude,  recalibrated to SDSS g</summary>
	--/ <quantity>phot.mag</quantity>
	--/ <unit>mag</unit>
	[J] [real] NOT NULL,

	--/ <summary>Recalibrated USNO-B F magnitude,  recalibrated to SDSS r</summary>
	--/ <quantity>phot.mag</quantity>
	--/ <unit>mag</unit>
	[F] [real] NOT NULL,

	--/ <summary>Recalibrated USNO-B N magnitude,  recalibrated to SDSS i</summary>
	--/ <quantity>phot.mag</quantity>
	--/ <unit>mag</unit>
	[N] [real] NOT NULL,

	--/ <summary>Distance to the nearest neighbor with g &lt; 20</summary>
	--/ <quantity>pos.angDistance</quantity>
	--/ <unit>arcsec</unit>
	[dist20] [real] NOT NULL,

	--/ <summary>Distance to the nearest neighbor with g &lt; 22</summary>
	--/ <quantity>pos.angDistance</quantity>
	--/ <unit>arcsec</unit>
	[dist22] [real] NOT NULL,

	--/ <summary>unique id, points to photoObj</summary>
	--/ <quantity>meta.id</quantity>
	[objid] [bigint] NOT NULL,
 CONSTRAINT [pk_ProperMotions_objID] PRIMARY KEY CLUSTERED 
(
	[objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Region]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

--/ <summary> Definition of the different regions </summary>
--/ <remarks> We have various boundaries in the survey, represented  by equations of 3D planes, intersecting the unit sphere,  describing great and small circles, respectively. This  table stores the description of a region, the details  are in the HalfSpace table.  &lt;ul>  &lt;li>CHUNK - the boundary of a given Chunk  &lt;li>STRIPE - the boundary of the whole stripe  &lt;li>STAVE - the unique boundary of the whole stripe,  agrees with STRIPE for Southern stripes  &lt;li>PRIMARY - the primary region of a given CHUNK  &lt;li>SEGMENT - the idealized boundary of a segment  &lt;li>CAMCOL - the real boundary of a segment  &lt;li>PLATE - the boundary of a plate  &lt;li>TILE - the boundary of a circular tile  &lt;li>TIGEOM - the boundary of a Tiling Run, also includes	  inverse regions, which must be excluded  &lt;li>RUN - the union of the CAMCOLs making up a Run  &lt;li>WEDGE -- intersection of tiles as booleans.  &lt;li>TILEBOX -- intersection of TIGEOM respecting masks (these are positive convex TIGEOM)  &lt;li>SKYBOX  -- intersection and union of TILEBOX to cover the sky with positive disjoin convex regions.	&lt;li>SECTORLETS -- intersection of Skyboxes with wedges.  These are the areas that have targets.  &lt;li>SECTORS -- collects together all the sectorlets with the same covering (and excluded) tiles.   &lt;br> See also the RegionConvex and Halfspace tables  </remarks>
CREATE TABLE [dbo].[Region](

	--/ <summary></summary>
	--/ <quantity>meta.id</quantity>
	[regionid] [bigint] NOT NULL,

	--/ <summary>key of the region pointing into other tables</summary>
	--/ <quantity>meta.id</quantity>
	[id] [bigint] NOT NULL,

	--/ <summary>type of the region (STRIPE|STAVE|...)</summary>
	--/ <quantity>meta.note</quantity>
	[type] [varchar](16) NOT NULL,

	--/ <summary>description of the region</summary>
	--/ <quantity>meta.note</quantity>
	[comment] [varchar](1024) NOT NULL,
	--/ <summary>0: region, 1: to be excluded</summary>
	--/ <quantity>meta.code</quantity>
	[ismask] [tinyint] NOT NULL DEFAULT ((0)),

	--/ <summary>area of region</summary>
	--/ <quantity>phys.angSize.area</quantity>
	--/ <unit>deg+2</unit>
	[area] [float] NOT NULL DEFAULT ((0)),

	--/ <summary>the string representation of the region</summary>
	--/ <quantity>meta.note</quantity>
	[regionString] [varchar](max) NULL DEFAULT (''),

	--/ <summary>the precompiled XML description of region</summary>
	--/ <quantity>meta.file</quantity>
	[regionBinary] [varbinary](max) NULL DEFAULT (0x00),
 CONSTRAINT [pk_Region_regionId] PRIMARY KEY CLUSTERED 
(
	[regionid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Region2Box]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

--/ <summary> Tracks the parentage which regions contribute to which boxes </summary>
--/ <remarks> For the sector computation, Region2Box tracks the parentage  of which regions contribute to which boxs.  TileRegions contribute to TileBoxes  TileRegions and TileBoxes contribute to SkyBoxes  Wedges and SkyBoxes contribute to Sectorlets  Sectorlets contribute to Sectors </remarks>
CREATE TABLE [dbo].[Region2Box](

	--/ <summary>type of parent, (TIGEOM)</summary>
	--/ <quantity>meta.note</quantity>
	[regionType] [varchar](16) NOT NULL,

	--/ <summary>the object id of the other parent region</summary>
	--/ <quantity>meta.id</quantity>
	[id] [bigint] NOT NULL,

	--/ <summary>type of child (TILEBOX, SKYBOX)</summary>
	--/ <quantity>meta.note</quantity>
	[boxType] [varchar](16) NOT NULL,

	--/ <summary>regionid of child</summary>
	--/ <quantity>meta.id</quantity>
	[boxid] [bigint] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[RegionArcs]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--/ <summary> Contains the arcs of a Region with their endpoints </summary>
--/ <remarks> An arc has two endpoints, specified via their equatorial  coordinates, and the equation of the circle (x,y,z,c) of  the arc. The arc is directed, the first point is the  beginning, the second is the end. The arc belongs to a   Region, a Convex and a patch. A patch is a contigous area   of the sky. Within a patch the consecutive arcids represent   a counterclockwise ordering of the vertices. </remarks>
CREATE TABLE [dbo].[RegionArcs](

	--/ <summary>unique id of the arc</summary>
	--/ <quantity>meta.id</quantity>
	[arcid] [int] NOT NULL,

	--/ <summary>unique region identifier</summary>
	--/ <quantity>meta.id</quantity>
	[regionid] [bigint] NOT NULL,

	--/ <summary>convex identifier</summary>
	--/ <quantity>meta.id</quantity>
	[convexid] [bigint] NOT NULL,

	--/ <summary>id of the constraint</summary>
	--/ <quantity>meta.id</quantity>
	[constraintid] [bigint] NOT NULL,

	--/ <summary>id of the patch</summary>
	--/ <quantity>meta.id</quantity>
	[patch] [int] NOT NULL,

	--/ <summary>state (3: bounding circle, 2:root, 1: hole)</summary>
	--/ <quantity>meta.code.status</quantity>
	[state] [int] NOT NULL,

	--/ <summary>0:hide, 1: draw</summary>
	--/ <quantity>meta.code.status</quantity>
	[draw] [int] NOT NULL,

	--/ <summary>ra of starting point of arc</summary>
	--/ <quantity>pos.eq.ra</quantity>
	[ra1] [float] NOT NULL,

	--/ <summary>dec of starting point of arc</summary>
	--/ <quantity>pos.eq.dec</quantity>
	[dec1] [float] NOT NULL,

	--/ <summary>ra of end point of arc</summary>
	--/ <quantity>pos.eq.ra</quantity>
	[ra2] [float] NOT NULL,

	--/ <summary>dec of end point of arc</summary>
	--/ <quantity>pos.eq.dec</quantity>
	[dec2] [float] NOT NULL,

	--/ <summary>x of constraint normal vector</summary>
	--/ <quantity>pos.cartesian.x</quantity>
	[x] [float] NOT NULL,

	--/ <summary>y of constraint normal vector</summary>
	--/ <quantity>pos.cartesian.y</quantity>
	[y] [float] NOT NULL,

	--/ <summary>z of constraint normal vector</summary>
	--/ <quantity>pos.cartesian.z</quantity>
	[z] [float] NOT NULL,

	--/ <summary>offset of constraint</summary>
	--/ <quantity></quantity>
	[c] [float] NOT NULL,

	--/ <summary>length of arc in degrees</summary>
	--/ <quantity>phys.angSize</quantity>
	--/ <unit>deg</unit>
	[length] [float] NOT NULL DEFAULT ((0.0)),
 CONSTRAINT [pk_RegionArcs_regionId_convexid_] PRIMARY KEY CLUSTERED 
(
	[regionid] ASC,
	[convexid] ASC,
	[arcid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RegionPatch]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

--/ <summary> Defines the attributes of the patches of a given region </summary>
--/ <remarks> Regions are the union of convex hulls and are defined in the Region table.  Convexes are the intersection of halfspaces defined by the HalfSpace table.   Each convex is then broken up into a set of Patches, with their own  bounding circle.  See also the Region table </remarks>
CREATE TABLE [dbo].[RegionPatch](

	--/ <summary>Unique Region ID</summary>
	--/ <quantity>meta.id</quantity>
	[regionid] [bigint] NOT NULL,

	--/ <summary>Unique Convex ID</summary>
	--/ <quantity>meta.id</quantity>
	[convexid] [bigint] NOT NULL,

	--/ <summary>Unique patch number</summary>
	--/ <quantity>meta.id</quantity>
	[patchid] [int] NOT NULL,

	--/ <summary>CAMCOL, RUN, STAVE, TILE, TILEBOX, SKYBOX, WEDGE, SECTOR...</summary>
	--/ <quantity>meta.note</quantity>
	[type] [varchar](16) NOT NULL,

	--/ <summary>radius of bounding circle centered at ra, dec</summary>
	--/ <quantity>phys.angSize</quantity>
	--/ <unit>arcmin</unit>
	[radius] [float] NOT NULL DEFAULT ((0)),

	--/ <summary>right ascension of observation</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[ra] [float] NOT NULL DEFAULT ((0)),

	--/ <summary>declination of observation</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[dec] [float] NOT NULL DEFAULT ((0)),

	--/ <summary>x of centerpoint Normal unit vector in J2000</summary>
	--/ <quantity>pos.eq.x;pos.frame=j2000</quantity>
	[x] [float] NOT NULL DEFAULT ((0)),

	--/ <summary>y of centerpoint Normal unit vector in J2000</summary>
	--/ <quantity>pos.eq.y;pos.frame=j2000</quantity>
	[y] [float] NOT NULL DEFAULT ((0)),

	--/ <summary>z of centerpoint Normal unit vector in J2000</summary>
	--/ <quantity>pos.eq.z;pos.frame=j2000</quantity>
	[z] [float] NOT NULL DEFAULT ((0)),

	--/ <summary>offset of the equation of plane</summary>
	--/ <quantity></quantity>
	[c] [float] NOT NULL DEFAULT ((0)),

	--/ <summary>20 deep Hierarchical Triangular Mesh ID of centerpoint</summary>
	--/ <quantity>pos.eq.HTM</quantity>
	[htmid] [bigint] NOT NULL DEFAULT ((0)),

	--/ <summary>20 deep Hierarchical Triangular Mesh ID of centerpoint</summary>
	--/ <quantity>pos.eq.zone</quantity>
	[zoneid] [bigint] NOT NULL DEFAULT ((0)),

	--/ <summary>area of the patch</summary>
	--/ <quantity>phys.angSize.area</quantity>
	--/ <unit>deg+2</unit>
	[area] [float] NOT NULL DEFAULT ((0)),

	--/ <summary>{x,y,z,c}+ representation of the convex of the patch</summary>
	--/ <quantity>meta.note</quantity>
	[convexString] [varchar](max) NULL DEFAULT (''),
 CONSTRAINT [pk_RegionPatch_regionid_convexid] PRIMARY KEY CLUSTERED 
(
	[regionid] ASC,
	[convexid] ASC,
	[patchid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[RegionTypes]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

--/ <summary></summary>
--/ <remarks></remarks>
CREATE TABLE [dbo].[RegionTypes](

	--/ <summary></summary>
	--/ <quantity>meta.note</quantity>
	[type] [varchar](16) NOT NULL,
	
	--/ <summary></summary>
	--/ <quantity>phys.angSize</quantity>
	[radius] [float] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Rmatrix]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

--/ <summary> Contains various rotation matrices between spherical coordinate systems </summary>
--/ <remarks>   The mode field is a 3-letter code indicating the transformation:  &lt;ul>&lt;li>	  S2J - Survey-to-J2000   &lt;/li>	  &lt;li>	  G2J - Galactic-to-J2000 &lt;/li>	  &lt;li>	  J2G - J2000-to-Galactic &lt;/li>	  &lt;li>	  J2S - J2000-to-Survey   &lt;/li>  &lt;/ul> </remarks>
CREATE TABLE [dbo].[Rmatrix](

	[mode] [varchar](16) NOT NULL,

	[row] [smallint] NOT NULL,

	[x] [float] NOT NULL,

	[y] [float] NOT NULL,

	[z] [float] NOT NULL,
 CONSTRAINT [pk_RMatrix_mode_row] PRIMARY KEY CLUSTERED 
(
	[mode] ASC,
	[row] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Run]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

--/ <summary> Contains the basic parameters associated with a run </summary>
--/ <remarks> A run corresponds to a single drift scan.  </remarks>
CREATE TABLE [dbo].[Run](

	--/ <summary>0 = OPDB target, 1 = OPDB best XXX</summary>
	--/ <quantity>meta.version</quantity>
	[skyVersion] [tinyint] NOT NULL,

	--/ <summary>Run number</summary>
	--/ <quantity>meta.id</quantity>
	[run] [smallint] NOT NULL,

	--/ <summary>Rerun number</summary>
	--/ <quantity>meta.id</quantity>
	[rerun] [smallint] NOT NULL,

	--/ <summary>MJD of observation</summary>
	--/ <quantity>time.epoch</quantity>
	--/ <unit>d</unit>
	[mjd] [int] NOT NULL,

	--/ <summary>Human-readable date of observation</summary>
	--/ <quantity>time.epoch</quantity>
	[datestring] [varchar](32) NOT NULL,

	--/ <summary>Stripe number</summary>
	--/ <quantity>meta.id</quantity>
	[stripe] [int] NOT NULL,

	--/ <summary>Strip (N or S)</summary>
	--/ <quantity>meta.code</quantity>
	[strip] [varchar](32) NOT NULL,

	--/ <summary>boresight offset perpendicular to great circle</summary>
	--/ <quantity>pos.angDistance</quantity>
	--/ <unit>deg</unit>
	[xBore] [float] NOT NULL,

	--/ <summary>Starting field number of full run (what MU_REF, MJD_REF refer to)</summary>
	--/ <quantity>meta.id</quantity>
	[fieldRef] [int] NOT NULL,

	--/ <summary>last field of full run</summary>
	--/ <quantity>meta.id</quantity>
	[lastField] [int] NOT NULL,

	--/ <summary>type of drift scan (from apacheraw, bias, calibration, engineering, ignore, and science)</summary>
	--/ <quantity>meta.note</quantity>
	[flavor] [varchar](32) NOT NULL,

	--/ <summary>binning amount perpendicular to scan direction</summary>
	--/ <quantity>meta.number</quantity>
	--/ <unit>pix</unit>
	[xBin] [int] NOT NULL,

	--/ <summary>binning amount in scan direction</summary>
	--/ <quantity>meta.number</quantity>
	--/ <unit>pix</unit>
	[yBin] [int] NOT NULL,

	--/ <summary>number of rows in output idR</summary>
	--/ <quantity>meta.number</quantity>
	--/ <unit>pix</unit>
	[nRow] [int] NOT NULL,

	--/ <summary>MJD at row 0 of reference frame</summary>
	--/ <quantity>time.epoch</quantity>
	--/ <unit>days</unit>
	[mjdRef] [float] NOT NULL,

	--/ <summary>mu value at row 0 of reference field</summary>
	--/ <quantity>obs.param</quantity>
	--/ <unit>deg</unit>
	[muRef] [float] NOT NULL,

	--/ <summary>linestart rate betweeen each (binned) row</summary>
	--/ <quantity>arith.rate</quantity>
	--/ <unit>microsec</unit>
	[lineStart] [int] NOT NULL,

	--/ <summary>tracking rate</summary>
	--/ <quantity>arith.rate</quantity>
	--/ <unit>arcsec s-1</unit>
	[tracking] [float] NOT NULL,

	--/ <summary>node of great circle, that is, its RA on the J2000 equator</summary>
	--/ <quantity>src.orbital.node</quantity>
	[node] [float] NOT NULL,

	--/ <summary>inclination of great circle relative to J2000 equator</summary>
	--/ <quantity>src.orbital.inclination</quantity>
	[incl] [float] NOT NULL,

	--/ <summary>comments on the run</summary>
	--/ <quantity>meta.note</quantity>
	[comments] [varchar](128) NOT NULL,

	--/ <summary>quadratic term in coarse astrometric solution</summary>
	--/ <quantity></quantity>
	--/ <unit>arcsec h-2</unit>
	[qterm] [real] NOT NULL,

	--/ <summary>maximum residual from great circle in scan direction</summary>
	--/ <quantity>stat.fit.residual;stat.max</quantity>
	--/ <unit>arcsec</unit>
	[maxMuResid] [real] NOT NULL,

	--/ <summary>maximum residual from great circle perpendicular to scan direction</summary>
	--/ <quantity>stat.fit.residual;stat.max</quantity>
	--/ <unit>arcsec</unit>
	[maxNuResid] [real] NOT NULL,

	--/ <summary>starting field for reduced data</summary>
	--/ <quantity>meta.id</quantity>
	[startField] [int] NOT NULL,

	--/ <summary>ending field for reduced data</summary>
	--/ <quantity>meta.id</quantity>
	[endField] [int] NOT NULL,

	--/ <summary>photo version used</summary>
	--/ <quantity>meta.version</quantity>
	[photoVersion] [varchar](32) NOT NULL,

	--/ <summary>dervish version used</summary>
	--/ <quantity>meta.version</quantity>
	[dervishVersion] [varchar](32) NOT NULL,

	--/ <summary>astrom version used</summary>
	--/ <quantity>meta.version</quantity>
	[astromVersion] [varchar](32) NOT NULL,

	--/ <summary>version of SAS used to produce CSV for this run</summary>
	--/ <quantity>meta.version</quantity>
	[sasVersion] [varchar](32) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[RunShift]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--/ <summary> The table contains values of the various manual nu shifts for runs </summary>
--/ <remarks> In the early runs the telescope was sometimes not tracking  correctly. The boundaries of some of the runs had thus to be shifted  by a small amount, determined by hand. This table contains  these manual corrections. These should be applied to the  nu values derived for these runs. Only those runs are here,  for which such a correction needs to be applied. </remarks>
CREATE TABLE [dbo].[RunShift](

	--/ <summary>Run id</summary>
	--/ <quantity>meta.id</quantity>
	[run] [int] NOT NULL,

	--/ <summary>The nu shift applied</summary>
	--/ <quantity>obs.param</quantity>
	--/ <unit>deg</unit>
	[shift] [float] NOT NULL,
 CONSTRAINT [pk_RunShift_run] PRIMARY KEY CLUSTERED 
(
	[run] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sdssBestTarget2Sector]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--/ <summary> Map PhotoObj which are potential targets to sectors  </summary>
--/ <remarks> PhotoObj should only appear once in this list because any ra,dec  should belong to a unique sector </remarks>
CREATE TABLE [dbo].[sdssBestTarget2Sector](

	--/ <summary>ID of the best PhotoObj</summary>
	--/ <quantity>meta.id</quantity>
	[objID] [bigint] NOT NULL,

	--/ <summary>ID of the sector</summary>
	--/ <quantity>meta.id</quantity>
	[regionID] [bigint] NOT NULL,

	--/ <summary>Status of the object in the survey</summary>
	--/ <quantity>meta.code.status</quantity>
	[status] [int] NOT NULL,

	--/ <summary>Bit mask of primary target categories the object was selected in.</summary>
	--/ <quantity>meta.code</quantity>
	[primTarget] [int] NOT NULL,

	--/ <summary>Bit mask of secondary target categories the object was selected in.</summary>
	--/ <quantity>meta.code</quantity>
	[secTarget] [int] NOT NULL,

	--/ <summary>Petrosian flux</summary>
	--/ <quantity>phot.mag.petrosian;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[petroMag_r] [real] NOT NULL,

	--/ <summary>Extinction in each filter</summary>
	--/ <quantity>phys.absorption.gal;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[extinction_r] [real] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SDSSConstants]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

--/ <summary> This table contains most relevant survey constants and their physical units </summary>
--/ <remarks></remarks>
CREATE TABLE [dbo].[SDSSConstants](

	--/ <summary>Name of the constant</summary>
	--/ <quantity>meta.id</quantity>
	[name] [varchar](32) NOT NULL,

	--/ <summary>The numerical value in float</summary>
	--/ <quantity>meta.code</quantity>
	[value] [float] NOT NULL,

	--/ <summary>Its physical unit</summary>
	--/ <quantity>meta.unit</quantity>
	[unit] [varchar](32) NOT NULL,

	--/ <summary>Short description</summary>
	--/ <quantity>meta.note</quantity>
	[description] [varchar](2000) NOT NULL,
 CONSTRAINT [pk_SDSSConstants_name] PRIMARY KEY CLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[sdssImagingHalfSpaces]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--/ <summary> Half-spaces (caps) describing the SDSS imaging geometry </summary>
--/ <remarks> Each row in this table corresponds to a single polygon  in the SDSS imaging data window function. </remarks>
CREATE TABLE [dbo].[sdssImagingHalfSpaces](

	--/ <summary>integer description of polygon</summary>
	--/ <quantity>meta.id</quantity>
	[sdssPolygonID] [int] NOT NULL,

	--/ <summary>x-component of normal vector</summary>
	--/ <quantity>pos.cartesian.x</quantity>
	[x] [float] NOT NULL,

	--/ <summary>y-component of normal vector</summary>
	--/ <quantity>pos.cartesian.y</quantity>
	[y] [float] NOT NULL,

	--/ <summary>z-component of normal vector</summary>
	--/ <quantity>pos.cartesian.z</quantity>
	[z] [float] NOT NULL,

	--/ <summary>offset from center along normal</summary>
	--/ <quantity>pos.angDistance</quantity>
	[c] [float] NOT NULL,

	--/ <summary>mangle version of x-component</summary>
	--/ <quantity>pos.cartesian.x</quantity>
	[xMangle] [float] NOT NULL,

	--/ <summary>mangle version of y-component</summary>
	--/ <quantity>pos.cartesian.y</quantity>
	[yMangle] [float] NOT NULL,

	--/ <summary>mangle version of z-component</summary>
	--/ <quantity>pos.cartesian.z</quantity>
	[zMangle] [float] NOT NULL,

	--/ <summary>mangle version of offset from center</summary>
	--/ <quantity>pos.angDistance</quantity>
	[cMangle] [float] NOT NULL,

	--/ <summary>Load Version</summary>
	--/ <quantity>meta.version</quantity>
	[loadVersion] [int] NOT NULL,
 CONSTRAINT [pk_sdssImagingHalfspaces_sdssPol] PRIMARY KEY CLUSTERED 
(
	[sdssPolygonID] ASC,
	[x] ASC,
	[y] ASC,
	[z] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sdssPolygon2Field]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--/ <summary> Matched list of polygons and fields </summary>
--/ <remarks> Each row in this table corresponds to  </remarks>
CREATE TABLE [dbo].[sdssPolygon2Field](

	--/ <summary>integer designator of polygon</summary>
	--/ <quantity>meta.id</quantity>
	[sdssPolygonID] [int] NOT NULL,

	--/ <summary>field identification</summary>
	--/ <quantity>meta.id;obs.field</quantity>
	[fieldID] [bigint] NOT NULL,

	--/ <summary>Load Version</summary>
	--/ <quantity>meta.version</quantity>
	[loadVersion] [int] NOT NULL,
 CONSTRAINT [pk_sdssPolygon2Field_sdssPolygon] PRIMARY KEY CLUSTERED 
(
	[sdssPolygonID] ASC,
	[fieldID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sdssPolygons]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--/ <summary> Polygons describing SDSS imaging data window function </summary>
--/ <remarks> Each row in this table corresponds to a single polygon  in the SDSS imaging data window function. </remarks>
CREATE TABLE [dbo].[sdssPolygons](

	--/ <summary>integer description of polygon</summary>
	--/ <quantity>meta.id</quantity>
	[sdssPolygonID] [int] NOT NULL,

	--/ <summary>number of fields in the polygon</summary>
	--/ <quantity>meta.id;obs.field</quantity>
	[nField] [int] NOT NULL,

	--/ <summary>ID of primary field in this polygon</summary>
	--/ <quantity>meta.id;obs.field</quantity>
	[primaryFieldID] [bigint] NOT NULL,

	--/ <summary>RA (J2000 deg) in approximate center of polygon</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[ra] [float] NOT NULL,

	--/ <summary>Dec (J2000 deg) in approximate center of polygon</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[dec] [float] NOT NULL,

	--/ <summary>area of polygon</summary>
	--/ <quantity>phys.angSize.area</quantity>
	--/ <unit>deg+2</unit>
	[area] [float] NOT NULL,

	--/ <summary>Load Version</summary>
	--/ <quantity>meta.version</quantity>
	[loadVersion] [int] NOT NULL,
 CONSTRAINT [pk_sdssPolygons_sdssPolygonID] PRIMARY KEY CLUSTERED 
(
	[sdssPolygonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sdssSector]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

--/ <summary> Stores the information about set of unique Sector regions </summary>
--/ <remarks> A Sector is defined as a distinct intersection of tiles and  TilingGeometries, characterized by a unique combination of  intersecting tiles and a list of tilingVersions. The sampling  rate for any targets is unambgously defined by the number of  tiles involved (nTiles) and the combination of targetVersion. </remarks>
CREATE TABLE [dbo].[sdssSector](

	--/ <summary>unique, sequential ID</summary>
	--/ <quantity>meta.id</quantity>
	[regionID] [bigint] NOT NULL,

	--/ <summary>number of overlapping tiles</summary>
	--/ <quantity>meta.number</quantity>
	[nTiles] [int] NOT NULL,

	--/ <summary>list of tiles in Sector</summary>
	--/ <quantity>meta.note</quantity>
	[tiles] [varchar](256) NOT NULL,

	--/ <summary>the version of target selection ran over the sector -/K ID_VERSION</summary>
	--/ <quantity>meta.version</quantity>
	[targetVersion] [varchar](64) NOT NULL,

	--/ <summary>area of this overlap region</summary>
	--/ <quantity>phys.angSize.area</quantity>
	--/ <unit>deg+2</unit>
	[area] [real] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[sdssSector2Tile]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

--/ <summary> Match tiles to sectors, wedges adn sectorlets, and vice versa. </summary>
--/ <remarks> This table is designed to be queried in either direction - one can get  all the tiles associated with a sector, or one can find all the sectors  to which a tile belongs. </remarks>
CREATE TABLE [dbo].[sdssSector2Tile](

	--/ <summary>ID of the sector</summary>
	--/ <quantity>meta.id</quantity>
	[regionID] [bigint] NOT NULL,

	--/ <summary>type of the sector</summary>
	--/ <quantity>meta.note</quantity>
	[type] [varchar](16) NOT NULL,

	--/ <summary>tile number</summary>
	--/ <quantity>meta.id</quantity>
	[tile] [smallint] NOT NULL,

	--/ <summary>flag that shows sign of tile (1 is negative)</summary>
	--/ <quantity>meta.code</quantity>
	[isMask] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[sdssTargetParam]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

--/ <summary> Contains the parameters used for a version of the target selection code </summary>
--/ <remarks> </remarks>
CREATE TABLE [dbo].[sdssTargetParam](

	--/ <summary>version of target selection software</summary>
	--/ <quantity>meta.version</quantity>
	[targetVersion] [varchar](32) NOT NULL,

	--/ <summary>version of target selection software</summary>
	--/ <quantity>meta.version</quantity>
	[paramFile] [varchar](32) NOT NULL,

	--/ <summary>parameter name</summary>
	--/ <quantity>meta.id</quantity>
	[name] [varchar](32) NOT NULL,

	--/ <summary>value used for the parameter</summary>
	--/ <quantity>meta.note</quantity>
	[value] [varchar](512) NOT NULL,
 CONSTRAINT [pk_sdssTargetParam_targetVersion] PRIMARY KEY CLUSTERED 
(
	[targetVersion] ASC,
	[paramFile] ASC,
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[sdssTileAll]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--/ <summary> Contains information about each individual tile on the sky. </summary>
--/ <remarks> Each 'tile' corresponds to an SDSS-I or -II spectroscopic observation.  The tile covers a region of the 1.49 deg in radius, and corresponds to  one or more observed plates.  At the time the tile was created, all of   the 'tiled target' categories (galaxies, quasars, and some very special  categories of star) were assigned fibers; later other targets were   assigned fibers on the plate. </remarks>
CREATE TABLE [dbo].[sdssTileAll](

	--/ <summary>(unique) tile number</summary>
	--/ <quantity>meta.id</quantity>
	[tile] [smallint] NOT NULL,

	--/ <summary>run of the tiling software</summary>
	--/ <quantity>meta.id</quantity>
	[tileRun] [smallint] NOT NULL,

	--/ <summary>right ascension of tile center</summary>
	--/ <quantity>pos.eq.ra</quantity>
	--/ <unit>deg</unit>
	[raCen] [float] NOT NULL,

	--/ <summary>declination of the tile center</summary>
	--/ <quantity>pos.eq.dec</quantity>
	--/ <unit>deg</unit>
	[decCen] [float] NOT NULL,

	--/ <summary>htm tree info</summary>
	--/ <quantity>pos.eq.HTM</quantity>
	[htmID] [bigint] NOT NULL,

	--/ <summary>zone ID</summary>
	--/ <quantity>pos.eq.zone</quantity>
	[zoneID] [bigint] NOT NULL,

	--/ <summary>x projection of vector on unit sphere</summary>
	--/ <quantity>pos.eq.x</quantity>
	[cx] [float] NOT NULL,

	--/ <summary>y projection of vector on unit sphere</summary>
	--/ <quantity>pos.eq.y</quantity>
	[cy] [float] NOT NULL,

	--/ <summary>z projection of vector on unit sphere</summary>
	--/ <quantity>pos.eq.z</quantity>
	[cz] [float] NOT NULL,

	--/ <summary>1: this tile later "untiled," releasing targets to be assigned to another tile, 0: otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[untiled] [tinyint] NOT NULL,

	--/ <summary>number of targets assigned to this tile</summary>
	--/ <quantity>meta.number</quantity>
	[nTargets] [int] NOT NULL,

	--/ <summary>Load Version</summary>
	--/ <quantity>meta.version</quantity>
	[loadVersion] [int] NOT NULL,
 CONSTRAINT [pk_sdssTileAll_tile] PRIMARY KEY CLUSTERED 
(
	[tile] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sdssTiledTargetAll]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--/ <summary> Information on all targets run through tiling for SDSS-I and SDSS-II </summary>
--/ <remarks> This table is the full list of all targets that were run through  the SDSS tiling routines. targetID refers to the SDSS object  ID associated with the CAS DR7.  </remarks>
CREATE TABLE [dbo].[sdssTiledTargetAll](

	--/ <summary>Unique SDSS identifier composed from [skyVersion=0,rerun,run,camcol,field,obj].</summary>
	--/ <quantity>meta.id</quantity>
	[targetID] [bigint] NOT NULL,

	--/ <summary>Drift scan run number for targeting</summary>
	--/ <quantity>meta.id</quantity>
	[run] [smallint] NOT NULL,

	--/ <summary>Reprocessing number for targeting</summary>
	--/ <quantity>meta.id</quantity>
	[rerun] [smallint] NOT NULL,

	--/ <summary>Camera column number for targeting</summary>
	--/ <quantity>meta.id;instr.det</quantity>
	[camcol] [smallint] NOT NULL,

	--/ <summary>Field number for targeting</summary>
	--/ <quantity>meta.id;obs.field</quantity>
	[field] [smallint] NOT NULL,

	--/ <summary>Object id number for targeting</summary>
	--/ <quantity>meta.id</quantity>
	[obj] [smallint] NOT NULL,

	--/ <summary>right ascension</summary>
	--/ <quantity>pos.eq.ra</quantity>
	--/ <unit>deg</unit>
	[ra] [float] NOT NULL,

	--/ <summary>declination</summary>
	--/ <quantity>pos.eq.dec</quantity>
	--/ <unit>deg</unit>
	[dec] [float] NOT NULL,

	--/ <summary>htm tree info</summary>
	--/ <quantity>pos.eq.HTM</quantity>
	[htmID] [bigint] NOT NULL,

	--/ <summary>zone ID</summary>
	--/ <quantity>pos.eq.zone</quantity>
	[zoneID] [bigint] NOT NULL,

	--/ <summary>x projection of vector on unit sphere</summary>
	--/ <quantity>pos.eq.x</quantity>
	[cx] [float] NOT NULL,

	--/ <summary>y projection of vector on unit sphere</summary>
	--/ <quantity>pos.eq.y</quantity>
	[cy] [float] NOT NULL,

	--/ <summary>z projection of vector on unit sphere</summary>
	--/ <quantity>pos.eq.z</quantity>
	[cz] [float] NOT NULL,

	--/ <summary>primary target bitmask</summary>
	--/ <quantity>meta.code</quantity>
	[primTarget] [int] NOT NULL,

	--/ <summary>secondary target bitmask</summary>
	--/ <quantity>meta.code</quantity>
	[secTarget] [int] NOT NULL,

	--/ <summary>tiling priority level (lower means higher priority)</summary>
	--/ <quantity>meta.code</quantity>
	[tiPriority] [int] NOT NULL,

	--/ <summary>First tile number this object was assigned to</summary>
	--/ <quantity>meta.id</quantity>
	[tileAll] [int] NOT NULL,

	--/ <summary>Combined value of tiling results bitmask</summary>
	--/ <quantity>meta.code</quantity>
	[tiMaskAll] [smallint] NOT NULL,

	--/ <summary>unique ID of collisionGroup</summary>
	--/ <quantity>meta.id</quantity>
	[collisionGroupAll] [int] NOT NULL,

	--/ <summary>hashed ID of photometric object in best version of the sky</summary>
	--/ <quantity>meta.id;phot</quantity>
	[photoObjID] [bigint] NOT NULL,

	--/ <summary>hashed ID of spectroscopic object in best version of the sky</summary>
	--/ <quantity>meta.id;spect</quantity>
	[specObjID] [bigint] NOT NULL,

	--/ <summary>ID of tiling region, 0 if unset</summary>
	--/ <quantity>meta.id</quantity>
	[regionID] [int] NOT NULL,

	--/ <summary>Load Version</summary>
	--/ <quantity>meta.version</quantity>
	[loadVersion] [int] NOT NULL,
 CONSTRAINT [pk_sdssTiledTargetAll_targetID] PRIMARY KEY CLUSTERED 
(
	[targetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sdssTilingGeometry]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

--/ <summary> Information about boundary and mask regions in SDSS-I and SDSS-II </summary>
--/ <remarks> This table contains both tiling boundary and mask information. </remarks>
CREATE TABLE [dbo].[sdssTilingGeometry](

	--/ <summary>unique identifier for this tilingRegion</summary>
	--/ <quantity>meta.id</quantity>
	[tilingGeometryID] [int] NOT NULL,

	--/ <summary>run of tiling software</summary>
	--/ <quantity>meta.id</quantity>
	[tileRun] [smallint] NOT NULL,

	--/ <summary>stripe containing the boundary</summary>
	--/ <quantity>meta.id</quantity>
	[stripe] [int] NOT NULL,

	--/ <summary>b: official stripe boundaries should be included, x: use the full rectangle</summary>
	--/ <quantity>meta.code</quantity>
	[nsbx] [varchar](1) NOT NULL,

	--/ <summary>1: tiling mask, 0: tiling boundary</summary>
	--/ <quantity>meta.code</quantity>
	[isMask] [tinyint] NOT NULL,

	--/ <summary>specifies coordinate system for the boundaries</summary>
	--/ <quantity>meta.code</quantity>
	[coordType] [int] NOT NULL,

	--/ <summary>first lower bound</summary>
	--/ <quantity></quantity>
	--/ <unit>deg</unit>
	[lambdamu_0] [float] NOT NULL,

	--/ <summary>first upper bound</summary>
	--/ <quantity></quantity>
	--/ <unit>deg</unit>
	[lambdamu_1] [float] NOT NULL,

	--/ <summary>second lower bound</summary>
	--/ <quantity></quantity>
	--/ <unit>deg</unit>
	[etanu_0] [float] NOT NULL,

	--/ <summary>second upper bound</summary>
	--/ <quantity></quantity>
	--/ <unit>deg</unit>
	[etanu_1] [float] NOT NULL,

	--/ <summary>minimum survey latitude for this stripe for region in which primaries are selected (-9999 if no limit)</summary>
	--/ <quantity></quantity>
	--/ <unit>deg</unit>
	[lambdaLimit_0] [float] NOT NULL,

	--/ <summary>maximum survey latitude for this stripe for region in which primaries are selected (-9999 if no limit)</summary>
	--/ <quantity></quantity>
	--/ <unit>deg</unit>
	[lambdaLimit_1] [float] NOT NULL,

	--/ <summary>version of target software within this boundary</summary>
	--/ <quantity>meta.version</quantity>
	[targetVersion] [varchar](32) NOT NULL,

	--/ <summary>area of sky covered by this boundary that was not covered by previous boundaries</summary>
	--/ <quantity>phys.angSize.area</quantity>
	--/ <unit>deg+2</unit>
	[firstArea] [float] NOT NULL,

	--/ <summary>Load Version</summary>
	--/ <quantity>meta.version</quantity>
	[loadVersion] [int] NOT NULL,
 CONSTRAINT [pk_sdssTilingGeometry_tilingGeom] PRIMARY KEY CLUSTERED 
(
	[tilingGeometryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[sdssTilingInfo]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--/ <summary> Results of individual tiling runs for each tiled target </summary>
--/ <remarks> This table has entry for each time a target was input into  the SDSS tiling routines. targetID refers to the SDSS object  ID associated with the CAS DR7. To get target information,  join this table with sdssTiledTargets on targetID. </remarks>
CREATE TABLE [dbo].[sdssTilingInfo](

	--/ <summary>Unique SDSS identifier composed from [skyVersion=0,rerun,run,camcol,field,obj].</summary>
	--/ <quantity>meta.id</quantity>
	[targetID] [bigint] NOT NULL,

	--/ <summary>Run of tiling software</summary>
	--/ <quantity>meta.id</quantity>
	[tileRun] [smallint] NOT NULL,

	--/ <summary>Unique ID of objects within tiling run</summary>
	--/ <quantity>meta.id</quantity>
	[tid] [int] NOT NULL,

	--/ <summary>Value of tiling results bitmask for this run</summary>
	--/ <quantity>meta.code</quantity>
	[tiMask] [smallint] NOT NULL,

	--/ <summary>unique ID of collisionGroup in this tiling run</summary>
	--/ <quantity>meta.id</quantity>
	[collisionGroup] [int] NOT NULL,

	--/ <summary>Tile this object was assigned to in this run</summary>
	--/ <quantity>meta.id</quantity>
	[tile] [int] NOT NULL,

	--/ <summary>Load Version</summary>
	--/ <quantity>meta.version</quantity>
	[loadVersion] [int] NOT NULL,
 CONSTRAINT [pk_sdssTilingInfo_tileRun_target] PRIMARY KEY CLUSTERED 
(
	[tileRun] ASC,
	[targetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sdssTilingRun]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

--/ <summary> Contains basic information for a run of tiling  Contains basic information for a run of tiling </summary>
--/ <remarks>  </remarks>
CREATE TABLE [dbo].[sdssTilingRun](

	--/ <summary>(unique) tiling run number</summary>
	--/ <quantity>meta.id</quantity>
	[tileRun] [smallint] NOT NULL,

	--/ <summary>version of ctile software</summary>
	--/ <quantity>meta.version</quantity>
	[ctileVersion] [varchar](32) NOT NULL,

	--/ <summary>unique id for tiling run</summary>
	--/ <quantity>meta.id</quantity>
	[tilepId] [varchar](32) NOT NULL,

	--/ <summary>character string of program</summary>
	--/ <quantity>meta.id</quantity>
	[programName] [varchar](32) NOT NULL,

	--/ <summary>bit mask for target types to be tiled</summary>
	--/ <quantity>meta.code</quantity>
	[primTargetMask] [int] NOT NULL,

	--/ <summary>bit mask for target types to be tiled</summary>
	--/ <quantity>meta.code</quantity>
	[secTargetMask] [int] NOT NULL,

	--/ <summary>Load Version</summary>
	--/ <quantity>meta.version</quantity>
	[loadVersion] [int] NOT NULL,
 CONSTRAINT [pk_sdssTilingRun_tileRun] PRIMARY KEY CLUSTERED 
(
	[tileRun] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[segueTargetAll]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--/ <summary> SEGUE-1 and SEGUE-2 target selection run on all imaging data </summary>
--/ <remarks> This table gives the results for SEGUE target selection algorithms  for the full photometric catalog. The target flags in these files   are not the ones actually used for the SEGUE-1 and SEGUE-2 survey.	Instead, they are derived from the final photometric data set from   DR8. Only objects designated RUN_PRIMARY have target selection   flags set.  </remarks>
CREATE TABLE [dbo].[segueTargetAll](

	--/ <summary>unique id, points to photoObj</summary>
	--/ <quantity>meta.id</quantity>
	[objid] [bigint] NOT NULL,

	--/ <summary>SEGUE-1 primary target selection flag</summary>
	--/ <quantity>meta.code</quantity>
	[segue1_target1] [int] NOT NULL,

	--/ <summary>SEGUE-1 secondary target selection flag</summary>
	--/ <quantity>meta.code</quantity>
	[segue1_target2] [int] NOT NULL,

	--/ <summary>SEGUE-2 primary target selection flag</summary>
	--/ <quantity>meta.code</quantity>
	[segue2_target1] [int] NOT NULL,

	--/ <summary>SEGUE-2 secondary target selection flag</summary>
	--/ <quantity>meta.code</quantity>
	[segue2_target2] [int] NOT NULL,

	--/ <summary>SEGUE-1 and -2 target selection color: -0.436*uMag+1.129*gMag-0.119*rMag-0.574*iMag+0.1984 (Lenz et al.1998)</summary>
	--/ <quantity>phot.color</quantity>
	--/ <unit>mag</unit>
	[lcolor] [real] NOT NULL,

	--/ <summary>SEGUE-1 target selection color: -0.249*uMag+0.794*gMag-0.555*rMag+0.234+0.011*p1s-0.010 (Helmi et al. 2003)</summary>
	--/ <quantity>phot.color</quantity>
	--/ <unit>mag</unit>
	[scolor] [real] NOT NULL,

	--/ <summary>SEGUE-1 target selection color: 0.91*umg+0.415*umg-1.280 (Helmi et al. 2003)</summary>
	--/ <quantity>phot.color</quantity>
	--/ <unit>mag</unit>
	[p1s] [real] NOT NULL,

	--/ <summary>sqrt(PMRA*PMRA+PMDEC*PMDEC), in mas/year</summary>
	--/ <quantity>pos.pm</quantity>
	--/ <unit>mas yr-1</unit>
	[totalpm] [real] NOT NULL,

	--/ <summary>reduced proper motion, gMag+5*log10(TOTALPM/1000)+5</summary>
	--/ <quantity>pos.pm</quantity>
	--/ <unit>mag</unit>
	[hg] [real] NOT NULL,

	--/ <summary>4.471+7.907*imz-0.837*imz*imz used in SEGUE-1 target selection, unused in SEGUE-2</summary>
	--/ <quantity>phot.mag.abs</quantity>
	--/ <unit>mag</unit>
	[Mi] [real] NOT NULL,

	--/ <summary>10^((iMag-Mi+5)/5.0) used in SEGUE-1 target selection, unused in SEGUE-2</summary>
	--/ <quantity>phot.mag.distMod</quantity>
	--/ <unit>mag</unit>
	[disti] [real] NOT NULL,

	--/ <summary>reduced pm (uncorr r): PSFMAG_r+5*log10(TOTALPM/1000)+5</summary>
	--/ <quantity>pos.pm</quantity>
	--/ <unit>mag</unit>
	[Hr] [real] NOT NULL,

	--/ <summary>V-I from VMAG_TRANS-(iMag-0.337*rmi-0.37)</summary>
	--/ <quantity>phot.color;em.opt.V;em.opt.I</quantity>
	--/ <unit>mag</unit>
	[vmi_trans1] [real] NOT NULL,

	--/ <summary>V-I from 0.877*gmr+0.358</summary>
	--/ <quantity>phot.color;em.opt.V;em.opt.I</quantity>
	--/ <unit>mag</unit>
	[vmi_trans2] [real] NOT NULL,

	--/ <summary>V mag from gMag - 0.587*gmr -0.011</summary>
	--/ <quantity>phot.mag;em.opt.V</quantity>
	--/ <unit>mag</unit>
	[vmag_trans] [real] NOT NULL,

	--/ <unit>mag</unit>
	[Mv_trans] [real] NOT NULL,

	--/ <summary>10^(dmV/5.-2.) where VMAG_TRANS-(3.37*VMI_TRANS1+2.89)</summary>
	--/ <quantity>phot.mag.distMod</quantity>
	--/ <unit>kpc</unit>
	[distv_kpc] [real] NOT NULL,

	--/ <summary>transverse velocity, km/s, derived from TOTALPM and DISTV_KPC, in a frame at rest w.r.t the Galaxy</summary>
	--/ <quantity>phys.veloc.transverse</quantity>
	--/ <unit>km s-1</unit>
	[vtrans_galrest] [real] NOT NULL,

	--/ <summary>derived PM (mas/year) perpendicular to the Galactocentric radial vector, assuming all motion is along a Galactocentric radial vector, in a frame at rest w.r.t the Galaxy</summary>
	--/ <quantity>pos.pm</quantity>
	--/ <unit>mas yr-1</unit>
	[mutrans_galradrest] [real] NOT NULL,

	--/ <summary>derived PM (mas/year) along the Galactocentric radial vector, assuming all motion is along a Galactocentric radial vector, in a frame at rest w.r.t the Galaxy</summary>
	--/ <quantity>pos.pm</quantity>
	--/ <unit>mas yr-1</unit>
	[murad_galradrest] [real] NOT NULL,

	--/ <summary>total velocity, km/s, derived from TOTALPM and DISTV_KPC, in a frame at rest w.r.t the Galaxy</summary>
	--/ <quantity>phys.veloc</quantity>
	--/ <unit>km s-1</unit>
	[vtot_galradrest] [real] NOT NULL,

	--/ <summary>5.7 + 10.0*(GMR - 0.375)</summary>
	--/ <quantity>phot.mag</quantity>
	--/ <unit>mag</unit>
	[mg_tohv] [real] NOT NULL,

	--/ <summary>transverse velocity in Galactocentric coords, using the distance estimate from MG_TOHV which is appropriate for old stars near the MSTO and corrected for peculiar solar motion 16.6 km/s toward RA,Dec 267.5,28.1</summary>
	--/ <quantity>phys.veloc.transverse</quantity>
	--/ <unit>km s-1</unit>
	[vtrans_tohv] [real] NOT NULL,

	--/ <summary>Estimate of the 1-sigma error in total proper motion at this r magnitude.  Formula is sqrt(4.56*4.56 + frate*2.30*2.30), where frate is 10^(0.4*(rMag-19.5)).  The constants come from the Munn et al. 2004 (AJ, 127, 3034) paper describing the recalibration of USNOB with SDSS.</summary>
	--/ <quantity>stat.error;pos.pm</quantity>
	--/ <unit>mas yr-1</unit>
	[pm1sigma_tohv] [real] NOT NULL,

	--/ <summary>The corresponding 1-sigma error in the transverse velocity based on PM1SIGMA_TOHV and the the distance estimate using MG_TOHV</summary>
	--/ <quantity></quantity>
	--/ <unit>km s-1</unit>
	[v1sigmaerr_tohv] [real] NOT NULL,
 CONSTRAINT [pk_segueTargetAll_objID] PRIMARY KEY CLUSTERED 
(
	[objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SpecDR7]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--/ <summary> Contains the spatial cross-match between DR8 SpecObjAll and DR7 primaries. </summary>
--/ <remarks> This is a unique match between a DR8 SpecObjAll and a DR7 photoprimary   within 1 arcsec.  DR7 PhotoTag columns and relevant DR7 ProperMotions are  also included for convenience. </remarks>
CREATE TABLE [dbo].[SpecDR7](

	--/ <summary>Unique DR8 ID based on PLATE, MJD, FIBERID, RUN2D</summary>
	--/ <quantity>meta.id</quantity>
	[specObjID] [bigint] NOT NULL,

	--/ <summary>Unique DR7 PhotoPrimary ID composed from [skyVersion,rerun,run,camcol,field,obj].</summary>
	--/ <quantity>meta.id</quantity>
	[dr7ObjID] [bigint] NOT NULL,

	--/ <summary>J2000 right ascension (r')</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[ra] [float] NOT NULL,

	--/ <summary>J2000 declination (r')</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[dec] [float] NOT NULL,

	--/ <summary>unit vector for ra+dec</summary>
	--/ <quantity>pos.eq.x;pos.frame=j2000</quantity>
	[cx] [float] NOT NULL,

	--/ <summary>unit vector for ra+dec</summary>
	--/ <quantity>pos.eq.y;pos.frame=j2000</quantity>
	[cy] [float] NOT NULL,

	--/ <summary>unit vector for ra+dec</summary>
	--/ <quantity>pos.eq.z;pos.frame=j2000</quantity>
	[cz] [float] NOT NULL,

	--/ <summary>0 = OPDB target, 1 = OPDB best</summary>
	--/ <quantity>meta.code</quantity>
	[skyVersion] [tinyint] NOT NULL,

	--/ <summary>Run number</summary>
	--/ <quantity>meta.id</quantity>
	[run] [smallint] NOT NULL,

	--/ <summary>Rerun number</summary>
	--/ <quantity>meta.id</quantity>
	[rerun] [smallint] NOT NULL,

	--/ <summary>Camera column</summary>
	--/ <quantity>meta.id;instr.det</quantity>
	[camcol] [tinyint] NOT NULL,

	--/ <summary>Field number</summary>
	--/ <quantity>meta.id;obs.field</quantity>
	[field] [smallint] NOT NULL,

	--/ <summary>The object id within a field. Usually changes between reruns of the same field.</summary>
	--/ <quantity>meta.id</quantity>
	[obj] [smallint] NOT NULL,

	--/ <summary>Number of children if this is a composite object that has been deblended. BRIGHT (in a flags sense) objects also have nchild == 1, the non-BRIGHT sibling.</summary>
	--/ <quantity>meta.number</quantity>
	[nChild] [smallint] NOT NULL,

	--/ <summary>Morphological type classification of the object.</summary>
	--/ <quantity>src.morph.tpye</quantity>
	[type] [smallint] NOT NULL,

	--/ <summary>Probability that the object is a star. Currently 0 if type == 3 (galaxy), 1 if type == 6 (star).</summary>
	--/ <quantity>stat.probability;src.class.starGalaxy</quantity>
	[probPSF] [real] NOT NULL,

	--/ <summary>Flag to indicate whether object is inside a mask and why</summary>
	--/ <quantity>meta.code</quantity>
	[insideMask] [tinyint] NOT NULL,

	--/ <summary>Photo Object Attribute Flags</summary>
	--/ <quantity>meta.code</quantity>
	[flags] [bigint] NOT NULL,

	--/ <summary>PSF flux</summary>
	--/ <quantity>phot.mag;em.opt.SDSS.u</quantity>
	--/ <unit>mag</unit>
	[psfMag_u] [real] NOT NULL,

	--/ <summary>PSF flux</summary>
	--/ <quantity>phot.mag;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[psfMag_g] [real] NOT NULL,

	--/ <summary>PSF flux</summary>
	--/ <quantity>phot.mag;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[psfMag_r] [real] NOT NULL,

	--/ <summary>PSF flux</summary>
	--/ <quantity>phot.mag;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[psfMag_i] [real] NOT NULL,

	--/ <summary>PSF flux</summary>
	--/ <quantity>phot.mag;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[psfMag_z] [real] NOT NULL,

	--/ <summary>PSF flux error</summary>
	--/ <quantity>stat.error;phot.mag;em.opt.SDSS.u</quantity>
	--/ <unit>mag</unit>
	[psfMagErr_u] [real] NOT NULL,

	--/ <summary>PSF flux error</summary>
	--/ <quantity>stat.error;phot.mag;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[psfMagErr_g] [real] NOT NULL,

	--/ <summary>PSF flux error</summary>
	--/ <quantity>stat.error;phot.mag;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[psfMagErr_r] [real] NOT NULL,

	--/ <summary>PSF flux error</summary>
	--/ <quantity>stat.error;phot.mag;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[psfMagErr_i] [real] NOT NULL,

	--/ <summary>PSF flux error</summary>
	--/ <quantity>stat.error;phot.mag;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[psfMagErr_z] [real] NOT NULL,

	--/ <summary>Petrosian flux</summary>
	--/ <quantity>phot.mag.petrosian;em.opt.SDSS.u</quantity>
	--/ <unit>mag</unit>
	[petroMag_u] [real] NOT NULL,

	--/ <summary>Petrosian flux</summary>
	--/ <quantity>phot.mag.petrosian;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[petroMag_g] [real] NOT NULL,

	--/ <summary>Petrosian flux</summary>
	--/ <quantity>phot.mag.petrosian;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[petroMag_r] [real] NOT NULL,

	--/ <summary>Petrosian flux</summary>
	--/ <quantity>phot.mag.petrosian;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[petroMag_i] [real] NOT NULL,

	--/ <summary>Petrosian flux</summary>
	--/ <quantity>phot.mag.petrosian;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[petroMag_z] [real] NOT NULL,

	--/ <summary>Petrosian flux error</summary>
	--/ <quantity>stat.error;phot.mag.petrosian;em.opt.SDSS.u</quantity>
	--/ <unit>mag</unit>
	[petroMagErr_u] [real] NOT NULL,

	--/ <summary>Petrosian flux error</summary>
	--/ <quantity>stat.error;phot.mag.petrosian;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[petroMagErr_g] [real] NOT NULL,

	--/ <summary>Petrosian flux error</summary>
	--/ <quantity>stat.error;phot.mag.petrosian;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[petroMagErr_r] [real] NOT NULL,

	--/ <summary>Petrosian flux error</summary>
	--/ <quantity>stat.error;phot.mag.petrosian;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[petroMagErr_i] [real] NOT NULL,

	--/ <summary>Petrosian flux error</summary>
	--/ <quantity>stat.error;phot.mag.petrosian;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[petroMagErr_z] [real] NOT NULL,

	--/ <summary>Radius containing 50% of Petrosian flux</summary>
	--/ <quantity>phys.angSize;em.opt.SDSS.r</quantity>
	--/ <unit>arcsec</unit>
	[petroR50_r] [real] NOT NULL,

	--/ <summary>Radius containing 90% of Petrosian flux</summary>
	--/ <quantity>phys.angSize;em.opt.SDSS.r</quantity>
	--/ <unit>arcsec</unit>
	[petroR90_r] [real] NOT NULL,

	--/ <summary>better of DeV/Exp magnitude fit</summary>
	--/ <quantity>phot.mag;meta.modelled;em.opt.SDSS.u</quantity>
	--/ <unit>mag</unit>
	[modelMag_u] [real] NOT NULL,

	--/ <summary>better of DeV/Exp magnitude fit</summary>
	--/ <quantity>phot.mag;meta.modelled;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[modelMag_g] [real] NOT NULL,

	--/ <summary>better of DeV/Exp magnitude fit</summary>
	--/ <quantity>phot.mag;meta.modelled;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[modelMag_r] [real] NOT NULL,

	--/ <summary>better of DeV/Exp magnitude fit</summary>
	--/ <quantity>phot.mag;meta.modelled;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[modelMag_i] [real] NOT NULL,

	--/ <summary>better of DeV/Exp magnitude fit</summary>
	--/ <quantity>phot.mag;meta.modelled;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[modelMag_z] [real] NOT NULL,

	--/ <summary>better of DeV/Exp magnitude fit error</summary>
	--/ <quantity>stat.error;phot.mag;meta.modelled;em.opt.SDSS.u</quantity>
	--/ <unit>mag</unit>
	[modelMagErr_u] [real] NOT NULL,

	--/ <summary>better of DeV/Exp magnitude fit error</summary>
	--/ <quantity>stat.error;phot.mag;meta.modelled;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[modelMagErr_g] [real] NOT NULL,

	--/ <summary>better of DeV/Exp magnitude fit error</summary>
	--/ <quantity>stat.error;phot.mag;meta.modelled;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[modelMagErr_r] [real] NOT NULL,

	--/ <summary>better of DeV/Exp magnitude fit error</summary>
	--/ <quantity>stat.error;phot.mag;meta.modelled;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[modelMagErr_i] [real] NOT NULL,

	--/ <summary>better of DeV/Exp magnitude fit error</summary>
	--/ <quantity>stat.error;phot.mag;meta.modelled;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[modelMagErr_z] [real] NOT NULL,

	--/ <summary>Adaptive (&lt;r^2&gt; + &lt;c^2&gt;)</summary>
	--/ <quantity>obs.param;em.opt.SDSS.r</quantity>
	[mRrCc_r] [real] NOT NULL,

	--/ <summary>Error in adaptive (&lt;r^2&gt; + &lt;c^2&gt;)</summary>
	--/ <quantity>stat.error;obs.param;em.opt.SDSS.r</quantity>
	[mRrCcErr_r] [real] NOT NULL,

	--/ <summary>Star ln(likelihood)</summary>
	--/ <quantity>stat.likelihood;em.opt.SDSS.r</quantity>
	[lnLStar_r] [real] NOT NULL,

	--/ <summary>Exponential disk fit ln(likelihood)</summary>
	--/ <quantity>stat.likelihood;em.opt.SDSS.r</quantity>
	[lnLExp_r] [real] NOT NULL,

	--/ <summary>DeVaucouleurs fit ln(likelihood)</summary>
	--/ <quantity>stat.likelihood;em.opt.SDSS.r</quantity>
	[lnLDeV_r] [real] NOT NULL,

	--/ <summary>Status of the object in the survey</summary>
	--/ <quantity>meta.code.status</quantity>
	[status] [int] NOT NULL,

	--/ <summary>Bit mask of primary target categories the object was selected in.</summary>
	--/ <quantity>meta.code</quantity>
	[primTarget] [int] NOT NULL,

	--/ <summary>Bit mask of secondary target categories the object was selected in.</summary>
	--/ <quantity>meta.code</quantity>
	[secTarget] [int] NOT NULL,

	--/ <summary>Extinction in each filter</summary>
	--/ <quantity>phys.absorption.gal;em.opt.SDSS.u</quantity>
	--/ <unit>mag</unit>
	[extinction_u] [real] NOT NULL,

	--/ <summary>Extinction in each filter</summary>
	--/ <quantity>phys.absorption.gal;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[extinction_g] [real] NOT NULL,

	--/ <summary>Extinction in each filter</summary>
	--/ <quantity>phys.absorption.gal;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[extinction_r] [real] NOT NULL,

	--/ <summary>Extinction in each filter</summary>
	--/ <quantity>phys.absorption.gal;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[extinction_i] [real] NOT NULL,

	--/ <summary>Extinction in each filter</summary>
	--/ <quantity>phys.absorption.gal;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[extinction_z] [real] NOT NULL,

	--/ <summary>20-deep hierarchical trangular mesh ID of this object</summary>
	--/ <quantity>pos.eq.HTM</quantity>
	[htmID] [bigint] NOT NULL,

	--/ <summary>Zone ID</summary>
	--/ <quantity>pos.eq.zone</quantity>
	[zoneID] [bigint] NOT NULL,

	--/ <summary>Link to the field this object is in</summary>
	--/ <quantity>meta.id;obs.field</quantity>
	[fieldID] [bigint] NOT NULL,

	--/ <summary>computed: =SQRT(mRrCc_r/2.0)</summary>
	--/ <quantity>phys.size</quantity>
	[size] [real] NOT NULL,

	--/ <summary>Proper motion in right ascension.</summary>
	--/ <quantity>pos.pm;pos.eq.ra</quantity>
	--/ <unit>mas yr-1</unit>
	[pmRa] [real] NOT NULL,

	--/ <summary>Proper motion in declination.</summary>
	--/ <quantity>pos.pm;pos.eq.dec</quantity>
	--/ <unit>mas yr-1</unit>
	[pmDec] [real] NOT NULL,

	--/ <summary>Proper motion in galactic longitude.</summary>
	--/ <quantity>pos.pm;pos.galactic.lon</quantity>
	--/ <unit>mas yr-1</unit>
	[pmL] [real] NOT NULL,

	--/ <summary>Proper motion in galactic latitude.</summary>
	--/ <quantity>pos.pm;pos.galactic.lat</quantity>
	--/ <unit>mas yr-1</unit>
	[pmB] [real] NOT NULL,

	--/ <summary>Error in proper motion in right ascension.</summary>
	--/ <quantity>stat.error;pos.eq.ra</quantity>
	--/ <unit>mas yr-1</unit>
	[pmRaErr] [real] NOT NULL,

	--/ <summary>Error in proper motion in declination.</summary>
	--/ <quantity>stat.error;pos.eq.dec</quantity>
	--/ <unit>mas yr-1</unit>
	[pmDecErr] [real] NOT NULL,

	--/ <summary>Distance between this object and the nearest matching USNO-B object.</summary>
	--/ <quantity>pos.angDistance</quantity>
	--/ <unit>arcsec</unit>
	[delta] [real] NOT NULL,

	--/ <summary>Number of objects in USNO-B which matched this object within a 1 arcsec radius.  If negative, then the nearest matching USNO-B object itself matched more than 1 SDSS object.</summary>
	--/ <quantity>meta.number</quantity>
	[match] [int] NOT NULL,
 CONSTRAINT [pk_specDR7_SpecObjID] PRIMARY KEY CLUSTERED 
(
	[specObjID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SpecObjAll]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

--/ <summary> Contains the measured parameters for a spectrum. </summary>
--/ <remarks> This is a base table containing &lt;b>ALL&lt;/b> the spectroscopic  information, including a lot of duplicate and bad data. Use  the &lt;b>SpecObj&lt;/b> view instead, which has the data properly  filtered for cleanliness. These tables contain both the BOSS  and SDSS spectrograph data.  NOTE: The RA and Dec in this table refer to the DR8 coordinates,  which have errors in the region north of 41 deg in Dec.  This change does not affect the matching to the photometric  catalog. </remarks>
CREATE TABLE [dbo].[SpecObjAll](

	--/ <summary>Unique database ID based on PLATE, MJD, FIBERID, RUN2D</summary>
	--/ <quantity>meta.id</quantity>
	[specObjID] [bigint] NOT NULL,

	--/ <summary>Object ID of photoObj match (position-based)</summary>
	--/ <quantity>meta.id</quantity>
	[bestObjID] [bigint] NOT NULL,

	--/ <summary>Object ID of photoObj match (flux-based)</summary>
	--/ <quantity>meta.id</quantity>
	[fluxObjID] [bigint] NOT NULL,

	--/ <summary>Object ID of original target</summary>
	--/ <quantity>meta.id</quantity>
	[targetObjID] [bigint] NOT NULL,

	--/ <summary>Database ID of Plate</summary>
	--/ <quantity>meta.id;instr.det</quantity>
	[plateID] [bigint] NOT NULL,

	--/ <summary>Best version of spectrum at this location (defines default view SpecObj)</summary>
	--/ <quantity>meta.code</quantity>
	[sciencePrimary] [smallint] NOT NULL,

	--/ <summary>Best version of spectrum at this location, among Legacy plates</summary>
	--/ <quantity>meta.code</quantity>
	[legacyPrimary] [smallint] NOT NULL,

	--/ <summary>Best version of spectrum at this location, among SEGUE plates</summary>
	--/ <quantity>meta.code</quantity>
	[seguePrimary] [smallint] NOT NULL,

	--/ <summary>Best version of spectrum at this location, among SEGUE-1 plates</summary>
	--/ <quantity>meta.code</quantity>
	[segue1Primary] [smallint] NOT NULL,

	--/ <summary>Best version of spectrum at this location, among SEGUE-2 plates</summary>
	--/ <quantity>meta.code</quantity>
	[segue2Primary] [smallint] NOT NULL,

	--/ <summary>Best version of spectrum at this location, among BOSS plates</summary>
	--/ <quantity>meta.code</quantity>
	[bossPrimary] [smallint] NOT NULL,

	--/ <summary>Best version of spectrum at this location among SDSS plates (defines default view SpecObj)</summary>
	--/ <quantity>meta.code</quantity>
	[sdssPrimary] [smallint] NOT NULL,

	--/ <summary>Index of BOSS observation in spAll flat file</summary>
	--/ <quantity>meta.id</quantity>
	[bossSpecObjID] [int] NOT NULL,

	--/ <summary>Name of first release this object was associated with</summary>
	--/ <quantity>meta.id</quantity>
	[firstRelease] [varchar](32) NOT NULL,

	--/ <summary>Survey name</summary>
	--/ <quantity>meta.id</quantity>
	[survey] [varchar](32) NOT NULL,

	--/ <summary>Instrument used (SDSS or BOSS spectrograph)</summary>
	--/ <quantity>instr</quantity>
	[instrument] [varchar](32) NOT NULL,

	--/ <summary>Program name</summary>
	--/ <quantity>meta.id</quantity>
	[programname] [varchar](32) NOT NULL,

	--/ <summary>Chunk name</summary>
	--/ <quantity>meta.id</quantity>
	[chunk] [varchar](32) NOT NULL,

	--/ <summary>Plate drill run name</summary>
	--/ <quantity>meta.id</quantity>
	[platerun] [varchar](32) NOT NULL,

	--/ <summary>MJD of observation</summary>
	--/ <quantity>time.epoch</quantity>
	--/ <unit>d</unit>
	[mjd] [int] NOT NULL,

	--/ <summary>Plate number</summary>
	--/ <quantity>meta.id;instr.det</quantity>
	[plate] [smallint] NOT NULL,

	--/ <summary>Fiber ID</summary>
	--/ <quantity>meta.id;instr.param</quantity>
	[fiberID] [smallint] NOT NULL,

	--/ <summary>1D Reduction version of spectrum</summary>
	--/ <quantity>meta.version</quantity>
	[run1d] [varchar](32) NOT NULL,

	--/ <summary>2D Reduction version of spectrum</summary>
	--/ <quantity>meta.version</quantity>
	[run2d] [varchar](32) NOT NULL,

	--/ <summary>Tile number</summary>
	--/ <quantity>meta.id</quantity>
	[tile] [int] NOT NULL,

	--/ <summary>Design ID number</summary>
	--/ <quantity>meta.id</quantity>
	[designID] [int] NOT NULL,

	--/ <summary>for Legacy program, target selection information at plate design</summary>
	--/ <quantity>meta.code</quantity>
	[legacy_target1] [bigint] NOT NULL,

	--/ <summary>for Legacy program target selection information at plate design, secondary/qa/calibration</summary>
	--/ <quantity>meta.code</quantity>
	[legacy_target2] [bigint] NOT NULL,

	--/ <summary>for Special program target selection information at plate design</summary>
	--/ <quantity>meta.code</quantity>
	[special_target1] [bigint] NOT NULL,

	--/ <summary>for Special program target selection information at plate design, secondary/qa/calibration</summary>
	--/ <quantity>meta.code</quantity>
	[special_target2] [bigint] NOT NULL,

	--/ <summary>SEGUE-1 target selection information at plate design, primary science selection</summary>
	--/ <quantity>meta.code</quantity>
	[segue1_target1] [bigint] NOT NULL,

	--/ <summary>SEGUE-1 target selection information at plate design, secondary/qa/calib selection</summary>
	--/ <quantity>meta.code</quantity>
	[segue1_target2] [bigint] NOT NULL,

	--/ <summary>SEGUE-2 target selection information at plate design, primary science selection</summary>
	--/ <quantity>meta.code</quantity>
	[segue2_target1] [bigint] NOT NULL,

	--/ <summary>SEGUE-2 target selection information at plate design, secondary/qa/calib selection</summary>
	--/ <quantity>meta.code</quantity>
	[segue2_target2] [bigint] NOT NULL,

	--/ <summary>BOSS target selection information at plate</summary>
	--/ <quantity>meta.code</quantity>
	[boss_target1] [bigint] NOT NULL,

	--/ <summary>EBOSS target selection information at plate</summary>
	--/ <quantity>meta.code</quantity>
	[eboss_target0] [bigint] NOT NULL,

	--/ <summary>BOSS ancillary science target selection information at plate design</summary>
	--/ <quantity>meta.code</quantity>
	[ancillary_target1] [bigint] NOT NULL,

	--/ <summary>BOSS ancillary target selection information at plate design</summary>
	--/ <quantity>meta.code</quantity>
	[ancillary_target2] [bigint] NOT NULL,

	--/ <summary>target selection information at plate design, primary science selection (for backwards compatibility)</summary>
	--/ <quantity>meta.code</quantity>
	[primTarget] [bigint] NOT NULL,

	--/ <summary>target selection information at plate design, secondary/qa/calib selection  (for backwards compatibility)</summary>
	--/ <quantity>meta.code</quantity>
	[secTarget] [bigint] NOT NULL,

	--/ <summary>which spectrograph (1,2)</summary>
	--/ <quantity>meta.id;instr.det</quantity>
	[spectrographID] [smallint] NOT NULL,

	--/ <summary>For Legacy, SEGUE-2 and BOSS science targets, type of object targeted as (target bits contain full information and are recommended)</summary>
	--/ <quantity>meta.code</quantity>
	[sourceType] [varchar](128) NOT NULL,

	--/ <summary>Nature of target: SCIENCE, STANDARD, or SKY</summary>
	--/ <quantity>meta.note</quantity>
	[targetType] [varchar](128) NOT NULL,

	--/ <summary>DR8 Right ascension of fiber, J2000</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[ra] [float] NOT NULL,

	--/ <summary>DR8 Declination of fiber, J2000</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[dec] [float] NOT NULL,

	--/ <summary>x of Normal unit vector in J2000</summary>
	--/ <quantity>pos.eq.x;pos.frame=j2000</quantity>
	[cx] [float] NOT NULL,

	--/ <summary>y of Normal unit vector in J2000</summary>
	--/ <quantity>pos.eq.y;pos.frame=j2000</quantity>
	[cy] [float] NOT NULL,

	--/ <summary>z of Normal unit vector in J2000</summary>
	--/ <quantity>pos.eq.z;pos.frame=j2000</quantity>
	[cz] [float] NOT NULL,

	--/ <summary>X focal plane position (+RA direction)</summary>
	--/ <quantity>pos.cartesian.x;instr.param</quantity>
	--/ <unit>mm</unit>
	[xFocal] [real] NOT NULL,

	--/ <summary>Y focal plane position (+Dec direction)</summary>
	--/ <quantity>pos.cartesian.y;instr.param</quantity>
	--/ <unit>mm</unit>
	[yFocal] [real] NOT NULL,

	--/ <summary>Effective wavelength that hole was drilled for (accounting for atmopheric refraction)</summary>
	--/ <quantity>wm.wl.effective</quantity>
	--/ <unit>AA</unit>
	[lambdaEff] [real] NOT NULL,

	--/ <summary>Set to 1 if this hole was designated a "blue fiber", 0 if designated a "red fiber" (high redshift LRGs are preferentially in "red fibers")</summary>
	--/ <quantity>meta.code;instr.param</quantity>
	[blueFiber] [int] NOT NULL,

	--/ <summary>Washer thickness used (for backstopping BOSS quasar targets, so they are closer to 4000 Angstrom focal plan)</summary>
	--/ <quantity>phys.size;instr.param</quantity>
	--/ <unit>um</unit>
	[zOffset] [real] NOT NULL,

	--/ <summary>Final Redshift</summary>
	--/ <quantity>src.redshift</quantity>
	[z] [real] NOT NULL,

	--/ <summary>Redshift error</summary>
	--/ <quantity>stat.error;src.redshift</quantity>
	[zErr] [real] NOT NULL,

	--/ <summary>Bitmask of warning values; 0 means all is well</summary>
	--/ <quantity>meta.code;src.redshift</quantity>
	[zWarning] [int] NOT NULL,

	--/ <summary>Spectroscopic class (GALAXY, QSO, or STAR)</summary>
	--/ <quantity>src.class</quantity>
	[class] [varchar](32) NOT NULL,

	--/ <summary>Spectroscopic subclass</summary>
	--/ <quantity>src.class</quantity>
	[subClass] [varchar](32) NOT NULL,

	--/ <summary>Reduced chi-squared of best fit</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[rChi2] [real] NOT NULL,

	--/ <summary>Degrees of freedom in best fit</summary>
	--/ <quantity>stat.fit.dof</quantity>
	[DOF] [real] NOT NULL,

	--/ <summary>Difference in reduced chi-squared between best and second best fit</summary>
	--/ <quantity>stat.fit.chi2;arith.diff</quantity>
	[rChi2Diff] [real] NOT NULL,

	--/ <summary>Best redshift when excluding QSO fit in BOSS spectra (right redshift to use for galaxy targets)</summary>
	--/ <quantity>src.redshift</quantity>
	[z_noqso] [real] NOT NULL,

	--/ <summary>Error in "z_noqso" redshift (BOSS spectra only)</summary>
	--/ <quantity>stat.error;src.redshift</quantity>
	[zErr_noqso] [real] NOT NULL,

	--/ <summary>Warnings in "z_noqso" redshift (BOSS spectra only)</summary>
	--/ <quantity>meta.code;src.redshift</quantity>
	[zWarning_noqso] [real] NOT NULL,

	--/ <summary>Classification in "z_noqso" redshift</summary>
	--/ <quantity>src.class</quantity>
	[class_noqso] [varchar](32) NOT NULL,

	--/ <summary>Sub-classification in "z_noqso" redshift</summary>
	--/ <quantity>src.class</quantity>
	[subClass_noqso] [varchar](32) NOT NULL,

	--/ <summary>Reduced chi-squared difference from next best redshift, for "z_noqso" redshift</summary>
	--/ <quantity>stat.fit.chi2;arith.diff</quantity>
	[rChi2Diff_noqso] [real] NOT NULL,

	--/ <summary>Person-assigned redshift, if this object has been inspected</summary>
	--/ <quantity>src.redshift</quantity>
	[z_person] [real] NOT NULL,

	--/ <summary>Person-assigned classification, if this object has been inspected</summary>
	--/ <quantity>src.class</quantity>
	[class_person] [varchar](32) NOT NULL,

	--/ <summary>Comments from person for inspected objects</summary>
	--/ <quantity>meta.note</quantity>
	[comments_person] [varchar](200) NOT NULL,

	--/ <summary>File name of best fit template source</summary>
	--/ <quantity>meta.id;meta.file</quantity>
	[tFile] [varchar](32) NOT NULL,

	--/ <summary>Which column of the template file corresponds to template #0</summary>
	--/ <quantity>meta.id;meta.table</quantity>
	[tColumn_0] [smallint] NOT NULL,

	--/ <summary>Which column of the template file corresponds to template #1</summary>
	--/ <quantity>meta.id;meta.table</quantity>
	[tColumn_1] [smallint] NOT NULL,

	--/ <summary>Which column of the template file corresponds to template #2</summary>
	--/ <quantity>meta.id;meta.table</quantity>
	[tColumn_2] [smallint] NOT NULL,

	--/ <summary>Which column of the template file corresponds to template #3</summary>
	--/ <quantity>meta.id;meta.table</quantity>
	[tColumn_3] [smallint] NOT NULL,

	--/ <summary>Which column of the template file corresponds to template #4</summary>
	--/ <quantity>meta.id;meta.table</quantity>
	[tColumn_4] [smallint] NOT NULL,

	--/ <summary>Which column of the template file corresponds to template #5</summary>
	--/ <quantity>meta.id;meta.table</quantity>
	[tColumn_5] [smallint] NOT NULL,

	--/ <summary>Which column of the template file corresponds to template #6</summary>
	--/ <quantity>meta.id;meta.table</quantity>
	[tColumn_6] [smallint] NOT NULL,

	--/ <summary>Which column of the template file corresponds to template #7</summary>
	--/ <quantity>meta.id;meta.table</quantity>
	[tColumn_7] [smallint] NOT NULL,

	--/ <summary>Which column of the template file corresponds to template #8</summary>
	--/ <quantity>meta.id;meta.table</quantity>
	[tColumn_8] [smallint] NOT NULL,

	--/ <summary>Which column of the template file corresponds to template #9</summary>
	--/ <quantity>meta.id;meta.table</quantity>
	[tColumn_9] [smallint] NOT NULL,

	--/ <summary>Number of polynomial terms used in the fit</summary>
	--/ <quantity>meta.number</quantity>
	[nPoly] [real] NOT NULL,

	--/ <summary>Coefficient for template #0 of fit</summary>
	--/ <quantity>stat.fit.param</quantity>
	[theta_0] [real] NOT NULL,

	--/ <summary>Coefficient for template #1 of fit</summary>
	--/ <quantity>stat.fit.param</quantity>
	[theta_1] [real] NOT NULL,

	--/ <summary>Coefficient for template #2 of fit</summary>
	--/ <quantity>stat.fit.param</quantity>
	[theta_2] [real] NOT NULL,

	--/ <summary>Coefficient for template #3 of fit</summary>
	--/ <quantity>stat.fit.param</quantity>
	[theta_3] [real] NOT NULL,

	--/ <summary>Coefficient for template #4 of fit</summary>
	--/ <quantity>stat.fit.param</quantity>
	[theta_4] [real] NOT NULL,

	--/ <summary>Coefficient for template #5 of fit</summary>
	--/ <quantity>stat.fit.param</quantity>
	[theta_5] [real] NOT NULL,

	--/ <summary>Coefficient for template #6 of fit</summary>
	--/ <quantity>stat.fit.param</quantity>
	[theta_6] [real] NOT NULL,

	--/ <summary>Coefficient for template #7 of fit</summary>
	--/ <quantity>stat.fit.param</quantity>
	[theta_7] [real] NOT NULL,

	--/ <summary>Coefficient for template #8 of fit</summary>
	--/ <quantity>stat.fit.param</quantity>
	[theta_8] [real] NOT NULL,

	--/ <summary>Coefficient for template #9 of fit</summary>
	--/ <quantity>stat.fit.param</quantity>
	[theta_9] [real] NOT NULL,

	--/ <summary>Velocity dispersion</summary>
	--/ <quantity>phys.veloc.dispersion</quantity>
	--/ <unit>km s-1</unit>
	[velDisp] [real] NOT NULL,

	--/ <summary>Error in velocity dispersion</summary>
	--/ <quantity>stat.error;phys.veloc.dispersion</quantity>
	--/ <unit>km s-1</unit>
	[velDispErr] [real] NOT NULL,

	--/ <summary>Redshift associated with best fit velocity dispersion</summary>
	--/ <quantity>src.redshift</quantity>
	[velDispZ] [real] NOT NULL,

	--/ <summary>Error in redshift associated with best fit velocity dispersion</summary>
	--/ <quantity>stat.error;src.redshift</quantity>
	[velDispZErr] [real] NOT NULL,

	--/ <summary>Chi-squared associated with velocity dispersion fit</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[velDispChi2] [real] NOT NULL,

	--/ <summary>Number of pixels overlapping best template in velocity dispersion fit</summary>
	--/ <quantity>meta.number;instr.pixel</quantity>
	[velDispNPix] [int] NOT NULL,

	--/ <summary>Number of degrees of freedom in velocity dispersion fit</summary>
	--/ <quantity>stat.fit.dof</quantity>
	[velDispDOF] [int] NOT NULL,

	--/ <summary>Minimum observed (vacuum) wavelength</summary>
	--/ <quantity>em.wl;stat.min</quantity>
	--/ <unit>AA</unit>
	[waveMin] [real] NOT NULL,

	--/ <summary>Maximum observed (vacuum) wavelength</summary>
	--/ <quantity>em.wl;stat.max</quantity>
	--/ <unit>AA</unit>
	[waveMax] [real] NOT NULL,

	--/ <summary>Coverage in wavelength, in units of log10 wavelength</summary>
	--/ <quantity>stat.value</quantity>
	[wCoverage] [real] NOT NULL,

	--/ <summary>Median signal-to-noise over all good pixels in u-band</summary>
	--/ <quantity>stat.snr;stat.median;em.opt.SDSS.u</quantity>
	[snMedian_u] [real] NOT NULL,

	--/ <summary>Median signal-to-noise over all good pixels in g-band</summary>
	--/ <quantity>stat.snr;stat.median;em.opt.SDSS.g</quantity>
	[snMedian_g] [real] NOT NULL,

	--/ <summary>Median signal-to-noise over all good pixels in r-band</summary>
	--/ <quantity>stat.snr;stat.median;em.opt.SDSS.r</quantity>
	[snMedian_r] [real] NOT NULL,

	--/ <summary>Median signal-to-noise over all good pixels in i-band</summary>
	--/ <quantity>stat.snr;stat.median;em.opt.SDSS.i</quantity>
	[snMedian_i] [real] NOT NULL,

	--/ <summary>Median signal-to-noise over all good pixels in z-band</summary>
	--/ <quantity>stat.snr;stat.median;em.opt.SDSS.z</quantity>
	[snMedian_z] [real] NOT NULL,

	--/ <summary>Median signal-to-noise over all good pixels</summary>
	--/ <quantity>stat.snr;stat.median</quantity>
	[snMedian] [real] NOT NULL,

	--/ <summary>68-th percentile value of abs(chi) of the best-fit synthetic spectrum to the actual spectrum (around 1.0 for a good fit)</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[chi68p] [real] NOT NULL,

	--/ <summary>Fraction of pixels deviant by more than 1 sigma relative to best-fit</summary>
	--/ <quantity>meta.number;instr.pixel;arith.ratio</quantity>
	[fracNSigma_1] [real] NOT NULL,

	--/ <summary>Fraction of pixels deviant by more than 2 sigma relative to best-fit</summary>
	--/ <quantity>meta.number;instr.pixel;arith.ratio</quantity>
	[fracNSigma_2] [real] NOT NULL,

	--/ <summary>Fraction of pixels deviant by more than 3 sigma relative to best-fit</summary>
	--/ <quantity>meta.number;instr.pixel;arith.ratio</quantity>
	[fracNSigma_3] [real] NOT NULL,

	--/ <summary>Fraction of pixels deviant by more than 4 sigma relative to best-fit</summary>
	--/ <quantity>meta.number;instr.pixel;arith.ratio</quantity>
	[fracNSigma_4] [real] NOT NULL,

	--/ <summary>Fraction of pixels deviant by more than 5 sigma relative to best-fit</summary>
	--/ <quantity>meta.number;instr.pixel;arith.ratio</quantity>
	[fracNSigma_5] [real] NOT NULL,

	--/ <summary>Fraction of pixels deviant by more than 6 sigma relative to best-fit</summary>
	--/ <quantity>meta.number;instr.pixel;arith.ratio</quantity>
	[fracNSigma_6] [real] NOT NULL,

	--/ <summary>Fraction of pixels deviant by more than 7 sigma relative to best-fit</summary>
	--/ <quantity>meta.number;instr.pixel;arith.ratio</quantity>
	[fracNSigma_7] [real] NOT NULL,

	--/ <summary>Fraction of pixels deviant by more than 8 sigma relative to best-fit</summary>
	--/ <quantity>meta.number;instr.pixel;arith.ratio</quantity>
	[fracNSigma_8] [real] NOT NULL,

	--/ <summary>Fraction of pixels deviant by more than 9 sigma relative to best-fit</summary>
	--/ <quantity>meta.number;instr.pixel;arith.ratio</quantity>
	[fracNSigma_9] [real] NOT NULL,

	--/ <summary>Fraction of pixels deviant by more than 10 sigma relative to best-fit</summary>
	--/ <quantity>meta.number;instr.pixel;arith.ratio</quantity>
	[fracNSigma_10] [real] NOT NULL,

	--/ <summary>Fraction of pixels high by more than 1 sigma relative to best-fit</summary>
	--/ <quantity>meta.number;instr.pixel;arith.ratio</quantity>
	[fracNSigHi_1] [real] NOT NULL,

	--/ <summary>Fraction of pixels high by more than 2 sigma relative to best-fit</summary>
	--/ <quantity>meta.number;instr.pixel;arith.ratio</quantity>
	[fracNSigHi_2] [real] NOT NULL,

	--/ <summary>Fraction of pixels high by more than 3 sigma relative to best-fit</summary>
	--/ <quantity>meta.number;instr.pixel;arith.ratio</quantity>
	[fracNSigHi_3] [real] NOT NULL,

	--/ <summary>Fraction of pixels high by more than 4 sigma relative to best-fit</summary>
	--/ <quantity>meta.number;instr.pixel;arith.ratio</quantity>
	[fracNSigHi_4] [real] NOT NULL,

	--/ <summary>Fraction of pixels high by more than 5 sigma relative to best-fit</summary>
	--/ <quantity>meta.number;instr.pixel;arith.ratio</quantity>
	[fracNSigHi_5] [real] NOT NULL,

	--/ <summary>Fraction of pixels high by more than 6 sigma relative to best-fit</summary>
	--/ <quantity>meta.number;instr.pixel;arith.ratio</quantity>
	[fracNSigHi_6] [real] NOT NULL,

	--/ <summary>Fraction of pixels high by more than 7 sigma relative to best-fit</summary>
	--/ <quantity>meta.number;instr.pixel;arith.ratio</quantity>
	[fracNSigHi_7] [real] NOT NULL,

	--/ <summary>Fraction of pixels high by more than 8 sigma relative to best-fit</summary>
	--/ <quantity>meta.number;instr.pixel;arith.ratio</quantity>
	[fracNSigHi_8] [real] NOT NULL,

	--/ <summary>Fraction of pixels high by more than 9 sigma relative to best-fit</summary>
	--/ <quantity>meta.number;instr.pixel;arith.ratio</quantity>
	[fracNSigHi_9] [real] NOT NULL,

	--/ <summary>Fraction of pixels high by more than 10 sigma relative to best-fit</summary>
	--/ <quantity>meta.number;instr.pixel;arith.ratio</quantity>
	[fracNSigHi_10] [real] NOT NULL,

	--/ <summary>Fraction of pixels low by more than 1 sigma relative to best-fit</summary>
	--/ <quantity>meta.number;instr.pixel;arith.ratio</quantity>
	[fracNSigLo_1] [real] NOT NULL,

	--/ <summary>Fraction of pixels low by more than 2 sigma relative to best-fit</summary>
	--/ <quantity>meta.number;instr.pixel;arith.ratio</quantity>
	[fracNSigLo_2] [real] NOT NULL,

	--/ <summary>Fraction of pixels low by more than 3 sigma relative to best-fit</summary>
	--/ <quantity>meta.number;instr.pixel;arith.ratio</quantity>
	[fracNSigLo_3] [real] NOT NULL,

	--/ <summary>Fraction of pixels low by more than 4 sigma relative to best-fit</summary>
	--/ <quantity>meta.number;instr.pixel;arith.ratio</quantity>
	[fracNSigLo_4] [real] NOT NULL,

	--/ <summary>Fraction of pixels low by more than 5 sigma relative to best-fit</summary>
	--/ <quantity>meta.number;instr.pixel;arith.ratio</quantity>
	[fracNSigLo_5] [real] NOT NULL,

	--/ <summary>Fraction of pixels low by more than 6 sigma relative to best-fit</summary>
	--/ <quantity>meta.number;instr.pixel;arith.ratio</quantity>
	[fracNSigLo_6] [real] NOT NULL,

	--/ <summary>Fraction of pixels low by more than 7 sigma relative to best-fit</summary>
	--/ <quantity>meta.number;instr.pixel;arith.ratio</quantity>
	[fracNSigLo_7] [real] NOT NULL,

	--/ <summary>Fraction of pixels low by more than 8 sigma relative to best-fit</summary>
	--/ <quantity>meta.number;instr.pixel;arith.ratio</quantity>
	[fracNSigLo_8] [real] NOT NULL,

	--/ <summary>Fraction of pixels low by more than 9 sigma relative to best-fit</summary>
	--/ <quantity>meta.number;instr.pixel;arith.ratio</quantity>
	[fracNSigLo_9] [real] NOT NULL,

	--/ <summary>Fraction of pixels low by more than 10 sigma relative to best-fit</summary>
	--/ <quantity>meta.number;instr.pixel;arith.ratio</quantity>
	[fracNSigLo_10] [real] NOT NULL,

	--/ <summary>Spectrum projected onto u filter</summary>
	--/ <quantity>phot.flux;em.opt.SDSS.u</quantity>
	--/ <unit>nmgy</unit>
	[spectroFlux_u] [real] NOT NULL,

	--/ <summary>Spectrum projected onto g filter</summary>
	--/ <quantity>phot.flux;em.opt.SDSS.g</quantity>
	--/ <unit>nmgy</unit>
	[spectroFlux_g] [real] NOT NULL,

	--/ <summary>Spectrum projected onto r filter</summary>
	--/ <quantity>phot.flux;em.opt.SDSS.r</quantity>
	--/ <unit>nmgy</unit>
	[spectroFlux_r] [real] NOT NULL,

	--/ <summary>Spectrum projected onto i filter</summary>
	--/ <quantity>phot.flux;em.opt.SDSS.i</quantity>
	--/ <unit>nmgy</unit>
	[spectroFlux_i] [real] NOT NULL,

	--/ <summary>Spectrum projected onto z filter</summary>
	--/ <quantity>phot.flux;em.opt.SDSS.z</quantity>
	--/ <unit>nmgy</unit>
	[spectroFlux_z] [real] NOT NULL,

	--/ <summary>Best-fit template spectrum projected onto u filter</summary>
	--/ <quantity>phot.flux;em.opt.SDSS.u</quantity>
	--/ <unit>nmgy</unit>
	[spectroSynFlux_u] [real] NOT NULL,

	--/ <summary>Best-fit template spectrum projected onto g filter</summary>
	--/ <quantity>phot.flux;em.opt.SDSS.g</quantity>
	--/ <unit>nmgy</unit>
	[spectroSynFlux_g] [real] NOT NULL,

	--/ <summary>Best-fit template spectrum projected onto r filter</summary>
	--/ <quantity>phot.flux;em.opt.SDSS.r</quantity>
	--/ <unit>nmgy</unit>
	[spectroSynFlux_r] [real] NOT NULL,

	--/ <summary>Best-fit template spectrum projected onto i filter</summary>
	--/ <quantity>phot.flux;em.opt.SDSS.i</quantity>
	--/ <unit>nmgy</unit>
	[spectroSynFlux_i] [real] NOT NULL,

	--/ <summary>Best-fit template spectrum projected onto z filter</summary>
	--/ <quantity>phot.flux;em.opt.SDSS.z</quantity>
	--/ <unit>nmgy</unit>
	[spectroSynFlux_z] [real] NOT NULL,

	--/ <summary>Inverse variance of spectrum projected onto u filter</summary>
	--/ <quantity>stat.variance;phot.flux;em.opt.SDSS.u</quantity>
	--/ <unit>nmgy-2</unit>
	[spectroFluxIvar_u] [real] NOT NULL,

	--/ <summary>Inverse variance of spectrum projected onto g filter</summary>
	--/ <quantity>stat.variance;phot.flux;em.opt.SDSS.g</quantity>
	--/ <unit>nmgy-2</unit>
	[spectroFluxIvar_g] [real] NOT NULL,

	--/ <summary>Inverse variance of spectrum projected onto r filter</summary>
	--/ <quantity>stat.variance;phot.flux;em.opt.SDSS.r</quantity>
	--/ <unit>nmgy-2</unit>
	[spectroFluxIvar_r] [real] NOT NULL,

	--/ <summary>Inverse variance of spectrum projected onto i filter</summary>
	--/ <quantity>stat.variance;phot.flux;em.opt.SDSS.i</quantity>
	--/ <unit>nmgy-2</unit>
	[spectroFluxIvar_i] [real] NOT NULL,

	--/ <summary>Inverse variance of spectrum projected onto z filter</summary>
	--/ <quantity>stat.variance;phot.flux;em.opt.SDSS.z</quantity>
	--/ <unit>nmgy-2</unit>
	[spectroFluxIvar_z] [real] NOT NULL,

	--/ <summary>Inverse variance of best-fit template spectrum projected onto u filter</summary>
	--/ <quantity>stat.variance;phot.flux;em.opt.SDSS.u</quantity>
	--/ <unit>nmgy-2</unit>
	[spectroSynFluxIvar_u] [real] NOT NULL,

	--/ <summary>Inverse variance of best-fit template spectrum projected onto g filter</summary>
	--/ <quantity>stat.variance;phot.flux;em.opt.SDSS.g</quantity>
	--/ <unit>nmgy-2</unit>
	[spectroSynFluxIvar_g] [real] NOT NULL,

	--/ <summary>Inverse variance of best-fit template spectrum projected onto r filter</summary>
	--/ <quantity>stat.variance;phot.flux;em.opt.SDSS.r</quantity>
	--/ <unit>nmgy-2</unit>
	[spectroSynFluxIvar_r] [real] NOT NULL,

	--/ <summary>Inverse variance of best-fit template spectrum projected onto i filter</summary>
	--/ <quantity>stat.variance;phot.flux;em.opt.SDSS.i</quantity>
	--/ <unit>nmgy-2</unit>
	[spectroSynFluxIvar_i] [real] NOT NULL,

	--/ <summary>Inverse variance of best-fit template spectrum projected onto z filter</summary>
	--/ <quantity>stat.variance;phot.flux;em.opt.SDSS.z</quantity>
	--/ <unit>nmgy-2</unit>
	[spectroSynFluxIvar_z] [real] NOT NULL,

	--/ <summary>Sky spectrum projected onto u filter</summary>
	--/ <quantity>phot.flux;em.opt.SDSS.u</quantity>
	--/ <unit>nmgy</unit>
	[spectroSkyFlux_u] [real] NOT NULL,

	--/ <summary>Sky spectrum projected onto g filter</summary>
	--/ <quantity>phot.flux;em.opt.SDSS.g</quantity>
	--/ <unit>nmgy</unit>
	[spectroSkyFlux_g] [real] NOT NULL,

	--/ <summary>Sky spectrum projected onto r filter</summary>
	--/ <quantity>phot.flux;em.opt.SDSS.r</quantity>
	--/ <unit>nmgy</unit>
	[spectroSkyFlux_r] [real] NOT NULL,

	--/ <summary>Sky spectrum projected onto i filter</summary>
	--/ <quantity>phot.flux;em.opt.SDSS.i</quantity>
	--/ <unit>nmgy</unit>
	[spectroSkyFlux_i] [real] NOT NULL,

	--/ <summary>Sky spectrum projected onto z filter</summary>
	--/ <quantity>phot.flux;em.opt.SDSS.z</quantity>
	--/ <unit>nmgy</unit>
	[spectroSkyFlux_z] [real] NOT NULL,

	--/ <summary>For each bit, records whether any pixel in the spectrum has that bit set in its ANDMASK</summary>
	--/ <quantity>meta.code</quantity>
	[anyAndMask] [int] NOT NULL,

	--/ <summary>For each bit, records whether any pixel in the spectrum has that bit set in its ORMASK</summary>
	--/ <quantity>meta.code</quantity>
	[anyOrMask] [int] NOT NULL,

	--/ <summary>Overall signal-to-noise-squared measure for plate (only set for SDSS spectrograph)</summary>
	--/ <quantity>stat.snr</quantity>
	[plateSN2] [real] NOT NULL,

	--/ <summary>Dereddened signal-to-noise-squared measure for plate (only set for BOSS spectrograph)</summary>
	--/ <quantity>stat.snr</quantity>
	[deredSN2] [real] NOT NULL,

	--/ <summary>Signal to noise measure for MS turnoff stars on plate (-9999 if not appropriate)</summary>
	--/ <quantity>stat.snr</quantity>
	[snTurnoff] [real] NOT NULL,

	--/ <summary>(S/N)^2 at g=20.20 for spectrograph #1</summary>
	--/ <quantity>stat.value;em.opt.SDSS.g</quantity>
	[sn1_g] [real] NOT NULL,

	--/ <summary>(S/N)^2 at r=20.25 for spectrograph #1</summary>
	--/ <quantity>stat.value;em.opt.SDSS.r</quantity>
	[sn1_r] [real] NOT NULL,

	--/ <summary>(S/N)^2 at i=19.90 for spectrograph #1</summary>
	--/ <quantity>stat.value;em.opt.SDSS.i</quantity>
	[sn1_i] [real] NOT NULL,

	--/ <summary>(S/N)^2 at g=20.20 for spectrograph #2</summary>
	--/ <quantity>stat.value;em.opt.SDSS.g</quantity>
	[sn2_g] [real] NOT NULL,

	--/ <summary>(S/N)^2 at r=20.25 for spectrograph #2</summary>
	--/ <quantity>stat.value;em.opt.SDSS.r</quantity>
	[sn2_r] [real] NOT NULL,

	--/ <summary>(S/N)^2 at i=19.90 for spectrograph #2</summary>
	--/ <quantity>stat.value;em.opt.SDSS.i</quantity>
	[sn2_i] [real] NOT NULL,

	--/ <summary>File name for best-fit Elodie star</summary>
	--/ <quantity>meta.id;meta.file</quantity>
	[elodieFileName] [varchar](32) NOT NULL,

	--/ <summary>Star name (mostly Henry Draper names)</summary>
	--/ <quantity>meta.id</quantity>
	[elodieObject] [varchar](32) NOT NULL,

	--/ <summary>Spectral type</summary>
	--/ <quantity>src.spType</quantity>
	[elodieSpType] [varchar](32) NOT NULL,

	--/ <summary>(B-V) color</summary>
	--/ <quantity>phot.color;em.opt.B;em.opt.V</quantity>
	--/ <unit>mag</unit>
	[elodieBV] [real] NOT NULL,

	--/ <summary>Effective temperature</summary>
	--/ <quantity>phys.temperature.effective</quantity>
	--/ <unit>K</unit>
	[elodieTEff] [real] NOT NULL,

	--/ <summary>log10(gravity)</summary>
	--/ <quantity>phys.gravity</quantity>
	[elodieLogG] [real] NOT NULL,

	--/ <summary>Metallicity ([Fe/H])</summary>
	--/ <quantity>phys.abund.Fe</quantity>
	[elodieFeH] [real] NOT NULL,

	--/ <summary>Redshift</summary>
	--/ <quantity>src.redshift</quantity>
	[elodieZ] [real] NOT NULL,

	--/ <summary>Redshift error (negative for invalid fit)</summary>
	--/ <quantity>stat.error;src.redshift</quantity>
	[elodieZErr] [real] NOT NULL,

	--/ <summary>Standard deviation in redshift among the 12 best-fit stars</summary>
	--/ <quantity>stat.stdev;src.redshift</quantity>
	[elodieZModelErr] [real] NOT NULL,

	--/ <summary>Reduced chi^2</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[elodieRChi2] [real] NOT NULL,

	--/ <summary>Degrees of freedom for fit</summary>
	--/ <quantity>stat.fit.dof</quantity>
	[elodieDOF] [real] NOT NULL,

	--/ <summary>20 deep Hierarchical Triangular Mesh ID</summary>
	--/ <quantity>pos.eq.HTM</quantity>
	[htmID] [bigint] NOT NULL,

	--/ <summary>Zone ID</summary>
	--/ <quantity>pos.eq.zone</quantity>
	[zoneID] [bigint] NOT NULL,

	--/ <summary>Load Version</summary>
	--/ <quantity>meta.version</quantity>
	[loadVersion] [int] NOT NULL,
	
	--[img] [varbinary](max) NOT NULL DEFAULT (0x1111),
 CONSTRAINT [pk_SpecObjAll_specObjID] PRIMARY KEY CLUSTERED 
(
	[specObjID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
-- TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[SpecPhotoAll]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

--/ <summary> The combined spectro and photo parameters of an object in SpecObjAll </summary>
--/ <remarks> This is a precomputed join between the PhotoObjAll and SpecObjAll tables.  The photo attibutes included cover about the same as PhotoTag.  The table also includes certain attributes from Tiles. </remarks>
CREATE TABLE [dbo].[SpecPhotoAll](

	--/ <summary>Unique ID</summary>
	--/ <quantity>meta.id</quantity>
	[specObjID] [bigint] NOT NULL,

	--/ <summary>MJD of observation</summary>
	--/ <quantity>time.epoch</quantity>
	--/ <unit>d</unit>
	[mjd] [int] NOT NULL,

	--/ <summary>Plate ID</summary>
	--/ <quantity>meta.id;instr.det</quantity>
	[plate] [smallint] NOT NULL,

	--/ <summary>Tile ID</summary>
	--/ <quantity>meta.id</quantity>
	[tile] [smallint] NOT NULL,

	--/ <summary>Fiber ID</summary>
	--/ <quantity>meta.ind;instr.param</quantity>
	[fiberID] [smallint] NOT NULL,

	--/ <summary>Final Redshift</summary>
	--/ <quantity>src.redshift</quantity>
	[z] [real] NOT NULL,

	--/ <summary>Redshift error</summary>
	--/ <quantity>stat.error;redshift</quantity>
	[zErr] [real] NOT NULL,

	--/ <summary>Spectroscopic class (GALAXY, QSO, or STAR)</summary>
	--/ <quantity>src.class</quantity>
	[class] [varchar](32) NOT NULL,

	--/ <summary>Spectroscopic subclass</summary>
	--/ <quantity>src.class</quantity>
	[subClass] [varchar](32) NOT NULL,

	--/ <summary>Warning Flags</summary>
	--/ <quantity>meta.code;src.redshift</quantity>
	[zWarning] [int] NOT NULL,

	--/ <summary>ra in J2000 from SpecObj</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[ra] [float] NOT NULL,

	--/ <summary>dec in J2000 from SpecObj</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[dec] [float] NOT NULL,

	--/ <summary>x of Normal unit vector in J2000</summary>
	--/ <quantity>pos.eq.x;pos.frame=j2000</quantity>
	[cx] [float] NOT NULL,

	--/ <summary>y of Normal unit vector in J2000</summary>
	--/ <quantity>pos.eq.y;pos.frame=j2000</quantity>
	[cy] [float] NOT NULL,

	--/ <summary>z of Normal unit vector in J2000</summary>
	--/ <quantity>pos.eq.z;pos.frame=j2000</quantity>
	[cz] [float] NOT NULL,

	--/ <summary>20 deep Hierarchical Triangular Mesh ID</summary>
	--/ <quantity>pos.eq.HTM;pos.frame=j2000</quantity>
	[htmID] [bigint] NOT NULL,

	--/ <summary>Zone ID</summary>
	--/ <quantity>pos.eq.zone</quantity>
	[zoneID] [bigint] NOT NULL,

	--/ <summary>Best version of spectrum at this location (defines default view SpecObj)</summary>
	--/ <quantity>meta.code</quantity>
	[sciencePrimary] [smallint] NOT NULL,

	--/ <summary>Best version of spectrum at this location, among Legacy plates</summary>
	--/ <quantity>meta.code</quantity>
	[legacyPrimary] [smallint] NOT NULL,

	--/ <summary>Best version of spectrum at this location, among SEGUE plates (defines default view SpecObj)</summary>
	--/ <quantity>meta.code</quantity>
	[seguePrimary] [smallint] NOT NULL,

	--/ <summary>Best version of spectrum at this location, among SEGUE-1 plates</summary>
	--/ <quantity>meta.code</quantity>
	[segue1Primary] [smallint] NOT NULL,

	--/ <summary>Best version of spectrum at this location, among SEGUE-2 plates</summary>
	--/ <quantity>meta.code</quantity>
	[segue2Primary] [smallint] NOT NULL,

	--/ <summary>Best version of spectrum at this location, among BOSS plates</summary>
	--/ <quantity>meta.code</quantity>
	[bossPrimary] [smallint] NOT NULL,

	--/ <summary>Best version of spectrum at this location among SDSS plates</summary>
	--/ <quantity>meta.code</quantity>
	[sdssPrimary] [smallint] NOT NULL,

	--/ <summary>Survey name</summary>
	--/ <quantity>mtea.id</quantity>
	[survey] [varchar](32) NOT NULL,

	--/ <summary>Program name</summary>
	--/ <quantity>meta.id</quantity>
	[programname] [varchar](32) NOT NULL,

	--/ <summary>for Legacy program, target selection information at plate design</summary>
	--/ <quantity>meta.code</quantity>
	[legacy_target1] [bigint] NOT NULL,

	--/ <summary>for Legacy program target selection information at plate design, secondary/qa/calibration</summary>
	--/ <quantity>meta.code</quantity>
	[legacy_target2] [bigint] NOT NULL,

	--/ <summary>for Special program target selection information at plate design</summary>
	--/ <quantity>meta.code</quantity>
	[special_target1] [bigint] NOT NULL,

	--/ <summary>for Special program target selection information at plate design, secondary/qa/calibration</summary>
	--/ <quantity>meta.code</quantity>
	[special_target2] [bigint] NOT NULL,

	--/ <summary>SEGUE-1 target selection information at plate design, primary science selection</summary>
	--/ <quantity>meta.code</quantity>
	[segue1_target1] [bigint] NOT NULL,

	--/ <summary>SEGUE-1 target selection information at plate design, secondary/qa/calib selection</summary>
	--/ <quantity>meta.code</quantity>
	[segue1_target2] [bigint] NOT NULL,

	--/ <summary>SEGUE-2 target selection information at plate design, primary science selection</summary>
	--/ <quantity>meta.code</quantity>
	[segue2_target1] [bigint] NOT NULL,

	--/ <summary>SEGUE-2 target selection information at plate design, secondary/qa/calib selection</summary>
	--/ <quantity>meta.code</quantity>
	[segue2_target2] [bigint] NOT NULL,

	--/ <summary>BOSS target selection information at plate</summary>
	--/ <quantity>meta.code</quantity>
	[boss_target1] [bigint] NOT NULL,

	--/ <summary>BOSS ancillary science target selection information at plate design</summary>
	--/ <quantity>meta.code</quantity>
	[ancillary_target1] [bigint] NOT NULL,

	--/ <summary>BOSS ancillary target selection information at plate design</summary>
	--/ <quantity>meta.code</quantity>
	[ancillary_target2] [bigint] NOT NULL,

	--/ <summary>Link to plate on which the spectrum was taken</summary>
	--/ <quantity>meta.id</quantity>
	[plateID] [bigint] NOT NULL,

	--/ <summary>type of object targeted as</summary>
	--/ <quantity>meta.note</quantity>
	[sourceType] [varchar](32) NOT NULL,

	--/ <summary>ID of target PhotoObj</summary>
	--/ <quantity>meta.id</quantity>
	[targetObjID] [bigint] NOT NULL,

	--/ <summary>Unique SDSS identifier composed from [skyVersion,rerun,run,camcol,field,obj].</summary>
	--/ <quantity>meta.id</quantity>
	[objID] [bigint] NULL,

	--/ <summary>0 = OPDB target, 1 = OPDB best</summary>
	--/ <quantity>meta.version</quantity>
	[skyVersion] [int] NULL,

	--/ <summary>Run number</summary>
	--/ <quantity>meta.id</quantity>
	[run] [int] NULL,

	--/ <summary>Rerun number</summary>
	--/ <quantity>meta.id</quantity>
	[rerun] [int] NULL,

	--/ <summary>Camera column</summary>
	--/ <quantity>meta.id;instr.det</quantity>
	[camcol] [int] NULL,

	--/ <summary>Field number</summary>
	--/ <quantity>meta.id;obs.field</quantity>
	[field] [int] NULL,

	--/ <summary>The object id within a field. Usually changes between reruns of the same field.</summary>
	--/ <quantity>meta.id</quantity>
	[obj] [int] NULL,

	--/ <summary>1: primary, 2: secondary, 3: family object.</summary>
	--/ <quantity>meta.code</quantity>
	[mode] [int] NULL,

	--/ <summary>Number of children if this is a deblened composite object. BRIGHT (in a flags sense) objects also have nchild==1, the non-BRIGHT sibling.</summary>
	--/ <quantity>meta.number</quantity>
	[nChild] [int] NULL,

	--/ <summary>Morphological type classification of the object.</summary>
	--/ <quantity>src.class</quantity>
	[type] [int] NULL,

	--/ <summary>Photo Object Attribute Flags</summary>
	--/ <quantity>meta.code</quantity>
	[flags] [bigint] NULL,

	--/ <summary>PSF flux</summary>
	--/ <quantity>phot.mag.psf;em.opt.SDSS.u</quantity>
	--/ <unit>mag</unit>
	[psfMag_u] [real] NULL,

	--/ <summary>PSF flux</summary>
	--/ <quantity>phot.mag.psf;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[psfMag_g] [real] NULL,

	--/ <summary>PSF flux</summary>
	--/ <quantity>phot.mag.psf;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[psfMag_r] [real] NULL,

	--/ <summary>PSF flux</summary>
	--/ <quantity>phot.mag.psf;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[psfMag_i] [real] NULL,

	--/ <summary>PSF flux</summary>
	--/ <quantity>phot.mag.psf;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[psfMag_z] [real] NULL,

	--/ <summary>PSF flux error</summary>
	--/ <quantity>stat.error;phot.mag.psf;em.opt.SDSS.u</quantity>
	--/ <unit>mag</unit>
	[psfMagErr_u] [real] NULL,

	--/ <summary>PSF flux error</summary>
	--/ <quantity>stat.error;phot.mag.psf;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[psfMagErr_g] [real] NULL,

	--/ <summary>PSF flux error</summary>
	--/ <quantity>stat.error;phot.mag.psf;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[psfMagErr_r] [real] NULL,

	--/ <summary>PSF flux error</summary>
	--/ <quantity>stat.error;phot.mag.psf;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[psfMagErr_i] [real] NULL,

	--/ <summary>PSF flux error</summary>
	--/ <quantity>stat.error;phot.mag.psf;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[psfMagErr_z] [real] NULL,

	--/ <summary>Flux in 3 arcsec diameter fiber radius</summary>
	--/ <quantity>phot.mag.fiber;em.opt.SDSS.u</quantity>
	--/ <unit>mag</unit>
	[fiberMag_u] [real] NULL,

	--/ <summary>Flux in 3 arcsec diameter fiber radius</summary>
	--/ <quantity>phot.mag.fiber;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[fiberMag_g] [real] NULL,

	--/ <summary>Flux in 3 arcsec diameter fiber radius</summary>
	--/ <quantity>phot.mag.fiber;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[fiberMag_r] [real] NULL,

	--/ <summary>Flux in 3 arcsec diameter fiber radius</summary>
	--/ <quantity>phot.mag.fiber;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[fiberMag_i] [real] NULL,

	--/ <summary>Flux in 3 arcsec diameter fiber radius</summary>
	--/ <quantity>phot.mag.fiber;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[fiberMag_z] [real] NULL,

	--/ <summary>Flux in 3 arcsec diameter fiber radius error</summary>
	--/ <quantity>stat.error;phot.mag.fiber;em.opt.SDSS.u</quantity>
	--/ <unit>mag</unit>
	[fiberMagErr_u] [real] NULL,

	--/ <summary>Flux in 3 arcsec diameter fiber radius error</summary>
	--/ <quantity>stat.error;phot.mag.fiber;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[fiberMagErr_g] [real] NULL,

	--/ <summary>Flux in 3 arcsec diameter fiber radius error</summary>
	--/ <quantity>stat.error;phot.mag.fiber;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[fiberMagErr_r] [real] NULL,

	--/ <summary>Flux in 3 arcsec diameter fiber radius error</summary>
	--/ <quantity>stat.error;phot.mag.fiber;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[fiberMagErr_i] [real] NULL,

	--/ <summary>Flux in 3 arcsec diameter fiber radius error</summary>
	--/ <quantity>stat.error;phot.mag.fiber;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[fiberMagErr_z] [real] NULL,

	--/ <summary>Petrosian flux</summary>
	--/ <quantity>phot.mag.petrosian;em.opt.SDSS.u</quantity>
	--/ <unit>mag</unit>
	[petroMag_u] [real] NULL,

	--/ <summary>Petrosian flux</summary>
	--/ <quantity>phot.mag.petrosian;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[petroMag_g] [real] NULL,

	--/ <summary>Petrosian flux</summary>
	--/ <quantity>phot.mag.petrosian;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[petroMag_r] [real] NULL,

	--/ <summary>Petrosian flux</summary>
	--/ <quantity>phot.mag.petrosian;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[petroMag_i] [real] NULL,

	--/ <summary>Petrosian flux</summary>
	--/ <quantity>phot.mag.petrosian;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[petroMag_z] [real] NULL,

	--/ <summary>Petrosian flux error</summary>
	--/ <quantity>stat.error;phot.mag.petrosian;em.opt.SDSS.u</quantity>
	--/ <unit>mag</unit>
	[petroMagErr_u] [real] NULL,

	--/ <summary>Petrosian flux error</summary>
	--/ <quantity>stat.error;phot.mag.petrosian;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[petroMagErr_g] [real] NULL,

	--/ <summary>Petrosian flux error</summary>
	--/ <quantity>stat.error;phot.mag.petrosian;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[petroMagErr_r] [real] NULL,

	--/ <summary>Petrosian flux error</summary>
	--/ <quantity>stat.error;phot.mag.petrosian;em.opt.SDSS.</quantity>
	--/ <unit>mag</unit>
	[petroMagErr_i] [real] NULL,

	--/ <summary>Petrosian flux error</summary>
	--/ <quantity>stat.error;phot.mag.petrosian;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[petroMagErr_z] [real] NULL,

	--/ <summary>better of DeV/Exp magnitude fit</summary>
	--/ <quantity>phot.mag;meta.modelled;em.opt.SDSS.u</quantity>
	--/ <unit>mag</unit>
	[modelMag_u] [real] NULL,

	--/ <summary>better of DeV/Exp magnitude fit</summary>
	--/ <quantity>phot.mag;meta.modelled;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[modelMag_g] [real] NULL,

	--/ <summary>better of DeV/Exp magnitude fit</summary>
	--/ <quantity>phot.mag;meta.modelled;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[modelMag_r] [real] NULL,

	--/ <summary>better of DeV/Exp magnitude fit</summary>
	--/ <quantity>phot.mag;meta.modelled;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[modelMag_i] [real] NULL,

	--/ <summary>better of DeV/Exp magnitude fit</summary>
	--/ <quantity>phot.mag;meta.modelled;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[modelMag_z] [real] NULL,

	--/ <summary>better of DeV/Exp magnitude fit error</summary>
	--/ <quantity>stat.error;phot.mag;meta.modelled;em.opt.SDSS.u</quantity>
	--/ <unit>mag</unit>
	[modelMagErr_u] [real] NULL,

	--/ <summary>better of DeV/Exp magnitude fit error</summary>
	--/ <quantity>stat.error;phot.mag;meta.modelled;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[modelMagErr_g] [real] NULL,

	--/ <summary>better of DeV/Exp magnitude fit error</summary>
	--/ <quantity>stat.error;phot.mag;meta.modelled;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[modelMagErr_r] [real] NULL,

	--/ <summary>better of DeV/Exp magnitude fit error</summary>
	--/ <quantity>stat.error;phot.mag;meta.modelled;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[modelMagErr_i] [real] NULL,

	--/ <summary>better of DeV/Exp magnitude fit error</summary>
	--/ <quantity>stat.error;phot.mag;meta.modelled;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[modelMagErr_z] [real] NULL,

	--/ <summary>DeV+Exp magnitude</summary>
	--/ <quantity>phot.mag;meta.modelled;em.opt.SDSS.u</quantity>
	--/ <unit>mag</unit>
	[cModelMag_u] [real] NULL,

	--/ <summary>DeV+Exp magnitude</summary>
	--/ <quantity>phot.mag;meta.modelled;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[cModelMag_g] [real] NULL,

	--/ <summary>DeV+Exp magnitude</summary>
	--/ <quantity>phot.mag;meta.modelled;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[cModelMag_r] [real] NULL,

	--/ <summary>DeV+Exp magnitude</summary>
	--/ <quantity>phot.mag;meta.modelled;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[cModelMag_i] [real] NULL,

	--/ <summary>DeV+Exp magnitude</summary>
	--/ <quantity>phot.mag;meta.modelled;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[cModelMag_z] [real] NULL,

	--/ <summary>DeV+Exp magnitude error</summary>
	--/ <quantity>stat.error;phot.mag;meta.modelled;em.opt.SDSS.u</quantity>
	--/ <unit>mag</unit>
	[cModelMagErr_u] [real] NULL,

	--/ <summary>DeV+Exp magnitude error</summary>
	--/ <quantity>stat.error;phot.mag;meta.modelled;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[cModelMagErr_g] [real] NULL,

	--/ <summary>DeV+Exp magnitude error</summary>
	--/ <quantity>stat.error;phot.mag;meta.modelled;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[cModelMagErr_r] [real] NULL,

	--/ <summary>DeV+Exp magnitude error</summary>
	--/ <quantity>stat.error;phot.mag;meta.modelled;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[cModelMagErr_i] [real] NULL,

	--/ <summary>DeV+Exp magnitude error</summary>
	--/ <quantity>stat.error;phot.mag;meta.modelled;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[cModelMagErr_z] [real] NULL,

	--/ <summary>Adaptive (&lt;r^2&gt; + &lt;c^2&gt;)</summary>
	--/ <quantity>instr.param</quantity>
	[mRrCc_r] [real] NULL,

	--/ <summary>Error in adaptive (&lt;r^2&gt; + &lt;c^2&gt;)</summary>
	--/ <quantity>stat.error;instr.param</quantity>
	[mRrCcErr_r] [real] NULL,

	--/ <summary>Quality of field (0-1)</summary>
	--/ <quantity>meta.code.qual;obs.field</quantity>
	[score] [real] NULL,

	--/ <summary>Resolve status of object</summary>
	--/ <quantity>meta.code.status</quantity>
	[resolveStatus] [int] NULL,

	--/ <summary>Calibration status in u-band</summary>
	--/ <quantity>meta.code.status;obs.calib;em.opt.SDSS.u</quantity>
	[calibStatus_u] [int] NULL,

	--/ <summary>Calibration status in g-band</summary>
	--/ <quantity>meta.code.status;obs.calib;em.opt.SDSS.g</quantity>
	[calibStatus_g] [int] NULL,

	--/ <summary>Calibration status in r-band</summary>
	--/ <quantity>meta.code.status;obs.calib;em.opt.SDSS.r</quantity>
	[calibStatus_r] [int] NULL,

	--/ <summary>Calibration status in i-band</summary>
	--/ <quantity>meta.code.status;obs.calib;em.opt.SDSS.i</quantity>
	[calibStatus_i] [int] NULL,

	--/ <summary>Calibration status in z-band</summary>
	--/ <quantity>meta.code.status;obs.calib;em.opt.SDSS.z</quantity>
	[calibStatus_z] [int] NULL,

	--/ <summary>J2000 right ascension (r') from Best</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[photoRa] [float] NULL,

	--/ <summary>J2000 declination (r') from Best</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[photoDec] [float] NULL,

	--/ <summary>Reddening in each filter</summary>
	--/ <quantity>phys.absorption.gal;em.opt.SDSS.u</quantity>
	--/ <unit>mag</unit>
	[extinction_u] [real] NULL,

	--/ <summary>Reddening in each filter</summary>
	--/ <quantity>phys.absorption.gal;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[extinction_g] [real] NULL,

	--/ <summary>Reddening in each filter</summary>
	--/ <quantity>phys.absorption.gal;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[extinction_r] [real] NULL,

	--/ <summary>Reddening in each filter</summary>
	--/ <quantity>phys.absorption.gal;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[extinction_i] [real] NULL,

	--/ <summary>Reddening in each filter</summary>
	--/ <quantity>phys.absorption.gal;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[extinction_z] [real] NULL,

	--/ <summary>Link to the field this object is in</summary>
	--/ <quantity>meta.id;obs.field</quantity>
	[fieldID] [bigint] NULL,

	--/ <summary>Simplified mag, corrected for reddening: modelMag-reddening</summary>
	--/ <quantity>phot.mag.reddFree;em.opt.SDSS.u</quantity>
	--/ <unit>mag</unit>
	[dered_u] [real] NULL,

	--/ <summary>Simplified mag, corrected for reddening: modelMag-reddening</summary>
	--/ <quantity>phot.mag.reddFree;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[dered_g] [real] NULL,

	--/ <summary>Simplified mag, corrected for reddening: modelMag-reddening</summary>
	--/ <quantity>phot.mag.reddFree;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[dered_r] [real] NULL,

	--/ <summary>Simplified mag, corrected for reddening: modelMag-reddening</summary>
	--/ <quantity>phot.mag.reddFree;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[dered_i] [real] NULL,

	--/ <summary>Simplified mag, corrected for reddening: modelMag-reddening</summary>
	--/ <quantity>phot.mag.reddFree;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[dered_z] [real] NULL,
 CONSTRAINT [pk_SpecPhotoAll_specObjID] PRIMARY KEY CLUSTERED 
(
	[specObjID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[sppLines]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

--/ <summary> Contains outputs from the SEGUE Stellar Parameter Pipeline (SSPP). </summary>
--/ <remarks> Spectra for over 500,000 Galactic stars of all common spectral types are  available with DR8. These Spectra were processed with a pipeline called the  SEGUE Stellar Parameter Pipeline (SSPP, Lee et al. 2008) that computes line indices for a wide  range of common features at the radial velocity of the star in  question. Note that the line indices for TiO5, TiO8, CaH1, CaH2, and CaH3 are calculated following  the prescription given by the Hammer program (Covey et al. 2007). UVCN and BLCN line indices are computed  by he equations given in Smith &amp; Norris (1982), and FeI_4 and FeI_5 indices by the recipe in Friel (1987).  FeI_1, FeI_2, FeI_3, and SrII line indices are only computed from the local continuum.  Thus, these line indices calculated from different methods report the same values for both the local continuum and  the global continuum. These outputs are stored in this table, and indexed on the   specObjID key index parameter for queries joining to other   tables such as specobjall and photoobjall.  See the Sample Queries in  SkyServer for examples of such queries. </remarks>
CREATE TABLE [dbo].[sppLines](

	--/ <summary>id number</summary>
	--/ <quantity>meta.id</quantity>
	[SPECOBJID] [bigint] NOT NULL,

	--/ <summary>Object ID of photoObj match (flux-based)</summary>
	--/ <quantity>meta.id</quantity>
	[bestObjID] [bigint] NOT NULL,

	--/ <summary>targeted object ID</summary>
	--/ <quantity>meta.id</quantity>
	[TARGETOBJID] [bigint] NOT NULL,

	--/ <summary>Best version of spectrum at this location (defines default view SpecObj)</summary>
	--/ <quantity>meta.code</quantity>
	[sciencePrimary] [smallint] NOT NULL,

	--/ <summary>Best version of spectrum at this location, among Legacy plates</summary>
	--/ <quantity>meta.code</quantity>
	[legacyPrimary] [smallint] NOT NULL,

	--/ <summary>Best version of spectrum at this location, among SEGUE plates (defines default view SpecObj)</summary>
	--/ <quantity>meta.code</quantity>
	[seguePrimary] [smallint] NOT NULL,

	--/ <summary>Plate number</summary>
	--/ <quantity>meta.id;instr.det</quantity>
	[PLATE] [bigint] NOT NULL,

	--/ <summary>Modified Julian Date</summary>
	--/ <quantity>time.epoch</quantity>
	[MJD] [bigint] NOT NULL,

	--/ <summary>Fiber ID</summary>
	--/ <quantity>meta.id;instr.param</quantity>
	[FIBER] [bigint] NOT NULL,

	--/ <summary>Name of 2D rerun</summary>
	--/ <quantity>meta.id</quantity>
	[RUN2D] [varchar](32) NOT NULL,

	--/ <summary>Name of 1D rerun</summary>
	--/ <quantity>meta.id</quantity>
	[RUN1D] [varchar](32) NOT NULL,

	--/ <summary>Name of SSPP rerun</summary>
	--/ <quantity>meta.id</quantity>
	[RUNSSPP] [varchar](32) NOT NULL,

	--/ <summary>Hzeta line index from local continuum at 3889.0 with band widths of 3.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[H83side] [real] NOT NULL,

	--/ <summary>Hzeta line index from global continuum at 3889.0 with band widths of 3.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[H83cont] [real] NOT NULL,

	--/ <summary>Hzeta line index error in the lind band at 3889.0 with band widths of 3.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[H83err] [real] NOT NULL,

	--/ <summary>Hzeta pixel quality check, =0 good, =1 bad at 3889.0 with band widths of 3.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[H83mask] [tinyint] NOT NULL,

	--/ <summary>Hzeta line index from local continuum at 3889.1 with band widths of 12.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[H812side] [real] NOT NULL,

	--/ <summary>Hzeta line index from global continuum at 3889.1 with band widths of 12.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[H812cont] [real] NOT NULL,

	--/ <summary>Hzeta line index error in the lind band at 3889.1 with band widths of 12.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[H812err] [real] NOT NULL,

	--/ <summary>Hzeta pixel quality check, =0 good, =1 bad at 3889.1 with band widths of 12.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[H812mask] [tinyint] NOT NULL,

	--/ <summary>Hzeta line index from local continuum at 3889.1 with band widths of 24.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[H824side] [real] NOT NULL,

	--/ <summary>Hzeta line index from global continuum at 3889.1 with band widths of 24.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[H824cont] [real] NOT NULL,

	--/ <summary>Hzeta line index error in the lind band at 3889.1 with band widths of 24.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[H824err] [real] NOT NULL,

	--/ <summary>Hzeta pixel quality check, =0 good, =1 bad at 3889.1 with band widths of 24.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[H824mask] [tinyint] NOT NULL,

	--/ <summary>Hzeta line index from local continuum at 3889.1 with band widths of 48.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[H848side] [real] NOT NULL,

	--/ <summary>Hzeta line index from global continuum at 3889.1 with band widths of 48.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[H848cont] [real] NOT NULL,

	--/ <summary>Hzeta line index error in the lind band at 3889.1 with band widths of 48.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[H848err] [real] NOT NULL,

	--/ <summary>Hzeta pixel quality check, =0 good, =1 bad at 3889.1 with band widths of 48.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[H848mask] [tinyint] NOT NULL,

	--/ <summary>Ca II K line index from local continuum at 3933.7 with band widths of 12.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[KP12side] [real] NOT NULL,

	--/ <summary>Ca II K line index from global continuum at 3933.7 with band widths of 12.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[KP12cont] [real] NOT NULL,

	--/ <summary>Ca II K line index error in the lind band at 3933.7 with band widths of 12.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[KP12err] [real] NOT NULL,

	--/ <summary>Ca II K pixel quality check, =0 good, =1 bad at 3933.7 with band widths of 12.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[KP12mask] [tinyint] NOT NULL,

	--/ <summary>Ca II K line index from local continuum at 3933.7 with band widths of 18.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[KP18side] [real] NOT NULL,

	--/ <summary>Ca II K line index from global continuum at 3933.7 with band widths of 18.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[KP18cont] [real] NOT NULL,

	--/ <summary>Ca II K line index error in the lind band at 3933.7 with band widths of 18.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[KP18err] [real] NOT NULL,

	--/ <summary>Ca II K pixel quality check =0, good, =1 bad at 3933.7 with band widths of 18.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[KP18mask] [tinyint] NOT NULL,

	--/ <summary>Ca II K line index from local continuum at 3933.7 with band widths of 6.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[KP6side] [real] NOT NULL,

	--/ <summary>Ca II K line index from global continuum at 3933.7 with band widths of 6.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[KP6cont] [real] NOT NULL,

	--/ <summary>Ca II K line index error in the lind band at 3933.7 with band widths of 6.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[KP6err] [real] NOT NULL,

	--/ <summary>Ca II K pixel quality check =0, good, =1 bad at 3933.7 with band widths of 6.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[KP6mask] [tinyint] NOT NULL,

	--/ <summary>Ca II K line index from local continuum at 3933.6 with band widths of 30.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[CaIIKside] [real] NOT NULL,

	--/ <summary>Ca II K line index from global continuum at 3933.6 with band widths of 30.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[CaIIKcont] [real] NOT NULL,

	--/ <summary>Ca II K line index error in the lind band at 3933.6 with band widths of 30.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[CaIIKerr] [real] NOT NULL,

	--/ <summary>Ca II K pixel quality check =0, good, =1 bad at 3933.6 with band widths of 30.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[CaIIKmask] [tinyint] NOT NULL,

	--/ <summary>Ca II H and K line index from local continuum at 3962.0 with band widths of 75.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[CaIIHKside] [real] NOT NULL,

	--/ <summary>Ca II H and K line index from global continuum at 3962.0 with band widths of 75.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[CaIIHKcont] [real] NOT NULL,

	--/ <summary>Ca II H and K line index error in the lind band at 3962.0 with band widths of 75.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[CaIIHKerr] [real] NOT NULL,

	--/ <summary>Ca II H and K pixel quality check =0, good, =1 bad at 3962.0 with band widths of 75.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[CaIIHKmask] [tinyint] NOT NULL,

	--/ <summary>Hepsilon line index from local continuum at 3970.0 with band widths of 50.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Hepsside] [real] NOT NULL,

	--/ <summary>Hepsilon line index from global continuum at 3970.0 with band widths of 50.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Hepscont] [real] NOT NULL,

	--/ <summary>Hepsilon line index error in the lind band at 3970.0 with band widths of 50.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Hepserr] [real] NOT NULL,

	--/ <summary>Hepsilon pixel quality check =0, good, =1 bad at 3970.0 with band widths of 50.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[Hepsmask] [tinyint] NOT NULL,

	--/ <summary>Ca II K line index from local continuum at 3933.7 with band widths of 16.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[KP16side] [real] NOT NULL,

	--/ <summary>Ca II K line index from global continuum at 3933.7 with band widths of 16.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[KP16cont] [real] NOT NULL,

	--/ <summary>Ca II K line index error in the lind band at 3933.7 with band widths of 16.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[KP16err] [real] NOT NULL,

	--/ <summary>Ca II K pixel quality check =0, good, =1 bad at 3933.7 with band widths of 16.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[KP16mask] [tinyint] NOT NULL,

	--/ <summary>Sr II line index from local continuum at 4077.0 with band widths of 8.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[SrII1side] [real] NOT NULL,

	--/ <summary>Sr II line index from global continuum at 4077.0 with band widths of 8.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[SrII1cont] [real] NOT NULL,

	--/ <summary>Sr II line index error in the lind band at 4077.0 with band widths of 8.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[SrII1err] [real] NOT NULL,

	--/ <summary>Sr II pixel quality check =0, good, =1 bad at 4077.0 with band widths of 8.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[SrII1mask] [tinyint] NOT NULL,

	--/ <summary>He I line index from local continuum at 4026.2 with band widths of 12.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[HeI121side] [real] NOT NULL,

	--/ <summary>He I line index from global continuum at 4026.2 with band widths of 12.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[HeI121cont] [real] NOT NULL,

	--/ <summary>He I line index error in the lind band at 4026.2 with band widths of 12.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[HeI121err] [real] NOT NULL,

	--/ <summary>He I pixel quality check =0, good, =1 bad at 4026.2 with band widths of 12.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[HeI121mask] [tinyint] NOT NULL,

	--/ <summary>Hdelta line index from local continuum at 4101.8 with band widths of 12.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Hdelta12side] [real] NOT NULL,

	--/ <summary>Hdelta line index from global continuum at 4101.8 with band widths of 12.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Hdelta12cont] [real] NOT NULL,

	--/ <summary>Hdelta line index error in the lind band at 4101.8 with band widths of 12.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Hdelta12err] [real] NOT NULL,

	--/ <summary>Hdelta pixel quality check =0, good, =1 bad at 4101.8 with band widths of 12.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[Hdelta12mask] [tinyint] NOT NULL,

	--/ <summary>Hdelta line index from local continuum at 4101.8 with band widths of 24.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Hdelta24side] [real] NOT NULL,

	--/ <summary>Hdelta line index from global continuum at 4101.8 with band widths of 24.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Hdelta24cont] [real] NOT NULL,

	--/ <summary>Hdelta line index error in the lind band at 4101.8 with band widths of 24.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Hdelta24err] [real] NOT NULL,

	--/ <summary>Hdelta pixel quality check =0, good, =1 bad at 4101.8 with band widths of 24.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[Hdelta24mask] [tinyint] NOT NULL,

	--/ <summary>Hdelta line index from local continuum at 4101.8 with band widths of 48.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Hdelta48side] [real] NOT NULL,

	--/ <summary>Hdelta line index from global continuum at 4101.8 with band widths of 48.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Hdelta48cont] [real] NOT NULL,

	--/ <summary>Hdelta line index error in the lind band at 4101.8 with band widths of 48.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Hdelta48err] [real] NOT NULL,

	--/ <summary>Hdelta pixel quality check =0, good, =1 bad at 4101.8 with band widths of 48.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[Hdelta48mask] [tinyint] NOT NULL,

	--/ <summary>Hdelta line index from local continuum at 4102.0 with band widths of 64.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Hdeltaside] [real] NOT NULL,

	--/ <summary>Hdelta line index from global continuum at 4102.0 with band widths of 64.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Hdeltacont] [real] NOT NULL,

	--/ <summary>Hdelta line index error in the lind band at 4102.0 with band widths of 64.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Hdeltaerr] [real] NOT NULL,

	--/ <summary>Hdelta pixel quality check =0, good, =1 bad at 4102.0 with band widths of 64.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[Hdeltamask] [tinyint] NOT NULL,

	--/ <summary>Ca I line index from local continuum at 4226.0 with band widths of 4.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[CaI4side] [real] NOT NULL,

	--/ <summary>Ca I line index from global continuum at 4226.0 with band widths of 4.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[CaI4cont] [real] NOT NULL,

	--/ <summary>Ca I line index error in the lind band at 4226.0 with band widths of 4.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[CaI4err] [real] NOT NULL,

	--/ <summary>Ca I pixel quality check =0, good, =1 bad at 4226.0 with band widths of 4.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[CaI4mask] [tinyint] NOT NULL,

	--/ <summary>Ca I line index from local continuum at 4226.7 with band widths of 12.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[CaI12side] [real] NOT NULL,

	--/ <summary>Ca I line index from global continuum at 4226.7 with band widths of 12.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[CaI12cont] [real] NOT NULL,

	--/ <summary>Ca I line index error in the lind band at 4226.7 with band widths of 12.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[CaI12err] [real] NOT NULL,

	--/ <summary>Ca I pixel quality check =0, good, =1 bad at 4226.7 with band widths of 12.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[CaI12mask] [tinyint] NOT NULL,

	--/ <summary>Ca I line index from local continuum at 4226.7 with band widths of 24.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[CaI24side] [real] NOT NULL,

	--/ <summary>Ca I line index from global continuum at 4226.7 with band widths of 24.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[CaI24cont] [real] NOT NULL,

	--/ <summary>Ca I line index error in the lind band at 4226.7 with band widths of 24.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[CaI24err] [real] NOT NULL,

	--/ <summary>Ca I pixel quality check =0, good, =1 bad at 4226.7 with band widths of 24.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[CaI24mask] [tinyint] NOT NULL,

	--/ <summary>Ca I line index from local continuum at 4226.7 with band widths of 6.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[CaI6side] [real] NOT NULL,

	--/ <summary>Ca I line index from global continuum at 4226.7 with band widths of 6.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[CaI6cont] [real] NOT NULL,

	--/ <summary>Ca I line index error in the lind band at 4226.7 with band widths of 6.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[CaI6err] [real] NOT NULL,

	--/ <summary>Ca I pixel quality check =0, good, =1 bad at 4226.7 with band widths of 6.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[CaI6mask] [tinyint] NOT NULL,

	--/ <summary>G band line index from local continuum at 4305.0 with band widths of 15.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Gside] [real] NOT NULL,

	--/ <summary>G band line index from global continuum at 4305.0 with band widths of 15.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Gcont] [real] NOT NULL,

	--/ <summary>G band line index error in the lind band at 4305.0 with band widths of 15.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Gerr] [real] NOT NULL,

	--/ <summary>G band pixel quality check =0, good, =1 bad at 4305.0 with band widths of 15.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[Gmask] [tinyint] NOT NULL,

	--/ <summary>Hgamma line index from local continuum at 4340.5 with band widths of 12.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Hgamma12side] [real] NOT NULL,

	--/ <summary>Hgamma line index from global continuum at 4340.5 with band widths of 12.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Hgamma12cont] [real] NOT NULL,

	--/ <summary>Hgamma line index error in the lind band at 4340.5 with band widths of 12.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Hgamma12err] [real] NOT NULL,

	--/ <summary>Hgamma pixel quality check =0, good, =1 bad at 4340.5 with band widths of 12.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[Hgamma12mask] [tinyint] NOT NULL,

	--/ <summary>Hgamma line index from local continuum at 4340.5 with band widths of 24.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Hgamma24side] [real] NOT NULL,

	--/ <summary>Hgamma line index from global continuum at 4340.5 with band widths of 24.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Hgamma24cont] [real] NOT NULL,

	--/ <summary>Hgamma line index error in the lind band at 4340.5 with band widths of 24.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Hgamma24err] [real] NOT NULL,

	--/ <summary>Hgamma pixel quality check =0, good, =1 bad at 4340.5 with band widths of 24.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[Hgamma24mask] [tinyint] NOT NULL,

	--/ <summary>Hgamma line index from local continuum at 4340.5 with band widths of 48.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Hgamma48side] [real] NOT NULL,

	--/ <summary>Hgamma line index from global continuum at 4340.5 with band widths of 48.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Hgamma48cont] [real] NOT NULL,

	--/ <summary>Hgamma line index error in the lind band at 4340.5 with band widths of 48.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Hgamma48err] [real] NOT NULL,

	--/ <summary>Hgamma pixel quality check =0, good, =1 bad at 4340.5 with band widths of 48.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[Hgamma48mask] [tinyint] NOT NULL,

	--/ <summary>Hgamma line index from local continuum at 4340.5 with band widths of 54.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Hgammaside] [real] NOT NULL,

	--/ <summary>Hgamma line index from global continuum at 4340.5 with band widths of 54.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Hgammacont] [real] NOT NULL,

	--/ <summary>Hgamma line index error in the lind band at 4340.5 with band widths of 54.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Hgammaerr] [real] NOT NULL,

	--/ <summary>Hgamma pixel quality check =0, good, =1 bad at 4340.5 with band widths of 54.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[Hgammamask] [tinyint] NOT NULL,

	--/ <summary>He I line index from local continuum at 4471.7 with band widths of 12.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[HeI122side] [real] NOT NULL,

	--/ <summary>He I line index from global continuum at 4471.7 with band widths of 12.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[HeI122cont] [real] NOT NULL,

	--/ <summary>He I line index error in the lind band at 4471.7 with band widths of 12.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[HeI122err] [real] NOT NULL,

	--/ <summary>He I pixel quality check =0, good, =1 bad at 4471.7 with band widths of 12.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[HeI122mask] [tinyint] NOT NULL,

	--/ <summary>G band line index from local continuum at 4305.0 with band widths of 26.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Gblueside] [real] NOT NULL,

	--/ <summary>G band line index from global continuum at 4305.0 with band widths of 26.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Gbluecont] [real] NOT NULL,

	--/ <summary>G band line index error in the lind band at 4305.0 with band widths of 26.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Gblueerr] [real] NOT NULL,

	--/ <summary>G band pixel quality check =0, good, =1 bad at 4305.0 with band widths of 26.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[Gbluemask] [tinyint] NOT NULL,

	--/ <summary>G band line index from local continuum at 4321.0 with band widths of 28.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Gwholeside] [real] NOT NULL,

	--/ <summary>G band line index from global continuum at 4321.0 with band widths of 28.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Gwholecont] [real] NOT NULL,

	--/ <summary>G band line index error in the lind band at 4321.0 with band widths of 28.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Gwholeerr] [real] NOT NULL,

	--/ <summary>G band pixel quality check =0, good, =1 bad at 4321.0 with band widths of 28.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[Gwholemask] [tinyint] NOT NULL,

	--/ <summary>Ba line index from local continuum at 4554.0 with band widths of 6.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Baside] [real] NOT NULL,

	--/ <summary>Ba line index from global continuum at 4554.0 with band widths of 6.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Bacont] [real] NOT NULL,

	--/ <summary>Ba line index error in the lind band at 4554.0 with band widths of 6.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Baerr] [real] NOT NULL,

	--/ <summary>Ba pixel quality check =0, good, =1 bad at 4554.0 with band widths of 6.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[Bamask] [tinyint] NOT NULL,

	--/ <summary>C12C13 band line index from local continuum at 4737.0 with band widths of 36.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[C12C13side] [real] NOT NULL,

	--/ <summary>C12C13 band line index from global continuum at 4737.0 with band widths of 36.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[C12C13cont] [real] NOT NULL,

	--/ <summary>C12C13 band line index error in the lind band at 4737.0 with band widths of 36.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[C12C13err] [real] NOT NULL,

	--/ <summary>C12C13 band pixel quality check =0, good, =1 bad at 4737.0 with band widths of 36.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[C12C13mask] [tinyint] NOT NULL,

	--/ <summary>C2 band line index from local continuum at 4618.0 with band widths of 256.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[CC12side] [real] NOT NULL,

	--/ <summary>C2 band line index from global continuum at 4618.0 with band widths of 256.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[CC12cont] [real] NOT NULL,

	--/ <summary>C2 band line index error in the lind band at 4618.0 with band widths of 256.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[CC12err] [real] NOT NULL,

	--/ <summary>C2 band pixel quality check =0, good, =1 bad at 4618.0 with band widths of 256.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[CC12mask] [tinyint] NOT NULL,

	--/ <summary>Metallic line index from local continuum at 4584.0 with band widths of 442.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[metal1side] [real] NOT NULL,

	--/ <summary>Metallic line index from global continuum at 4584.0 with band widths of 442.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[metal1cont] [real] NOT NULL,

	--/ <summary>Metlllic line index error in the lind band at 4584.0 with band widths of 442.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[metal1err] [real] NOT NULL,

	--/ <summary>Metal1ic pixel quality check =0, good, =1 bad at 4584.0 with band widths of 442.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[metal1mask] [tinyint] NOT NULL,

	--/ <summary>Hbeta line index from local continuum at 4862.3 with band widths of 12.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Hbeta12side] [real] NOT NULL,

	--/ <summary>Hbeta line index from global continuum at 4862.3 with band widths of 12.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Hbeta12cont] [real] NOT NULL,

	--/ <summary>Hbeta line index error in the lind band at 4862.3 with band widths of 12.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Hbeta12err] [real] NOT NULL,

	--/ <summary>Hbeta pixel quality check =0, good, =1 bad at 4862.3 with band widths of 12.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[Hbeta12mask] [tinyint] NOT NULL,

	--/ <summary>Hbeta line index from local continuum at 4862.3 with band widths of 24.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Hbeta24side] [real] NOT NULL,

	--/ <summary>Hbeta line index from global continuum at 4862.3 with band widths of 24.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Hbeta24cont] [real] NOT NULL,

	--/ <summary>Hbeta line index error in the lind band at 4862.3 with band widths of 24.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Hbeta24err] [real] NOT NULL,

	--/ <summary>Hbeta pixel quality check =0, good, =1 bad at 4862.3 with band widths of 24.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[Hbeta24mask] [tinyint] NOT NULL,

	--/ <summary>Hbeta line index from local continuum at 4862.3 with band widths of 48.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Hbeta48side] [real] NOT NULL,

	--/ <summary>Hbeta line index from global continuum at 4862.3 with band widths of 48.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Hbeta48cont] [real] NOT NULL,

	--/ <summary>Hbeta line index error in the lind band at 4862.3 with band widths of 48.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Hbeta48err] [real] NOT NULL,

	--/ <summary>Hbeta pixel quality check =0, good, =1 bad at 4862.3 with band widths of 48.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[Hbeta48mask] [tinyint] NOT NULL,

	--/ <summary>Hbeta line index from local continuum at 4862.3 with band widths of 60.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Hbetaside] [real] NOT NULL,

	--/ <summary>Hbeta line index from global continuum at 4862.3 with band widths of 60.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Hbetacont] [real] NOT NULL,

	--/ <summary>Hbeta line index error in the lind band at 4862.3 with band widths of 60.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Hbetaerr] [real] NOT NULL,

	--/ <summary>Hbeta pixel quality check =0, good, =1 bad at 4862.3 with band widths of 60.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[Hbetamask] [tinyint] NOT NULL,

	--/ <summary>C2 band line index from local continuum at 5052.0 with band widths of 204.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[C2side] [real] NOT NULL,

	--/ <summary>C2 band line index from global continuum at 5052.0 with band widths of 204.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[C2cont] [real] NOT NULL,

	--/ <summary>C2 band line index error in the lind band at 5052.0 with band widths of 204.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[C2err] [real] NOT NULL,

	--/ <summary>C2 band pixel quality check =0, good, =1 bad at 5052.0 with band widths of 204.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[C2mask] [tinyint] NOT NULL,

	--/ <summary>C2 and Mg I line index from local continuum at 5069.0 with band widths of 238.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[C2MgIside] [real] NOT NULL,

	--/ <summary>C2 and Mg I line index from global continuum at 5069.0 with band widths of 238.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[C2MgIcont] [real] NOT NULL,

	--/ <summary>C2 and Mg I line index error in the lind band at 5069.0 with band widths of 238.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[C2MgIerr] [real] NOT NULL,

	--/ <summary>C2 and Mg I pixel quality check =0, good, =1 bad at 5069.0 with band widths of 238.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[C2MgImask] [tinyint] NOT NULL,

	--/ <summary>MgH, Mg I, and C2 line index from local continuum at 5085.0 with band widths of 270.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[MgHMgIC2side] [real] NOT NULL,

	--/ <summary>MgH, Mg I, and C2 line index from global continuum at 5085.0 with band widths of 270.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[MgHMgIC2cont] [real] NOT NULL,

	--/ <summary>MgH, Mg I, and C2 line index error in the lind band at 5085.0 with band widths of 270.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[MgHMgIC2err] [real] NOT NULL,

	--/ <summary>MgH, Mg I, and C2 pixel quality check =0, good, =1 bad at 5085.0 with band widths of 270.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[MgHMgIC2mask] [tinyint] NOT NULL,

	--/ <summary>MgH and Mg I line index from local continuum at 5198.0 with band widths of 44.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[MgHMgIside] [real] NOT NULL,

	--/ <summary>MgH and Mg I line index from global continuum at 5198.0 with band widths of 44.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[MgHMgIcont] [real] NOT NULL,

	--/ <summary>MgH and Mg I line index error in the lind band at 5198.0 with band widths of 44.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[MgHMgIerr] [real] NOT NULL,

	--/ <summary>MgH_MgI pixel quality check =0, good, =1 bad at 5198.0 with band widths of 44.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[MgHMgImask] [tinyint] NOT NULL,

	--/ <summary>MgH line index from local continuum at 5210.0 with band widths of 20.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[MgHside] [real] NOT NULL,

	--/ <summary>MgH line index from global continuum at 5210.0 with band widths of 20.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[MgHcont] [real] NOT NULL,

	--/ <summary>MgH line index error in the lind band at 5210.0 with band widths of 20.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[MgHerr] [real] NOT NULL,

	--/ <summary>MgH pixel quality check =0, good, =1 bad at 5210.0 with band widths of 20.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[MgHmask] [tinyint] NOT NULL,

	--/ <summary>Cr I line index from local continuum at 5206.0 with band widths of 12.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[CrIside] [real] NOT NULL,

	--/ <summary>Cr I line index from global continuum at 5206.0 with band widths of 12.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[CrIcont] [real] NOT NULL,

	--/ <summary>Cr I line index error in the lind band at 5206.0 with band widths of 12.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[CrIerr] [real] NOT NULL,

	--/ <summary>Cr I pixel quality check =0, good, =1 bad at 5206.0 with band widths of 12.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[CrImask] [tinyint] NOT NULL,

	--/ <summary>Mg I and Fe II line index from local continuum at 5175.0 with band widths of 20.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[MgIFeIIside] [real] NOT NULL,

	--/ <summary>Mg I and Fe II line index from global continuum at 5175.0 with band widths of 20.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[MgIFeIIcont] [real] NOT NULL,

	--/ <summary>Mg I and Fe II line index error in the lind band at 5175.0 with band widths of 20.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[MgIFeIIerr] [real] NOT NULL,

	--/ <summary>Mg I and Fe II pixel quality check =0, good, =1 bad at 5175.0 with band widths of 20.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[MgIFeIImask] [tinyint] NOT NULL,

	--/ <summary>Mg I line index from local continuum at 5183.0 with band widths of 2.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[MgI2side] [real] NOT NULL,

	--/ <summary>Mg I line index from global continuum at 5183.0 with band widths of 2.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[MgI2cont] [real] NOT NULL,

	--/ <summary>Mg I line index error in the lind band at 5183.0 with band widths of 2.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[MgI2err] [real] NOT NULL,

	--/ <summary>Mg I pixel quality check =0, good, =1 bad at 5183.0 with band widths of 2.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[MgI2mask] [tinyint] NOT NULL,

	--/ <summary>Mg I line index from local continuum at 5170.5 with band widths of 12.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[MgI121side] [real] NOT NULL,

	--/ <summary>Mg I line index from global continuum at 5170.5 with band widths of 12.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[MgI121cont] [real] NOT NULL,

	--/ <summary>Mg I line index error in the lind band at 5170.5 with band widths of 12.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[MgI121err] [real] NOT NULL,

	--/ <summary>Mg I pixel quality check =0, good, =1 bad at 5170.5 with band widths of 12.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[MgI121mask] [tinyint] NOT NULL,

	--/ <summary>Mg I line index from local continuum at 5176.5 with band widths of 24.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[MgI24side] [real] NOT NULL,

	--/ <summary>Mg I line index from global continuum at 5176.5 with band widths of 24.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[MgI24cont] [real] NOT NULL,

	--/ <summary>Mg I line index error in the lind band at 5176.5 with band widths of 24.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[MgI24err] [real] NOT NULL,

	--/ <summary>Mg I pixel quality check =0, good, =1 bad at 5176.5 with band widths of 24.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[MgI24mask] [tinyint] NOT NULL,

	--/ <summary>Mg I line index from local continuum at 5183.5 with band widths of 12.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[MgI122side] [real] NOT NULL,

	--/ <summary>Mg I line index from global continuum at 5183.5 with band widths of 12.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[MgI122cont] [real] NOT NULL,

	--/ <summary>Mg I line index error in the lind band at 5183.5 with band widths of 12.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[MgI122err] [real] NOT NULL,

	--/ <summary>Mg I pixel quality check =0, good, =1 bad at 5183.5 with band widths of 12.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[MgI122mask] [tinyint] NOT NULL,

	--/ <summary>Na I line index from local continuum at 5890.0 with band widths of 20.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[NaI20side] [real] NOT NULL,

	--/ <summary>Na I line index from global continuum at 5890.0 with band widths of 20.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[NaI20cont] [real] NOT NULL,

	--/ <summary>Na I line index error in the lind band at 5890.0 with band widths of 20.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[NaI20err] [real] NOT NULL,

	--/ <summary>Na I pixel quality check =0, good, =1 bad at 5890.0 with band widths of 20.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[NaI20mask] [tinyint] NOT NULL,

	--/ <summary>Na line index from local continuum at 5892.9 with band widths of 12.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Na12side] [real] NOT NULL,

	--/ <summary>Na line index from global continuum at 5892.9 with band widths of 12.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Na12cont] [real] NOT NULL,

	--/ <summary>Na line index error in the lind band at 5892.9 with band widths of 12.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Na12err] [real] NOT NULL,

	--/ <summary>Na pixel quality check =0, good, =1 bad at 5892.9 with band widths of 12.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[Na12mask] [tinyint] NOT NULL,

	--/ <summary>Na line index from local continuum at 5892.9 with band widths of 24.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Na24side] [real] NOT NULL,

	--/ <summary>Na line index from global continuum at 5892.9 with band widths of 24.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Na24cont] [real] NOT NULL,

	--/ <summary>Na line index error in the lind band at 5892.9 with band widths of 24.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Na24err] [real] NOT NULL,

	--/ <summary>Na pixel quality check =0, good, =1 bad at 5892.9 with band widths of 24.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[Na24mask] [tinyint] NOT NULL,

	--/ <summary>Halpha line index from local continuum at 6562.8 with band widths of 12.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Halpha12side] [real] NOT NULL,

	--/ <summary>Halpha line index from global continuum at 6562.8 with band widths of 12.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Halpha12cont] [real] NOT NULL,

	--/ <summary>Halpha line index error in the lind band at 6562.8 with band widths of 12.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Halpha12err] [real] NOT NULL,

	--/ <summary>Halpha pixel quality check =0, good, =1 bad at 6562.8 with band widths of 12.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[Halpha12mask] [tinyint] NOT NULL,

	--/ <summary>Halpha line index from local continuum at 6562.8 with band widths of 24.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Halpha24side] [real] NOT NULL,

	--/ <summary>Halpha line index from global continuum at 6562.8 with band widths of 24.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Halpha24cont] [real] NOT NULL,

	--/ <summary>Halpha line index error in the lind band at 6562.8 with band widths of 24.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Halpha24err] [real] NOT NULL,

	--/ <summary>Halpha pixel quality check =0, good, =1 bad at 6562.8 with band widths of 24.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[Halpha24mask] [tinyint] NOT NULL,

	--/ <summary>Halpha line index from local continuum at 6562.8 with band widths of 48.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Halpha48side] [real] NOT NULL,

	--/ <summary>Halpha line index from global continuum at 6562.8 with band widths of 48.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Halpha48cont] [real] NOT NULL,

	--/ <summary>Halpha line index error in the lind band at 6562.8 with band widths of 48.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Halpha48err] [real] NOT NULL,

	--/ <summary>Halpha pixel quality check =0, good, =1 bad at 6562.8 with band widths of 48.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[Halpha48mask] [tinyint] NOT NULL,

	--/ <summary>Halpha line index from local continuum at 6562.8 with band widths of 70.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Halpha70side] [real] NOT NULL,

	--/ <summary>Halpha line index from global continuum at 6562.8 with band widths of 70.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Halpha70cont] [real] NOT NULL,

	--/ <summary>Halpha line index error in the lind band at 6562.8 with band widths of 70.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Halpha70err] [real] NOT NULL,

	--/ <summary>Halpha pixel quality check =0, good, =1 bad at 6562.8 with band widths of 70.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[Halpha70mask] [tinyint] NOT NULL,

	--/ <summary>CaH line index from local continuum at 6788.0 with band widths of 505.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[CaHside] [real] NOT NULL,

	--/ <summary>CaH line index from global continuum at 6788.0 with band widths of 505.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[CaHcont] [real] NOT NULL,

	--/ <summary>CaH line index error in the lind band at 6788.0 with band widths of 505.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[CaHerr] [real] NOT NULL,

	--/ <summary>CaH pixel quality check =0, good, =1 bad at 6788.0 with band widths of 505.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[CaHmask] [tinyint] NOT NULL,

	--/ <summary>TiO line index from local continuum at 7209.0 with band widths of 333.3</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[TiOside] [real] NOT NULL,

	--/ <summary>TiO line index from global continuum at 7209.0 with band widths of 333.3</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[TiOcont] [real] NOT NULL,

	--/ <summary>TiO line index error in the lind band at 7209.0 with band widths of 333.3</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[TiOerr] [real] NOT NULL,

	--/ <summary>TiO pixel quality check =0, good, =1 bad at 7209.0 with band widths of 333.3</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[TiOmask] [tinyint] NOT NULL,

	--/ <summary>CN line index from local continuum at 6890.0 with band widths of 26.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[CNside] [real] NOT NULL,

	--/ <summary>CN line index from global continuum at 6890.0 with band widths of 26.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[CNcont] [real] NOT NULL,

	--/ <summary>CN line index error in the lind band at 6890.0 with band widths of 26.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[CNerr] [real] NOT NULL,

	--/ <summary>CN pixel quality check =0, good, =1 bad at 6890.0 with band widths of 26.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[CNmask] [tinyint] NOT NULL,

	--/ <summary>O I triplet line index from local continuu at 7775.0 with band widths of 30.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[OItripside] [real] NOT NULL,

	--/ <summary>O I triplet line index from global continuum at 7775.0 with band widths of 30.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[OItripcont] [real] NOT NULL,

	--/ <summary>O I triplet line index error in the lind band at 7775.0 with band widths of 30.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[OItriperr] [real] NOT NULL,

	--/ <summary>O I triplet pixel quality check =0, good, =1 bad at 7775.0 with band widths of 30.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[OItripmask] [tinyint] NOT NULL,

	--/ <summary>K I line index from local continuum at 7687.0 with band widths of 34.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[KI34side] [real] NOT NULL,

	--/ <summary>K I line index from global continuum at 7687.0 with band widths of 34.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[KI34cont] [real] NOT NULL,

	--/ <summary>K I line index error in the lind band at 7687.0 with band widths of 34.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[KI34err] [real] NOT NULL,

	--/ <summary>K I pixel quality check =0, good, =1 bad at 7687.0 with band widths of 34.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[KI34mask] [tinyint] NOT NULL,

	--/ <summary>K I line index from local continuum at 7688.0 with band widths of 95.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[KI95side] [real] NOT NULL,

	--/ <summary>K I line index from global continuum at 7688.0 with band widths of 95.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[KI95cont] [real] NOT NULL,

	--/ <summary>K I line index error in the lind band at 7688.0 with band widths of 95.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[KI95err] [real] NOT NULL,

	--/ <summary>K I pixel quality check =0, good, =1 bad at 7688.0 with band widths of 95.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[KI95mask] [tinyint] NOT NULL,

	--/ <summary>Na I line index from local continuum at 8187.5 with band widths of 15.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[NaI15side] [real] NOT NULL,

	--/ <summary>Na I line index from global continuum at 8187.5 with band widths of 15.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[NaI15cont] [real] NOT NULL,

	--/ <summary>Na I line index error in the lind band at 8187.5 with band widths of 15.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[NaI15err] [real] NOT NULL,

	--/ <summary>Na I pixel quality check =0, good, =1 bad at 8187.5 with band widths of 15.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[NaI15mask] [tinyint] NOT NULL,

	--/ <summary>Na I line index from local continuum at 8190.2 with band widths of 33.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[NaIredside] [real] NOT NULL,

	--/ <summary>Na I line index from global continuum at 8190.2 with band widths of 33.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[NaIredcont] [real] NOT NULL,

	--/ <summary>Na I line index error in the lind band at 8190.2 with band widths of 33.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[NaIrederr] [real] NOT NULL,

	--/ <summary>Na I pixel quality check =0, good, =1 bad at 8190.2 with band widths of 33.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[NaIredmask] [tinyint] NOT NULL,

	--/ <summary>Ca II triplet line index from local continuum at 8498.0 with band widths of 26.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[CaII26side] [real] NOT NULL,

	--/ <summary>Ca II triplet line index from global continuum at 8498.0 with band widths of 26.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[CaII26cont] [real] NOT NULL,

	--/ <summary>Ca II triplet line index error in the lind band at 8498.0 with band widths of 26.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[CaII26err] [real] NOT NULL,

	--/ <summary>Ca II triplet pixel quality check =0, good, =1 bad at 8498.0 with band widths of 26.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[CaII26mask] [tinyint] NOT NULL,

	--/ <summary>Paschen line index from local continuum at 8467.5 with band widths of 13.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Paschen13side] [real] NOT NULL,

	--/ <summary>Paschen line index from global continuum at 8467.5 with band widths of 13.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Paschen13cont] [real] NOT NULL,

	--/ <summary>Paschen line index error in the lind band at 8467.5 with band widths of 13.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Paschen13err] [real] NOT NULL,

	--/ <summary>Paschen pixel quality check =0, good, =1 bad at 8467.5 with band widths of 13.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[Paschen13mask] [tinyint] NOT NULL,

	--/ <summary>Ca II triplet line index from local continuum at 8498.5 with band widths of 29.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[CaII29side] [real] NOT NULL,

	--/ <summary>Ca II triplet line index from global continuum at 8498.5 with band widths of 29.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[CaII29cont] [real] NOT NULL,

	--/ <summary>Ca II triplet line index error in the lind band at 8498.5 with band widths of 29.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[CaII29err] [real] NOT NULL,

	--/ <summary>Ca II triplet pixel quality check =0, good, =1 bad at 8498.5 with band widths of 29.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[CaII29mask] [tinyint] NOT NULL,

	--/ <summary>Ca II triplet line index from local continuum at 8542.0 with band widths of 40.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[CaII401side] [real] NOT NULL,

	--/ <summary>Ca II triplet line index from global continuum at 8542.0 with band widths of 40.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[CaII401cont] [real] NOT NULL,

	--/ <summary>Ca II triplet line index error in the lind band at 8542.0 with band widths of 40.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[CaII401err] [real] NOT NULL,

	--/ <summary>Ca II triplet pixel quality check =0, good, =1 bad at 8542.0 with band widths of 40.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[CaII401mask] [tinyint] NOT NULL,

	--/ <summary>Ca II triplet_1 line index from local continuum at 8542.0 with band widths of 16.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[CaII161side] [real] NOT NULL,

	--/ <summary>Ca II triplet_1 line index from global continuum at 8542.0 with band widths of 16.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[CaII161cont] [real] NOT NULL,

	--/ <summary>Ca II triplet_1 line index error in the lind band at 8542.0 with band widths of 16.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[CaII161err] [real] NOT NULL,

	--/ <summary>Ca II triplet_1 pixel quality check =0, good, =1 bad at 8542.0 with band widths of 16.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[CaII161mask] [tinyint] NOT NULL,

	--/ <summary>Paschen line index from local continuum at 8598.0 with band widths of 42.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Paschen421side] [real] NOT NULL,

	--/ <summary>Paschen line index from global continuum at 8598.0 with band widths of 42.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Paschen421cont] [real] NOT NULL,

	--/ <summary>Paschen line index error in the lind band at 8598.0 with band widths of 42.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Paschen421err] [real] NOT NULL,

	--/ <summary>Paschen pixel quality check =0, good, =1 bad at 8598.0 with band widths of 42.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[Paschen421mask] [tinyint] NOT NULL,

	--/ <summary>Ca II triplet line index from local continuum at 8662.1 with band widths of 16.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[CaII162side] [real] NOT NULL,

	--/ <summary>Ca II triplet line index from global continuum at 8662.1 with band widths of 16.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[CaII162cont] [real] NOT NULL,

	--/ <summary>Ca II triplet line index error in the lind band at 8662.1 with band widths of 16.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[CaII162err] [real] NOT NULL,

	--/ <summary>Ca II triplet pixel quality check =0, good, =1 bad at 8662.1 with band widths of 16.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[CaII162mask] [tinyint] NOT NULL,

	--/ <summary>Ca II triplet line index from local continuum at 8662.0 with band widths of 40.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[CaII402side] [real] NOT NULL,

	--/ <summary>Ca II triplet line index from global continuum at 8662.0 with band widths of 40.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[CaII402cont] [real] NOT NULL,

	--/ <summary>Ca II triplet line index error in the lind band at 8662.0 with band widths of 40.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[CaII402err] [real] NOT NULL,

	--/ <summary>Ca II triplet pixel quality check =0, good, =1 bad at 8662.0 with band widths of 40.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[CaII402mask] [tinyint] NOT NULL,

	--/ <summary>Paschen line index from local continuum at 8751.0 with band widths of 42.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Paschen422side] [real] NOT NULL,

	--/ <summary>Paschen line index from global continuum at 8751.0 with band widths of 42.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Paschen422cont] [real] NOT NULL,

	--/ <summary>Paschen line index error in the lind band at 8751.0 with band widths of 42.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[Paschen422err] [real] NOT NULL,

	--/ <summary>Paschen pixel quality check =0, good, =1 bad at 8751.0 with band widths of 42.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[Paschen422mask] [tinyint] NOT NULL,

	--/ <summary>TiO5 line index from local continuum at 7134.4 with band widths of 5.0</summary>
	--/ <quantity>spect.line.index</quantity>
	[TiO5side] [real] NOT NULL,

	--/ <summary>TiO5 line index from global continuum at 7134.4 with band widths of 5.0</summary>
	--/ <quantity>spect.line.index</quantity>
	[TiO5cont] [real] NOT NULL,

	--/ <summary>TiO5 line index error in the lind band at 7134.4 with band widths of 5.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	[TiO5err] [real] NOT NULL,

	--/ <summary>TiO5 pixel quality check =0, good, =1 bad at 7134.4 with band widths of 5.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[TiO5mask] [tinyint] NOT NULL,

	--/ <summary>TiO8 line index from local continuum at 8457.3 with band widths of 30.0</summary>
	--/ <quantity>spect.line.index</quantity>
	[TiO8side] [real] NOT NULL,

	--/ <summary>TiO8 line index from global continuum at 8457.3 with band widths of 30.0</summary>
	--/ <quantity>spect.line.index</quantity>
	[TiO8cont] [real] NOT NULL,

	--/ <summary>TiO8 line index error in the lind band at 8457.3 with band widths of 30.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	[TiO8err] [real] NOT NULL,

	--/ <summary>TiO8 pixel quality check =0, good, =1 bad at 8457.3 with band widths of 30.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[TiO8mask] [tinyint] NOT NULL,

	--/ <summary>CaH1 line index from local continuum at 6386.7 with band widths of 10.0</summary>
	--/ <quantity>spect.line.index</quantity>
	[CaH1side] [real] NOT NULL,

	--/ <summary>CaH1 line index from global continuum at 6386.7 with band widths of 10.0</summary>
	--/ <quantity>spect.line.index</quantity>
	[CaH1cont] [real] NOT NULL,

	--/ <summary>CaH1 line index error in the lind band at 6386.7 with band widths of 10.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	[CaH1err] [real] NOT NULL,

	--/ <summary>CaH1 pixel quality check =0, good, =1 bad at 6386.7 with band widths of 10.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[CaH1mask] [tinyint] NOT NULL,

	--/ <summary>CaH2 line index from local continuum at 6831.9 with band widths of 32.0</summary>
	--/ <quantity>spect.line.index</quantity>
	[CaH2side] [real] NOT NULL,

	--/ <summary>CaH2 line index from global continuum at 6831.9 with band widths of 32.0</summary>
	--/ <quantity>spect.line.index</quantity>
	[CaH2cont] [real] NOT NULL,

	--/ <summary>CaH2 line index error in the lind band at 6831.9 with band widths of 32.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	[CaH2err] [real] NOT NULL,

	--/ <summary>CaH2 pixel quality check =0, good, =1 bad at 6831.9 with band widths of 32.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[CaH2mask] [tinyint] NOT NULL,

	--/ <summary>CaH3 line index from local continuum at 6976.9 with band widths of 30.0</summary>
	--/ <quantity>spect.line.index</quantity>
	[CaH3side] [real] NOT NULL,

	--/ <summary>CaH3 line index from global continuum at 6976.9 with band widths of 30.0</summary>
	--/ <quantity>spect.line.index</quantity>
	[CaH3cont] [real] NOT NULL,

	--/ <summary>CaH3 line index error in the lind band at 6976.9 with band widths of 30.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	[CaH3err] [real] NOT NULL,

	--/ <summary>CaH3 pixel quality check =0, good, =1 bad at 6976.9 with band widths of 30.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[CaH3mask] [tinyint] NOT NULL,

	--/ <summary>CN line index at 3839</summary>
	--/ <quantity>spect.line.index</quantity>
	[UVCNside] [real] NOT NULL,

	--/ <summary>CN line index at 3839</summary>
	--/ <quantity>spect.line.index</quantity>
	[UVCNcont] [real] NOT NULL,

	--/ <summary>CN line index error at 3829</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	[UVCNerr] [real] NOT NULL,

	--/ <summary>CN pixel quality check =0, good, =1 bad at 3839</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[UVCNmask] [tinyint] NOT NULL,

	--/ <summary>CN line index at 4142</summary>
	--/ <quantity>spect.line.index</quantity>
	[BLCNside] [real] NOT NULL,

	--/ <summary>CN line index at 4142</summary>
	--/ <quantity>spect.line.index</quantity>
	[BLCNcont] [real] NOT NULL,

	--/ <summary>CN line index error at 4142</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	[BLCNerr] [real] NOT NULL,

	--/ <summary>CN pixel quality check =0, good, =1 bad at 4142</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[BLCNmask] [tinyint] NOT NULL,

	--/ <summary>Fe I line index at 4045.8 with band widths of 2.5</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[FEI1side] [real] NOT NULL,

	--/ <summary>Fe I line index at 4045.8 with band widths of 2.5</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[FEI1cont] [real] NOT NULL,

	--/ <summary>Fe I line index error at 4045.8 with band widths of 2.5</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[FEI1err] [real] NOT NULL,

	--/ <summary>Fe I pixel quality check =0, good, =1 bad at 4045.8 with band widths of 2.5</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[FEI1mask] [tinyint] NOT NULL,

	--/ <summary>Fe I line index at 4063.6 with band widths of 2.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[FEI2side] [real] NOT NULL,

	--/ <summary>Fe I line index at 4063.6 with band widths of 2.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[FEI2cont] [real] NOT NULL,

	--/ <summary>Fe I line index error at 4063.6 with band widths of 2.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[FEI2err] [real] NOT NULL,

	--/ <summary>Fe I pixel quality check =0, good, =1 bad at 4063.6 with band widths of 2.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[FEI2mask] [tinyint] NOT NULL,

	--/ <summary>Fe I line index at 4071.7 with band widths of 2.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[FEI3side] [real] NOT NULL,

	--/ <summary>Fe I line index at 4071.7 with band widths of 2.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[FEI3cont] [real] NOT NULL,

	--/ <summary>Fe I line index error at 4071.7 with band widths of 2.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[FEI3err] [real] NOT NULL,

	--/ <summary>Fe I pixel quality check =0, good, =1 bad at 4071.7 with band widths of 2.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[FEI3mask] [tinyint] NOT NULL,

	--/ <summary>Sr II line index at 4077.7 with band widths of 2.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[SRII2side] [real] NOT NULL,

	--/ <summary>Sr II line index at 4077.7 with band widths of 2.0</summary>
	--/ <quantity>spect.line.index</quantity>
	--/ <unit>AA</unit>
	[SRII2cont] [real] NOT NULL,

	--/ <summary>Sr II line index error at 4077.7 with band widths of 2.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	--/ <unit>AA</unit>
	[SRII2err] [real] NOT NULL,

	--/ <summary>Sr II pixel quality check =0, good, =1 bad at 4077.7 with band widths of 2.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[SRII2mask] [tinyint] NOT NULL,

	--/ <summary>Fe I line index at 4679.5 with band widths of 87.0</summary>
	--/ <quantity>spect.line.index</quantity>
	[FEI4side] [real] NOT NULL,

	--/ <summary>Fe I line index at 4679.5 with band widths of 87.0</summary>
	--/ <quantity>spect.line.index</quantity>
	[FEI4cont] [real] NOT NULL,

	--/ <summary>Fe I line index error at 4679.5 with band widths of 87.0</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	[FEI4err] [real] NOT NULL,

	--/ <summary>Fe I pixel quality check =0, good, =1 bad at 4679.5 with band widths of 87.0</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[FEI4mask] [tinyint] NOT NULL,

	--/ <summary>Fe I line index at 5267.4 with band widths of 38.8</summary>
	--/ <quantity>spect.line.index</quantity>
	[FEI5side] [real] NOT NULL,

	--/ <summary>Fe I line index at 5267.4 with band widths of 38.8</summary>
	--/ <quantity>spect.line.index</quantity>
	[FEI5cont] [real] NOT NULL,

	--/ <summary>Fe I line index error at 5267.4 with band widths of 38.8</summary>
	--/ <quantity>stat.error;spect.line.index</quantity>
	[FEI5err] [real] NOT NULL,

	--/ <summary>Fe I pixel quality check =0, good, =1 bad at 5267.4 with band widths of 38.8</summary>
	--/ <quantity>meta.code.qual;instr.pixel</quantity>
	[FEI5mask] [tinyint] NOT NULL,
 CONSTRAINT [pk_sppLines_specObjID] PRIMARY KEY CLUSTERED 
(
	[SPECOBJID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[sppParams]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

--/ <summary> Contains outputs from the SEGUE Stellar Parameter Pipeline (SSPP). </summary>
--/ <remarks> Spectra for over 500,000 Galactic stars of all common spectral types are  available with DR8. These Spectra were processed with a pipeline called the  SEGUE Stellar Parameter Pipeline' (SSPP, Lee et al. 2008) that computes   standard stellar atmospheric parameters such as  [Fe/H], log g and Teff for   each star by a variety of methods. These outputs are stored in this table, and  indexed on the  specObjID' key index parameter for queries joining to  other tables such as specobjall and photoobjall. bestobjid is also added (and indexed?)  Note that all values of -9999 indicate missing or no values.  See the Sample Queries in SkyServer for examples of such queries.  </remarks>
CREATE TABLE [dbo].[sppParams](

	--/ <summary>id number, match in specObjAll</summary>
	--/ <quantity>meta.id</quantity>
	[SPECOBJID] [bigint] NOT NULL,

	--/ <summary>Object ID of best PhotoObj match (flux-based)</summary>
	--/ <quantity>meta.id</quantity>
	[BESTOBJID] [bigint] NOT NULL,

	--/ <summary>Object ID of best PhotoObj match (position-based)</summary>
	--/ <quantity>meta.id</quantity>
	[FLUXOBJID] [bigint] NOT NULL,

	--/ <summary>targeted object ID</summary>
	--/ <quantity>meta.id</quantity>
	[TARGETOBJID] [bigint] NOT NULL,

	--/ <summary>Database ID of Plate (match in plateX)</summary>
	--/ <quantity>meta.id</quantity>
	[PLATEID] [bigint] NOT NULL,

	--/ <summary>Best version of spectrum at this location (defines default view SpecObj)</summary>
	--/ <quantity>meta.code</quantity>
	[sciencePrimary] [smallint] NOT NULL,

	--/ <summary>Best version of spectrum at this location, among Legacy plates</summary>
	--/ <quantity>meta.code</quantity>
	[legacyPrimary] [smallint] NOT NULL,

	--/ <summary>Best version of spectrum at this location, among SEGUE plates (defines default view SpecObj)</summary>
	--/ <quantity>meta.code</quantity>
	[seguePrimary] [smallint] NOT NULL,

	--/ <summary>Name of first release this object was associated with</summary>
	--/ <quantity>meta.id</quantity>
	[FIRSTRELEASE] [varchar](32) NOT NULL,

	--/ <summary>Survey name</summary>
	--/ <quantity>meta.id</quantity>
	[SURVEY] [varchar](32) NOT NULL,

	--/ <summary>Program name</summary>
	--/ <quantity>meta.id</quantity>
	[PROGRAMNAME] [varchar](32) NOT NULL,

	--/ <summary>Chunk name</summary>
	--/ <quantity>meta.id</quantity>
	[CHUNK] [varchar](32) NOT NULL,

	--/ <summary>Plate drill run name</summary>
	--/ <quantity>meta.id</quantity>
	[PLATERUN] [varchar](32) NOT NULL,

	--/ <summary>Modified Julian Date of observation</summary>
	--/ <quantity>time.epoch;obs</quantity>
	[MJD] [bigint] NOT NULL,

	--/ <summary>Plate number</summary>
	--/ <quantity>meta.id;instr.det</quantity>
	[PLATE] [bigint] NOT NULL,

	--/ <summary>Fiber number (1-640)</summary>
	--/ <quantity>meta.id;instr.param</quantity>
	[FIBERID] [bigint] NOT NULL,

	--/ <summary>Name of 2D rerun</summary>
	--/ <quantity>meta.id</quantity>
	[RUN2D] [varchar](32) NOT NULL,

	--/ <summary>Name of 1D rerun</summary>
	--/ <quantity>meta.id</quantity>
	[RUN1D] [varchar](32) NOT NULL,

	--/ <summary>Name of SSPP rerun</summary>
	--/ <quantity>meta.id</quantity>
	[RUNSSPP] [varchar](32) NOT NULL,

	--/ <summary>ASCII translation of target selection information as determined at the time the plate was designed</summary>
	--/ <quantity>meta.note</quantity>
	[TARGETSTRING] [varchar](32) NOT NULL,

	--/ <summary>Target selection information at plate design, primary science selection (for backwards compatibility)</summary>
	--/ <quantity>meta.code</quantity>
	[PRIMTARGET] [bigint] NOT NULL,

	--/ <summary>Target selection information at plate design, secondary/qa/calib selection (for backwards compatibility)</summary>
	--/ <quantity>meta.code</quantity>
	[SECTARGET] [bigint] NOT NULL,

	--/ <summary>Legacy target selection information at plate design, primary science selection</summary>
	--/ <quantity>meta.code</quantity>
	[LEGACY_TARGET1] [bigint] NOT NULL,

	--/ <summary>Legacy target selection information at plate design, secondary/qa/calib selection</summary>
	--/ <quantity>meta.code</quantity>
	[LEGACY_TARGET2] [bigint] NOT NULL,

	--/ <summary>Special program target selection information at plate design, primary science selection</summary>
	--/ <quantity>meta.code</quantity>
	[SPECIAL_TARGET1] [bigint] NOT NULL,

	--/ <summary>Special program target selection information at plate design, secondary/qa/calib selection</summary>
	--/ <quantity>meta.code</quantity>
	[SPECIAL_TARGET2] [bigint] NOT NULL,

	--/ <summary>SEGUE-1 target selection information at plate design, primary science selection</summary>
	--/ <quantity>meta.code</quantity>
	[SEGUE1_TARGET1] [bigint] NOT NULL,

	--/ <summary>SEGUE-1 target selection information at plate design, secondary/qa/calib selection</summary>
	--/ <quantity>meta.code</quantity>
	[SEGUE1_TARGET2] [bigint] NOT NULL,

	--/ <summary>SEGUE-2 target selection information at plate design, primary science selection</summary>
	--/ <quantity>meta.code</quantity>
	[SEGUE2_TARGET1] [bigint] NOT NULL,

	--/ <summary>SEGUE-2 target selection information at plate design, secondary/qa/calib selection</summary>
	--/ <quantity>meta.code</quantity>
	[SEGUE2_TARGET2] [bigint] NOT NULL,

	--/ <summary>Spectral Type from HAMMER</summary>
	--/ <quantity>src.spType</quantity>
	[SPECTYPEHAMMER] [varchar](32) NOT NULL,

	--/ <summary>SpecBS sub-classification</summary>
	--/ <quantity>src.spType</quantity>
	[SPECTYPESUBCLASS] [varchar](32) NOT NULL,

	--/ <summary>Flag with combination of four letters among BCdDEgGhHlnNSV, n=normal</summary>
	--/ <quantity>meta.code</quantity>
	[FLAG] [varchar](32) NOT NULL,

	--/ <summary>Adopted Teff, bi-weigth average of estimators with indicator variable of 1</summary>
	--/ <quantity>phys.temperature.effective;stat.mean</quantity>
	--/ <unit>K</unit>
	[TEFFADOP] [real] NOT NULL,

	--/ <summary>Number of estimators used in bi-weight average</summary>
	--/ <quantity>meta.number</quantity>
	[TEFFADOPN] [tinyint] NOT NULL,

	--/ <summary>Error in the adopted temperature</summary>
	--/ <quantity>stat.error;phys.temperature.effective;stat.mean</quantity>
	--/ <unit>K</unit>
	[TEFFADOPUNC] [real] NOT NULL,

	--/ <summary>Teff estimate from HA24</summary>
	--/ <quantity>phys.temperature.effective</quantity>
	--/ <unit>K</unit>
	[TEFFHA24] [real] NOT NULL,

	--/ <summary>Teff estimate from HD24</summary>
	--/ <quantity>phys.temperature.effective</quantity>
	--/ <unit>K</unit>
	[TEFFHD24] [real] NOT NULL,

	--/ <summary>Teff estimate from NGS1</summary>
	--/ <quantity>phys.temperature.effective</quantity>
	--/ <unit>K</unit>
	[TEFFNGS1] [real] NOT NULL,

	--/ <summary>Teff estimate from ANNSR</summary>
	--/ <quantity>phys.temperature.effective</quantity>
	--/ <unit>K</unit>
	[TEFFANNSR] [real] NOT NULL,

	--/ <summary>Teff estimate from ANNRR</summary>
	--/ <quantity>phys.temperature.effective</quantity>
	--/ <unit>K</unit>
	[TEFFANNRR] [real] NOT NULL,

	--/ <summary>Teff estimate from WBG</summary>
	--/ <quantity>phys.temperature.effective</quantity>
	--/ <unit>K</unit>
	[TEFFWBG] [real] NOT NULL,

	--/ <summary>Teff estimate from k24</summary>
	--/ <quantity>phys.temperature.effective</quantity>
	--/ <unit>K</unit>
	[TEFFK24] [real] NOT NULL,

	--/ <summary>Teff estimate from ki13</summary>
	--/ <quantity>phys.temperature.effective</quantity>
	--/ <unit>K</unit>
	[TEFFKI13] [real] NOT NULL,

	--/ <summary>Indicator variable, = 0 bad, = 1 good</summary>
	--/ <quantity>meta.code.qual;phys.temperature.effective</quantity>
	[TEFFHA24IND] [tinyint] NOT NULL,

	--/ <summary>Indicator variable, = 0 bad, = 1 good</summary>
	--/ <quantity>meta.code.qual;phys.temperature.effective</quantity>
	[TEFFHD24IND] [tinyint] NOT NULL,

	--/ <summary>Indicator variable, = 0 bad, = 1 good</summary>
	--/ <quantity>meta.code.qual;phys.temperature.effective</quantity>
	[TEFFNGS1IND] [tinyint] NOT NULL,

	--/ <summary>Indicator variable, = 0 bad, = 1 good</summary>
	--/ <quantity>meta.code.qual;phys.temperature.effective</quantity>
	[TEFFANNSRIND] [tinyint] NOT NULL,

	--/ <summary>Indicator variable, = 0 bad, = 1 good</summary>
	--/ <quantity>meta.code.qual;phys.temperature.effective</quantity>
	[TEFFANNRRIND] [tinyint] NOT NULL,

	--/ <summary>Indicator variable, = 0 bad, = 1 good</summary>
	--/ <quantity>meta.code.qual;phys.temperature.effective</quantity>
	[TEFFWBGIND] [tinyint] NOT NULL,

	--/ <summary>Indicator variable, = 0 bad, = 1 good</summary>
	--/ <quantity>meta.code.qual;phys.temperature.effective</quantity>
	[TEFFK24IND] [tinyint] NOT NULL,

	--/ <summary>Indicator variable, = 0 bad, = 1 good</summary>
	--/ <quantity>meta.code.qual;phys.temperature.effective</quantity>
	[TEFFKI13IND] [tinyint] NOT NULL,

	--/ <summary>Error in Teff estimate from HA24</summary>
	--/ <quantity>stat.error;phys.temperature.effective</quantity>
	--/ <unit>K</unit>
	[TEFFHA24UNC] [real] NOT NULL,

	--/ <summary>Error in Teff estimate from HD24</summary>
	--/ <quantity>stat.error;phys.temperature.effective</quantity>
	--/ <unit>K</unit>
	[TEFFHD24UNC] [real] NOT NULL,

	--/ <summary>Error in Teff estimate from NGS1</summary>
	--/ <quantity>stat.error;phys.temperature.effective</quantity>
	--/ <unit>K</unit>
	[TEFFNGS1UNC] [real] NOT NULL,

	--/ <summary>Error in Teff estimate from ANNSR</summary>
	--/ <quantity>stat.error;phys.temperature.effective</quantity>
	--/ <unit>K</unit>
	[TEFFANNSRUNC] [real] NOT NULL,

	--/ <summary>Error in Teff estimate from ANNRR</summary>
	--/ <quantity>stat.error;phys.temperature.effective</quantity>
	--/ <unit>K</unit>
	[TEFFANNRRUNC] [real] NOT NULL,

	--/ <summary>Error in Teff estimate from WBG</summary>
	--/ <quantity>stat.error;phys.temperature.effective</quantity>
	--/ <unit>K</unit>
	[TEFFWBGUNC] [real] NOT NULL,

	--/ <summary>Error in Teff estimate from k24</summary>
	--/ <quantity>stat.error;phys.temperature.effective</quantity>
	--/ <unit>K</unit>
	[TEFFK24UNC] [real] NOT NULL,

	--/ <summary>Error in Teff estimate from ki13</summary>
	--/ <quantity>stat.error;phys.temperature.effective</quantity>
	--/ <unit>K</unit>
	[TEFFKI13UNC] [real] NOT NULL,

	--/ <summary>Adopted log g, bi-weigth average of estimators with indicator variable of 2</summary>
	--/ <quantity>phys.gravity;stat.mean</quantity>
	--/ <unit>dex</unit>
	[LOGGADOP] [real] NOT NULL,

	--/ <summary>Number of log g estimators in used bi-weight average</summary>
	--/ <quantity>meta.number</quantity>
	[LOGGADOPN] [tinyint] NOT NULL,

	--/ <summary>Error in the adopted log g</summary>
	--/ <quantity>stat.error;phys.gravity;stat.mean</quantity>
	--/ <unit>dex</unit>
	[LOGGADOPUNC] [real] NOT NULL,

	--/ <summary>log g estimate from NGS2</summary>
	--/ <quantity>phys.gravity</quantity>
	--/ <unit>dex</unit>
	[LOGGNGS2] [real] NOT NULL,

	--/ <summary>log g estimate from NGS1</summary>
	--/ <quantity>phys.gravity</quantity>
	--/ <unit>dex</unit>
	[LOGGNGS1] [real] NOT NULL,

	--/ <summary>log g estimate from ANNSR</summary>
	--/ <quantity>phys.gravity</quantity>
	--/ <unit>dex</unit>
	[LOGGANNSR] [real] NOT NULL,

	--/ <summary>log g estimate from ANNRR</summary>
	--/ <quantity>phys.gravity</quantity>
	--/ <unit>dex</unit>
	[LOGGANNRR] [real] NOT NULL,

	--/ <summary>log g estimate from CaI1</summary>
	--/ <quantity>phys.gravity</quantity>
	--/ <unit>dex</unit>
	[LOGGCAI1] [real] NOT NULL,

	--/ <summary>log g estimate from WBG</summary>
	--/ <quantity>phys.gravity</quantity>
	--/ <unit>dex</unit>
	[LOGGWBG] [real] NOT NULL,

	--/ <summary>log g estimate from k24</summary>
	--/ <quantity>phys.gravity</quantity>
	--/ <unit>dex</unit>
	[LOGGK24] [real] NOT NULL,

	--/ <summary>log g estimate from ki13</summary>
	--/ <quantity>phys.gravity</quantity>
	--/ <unit>dex</unit>
	[LOGGKI13] [real] NOT NULL,

	--/ <summary>Indicator variable, = 0 bad, = 1 good</summary>
	--/ <quantity>meta.code.qual;phys.gravity</quantity>
	[LOGGNGS2IND] [tinyint] NOT NULL,

	--/ <summary>Indicator variable, = 0 bad, = 1 good</summary>
	--/ <quantity>meta.code.qual;phys.gravity</quantity>
	[LOGGNGS1IND] [tinyint] NOT NULL,

	--/ <summary>Indicator variable, = 0 bad, = 1 good</summary>
	--/ <quantity>meta.code.qual;phys.gravity</quantity>
	[LOGGANNSRIND] [tinyint] NOT NULL,

	--/ <summary>Indicator variable, = 0 bad, = 1 good</summary>
	--/ <quantity>meta.code.qual;phys.gravity</quantity>
	[LOGGANNRRIND] [tinyint] NOT NULL,

	--/ <summary>Indicator variable, = 0 bad, = 1 good</summary>
	--/ <quantity>meta.code.qual;phys.gravity</quantity>
	[LOGGCAI1IND] [tinyint] NOT NULL,

	--/ <summary>Indicator variable, = 0 bad, = 1 good</summary>
	--/ <quantity>meta.code.qual;phys.gravity</quantity>
	[LOGGWBGIND] [tinyint] NOT NULL,

	--/ <summary>Indicator variable, = 0 bad, = 1 good</summary>
	--/ <quantity>meta.code.qual;phys.gravity</quantity>
	[LOGGK24IND] [tinyint] NOT NULL,

	--/ <summary>Indicator variable, = 0 bad, = 1 good</summary>
	--/ <quantity>meta.code.qual;phys.gravity</quantity>
	[LOGGKI13IND] [tinyint] NOT NULL,

	--/ <summary>Error in log g estimate from NGS2</summary>
	--/ <quantity>stat.error;phys.gravity</quantity>
	--/ <unit>dex</unit>
	[LOGGNGS2UNC] [real] NOT NULL,

	--/ <summary>Error in log g estimate from NGS2</summary>
	--/ <quantity>stat.error;phys.gravity</quantity>
	--/ <unit>dex</unit>
	[LOGGNGS1UNC] [real] NOT NULL,

	--/ <summary>Error in log g estimate from NGS2</summary>
	--/ <quantity>stat.error;phys.gravity</quantity>
	--/ <unit>dex</unit>
	[LOGGANNSRUNC] [real] NOT NULL,

	--/ <summary>Error in log g estimate from NGS2</summary>
	--/ <quantity>stat.error;phys.gravity</quantity>
	--/ <unit>dex</unit>
	[LOGGANNRRUNC] [real] NOT NULL,

	--/ <summary>Error in log g estimate from NGS2</summary>
	--/ <quantity>stat.error;phys.gravity</quantity>
	--/ <unit>dex</unit>
	[LOGGCAI1UNC] [real] NOT NULL,

	--/ <summary>Error in log g estimate from NGS2</summary>
	--/ <quantity>stat.error;phys.gravity</quantity>
	--/ <unit>dex</unit>
	[LOGGWBGUNC] [real] NOT NULL,

	--/ <summary>Error in log g estimate from NGS2</summary>
	--/ <quantity>stat.error;phys.gravity</quantity>
	--/ <unit>dex</unit>
	[LOGGK24UNC] [real] NOT NULL,

	--/ <summary>Error in log g estimate from NGS2</summary>
	--/ <quantity>stat.error;phys.gravity</quantity>
	--/ <unit>dex</unit>
	[LOGGKI13UNC] [real] NOT NULL,

	--/ <summary>Adopted [Fe/H], bi-weigth average of estimators with indicator variable of 2</summary>
	--/ <quantity>phys.abund.Fe;stat.mean</quantity>
	--/ <unit>dex</unit>
	[FEHADOP] [real] NOT NULL,

	--/ <summary>Number of estimators used in bi-weight average</summary>
	--/ <quantity>meta.number</quantity>
	[FEHADOPN] [tinyint] NOT NULL,

	--/ <summary>Error in the adopted [Fe/H]</summary>
	--/ <quantity>stat.error;phys.abund.Fe;stat.mean</quantity>
	--/ <unit>dex</unit>
	[FEHADOPUNC] [real] NOT NULL,

	--/ <summary>[Fe/H] estimate from NGS2</summary>
	--/ <quantity>phys.abund.Fe</quantity>
	--/ <unit>dex</unit>
	[FEHNGS2] [real] NOT NULL,

	--/ <summary>[Fe/H] estimate from NGS1</summary>
	--/ <quantity>phys.abund.Fe</quantity>
	--/ <unit>dex</unit>
	[FEHNGS1] [real] NOT NULL,

	--/ <summary>[Fe/H] estimate from ANNSR</summary>
	--/ <quantity>phys.abund.Fe</quantity>
	--/ <unit>dex</unit>
	[FEHANNSR] [real] NOT NULL,

	--/ <summary>[Fe/H] estimate from ANNRR</summary>
	--/ <quantity>phys.abund.Fe</quantity>
	--/ <unit>dex</unit>
	[FEHANNRR] [real] NOT NULL,

	--/ <summary>[Fe/H] estimate from CaIIK1</summary>
	--/ <quantity>phys.abund.Fe</quantity>
	--/ <unit>dex</unit>
	[FEHCAIIK1] [real] NOT NULL,

	--/ <summary>[Fe/H] estimate from CaIIK2</summary>
	--/ <quantity>phys.abund.Fe</quantity>
	--/ <unit>dex</unit>
	[FEHCAIIK2] [real] NOT NULL,

	--/ <summary>[Fe/H] estimate from CaIIK3</summary>
	--/ <quantity>phys.abund.Fe</quantity>
	--/ <unit>dex</unit>
	[FEHCAIIK3] [real] NOT NULL,

	--/ <summary>[Fe/H] estimate from WBG</summary>
	--/ <quantity>phys.abund.Fe</quantity>
	--/ <unit>dex</unit>
	[FEHWBG] [real] NOT NULL,

	--/ <summary>[Fe/H] estimate from k24</summary>
	--/ <quantity>phys.abund.Fe</quantity>
	--/ <unit>dex</unit>
	[FEHK24] [real] NOT NULL,

	--/ <summary>[Fe/H] estimate from ki13</summary>
	--/ <quantity>phys.abund.Fe</quantity>
	--/ <unit>dex</unit>
	[FEHKI13] [real] NOT NULL,

	--/ <summary>Indicator variable, = 0 bad, = 1 low S/N or out of g-r color range, = 2 good</summary>
	--/ <quantity>meta.code.qual;phys.abund.Fe</quantity>
	[FEHNGS2IND] [tinyint] NOT NULL,

	--/ <summary>Indicator variable, = 0 bad, = 1 low S/N or out of g-r color range, = 2 good</summary>
	--/ <quantity>meta.code.qual;phys.abund.Fe</quantity>
	[FEHNGS1IND] [tinyint] NOT NULL,

	--/ <summary>Indicator variable, = 0 bad, = 1 low S/N or out of g-r color range, = 2 good</summary>
	--/ <quantity>meta.code.qual;phys.abund.Fe</quantity>
	[FEHANNSRIND] [tinyint] NOT NULL,

	--/ <summary>Indicator variable, = 0 bad, = 1 low S/N or out of g-r color range, = 2 good</summary>
	--/ <quantity>meta.code.qual;phys.abund.Fe</quantity>
	[FEHANNRRIND] [tinyint] NOT NULL,

	--/ <summary>Indicator variable, = 0 bad, = 1 low S/N or out of g-r color range, = 2 good</summary>
	--/ <quantity>meta.code.qual;phys.abund.Fe</quantity>
	[FEHCAIIK1IND] [tinyint] NOT NULL,

	--/ <summary>Indicator variable, = 0 bad, = 1 low S/N or out of g-r color range, = 2 good</summary>
	--/ <quantity>meta.code.qual;phys.abund.Fe</quantity>
	[FEHCAIIK2IND] [tinyint] NOT NULL,

	--/ <summary>Indicator variable, = 0 bad, = 1 low S/N or out of g-r color range, = 2 good</summary>
	--/ <quantity>meta.code.qual;phys.abund.Fe</quantity>
	[FEHCAIIK3IND] [tinyint] NOT NULL,

	--/ <summary>Indicator variable, = 0 bad, = 1 low S/N or out of g-r color range, = 2 good</summary>
	--/ <quantity>meta.code.qual;phys.abund.Fe</quantity>
	[FEHWBGIND] [tinyint] NOT NULL,

	--/ <summary>Indicator variable, = 0 bad, = 1 low S/N or out of g-r color range, = 2 good</summary>
	--/ <quantity>meta.code.qual;phys.abund.Fe</quantity>
	[FEHK24IND] [tinyint] NOT NULL,

	--/ <summary>Indicator variable, = 0 bad, = 1 low S/N or out of g-r color range, = 2 good</summary>
	--/ <quantity>meta.code.qual;phys.abund.Fe</quantity>
	[FEHKI13IND] [tinyint] NOT NULL,

	--/ <summary>Error in [Fe/H] estimate from NGS2</summary>
	--/ <quantity>stat.error;phys.abund.Fe</quantity>
	--/ <unit>dex</unit>
	[FEHNGS2UNC] [real] NOT NULL,

	--/ <summary>Error in [Fe/H] estimate from NGS1</summary>
	--/ <quantity>stat.error;phys.abund.Fe</quantity>
	--/ <unit>dex</unit>
	[FEHNGS1UNC] [real] NOT NULL,

	--/ <summary>Error in [Fe/H] estimate from ANNSR</summary>
	--/ <quantity>stat.error;phys.abund.Fe</quantity>
	--/ <unit>dex</unit>
	[FEHANNSRUNC] [real] NOT NULL,

	--/ <summary>Error in [Fe/H] estimate from ANNRR</summary>
	--/ <quantity>stat.error;phys.abund.Fe</quantity>
	--/ <unit>dex</unit>
	[FEHANNRRUNC] [real] NOT NULL,

	--/ <summary>Error in [Fe/H] estiimate from CaIIK1</summary>
	--/ <quantity>stat.error;phys.abund.Fe</quantity>
	--/ <unit>dex</unit>
	[FEHCAIIK1UNC] [real] NOT NULL,

	--/ <summary>Error in [Fe/H] estimate from CaIIK2</summary>
	--/ <quantity>stat.error;phys.abund.Fe</quantity>
	--/ <unit>dex</unit>
	[FEHCAIIK2UNC] [real] NOT NULL,

	--/ <summary>Error in [Fe/H] estimate from CaIIK3</summary>
	--/ <quantity>stat.error;phys.abund.Fe</quantity>
	--/ <unit>dex</unit>
	[FEHCAIIK3UNC] [real] NOT NULL,

	--/ <summary>Error in [Fe/H] estimate from WBG</summary>
	--/ <quantity>stat.error;phys.abund.Fe</quantity>
	--/ <unit>dex</unit>
	[FEHWBGUNC] [real] NOT NULL,

	--/ <summary>Error in [Fe/H] estimate from k24</summary>
	--/ <quantity>stat.error;phys.abund.Fe</quantity>
	--/ <unit>dex</unit>
	[FEHK24UNC] [real] NOT NULL,

	--/ <summary>Error in [Fe/H] estimate from ki13</summary>
	--/ <quantity>stat.error;phys.abund.Fe</quantity>
	--/ <unit>dex</unit>
	[FEHKI13UNC] [real] NOT NULL,

	--/ <summary>Average S/N per pixel over 4000 - 8000 A</summary>
	--/ <quantity>stat.snr;stat.mean</quantity>
	[SNR] [real] NOT NULL,

	--/ <summary>Quality check on spectrum, depending on S/N</summary>
	--/ <quantity>meta.code.qual</quantity>
	[QA] [tinyint] NOT NULL,

	--/ <summary>Correlation coefficient over 3850-4250 A</summary>
	--/ <quantity>stat.correlation</quantity>
	[CCCAHK] [real] NOT NULL,

	--/ <summary>Correlation coefficient over 4500-5500 A</summary>
	--/ <quantity>stat.correlation</quantity>
	[CCMGH] [real] NOT NULL,

	--/ <summary>Spectroscopically determined Teff, color independent</summary>
	--/ <quantity>phys.temperature.effective</quantity>
	--/ <unit>K</unit>
	[TEFFSPEC] [real] NOT NULL,

	--/ <summary>Number of estimators used in average</summary>
	--/ <quantity>meta.number</quantity>
	[TEFFSPECN] [tinyint] NOT NULL,

	--/ <summary>Error in the spectroscopically determined Teff</summary>
	--/ <quantity>stat.error;phys.temperature.effective</quantity>
	--/ <unit>K</unit>
	[TEFFSPECUNC] [real] NOT NULL,

	--/ <summary>Spectroscopically determined log g, color independent</summary>
	--/ <quantity>phys.gravity</quantity>
	--/ <unit>dex</unit>
	[LOGGSPEC] [real] NOT NULL,

	--/ <summary>Number of estimators used in average</summary>
	--/ <quantity>meta.number</quantity>
	[LOGGSPECN] [tinyint] NOT NULL,

	--/ <summary>Error in the spectroscopically determined log g</summary>
	--/ <quantity>stat.error;phys.gravity</quantity>
	--/ <unit>dex</unit>
	[LOGGSPECUNC] [real] NOT NULL,

	--/ <summary>Spectroscopically determined [Fe/H], color independent</summary>
	--/ <quantity>phys.abund.Fe</quantity>
	[FEHSPEC] [real] NOT NULL,

	--/ <summary>Number of estimators used in average</summary>
	--/ <quantity>meta.number</quantity>
	[FEHSPECN] [tinyint] NOT NULL,

	--/ <summary>Error in the spectroscopically determined [Fe/H]</summary>
	--/ <quantity>stat.error;phys.abund.Fe</quantity>
	[FEHSPECUNC] [real] NOT NULL,

	--/ <summary>Auto-Correlation Function over 4000-4086/4116-4325/4355-4500</summary>
	--/ <quantity>stat.correlation</quantity>
	[ACF1] [real] NOT NULL,

	--/ <summary>Average signal-to-noise ratio in Auto-Correlation Function 1 (ACF1)</summary>
	--/ <quantity>stat.snr;stat.mean</quantity>
	[ACF1SNR] [real] NOT NULL,

	--/ <summary>Auto-Correlation Functioin over 4000-4086/4116-4280/4280-4500</summary>
	--/ <quantity>stat.correlation</quantity>
	[ACF2] [real] NOT NULL,

	--/ <summary>Average signal-to-noise ratio in Auto-Correlation Function 2 (ACF2)</summary>
	--/ <quantity>stat.snr;stat.mean</quantity>
	[ACF2SNR] [real] NOT NULL,

	--/ <summary>Flag with combination of six letters among FTtMmCn, for inspecting spectra</summary>
	--/ <quantity>meta.code</quantity>
	[INSPECT] [varchar](32) NOT NULL,

	--/ <summary>Velocity as measured by Elodie library templates, converted to km/s and with the empirical 7.3 km/s offset applied (see Yanny et al. 2009, AJ, 137, 4377)</summary>
	--/ <quantity>spect.dopplerVeloc</quantity>
	--/ <unit>km s-1</unit>
	[ELODIERVFINAL] [real] NOT NULL,

	--/ <summary>Uncertainty in the measured Elodie RV, as determined from the chisq template-fitting routine. See the discussion of empirically-determined velocity errors in Yanny et al. 2009, AJ, 137, 4377</summary>
	--/ <quantity>stat.error;spect.dopplerVeloc</quantity>
	--/ <unit>km s-1</unit>
	[ELODIERVFINALERR] [real] NOT NULL,

	--/ <summary>Warning flags about velocity/redshift determinations</summary>
	--/ <quantity>meta.code</quantity>
	[ZWARNING] [bigint] NOT NULL,

	--/ <summary>Teff from Infrared Flux Methods (IRFM)</summary>
	--/ <quantity>phys.temperature.effective</quantity>
	--/ <unit>K</unit>
	[TEFFIRFM] [real] NOT NULL,

	--/ <summary>Indicator variable, = 0 bad, = 1 good</summary>
	--/ <quantity>meta.code.qual;phys.temperature.effective</quantity>
	[TEFFIRFMIND] [tinyint] NOT NULL,

	--/ <summary>Error in Teff estimate from IRFM</summary>
	--/ <quantity>stat.error;phys.temperature.effective</quantity>
	--/ <unit>K</unit>
	[TEFFIRFMUNC] [real] NOT NULL,

	--/ <summary>log g estimate from NGS1 while fixing Teff from IRFM</summary>
	--/ <quantity>phys.gravity</quantity>
	--/ <unit>dex</unit>
	[LOGGNGS1IRFM] [real] NOT NULL,

	--/ <summary>Indicator variable, = 0 bad, = 1 good</summary>
	--/ <quantity>meta.code.qual;phys.gravity</quantity>
	[LOGGNGS1IRFMIND] [tinyint] NOT NULL,

	--/ <summary>Error in log g from NGS1 while fixing Teff from IRFM</summary>
	--/ <quantity>stat.error;phys.gravity</quantity>
	--/ <unit>dex</unit>
	[LOGGNGS1IRFMUNC] [real] NOT NULL,

	--/ <summary>[Fe/H] estimate from NGS1 while fixing Teff from IRFM</summary>
	--/ <quantity>phys.abund.Fe</quantity>
	--/ <unit>dex</unit>
	[FEHNGS1IRFM] [real] NOT NULL,

	--/ <summary>Indicator variable, = 0 bad, = 1 good</summary>
	--/ <quantity>meta.code.qual;phys.abund.Fe</quantity>
	[FEHNGS1IRFMIND] [tinyint] NOT NULL,

	--/ <summary>Error in [Fe/H] from NGS1 while fixing Teff from IRFM</summary>
	--/ <quantity>stat.error;phys.abund.Fe</quantity>
	--/ <unit>dex</unit>
	[FEHNGS1IRFMUNC] [real] NOT NULL,

	--/ <summary>log g estimate from CAI1 with fixed IRFM Teff</summary>
	--/ <quantity>phys.gravity</quantity>
	--/ <unit>dex</unit>
	[LOGGCAI1IRFM] [real] NOT NULL,

	--/ <summary>Indicator variable, =0 bad, = 1 good</summary>
	--/ <quantity>meta.code.qual;phys.gravity</quantity>
	[LOGGCAI1IRFMIND] [tinyint] NOT NULL,

	--/ <summary>Error in log g from CAI1 with fixed IRFM Teff</summary>
	--/ <quantity>stat.error;phys.gravity</quantity>
	--/ <unit>dex</unit>
	[LOGGCAI1IRFMUNC] [real] NOT NULL,

	--/ <summary>[Fe/H] from CaIIK1 with fixed IRFM Teff</summary>
	--/ <quantity>phys.abund.Fe</quantity>
	--/ <unit>dex</unit>
	[FEHCAIIK1IRFM] [real] NOT NULL,

	--/ <summary>Indicator variable, =0 bad, = 1 good</summary>
	--/ <quantity>meta.code.qual;phys.abund.Fe</quantity>
	[FEHCAIIK1IRFMIND] [tinyint] NOT NULL,

	--/ <summary>Error in [Fe/H] from CaIIK1 with fixed IRFM Teff</summary>
	--/ <quantity>stat.error;phys.abund.Fe</quantity>
	--/ <unit>dex</unit>
	[FEHCAIIK1IRFMUNC] [real] NOT NULL,
 CONSTRAINT [pk_sppParams_specObjID] PRIMARY KEY CLUSTERED 
(
	[SPECOBJID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[sppTargets]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

--/ <summary> Derived quantities calculated by the SEGUE-2 target selection pipeline. </summary>
--/ <remarks> There are one of these files per plate. The file has one HDU.  That HDU has one row for every object in photoObjAll that is  classified as a star inside a 94.4 arcmin radius of the center of the  plate.  The data for each object are elements of the photoObjAll, specObjAll,   sppPrams and propermotions tables taken unaltered from the CAS and derived   quantities calculated by the segue-2 target selection code.  Appended to the  end are the two target selection bitmasks, segue2_target1 and segue2_target2,   as set by the target selection code.&lt;br> &lt;br>  &lt;i>Columns from OBJID through PSFMAGERR_:&lt;/i> &lt;br>  These are taken directly from photoObjAll &lt;br>  &lt;br>  &lt;i>Columns from PLATEID through SEGUE2_TARGET2:&lt;/i> &lt;br>  These are taken from the specObjAll and sppParams tables for any  objects in this file that have matches in that specObjAll.  For  objects without matches in specObjAll, values are set to -9999.  The names from SpecObjAll are unchanged. &lt;br> &lt;br>  &lt;i>Columns from MATCH through DIST20: &lt;/i>&lt;br>  These are taken from the propermotions table, the USNOB proper  motions as recalibrated with the SDSS by Jeff Munn.  For objects  without matches in the ProperMotions table, values are set to -9999.  The names are unchanged from the propermotions table. &lt;br> &lt;br>  &lt;i>Columns from uMAG0 through VTOT_GALRADREST:&lt;/i> &lt;br>  These are the derived quanitites calculated  by the procedure  calderivedquantities in derivedquant.pro in the segue-2 target  selection code.  With the addition of these, this file contains all  the quanitites that the selection code operates on when choosing targets.&lt;br> &lt;br>  &lt;i>Columns MG_TOHV through V1SIGMAERR_TOHV:&lt;/i> &lt;br>  These were added for the November 2008 drilling run and after.  The earlier files will be retrofit (eventually). </remarks>
CREATE TABLE [dbo].[sppTargets](

	--/ <summary>Object ID matching DR8</summary>
	--/ <quantity>meta.id</quantity>
	[OBJID] [bigint] NOT NULL,

	--/ <summary>Run number</summary>
	--/ <quantity>meta.id</quantity>
	[RUN] [bigint] NOT NULL,

	--/ <summary>Rerun number</summary>
	--/ <quantity>meta.id</quantity>
	[RERUN] [bigint] NOT NULL,

	--/ <summary>Camera column number</summary>
	--/ <quantity>meta.id;instr.det</quantity>
	[CAMCOL] [bigint] NOT NULL,

	--/ <summary>Field number</summary>
	--/ <quantity>meta.id;obs.field</quantity>
	[FIELD] [bigint] NOT NULL,

	--/ <summary>Object</summary>
	--/ <quantity>meta.id</quantity>
	[OBJ] [bigint] NOT NULL,

	--/ <summary>RA</summary>
	--/ <quantity>pos.eq.ra</quantity>
	--/ <unit>deg</unit>
	[RA] [float] NOT NULL,

	--/ <summary>Dec</summary>
	--/ <quantity>pos.eq.dec</quantity>
	--/ <unit>deg</unit>
	[DEC] [float] NOT NULL,

	--/ <summary>Galactic longitude</summary>
	--/ <quantity>pos.galactic.lon</quantity>
	--/ <unit>deg</unit>
	[L] [float] NOT NULL,

	--/ <summary>Galactic latitude</summary>
	--/ <quantity>pos.galactic.lat</quantity>
	--/ <unit>deg</unit>
	[B] [float] NOT NULL,

	--/ <summary>u band fiber magnitudue</summary>
	--/ <quantity>phot.mag.fiber;em.opt.SDSS.u</quantity>
	--/ <unit>mag</unit>
	[FIBERMAG_u] [real] NOT NULL,

	--/ <summary>g band fiber magnitudue</summary>
	--/ <quantity>phot.mag.fiber;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[FIBERMAG_g] [real] NOT NULL,

	--/ <summary>r band fiber magnitudue</summary>
	--/ <quantity>phot.mag.fiber;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[FIBERMAG_r] [real] NOT NULL,

	--/ <summary>i band fiber magnitudue</summary>
	--/ <quantity>phot.mag.fiber;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[FIBERMAG_i] [real] NOT NULL,

	--/ <summary>z band fiber magnitudue</summary>
	--/ <quantity>phot.mag.fiber;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[FIBERMAG_z] [real] NOT NULL,

	--/ <summary>u band PSF magnitude</summary>
	--/ <quantity>phot.mag.psf;em.opt.SDSS.u</quantity>
	--/ <unit>mag</unit>
	[PSFMAG_u] [real] NOT NULL,

	--/ <summary>g band PSF magnitude</summary>
	--/ <quantity>phot.mag.psf;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[PSFMAG_g] [real] NOT NULL,

	--/ <summary>r band PSF magnitude</summary>
	--/ <quantity>phot.mag.psf;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[PSFMAG_r] [real] NOT NULL,

	--/ <summary>i band PSF magnitude</summary>
	--/ <quantity>phot.mag.psf;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[PSFMAG_i] [real] NOT NULL,

	--/ <summary>z band PSF magnitude</summary>
	--/ <quantity>phot.mag.psf;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[PSFMAG_z] [real] NOT NULL,

	--/ <summary>u band extinction</summary>
	--/ <quantity>phys.absorption.gal;em.opt.SDSS.u</quantity>
	--/ <unit>mag</unit>
	[EXTINCTION_u] [real] NOT NULL,

	--/ <summary>g band extinction</summary>
	--/ <quantity>phys.absorption.gal;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[EXTINCTION_g] [real] NOT NULL,

	--/ <summary>r band extinction</summary>
	--/ <quantity>phys.absorption.gal;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[EXTINCTION_r] [real] NOT NULL,

	--/ <summary>i band extinction</summary>
	--/ <quantity>phys.absorption.gal;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[EXTINCTION_i] [real] NOT NULL,

	--/ <summary>z band extinction</summary>
	--/ <quantity>phys.absorption.gal;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[EXTINCTION_z] [real] NOT NULL,

	--/ <summary>row centroid</summary>
	--/ <quantity>pos.cartesian.x</quantity>
	--/ <unit>pix</unit>
	[ROWC] [int] NOT NULL,

	--/ <summary>column centroid</summary>
	--/ <quantity>pos.cartesian.y</quantity>
	--/ <unit>pix</unit>
	[COLC] [int] NOT NULL,

	--/ <summary>object type from photometric reductions</summary>
	--/ <quantity>src.class</quantity>
	[TYPE] [int] NOT NULL,

	--/ <summary>combined flags from all bands</summary>
	--/ <quantity>meta.code</quantity>
	[FLAGS] [bigint] NOT NULL,

	--/ <summary>u band flag</summary>
	--/ <quantity>meta.code;em.opt.SDSS.u</quantity>
	[FLAGS_u] [bigint] NOT NULL,

	--/ <summary>g band flag</summary>
	--/ <quantity>meta.code;em.opt.SDSS.g</quantity>
	[FLAGS_g] [bigint] NOT NULL,

	--/ <summary>r band flag</summary>
	--/ <quantity>meta.code;em.opt.SDSS.r</quantity>
	[FLAGS_r] [bigint] NOT NULL,

	--/ <summary>i band flag</summary>
	--/ <quantity>meta.code;em.opt.SDSS.i</quantity>
	[FLAGS_i] [bigint] NOT NULL,

	--/ <summary>z band flag</summary>
	--/ <quantity>meta.code;em.opt.SDSS.z</quantity>
	[FLAGS_z] [bigint] NOT NULL,

	--/ <summary>Error in u band PSF magnitude</summary>
	--/ <quantity>stat.error;em.opt.SDSS.u</quantity>
	--/ <unit>mag</unit>
	[PSFMAGERR_u] [real] NOT NULL,

	--/ <summary>Error in g band PSF magnitude</summary>
	--/ <quantity>stat.error;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[PSFMAGERR_g] [real] NOT NULL,

	--/ <summary>Error in r band PSF magnitude</summary>
	--/ <quantity>stat.error;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[PSFMAGERR_r] [real] NOT NULL,

	--/ <summary>Error in i band PSF magnitude</summary>
	--/ <quantity>stat.error;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[PSFMAGERR_i] [real] NOT NULL,

	--/ <summary>Error in z band PSF magnitude</summary>
	--/ <quantity>stat.error;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[PSFMAGERR_z] [real] NOT NULL,

	--/ <summary>Hash of plate and MJD</summary>
	--/ <quantity>meta.id</quantity>
	[PLATEID] [bigint] NOT NULL,

	--/ <summary>Spectroscopic object ID</summary>
	--/ <quantity>meta.id;spect</quantity>
	[SPECOBJID] [bigint] NOT NULL,

	--/ <summary>Plate number</summary>
	--/ <quantity>meta.id;instr.det</quantity>
	[PLATE] [bigint] NOT NULL,

	--/ <summary>Modified Julian Date</summary>
	--/ <quantity>time.epoch</quantity>
	[MJD] [bigint] NOT NULL,

	--/ <summary>Fiber number</summary>
	--/ <quantity>meta.id;instr.param</quantity>
	[FIBERID] [bigint] NOT NULL,

	--/ <summary>Original plate ID hash (if targeted based on previous spectrum)</summary>
	--/ <quantity>meta.id;instr.det</quantity>
	[ORIGINALPLATEID] [bigint] NOT NULL,

	--/ <summary>Original spectroscopic object ID (if targeted based on previous spectrum)</summary>
	--/ <quantity>meta.id;spect</quantity>
	[ORIGINALSPECOBJID] [bigint] NOT NULL,

	--/ <summary>Original plate number   (if targeted based on previous spectrum)</summary>
	--/ <quantity>meta.id;instr.det</quantity>
	[ORIGINALPLATE] [bigint] NOT NULL,

	--/ <summary>Original Modified Julian Date   (if targeted based on previous spectrum)</summary>
	--/ <quantity>time.epoch</quantity>
	[ORIGINALMJD] [bigint] NOT NULL,

	--/ <summary>Original fiber number	(if targeted based on previous spectrum)(if targeted based on previous spectrum)</summary>
	--/ <quantity></quantity>
	[ORIGINALFIBERID] [bigint] NOT NULL,

	--/ <summary>Best object ID</summary>
	--/ <quantity>meta.id</quantity>
	[BESTOBJID] [bigint] NOT NULL,

	--/ <summary>Target object ID</summary>
	--/ <quantity>meta.id</quantity>
	[TARGETOBJID] [bigint] NOT NULL,

	--/ <summary>Primary target</summary>
	--/ <quantity>meta.id</quantity>
	[PRIMTARGET] [int] NOT NULL,

	--/ <summary>Secondary target</summary>
	--/ <quantity>meta.id</quantity>
	[SECTARGET] [int] NOT NULL,

	--/ <summary>SEGUE-1 target selection information at plate design, primary science selection</summary>
	--/ <quantity>meta.code</quantity>
	[SEGUE1_TARGET1] [bigint] NOT NULL,

	--/ <summary>SEGUE-1 target selection information at plate design, secondary/qa/calib selection</summary>
	--/ <quantity>meta.code</quantity>
	[SEGUE1_TARGET2] [bigint] NOT NULL,

	--/ <summary>bitmask that records the category or categories for which this object passed the selection criteria</summary>
	--/ <quantity>meta.code</quantity>
	[SEGUE2_TARGET1] [int] NOT NULL,

	--/ <summary>bitmask that records the category or categories of "standards" for the pipeline, special calibration targets like Stetson standards or globular cluster stars, for which this object passed the selection criteria</summary>
	--/ <quantity>meta.code</quantity>
	[SEGUE2_TARGET2] [int] NOT NULL,

	--/ <summary>??</summary>
	--/ <quantity></quantity>
	[MATCH] [bigint] NOT NULL,

	--/ <summary>??</summary>
	--/ <quantity></quantity>
	[DELTA] [float] NOT NULL,

	--/ <summary>Proper motion in Galactic longitude</summary>
	--/ <quantity>pos.pm;pos.galactic.lon</quantity>
	--/ <unit>mas yr-1</unit>
	[PML] [float] NOT NULL,

	--/ <summary>Proper motion in Galactic latitude</summary>
	--/ <quantity>pos.pm;pos.galactic.lat</quantity>
	--/ <unit>mas yr-1</unit>
	[PMB] [float] NOT NULL,

	--/ <summary>Proper motion in RA</summary>
	--/ <quantity>pos.pm;pos.eq.ra</quantity>
	--/ <unit>mas yr-1</unit>
	[PMRA] [float] NOT NULL,

	--/ <summary>Proper motion in DEC</summary>
	--/ <quantity>pos.pm;pos.eq.dec</quantity>
	--/ <unit>mas yr-1</unit>
	[PMDEC] [float] NOT NULL,

	--/ <summary>Proper motion error in RA</summary>
	--/ <quantity>stat.error;pos.eq.ra</quantity>
	--/ <unit>mas yr-1</unit>
	[PMRAERR] [float] NOT NULL,

	--/ <summary>Proper motion error in DEC</summary>
	--/ <quantity>stat.error;pos.eq.dec</quantity>
	--/ <unit>mas yr-1</unit>
	[PMDECERR] [float] NOT NULL,

	--/ <unit>mas yr-1</unit>
	[PMSIGRA] [float] NOT NULL,

	--/ <unit>mas yr-1</unit>
	[PMSIGDEC] [float] NOT NULL,

	[NFIT] [int] NOT NULL,

	[DIST22] [float] NOT NULL,

	[DIST20] [float] NOT NULL,

	--/ <summary>u extinction-corrected (SFD 98) psf magnitude</summary>
	--/ <quantity>phot.mag.psf.redFree;em.opt.SDSS.u</quantity>
	--/ <unit>mag</unit>
	[uMAG0] [real] NOT NULL,

	--/ <summary>g extinction-corrected (SFD 98) psf magnitude</summary>
	--/ <quantity>phot.mag.psf.redFree;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[gMAG0] [real] NOT NULL,

	--/ <summary>r extinction-corrected (SFD 98) psf magnitude</summary>
	--/ <quantity>phot.mag.psf.redFree;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[rMAG0] [real] NOT NULL,

	--/ <summary>i extinction-corrected (SFD 98) psf magnitude</summary>
	--/ <quantity>phot.mag.psf.redFree;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[iMAG0] [real] NOT NULL,

	--/ <summary>z extinction-corrected (SFD 98) psf magnitude</summary>
	--/ <quantity>phot.mag.psf.redFree;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[zMAG0] [real] NOT NULL,

	--/ <summary>u-g, extinction corrected magnitudes</summary>
	--/ <quantity>phot.color;em.opt.SDSS.u;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[umg0] [real] NOT NULL,

	--/ <summary>g-r, extinction corrected magnitudes</summary>
	--/ <quantity>phot.color;em.opt.SDSS.g;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[gmr0] [real] NOT NULL,

	--/ <summary>r-i, extinction corrected magnitudes</summary>
	--/ <quantity>phot.color;em.opt.SDSS.r;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[rmi0] [real] NOT NULL,

	--/ <summary>i-z, extinction corrected magnitudes</summary>
	--/ <quantity>phot.color;em.opt.SDSS.i;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[imz0] [real] NOT NULL,

	--/ <summary>g-i, extinction corrected magnitudes</summary>
	--/ <quantity>phot.color;em.opt.SDSS.g;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[gmi0] [real] NOT NULL,

	--/ <summary>PSFMAGERR_u and PSFMAGERR_g added in quadrature</summary>
	--/ <quantity>stat.erro;phot.color;em.opt.SDSS.u;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[umgERR] [real] NOT NULL,

	--/ <summary>PSFMAGERR_g and PSFMAGERR_r added in quadrature</summary>
	--/ <quantity>stat.erro;phot.color;em.opt.SDSS.g;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[gmrERR] [real] NOT NULL,

	--/ <summary>PSFMAGERR_r and PSFMAGERR_i added in quadrature</summary>
	--/ <quantity>stat.erro;phot.color;em.opt.SDSS.r;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[rmiERR] [real] NOT NULL,

	--/ <summary>PSFMAGERR_i and PSFMAGERR_z added in quadrature</summary>
	--/ <quantity>stat.erro;phot.color;em.opt.SDSS.i;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[imzERR] [real] NOT NULL,

	--/ <summary>psfmag_u-psfmag_g, no extinction correction</summary>
	--/ <quantity>phot.color;em.opt.SDSS.u;em.opt.SDSS.g</quantity>
	--/ <unit>mag</unit>
	[PSFMAG_umg] [real] NOT NULL,

	--/ <summary>psfmag_g-psfmag_r, no extinction correction</summary>
	--/ <quantity>phot.color;em.opt.SDSS.g;em.opt.SDSS.r</quantity>
	--/ <unit>mag</unit>
	[PSFMAG_gmr] [real] NOT NULL,

	--/ <summary>psfmag_r-psfmag_i, no extinction correction</summary>
	--/ <quantity>phot.color;em.opt.SDSS.r;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[PSFMAG_rmi] [real] NOT NULL,

	--/ <summary>psfmag_i-psfmag_z, no extinction correction</summary>
	--/ <quantity>phot.color;em.opt.SDSS.i;em.opt.SDSS.z</quantity>
	--/ <unit>mag</unit>
	[PSFMAG_imz] [real] NOT NULL,

	--/ <summary>psfmag_g-psfmag_i, no extinction correction</summary>
	--/ <quantity>phot.color;em.opt.SDSS.g;em.opt.SDSS.i</quantity>
	--/ <unit>mag</unit>
	[PSFMAG_gmi] [real] NOT NULL,

	--/ <summary>-0.436*uMag+1.129*gMag-0.119*rMag-0.574*iMag+0.1984 (Lenz et al.1998)</summary>
	--/ <quantity>phot.color</quantity>
	--/ <unit>mag</unit>
	[lcolor] [real] NOT NULL,

	--/ <summary>-0.249*uMag+0.794*gMag-0.555*rMag+0.234+0.011*p1s-0.010 (Helmi et al. 2003) used in SEGUE-1 target selection, unused in SEGUE-2</summary>
	--/ <quantity>phot.color</quantity>
	--/ <unit>mag</unit>
	[scolor] [real] NOT NULL,

	--/ <summary>0.91*umg+0.415*umg-1.280 (Helmi et al. 2003) used in SEGUE-1 target selection, unused in SEGUE-2</summary>
	--/ <quantity>phot.color</quantity>
	--/ <unit>mag</unit>
	[p1s] [real] NOT NULL,

	--/ <summary>sqrt(PMRA*PMRA+PMDEC*PMDEC), in mas/year</summary>
	--/ <quantity>pos.pm</quantity>
	--/ <unit>mas yr-1</unit>
	[TOTALPM] [real] NOT NULL,

	--/ <summary>reduced proper motion, gMag+5*log10(TOTALPM/1000)+5</summary>
	--/ <quantity>pos.pm</quantity>
	--/ <unit>mag</unit>
	[Hg] [real] NOT NULL,

	--/ <summary>4.471+7.907*imz-0.837*imz*imz used in SEGUE-1 target selection, unused in SEGUE-2</summary>
	--/ <quantity>phot.color</quantity>
	--/ <unit>mag</unit>
	[Mi] [real] NOT NULL,

	--/ <summary>10^((iMag-Mi+5)/5.0) used in SEGUE-1 target selection, unused in SEGUE-2</summary>
	--/ <quantity>phot.mag</quantity>
	--/ <unit>mag</unit>
	[DISTi] [real] NOT NULL,

	--/ <summary>reduced pm (uncorr r): PSFMAG_r+5*log10(TOTALPM/1000)+5</summary>
	--/ <quantity>pos.pm</quantity>
	--/ <unit>mag</unit>
	[Hr] [real] NOT NULL,

	--/ <summary>V-I from VMAG_TRANS-(iMag-0.337*rmi-0.37)</summary>
	--/ <quantity>phot.color;em.opt.V;em.opt.I</quantity>
	--/ <unit>mag</unit>
	[VMI_TRANS1] [real] NOT NULL,

	--/ <summary>V-I from 0.877*gmr+0.358</summary>
	--/ <quantity>phot.color;em.opt.V;em.opt.I</quantity>
	--/ <unit>mag</unit>
	[VMI_TRANS2] [real] NOT NULL,

	--/ <summary>V mag from gMag - 0.587*gmr -0.011</summary>
	--/ <quantity>phot.mag;em.opt.V</quantity>
	--/ <unit>mag</unit>
	[VMAG_TRANS] [real] NOT NULL,

	--/ <summary>not stuffed</summary>
	--/ <quantity></quantity>
	--/ <unit>mag</unit>
	[MV_TRANS] [real] NOT NULL,

	--/ <summary>10^(dmV/5.-2.) where VMAG_TRANS-(3.37*VMI_TRANS1+2.89)</summary>
	--/ <quantity></quantity>
	--/ <unit>kpc</unit>
	[DISTV_KPC] [real] NOT NULL,

	--/ <summary>transverse velocity, km/s, derived from TOTALPM and DISTV_KPC, in a frame at rest w.r.t the Galaxy</summary>
	--/ <quantity>phys.veloc.transverse</quantity>
	--/ <unit>km s-1</unit>
	[VTRANS_GALREST] [real] NOT NULL,

	--/ <summary>derived PM (mas/year) perpendicular to the Galactocentric radial vector, assuming all motion is along a Galactocentric radial vector, in a frame at rest w.r.t the Galaxy</summary>
	--/ <quantity>pos.pm</quantity>
	--/ <unit>mas yr-1</unit>
	[MUTRANS_GALRADREST] [real] NOT NULL,

	--/ <summary>derived PM (mas/year) along the Galactocentric radial vector, assuming all motion is along a Galactocentric radial vector, in a frame at rest w.r.t the Galaxy</summary>
	--/ <quantity>pos.pm</quantity>
	--/ <unit>mas yr-1</unit>
	[MURAD_GALRADREST] [real] NOT NULL,

	--/ <summary>total velocioty, km/s, derived from TOTALPM and DISTV_KPC, in a frame at rest w.r.t the Galaxy</summary>
	--/ <quantity>phys.veloc</quantity>
	--/ <unit>km s-1</unit>
	[VTOT_GALRADREST] [real] NOT NULL,

	--/ <summary>5.7 + 10.0*(GMR - 0.375)</summary>
	--/ <quantity>phot.mag</quantity>
	--/ <unit>mag</unit>
	[MG_TOHV] [real] NOT NULL,

	--/ <summary>transverse velocity in Galactocentric coords, using the distance estimate from MG_TOHV which is appropriate for old stars near the MSTO and corrected for peculiar solar motion 16.6 km/s toward RA,Dec 267.5,28.1</summary>
	--/ <quantity>phys.veloc.transverse</quantity>
	--/ <unit>km s-1</unit>
	[VTRANS_TOHV] [real] NOT NULL,

	--/ <summary>Estimate of the 1-sigma error in total proper motion at this r magnitude.  Formula is sqrt(4.56*4.56 + frate*2.30*2.30), where frate is 10^(0.4*(rMag-19.5)).  The constants come from the Munn et al. 2004 (AJ, 127, 3034) paper describing the recalibration of USNOB with SDSS.</summary>
	--/ <quantity>stat.error;pos.pm;em.opt.SDSS.r</quantity>
	--/ <unit>mas yr-1</unit>
	[PM1SIGMA_TOHV] [real] NOT NULL,

	--/ <summary>The corresponding 1-sigma error in the transverse velocity based on PM1SIGMA_TOHV and the the distance estimate using MG_TOHV</summary>
	--/ <quantity>stat.error;phys.veloc.transverse</quantity>
	--/ <unit>km s-1</unit>
	[V1SIGMAERR_TOHV] [real] NOT NULL,

	--/ <summary>version of target used</summary>
	--/ <quantity>meta.version</quantity>
	[TARGET_VERSION] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[stellarMassFSPSGranEarlyDust]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--/ <summary> Estimated stellar masses for SDSS and BOSS galaxies (Granada method, early-star-formation with dust) </summary>
--/ <remarks> Stellar masses using FSPS models of &lt;a href='http://adsabs.harvard.edu/abs/2009ApJ...699..486C'>Conroy et al. (2009)&lt;/a>  fit to SDSS photometry in ugriz.  The fit is carried out on extinction corrected model magnitudes that are scaled   to the i-band c-model magnitude. This 'early-star-formation' version restricts the assumption about  when the star-formation in the galaxy could occur to within 2 Gyrs of the Big Bang.  This version also fits for   dust extinction. </remarks>
CREATE TABLE [dbo].[stellarMassFSPSGranEarlyDust](

	--/ <summary>Unique ID</summary>
	--/ <quantity>meta.id</quantity>
	[specObjID] [bigint] NOT NULL,

	--/ <summary>Plate number</summary>
	--/ <quantity>meta.id;instr.det</quantity>
	[plate] [smallint] NULL,

	--/ <summary>Fiber ID</summary>
	--/ <quantity>meta.id;instr.param</quantity>
	[fiberID] [smallint] NULL,

	--/ <summary>MJD of observation</summary>
	--/ <quantity>time.epoch;obs</quantity>
	--/ <unit>d</unit>
	[MJD] [int] NULL,

	--/ <summary>Right ascension of fiber, J2000</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[ra] [float] NULL,

	--/ <summary>Declination of fiber, J2000</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[dec] [float] NULL,

	--/ <summary>Redshift used (corresponds to z_noqso in specObjAll)</summary>
	--/ <quantity>src.redshift</quantity>
	[z] [real] NULL,

	--/ <summary>Error in z (corresponds to zErr_noqso in specObjAll)</summary>
	--/ <quantity>stat.error;src.redshift</quantity>
	[z_err] [real] NULL,

	--/ <summary>K+E corrections at z_0=0.55 in the u-band</summary>
	--/ <quantity>phot.mag.kc;em.opt.SDSS.u</quantity>
	[ke_u] [float] NULL,

	--/ <summary>K+E corrections at z_0=0.55 in the g-band</summary>
	--/ <quantity>phot.mag.kc;em.opt.SDSS.g</quantity>
	[ke_g] [float] NULL,

	--/ <summary>K+E corrections at z_0=0.55 in the r-band</summary>
	--/ <quantity>phot.mag.kc;em.opt.SDSS.r</quantity>
	[ke_r] [float] NULL,

	--/ <summary>K+E corrections at z_0=0.55 in the i-band</summary>
	--/ <quantity>phot.mag.kc;em.opt.SDSS.i</quantity>
	[ke_i] [float] NULL,

	--/ <summary>K+E corrections at z_0=0.55 in the z-band</summary>
	--/ <quantity>phot.mag.kc;em.opt.SDSS.z</quantity>
	[ke_z] [float] NULL,

	--/ <summary>Cmodel absolute magnitudes in the u-band, K+E corrected at z_0=0.55</summary>
	--/ <quantity>phot.mag.abs;em.opt.SDSS.u</quantity>
	[cModelAbsMag_u] [float] NULL,

	--/ <summary>Cmodel absolute magnitudes in the g-band, K+E corrected at z_0=0.55</summary>
	--/ <quantity>phot.mag.abs;em.opt.SDSS.g</quantity>
	[cModelAbsMag_g] [float] NULL,

	--/ <summary>Cmodel absolute magnitudes in the r-band, K+E corrected at z_0=0.55</summary>
	--/ <quantity>phot.mag.abs;em.opt.SDSS.r</quantity>
	[cModelAbsMag_r] [float] NULL,

	--/ <summary>Cmodel absolute magnitudes in the i-band, K+E corrected at z_0=0.55</summary>
	--/ <quantity>phot.mag.abs;em.opt.SDSS.i</quantity>
	[cModelAbsMag_i] [float] NULL,

	--/ <summary>Cmodel absolute magnitudes in the z-band, K+E corrected at z_0=0.55</summary>
	--/ <quantity>phot.mag.abs;em.opt.SDSS.z</quantity>
	[cModelAbsMag_z] [float] NULL,

	--/ <summary>Mass-to-light ratio in the u-band, K+E corrected at z_0=0.55</summary>
	--/ <quantity>phys.composition.massLightRatio;em.opt.SDSS.u</quantity>
	[m2l_u] [float] NULL,

	--/ <summary>Mass-to-light ratio in the g-band, K+E corrected at z_0=0.55</summary>
	--/ <quantity>phys.composition.massLightRatio;em.opt.SDSS.g</quantity>
	[m2l_g] [float] NULL,

	--/ <summary>Mass-to-light ratio in the r-band, K+E corrected at z_0=0.55</summary>
	--/ <quantity>phys.composition.massLightRatio;em.opt.SDSS.r</quantity>
	[m2l_r] [float] NULL,

	--/ <summary>Mass-to-light ratio in the i-band, K+E corrected at z_0=0.55</summary>
	--/ <quantity>phys.composition.massLightRatio;em.opt.SDSS.i</quantity>
	[m2l_i] [float] NULL,

	--/ <summary>Mass-to-light ratio in the z-band, K+E corrected at z_0=0.55</summary>
	--/ <quantity>phys.composition.massLightRatio;em.opt.SDSS.z</quantity>
	[m2l_z] [float] NULL,

	--/ <summary>Median Mass-to-light ratio in the u-band, K+E corrected at z_0=0.55. It corresponds to the value of PDF at which 50% of the M/L probability is accumulated</summary>
	--/ <quantity>phys.composition.massLightRatio;stat.median;em.opt.SDSS.u</quantity>
	[m2l_median_u] [float] NULL,

	--/ <summary>Median Mass-to-light ratio in the g-band, K+E corrected at z_0=0.55. It corresponds to the value of PDF at which 50% of the M/L probability is accumulated</summary>
	--/ <quantity>phys.composition.massLightRatio;stat.median;em.opt.SDSS.g</quantity>
	[m2l_median_g] [float] NULL,

	--/ <summary>Median Mass-to-light ratio in the r-band, K+E corrected at z_0=0.55. It corresponds to the value of PDF at which 50% of the M/L probability is accumulated</summary>
	--/ <quantity>phys.composition.massLightRatio;stat.median;em.opt.SDSS.r</quantity>
	[m2l_median_r] [float] NULL,

	--/ <summary>Median Mass-to-light ratio in the i-band, K+E corrected at z_0=0.55. It corresponds to the value of PDF at which 50% of the M/L probability is accumulated</summary>
	--/ <quantity>phys.composition.massLightRatio;stat.median;em.opt.SDSS.i</quantity>
	[m2l_median_i] [float] NULL,

	--/ <summary>Median Mass-to-light ratio in the z-band, K+E corrected at z_0=0.55. It corresponds to the value of PDF at which 50% of the M/L probability is accumulated</summary>
	--/ <quantity>phys.composition.massLightRatio;stat.median;em.opt.SDSS.z</quantity>
	[m2l_median_z] [float] NULL,

	--/ <summary>1-sigma error associated to M2L_Median in the u-band</summary>
	--/ <quantity>stat.error;phys.composition.massLightRatio;stat.median;em.opt.SDSS.u</quantity>
	[m2l_err_u] [float] NULL,

	--/ <summary>1-sigma error associated to M2L_Median in the g-band</summary>
	--/ <quantity>stat.error;phys.composition.massLightRatio;stat.median;em.opt.SDSS.g</quantity>
	[m2l_err_g] [float] NULL,

	--/ <summary>1-sigma error associated to M2L_Median in the r-band</summary>
	--/ <quantity>stat.error;phys.composition.massLightRatio;stat.median;em.opt.SDSS.r</quantity>
	[m2l_err_r] [float] NULL,

	--/ <summary>1-sigma error associated to M2L_Median in the i-band</summary>
	--/ <quantity>stat.error;phys.composition.massLightRatio;stat.median;em.opt.SDSS.i</quantity>
	[m2l_err_i] [float] NULL,

	--/ <summary>1-sigma error associated to M2L_Median in the z-band</summary>
	--/ <quantity>stat.error;phys.composition.massLightRatio;stat.median;em.opt.SDSS.z</quantity>
	[m2l_err_z] [float] NULL,

	--/ <summary>Minimum Mass-to-light ratio (lower 68% confidence level) in the u-band</summary>
	--/ <quantity>phys.composition.massLightRatio;stat.min;em.opt.SDSS.u</quantity>
	[m2l_min_u] [float] NULL,

	--/ <summary>Minimum Mass-to-light ratio (lower 68% confidence level) in the g-band</summary>
	--/ <quantity>phys.composition.massLightRatio;stat.min;em.opt.SDSS.g</quantity>
	[m2l_min_g] [float] NULL,

	--/ <summary>Minimum Mass-to-light ratio (lower 68% confidence level) in the r-band</summary>
	--/ <quantity>phys.composition.massLightRatio;stat.min;em.opt.SDSS.r</quantity>
	[m2l_min_r] [float] NULL,

	--/ <summary>Minimum Mass-to-light ratio (lower 68% confidence level) in the i-band</summary>
	--/ <quantity>phys.composition.massLightRatio;stat.min;em.opt.SDSS.i</quantity>
	[m2l_min_i] [float] NULL,

	--/ <summary>Minimum Mass-to-light ratio (lower 68% confidence level) in the z-band</summary>
	--/ <quantity>phys.composition.massLightRatio;stat.min;em.opt.SDSS.z</quantity>
	[m2l_min_z] [float] NULL,

	--/ <summary>Maximum Mass-to-light ratio (higher 68% confidence level) in the u-band</summary>
	--/ <quantity>phys.composition.massLightRatio;stat.max;em.opt.SDSS.u</quantity>
	[m2l_max_u] [float] NULL,

	--/ <summary>Maximum Mass-to-light ratio (higher 68% confidence level) in the g-band</summary>
	--/ <quantity>phys.composition.massLightRatio;stat.max;em.opt.SDSS.g</quantity>
	[m2l_max_g] [float] NULL,

	--/ <summary>Maximum Mass-to-light ratio (higher 68% confidence level) in the r-band</summary>
	--/ <quantity>phys.composition.massLightRatio;stat.max;em.opt.SDSS.r</quantity>
	[m2l_max_r] [float] NULL,

	--/ <summary>Maximum Mass-to-light ratio (higher 68% confidence level) in the i-band</summary>
	--/ <quantity>phys.composition.massLightRatio;stat.max;em.opt.SDSS.i</quantity>
	[m2l_max_i] [float] NULL,

	--/ <summary>Maximum Mass-to-light ratio (higher 68% confidence level) in the z-band</summary>
	--/ <quantity>phys.composition.massLightRatio;stat.max;em.opt.SDSS.z</quantity>
	[m2l_max_z] [float] NULL,

	--/ <summary>Best-fit stellar mass of galaxy</summary>
	--/ <quantity>phys.mass</quantity>
	--/ <unit>dex M_sol</unit>
	[logMass] [float] NULL,

	--/ <summary>Median stellar mass of galaxy. It corresponds to the value of PDF at which 50% of the stellar mass probability is accumulated (log base 10 in solar masses)</summary>
	--/ <quantity>phys.mass;stat.median</quantity>
	--/ <unit>dex M_sol</unit>
	[logMass_median] [float] NULL,

	--/ <summary>1-sigma error associated with LogMass_Median</summary>
	--/ <quantity>stat.error;phys.mass</quantity>
	--/ <unit>dex M_sol</unit>
	[logMass_err] [float] NULL,

	--/ <summary>Minimum stellar mass (lower 68% confidence level)</summary>
	--/ <quantity>phys.mass;stat.min</quantity>
	--/ <unit>dex M_sol</unit>
	[logMass_min] [float] NULL,

	--/ <summary>Maximum stellar mass (higher 68% confidence level)</summary>
	--/ <quantity>phys.mass;stat.max</quantity>
	--/ <unit>dex M_sol</unit>
	[logMass_max] [float] NULL,

	--/ <summary>Unreduced chi-square of best fit</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[chi2] [float] NULL,

	--/ <summary>Number of filters used in the fit (default is 5 for ugriz)</summary>
	--/ <quantity>meta.number</quantity>
	[nFilter] [smallint] NULL,

	--/ <summary>Best-fit look-back formation time</summary>
	--/ <quantity>time.age</quantity>
	--/ <unit>Gyr</unit>
	[t_age] [float] NULL,

	--/ <summary>Mean look-back formation time</summary>
	--/ <quantity>time.age;stat.mean</quantity>
	--/ <unit>Gyr</unit>
	[t_age_mean] [float] NULL,

	--/ <summary>1-sigma error for look-back formation time</summary>
	--/ <quantity>stat.error;time.age</quantity>
	--/ <unit>Gyr</unit>
	[t_age_err] [float] NULL,

	--/ <summary>Minimum value (lower 68% confidence level) for look-back formation time</summary>
	--/ <quantity>time.age;stat.min</quantity>
	--/ <unit>Gyr</unit>
	[t_age_min] [float] NULL,

	--/ <summary>Maximum value (higher 68% confidence level) for look-back formation time</summary>
	--/ <quantity>time.age;stat.max</quantity>
	--/ <unit>Gyr</unit>
	[t_age_max] [float] NULL,

	--/ <summary>Best-fit metallicity, where Z_sun=0.019</summary>
	--/ <quantity>phys.abund.Z</quantity>
	[metallicity] [float] NULL,

	--/ <summary>Mean metallicity</summary>
	--/ <quantity>phys.abund.Z;stat.mean</quantity>
	[metallicity_mean] [float] NULL,

	--/ <summary>1-sigma error for metallicity</summary>
	--/ <quantity>stat.error;phys.abund.Z</quantity>
	[metallicity_err] [float] NULL,

	--/ <summary>Minimum value (lower 68% confidence level) for metallicity</summary>
	--/ <quantity>phys.abund.Z;stat.min</quantity>
	[metallicity_min] [float] NULL,

	--/ <summary>Maximum value (higher 68% confidence level) for metallicity</summary>
	--/ <quantity>phys.abund.Z;stat.max</quantity>
	[metallicity_max] [float] NULL,

	--/ <summary>Best-fit value for dust attenuation around young stars</summary>
	--/ <quantity>phys.absorption</quantity>
	[dust1] [float] NULL,

	--/ <summary>Mean value for dust attenuation around young stars</summary>
	--/ <quantity>phys.absorption;stat.mean</quantity>
	[dust1_mean] [float] NULL,

	--/ <summary>1-sigma error for dust attenuation around young stars</summary>
	--/ <quantity>stat.error;phys.absorption</quantity>
	[dust1_err] [float] NULL,

	--/ <summary>Minimum value dust attenuation around young stars (lower 68% confidence level)</summary>
	--/ <quantity>phys.absorption;stat.min</quantity>
	[dust1_min] [float] NULL,

	--/ <summary>Maximum value dust attenuation around young stars (higher 68% confidence level)</summary>
	--/ <quantity>phys.absorption;stat.max</quantity>
	[dust1_max] [float] NULL,

	--/ <summary>Best-fit value for dust attenuation around old stars</summary>
	--/ <quantity>phys.absorption</quantity>
	[dust2] [float] NULL,

	--/ <summary>Mean value for dust attenuation around old stars</summary>
	--/ <quantity>phys.absorption;stat.mean</quantity>
	[dust2_mean] [float] NULL,

	--/ <summary>1-sigma error for dust attenuation around old stars</summary>
	--/ <quantity>stat.error;phys.absorption</quantity>
	[dust2_err] [float] NULL,

	--/ <summary>Minimum value for dust attenuation around old stars (lower 68% confidence level)</summary>
	--/ <quantity>phys.absorption;stat.min</quantity>
	[dust2_min] [float] NULL,

	--/ <summary>Maximum value for dust attenuation around old stars (higher 68% confidence level)</summary>
	--/ <quantity>phys.absorption;stat.max</quantity>
	[dust2_max] [float] NULL,

	--/ <summary>Best-fit star formation history e-folding time (tau)</summary>
	--/ <quantity>time.duration</quantity>
	--/ <unit>Gyr</unit>
	[tau] [float] NULL,

	--/ <summary>Mean star formation history e-folding time (tau)</summary>
	--/ <quantity>time.duration;stat.mean</quantity>
	--/ <unit>Gyr</unit>
	[tau_mean] [float] NULL,

	--/ <summary>1-sigma star formation history e-folding time (tau)</summary>
	--/ <quantity>stat.error;time.duration</quantity>
	--/ <unit>Gyr</unit>
	[tau_err] [float] NULL,

	--/ <summary>Minimum value (lower 68% confidence level) for star formation history e-folding time (tau)</summary>
	--/ <quantity>time.duration;stat.min</quantity>
	--/ <unit>Gyr</unit>
	[tau_min] [float] NULL,

	--/ <summary>Maximum value (higher 68% confidence level) for star formation history e-folding time (tau)</summary>
	--/ <quantity>time.duration;stat.max</quantity>
	--/ <unit>Gyr</unit>
	[tau_max] [float] NULL,

	--/ <summary>Best-fit mass-weighted average age of the stellar population</summary>
	--/ <quantity>time.age</quantity>
	--/ <unit>Gyr</unit>
	[age] [float] NULL,

	--/ <summary>Mean mass-weighted average age of the stellar population</summary>
	--/ <quantity>time.age;stat.mean</quantity>
	--/ <unit>Gyr</unit>
	[age_mean] [float] NULL,

	--/ <summary>Minimum value (lower 68% confidence level) for mass-weighted average age of the stellar population</summary>
	--/ <quantity>time.age;stat.min</quantity>
	--/ <unit>Gyr</unit>
	[age_min] [float] NULL,

	--/ <summary>Maximum value (higher 68% confidence level) for mass-weighted average age of the stellar population</summary>
	--/ <quantity>time.age;stat.max</quantity>
	--/ <unit>Gyr</unit>
	[age_max] [float] NULL,

	--/ <summary>Best-fit specific star formation rate</summary>
	--/ <quantity>phys.SFR</quantity>
	--/ <unit>log(Gyr-1)</unit>
	[ssfr] [float] NULL,

	--/ <summary>Mean specific star formation rate</summary>
	--/ <quantity>phys.SFR;stat.mean</quantity>
	--/ <unit>log(Gyr-1)</unit>
	[ssfr_mean] [float] NULL,

	--/ <summary>Minimum value (lower 68% confidence level) for specific star formation rate</summary>
	--/ <quantity>phys.SFR;stat.min</quantity>
	--/ <unit>log(Gyr-1)</unit>
	[ssfr_min] [float] NULL,

	--/ <summary>Maximum value (higher 68% confidence level) for specific star formation rate</summary>
	--/ <quantity>phys.SFR;stat.max</quantity>
	--/ <unit>log(Gyr-1)</unit>
	[ssfr_max] [float] NULL,
 CONSTRAINT [pk_stellarMassFSPSGranEarlyDust_] PRIMARY KEY CLUSTERED 
(
	[specObjID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[stellarMassFSPSGranEarlyNoDust]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--/ <summary> Estimated stellar masses for SDSS and BOSS galaxies (Granada method, early-star-formation with dust) </summary>
--/ <remarks> Stellar masses using FSPS models of &lt;a href='http://adsabs.harvard.edu/abs/2009ApJ...699..486C'>Conroy et al. (2009)&lt;/a>  fit to SDSS photometry in ugriz.  The fit is carried out on extinction corrected model magnitudes that are scaled   to the i-band c-model magnitude. This 'early-star-formation' version restricts the assumption about  when the star-formation in the galaxy could occur to within 2 Gyrs of the Big Bang.  This version assumes  no dust extinction. </remarks>
CREATE TABLE [dbo].[stellarMassFSPSGranEarlyNoDust](

	--/ <summary>Unique ID</summary>
	--/ <quantity>meta.id</quantity>
	[specObjID] [bigint] NOT NULL,

	--/ <summary>Plate number</summary>
	--/ <quantity>meta.id;instr.det</quantity>
	[plate] [smallint] NULL,

	--/ <summary>Fiber ID</summary>
	--/ <quantity>meta.id;instr.param</quantity>
	[fiberID] [smallint] NULL,

	--/ <summary>MJD of observation</summary>
	--/ <quantity>time.epoch;obs</quantity>
	--/ <unit>d</unit>
	[MJD] [int] NULL,

	--/ <summary>Right ascension of fiber, J2000</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[ra] [float] NULL,

	--/ <summary>Declination of fiber, J2000</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[dec] [float] NULL,

	--/ <summary>Redshift used (corresponds to z_noqso in specObjAll)</summary>
	--/ <quantity>src.redshift</quantity>
	[z] [real] NULL,

	--/ <summary>Error in z (corresponds to zErr_noqso in specObjAll)</summary>
	--/ <quantity>stat.error;src.redshift</quantity>
	[z_err] [real] NULL,

	--/ <summary>K+E corrections at z_0=0.55 in the u-band</summary>
	--/ <quantity>phot.mag.kc;em.opt.SDSS.u</quantity>
	[ke_u] [float] NULL,

	--/ <summary>K+E corrections at z_0=0.55 in the g-band</summary>
	--/ <quantity>phot.mag.kc;em.opt.SDSS.g</quantity>
	[ke_g] [float] NULL,

	--/ <summary>K+E corrections at z_0=0.55 in the r-band</summary>
	--/ <quantity>phot.mag.kc;em.opt.SDSS.r</quantity>
	[ke_r] [float] NULL,

	--/ <summary>K+E corrections at z_0=0.55 in the i-band</summary>
	--/ <quantity>phot.mag.kc;em.opt.SDSS.i</quantity>
	[ke_i] [float] NULL,

	--/ <summary>K+E corrections at z_0=0.55 in the z-band</summary>
	--/ <quantity>phot.mag.kc;em.opt.SDSS.z</quantity>
	[ke_z] [float] NULL,

	--/ <summary>Cmodel absolute magnitudes in the u-band, K+E corrected at z_0=0.55</summary>
	--/ <quantity>phot.mag.abs;em.opt.SDSS.u</quantity>
	[cModelAbsMag_u] [float] NULL,

	--/ <summary>Cmodel absolute magnitudes in the g-band, K+E corrected at z_0=0.55</summary>
	--/ <quantity>phot.mag.abs;em.opt.SDSS.g</quantity>
	[cModelAbsMag_g] [float] NULL,

	--/ <summary>Cmodel absolute magnitudes in the r-band, K+E corrected at z_0=0.55</summary>
	--/ <quantity>phot.mag.abs;em.opt.SDSS.r</quantity>
	[cModelAbsMag_r] [float] NULL,

	--/ <summary>Cmodel absolute magnitudes in the i-band, K+E corrected at z_0=0.55</summary>
	--/ <quantity>phot.mag.abs;em.opt.SDSS.i</quantity>
	[cModelAbsMag_i] [float] NULL,

	--/ <summary>Cmodel absolute magnitudes in the z-band, K+E corrected at z_0=0.55</summary>
	--/ <quantity>phot.mag.abs;em.opt.SDSS.z</quantity>
	[cModelAbsMag_z] [float] NULL,

	--/ <summary>Mass-to-light ratio in the u-band, K+E corrected at z_0=0.55</summary>
	--/ <quantity>phys.composition.massLightRatio;em.opt.SDSS.u</quantity>
	[m2l_u] [float] NULL,

	--/ <summary>Mass-to-light ratio in the g-band, K+E corrected at z_0=0.55</summary>
	--/ <quantity>phys.composition.massLightRatio;em.opt.SDSS.g</quantity>
	[m2l_g] [float] NULL,

	--/ <summary>Mass-to-light ratio in the r-band, K+E corrected at z_0=0.55</summary>
	--/ <quantity>phys.composition.massLightRatio;em.opt.SDSS.r</quantity>
	[m2l_r] [float] NULL,

	--/ <summary>Mass-to-light ratio in the i-band, K+E corrected at z_0=0.55</summary>
	--/ <quantity>phys.composition.massLightRatio;em.opt.SDSS.i</quantity>
	[m2l_i] [float] NULL,

	--/ <summary>Mass-to-light ratio in the z-band, K+E corrected at z_0=0.55</summary>
	--/ <quantity>phys.composition.massLightRatio;em.opt.SDSS.z</quantity>
	[m2l_z] [float] NULL,

	--/ <summary>Median Mass-to-light ratio in the u-band, K+E corrected at z_0=0.55. It corresponds to the value of PDF at which 50% of the M/L probability is accumulated</summary>
	--/ <quantity>phys.composition.massLightRatio;stat.median;em.opt.SDSS.u</quantity>
	[m2l_median_u] [float] NULL,

	--/ <summary>Median Mass-to-light ratio in the g-band, K+E corrected at z_0=0.55. It corresponds to the value of PDF at which 50% of the M/L probability is accumulated</summary>
	--/ <quantity>phys.composition.massLightRatio;stat.median;em.opt.SDSS.g</quantity>
	[m2l_median_g] [float] NULL,

	--/ <summary>Median Mass-to-light ratio in the r-band, K+E corrected at z_0=0.55. It corresponds to the value of PDF at which 50% of the M/L probability is accumulated</summary>
	--/ <quantity>phys.composition.massLightRatio;stat.median;em.opt.SDSS.r</quantity>
	[m2l_median_r] [float] NULL,

	--/ <summary>Median Mass-to-light ratio in the i-band, K+E corrected at z_0=0.55. It corresponds to the value of PDF at which 50% of the M/L probability is accumulated</summary>
	--/ <quantity>phys.composition.massLightRatio;stat.median;em.opt.SDSS.i</quantity>
	[m2l_median_i] [float] NULL,

	--/ <summary>Median Mass-to-light ratio in the z-band, K+E corrected at z_0=0.55. It corresponds to the value of PDF at which 50% of the M/L probability is accumulated</summary>
	--/ <quantity>phys.composition.massLightRatio;stat.median;em.opt.SDSS.z</quantity>
	[m2l_median_z] [float] NULL,

	--/ <summary>1-sigma error associated to M2L_Median in the u-band</summary>
	--/ <quantity>stat.error;phys.composition.massLightRatio;stat.median;em.opt.SDSS.u</quantity>
	[m2l_err_u] [float] NULL,

	--/ <summary>1-sigma error associated to M2L_Median in the g-band</summary>
	--/ <quantity>stat.error;phys.composition.massLightRatio;stat.median;em.opt.SDSS.g</quantity>
	[m2l_err_g] [float] NULL,

	--/ <summary>1-sigma error associated to M2L_Median in the r-band</summary>
	--/ <quantity>stat.error;phys.composition.massLightRatio;stat.median;em.opt.SDSS.r</quantity>
	[m2l_err_r] [float] NULL,

	--/ <summary>1-sigma error associated to M2L_Median in the i-band</summary>
	--/ <quantity>stat.error;phys.composition.massLightRatio;stat.median;em.opt.SDSS.i</quantity>
	[m2l_err_i] [float] NULL,

	--/ <summary>1-sigma error associated to M2L_Median in the z-band</summary>
	--/ <quantity>stat.error;phys.composition.massLightRatio;stat.median;em.opt.SDSS.z</quantity>
	[m2l_err_z] [float] NULL,

	--/ <summary>Minimum Mass-to-light ratio (lower 68% confidence level) in the u-band</summary>
	--/ <quantity>phys.composition.massLightRatio;stat.min;em.opt.SDSS.u</quantity>
	[m2l_min_u] [float] NULL,

	--/ <summary>Minimum Mass-to-light ratio (lower 68% confidence level) in the g-band</summary>
	--/ <quantity>phys.composition.massLightRatio;stat.min;em.opt.SDSS.g</quantity>
	[m2l_min_g] [float] NULL,

	--/ <summary>Minimum Mass-to-light ratio (lower 68% confidence level) in the r-band</summary>
	--/ <quantity>phys.composition.massLightRatio;stat.min;em.opt.SDSS.r</quantity>
	[m2l_min_r] [float] NULL,

	--/ <summary>Minimum Mass-to-light ratio (lower 68% confidence level) in the i-band</summary>
	--/ <quantity>phys.composition.massLightRatio;stat.min;em.opt.SDSS.i</quantity>
	[m2l_min_i] [float] NULL,

	--/ <summary>Minimum Mass-to-light ratio (lower 68% confidence level) in the z-band</summary>
	--/ <quantity>phys.composition.massLightRatio;stat.min;em.opt.SDSS.z</quantity>
	[m2l_min_z] [float] NULL,

	--/ <summary>Maximum Mass-to-light ratio (higher 68% confidence level) in the u-band</summary>
	--/ <quantity>phys.composition.massLightRatio;stat.max;em.opt.SDSS.u</quantity>
	[m2l_max_u] [float] NULL,

	--/ <summary>Maximum Mass-to-light ratio (higher 68% confidence level) in the g-band</summary>
	--/ <quantity>phys.composition.massLightRatio;stat.max;em.opt.SDSS.g</quantity>
	[m2l_max_g] [float] NULL,

	--/ <summary>Maximum Mass-to-light ratio (higher 68% confidence level) in the r-band</summary>
	--/ <quantity>phys.composition.massLightRatio;stat.max;em.opt.SDSS.r</quantity>
	[m2l_max_r] [float] NULL,

	--/ <summary>Maximum Mass-to-light ratio (higher 68% confidence level) in the i-band</summary>
	--/ <quantity>phys.composition.massLightRatio;stat.max;em.opt.SDSS.i</quantity>
	[m2l_max_i] [float] NULL,

	--/ <summary>Maximum Mass-to-light ratio (higher 68% confidence level) in the z-band</summary>
	--/ <quantity>phys.composition.massLightRatio;stat.max;em.opt.SDSS.z</quantity>
	[m2l_max_z] [float] NULL,

	--/ <summary>Best-fit stellar mass of galaxy</summary>
	--/ <quantity>phys.mass</quantity>
	--/ <unit>dex M_sol</unit>
	[logMass] [float] NULL,

	--/ <summary>Median stellar mass of galaxy. It corresponds to the value of PDF at which 50% of the stellar mass probability is accumulated (log base 10 in solar masses)</summary>
	--/ <quantity>phys.mass;stat.median</quantity>
	--/ <unit>dex M_sol</unit>
	[logMass_median] [float] NULL,

	--/ <summary>1-sigma error associated with LogMass_Median</summary>
	--/ <quantity>stat.error;phys.mass</quantity>
	--/ <unit>dex M_sol</unit>
	[logMass_err] [float] NULL,

	--/ <summary>Minimum stellar mass (lower 68% confidence level)</summary>
	--/ <quantity>phys.mass;stat.min</quantity>
	--/ <unit>dex M_sol</unit>
	[logMass_min] [float] NULL,

	--/ <summary>Maximum stellar mass (higher 68% confidence level)</summary>
	--/ <quantity>phys.mass;stat.max</quantity>
	--/ <unit>dex M_sol</unit>
	[logMass_max] [float] NULL,

	--/ <summary>Unreduced chi-square of best fit</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[chi2] [float] NULL,

	--/ <summary>Number of filters used in the fit (default is 5 for ugriz)</summary>
	--/ <quantity>meta.number</quantity>
	[nFilter] [smallint] NULL,

	--/ <summary>Best-fit look-back formation time</summary>
	--/ <quantity>time.age</quantity>
	--/ <unit>Gyr</unit>
	[t_age] [float] NULL,

	--/ <summary>Mean look-back formation time</summary>
	--/ <quantity>time.age;stat.mean</quantity>
	--/ <unit>Gyr</unit>
	[t_age_mean] [float] NULL,

	--/ <summary>1-sigma error for look-back formation time</summary>
	--/ <quantity>stat.error;time.age</quantity>
	--/ <unit>Gyr</unit>
	[t_age_err] [float] NULL,

	--/ <summary>Minimum value (lower 68% confidence level) for look-back formation time</summary>
	--/ <quantity>time.age;stat.min</quantity>
	--/ <unit>Gyr</unit>
	[t_age_min] [float] NULL,

	--/ <summary>Maximum value (higher 68% confidence level) for look-back formation time</summary>
	--/ <quantity>time.age;stat.max</quantity>
	--/ <unit>Gyr</unit>
	[t_age_max] [float] NULL,

	--/ <summary>Best-fit metallicity, where Z_sun=0.019</summary>
	--/ <quantity>phys.abund.Z</quantity>
	[metallicity] [float] NULL,

	--/ <summary>Mean metallicity</summary>
	--/ <quantity>phys.abund.Z;stat.mean</quantity>
	[metallicity_mean] [float] NULL,

	--/ <summary>1-sigma error for metallicity</summary>
	--/ <quantity>stat.error;phys.abund.Z</quantity>
	[metallicity_err] [float] NULL,

	--/ <summary>Minimum value (lower 68% confidence level) for metallicity</summary>
	--/ <quantity>phys.abund.Z;stat.min</quantity>
	[metallicity_min] [float] NULL,

	--/ <summary>Maximum value (higher 68% confidence level) for metallicity</summary>
	--/ <quantity>phys.abund.Z;stat.max</quantity>
	[metallicity_max] [float] NULL,

	--/ <summary>Best-fit value for dust attenuation around young stars</summary>
	--/ <quantity>phys.absorption</quantity>
	[dust1] [float] NULL,

	--/ <summary>Mean value for dust attenuation around young stars</summary>
	--/ <quantity>phys.absorption;stat.mean</quantity>
	[dust1_mean] [float] NULL,

	--/ <summary>1-sigma error for dust attenuation around young stars</summary>
	--/ <quantity>stat.error;phys.absorption</quantity>
	[dust1_err] [float] NULL,

	--/ <summary>Minimum value dust attenuation around young stars (lower 68% confidence level)</summary>
	--/ <quantity>phys.absorption;stat.min</quantity>
	[dust1_min] [float] NULL,

	--/ <summary>Maximum value dust attenuation around young stars (higher 68% confidence level)</summary>
	--/ <quantity>phys.absorption;stat.max</quantity>
	[dust1_max] [float] NULL,

	--/ <summary>Best-fit value for dust attenuation around old stars</summary>
	--/ <quantity>phys.absorption</quantity>
	[dust2] [float] NULL,

	--/ <summary>Mean value for dust attenuation around old stars</summary>
	--/ <quantity>phys.absorption;stat.mean</quantity>
	[dust2_mean] [float] NULL,

	--/ <summary>1-sigma error for dust attenuation around old stars</summary>
	--/ <quantity>stat.error;phys.absorption</quantity>
	[dust2_err] [float] NULL,

	--/ <summary>Minimum value for dust attenuation around old stars (lower 68% confidence level)</summary>
	--/ <quantity>phys.absorption;stat.min</quantity>
	[dust2_min] [float] NULL,

	--/ <summary>Maximum value for dust attenuation around old stars (higher 68% confidence level)</summary>
	--/ <quantity>phys.absorption;stat.max</quantity>
	[dust2_max] [float] NULL,

	--/ <summary>Best-fit star formation history e-folding time (tau)</summary>
	--/ <quantity>time.duration</quantity>
	--/ <unit>Gyr</unit>
	[tau] [float] NULL,

	--/ <summary>Mean star formation history e-folding time (tau)</summary>
	--/ <quantity>time.duration;stat.mean</quantity>
	--/ <unit>Gyr</unit>
	[tau_mean] [float] NULL,

	--/ <summary>1-sigma star formation history e-folding time (tau)</summary>
	--/ <quantity>stat.error;time.duration</quantity>
	--/ <unit>Gyr</unit>
	[tau_err] [float] NULL,

	--/ <summary>Minimum value (lower 68% confidence level) for star formation history e-folding time (tau)</summary>
	--/ <quantity>time.duration;stat.min</quantity>
	--/ <unit>Gyr</unit>
	[tau_min] [float] NULL,

	--/ <summary>Maximum value (higher 68% confidence level) for star formation history e-folding time (tau)</summary>
	--/ <quantity>time.duration;stat.max</quantity>
	--/ <unit>Gyr</unit>
	[tau_max] [float] NULL,

	--/ <summary>Best-fit mass-weighted average age of the stellar population</summary>
	--/ <quantity>time.age</quantity>
	--/ <unit>Gyr</unit>
	[age] [float] NULL,

	--/ <summary>Mean mass-weighted average age of the stellar population</summary>
	--/ <quantity>time.age;stat.mean</quantity>
	--/ <unit>Gyr</unit>
	[age_mean] [float] NULL,

	--/ <summary>Minimum value (lower 68% confidence level) for mass-weighted average age of the stellar population</summary>
	--/ <quantity>time.age;stat.min</quantity>
	--/ <unit>Gyr</unit>
	[age_min] [float] NULL,

	--/ <summary>Maximum value (higher 68% confidence level) for mass-weighted average age of the stellar population</summary>
	--/ <quantity>time.age;stat.max</quantity>
	--/ <unit>Gyr</unit>
	[age_max] [float] NULL,

	--/ <summary>Best-fit specific star formation rate</summary>
	--/ <quantity>phys.SFR</quantity>
	--/ <unit>log(Gyr-1)</unit>
	[ssfr] [float] NULL,

	--/ <summary>Mean specific star formation rate</summary>
	--/ <quantity>phys.SFR;stat.mean</quantity>
	--/ <unit>log(Gyr-1)</unit>
	[ssfr_mean] [float] NULL,

	--/ <summary>Minimum value (lower 68% confidence level) for specific star formation rate</summary>
	--/ <quantity>phys.SFR;stat.min</quantity>
	--/ <unit>log(Gyr-1)</unit>
	[ssfr_min] [float] NULL,

	--/ <summary>Maximum value (higher 68% confidence level) for specific star formation rate</summary>
	--/ <quantity>phys.SFR;stat.max</quantity>
	--/ <unit>log(Gyr-1)</unit>
	[ssfr_max] [float] NULL,
 CONSTRAINT [pk_stellarMassFSPSGranEarlyNoDus] PRIMARY KEY CLUSTERED 
(
	[specObjID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[stellarMassFSPSGranWideDust]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--/ <summary> Estimated stellar masses for SDSS and BOSS galaxies (Granada method, early-star-formation with dust) </summary>
--/ <remarks> Stellar masses using FSPS models of &lt;a href='http://adsabs.harvard.edu/abs/2009ApJ...699..486C'>Conroy et al. (2009)&lt;/a>  fit to SDSS photometry in ugriz.  The fit is carried out on extinction corrected model magnitudes that are scaled   to the i-band c-model magnitude. This 'wide-star-formation' version allows an extended star-formation  history.  This version also fits for dust extinction. </remarks>
CREATE TABLE [dbo].[stellarMassFSPSGranWideDust](

	--/ <summary>Unique ID</summary>
	--/ <quantity>meta.id</quantity>
	[specObjID] [bigint] NOT NULL,

	--/ <summary>Plate number</summary>
	--/ <quantity>meta.id;instr.det</quantity>
	[plate] [smallint] NULL,

	--/ <summary>Fiber ID</summary>
	--/ <quantity>meta.id;instr.param</quantity>
	[fiberID] [smallint] NULL,

	--/ <summary>MJD of observation</summary>
	--/ <quantity>time.epoch;obs</quantity>
	--/ <unit>d</unit>
	[MJD] [int] NULL,

	--/ <summary>Right ascension of fiber, J2000</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[ra] [float] NULL,

	--/ <summary>Declination of fiber, J2000</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[dec] [float] NULL,

	--/ <summary>Redshift used (corresponds to z_noqso in specObjAll)</summary>
	--/ <quantity>src.redshift</quantity>
	[z] [real] NULL,

	--/ <summary>Error in z (corresponds to zErr_noqso in specObjAll)</summary>
	--/ <quantity>stat.error;src.redshift</quantity>
	[z_err] [real] NULL,

	--/ <summary>K+E corrections at z_0=0.55 in the u-band</summary>
	--/ <quantity>phot.mag.kc;em.opt.SDSS.u</quantity>
	[ke_u] [float] NULL,

	--/ <summary>K+E corrections at z_0=0.55 in the g-band</summary>
	--/ <quantity>phot.mag.kc;em.opt.SDSS.g</quantity>
	[ke_g] [float] NULL,

	--/ <summary>K+E corrections at z_0=0.55 in the r-band</summary>
	--/ <quantity>phot.mag.kc;em.opt.SDSS.r</quantity>
	[ke_r] [float] NULL,

	--/ <summary>K+E corrections at z_0=0.55 in the i-band</summary>
	--/ <quantity>phot.mag.kc;em.opt.SDSS.i</quantity>
	[ke_i] [float] NULL,

	--/ <summary>K+E corrections at z_0=0.55 in the z-band</summary>
	--/ <quantity>phot.mag.kc;em.opt.SDSS.z</quantity>
	[ke_z] [float] NULL,

	--/ <summary>Cmodel absolute magnitudes in the u-band, K+E corrected at z_0=0.55</summary>
	--/ <quantity>phot.mag.abs;em.opt.SDSS.u</quantity>
	[cModelAbsMag_u] [float] NULL,

	--/ <summary>Cmodel absolute magnitudes in the g-band, K+E corrected at z_0=0.55</summary>
	--/ <quantity>phot.mag.abs;em.opt.SDSS.g</quantity>
	[cModelAbsMag_g] [float] NULL,

	--/ <summary>Cmodel absolute magnitudes in the r-band, K+E corrected at z_0=0.55</summary>
	--/ <quantity>phot.mag.abs;em.opt.SDSS.r</quantity>
	[cModelAbsMag_r] [float] NULL,

	--/ <summary>Cmodel absolute magnitudes in the i-band, K+E corrected at z_0=0.55</summary>
	--/ <quantity>phot.mag.abs;em.opt.SDSS.i</quantity>
	[cModelAbsMag_i] [float] NULL,

	--/ <summary>Cmodel absolute magnitudes in the z-band, K+E corrected at z_0=0.55</summary>
	--/ <quantity>phot.mag.abs;em.opt.SDSS.z</quantity>
	[cModelAbsMag_z] [float] NULL,

	--/ <summary>Mass-to-light ratio in the u-band, K+E corrected at z_0=0.55</summary>
	--/ <quantity>phys.composition.massLightRatio;em.opt.SDSS.u</quantity>
	[m2l_u] [float] NULL,

	--/ <summary>Mass-to-light ratio in the g-band, K+E corrected at z_0=0.55</summary>
	--/ <quantity>phys.composition.massLightRatio;em.opt.SDSS.g</quantity>
	[m2l_g] [float] NULL,

	--/ <summary>Mass-to-light ratio in the r-band, K+E corrected at z_0=0.55</summary>
	--/ <quantity>phys.composition.massLightRatio;em.opt.SDSS.r</quantity>
	[m2l_r] [float] NULL,

	--/ <summary>Mass-to-light ratio in the i-band, K+E corrected at z_0=0.55</summary>
	--/ <quantity>phys.composition.massLightRatio;em.opt.SDSS.i</quantity>
	[m2l_i] [float] NULL,

	--/ <summary>Mass-to-light ratio in the z-band, K+E corrected at z_0=0.55</summary>
	--/ <quantity>phys.composition.massLightRatio;em.opt.SDSS.z</quantity>
	[m2l_z] [float] NULL,

	--/ <summary>Median Mass-to-light ratio in the u-band, K+E corrected at z_0=0.55. It corresponds to the value of PDF at which 50% of the M/L probability is accumulated</summary>
	--/ <quantity>phys.composition.massLightRatio;stat.median;em.opt.SDSS.u</quantity>
	[m2l_median_u] [float] NULL,

	--/ <summary>Median Mass-to-light ratio in the g-band, K+E corrected at z_0=0.55. It corresponds to the value of PDF at which 50% of the M/L probability is accumulated</summary>
	--/ <quantity>phys.composition.massLightRatio;stat.median;em.opt.SDSS.g</quantity>
	[m2l_median_g] [float] NULL,

	--/ <summary>Median Mass-to-light ratio in the r-band, K+E corrected at z_0=0.55. It corresponds to the value of PDF at which 50% of the M/L probability is accumulated</summary>
	--/ <quantity>phys.composition.massLightRatio;stat.median;em.opt.SDSS.r</quantity>
	[m2l_median_r] [float] NULL,

	--/ <summary>Median Mass-to-light ratio in the i-band, K+E corrected at z_0=0.55. It corresponds to the value of PDF at which 50% of the M/L probability is accumulated</summary>
	--/ <quantity>phys.composition.massLightRatio;stat.median;em.opt.SDSS.i</quantity>
	[m2l_median_i] [float] NULL,

	--/ <summary>Median Mass-to-light ratio in the z-band, K+E corrected at z_0=0.55. It corresponds to the value of PDF at which 50% of the M/L probability is accumulated</summary>
	--/ <quantity>phys.composition.massLightRatio;stat.median;em.opt.SDSS.z</quantity>
	[m2l_median_z] [float] NULL,

	--/ <summary>1-sigma error associated to M2L_Median in the u-band</summary>
	--/ <quantity>stat.error;phys.composition.massLightRatio;stat.median;em.opt.SDSS.u</quantity>
	[m2l_err_u] [float] NULL,

	--/ <summary>1-sigma error associated to M2L_Median in the g-band</summary>
	--/ <quantity>stat.error;phys.composition.massLightRatio;stat.median;em.opt.SDSS.g</quantity>
	[m2l_err_g] [float] NULL,

	--/ <summary>1-sigma error associated to M2L_Median in the r-band</summary>
	--/ <quantity>stat.error;phys.composition.massLightRatio;stat.median;em.opt.SDSS.r</quantity>
	[m2l_err_r] [float] NULL,

	--/ <summary>1-sigma error associated to M2L_Median in the i-band</summary>
	--/ <quantity>stat.error;phys.composition.massLightRatio;stat.median;em.opt.SDSS.i</quantity>
	[m2l_err_i] [float] NULL,

	--/ <summary>1-sigma error associated to M2L_Median in the z-band</summary>
	--/ <quantity>stat.error;phys.composition.massLightRatio;stat.median;em.opt.SDSS.z</quantity>
	[m2l_err_z] [float] NULL,

	--/ <summary>Minimum Mass-to-light ratio (lower 68% confidence level) in the u-band</summary>
	--/ <quantity>phys.composition.massLightRatio;stat.min;em.opt.SDSS.u</quantity>
	[m2l_min_u] [float] NULL,

	--/ <summary>Minimum Mass-to-light ratio (lower 68% confidence level) in the g-band</summary>
	--/ <quantity>phys.composition.massLightRatio;stat.min;em.opt.SDSS.g</quantity>
	[m2l_min_g] [float] NULL,

	--/ <summary>Minimum Mass-to-light ratio (lower 68% confidence level) in the r-band</summary>
	--/ <quantity>phys.composition.massLightRatio;stat.min;em.opt.SDSS.r</quantity>
	[m2l_min_r] [float] NULL,

	--/ <summary>Minimum Mass-to-light ratio (lower 68% confidence level) in the i-band</summary>
	--/ <quantity>phys.composition.massLightRatio;stat.min;em.opt.SDSS.i</quantity>
	[m2l_min_i] [float] NULL,

	--/ <summary>Minimum Mass-to-light ratio (lower 68% confidence level) in the z-band</summary>
	--/ <quantity>phys.composition.massLightRatio;stat.min;em.opt.SDSS.z</quantity>
	[m2l_min_z] [float] NULL,

	--/ <summary>Maximum Mass-to-light ratio (higher 68% confidence level) in the u-band</summary>
	--/ <quantity>phys.composition.massLightRatio;stat.max;em.opt.SDSS.u</quantity>
	[m2l_max_u] [float] NULL,

	--/ <summary>Maximum Mass-to-light ratio (higher 68% confidence level) in the g-band</summary>
	--/ <quantity>phys.composition.massLightRatio;stat.max;em.opt.SDSS.g</quantity>
	[m2l_max_g] [float] NULL,

	--/ <summary>Maximum Mass-to-light ratio (higher 68% confidence level) in the r-band</summary>
	--/ <quantity>phys.composition.massLightRatio;stat.max;em.opt.SDSS.r</quantity>
	[m2l_max_r] [float] NULL,

	--/ <summary>Maximum Mass-to-light ratio (higher 68% confidence level) in the i-band</summary>
	--/ <quantity>phys.composition.massLightRatio;stat.max;em.opt.SDSS.i</quantity>
	[m2l_max_i] [float] NULL,

	--/ <summary>Maximum Mass-to-light ratio (higher 68% confidence level) in the z-band</summary>
	--/ <quantity>phys.composition.massLightRatio;stat.max;em.opt.SDSS.z</quantity>
	[m2l_max_z] [float] NULL,

	--/ <summary>Best-fit stellar mass of galaxy</summary>
	--/ <quantity>phys.mass</quantity>
	--/ <unit>dex M_sol</unit>
	[logMass] [float] NULL,

	--/ <summary>Median stellar mass of galaxy. It corresponds to the value of PDF at which 50% of the stellar mass probability is accumulated (log base 10 in solar masses)</summary>
	--/ <quantity>phys.mass;stat.median</quantity>
	--/ <unit>dex M_sol</unit>
	[logMass_median] [float] NULL,

	--/ <summary>1-sigma error associated with LogMass_Median</summary>
	--/ <quantity>stat.error;phys.mass</quantity>
	--/ <unit>dex M_sol</unit>
	[logMass_err] [float] NULL,

	--/ <summary>Minimum stellar mass (lower 68% confidence level)</summary>
	--/ <quantity>phys.mass;stat.min</quantity>
	--/ <unit>dex M_sol</unit>
	[logMass_min] [float] NULL,

	--/ <summary>Maximum stellar mass (higher 68% confidence level)</summary>
	--/ <quantity>phys.mass;stat.max</quantity>
	--/ <unit>dex M_sol</unit>
	[logMass_max] [float] NULL,

	--/ <summary>Unreduced chi-square of best fit</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[chi2] [float] NULL,

	--/ <summary>Number of filters used in the fit (default is 5 for ugriz)</summary>
	--/ <quantity>meta.number</quantity>
	[nFilter] [smallint] NULL,

	--/ <summary>Best-fit look-back formation time</summary>
	--/ <quantity>time.age</quantity>
	--/ <unit>Gyr</unit>
	[t_age] [float] NULL,

	--/ <summary>Mean look-back formation time</summary>
	--/ <quantity>time.age;stat.mean</quantity>
	--/ <unit>Gyr</unit>
	[t_age_mean] [float] NULL,

	--/ <summary>1-sigma error for look-back formation time</summary>
	--/ <quantity>stat.error;time.age</quantity>
	--/ <unit>Gyr</unit>
	[t_age_err] [float] NULL,

	--/ <summary>Minimum value (lower 68% confidence level) for look-back formation time</summary>
	--/ <quantity>time.age;stat.min</quantity>
	--/ <unit>Gyr</unit>
	[t_age_min] [float] NULL,

	--/ <summary>Maximum value (higher 68% confidence level) for look-back formation time</summary>
	--/ <quantity>time.age;stat.max</quantity>
	--/ <unit>Gyr</unit>
	[t_age_max] [float] NULL,

	--/ <summary>Best-fit metallicity, where Z_sun=0.019</summary>
	--/ <quantity>phys.abund.Z</quantity>
	[metallicity] [float] NULL,

	--/ <summary>Mean metallicity</summary>
	--/ <quantity>phys.abund.Z;stat.mean</quantity>
	[metallicity_mean] [float] NULL,

	--/ <summary>1-sigma error for metallicity</summary>
	--/ <quantity>stat.error;phys.abund.Z</quantity>
	[metallicity_err] [float] NULL,

	--/ <summary>Minimum value (lower 68% confidence level) for metallicity</summary>
	--/ <quantity>phys.abund.Z;stat.min</quantity>
	[metallicity_min] [float] NULL,

	--/ <summary>Maximum value (higher 68% confidence level) for metallicity</summary>
	--/ <quantity>phys.abund.Z;stat.max</quantity>
	[metallicity_max] [float] NULL,

	--/ <summary>Best-fit value for dust attenuation around young stars</summary>
	--/ <quantity>phys.absorption</quantity>
	[dust1] [float] NULL,

	--/ <summary>Mean value for dust attenuation around young stars</summary>
	--/ <quantity>phys.absorption;stat.mean</quantity>
	[dust1_mean] [float] NULL,

	--/ <summary>1-sigma error for dust attenuation around young stars</summary>
	--/ <quantity>stat.error;phys.absorption</quantity>
	[dust1_err] [float] NULL,

	--/ <summary>Minimum value dust attenuation around young stars (lower 68% confidence level)</summary>
	--/ <quantity>phys.absorption;stat.min</quantity>
	[dust1_min] [float] NULL,

	--/ <summary>Maximum value dust attenuation around young stars (higher 68% confidence level)</summary>
	--/ <quantity>phys.absorption;stat.max</quantity>
	[dust1_max] [float] NULL,

	--/ <summary>Best-fit value for dust attenuation around old stars</summary>
	--/ <quantity>phys.absorption</quantity>
	[dust2] [float] NULL,

	--/ <summary>Mean value for dust attenuation around old stars</summary>
	--/ <quantity>phys.absorption;stat.mean</quantity>
	[dust2_mean] [float] NULL,

	--/ <summary>1-sigma error for dust attenuation around old stars</summary>
	--/ <quantity>stat.error;phys.absorption</quantity>
	[dust2_err] [float] NULL,

	--/ <summary>Minimum value for dust attenuation around old stars (lower 68% confidence level)</summary>
	--/ <quantity>phys.absorption;stat.min</quantity>
	[dust2_min] [float] NULL,

	--/ <summary>Maximum value for dust attenuation around old stars (higher 68% confidence level)</summary>
	--/ <quantity>phys.absorption;stat.max</quantity>
	[dust2_max] [float] NULL,

	--/ <summary>Best-fit star formation history e-folding time (tau)</summary>
	--/ <quantity>time.duration</quantity>
	--/ <unit>Gyr</unit>
	[tau] [float] NULL,

	--/ <summary>Mean star formation history e-folding time (tau)</summary>
	--/ <quantity>time.duration;stat.mean</quantity>
	--/ <unit>Gyr</unit>
	[tau_mean] [float] NULL,

	--/ <summary>1-sigma star formation history e-folding time (tau)</summary>
	--/ <quantity>stat.error;time.duration</quantity>
	--/ <unit>Gyr</unit>
	[tau_err] [float] NULL,

	--/ <summary>Minimum value (lower 68% confidence level) for star formation history e-folding time (tau)</summary>
	--/ <quantity>time.duration;stat.min</quantity>
	--/ <unit>Gyr</unit>
	[tau_min] [float] NULL,

	--/ <summary>Maximum value (higher 68% confidence level) for star formation history e-folding time (tau)</summary>
	--/ <quantity>time.duration;stat.max</quantity>
	--/ <unit>Gyr</unit>
	[tau_max] [float] NULL,

	--/ <summary>Best-fit mass-weighted average age of the stellar population</summary>
	--/ <quantity>time.age</quantity>
	--/ <unit>Gyr</unit>
	[age] [float] NULL,

	--/ <summary>Mean mass-weighted average age of the stellar population</summary>
	--/ <quantity>time.age;stat.mean</quantity>
	--/ <unit>Gyr</unit>
	[age_mean] [float] NULL,

	--/ <summary>Minimum value (lower 68% confidence level) for mass-weighted average age of the stellar population</summary>
	--/ <quantity>time.age;stat.min</quantity>
	--/ <unit>Gyr</unit>
	[age_min] [float] NULL,

	--/ <summary>Maximum value (higher 68% confidence level) for mass-weighted average age of the stellar population</summary>
	--/ <quantity>time.age;stat.max</quantity>
	--/ <unit>Gyr</unit>
	[age_max] [float] NULL,

	--/ <summary>Best-fit specific star formation rate</summary>
	--/ <quantity>phys.SFR</quantity>
	--/ <unit>log(Gyr-1)</unit>
	[ssfr] [float] NULL,

	--/ <summary>Mean specific star formation rate</summary>
	--/ <quantity>phys.SFR;stat.mean</quantity>
	--/ <unit>log(Gyr-1)</unit>
	[ssfr_mean] [float] NULL,

	--/ <summary>Minimum value (lower 68% confidence level) for specific star formation rate</summary>
	--/ <quantity>phys.SFR;stat.min</quantity>
	--/ <unit>log(Gyr-1)</unit>
	[ssfr_min] [float] NULL,

	--/ <summary>Maximum value (higher 68% confidence level) for specific star formation rate</summary>
	--/ <quantity>phys.SFR;stat.max</quantity>
	--/ <unit>log(Gyr-1)</unit>
	[ssfr_max] [float] NULL,
 CONSTRAINT [pk_stellarMassFSPSGranWideDust_s] PRIMARY KEY CLUSTERED 
(
	[specObjID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[stellarMassFSPSGranWideNoDust]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--/ <summary> Estimated stellar masses for SDSS and BOSS galaxies (Granada method, early-star-formation with dust) </summary>
--/ <remarks> Stellar masses using FSPS models of &lt;a href='http://adsabs.harvard.edu/abs/2009ApJ...699..486C'>Conroy et al. (2009)&lt;/a>  fit to SDSS photometry in ugriz.  The fit is carried out on extinction corrected model magnitudes that are scaled   to the i-band c-model magnitude. This 'wide-star-formation' version allows an extended star-formation  history.  This version assumes no dust extinction. </remarks>
CREATE TABLE [dbo].[stellarMassFSPSGranWideNoDust](

	--/ <summary>Unique ID</summary>
	--/ <quantity>meta.id</quantity>
	[specObjID] [bigint] NOT NULL,

	--/ <summary>Plate number</summary>
	--/ <quantity>meta.id;instr.det</quantity>
	[plate] [smallint] NULL,

	--/ <summary>Fiber ID</summary>
	--/ <quantity>meta.id;instr.param</quantity>
	[fiberID] [smallint] NULL,

	--/ <summary>MJD of observation</summary>
	--/ <quantity>time.epoch;obs</quantity>
	--/ <unit>d</unit>
	[MJD] [int] NULL,

	--/ <summary>Right ascension of fiber, J2000</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[ra] [float] NULL,

	--/ <summary>Declination of fiber, J2000</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[dec] [float] NULL,

	--/ <summary>Redshift used (corresponds to z_noqso in specObjAll)</summary>
	--/ <quantity>src.redshift</quantity>
	[z] [real] NULL,

	--/ <summary>Error in z (corresponds to zErr_noqso in specObjAll)</summary>
	--/ <quantity>stat.error;src.redshift</quantity>
	[z_err] [real] NULL,

	--/ <summary>K+E corrections at z_0=0.55 in the u-band</summary>
	--/ <quantity>phot.mag.kc;em.opt.SDSS.u</quantity>
	[ke_u] [float] NULL,

	--/ <summary>K+E corrections at z_0=0.55 in the g-band</summary>
	--/ <quantity>phot.mag.kc;em.opt.SDSS.g</quantity>
	[ke_g] [float] NULL,

	--/ <summary>K+E corrections at z_0=0.55 in the r-band</summary>
	--/ <quantity>phot.mag.kc;em.opt.SDSS.r</quantity>
	[ke_r] [float] NULL,

	--/ <summary>K+E corrections at z_0=0.55 in the i-band</summary>
	--/ <quantity>phot.mag.kc;em.opt.SDSS.i</quantity>
	[ke_i] [float] NULL,

	--/ <summary>K+E corrections at z_0=0.55 in the z-band</summary>
	--/ <quantity>phot.mag.kc;em.opt.SDSS.z</quantity>
	[ke_z] [float] NULL,

	--/ <summary>Cmodel absolute magnitudes in the u-band, K+E corrected at z_0=0.55</summary>
	--/ <quantity>phot.mag.abs;em.opt.SDSS.u</quantity>
	[cModelAbsMag_u] [float] NULL,

	--/ <summary>Cmodel absolute magnitudes in the g-band, K+E corrected at z_0=0.55</summary>
	--/ <quantity>phot.mag.abs;em.opt.SDSS.g</quantity>
	[cModelAbsMag_g] [float] NULL,

	--/ <summary>Cmodel absolute magnitudes in the r-band, K+E corrected at z_0=0.55</summary>
	--/ <quantity>phot.mag.abs;em.opt.SDSS.r</quantity>
	[cModelAbsMag_r] [float] NULL,

	--/ <summary>Cmodel absolute magnitudes in the i-band, K+E corrected at z_0=0.55</summary>
	--/ <quantity>phot.mag.abs;em.opt.SDSS.i</quantity>
	[cModelAbsMag_i] [float] NULL,

	--/ <summary>Cmodel absolute magnitudes in the z-band, K+E corrected at z_0=0.55</summary>
	--/ <quantity>phot.mag.abs;em.opt.SDSS.z</quantity>
	[cModelAbsMag_z] [float] NULL,

	--/ <summary>Mass-to-light ratio in the u-band, K+E corrected at z_0=0.55</summary>
	--/ <quantity>phys.composition.massLightRatio;em.opt.SDSS.u</quantity>
	[m2l_u] [float] NULL,

	--/ <summary>Mass-to-light ratio in the g-band, K+E corrected at z_0=0.55</summary>
	--/ <quantity>phys.composition.massLightRatio;em.opt.SDSS.g</quantity>
	[m2l_g] [float] NULL,

	--/ <summary>Mass-to-light ratio in the r-band, K+E corrected at z_0=0.55</summary>
	--/ <quantity>phys.composition.massLightRatio;em.opt.SDSS.r</quantity>
	[m2l_r] [float] NULL,

	--/ <summary>Mass-to-light ratio in the i-band, K+E corrected at z_0=0.55</summary>
	--/ <quantity>phys.composition.massLightRatio;em.opt.SDSS.i</quantity>
	[m2l_i] [float] NULL,

	--/ <summary>Mass-to-light ratio in the z-band, K+E corrected at z_0=0.55</summary>
	--/ <quantity>phys.composition.massLightRatio;em.opt.SDSS.z</quantity>
	[m2l_z] [float] NULL,

	--/ <summary>Median Mass-to-light ratio in the u-band, K+E corrected at z_0=0.55. It corresponds to the value of PDF at which 50% of the M/L probability is accumulated</summary>
	--/ <quantity>phys.composition.massLightRatio;stat.median;em.opt.SDSS.u</quantity>
	[m2l_median_u] [float] NULL,

	--/ <summary>Median Mass-to-light ratio in the g-band, K+E corrected at z_0=0.55. It corresponds to the value of PDF at which 50% of the M/L probability is accumulated</summary>
	--/ <quantity>phys.composition.massLightRatio;stat.median;em.opt.SDSS.g</quantity>
	[m2l_median_g] [float] NULL,

	--/ <summary>Median Mass-to-light ratio in the r-band, K+E corrected at z_0=0.55. It corresponds to the value of PDF at which 50% of the M/L probability is accumulated</summary>
	--/ <quantity>phys.composition.massLightRatio;stat.median;em.opt.SDSS.r</quantity>
	[m2l_median_r] [float] NULL,

	--/ <summary>Median Mass-to-light ratio in the i-band, K+E corrected at z_0=0.55. It corresponds to the value of PDF at which 50% of the M/L probability is accumulated</summary>
	--/ <quantity>phys.composition.massLightRatio;stat.median;em.opt.SDSS.i</quantity>
	[m2l_median_i] [float] NULL,

	--/ <summary>Median Mass-to-light ratio in the z-band, K+E corrected at z_0=0.55. It corresponds to the value of PDF at which 50% of the M/L probability is accumulated</summary>
	--/ <quantity>phys.composition.massLightRatio;stat.median;em.opt.SDSS.z</quantity>
	[m2l_median_z] [float] NULL,

	--/ <summary>1-sigma error associated to M2L_Median in the u-band</summary>
	--/ <quantity>stat.error;phys.composition.massLightRatio;stat.median;em.opt.SDSS.u</quantity>
	[m2l_err_u] [float] NULL,

	--/ <summary>1-sigma error associated to M2L_Median in the g-band</summary>
	--/ <quantity>stat.error;phys.composition.massLightRatio;stat.median;em.opt.SDSS.g</quantity>
	[m2l_err_g] [float] NULL,

	--/ <summary>1-sigma error associated to M2L_Median in the r-band</summary>
	--/ <quantity>stat.error;phys.composition.massLightRatio;stat.median;em.opt.SDSS.r</quantity>
	[m2l_err_r] [float] NULL,

	--/ <summary>1-sigma error associated to M2L_Median in the i-band</summary>
	--/ <quantity>stat.error;phys.composition.massLightRatio;stat.median;em.opt.SDSS.i</quantity>
	[m2l_err_i] [float] NULL,

	--/ <summary>1-sigma error associated to M2L_Median in the z-band</summary>
	--/ <quantity>stat.error;phys.composition.massLightRatio;stat.median;em.opt.SDSS.z</quantity>
	[m2l_err_z] [float] NULL,

	--/ <summary>Minimum Mass-to-light ratio (lower 68% confidence level) in the u-band</summary>
	--/ <quantity>phys.composition.massLightRatio;stat.min;em.opt.SDSS.u</quantity>
	[m2l_min_u] [float] NULL,

	--/ <summary>Minimum Mass-to-light ratio (lower 68% confidence level) in the g-band</summary>
	--/ <quantity>phys.composition.massLightRatio;stat.min;em.opt.SDSS.g</quantity>
	[m2l_min_g] [float] NULL,

	--/ <summary>Minimum Mass-to-light ratio (lower 68% confidence level) in the r-band</summary>
	--/ <quantity>phys.composition.massLightRatio;stat.min;em.opt.SDSS.r</quantity>
	[m2l_min_r] [float] NULL,

	--/ <summary>Minimum Mass-to-light ratio (lower 68% confidence level) in the i-band</summary>
	--/ <quantity>phys.composition.massLightRatio;stat.min;em.opt.SDSS.i</quantity>
	[m2l_min_i] [float] NULL,

	--/ <summary>Minimum Mass-to-light ratio (lower 68% confidence level) in the z-band</summary>
	--/ <quantity>phys.composition.massLightRatio;stat.min;em.opt.SDSS.z</quantity>
	[m2l_min_z] [float] NULL,

	--/ <summary>Maximum Mass-to-light ratio (higher 68% confidence level) in the u-band</summary>
	--/ <quantity>phys.composition.massLightRatio;stat.max;em.opt.SDSS.u</quantity>
	[m2l_max_u] [float] NULL,

	--/ <summary>Maximum Mass-to-light ratio (higher 68% confidence level) in the g-band</summary>
	--/ <quantity>phys.composition.massLightRatio;stat.max;em.opt.SDSS.g</quantity>
	[m2l_max_g] [float] NULL,

	--/ <summary>Maximum Mass-to-light ratio (higher 68% confidence level) in the r-band</summary>
	--/ <quantity>phys.composition.massLightRatio;stat.max;em.opt.SDSS.r</quantity>
	[m2l_max_r] [float] NULL,

	--/ <summary>Maximum Mass-to-light ratio (higher 68% confidence level) in the i-band</summary>
	--/ <quantity>phys.composition.massLightRatio;stat.max;em.opt.SDSS.i</quantity>
	[m2l_max_i] [float] NULL,

	--/ <summary>Maximum Mass-to-light ratio (higher 68% confidence level) in the z-band</summary>
	--/ <quantity>phys.composition.massLightRatio;stat.max;em.opt.SDSS.z</quantity>
	[m2l_max_z] [float] NULL,

	--/ <summary>Best-fit stellar mass of galaxy</summary>
	--/ <quantity>phys.mass</quantity>
	--/ <unit>dex M_sol</unit>
	[logMass] [float] NULL,

	--/ <summary>Median stellar mass of galaxy. It corresponds to the value of PDF at which 50% of the stellar mass probability is accumulated (log base 10 in solar masses)</summary>
	--/ <quantity>phys.mass;stat.median</quantity>
	--/ <unit>dex M_sol</unit>
	[logMass_median] [float] NULL,

	--/ <summary>1-sigma error associated with LogMass_Median</summary>
	--/ <quantity>stat.error;phys.mass</quantity>
	--/ <unit>dex M_sol</unit>
	[logMass_err] [float] NULL,

	--/ <summary>Minimum stellar mass (lower 68% confidence level)</summary>
	--/ <quantity>phys.mass;stat.min</quantity>
	--/ <unit>dex M_sol</unit>
	[logMass_min] [float] NULL,

	--/ <summary>Maximum stellar mass (higher 68% confidence level)</summary>
	--/ <quantity>phys.mass;stat.max</quantity>
	--/ <unit>dex M_sol</unit>
	[logMass_max] [float] NULL,

	--/ <summary>Unreduced chi-square of best fit</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[chi2] [float] NULL,

	--/ <summary>Number of filters used in the fit (default is 5 for ugriz)</summary>
	--/ <quantity>meta.number</quantity>
	[nFilter] [smallint] NULL,

	--/ <summary>Best-fit look-back formation time</summary>
	--/ <quantity>time.age</quantity>
	--/ <unit>Gyr</unit>
	[t_age] [float] NULL,

	--/ <summary>Mean look-back formation time</summary>
	--/ <quantity>time.age;stat.mean</quantity>
	--/ <unit>Gyr</unit>
	[t_age_mean] [float] NULL,

	--/ <summary>1-sigma error for look-back formation time</summary>
	--/ <quantity>stat.error;time.age</quantity>
	--/ <unit>Gyr</unit>
	[t_age_err] [float] NULL,

	--/ <summary>Minimum value (lower 68% confidence level) for look-back formation time</summary>
	--/ <quantity>time.age;stat.min</quantity>
	--/ <unit>Gyr</unit>
	[t_age_min] [float] NULL,

	--/ <summary>Maximum value (higher 68% confidence level) for look-back formation time</summary>
	--/ <quantity>time.age;stat.max</quantity>
	--/ <unit>Gyr</unit>
	[t_age_max] [float] NULL,

	--/ <summary>Best-fit metallicity, where Z_sun=0.019</summary>
	--/ <quantity>phys.abund.Z</quantity>
	[metallicity] [float] NULL,

	--/ <summary>Mean metallicity</summary>
	--/ <quantity>phys.abund.Z;stat.mean</quantity>
	[metallicity_mean] [float] NULL,

	--/ <summary>1-sigma error for metallicity</summary>
	--/ <quantity>stat.error;phys.abund.Z</quantity>
	[metallicity_err] [float] NULL,

	--/ <summary>Minimum value (lower 68% confidence level) for metallicity</summary>
	--/ <quantity>phys.abund.Z;stat.min</quantity>
	[metallicity_min] [float] NULL,

	--/ <summary>Maximum value (higher 68% confidence level) for metallicity</summary>
	--/ <quantity>phys.abund.Z;stat.max</quantity>
	[metallicity_max] [float] NULL,

	--/ <summary>Best-fit value for dust attenuation around young stars</summary>
	--/ <quantity>phys.absorption</quantity>
	[dust1] [float] NULL,

	--/ <summary>Mean value for dust attenuation around young stars</summary>
	--/ <quantity>phys.absorption;stat.mean</quantity>
	[dust1_mean] [float] NULL,

	--/ <summary>1-sigma error for dust attenuation around young stars</summary>
	--/ <quantity>stat.error;phys.absorption</quantity>
	[dust1_err] [float] NULL,

	--/ <summary>Minimum value dust attenuation around young stars (lower 68% confidence level)</summary>
	--/ <quantity>phys.absorption;stat.min</quantity>
	[dust1_min] [float] NULL,

	--/ <summary>Maximum value dust attenuation around young stars (higher 68% confidence level)</summary>
	--/ <quantity>phys.absorption;stat.max</quantity>
	[dust1_max] [float] NULL,

	--/ <summary>Best-fit value for dust attenuation around old stars</summary>
	--/ <quantity>phys.absorption</quantity>
	[dust2] [float] NULL,

	--/ <summary>Mean value for dust attenuation around old stars</summary>
	--/ <quantity>phys.absorption;stat.mean</quantity>
	[dust2_mean] [float] NULL,

	--/ <summary>1-sigma error for dust attenuation around old stars</summary>
	--/ <quantity>stat.error;phys.absorption</quantity>
	[dust2_err] [float] NULL,

	--/ <summary>Minimum value for dust attenuation around old stars (lower 68% confidence level)</summary>
	--/ <quantity>phys.absorption;stat.min</quantity>
	[dust2_min] [float] NULL,

	--/ <summary>Maximum value for dust attenuation around old stars (higher 68% confidence level)</summary>
	--/ <quantity>phys.absorption;stat.max</quantity>
	[dust2_max] [float] NULL,

	--/ <summary>Best-fit star formation history e-folding time (tau)</summary>
	--/ <quantity>time.duration</quantity>
	--/ <unit>Gyr</unit>
	[tau] [float] NULL,

	--/ <summary>Mean star formation history e-folding time (tau)</summary>
	--/ <quantity>time.duration;stat.mean</quantity>
	--/ <unit>Gyr</unit>
	[tau_mean] [float] NULL,

	--/ <summary>1-sigma star formation history e-folding time (tau)</summary>
	--/ <quantity>stat.error;time.duration</quantity>
	--/ <unit>Gyr</unit>
	[tau_err] [float] NULL,

	--/ <summary>Minimum value (lower 68% confidence level) for star formation history e-folding time (tau)</summary>
	--/ <quantity>time.duration;stat.min</quantity>
	--/ <unit>Gyr</unit>
	[tau_min] [float] NULL,

	--/ <summary>Maximum value (higher 68% confidence level) for star formation history e-folding time (tau)</summary>
	--/ <quantity>time.duration;stat.max</quantity>
	--/ <unit>Gyr</unit>
	[tau_max] [float] NULL,

	--/ <summary>Best-fit mass-weighted average age of the stellar population</summary>
	--/ <quantity>time.age</quantity>
	--/ <unit>Gyr</unit>
	[age] [float] NULL,

	--/ <summary>Mean mass-weighted average age of the stellar population</summary>
	--/ <quantity>time.age;stat.mean</quantity>
	--/ <unit>Gyr</unit>
	[age_mean] [float] NULL,

	--/ <summary>Minimum value (lower 68% confidence level) for mass-weighted average age of the stellar population</summary>
	--/ <quantity>time.age;stat.min</quantity>
	--/ <unit>Gyr</unit>
	[age_min] [float] NULL,

	--/ <summary>Maximum value (higher 68% confidence level) for mass-weighted average age of the stellar population</summary>
	--/ <quantity>time.age;stat.max</quantity>
	--/ <unit>Gyr</unit>
	[age_max] [float] NULL,

	--/ <summary>Best-fit specific star formation rate</summary>
	--/ <quantity>phys.SFR</quantity>
	--/ <unit>log(Gyr-1)</unit>
	[ssfr] [float] NULL,

	--/ <summary>Mean specific star formation rate</summary>
	--/ <quantity>phys.SFR;stat.mean</quantity>
	--/ <unit>log(Gyr-1)</unit>
	[ssfr_mean] [float] NULL,

	--/ <summary>Minimum value (lower 68% confidence level) for specific star formation rate</summary>
	--/ <quantity>phys.SFR;stat.min</quantity>
	--/ <unit>log(Gyr-1)</unit>
	[ssfr_min] [float] NULL,

	--/ <summary>Maximum value (higher 68% confidence level) for specific star formation rate</summary>
	--/ <quantity>phys.SFR;stat.max</quantity>
	--/ <unit>log(Gyr-1)</unit>
	[ssfr_max] [float] NULL,
 CONSTRAINT [pk_stellarMassFSPSGranWideNoDust] PRIMARY KEY CLUSTERED 
(
	[specObjID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[stellarMassPassivePort]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

--/ <summary> Estimated stellar masses for SDSS and BOSS galaxies (Portsmouth method, passive model) </summary>
--/ <remarks> Stellar masses using the method of &lt;a href='http://adsabs.harvard.edu/abs/2009MNRAS.394L.107M'>Maraston et al. (2009).&lt;/a>  These fit passive stellar evolution models to the SDSS photometry, using  the known redshifts. The model is a instantaneous burst stellar population   whose age is fit for (with a minimum allowed age of 3 Gyrs). The population  is 97% solar metallicity and 3% metal-poor, by mass. In this table we   assume the Kroupa IMF. </remarks>
CREATE TABLE [dbo].[stellarMassPassivePort](

	--/ <summary>Unique ID</summary>
	--/ <quantity>meta.id</quantity>
	[specObjID] [bigint] NOT NULL,

	--/ <summary>Plate number</summary>
	--/ <quantity>meta.id;instr.det</quantity>
	[plate] [smallint] NOT NULL,

	--/ <summary>Fiber ID</summary>
	--/ <quantity>meta.id;instr.param</quantity>
	[fiberID] [smallint] NOT NULL,

	--/ <summary>MJD of observation</summary>
	--/ <quantity>time.epoch;obs</quantity>
	--/ <unit>d</unit>
	[mjd] [int] NOT NULL,

	--/ <summary>Right ascension of fiber, J2000</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[ra] [float] NOT NULL,

	--/ <summary>Declination of fiber, J2000</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[dec] [float] NOT NULL,

	--/ <summary>Redshift used (corresponds to z_noqso in specObjAll)</summary>
	--/ <quantity>src.redshift</quantity>
	[z] [real] NOT NULL,

	--/ <summary>Error in z (corresponds to zErr_noqso in specObjAll)</summary>
	--/ <quantity>stat.error;src.redshift</quantity>
	[zErr] [real] NOT NULL,

	--/ <summary>Best-fit stellar mass of galaxy</summary>
	--/ <quantity>phys.mass</quantity>
	--/ <unit>dex M_sol</unit>
	[logMass] [real] NOT NULL,

	--/ <summary>1-sigma minimum stellar mass (where chi-squared is within minimum + 1)</summary>
	--/ <quantity>phys.mass;stat.min</quantity>
	--/ <unit>dex M_sol</unit>
	[minLogMass] [real] NOT NULL,

	--/ <summary>1-sigma maximum stellar mass (where chi-squared is within minimum + 1)</summary>
	--/ <quantity>phys.mass;stat.max</quantity>
	--/ <unit>dex M_sol</unit>
	[maxLogMass] [real] NOT NULL,

	--/ <summary>Median value in mass PDF (log base 10 in solar masses)</summary>
	--/ <quantity>phys.mass;stat.median</quantity>
	--/ <unit>dex M_sol</unit>
	[medianPDF] [real] NOT NULL,

	--/ <summary>16% lower limit on stellar mass in PDF</summary>
	--/ <quantity>phys.mass;stat.min</quantity>
	--/ <unit>dex M_sol</unit>
	[PDF16] [real] NOT NULL,

	--/ <summary>84% upper limit on stellar mass in PDF</summary>
	--/ <quantity>phys.mass;stat.max</quantity>
	--/ <unit>dex M_sol</unit>
	[PDF84] [real] NOT NULL,

	--/ <summary>Peak of PDF (log base 10 in solar masses)</summary>
	--/ <quantity>phys.mass</quantity>
	--/ <unit>dex M_sol</unit>
	[peakPDF] [real] NOT NULL,

	--/ <summary>Best-fit stellar mass of galaxy (log base 10 in solar masses)</summary>
	--/ <quantity>phys.mass</quantity>
	--/ <unit>dex M_sol</unit>
	[logMass_noMassLoss] [real] NOT NULL,

	--/ <summary>1-sigma minimum stellar mass (where chi-squared is within minimum + 1), not accounting for mass loss</summary>
	--/ <quantity>phys.mass;stat.min</quantity>
	--/ <unit>dex M_sol</unit>
	[minLogMass_noMassLoss] [real] NOT NULL,

	--/ <summary>1-sigma maximum stellar mass (where chi-squared is within minimum + 1), not accounting for mass loss</summary>
	--/ <quantity>phys.mass;stat.max</quantity>
	--/ <unit>dex M_sol</unit>
	[maxLogMass_noMassLoss] [real] NOT NULL,

	--/ <summary>Median value in mass PDF, not accounting for mass loss (log base 10 in solar masses)</summary>
	--/ <quantity>phys.mass;stat.median</quantity>
	--/ <unit>dex M_sol</unit>
	[medianPDF_noMassLoss] [real] NOT NULL,

	--/ <summary>16% lower limit on stellar mass in PDF, not accounting for mass loss</summary>
	--/ <quantity>phys.mass;stat.min</quantity>
	--/ <unit>dex M_sol</unit>
	[PDF16_noMassLoss] [real] NOT NULL,

	--/ <summary>84% upper limit on stellar mass in PDF, not accounting for mass loss</summary>
	--/ <quantity>phys.mass;stat.max</quantity>
	--/ <unit>dex M_sol</unit>
	[PDF84_noMassLoss] [real] NOT NULL,

	--/ <summary>Peak of PDF, not accounting for mass loss (log base 10 in solar masses)</summary>
	--/ <quantity>phys.mass</quantity>
	--/ <unit>dex M_sol</unit>
	[peakPDF_noMassLoss] [real] NOT NULL,

	--/ <summary>Reduced chi squared of best fit</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[reducedChi2] [real] NOT NULL,

	--/ <summary>Age of best fit</summary>
	--/ <quantity>time.age</quantity>
	--/ <unit>Gyrs</unit>
	[age] [real] NOT NULL,

	--/ <summary>1-sigma minimum age (where chi-squared is within minimum + 1)</summary>
	--/ <quantity>time.age;stat.min</quantity>
	--/ <unit>Gyrs</unit>
	[minAge] [real] NOT NULL,

	--/ <summary>1-sigma maximum age (where chi-squared is within minimum + 1)</summary>
	--/ <quantity>time.age;stat.max</quantity>
	--/ <unit>Gyrs</unit>
	[maxAge] [real] NOT NULL,

	--/ <summary>Star-formation rate of best fit</summary>
	--/ <quantity>phys.SFR</quantity>
	--/ <unit>M_sol yr-1</unit>
	[SFR] [real] NOT NULL,

	--/ <summary>1-sigma minimum star-formation rate of best fit (where chi-squared is within minimum + 1)</summary>
	--/ <quantity>phys.SFR;stat.min</quantity>
	--/ <unit>M_sol yr-1</unit>
	[minSFR] [real] NOT NULL,

	--/ <summary>1-sigma maximum star-formation rate of best fit (where chi-squared is within minimum + 1)</summary>
	--/ <quantity>phys.SFR;stat.max</quantity>
	--/ <unit>M_sol yr-1</unit>
	[maxSFR] [real] NOT NULL,

	--/ <summary>Absolute magnitude in K inferred from model</summary>
	--/ <quantity>phot.mag.abs;meta.modelled;em.IR.K</quantity>
	[absMagK] [real] NOT NULL,

	--/ <summary>Star-formation history model used</summary>
	--/ <quantity>meta.note</quantity>
	[SFH] [varchar](32) NOT NULL,

	--/ <summary>Metallicity of best fit template (0.004, 0.01, 0.02, 0.04, or "composite")</summary>
	--/ <quantity>phys.abund.Z</quantity>
	[Metallicity] [varchar](32) NOT NULL,

	--/ <summary>ID of best fit reddening law (0 = no reddening)</summary>
	--/ <quantity>meta.id</quantity>
	[reddeninglaw] [smallint] NOT NULL,

	--/ <summary>Number of filters used in the fit (default is 5 for ugriz)</summary>
	--/ <quantity>meta.number</quantity>
	[nFilter] [smallint] NOT NULL,
 CONSTRAINT [pk_stellarMassPassivePort_specOb] PRIMARY KEY CLUSTERED 
(
	[specObjID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[stellarMassPCAWiscBC03]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--/ <summary> Estimated stellar masses for SDSS and BOSS galaxies (Wisconsin method, Bruzual-Charlot models) </summary>
--/ <remarks> Stellar masses using the method of &lt;a href='http://adsabs.harvard.edu/abs/2012MNRAS.421..314C'>Chen et al. (2012).&lt;/a>  In this table, the best estimate of stellar mass is 'mstellar_median'.  This version of the table uses the &lt;a href='http://adsabs.harvard.edu/abs/2003MNRAS.344.1000B'>Bruzual and Charlot (2003)&lt;/a> stellar  population synthesis models.  Please use the 'warning' values to check for data quality:	warning = 0 : Results correspond to a best-fit PCA spectrum (no problems detected)	warning = 1 : Target redshift too small (z &lt; 0.05)	warning = 2 : Target redshift too large (z &gt; 0.80)	warning = 3 : READSPEC cannot get wavelength vector	warning = 4 : Available wavelengths all outside PCA coverage	 warning = 5 : Unable to project projection wavelength range	warning = 6 : Unable to select projection wavelength range	warning = 7 : Minimum chi^2 less than zero	warning = 8 : Total of log mass PDF equal to zero	warning = 9 : Total of velocity dispersion PDF equal to zero </remarks>
CREATE TABLE [dbo].[stellarMassPCAWiscBC03](

	--/ <summary>Unique ID</summary>
	--/ <quantity>meta.id</quantity>
	[specObjID] [bigint] NOT NULL,

	--/ <summary>Plate number</summary>
	--/ <quantity>meta.id;instr.det</quantity>
	[plate] [smallint] NOT NULL,

	--/ <summary>Fiber ID</summary>
	--/ <quantity>meta.id;instr.param</quantity>
	[fiberID] [smallint] NOT NULL,

	--/ <summary>MJD of observation</summary>
	--/ <quantity>time.epoch</quantity>
	--/ <unit>d</unit>
	[mjd] [int] NOT NULL,

	--/ <summary>Right ascension of fiber, J2000</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[ra] [float] NOT NULL,

	--/ <summary>Declination of fiber, J2000</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[dec] [float] NOT NULL,

	--/ <summary>Redshift used (corresponds to z_noqso in specObjAll)</summary>
	--/ <quantity>src.redshift</quantity>
	[z] [real] NOT NULL,

	--/ <summary>Error in z (corresponds to zErr_noqso in specObjAll)</summary>
	--/ <quantity>stat.error;src.redshift</quantity>
	[zErr] [real] NOT NULL,

	--/ <summary>Index of chi^2 minimum corresponding to z_noqso</summary>
	--/ <quantity>meta.id;src.redshift</quantity>
	[zNum] [int] NOT NULL,

	--/ <summary>median (50th percentile of PDF) of log stellar mass (best estimator)</summary>
	--/ <quantity>phys.mass</quantity>
	--/ <unit>dex M_sol</unit>
	[mstellar_median] [float] NOT NULL,

	--/ <summary>1-sigma error in log stellar mass (84th minus 16th percential)</summary>
	--/ <quantity>stat.error;phys.mass</quantity>
	--/ <unit>dex M_sol</unit>
	[mstellar_err] [float] NOT NULL,

	--/ <summary>2.5th percentile of PDF of log stellar mass</summary>
	--/ <quantity>phys.mass</quantity>
	--/ <unit>dex M_sol</unit>
	[mstellar_p2p5] [float] NOT NULL,

	--/ <summary>16th percentile of PDF of log stellar mass</summary>
	--/ <quantity>phys.mass</quantity>
	--/ <unit>dex M_sol</unit>
	[mstellar_p16] [float] NOT NULL,

	--/ <summary>84th percentile of PDF of log stellar mass</summary>
	--/ <quantity>phys.mass</quantity>
	--/ <unit>dex M_sol</unit>
	[mstellar_p84] [float] NOT NULL,

	--/ <summary>97.5th percentile of PDF of log stellar mass</summary>
	--/ <quantity>phys.mass</quantity>
	--/ <unit>dex M_sol</unit>
	[mstellar_p97p5] [float] NOT NULL,

	--/ <summary>median (50th percentile of PDF) of velocity dispersion (best estimator)</summary>
	--/ <quantity>phys.veloc.dispersion</quantity>
	--/ <unit>km s-1</unit>
	[vdisp_median] [float] NOT NULL,

	--/ <summary>1-sigma error in velocity dispersion (84th minus 16th percential)</summary>
	--/ <quantity>stat.error;phys.veloc.dispersion</quantity>
	--/ <unit>km s-1</unit>
	[vdisp_err] [float] NOT NULL,

	--/ <summary>2.5th percentile of PDF of velocity dispersion</summary>
	--/ <quantity>phys.veloc.dispersion</quantity>
	--/ <unit>km s-1</unit>
	[vdisp_p2p5] [float] NOT NULL,

	--/ <summary>16th percentile of PDF of velocity dispersion</summary>
	--/ <quantity>phys.veloc.dispersion</quantity>
	--/ <unit>km s-1</unit>
	[vdisp_p16] [float] NOT NULL,

	--/ <summary>84th percentile of PDF of velocity dispersion</summary>
	--/ <quantity>phys.veloc.dispersion</quantity>
	--/ <unit>km s-1</unit>
	[vdisp_p84] [float] NOT NULL,

	--/ <summary>97.5th percentile of PDF of velocity dispersion</summary>
	--/ <quantity>phys.veloc.dispersion</quantity>
	--/ <unit>km s-1</unit>
	[vdisp_p97p5] [float] NOT NULL,

	--/ <summary>Coefficient for 0th eigenspectrum in fit</summary>
	--/ <quantity>stat.fit.param</quantity>
	[calpha_0] [real] NOT NULL,

	--/ <summary>Coefficient for 1th eigenspectrum in fit</summary>
	--/ <quantity>stat.fit.param</quantity>
	[calpha_1] [real] NOT NULL,

	--/ <summary>Coefficient for 2th eigenspectrum in fit</summary>
	--/ <quantity>stat.fit.param</quantity>
	[calpha_2] [real] NOT NULL,

	--/ <summary>Coefficient for 3th eigenspectrum in fit</summary>
	--/ <quantity>stat.fit.param</quantity>
	[calpha_3] [real] NOT NULL,

	--/ <summary>Coefficient for 4th eigenspectrum in fit</summary>
	--/ <quantity>stat.fit.param</quantity>
	[calpha_4] [real] NOT NULL,

	--/ <summary>Coefficient for 5th eigenspectrum in fit</summary>
	--/ <quantity>stat.fit.param</quantity>
	[calpha_5] [real] NOT NULL,

	--/ <summary>Coefficient for 6th eigenspectrum in fit</summary>
	--/ <quantity>stat.fit.param</quantity>
	[calpha_6] [real] NOT NULL,

	--/ <summary>Overall normalization for best-fit</summary>
	--/ <quantity>stat.fit.param</quantity>
	[calpha_norm] [real] NOT NULL,

	--/ <summary>Output warnings: 0 if everything is fine.</summary>
	--/ <quantity>meta.code</quantity>
	[warning] [int] NOT NULL,
 CONSTRAINT [pk_stellarMassPCAWiscBC03_specOb] PRIMARY KEY CLUSTERED 
(
	[specObjID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[stellarMassPCAWiscM11]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--/ <summary> Estimated stellar masses for SDSS and BOSS galaxies (Wisconsin method, Maraston models)  </summary>
--/ <remarks> Stellar masses using the method of &lt;a href='http://adsabs.harvard.edu/abs/2012MNRAS.421..314C'>Chen et al. (2012).&lt;/a>  In this table, the best estimate of stellar mass is 'mstellar_median'.  This version of the table uses the &lt;a href='http://adsabs.harvard.edu/abs/2011MNRAS.418.2785M'>Maraston and Stromback (2011)&lt;/a> stellar  population synthesis models.  Please use the 'warning' values to check for data quality:	warning = 0 : Results correspond to a best-fit PCA spectrum (no problems detected)	warning = 1 : Target redshift too small (z &lt; 0.05)	warning = 2 : Target redshift too large (z &gt; 0.80)	warning = 3 : READSPEC cannot get wavelength vector	warning = 4 : Available wavelengths all outside PCA coverage	 warning = 5 : Unable to project projection wavelength range	warning = 6 : Unable to select projection wavelength range	warning = 7 : Minimum chi^2 less than zero	warning = 8 : Total of log mass PDF equal to zero	warning = 9 : Total of velocity dispersion PDF equal to zero </remarks>
CREATE TABLE [dbo].[stellarMassPCAWiscM11](

	--/ <summary>Unique ID</summary>
	--/ <quantity>meta.id</quantity>
	[specObjID] [bigint] NOT NULL,

	--/ <summary>Plate number</summary>
	--/ <quantity>meta.id;instr.det</quantity>
	[plate] [smallint] NOT NULL,

	--/ <summary>Fiber ID</summary>
	--/ <quantity>meta.id;instr.param</quantity>
	[fiberID] [smallint] NOT NULL,

	--/ <summary>MJD of observation</summary>
	--/ <quantity>time.epoch</quantity>
	--/ <unit>d</unit>
	[mjd] [int] NOT NULL,

	--/ <summary>Right ascension of fiber, J2000</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[ra] [float] NOT NULL,

	--/ <summary>Declination of fiber, J2000</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[dec] [float] NOT NULL,

	--/ <summary>Redshift used (corresponds to z_noqso in specObjAll)</summary>
	--/ <quantity>src.redshift</quantity>
	[z] [real] NOT NULL,

	--/ <summary>Error in z (corresponds to zErr_noqso in specObjAll)</summary>
	--/ <quantity>stat.error;src.redshift</quantity>
	[zErr] [real] NOT NULL,

	--/ <summary>Index of chi^2 minimum corresponding to z_noqso</summary>
	--/ <quantity>meta.id;src.redshift</quantity>
	[zNum] [int] NOT NULL,

	--/ <summary>median (50th percentile of PDF) of log stellar mass (best estimator)</summary>
	--/ <quantity>phys.mass</quantity>
	--/ <unit>dex M_sol</unit>
	[mstellar_median] [float] NOT NULL,

	--/ <summary>1-sigma error in log stellar mass (84th minus 16th percential)</summary>
	--/ <quantity>stat.error;phys.mass</quantity>
	--/ <unit>dex M_sol</unit>
	[mstellar_err] [float] NOT NULL,

	--/ <summary>2.5th percentile of PDF of log stellar mass</summary>
	--/ <quantity>phys.mass</quantity>
	--/ <unit>dex M_sol</unit>
	[mstellar_p2p5] [float] NOT NULL,

	--/ <summary>16th percentile of PDF of log stellar mass</summary>
	--/ <quantity>phys.mass</quantity>
	--/ <unit>dex M_sol</unit>
	[mstellar_p16] [float] NOT NULL,

	--/ <summary>84th percentile of PDF of log stellar mass</summary>
	--/ <quantity>phys.mass</quantity>
	--/ <unit>dex M_sol</unit>
	[mstellar_p84] [float] NOT NULL,

	--/ <summary>97.5th percentile of PDF of log stellar mass</summary>
	--/ <quantity>phys.mass</quantity>
	--/ <unit>dex M_sol</unit>
	[mstellar_p97p5] [float] NOT NULL,

	--/ <summary>median (50th percentile of PDF) of velocity dispersion (best estimator)</summary>
	--/ <quantity>phys.veloc.dispersion</quantity>
	--/ <unit>km s-1</unit>
	[vdisp_median] [float] NOT NULL,

	--/ <summary>1-sigma error in velocity dispersion (84th minus 16th percential)</summary>
	--/ <quantity>stat.error;phys.veloc.dispersion</quantity>
	--/ <unit>km s-1</unit>
	[vdisp_err] [float] NOT NULL,

	--/ <summary>2.5th percentile of PDF of velocity dispersion</summary>
	--/ <quantity>phys.veloc.dispersion</quantity>
	--/ <unit>km s-1</unit>
	[vdisp_p2p5] [float] NOT NULL,

	--/ <summary>16th percentile of PDF of velocity dispersion</summary>
	--/ <quantity>phys.veloc.dispersion</quantity>
	--/ <unit>km s-1</unit>
	[vdisp_p16] [float] NOT NULL,

	--/ <summary>84th percentile of PDF of velocity dispersion</summary>
	--/ <quantity>phys.veloc.dispersion</quantity>
	--/ <unit>km s-1</unit>
	[vdisp_p84] [float] NOT NULL,

	--/ <summary>97.5th percentile of PDF of velocity dispersion</summary>
	--/ <quantity>phys.veloc.dispersion</quantity>
	--/ <unit>km s-1</unit>
	[vdisp_p97p5] [float] NOT NULL,

	--/ <summary>Coefficient for 0th eigenspectrum in fit</summary>
	--/ <quantity>stat.fit.param</quantity>
	[calpha_0] [real] NOT NULL,

	--/ <summary>Coefficient for 1th eigenspectrum in fit</summary>
	--/ <quantity>stat.fit.param</quantity>
	[calpha_1] [real] NOT NULL,

	--/ <summary>Coefficient for 2th eigenspectrum in fit</summary>
	--/ <quantity>stat.fit.param</quantity>
	[calpha_2] [real] NOT NULL,

	--/ <summary>Coefficient for 3th eigenspectrum in fit</summary>
	--/ <quantity>stat.fit.param</quantity>
	[calpha_3] [real] NOT NULL,

	--/ <summary>Coefficient for 4th eigenspectrum in fit</summary>
	--/ <quantity>stat.fit.param</quantity>
	[calpha_4] [real] NOT NULL,

	--/ <summary>Coefficient for 5th eigenspectrum in fit</summary>
	--/ <quantity>stat.fit.param</quantity>
	[calpha_5] [real] NOT NULL,

	--/ <summary>Coefficient for 6th eigenspectrum in fit</summary>
	--/ <quantity>stat.fit.param</quantity>
	[calpha_6] [real] NOT NULL,

	--/ <summary>Overall normalization for best-fit</summary>
	--/ <quantity>stat.fit.param</quantity>
	[calpha_norm] [real] NOT NULL,

	--/ <summary>Output warnings: 0 if everything is fine.</summary>
	--/ <quantity>meta.code</quantity>
	[warning] [int] NOT NULL,
 CONSTRAINT [pk_stellarMassPCAWiscM11_specObj] PRIMARY KEY CLUSTERED 
(
	[specObjID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[stellarMassStarformingPort]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

--/ <summary> Estimated stellar masses for SDSS and BOSS galaxies (Portsmouth method, star-forming model). </summary>
--/ <remarks> Stellar masses using the method of &lt;a href='http://adsabs.harvard.edu/abs/2009MNRAS.394L.107M'>Maraston et al. (2006).&lt;/a>  These fit stellar evolution models to the SDSS photometry, using  the known BOSS redshifts. The star-formation model uses a  metallicity (specified in the 'metallicity' column) and one of three  star-formation histories: constant, truncated, and exponentially  declining ('tau'). The type, and relevant time scale, are given in the 'SFH'  column. The 'age' listed gives the start time for the onset of  star-formation in each model. In this table we assume the Kroupa IMF. </remarks>
CREATE TABLE [dbo].[stellarMassStarformingPort](

	--/ <summary>Unique ID</summary>
	--/ <quantity>meta.id</quantity>
	[specObjID] [bigint] NOT NULL,

	--/ <summary>Plate number</summary>
	--/ <quantity>meta.id;instr.det</quantity>
	[plate] [smallint] NOT NULL,

	--/ <summary>Fiber ID</summary>
	--/ <quantity>meta.id;instr.param</quantity>
	[fiberID] [smallint] NOT NULL,

	--/ <summary>MJD of observation</summary>
	--/ <quantity>time.epoch;obs</quantity>
	--/ <unit>d</unit>
	[mjd] [int] NOT NULL,

	--/ <summary>Right ascension of fiber, J2000</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[ra] [float] NOT NULL,

	--/ <summary>Declination of fiber, J2000</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[dec] [float] NOT NULL,

	--/ <summary>Redshift used (corresponds to z_noqso in specObjAll)</summary>
	--/ <quantity>src.redshift</quantity>
	[z] [real] NOT NULL,

	--/ <summary>Error in z (corresponds to zErr_noqso in specObjAll)</summary>
	--/ <quantity>stat.error;src.redshift</quantity>
	[zErr] [real] NOT NULL,

	--/ <summary>Best-fit stellar mass of galaxy</summary>
	--/ <quantity>phys.mass</quantity>
	--/ <unit>dex M_sol</unit>
	[logMass] [real] NOT NULL,

	--/ <summary>1-sigma minimum stellar mass (where chi-squared is within minimum + 1)</summary>
	--/ <quantity>phys.mass;stat.min</quantity>
	--/ <unit>dex M_sol</unit>
	[minLogMass] [real] NOT NULL,

	--/ <summary>1-sigma maximum stellar mass (where chi-squared is within minimum + 1)</summary>
	--/ <quantity>phys.mass;stat.max</quantity>
	--/ <unit>dex M_sol</unit>
	[maxLogMass] [real] NOT NULL,

	--/ <summary>Median value in mass PDF (log base 10 in solar masses)</summary>
	--/ <quantity>phys.mass;stat.median</quantity>
	--/ <unit>dex M_sol</unit>
	[medianPDF] [real] NOT NULL,

	--/ <summary>16% lower limit on stellar mass in PDF</summary>
	--/ <quantity>phys.mass;stat.min</quantity>
	--/ <unit>dex M_sol</unit>
	[PDF16] [real] NOT NULL,

	--/ <summary>84% upper limit on stellar mass in PDF</summary>
	--/ <quantity>phys.mass;stat.max</quantity>
	--/ <unit>dex M_sol</unit>
	[PDF84] [real] NOT NULL,

	--/ <summary>Peak of PDF (log base 10 in solar masses)</summary>
	--/ <quantity>phys.mass</quantity>
	--/ <unit>dex M_sol</unit>
	[peakPDF] [real] NOT NULL,

	--/ <summary>Best-fit stellar mass of galaxy (log base 10 in solar masses)</summary>
	--/ <quantity>phys.mass</quantity>
	--/ <unit>dex M_sol</unit>
	[logMass_noMassLoss] [real] NOT NULL,

	--/ <summary>1-sigma minimum stellar mass (where chi-squared is within minimum + 1), not accounting for mass loss</summary>
	--/ <quantity>phys.mass;stat.min</quantity>
	--/ <unit>dex M_sol</unit>
	[minLogMass_noMassLoss] [real] NOT NULL,

	--/ <summary>1-sigma maximum stellar mass (where chi-squared is within minimum + 1), not accounting for mass loss</summary>
	--/ <quantity>phys.mass;stat.max</quantity>
	--/ <unit>dex M_sol</unit>
	[maxLogMass_noMassLoss] [real] NOT NULL,

	--/ <summary>Median value in mass PDF, not accounting for mass loss (log base 10 in solar masses)</summary>
	--/ <quantity>phys.mass;stat.median</quantity>
	--/ <unit>dex M_sol</unit>
	[medianPDF_noMassLoss] [real] NOT NULL,

	--/ <summary>16% lower limit on stellar mass in PDF, not accounting for mass loss</summary>
	--/ <quantity>phys.mass;stat.min</quantity>
	--/ <unit>dex M_sol</unit>
	[PDF16_noMassLoss] [real] NOT NULL,

	--/ <summary>84% upper limit on stellar mass in PDF, not accounting for mass loss</summary>
	--/ <quantity>phys.mass.stat.max</quantity>
	--/ <unit>dex M_sol</unit>
	[PDF84_noMassLoss] [real] NOT NULL,

	--/ <summary>Peak of PDF, not accounting for mass loss (log base 10 in solar masses)</summary>
	--/ <quantity>phys.mass</quantity>
	--/ <unit>dex M_sol</unit>
	[peakPDF_noMassLoss] [real] NOT NULL,

	--/ <summary>Reduced chi squared of best fit</summary>
	--/ <quantity>stat.fit.chi2</quantity>
	[reducedChi2] [real] NOT NULL,

	--/ <summary>Age of best fit</summary>
	--/ <quantity>time.age</quantity>
	--/ <unit>Gyrs</unit>
	[age] [real] NOT NULL,

	--/ <summary>1-sigma minimum age (where chi-squared is within minimum + 1)</summary>
	--/ <quantity>time.age;sta.min</quantity>
	--/ <unit>Gyrs</unit>
	[minAge] [real] NOT NULL,

	--/ <summary>1-sigma maximum age (where chi-squared is within minimum + 1)</summary>
	--/ <quantity>time.age;stat.max</quantity>
	--/ <unit>Gyrs</unit>
	[maxAge] [real] NOT NULL,

	--/ <summary>Star-formation rate of best fit</summary>
	--/ <quantity>phys.SFR</quantity>
	--/ <unit>M_sol yr-1</unit>
	[SFR] [real] NOT NULL,

	--/ <summary>1-sigma minimum star-formation rate of best fit (where chi-squared is within minimum + 1)</summary>
	--/ <quantity>phys.SFR;stat.min</quantity>
	--/ <unit>M_sol yr-1</unit>
	[minSFR] [real] NOT NULL,

	--/ <summary>1-sigma maximum star-formation rate of best fit (where chi-squared is within minimum + 1)</summary>
	--/ <quantity>phys.SFR.stat.max</quantity>
	--/ <unit>M_sol yr-1</unit>
	[maxSFR] [real] NOT NULL,

	--/ <summary>Absolute magnitude in K inferred from model</summary>
	--/ <quantity>phot.mag.abs;em.IR.K</quantity>
	[absMagK] [real] NOT NULL,

	--/ <summary>Star-formation history model used ("const" or "tau=X" or "trunc=X", where X is the exponential decline rate, or the time until truncation of the model)</summary>
	--/ <quantity>meta.note</quantity>
	[SFH] [varchar](32) NOT NULL,

	--/ <summary>Metallicity of best fit template (0.004, 0.01, 0.02, 0.04, or "composite")</summary>
	--/ <quantity>phys.abund.Z</quantity>
	[Metallicity] [varchar](32) NOT NULL,

	--/ <summary>ID of best fit reddening law (0 = no reddening)</summary>
	--/ <quantity>meta.id</quantity>
	[reddeninglaw] [smallint] NOT NULL,

	--/ <summary>Number of filters used in the fit (default is 5 for ugriz)</summary>
	--/ <quantity>meta.number</quantity>
	[nFilter] [smallint] NOT NULL,
 CONSTRAINT [pk_stellarMassStarformingPort_sp] PRIMARY KEY CLUSTERED 
(
	[specObjID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[StripeDefs]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

--/ <summary> This table contains the definitions of the survey layout as planned </summary>
--/ <remarks> The lower and upper limits of the actual stripes may differ from these  values. The actual numbers are found in the Segment and Chunk tables. </remarks>
CREATE TABLE [dbo].[StripeDefs](

	--/ <summary>Stripe number</summary>
	--/ <quantity>meta.id</quantity>
	[stripe] [int] NOT NULL,

	--/ <summary>Which hemisphere (N|S)</summary>
	--/ <quantity>meta.note;pos</quantity>
	[hemisphere] [varchar](64) NOT NULL,

	--/ <summary>Survey eta for the center of stripe</summary>
	--/ <quantity>pos</quantity>
	--/ <unit>deg</unit>
	[eta] [float] NOT NULL,

	--/ <summary>Survey lambda lower limit of the stripe</summary>
	--/ <quantity>pos;stat.min</quantity>
	--/ <unit>deg</unit>
	[lambdaMin] [float] NOT NULL,

	--/ <summary>Survey lambda upper limit of the stripe</summary>
	--/ <quantity>pos;stat.max</quantity>
	--/ <unit>deg</unit>
	[lambdaMax] [float] NOT NULL,

	--/ <summary>HTM area descriptor string</summary>
	--/ <quantity>meta.note</quantity>
	[htmArea] [varchar](1024) NOT NULL,
 CONSTRAINT [pk_StripeDefs_stripe] PRIMARY KEY CLUSTERED 
(
	[stripe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[thingIndex]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--/ <summary> Full list of all 'things': unique objects in the SDSS imaging </summary>
--/ <remarks> Each row in this table corresponds to a single 'thing' observed  by the SDSS imaging survey. By joining with the 'detectionIndex'  table one can retrieve all of the observations of a particular   thing.  NOTE: The RA and Dec in this table refer to the DR8 coordinates,  which have errors in the region north of 41 deg in Dec, since  those were used for the resolving of the survey.  These errors  should have a very small effect on the decision about which  objects are matched to each other. </remarks>
CREATE TABLE [dbo].[thingIndex](

	--/ <summary>thing ID number</summary>
	--/ <quantity>meta.id</quantity>
	[thingId] [bigint] NOT NULL,

	--/ <summary>id number of polygon containing object in sdssPolygons</summary>
	--/ <quantity>meta.id</quantity>
	[sdssPolygonID] [int] NOT NULL,

	--/ <summary>field identification of primary field</summary>
	--/ <quantity>meta.id;obs.field</quantity>
	[fieldID] [bigint] NOT NULL,

	--/ <summary>id of object for primary (or best) observation</summary>
	--/ <quantity>meta.id</quantity>
	[objID] [bigint] NOT NULL,

	--/ <summary>Non-zero if there is a detection of this object in the primary field covering this balkan.</summary>
	--/ <quantity>meta.code</quantity>
	[isPrimary] [tinyint] NOT NULL,

	--/ <summary>Number of detections of this object.</summary>
	--/ <quantity>meta.number</quantity>
	[nDetect] [int] NOT NULL,

	--/ <summary>Number of fields in which this is a RUN_EDGE object (observation close to edge)</summary>
	--/ <quantity>meta.number</quantity>
	[nEdge] [int] NOT NULL,

	--/ <summary>DR8 Right ascension, J2000 deg</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	[ra] [float] NOT NULL,

	--/ <summary>DR8 Declination, J2000 deg</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	[dec] [float] NOT NULL,

	--/ <summary>Load Version</summary>
	--/ <quantity>meta.version</quantity>
	[loadVersion] [int] NOT NULL,
 CONSTRAINT [pk_thingIndex_thingId] PRIMARY KEY CLUSTERED 
(
	[thingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[zoo2MainPhotoz]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

--/ <summary> Description: Morphological classifications of main-sample galaxies  with photometric redshifts only from Galaxy Zoo 2 </summary>
--/ <remarks> This table includes galaxies without spectra in SDSS Data Release 7.  Several columns give data that can be used to cross-match rows with  other SDSS tables, including objIDs and positions of the galaxies.  Morphological classifications include six parameters for each category:  unweighted and weighted versions of both the total number of votes and  the vote fraction for that response, the vote fraction after being  debiased, and flags for systems identified as being in clean samples.	Reference:  The project and data release are described in Willett et al.  (2013, in prep). Please cite this paper if making use of any data in  this table in publications. </remarks>
CREATE TABLE [dbo].[zoo2MainPhotoz](

	--/ <summary>match to the DR8 objID</summary>
	--/ <quantity>meta.id</quantity>
	[dr8objid] [bigint] NOT NULL,

	--/ <summary>match to the DR7 objID</summary>
	--/ <quantity>meta.id</quantity>
	[dr7objid] [bigint] NOT NULL,

	--/ <summary>right ascension [J2000.0], decimal degrees</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[ra] [real] NOT NULL,

	--/ <summary>declination [J2000.0], decimal degrees</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[dec] [real] NOT NULL,

	--/ <summary>right ascension [J2000.0], sexagesimal</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	[rastring] [varchar](16) NOT NULL,

	--/ <summary>declination [J2000.0], sexagesimal</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	[decstring] [varchar](16) NOT NULL,

	--/ <summary>sub-sample identification</summary>
	--/ <quantity>meta.id</quantity>
	[sample] [varchar](32) NOT NULL,

	--/ <summary>total number of classifications for this galaxy</summary>
	--/ <quantity>meta.number</quantity>
	[total_classifications] [int] NOT NULL,

	--/ <summary>total number of votes for each response, summed over all classifications</summary>
	--/ <quantity>meta.number</quantity>
	[total_votes] [int] NOT NULL,

	--/ <summary>number of votes for the "smooth" response to Task 01</summary>
	--/ <quantity>meta.number</quantity>
	[t01_smooth_or_features_a01_smooth_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "smooth" response to Task 01</summary>
	--/ <quantity>meta.number</quantity>
	[t01_smooth_or_features_a01_smooth_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "smooth" out of all responses to Task 01</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t01_smooth_or_features_a01_smooth_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "smooth" out of all responses to Task 01</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t01_smooth_or_features_a01_smooth_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "smooth" out of all responses to Task 01</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t01_smooth_or_features_a01_smooth_debiased] [float] NOT NULL,

	--/ <summary>flag for "smooth" - 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t01_smooth_or_features_a01_smooth_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "features or disk" response to Task 01</summary>
	--/ <quantity>meta.number</quantity>
	[t01_smooth_or_features_a02_features_or_disk_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "features or disk" response to Task 01</summary>
	--/ <quantity>meta.number</quantity>
	[t01_smooth_or_features_a02_features_or_disk_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "features or disk" out of all responses to Task 01</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t01_smooth_or_features_a02_features_or_disk_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "features or disk" out of all responses to Task 01</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t01_smooth_or_features_a02_features_or_disk_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "features or disk" out of all responses to Task 01</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t01_smooth_or_features_a02_features_or_disk_debiased] [float] NOT NULL,

	--/ <summary>flag for "features or disk"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t01_smooth_or_features_a02_features_or_disk_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "star or artifact" response to Task 01</summary>
	--/ <quantity>meta.number;</quantity>
	[t01_smooth_or_features_a03_star_or_artifact_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "star or artifact" response to Task 01</summary>
	--/ <quantity>meta.number;</quantity>
	[t01_smooth_or_features_a03_star_or_artifact_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "star or artifact" out of all responses to Task 01</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t01_smooth_or_features_a03_star_or_artifact_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "star or artifact" out of all responses to Task 01</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t01_smooth_or_features_a03_star_or_artifact_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "star or artifact" out of all responses to Task 01</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t01_smooth_or_features_a03_star_or_artifact_debiased] [float] NOT NULL,

	--/ <summary>flag for "star or artifact"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t01_smooth_or_features_a03_star_or_artifact_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "edge-on" response to Task 02</summary>
	--/ <quantity>meta.number</quantity>
	[t02_edgeon_a04_yes_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "edge-on" response to Task 02</summary>
	--/ <quantity>meta.number</quantity>
	[t02_edgeon_a04_yes_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "edge-on" out of all responses to Task 02</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t02_edgeon_a04_yes_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "edge-on" out of all responses to Task 02</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t02_edgeon_a04_yes_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "edge-on" out of all responses to Task 02</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t02_edgeon_a04_yes_debiased] [float] NOT NULL,

	--/ <summary>flag for "edge-on"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t02_edgeon_a04_yes_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "not edge-on" response to Task 02</summary>
	--/ <quantity>meta.number</quantity>
	[t02_edgeon_a05_no_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "not edge-on" response to Task 02</summary>
	--/ <quantity>meta.number</quantity>
	[t02_edgeon_a05_no_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "not edge-on" out of all responses to Task 02</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t02_edgeon_a05_no_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "not edge-on" out of all responses to Task 02</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t02_edgeon_a05_no_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "not edge-on" out of all responses to Task 02</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t02_edgeon_a05_no_debiased] [float] NOT NULL,

	--/ <summary>flag for "not edge-on"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>mta.code</quantity>
	[t02_edgeon_a05_no_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "bar" response to Task 03</summary>
	--/ <quantity>meta.number</quantity>
	[t03_bar_a06_bar_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "bar" response to Task 03</summary>
	--/ <quantity>meta.number</quantity>
	[t03_bar_a06_bar_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "bar" out of all responses to Task 03</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t03_bar_a06_bar_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "bar" out of all responses to Task 03</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t03_bar_a06_bar_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "bar" out of all responses to Task 03</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t03_bar_a06_bar_debiased] [float] NOT NULL,

	--/ <summary>flag for "bar"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t03_bar_a06_bar_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "no bar" response to Task 03</summary>
	--/ <quantity>meta.number</quantity>
	[t03_bar_a07_no_bar_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "no bar" response to Task 03</summary>
	--/ <quantity>meta.number</quantity>
	[t03_bar_a07_no_bar_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "no bar" out of all responses to Task 03</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t03_bar_a07_no_bar_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "no bar" out of all responses to Task 03</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t03_bar_a07_no_bar_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "no bar" out of all responses to Task 03</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t03_bar_a07_no_bar_debiased] [float] NOT NULL,

	--/ <summary>flag for "no bar"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t03_bar_a07_no_bar_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "spiral structure" response to Task 04</summary>
	--/ <quantity>meta.number</quantity>
	[t04_spiral_a08_spiral_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "spiral structure" response to Task 04</summary>
	--/ <quantity>meta.number</quantity>
	[t04_spiral_a08_spiral_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "spiral structure" out of all responses to Task 04</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t04_spiral_a08_spiral_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "spiral structure" out of all responses to Task 04</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t04_spiral_a08_spiral_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "spiral structure" out of all responses to Task 04</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t04_spiral_a08_spiral_debiased] [float] NOT NULL,

	--/ <summary>flag for "spiral structure"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t04_spiral_a08_spiral_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "no spiral structure" response to Task 04</summary>
	--/ <quantity>meta.number</quantity>
	[t04_spiral_a09_no_spiral_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "no spiral structure" response to Task 04</summary>
	--/ <quantity>meta.number</quantity>
	[t04_spiral_a09_no_spiral_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "no spiral structure" out of all responses to Task 04</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t04_spiral_a09_no_spiral_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "no spiral structure" out of all responses to Task 04</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t04_spiral_a09_no_spiral_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "no spiral structure" out of all responses to Task 04</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t04_spiral_a09_no_spiral_debiased] [float] NOT NULL,

	--/ <summary>flag for "no spiral structure"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t04_spiral_a09_no_spiral_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "no bulge" response to Task 05</summary>
	--/ <quantity>meta.number</quantity>
	[t05_bulge_prominence_a10_no_bulge_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "no bulge" response to Task 05</summary>
	--/ <quantity>meta.number</quantity>
	[t05_bulge_prominence_a10_no_bulge_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "no bulge" out of all responses to Task 05</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t05_bulge_prominence_a10_no_bulge_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "no bulge" out of all responses to Task 05</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t05_bulge_prominence_a10_no_bulge_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "no bulge" out of all responses to Task 05</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t05_bulge_prominence_a10_no_bulge_debiased] [float] NOT NULL,

	--/ <summary>flag for "no bulge"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t05_bulge_prominence_a10_no_bulge_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "just noticeable bulge" response to Task 05</summary>
	--/ <quantity>meta.number</quantity>
	[t05_bulge_prominence_a11_just_noticeable_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "just noticeable bulge" response to Task 05</summary>
	--/ <quantity>meta.number</quantity>
	[t05_bulge_prominence_a11_just_noticeable_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "just noticeable bulge" out of all responses to Task 05</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t05_bulge_prominence_a11_just_noticeable_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "just noticeable bulge" out of all responses to Task 05</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t05_bulge_prominence_a11_just_noticeable_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "just noticeable bulge" out of all responses to Task 05</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t05_bulge_prominence_a11_just_noticeable_debiased] [float] NOT NULL,

	--/ <summary>flag for "just noticeable bulge"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t05_bulge_prominence_a11_just_noticeable_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "obvious bulge" response to Task 05</summary>
	--/ <quantity>meta.number</quantity>
	[t05_bulge_prominence_a12_obvious_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "obvious bulge" response to Task 05</summary>
	--/ <quantity>meta.number</quantity>
	[t05_bulge_prominence_a12_obvious_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "obvious bulge" out of all responses to Task 05</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t05_bulge_prominence_a12_obvious_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "obvious bulge" out of all responses to Task 05</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t05_bulge_prominence_a12_obvious_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "obvious bulge" out of all responses to Task 05</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t05_bulge_prominence_a12_obvious_debiased] [float] NOT NULL,

	--/ <summary>flag for "obvious bulge"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t05_bulge_prominence_a12_obvious_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "dominant bulge" response to Task 05</summary>
	--/ <quantity>meta.number</quantity>
	[t05_bulge_prominence_a13_dominant_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "dominant bulge" response to Task 05</summary>
	--/ <quantity>meta.number</quantity>
	[t05_bulge_prominence_a13_dominant_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "dominant bulge" out of all responses to Task 05</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t05_bulge_prominence_a13_dominant_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "dominant bulge" out of all responses to Task 05</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t05_bulge_prominence_a13_dominant_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "dominant bulge" out of all responses to Task 05</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t05_bulge_prominence_a13_dominant_debiased] [float] NOT NULL,

	--/ <summary>flag for "dominant bulge"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t05_bulge_prominence_a13_dominant_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "something odd" response to Task 06</summary>
	--/ <quantity>meta.number</quantity>
	[t06_odd_a14_yes_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "something odd" response to Task 06</summary>
	--/ <quantity>meta.number</quantity>
	[t06_odd_a14_yes_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "something odd" out of all responses to Task 06</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t06_odd_a14_yes_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "something odd" out of all responses to Task 06</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t06_odd_a14_yes_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "something odd" out of all responses to Task 06</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t06_odd_a14_yes_debiased] [float] NOT NULL,

	--/ <summary>flag for "something odd"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t06_odd_a14_yes_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "nothing odd" response to Task 06</summary>
	--/ <quantity>meta.number</quantity>
	[t06_odd_a15_no_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "nothing odd" response to Task 06</summary>
	--/ <quantity>meta.number</quantity>
	[t06_odd_a15_no_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "nothing odd" out of all responses to Task 06</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t06_odd_a15_no_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "nothing odd" out of all responses to Task 06</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t06_odd_a15_no_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "nothing odd" out of all responses to Task 06</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t06_odd_a15_no_debiased] [float] NOT NULL,

	--/ <summary>flag for "nothing odd"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t06_odd_a15_no_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "smooth and completely round" response to Task 07</summary>
	--/ <quantity>meta.number</quantity>
	[t07_rounded_a16_completely_round_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "smooth and completely round" response to Task 07</summary>
	--/ <quantity>meta.number</quantity>
	[t07_rounded_a16_completely_round_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "smooth and completely round" out of all responses to Task 07</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t07_rounded_a16_completely_round_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "smooth and completely round" out of all responses to Task 07</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t07_rounded_a16_completely_round_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "smooth and completely round" out of all responses to Task 07</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t07_rounded_a16_completely_round_debiased] [float] NOT NULL,

	--/ <summary>flag for "smooth and completely round"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t07_rounded_a16_completely_round_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "smooth and in-between roundness" response to Task 07</summary>
	--/ <quantity>meta.number</quantity>
	[t07_rounded_a17_in_between_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "smooth and in-between roundness" response to Task 07</summary>
	--/ <quantity>meta.number</quantity>
	[t07_rounded_a17_in_between_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "smooth and in-between roundness" out of all responses to Task 07</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t07_rounded_a17_in_between_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "smooth and in-between roundness" out of all responses to Task 07</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t07_rounded_a17_in_between_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "smooth and in-between roundness" out of all responses to Task 07</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t07_rounded_a17_in_between_debiased] [float] NOT NULL,

	--/ <summary>flag for "smooth and in-between roundness"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t07_rounded_a17_in_between_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "smooth and cigar-shaped" response to Task 07</summary>
	--/ <quantity>meta.number</quantity>
	[t07_rounded_a18_cigar_shaped_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "smooth and cigar-shaped" response to Task 07</summary>
	--/ <quantity>meta.number</quantity>
	[t07_rounded_a18_cigar_shaped_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "smooth and cigar-shaped" out of all responses to Task 07</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t07_rounded_a18_cigar_shaped_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "smooth and cigar-shaped" out of all responses to Task 07</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t07_rounded_a18_cigar_shaped_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "smooth and cigar-shaped" out of all responses to Task 07</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t07_rounded_a18_cigar_shaped_debiased] [float] NOT NULL,

	--/ <summary>flag for "smooth and cigar-shaped"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t07_rounded_a18_cigar_shaped_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "odd feature is a ring" response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a19_ring_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "odd feature is a ring" response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a19_ring_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "odd feature is a ring" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a19_ring_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "odd feature is a ring" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a19_ring_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "odd feature is a ring" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a19_ring_debiased] [float] NOT NULL,

	--/ <summary>flag for "odd feature is a ring"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t08_odd_feature_a19_ring_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "odd feature is a lens or arc" response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a20_lens_or_arc_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "odd feature is a lens or arc" response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a20_lens_or_arc_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "odd feature is a lens or arc" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a20_lens_or_arc_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "odd feature is a lens or arc" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a20_lens_or_arc_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "odd feature is a lens or arc" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a20_lens_or_arc_debiased] [float] NOT NULL,

	--/ <summary>flag for "odd feature is a lens or arc"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t08_odd_feature_a20_lens_or_arc_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "odd feature is a disturbed" galaxy response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a21_disturbed_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "odd feature is a disturbed galaxy response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a21_disturbed_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "odd feature is a disturbed" galaxy out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a21_disturbed_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "odd feature is a disturbed galaxy out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a21_disturbed_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "odd feature is a disturbed" galaxy out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a21_disturbed_debiased] [float] NOT NULL,

	--/ <summary>flag for "odd feature is a disturbed galaxy"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t08_odd_feature_a21_disturbed_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "odd feature is an irregular" galaxy response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a22_irregular_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "odd feature is an irregular galaxy response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a22_irregular_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "odd feature is an irregular" galaxy out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a22_irregular_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "odd feature is an irregular galaxy out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a22_irregular_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "odd feature is an irregular" galaxy out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a22_irregular_debiased] [float] NOT NULL,

	--/ <summary>flag for "odd feature is an irregular galaxy"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t08_odd_feature_a22_irregular_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "odd feature is something else" response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a23_other_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "odd feature is something else" response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a23_other_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "odd feature is something else" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a23_other_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "odd feature is something else" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a23_other_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "odd feature is something else" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a23_other_debiased] [float] NOT NULL,

	--/ <summary>flag for "odd feature is something else"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t08_odd_feature_a23_other_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "odd feature is a merger" response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a24_merger_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "odd feature is a merger" response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a24_merger_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "odd feature is a merger" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a24_merger_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "odd feature is a merger" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a24_merger_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "odd feature is a merger" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a24_merger_debiased] [float] NOT NULL,

	--/ <summary>flag for "odd feature is a merger"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t08_odd_feature_a24_merger_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "odd feature is a dust lane" response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a38_dust_lane_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "odd feature is a dust lane" response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a38_dust_lane_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "odd feature is a dust lane" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a38_dust_lane_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "odd feature is a dust lane" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a38_dust_lane_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "odd feature is a dust lane" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a38_dust_lane_debiased] [float] NOT NULL,

	--/ <summary>flag for "odd feature is a dust lane"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t08_odd_feature_a38_dust_lane_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "edge-on bulge is rounded" response to Task 09</summary>
	--/ <quantity>meta.number</quantity>
	[t09_bulge_shape_a25_rounded_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "edge-on bulge is rounded" response to Task 09</summary>
	--/ <quantity>meta.number</quantity>
	[t09_bulge_shape_a25_rounded_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "edge-on bulge is rounded" out of all responses to Task 09</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t09_bulge_shape_a25_rounded_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "edge-on bulge is rounded" out of all responses to Task 09</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t09_bulge_shape_a25_rounded_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "edge-on bulge is rounded" out of all responses to Task 09</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t09_bulge_shape_a25_rounded_debiased] [float] NOT NULL,

	--/ <summary>flag for "edge-on bulge is rounded"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t09_bulge_shape_a25_rounded_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "edge-on bulge is boxy" response to Task 09</summary>
	--/ <quantity>meta.number</quantity>
	[t09_bulge_shape_a26_boxy_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "edge-on bulge is boxy" response to Task 09</summary>
	--/ <quantity>meta.number</quantity>
	[t09_bulge_shape_a26_boxy_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "edge-on bulge is boxy" out of all responses to Task 09</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t09_bulge_shape_a26_boxy_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "edge-on bulge is boxy" out of all responses to Task 09</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t09_bulge_shape_a26_boxy_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "edge-on bulge is boxy" out of all responses to Task 09</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t09_bulge_shape_a26_boxy_debiased] [float] NOT NULL,

	--/ <summary>flag for "edge-on bulge is boxy"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t09_bulge_shape_a26_boxy_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "no edge-on bulge" response to Task 09</summary>
	--/ <quantity>meta.number</quantity>
	[t09_bulge_shape_a27_no_bulge_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "no edge-on bulge" response to Task 09</summary>
	--/ <quantity>meta.number</quantity>
	[t09_bulge_shape_a27_no_bulge_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "no edge-on bulge" out of all responses to Task 09</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t09_bulge_shape_a27_no_bulge_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "no edge-on bulge" out of all responses to Task 09</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t09_bulge_shape_a27_no_bulge_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "no edge-on bulge" out of all responses to Task 09</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t09_bulge_shape_a27_no_bulge_debiased] [float] NOT NULL,

	--/ <summary>flag for "no edge-on bulge"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t09_bulge_shape_a27_no_bulge_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "tightly wound spiral arms" response to Task 10</summary>
	--/ <quantity>meta.number</quantity>
	[t10_arms_winding_a28_tight_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "tightly wound spiral arms" response to Task 10</summary>
	--/ <quantity>meta.number</quantity>
	[t10_arms_winding_a28_tight_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "tightly wound spiral arms" out of all responses to Task 10</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t10_arms_winding_a28_tight_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "tightly wound spiral arms" out of all responses to Task 10</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t10_arms_winding_a28_tight_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "tightly wound spiral arms" out of all responses to Task 10</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t10_arms_winding_a28_tight_debiased] [float] NOT NULL,

	--/ <summary>flag for "tightly wound spiral arms"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t10_arms_winding_a28_tight_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "medium wound spiral arms" response to Task 10</summary>
	--/ <quantity>meta.number</quantity>
	[t10_arms_winding_a29_medium_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "medium wound spiral arms" response to Task 10</summary>
	--/ <quantity>meta.number</quantity>
	[t10_arms_winding_a29_medium_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "medium wound spiral arms" out of all responses to Task 10</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t10_arms_winding_a29_medium_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "medium wound spiral arms" out of all responses to Task 10</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t10_arms_winding_a29_medium_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "medium wound spiral arms" out of all responses to Task 10</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t10_arms_winding_a29_medium_debiased] [float] NOT NULL,

	--/ <summary>flag for "medium wound spiral arms"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t10_arms_winding_a29_medium_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "loosely wound spiral arms" response to Task 10</summary>
	--/ <quantity>meta.number</quantity>
	[t10_arms_winding_a30_loose_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "loosely wound spiral arms" response to Task 10</summary>
	--/ <quantity>meta.number</quantity>
	[t10_arms_winding_a30_loose_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "loosely wound spiral arms" out of all responses to Task 10</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t10_arms_winding_a30_loose_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "loosely wound spiral arms" out of all responses to Task 10</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t10_arms_winding_a30_loose_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "loosely wound spiral arms" out of all responses to Task 10</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t10_arms_winding_a30_loose_debiased] [float] NOT NULL,

	--/ <summary>flag for "loosely wound spiral arms"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t10_arms_winding_a30_loose_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "1 spiral arm" response to Task 11</summary>
	--/ <quantity>meta.number</quantity>
	[t11_arms_number_a31_1_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "1 spiral arm" response to Task 11</summary>
	--/ <quantity>meta.number</quantity>
	[t11_arms_number_a31_1_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "1 spiral arm" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a31_1_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "1 spiral arm" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a31_1_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "1 spiral arm" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a31_1_debiased] [float] NOT NULL,

	--/ <summary>flag for "1 spiral arm"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t11_arms_number_a31_1_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "2 spiral arms" response to Task 11</summary>
	--/ <quantity>meta.number</quantity>
	[t11_arms_number_a32_2_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "2 spiral arms" response to Task 11</summary>
	--/ <quantity>meta.number</quantity>
	[t11_arms_number_a32_2_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "2 spiral arms" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a32_2_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "2 spiral arms" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a32_2_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "2 spiral arms" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a32_2_debiased] [float] NOT NULL,

	--/ <summary>flag for "2 spiral arms"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t11_arms_number_a32_2_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "3 spiral arms" response to Task 11</summary>
	--/ <quantity>meta.number</quantity>
	[t11_arms_number_a33_3_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "3 spiral arms" response to Task 11</summary>
	--/ <quantity>meta.number</quantity>
	[t11_arms_number_a33_3_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "3 spiral arms" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a33_3_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "3 spiral arms" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a33_3_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "3 spiral arms" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a33_3_debiased] [float] NOT NULL,

	--/ <summary>flag for "3 spiral arms"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t11_arms_number_a33_3_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "4 spiral arms" response to Task 11</summary>
	--/ <quantity>meta.number</quantity>
	[t11_arms_number_a34_4_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "4 spiral arms" response to Task 11</summary>
	--/ <quantity>meta.number</quantity>
	[t11_arms_number_a34_4_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "4 spiral arms" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a34_4_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "4 spiral arms" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a34_4_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "4 spiral arms" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a34_4_debiased] [float] NOT NULL,

	--/ <summary>flag for "4 spiral arms"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t11_arms_number_a34_4_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "more than 4 spiral arms" response to Task 11</summary>
	--/ <quantity>meta.number</quantity>
	[t11_arms_number_a36_more_than_4_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "more than 4 spiral arms" response to Task 11</summary>
	--/ <quantity>meta.number</quantity>
	[t11_arms_number_a36_more_than_4_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "more than 4 spiral arms" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a36_more_than_4_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "more than 4 spiral arms" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a36_more_than_4_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "more than 4 spiral arms" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a36_more_than_4_debiased] [float] NOT NULL,

	--/ <summary>flag for "more than 4 spiral arms"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t11_arms_number_a36_more_than_4_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "spiral arms present, but can't tell how many" response to Task 11</summary>
	--/ <quantity>meta.number</quantity>
	[t11_arms_number_a37_cant_tell_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "spiral arms present, but can't tell how many" response to Task 11</summary>
	--/ <quantity>meta.number</quantity>
	[t11_arms_number_a37_cant_tell_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "spiral arms present, but can't tell how many" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a37_cant_tell_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "spiral arms present, but can't tell how many" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a37_cant_tell_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "spiral arms present, but can't tell how many" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a37_cant_tell_debiased] [float] NOT NULL,

	--/ <summary>flag for "spiral arms present, but can't tell how many"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t11_arms_number_a37_cant_tell_flag] [int] NOT NULL,
 CONSTRAINT [pk_zoo2MainPhotoz_dr7objid] PRIMARY KEY CLUSTERED 
(
	[dr7objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[zoo2MainSpecz]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

--/ <summary> Morphological classifications of main-sample spectroscopic galaxies  from Galaxy Zoo 2. </summary>
--/ <remarks> This table includes galaxies with spectra in SDSS Data Release 7.  Several columns give data that can be used to cross-match rows with  other SDSS tables, including objIDs and positions of the galaxies.  Morphological classifications include six parameters for each category:  unweighted and weighted versions of both the total number of votes and  the vote fraction for that response, the vote fraction after being  debiased, and flags for systems identified as being in clean samples.   Note that this table and zoo2Stripe82Normal contain some of the same  galaxies (with r &lt; 17.0).   Reference:  The project and data release are described in Willett et  al. (2013, in prep). Please cite this paper if making use of any data  in this table in publications. </remarks>
CREATE TABLE [dbo].[zoo2MainSpecz](

	--/ <summary>obj ID</summary>
	--/ <quantity>meta.id</quantity>
	[specobjid] [bigint] NOT NULL,

	--/ <summary>match to the DR8 objID</summary>
	--/ <quantity>meta.id</quantity>
	[dr8objid] [bigint] NOT NULL,

	--/ <summary>match to the DR7 objID</summary>
	--/ <quantity>meta.id</quantity>
	[dr7objid] [bigint] NOT NULL,

	--/ <summary>right ascension [J2000.0], decimal degrees</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[ra] [real] NOT NULL,

	--/ <summary>declination [J2000.0], decimal degrees</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[dec] [real] NOT NULL,

	--/ <summary>right ascension [J2000.0], sexagesimal</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	[rastring] [varchar](16) NOT NULL,

	--/ <summary>declination [J2000.0], sexagesimal</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	[decstring] [varchar](16) NOT NULL,

	--/ <summary>sub-sample identification</summary>
	--/ <quantity>meta.id</quantity>
	[sample] [varchar](32) NOT NULL,

	--/ <summary>total number of classifications for this galaxy</summary>
	--/ <quantity>meta.number</quantity>
	[total_classifications] [int] NOT NULL,

	--/ <summary>total number of votes for each response, summed over all classifications</summary>
	--/ <quantity>meta.number</quantity>
	[total_votes] [int] NOT NULL,

	--/ <summary>number of votes for the "smooth" response to Task 01</summary>
	--/ <quantity>meta.number</quantity>
	[t01_smooth_or_features_a01_smooth_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "smooth" response to Task 01</summary>
	--/ <quantity>meta.number</quantity>
	[t01_smooth_or_features_a01_smooth_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "smooth" out of all responses to Task 01</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t01_smooth_or_features_a01_smooth_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "smooth" out of all responses to Task 01</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t01_smooth_or_features_a01_smooth_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "smooth" out of all responses to Task 01</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t01_smooth_or_features_a01_smooth_debiased] [float] NOT NULL,

	--/ <summary>flag for "smooth" - 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t01_smooth_or_features_a01_smooth_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "features or disk" response to Task 01</summary>
	--/ <quantity>meta.number</quantity>
	[t01_smooth_or_features_a02_features_or_disk_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "features or disk" response to Task 01</summary>
	--/ <quantity>meta.number</quantity>
	[t01_smooth_or_features_a02_features_or_disk_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "features or disk" out of all responses to Task 01</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t01_smooth_or_features_a02_features_or_disk_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "features or disk" out of all responses to Task 01</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t01_smooth_or_features_a02_features_or_disk_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "features or disk" out of all responses to Task 01</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t01_smooth_or_features_a02_features_or_disk_debiased] [float] NOT NULL,

	--/ <summary>flag for "features or disk"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t01_smooth_or_features_a02_features_or_disk_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "star or artifact" response to Task 01</summary>
	--/ <quantity>meta.number;</quantity>
	[t01_smooth_or_features_a03_star_or_artifact_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "star or artifact" response to Task 01</summary>
	--/ <quantity>meta.number;</quantity>
	[t01_smooth_or_features_a03_star_or_artifact_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "star or artifact" out of all responses to Task 01</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t01_smooth_or_features_a03_star_or_artifact_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "star or artifact" out of all responses to Task 01</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t01_smooth_or_features_a03_star_or_artifact_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "star or artifact" out of all responses to Task 01</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t01_smooth_or_features_a03_star_or_artifact_debiased] [float] NOT NULL,

	--/ <summary>flag for "star or artifact"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t01_smooth_or_features_a03_star_or_artifact_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "edge-on" response to Task 02</summary>
	--/ <quantity>meta.number</quantity>
	[t02_edgeon_a04_yes_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "edge-on" response to Task 02</summary>
	--/ <quantity>meta.number</quantity>
	[t02_edgeon_a04_yes_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "edge-on" out of all responses to Task 02</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t02_edgeon_a04_yes_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "edge-on" out of all responses to Task 02</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t02_edgeon_a04_yes_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "edge-on" out of all responses to Task 02</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t02_edgeon_a04_yes_debiased] [float] NOT NULL,

	--/ <summary>flag for "edge-on"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t02_edgeon_a04_yes_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "not edge-on" response to Task 02</summary>
	--/ <quantity>meta.number</quantity>
	[t02_edgeon_a05_no_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "not edge-on" response to Task 02</summary>
	--/ <quantity>meta.number</quantity>
	[t02_edgeon_a05_no_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "not edge-on" out of all responses to Task 02</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t02_edgeon_a05_no_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "not edge-on" out of all responses to Task 02</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t02_edgeon_a05_no_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "not edge-on" out of all responses to Task 02</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t02_edgeon_a05_no_debiased] [float] NOT NULL,

	--/ <summary>flag for "not edge-on"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>mta.code</quantity>
	[t02_edgeon_a05_no_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "bar" response to Task 03</summary>
	--/ <quantity>meta.number</quantity>
	[t03_bar_a06_bar_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "bar" response to Task 03</summary>
	--/ <quantity>meta.number</quantity>
	[t03_bar_a06_bar_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "bar" out of all responses to Task 03</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t03_bar_a06_bar_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "bar" out of all responses to Task 03</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t03_bar_a06_bar_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "bar" out of all responses to Task 03</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t03_bar_a06_bar_debiased] [float] NOT NULL,

	--/ <summary>flag for "bar"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t03_bar_a06_bar_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "no bar" response to Task 03</summary>
	--/ <quantity>meta.number</quantity>
	[t03_bar_a07_no_bar_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "no bar" response to Task 03</summary>
	--/ <quantity>meta.number</quantity>
	[t03_bar_a07_no_bar_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "no bar" out of all responses to Task 03</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t03_bar_a07_no_bar_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "no bar" out of all responses to Task 03</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t03_bar_a07_no_bar_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "no bar" out of all responses to Task 03</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t03_bar_a07_no_bar_debiased] [float] NOT NULL,

	--/ <summary>flag for "no bar"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t03_bar_a07_no_bar_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "spiral structure" response to Task 04</summary>
	--/ <quantity>meta.number</quantity>
	[t04_spiral_a08_spiral_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "spiral structure" response to Task 04</summary>
	--/ <quantity>meta.number</quantity>
	[t04_spiral_a08_spiral_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "spiral structure" out of all responses to Task 04</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t04_spiral_a08_spiral_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "spiral structure" out of all responses to Task 04</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t04_spiral_a08_spiral_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "spiral structure" out of all responses to Task 04</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t04_spiral_a08_spiral_debiased] [float] NOT NULL,

	--/ <summary>flag for "spiral structure"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t04_spiral_a08_spiral_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "no spiral structure" response to Task 04</summary>
	--/ <quantity>meta.number</quantity>
	[t04_spiral_a09_no_spiral_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "no spiral structure" response to Task 04</summary>
	--/ <quantity>meta.number</quantity>
	[t04_spiral_a09_no_spiral_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "no spiral structure" out of all responses to Task 04</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t04_spiral_a09_no_spiral_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "no spiral structure" out of all responses to Task 04</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t04_spiral_a09_no_spiral_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "no spiral structure" out of all responses to Task 04</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t04_spiral_a09_no_spiral_debiased] [float] NOT NULL,

	--/ <summary>flag for "no spiral structure"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t04_spiral_a09_no_spiral_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "no bulge" response to Task 05</summary>
	--/ <quantity>meta.number</quantity>
	[t05_bulge_prominence_a10_no_bulge_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "no bulge" response to Task 05</summary>
	--/ <quantity>meta.number</quantity>
	[t05_bulge_prominence_a10_no_bulge_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "no bulge" out of all responses to Task 05</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t05_bulge_prominence_a10_no_bulge_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "no bulge" out of all responses to Task 05</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t05_bulge_prominence_a10_no_bulge_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "no bulge" out of all responses to Task 05</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t05_bulge_prominence_a10_no_bulge_debiased] [float] NOT NULL,

	--/ <summary>flag for "no bulge"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t05_bulge_prominence_a10_no_bulge_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "just noticeable bulge" response to Task 05</summary>
	--/ <quantity>meta.number</quantity>
	[t05_bulge_prominence_a11_just_noticeable_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "just noticeable bulge" response to Task 05</summary>
	--/ <quantity>meta.number</quantity>
	[t05_bulge_prominence_a11_just_noticeable_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "just noticeable bulge" out of all responses to Task 05</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t05_bulge_prominence_a11_just_noticeable_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "just noticeable bulge" out of all responses to Task 05</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t05_bulge_prominence_a11_just_noticeable_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "just noticeable bulge" out of all responses to Task 05</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t05_bulge_prominence_a11_just_noticeable_debiased] [float] NOT NULL,

	--/ <summary>flag for "just noticeable bulge"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t05_bulge_prominence_a11_just_noticeable_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "obvious bulge" response to Task 05</summary>
	--/ <quantity>meta.number</quantity>
	[t05_bulge_prominence_a12_obvious_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "obvious bulge" response to Task 05</summary>
	--/ <quantity>meta.number</quantity>
	[t05_bulge_prominence_a12_obvious_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "obvious bulge" out of all responses to Task 05</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t05_bulge_prominence_a12_obvious_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "obvious bulge" out of all responses to Task 05</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t05_bulge_prominence_a12_obvious_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "obvious bulge" out of all responses to Task 05</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t05_bulge_prominence_a12_obvious_debiased] [float] NOT NULL,

	--/ <summary>flag for "obvious bulge"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t05_bulge_prominence_a12_obvious_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "dominant bulge" response to Task 05</summary>
	--/ <quantity>meta.number</quantity>
	[t05_bulge_prominence_a13_dominant_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "dominant bulge" response to Task 05</summary>
	--/ <quantity>meta.number</quantity>
	[t05_bulge_prominence_a13_dominant_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "dominant bulge" out of all responses to Task 05</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t05_bulge_prominence_a13_dominant_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "dominant bulge" out of all responses to Task 05</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t05_bulge_prominence_a13_dominant_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "dominant bulge" out of all responses to Task 05</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t05_bulge_prominence_a13_dominant_debiased] [float] NOT NULL,

	--/ <summary>flag for "dominant bulge"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t05_bulge_prominence_a13_dominant_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "something odd" response to Task 06</summary>
	--/ <quantity>meta.number</quantity>
	[t06_odd_a14_yes_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "something odd" response to Task 06</summary>
	--/ <quantity>meta.number</quantity>
	[t06_odd_a14_yes_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "something odd" out of all responses to Task 06</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t06_odd_a14_yes_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "something odd" out of all responses to Task 06</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t06_odd_a14_yes_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "something odd" out of all responses to Task 06</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t06_odd_a14_yes_debiased] [float] NOT NULL,

	--/ <summary>flag for "something odd"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t06_odd_a14_yes_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "nothing odd" response to Task 06</summary>
	--/ <quantity>meta.number</quantity>
	[t06_odd_a15_no_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "nothing odd" response to Task 06</summary>
	--/ <quantity>meta.number</quantity>
	[t06_odd_a15_no_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "nothing odd" out of all responses to Task 06</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t06_odd_a15_no_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "nothing odd" out of all responses to Task 06</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t06_odd_a15_no_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "nothing odd" out of all responses to Task 06</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t06_odd_a15_no_debiased] [float] NOT NULL,

	--/ <summary>flag for "nothing odd"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t06_odd_a15_no_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "smooth and completely round" response to Task 07</summary>
	--/ <quantity>meta.number</quantity>
	[t07_rounded_a16_completely_round_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "smooth and completely round" response to Task 07</summary>
	--/ <quantity>meta.number</quantity>
	[t07_rounded_a16_completely_round_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "smooth and completely round" out of all responses to Task 07</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t07_rounded_a16_completely_round_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "smooth and completely round" out of all responses to Task 07</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t07_rounded_a16_completely_round_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "smooth and completely round" out of all responses to Task 07</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t07_rounded_a16_completely_round_debiased] [float] NOT NULL,

	--/ <summary>flag for "smooth and completely round"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t07_rounded_a16_completely_round_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "smooth and in-between roundness" response to Task 07</summary>
	--/ <quantity>meta.number</quantity>
	[t07_rounded_a17_in_between_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "smooth and in-between roundness" response to Task 07</summary>
	--/ <quantity>meta.number</quantity>
	[t07_rounded_a17_in_between_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "smooth and in-between roundness" out of all responses to Task 07</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t07_rounded_a17_in_between_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "smooth and in-between roundness" out of all responses to Task 07</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t07_rounded_a17_in_between_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "smooth and in-between roundness" out of all responses to Task 07</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t07_rounded_a17_in_between_debiased] [float] NOT NULL,

	--/ <summary>flag for "smooth and in-between roundness"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t07_rounded_a17_in_between_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "smooth and cigar-shaped" response to Task 07</summary>
	--/ <quantity>meta.number</quantity>
	[t07_rounded_a18_cigar_shaped_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "smooth and cigar-shaped" response to Task 07</summary>
	--/ <quantity>meta.number</quantity>
	[t07_rounded_a18_cigar_shaped_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "smooth and cigar-shaped" out of all responses to Task 07</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t07_rounded_a18_cigar_shaped_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "smooth and cigar-shaped" out of all responses to Task 07</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t07_rounded_a18_cigar_shaped_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "smooth and cigar-shaped" out of all responses to Task 07</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t07_rounded_a18_cigar_shaped_debiased] [float] NOT NULL,

	--/ <summary>flag for "smooth and cigar-shaped"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t07_rounded_a18_cigar_shaped_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "odd feature is a ring" response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a19_ring_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "odd feature is a ring" response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a19_ring_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "odd feature is a ring" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a19_ring_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "odd feature is a ring" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a19_ring_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "odd feature is a ring" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a19_ring_debiased] [float] NOT NULL,

	--/ <summary>flag for "odd feature is a ring"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t08_odd_feature_a19_ring_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "odd feature is a lens or arc" response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a20_lens_or_arc_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "odd feature is a lens or arc" response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a20_lens_or_arc_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "odd feature is a lens or arc" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a20_lens_or_arc_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "odd feature is a lens or arc" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a20_lens_or_arc_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "odd feature is a lens or arc" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a20_lens_or_arc_debiased] [float] NOT NULL,

	--/ <summary>flag for "odd feature is a lens or arc"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t08_odd_feature_a20_lens_or_arc_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "odd feature is a disturbed" galaxy response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a21_disturbed_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "odd feature is a disturbed galaxy response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a21_disturbed_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "odd feature is a disturbed" galaxy out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a21_disturbed_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "odd feature is a disturbed galaxy out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a21_disturbed_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "odd feature is a disturbed" galaxy out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a21_disturbed_debiased] [float] NOT NULL,

	--/ <summary>flag for "odd feature is a disturbed galaxy"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t08_odd_feature_a21_disturbed_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "odd feature is an irregular" galaxy response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a22_irregular_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "odd feature is an irregular galaxy response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a22_irregular_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "odd feature is an irregular" galaxy out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a22_irregular_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "odd feature is an irregular galaxy out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a22_irregular_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "odd feature is an irregular" galaxy out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a22_irregular_debiased] [float] NOT NULL,

	--/ <summary>flag for "odd feature is an irregular galaxy"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t08_odd_feature_a22_irregular_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "odd feature is something else" response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a23_other_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "odd feature is something else" response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a23_other_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "odd feature is something else" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a23_other_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "odd feature is something else" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a23_other_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "odd feature is something else" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a23_other_debiased] [float] NOT NULL,

	--/ <summary>flag for "odd feature is something else"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t08_odd_feature_a23_other_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "odd feature is a merger" response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a24_merger_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "odd feature is a merger" response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a24_merger_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "odd feature is a merger" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a24_merger_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "odd feature is a merger" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a24_merger_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "odd feature is a merger" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a24_merger_debiased] [float] NOT NULL,

	--/ <summary>flag for "odd feature is a merger"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t08_odd_feature_a24_merger_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "odd feature is a dust lane" response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a38_dust_lane_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "odd feature is a dust lane" response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a38_dust_lane_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "odd feature is a dust lane" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a38_dust_lane_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "odd feature is a dust lane" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a38_dust_lane_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "odd feature is a dust lane" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a38_dust_lane_debiased] [float] NOT NULL,

	--/ <summary>flag for "odd feature is a dust lane"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t08_odd_feature_a38_dust_lane_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "edge-on bulge is rounded" response to Task 09</summary>
	--/ <quantity>meta.number</quantity>
	[t09_bulge_shape_a25_rounded_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "edge-on bulge is rounded" response to Task 09</summary>
	--/ <quantity>meta.number</quantity>
	[t09_bulge_shape_a25_rounded_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "edge-on bulge is rounded" out of all responses to Task 09</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t09_bulge_shape_a25_rounded_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "edge-on bulge is rounded" out of all responses to Task 09</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t09_bulge_shape_a25_rounded_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "edge-on bulge is rounded" out of all responses to Task 09</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t09_bulge_shape_a25_rounded_debiased] [float] NOT NULL,

	--/ <summary>flag for "edge-on bulge is rounded"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t09_bulge_shape_a25_rounded_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "edge-on bulge is boxy" response to Task 09</summary>
	--/ <quantity>meta.number</quantity>
	[t09_bulge_shape_a26_boxy_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "edge-on bulge is boxy" response to Task 09</summary>
	--/ <quantity>meta.number</quantity>
	[t09_bulge_shape_a26_boxy_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "edge-on bulge is boxy" out of all responses to Task 09</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t09_bulge_shape_a26_boxy_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "edge-on bulge is boxy" out of all responses to Task 09</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t09_bulge_shape_a26_boxy_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "edge-on bulge is boxy" out of all responses to Task 09</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t09_bulge_shape_a26_boxy_debiased] [float] NOT NULL,

	--/ <summary>flag for "edge-on bulge is boxy"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t09_bulge_shape_a26_boxy_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "no edge-on bulge" response to Task 09</summary>
	--/ <quantity>meta.number</quantity>
	[t09_bulge_shape_a27_no_bulge_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "no edge-on bulge" response to Task 09</summary>
	--/ <quantity>meta.number</quantity>
	[t09_bulge_shape_a27_no_bulge_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "no edge-on bulge" out of all responses to Task 09</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t09_bulge_shape_a27_no_bulge_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "no edge-on bulge" out of all responses to Task 09</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t09_bulge_shape_a27_no_bulge_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "no edge-on bulge" out of all responses to Task 09</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t09_bulge_shape_a27_no_bulge_debiased] [float] NOT NULL,

	--/ <summary>flag for "no edge-on bulge"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t09_bulge_shape_a27_no_bulge_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "tightly wound spiral arms" response to Task 10</summary>
	--/ <quantity>meta.number</quantity>
	[t10_arms_winding_a28_tight_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "tightly wound spiral arms" response to Task 10</summary>
	--/ <quantity>meta.number</quantity>
	[t10_arms_winding_a28_tight_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "tightly wound spiral arms" out of all responses to Task 10</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t10_arms_winding_a28_tight_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "tightly wound spiral arms" out of all responses to Task 10</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t10_arms_winding_a28_tight_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "tightly wound spiral arms" out of all responses to Task 10</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t10_arms_winding_a28_tight_debiased] [float] NOT NULL,

	--/ <summary>flag for "tightly wound spiral arms"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t10_arms_winding_a28_tight_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "medium wound spiral arms" response to Task 10</summary>
	--/ <quantity>meta.number</quantity>
	[t10_arms_winding_a29_medium_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "medium wound spiral arms" response to Task 10</summary>
	--/ <quantity>meta.number</quantity>
	[t10_arms_winding_a29_medium_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "medium wound spiral arms" out of all responses to Task 10</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t10_arms_winding_a29_medium_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "medium wound spiral arms" out of all responses to Task 10</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t10_arms_winding_a29_medium_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "medium wound spiral arms" out of all responses to Task 10</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t10_arms_winding_a29_medium_debiased] [float] NOT NULL,

	--/ <summary>flag for "medium wound spiral arms"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t10_arms_winding_a29_medium_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "loosely wound spiral arms" response to Task 10</summary>
	--/ <quantity>meta.number</quantity>
	[t10_arms_winding_a30_loose_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "loosely wound spiral arms" response to Task 10</summary>
	--/ <quantity>meta.number</quantity>
	[t10_arms_winding_a30_loose_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "loosely wound spiral arms" out of all responses to Task 10</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t10_arms_winding_a30_loose_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "loosely wound spiral arms" out of all responses to Task 10</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t10_arms_winding_a30_loose_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "loosely wound spiral arms" out of all responses to Task 10</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t10_arms_winding_a30_loose_debiased] [float] NOT NULL,

	--/ <summary>flag for "loosely wound spiral arms"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t10_arms_winding_a30_loose_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "1 spiral arm" response to Task 11</summary>
	--/ <quantity>meta.number</quantity>
	[t11_arms_number_a31_1_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "1 spiral arm" response to Task 11</summary>
	--/ <quantity>meta.number</quantity>
	[t11_arms_number_a31_1_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "1 spiral arm" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a31_1_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "1 spiral arm" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a31_1_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "1 spiral arm" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a31_1_debiased] [float] NOT NULL,

	--/ <summary>flag for "1 spiral arm"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t11_arms_number_a31_1_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "2 spiral arms" response to Task 11</summary>
	--/ <quantity>meta.number</quantity>
	[t11_arms_number_a32_2_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "2 spiral arms" response to Task 11</summary>
	--/ <quantity>meta.number</quantity>
	[t11_arms_number_a32_2_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "2 spiral arms" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a32_2_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "2 spiral arms" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a32_2_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "2 spiral arms" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a32_2_debiased] [float] NOT NULL,

	--/ <summary>flag for "2 spiral arms"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t11_arms_number_a32_2_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "3 spiral arms" response to Task 11</summary>
	--/ <quantity>meta.number</quantity>
	[t11_arms_number_a33_3_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "3 spiral arms" response to Task 11</summary>
	--/ <quantity>meta.number</quantity>
	[t11_arms_number_a33_3_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "3 spiral arms" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a33_3_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "3 spiral arms" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a33_3_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "3 spiral arms" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a33_3_debiased] [float] NOT NULL,

	--/ <summary>flag for "3 spiral arms"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t11_arms_number_a33_3_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "4 spiral arms" response to Task 11</summary>
	--/ <quantity>meta.number</quantity>
	[t11_arms_number_a34_4_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "4 spiral arms" response to Task 11</summary>
	--/ <quantity>meta.number</quantity>
	[t11_arms_number_a34_4_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "4 spiral arms" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a34_4_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "4 spiral arms" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a34_4_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "4 spiral arms" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a34_4_debiased] [float] NOT NULL,

	--/ <summary>flag for "4 spiral arms"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t11_arms_number_a34_4_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "more than 4 spiral arms" response to Task 11</summary>
	--/ <quantity>meta.number</quantity>
	[t11_arms_number_a36_more_than_4_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "more than 4 spiral arms" response to Task 11</summary>
	--/ <quantity>meta.number</quantity>
	[t11_arms_number_a36_more_than_4_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "more than 4 spiral arms" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a36_more_than_4_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "more than 4 spiral arms" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a36_more_than_4_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "more than 4 spiral arms" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a36_more_than_4_debiased] [float] NOT NULL,

	--/ <summary>flag for "more than 4 spiral arms"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t11_arms_number_a36_more_than_4_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "spiral arms present, but can't tell how many" response to Task 11</summary>
	--/ <quantity>meta.number</quantity>
	[t11_arms_number_a37_cant_tell_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "spiral arms present, but can't tell how many" response to Task 11</summary>
	--/ <quantity>meta.number</quantity>
	[t11_arms_number_a37_cant_tell_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "spiral arms present, but can't tell how many" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a37_cant_tell_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "spiral arms present, but can't tell how many" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a37_cant_tell_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "spiral arms present, but can't tell how many" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a37_cant_tell_debiased] [float] NOT NULL,

	--/ <summary>flag for "spiral arms present, but can't tell how many"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t11_arms_number_a37_cant_tell_flag] [int] NOT NULL,
 CONSTRAINT [pk_zoo2MainSpecz_dr7objid] PRIMARY KEY CLUSTERED 
(
	[dr7objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[zoo2Stripe82Coadd1]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

--/ <summary> Morphological classifications of Stripe 82, coadded (sample  1) spectroscopic galaxies from Galaxy Zoo 2 </summary>
--/ <remarks> This table includes classifications from coadded images of Stripe 82  galaxies in SDSS Data Release 7. The co-addition method is described in  Willett et al.; it differs from the second sample in that these images  did NOT desaturate color in their noisy background pixels. Several  columns give data that can be used to cross-match rows with other SDSS  tables, including objIDs and positions of the galaxies. Morphological  classifications include six parameters for each category: unweighted and  weighted versions of both the total number of votes and the vote fraction  for that response, the vote fraction after being debiased, and flags for  systems identified as being in clean samples.   Reference:  The project and data release are described in Willett et al.  (2013, in prep). Please cite this paper if making use of any data in this  table in publications. </remarks>
CREATE TABLE [dbo].[zoo2Stripe82Coadd1](

	--/ <summary>obj ID</summary>
	--/ <quantity>meta.id</quantity>
	[specobjid] [bigint] NOT NULL,

	--/ <summary>objID of the galaxy in the Stripe82 context of CasJobs</summary>
	--/ <quantity>meta.id</quantity>
	[stripe82objid] [bigint] NOT NULL,

	--/ <summary>match to the DR8 objID for the corresponding normal-depth image</summary>
	--/ <quantity></quantity>
	[dr8objid] [bigint] NOT NULL,

	--/ <summary>match to the DR7 objID</summary>
	--/ <quantity>meta.id</quantity>
	[dr7objid] [bigint] NOT NULL,

	--/ <summary>right ascension [J2000.0], decimal degrees</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[ra] [real] NOT NULL,

	--/ <summary>declination [J2000.0], decimal degrees</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[dec] [real] NOT NULL,

	--/ <summary>right ascension [J2000.0], sexagesimal</summary>
	--/ <quantity></quantity>
	[rastring] [varchar](11) NOT NULL,
	
	--/ <summary>declination [J2000.0], sexagesimal</summary>
	--/ <quantity></quantity>
	[decstring] [varchar](11) NOT NULL,

	--/ <summary>sub-sample identification</summary>
	--/ <quantity>meta.id</quantity>
	[sample] [varchar](32) NOT NULL,

	--/ <summary>total number of classifications for this galaxy</summary>
	--/ <quantity>meta.number</quantity>
	[total_classifications] [int] NOT NULL,

	--/ <summary>total number of votes for each response, summed over all classifications</summary>
	--/ <quantity>meta.number</quantity>
	[total_votes] [int] NOT NULL,

	--/ <summary>number of votes for the "smooth" response to Task 01</summary>
	--/ <quantity>meta.number</quantity>
	[t01_smooth_or_features_a01_smooth_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "smooth" response to Task 01</summary>
	--/ <quantity>meta.number</quantity>
	[t01_smooth_or_features_a01_smooth_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "smooth" out of all responses to Task 01</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t01_smooth_or_features_a01_smooth_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "smooth" out of all responses to Task 01</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t01_smooth_or_features_a01_smooth_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "smooth" out of all responses to Task 01</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t01_smooth_or_features_a01_smooth_debiased] [float] NOT NULL,

	--/ <summary>flag for "smooth" - 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t01_smooth_or_features_a01_smooth_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "features or disk" response to Task 01</summary>
	--/ <quantity>meta.number</quantity>
	[t01_smooth_or_features_a02_features_or_disk_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "features or disk" response to Task 01</summary>
	--/ <quantity>meta.number</quantity>
	[t01_smooth_or_features_a02_features_or_disk_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "features or disk" out of all responses to Task 01</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t01_smooth_or_features_a02_features_or_disk_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "features or disk" out of all responses to Task 01</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t01_smooth_or_features_a02_features_or_disk_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "features or disk" out of all responses to Task 01</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t01_smooth_or_features_a02_features_or_disk_debiased] [float] NOT NULL,

	--/ <summary>flag for "features or disk"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t01_smooth_or_features_a02_features_or_disk_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "star or artifact" response to Task 01</summary>
	--/ <quantity>meta.number;</quantity>
	[t01_smooth_or_features_a03_star_or_artifact_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "star or artifact" response to Task 01</summary>
	--/ <quantity>meta.number;</quantity>
	[t01_smooth_or_features_a03_star_or_artifact_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "star or artifact" out of all responses to Task 01</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t01_smooth_or_features_a03_star_or_artifact_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "star or artifact" out of all responses to Task 01</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t01_smooth_or_features_a03_star_or_artifact_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "star or artifact" out of all responses to Task 01</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t01_smooth_or_features_a03_star_or_artifact_debiased] [float] NOT NULL,

	--/ <summary>flag for "star or artifact"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t01_smooth_or_features_a03_star_or_artifact_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "edge-on" response to Task 02</summary>
	--/ <quantity>meta.number</quantity>
	[t02_edgeon_a04_yes_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "edge-on" response to Task 02</summary>
	--/ <quantity>meta.number</quantity>
	[t02_edgeon_a04_yes_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "edge-on" out of all responses to Task 02</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t02_edgeon_a04_yes_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "edge-on" out of all responses to Task 02</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t02_edgeon_a04_yes_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "edge-on" out of all responses to Task 02</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t02_edgeon_a04_yes_debiased] [float] NOT NULL,

	--/ <summary>flag for "edge-on"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t02_edgeon_a04_yes_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "not edge-on" response to Task 02</summary>
	--/ <quantity>meta.number</quantity>
	[t02_edgeon_a05_no_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "not edge-on" response to Task 02</summary>
	--/ <quantity>meta.number</quantity>
	[t02_edgeon_a05_no_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "not edge-on" out of all responses to Task 02</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t02_edgeon_a05_no_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "not edge-on" out of all responses to Task 02</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t02_edgeon_a05_no_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "not edge-on" out of all responses to Task 02</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t02_edgeon_a05_no_debiased] [float] NOT NULL,

	--/ <summary>flag for "not edge-on"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>mta.code</quantity>
	[t02_edgeon_a05_no_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "bar" response to Task 03</summary>
	--/ <quantity>meta.number</quantity>
	[t03_bar_a06_bar_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "bar" response to Task 03</summary>
	--/ <quantity>meta.number</quantity>
	[t03_bar_a06_bar_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "bar" out of all responses to Task 03</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t03_bar_a06_bar_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "bar" out of all responses to Task 03</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t03_bar_a06_bar_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "bar" out of all responses to Task 03</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t03_bar_a06_bar_debiased] [float] NOT NULL,

	--/ <summary>flag for "bar"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t03_bar_a06_bar_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "no bar" response to Task 03</summary>
	--/ <quantity>meta.number</quantity>
	[t03_bar_a07_no_bar_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "no bar" response to Task 03</summary>
	--/ <quantity>meta.number</quantity>
	[t03_bar_a07_no_bar_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "no bar" out of all responses to Task 03</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t03_bar_a07_no_bar_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "no bar" out of all responses to Task 03</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t03_bar_a07_no_bar_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "no bar" out of all responses to Task 03</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t03_bar_a07_no_bar_debiased] [float] NOT NULL,

	--/ <summary>flag for "no bar"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t03_bar_a07_no_bar_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "spiral structure" response to Task 04</summary>
	--/ <quantity>meta.number</quantity>
	[t04_spiral_a08_spiral_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "spiral structure" response to Task 04</summary>
	--/ <quantity>meta.number</quantity>
	[t04_spiral_a08_spiral_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "spiral structure" out of all responses to Task 04</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t04_spiral_a08_spiral_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "spiral structure" out of all responses to Task 04</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t04_spiral_a08_spiral_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "spiral structure" out of all responses to Task 04</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t04_spiral_a08_spiral_debiased] [float] NOT NULL,

	--/ <summary>flag for "spiral structure"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t04_spiral_a08_spiral_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "no spiral structure" response to Task 04</summary>
	--/ <quantity>meta.number</quantity>
	[t04_spiral_a09_no_spiral_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "no spiral structure" response to Task 04</summary>
	--/ <quantity>meta.number</quantity>
	[t04_spiral_a09_no_spiral_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "no spiral structure" out of all responses to Task 04</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t04_spiral_a09_no_spiral_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "no spiral structure" out of all responses to Task 04</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t04_spiral_a09_no_spiral_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "no spiral structure" out of all responses to Task 04</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t04_spiral_a09_no_spiral_debiased] [float] NOT NULL,

	--/ <summary>flag for "no spiral structure"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t04_spiral_a09_no_spiral_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "no bulge" response to Task 05</summary>
	--/ <quantity>meta.number</quantity>
	[t05_bulge_prominence_a10_no_bulge_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "no bulge" response to Task 05</summary>
	--/ <quantity>meta.number</quantity>
	[t05_bulge_prominence_a10_no_bulge_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "no bulge" out of all responses to Task 05</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t05_bulge_prominence_a10_no_bulge_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "no bulge" out of all responses to Task 05</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t05_bulge_prominence_a10_no_bulge_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "no bulge" out of all responses to Task 05</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t05_bulge_prominence_a10_no_bulge_debiased] [float] NOT NULL,

	--/ <summary>flag for "no bulge"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t05_bulge_prominence_a10_no_bulge_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "just noticeable bulge" response to Task 05</summary>
	--/ <quantity>meta.number</quantity>
	[t05_bulge_prominence_a11_just_noticeable_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "just noticeable bulge" response to Task 05</summary>
	--/ <quantity>meta.number</quantity>
	[t05_bulge_prominence_a11_just_noticeable_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "just noticeable bulge" out of all responses to Task 05</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t05_bulge_prominence_a11_just_noticeable_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "just noticeable bulge" out of all responses to Task 05</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t05_bulge_prominence_a11_just_noticeable_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "just noticeable bulge" out of all responses to Task 05</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t05_bulge_prominence_a11_just_noticeable_debiased] [float] NOT NULL,

	--/ <summary>flag for "just noticeable bulge"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t05_bulge_prominence_a11_just_noticeable_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "obvious bulge" response to Task 05</summary>
	--/ <quantity>meta.number</quantity>
	[t05_bulge_prominence_a12_obvious_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "obvious bulge" response to Task 05</summary>
	--/ <quantity>meta.number</quantity>
	[t05_bulge_prominence_a12_obvious_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "obvious bulge" out of all responses to Task 05</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t05_bulge_prominence_a12_obvious_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "obvious bulge" out of all responses to Task 05</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t05_bulge_prominence_a12_obvious_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "obvious bulge" out of all responses to Task 05</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t05_bulge_prominence_a12_obvious_debiased] [float] NOT NULL,

	--/ <summary>flag for "obvious bulge"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t05_bulge_prominence_a12_obvious_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "dominant bulge" response to Task 05</summary>
	--/ <quantity>meta.number</quantity>
	[t05_bulge_prominence_a13_dominant_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "dominant bulge" response to Task 05</summary>
	--/ <quantity>meta.number</quantity>
	[t05_bulge_prominence_a13_dominant_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "dominant bulge" out of all responses to Task 05</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t05_bulge_prominence_a13_dominant_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "dominant bulge" out of all responses to Task 05</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t05_bulge_prominence_a13_dominant_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "dominant bulge" out of all responses to Task 05</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t05_bulge_prominence_a13_dominant_debiased] [float] NOT NULL,

	--/ <summary>flag for "dominant bulge"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t05_bulge_prominence_a13_dominant_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "something odd" response to Task 06</summary>
	--/ <quantity>meta.number</quantity>
	[t06_odd_a14_yes_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "something odd" response to Task 06</summary>
	--/ <quantity>meta.number</quantity>
	[t06_odd_a14_yes_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "something odd" out of all responses to Task 06</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t06_odd_a14_yes_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "something odd" out of all responses to Task 06</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t06_odd_a14_yes_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "something odd" out of all responses to Task 06</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t06_odd_a14_yes_debiased] [float] NOT NULL,

	--/ <summary>flag for "something odd"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t06_odd_a14_yes_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "nothing odd" response to Task 06</summary>
	--/ <quantity>meta.number</quantity>
	[t06_odd_a15_no_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "nothing odd" response to Task 06</summary>
	--/ <quantity>meta.number</quantity>
	[t06_odd_a15_no_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "nothing odd" out of all responses to Task 06</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t06_odd_a15_no_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "nothing odd" out of all responses to Task 06</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t06_odd_a15_no_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "nothing odd" out of all responses to Task 06</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t06_odd_a15_no_debiased] [float] NOT NULL,

	--/ <summary>flag for "nothing odd"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t06_odd_a15_no_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "smooth and completely round" response to Task 07</summary>
	--/ <quantity>meta.number</quantity>
	[t07_rounded_a16_completely_round_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "smooth and completely round" response to Task 07</summary>
	--/ <quantity>meta.number</quantity>
	[t07_rounded_a16_completely_round_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "smooth and completely round" out of all responses to Task 07</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t07_rounded_a16_completely_round_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "smooth and completely round" out of all responses to Task 07</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t07_rounded_a16_completely_round_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "smooth and completely round" out of all responses to Task 07</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t07_rounded_a16_completely_round_debiased] [float] NOT NULL,

	--/ <summary>flag for "smooth and completely round"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t07_rounded_a16_completely_round_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "smooth and in-between roundness" response to Task 07</summary>
	--/ <quantity>meta.number</quantity>
	[t07_rounded_a17_in_between_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "smooth and in-between roundness" response to Task 07</summary>
	--/ <quantity>meta.number</quantity>
	[t07_rounded_a17_in_between_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "smooth and in-between roundness" out of all responses to Task 07</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t07_rounded_a17_in_between_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "smooth and in-between roundness" out of all responses to Task 07</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t07_rounded_a17_in_between_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "smooth and in-between roundness" out of all responses to Task 07</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t07_rounded_a17_in_between_debiased] [float] NOT NULL,

	--/ <summary>flag for "smooth and in-between roundness"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t07_rounded_a17_in_between_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "smooth and cigar-shaped" response to Task 07</summary>
	--/ <quantity>meta.number</quantity>
	[t07_rounded_a18_cigar_shaped_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "smooth and cigar-shaped" response to Task 07</summary>
	--/ <quantity>meta.number</quantity>
	[t07_rounded_a18_cigar_shaped_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "smooth and cigar-shaped" out of all responses to Task 07</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t07_rounded_a18_cigar_shaped_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "smooth and cigar-shaped" out of all responses to Task 07</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t07_rounded_a18_cigar_shaped_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "smooth and cigar-shaped" out of all responses to Task 07</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t07_rounded_a18_cigar_shaped_debiased] [float] NOT NULL,

	--/ <summary>flag for "smooth and cigar-shaped"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t07_rounded_a18_cigar_shaped_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "odd feature is a ring" response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a19_ring_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "odd feature is a ring" response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a19_ring_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "odd feature is a ring" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a19_ring_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "odd feature is a ring" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a19_ring_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "odd feature is a ring" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a19_ring_debiased] [float] NOT NULL,

	--/ <summary>flag for "odd feature is a ring"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t08_odd_feature_a19_ring_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "odd feature is a lens or arc" response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a20_lens_or_arc_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "odd feature is a lens or arc" response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a20_lens_or_arc_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "odd feature is a lens or arc" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a20_lens_or_arc_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "odd feature is a lens or arc" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a20_lens_or_arc_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "odd feature is a lens or arc" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a20_lens_or_arc_debiased] [float] NOT NULL,

	--/ <summary>flag for "odd feature is a lens or arc"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t08_odd_feature_a20_lens_or_arc_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "odd feature is a disturbed" galaxy response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a21_disturbed_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "odd feature is a disturbed galaxy response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a21_disturbed_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "odd feature is a disturbed" galaxy out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a21_disturbed_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "odd feature is a disturbed galaxy out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a21_disturbed_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "odd feature is a disturbed" galaxy out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a21_disturbed_debiased] [float] NOT NULL,

	--/ <summary>flag for "odd feature is a disturbed galaxy"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t08_odd_feature_a21_disturbed_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "odd feature is an irregular" galaxy response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a22_irregular_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "odd feature is an irregular galaxy response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a22_irregular_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "odd feature is an irregular" galaxy out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a22_irregular_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "odd feature is an irregular galaxy out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a22_irregular_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "odd feature is an irregular" galaxy out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a22_irregular_debiased] [float] NOT NULL,

	--/ <summary>flag for "odd feature is an irregular galaxy"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t08_odd_feature_a22_irregular_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "odd feature is something else" response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a23_other_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "odd feature is something else" response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a23_other_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "odd feature is something else" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a23_other_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "odd feature is something else" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a23_other_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "odd feature is something else" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a23_other_debiased] [float] NOT NULL,

	--/ <summary>flag for "odd feature is something else"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t08_odd_feature_a23_other_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "odd feature is a merger" response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a24_merger_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "odd feature is a merger" response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a24_merger_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "odd feature is a merger" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a24_merger_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "odd feature is a merger" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a24_merger_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "odd feature is a merger" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a24_merger_debiased] [float] NOT NULL,

	--/ <summary>flag for "odd feature is a merger"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t08_odd_feature_a24_merger_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "odd feature is a dust lane" response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a38_dust_lane_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "odd feature is a dust lane" response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a38_dust_lane_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "odd feature is a dust lane" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a38_dust_lane_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "odd feature is a dust lane" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a38_dust_lane_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "odd feature is a dust lane" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a38_dust_lane_debiased] [float] NOT NULL,

	--/ <summary>flag for "odd feature is a dust lane"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t08_odd_feature_a38_dust_lane_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "edge-on bulge is rounded" response to Task 09</summary>
	--/ <quantity>meta.number</quantity>
	[t09_bulge_shape_a25_rounded_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "edge-on bulge is rounded" response to Task 09</summary>
	--/ <quantity>meta.number</quantity>
	[t09_bulge_shape_a25_rounded_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "edge-on bulge is rounded" out of all responses to Task 09</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t09_bulge_shape_a25_rounded_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "edge-on bulge is rounded" out of all responses to Task 09</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t09_bulge_shape_a25_rounded_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "edge-on bulge is rounded" out of all responses to Task 09</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t09_bulge_shape_a25_rounded_debiased] [float] NOT NULL,

	--/ <summary>flag for "edge-on bulge is rounded"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t09_bulge_shape_a25_rounded_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "edge-on bulge is boxy" response to Task 09</summary>
	--/ <quantity>meta.number</quantity>
	[t09_bulge_shape_a26_boxy_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "edge-on bulge is boxy" response to Task 09</summary>
	--/ <quantity>meta.number</quantity>
	[t09_bulge_shape_a26_boxy_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "edge-on bulge is boxy" out of all responses to Task 09</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t09_bulge_shape_a26_boxy_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "edge-on bulge is boxy" out of all responses to Task 09</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t09_bulge_shape_a26_boxy_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "edge-on bulge is boxy" out of all responses to Task 09</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t09_bulge_shape_a26_boxy_debiased] [float] NOT NULL,

	--/ <summary>flag for "edge-on bulge is boxy"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t09_bulge_shape_a26_boxy_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "no edge-on bulge" response to Task 09</summary>
	--/ <quantity>meta.number</quantity>
	[t09_bulge_shape_a27_no_bulge_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "no edge-on bulge" response to Task 09</summary>
	--/ <quantity>meta.number</quantity>
	[t09_bulge_shape_a27_no_bulge_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "no edge-on bulge" out of all responses to Task 09</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t09_bulge_shape_a27_no_bulge_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "no edge-on bulge" out of all responses to Task 09</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t09_bulge_shape_a27_no_bulge_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "no edge-on bulge" out of all responses to Task 09</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t09_bulge_shape_a27_no_bulge_debiased] [float] NOT NULL,

	--/ <summary>flag for "no edge-on bulge"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t09_bulge_shape_a27_no_bulge_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "tightly wound spiral arms" response to Task 10</summary>
	--/ <quantity>meta.number</quantity>
	[t10_arms_winding_a28_tight_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "tightly wound spiral arms" response to Task 10</summary>
	--/ <quantity>meta.number</quantity>
	[t10_arms_winding_a28_tight_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "tightly wound spiral arms" out of all responses to Task 10</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t10_arms_winding_a28_tight_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "tightly wound spiral arms" out of all responses to Task 10</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t10_arms_winding_a28_tight_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "tightly wound spiral arms" out of all responses to Task 10</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t10_arms_winding_a28_tight_debiased] [float] NOT NULL,

	--/ <summary>flag for "tightly wound spiral arms"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t10_arms_winding_a28_tight_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "medium wound spiral arms" response to Task 10</summary>
	--/ <quantity>meta.number</quantity>
	[t10_arms_winding_a29_medium_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "medium wound spiral arms" response to Task 10</summary>
	--/ <quantity>meta.number</quantity>
	[t10_arms_winding_a29_medium_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "medium wound spiral arms" out of all responses to Task 10</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t10_arms_winding_a29_medium_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "medium wound spiral arms" out of all responses to Task 10</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t10_arms_winding_a29_medium_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "medium wound spiral arms" out of all responses to Task 10</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t10_arms_winding_a29_medium_debiased] [float] NOT NULL,

	--/ <summary>flag for "medium wound spiral arms"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t10_arms_winding_a29_medium_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "loosely wound spiral arms" response to Task 10</summary>
	--/ <quantity>meta.number</quantity>
	[t10_arms_winding_a30_loose_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "loosely wound spiral arms" response to Task 10</summary>
	--/ <quantity>meta.number</quantity>
	[t10_arms_winding_a30_loose_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "loosely wound spiral arms" out of all responses to Task 10</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t10_arms_winding_a30_loose_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "loosely wound spiral arms" out of all responses to Task 10</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t10_arms_winding_a30_loose_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "loosely wound spiral arms" out of all responses to Task 10</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t10_arms_winding_a30_loose_debiased] [float] NOT NULL,

	--/ <summary>flag for "loosely wound spiral arms"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t10_arms_winding_a30_loose_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "1 spiral arm" response to Task 11</summary>
	--/ <quantity>meta.number</quantity>
	[t11_arms_number_a31_1_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "1 spiral arm" response to Task 11</summary>
	--/ <quantity>meta.number</quantity>
	[t11_arms_number_a31_1_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "1 spiral arm" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a31_1_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "1 spiral arm" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a31_1_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "1 spiral arm" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a31_1_debiased] [float] NOT NULL,

	--/ <summary>flag for "1 spiral arm"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t11_arms_number_a31_1_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "2 spiral arms" response to Task 11</summary>
	--/ <quantity>meta.number</quantity>
	[t11_arms_number_a32_2_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "2 spiral arms" response to Task 11</summary>
	--/ <quantity>meta.number</quantity>
	[t11_arms_number_a32_2_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "2 spiral arms" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a32_2_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "2 spiral arms" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a32_2_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "2 spiral arms" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a32_2_debiased] [float] NOT NULL,

	--/ <summary>flag for "2 spiral arms"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t11_arms_number_a32_2_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "3 spiral arms" response to Task 11</summary>
	--/ <quantity>meta.number</quantity>
	[t11_arms_number_a33_3_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "3 spiral arms" response to Task 11</summary>
	--/ <quantity>meta.number</quantity>
	[t11_arms_number_a33_3_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "3 spiral arms" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a33_3_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "3 spiral arms" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a33_3_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "3 spiral arms" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a33_3_debiased] [float] NOT NULL,

	--/ <summary>flag for "3 spiral arms"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t11_arms_number_a33_3_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "4 spiral arms" response to Task 11</summary>
	--/ <quantity>meta.number</quantity>
	[t11_arms_number_a34_4_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "4 spiral arms" response to Task 11</summary>
	--/ <quantity>meta.number</quantity>
	[t11_arms_number_a34_4_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "4 spiral arms" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a34_4_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "4 spiral arms" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a34_4_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "4 spiral arms" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a34_4_debiased] [float] NOT NULL,

	--/ <summary>flag for "4 spiral arms"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t11_arms_number_a34_4_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "more than 4 spiral arms" response to Task 11</summary>
	--/ <quantity>meta.number</quantity>
	[t11_arms_number_a36_more_than_4_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "more than 4 spiral arms" response to Task 11</summary>
	--/ <quantity>meta.number</quantity>
	[t11_arms_number_a36_more_than_4_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "more than 4 spiral arms" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a36_more_than_4_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "more than 4 spiral arms" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a36_more_than_4_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "more than 4 spiral arms" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a36_more_than_4_debiased] [float] NOT NULL,

	--/ <summary>flag for "more than 4 spiral arms"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t11_arms_number_a36_more_than_4_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "spiral arms present, but can't tell how many" response to Task 11</summary>
	--/ <quantity>meta.number</quantity>
	[t11_arms_number_a37_cant_tell_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "spiral arms present, but can't tell how many" response to Task 11</summary>
	--/ <quantity>meta.number</quantity>
	[t11_arms_number_a37_cant_tell_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "spiral arms present, but can't tell how many" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a37_cant_tell_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "spiral arms present, but can't tell how many" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a37_cant_tell_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "spiral arms present, but can't tell how many" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a37_cant_tell_debiased] [float] NOT NULL,

	--/ <summary>flag for "spiral arms present, but can't tell how many"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t11_arms_number_a37_cant_tell_flag] [int] NOT NULL,
 CONSTRAINT [pk_zoo2Stripe82Coadd1_stripe82ob] PRIMARY KEY CLUSTERED 
(
	[stripe82objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[zoo2Stripe82Coadd2]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

--/ <summary> Morphological classifications of Stripe 82, coadded (sample 2)  spectroscopic galaxies from Galaxy Zoo 2 </summary>
--/ <remarks> This table includes classifications from coadded images of Stripe 82  galaxies in SDSS Data Release 7. Sky background pixels for these co-added  images were desaturated to attempt and avoid bias by classifiers, as  described in Willett et al. Several columns give data that can be used to  cross-match rows with other SDSS tables, including objIDs and positions  of the galaxies. Morphological classifications include six parameters for  each category: unweighted and weighted versions of both the total number  of votes and the vote fraction for that response, the vote fraction after  being debiased, and flags for systems identified as being in clean samples.   Reference:	The project and data release are described in Willett et al.  (2013, in prep). Please cite this paper if making use of any data in  this table in publications. </remarks>
CREATE TABLE [dbo].[zoo2Stripe82Coadd2](

	--/ <summary>obj ID</summary>
	--/ <quantity>meta.id</quantity>
	[specobjid] [bigint] NOT NULL,

	--/ <summary>objID of the galaxy in the Stripe82 context of CasJobs</summary>
	--/ <quantity>meta.id</quantity>
	[stripe82objid] [bigint] NOT NULL,

	--/ <summary>match to the DR8 objID for the corresponding normal-depth image</summary>
	--/ <quantity></quantity>
	[dr8objid] [bigint] NOT NULL,

	--/ <summary>match to the DR7 objID</summary>
	--/ <quantity>meta.id</quantity>
	[dr7objid] [bigint] NOT NULL,

	--/ <summary>right ascension [J2000.0], decimal degrees</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[ra] [real] NOT NULL,

	--/ <summary>declination [J2000.0], decimal degrees</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[dec] [real] NOT NULL,

	--/ <summary>right ascension [J2000.0], sexagesimal</summary>
	--/ <quantity></quantity>
	[rastring] [varchar](11) NOT NULL,
	
	--/ <summary>declination [J2000.0], sexagesimal</summary>
	--/ <quantity></quantity>
	[decstring] [varchar](11) NOT NULL,

	--/ <summary>sub-sample identification</summary>
	--/ <quantity>meta.id</quantity>
	[sample] [varchar](32) NOT NULL,

	--/ <summary>total number of classifications for this galaxy</summary>
	--/ <quantity>meta.number</quantity>
	[total_classifications] [int] NOT NULL,

	--/ <summary>total number of votes for each response, summed over all classifications</summary>
	--/ <quantity>meta.number</quantity>
	[total_votes] [int] NOT NULL,

	--/ <summary>number of votes for the "smooth" response to Task 01</summary>
	--/ <quantity>meta.number</quantity>
	[t01_smooth_or_features_a01_smooth_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "smooth" response to Task 01</summary>
	--/ <quantity>meta.number</quantity>
	[t01_smooth_or_features_a01_smooth_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "smooth" out of all responses to Task 01</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t01_smooth_or_features_a01_smooth_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "smooth" out of all responses to Task 01</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t01_smooth_or_features_a01_smooth_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "smooth" out of all responses to Task 01</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t01_smooth_or_features_a01_smooth_debiased] [float] NOT NULL,

	--/ <summary>flag for "smooth" - 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t01_smooth_or_features_a01_smooth_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "features or disk" response to Task 01</summary>
	--/ <quantity>meta.number</quantity>
	[t01_smooth_or_features_a02_features_or_disk_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "features or disk" response to Task 01</summary>
	--/ <quantity>meta.number</quantity>
	[t01_smooth_or_features_a02_features_or_disk_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "features or disk" out of all responses to Task 01</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t01_smooth_or_features_a02_features_or_disk_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "features or disk" out of all responses to Task 01</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t01_smooth_or_features_a02_features_or_disk_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "features or disk" out of all responses to Task 01</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t01_smooth_or_features_a02_features_or_disk_debiased] [float] NOT NULL,

	--/ <summary>flag for "features or disk"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t01_smooth_or_features_a02_features_or_disk_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "star or artifact" response to Task 01</summary>
	--/ <quantity>meta.number;</quantity>
	[t01_smooth_or_features_a03_star_or_artifact_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "star or artifact" response to Task 01</summary>
	--/ <quantity>meta.number;</quantity>
	[t01_smooth_or_features_a03_star_or_artifact_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "star or artifact" out of all responses to Task 01</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t01_smooth_or_features_a03_star_or_artifact_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "star or artifact" out of all responses to Task 01</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t01_smooth_or_features_a03_star_or_artifact_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "star or artifact" out of all responses to Task 01</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t01_smooth_or_features_a03_star_or_artifact_debiased] [float] NOT NULL,

	--/ <summary>flag for "star or artifact"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t01_smooth_or_features_a03_star_or_artifact_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "edge-on" response to Task 02</summary>
	--/ <quantity>meta.number</quantity>
	[t02_edgeon_a04_yes_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "edge-on" response to Task 02</summary>
	--/ <quantity>meta.number</quantity>
	[t02_edgeon_a04_yes_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "edge-on" out of all responses to Task 02</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t02_edgeon_a04_yes_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "edge-on" out of all responses to Task 02</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t02_edgeon_a04_yes_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "edge-on" out of all responses to Task 02</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t02_edgeon_a04_yes_debiased] [float] NOT NULL,

	--/ <summary>flag for "edge-on"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t02_edgeon_a04_yes_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "not edge-on" response to Task 02</summary>
	--/ <quantity>meta.number</quantity>
	[t02_edgeon_a05_no_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "not edge-on" response to Task 02</summary>
	--/ <quantity>meta.number</quantity>
	[t02_edgeon_a05_no_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "not edge-on" out of all responses to Task 02</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t02_edgeon_a05_no_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "not edge-on" out of all responses to Task 02</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t02_edgeon_a05_no_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "not edge-on" out of all responses to Task 02</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t02_edgeon_a05_no_debiased] [float] NOT NULL,

	--/ <summary>flag for "not edge-on"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>mta.code</quantity>
	[t02_edgeon_a05_no_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "bar" response to Task 03</summary>
	--/ <quantity>meta.number</quantity>
	[t03_bar_a06_bar_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "bar" response to Task 03</summary>
	--/ <quantity>meta.number</quantity>
	[t03_bar_a06_bar_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "bar" out of all responses to Task 03</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t03_bar_a06_bar_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "bar" out of all responses to Task 03</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t03_bar_a06_bar_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "bar" out of all responses to Task 03</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t03_bar_a06_bar_debiased] [float] NOT NULL,

	--/ <summary>flag for "bar"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t03_bar_a06_bar_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "no bar" response to Task 03</summary>
	--/ <quantity>meta.number</quantity>
	[t03_bar_a07_no_bar_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "no bar" response to Task 03</summary>
	--/ <quantity>meta.number</quantity>
	[t03_bar_a07_no_bar_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "no bar" out of all responses to Task 03</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t03_bar_a07_no_bar_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "no bar" out of all responses to Task 03</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t03_bar_a07_no_bar_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "no bar" out of all responses to Task 03</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t03_bar_a07_no_bar_debiased] [float] NOT NULL,

	--/ <summary>flag for "no bar"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t03_bar_a07_no_bar_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "spiral structure" response to Task 04</summary>
	--/ <quantity>meta.number</quantity>
	[t04_spiral_a08_spiral_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "spiral structure" response to Task 04</summary>
	--/ <quantity>meta.number</quantity>
	[t04_spiral_a08_spiral_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "spiral structure" out of all responses to Task 04</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t04_spiral_a08_spiral_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "spiral structure" out of all responses to Task 04</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t04_spiral_a08_spiral_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "spiral structure" out of all responses to Task 04</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t04_spiral_a08_spiral_debiased] [float] NOT NULL,

	--/ <summary>flag for "spiral structure"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t04_spiral_a08_spiral_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "no spiral structure" response to Task 04</summary>
	--/ <quantity>meta.number</quantity>
	[t04_spiral_a09_no_spiral_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "no spiral structure" response to Task 04</summary>
	--/ <quantity>meta.number</quantity>
	[t04_spiral_a09_no_spiral_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "no spiral structure" out of all responses to Task 04</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t04_spiral_a09_no_spiral_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "no spiral structure" out of all responses to Task 04</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t04_spiral_a09_no_spiral_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "no spiral structure" out of all responses to Task 04</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t04_spiral_a09_no_spiral_debiased] [float] NOT NULL,

	--/ <summary>flag for "no spiral structure"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t04_spiral_a09_no_spiral_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "no bulge" response to Task 05</summary>
	--/ <quantity>meta.number</quantity>
	[t05_bulge_prominence_a10_no_bulge_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "no bulge" response to Task 05</summary>
	--/ <quantity>meta.number</quantity>
	[t05_bulge_prominence_a10_no_bulge_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "no bulge" out of all responses to Task 05</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t05_bulge_prominence_a10_no_bulge_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "no bulge" out of all responses to Task 05</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t05_bulge_prominence_a10_no_bulge_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "no bulge" out of all responses to Task 05</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t05_bulge_prominence_a10_no_bulge_debiased] [float] NOT NULL,

	--/ <summary>flag for "no bulge"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t05_bulge_prominence_a10_no_bulge_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "just noticeable bulge" response to Task 05</summary>
	--/ <quantity>meta.number</quantity>
	[t05_bulge_prominence_a11_just_noticeable_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "just noticeable bulge" response to Task 05</summary>
	--/ <quantity>meta.number</quantity>
	[t05_bulge_prominence_a11_just_noticeable_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "just noticeable bulge" out of all responses to Task 05</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t05_bulge_prominence_a11_just_noticeable_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "just noticeable bulge" out of all responses to Task 05</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t05_bulge_prominence_a11_just_noticeable_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "just noticeable bulge" out of all responses to Task 05</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t05_bulge_prominence_a11_just_noticeable_debiased] [float] NOT NULL,

	--/ <summary>flag for "just noticeable bulge"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t05_bulge_prominence_a11_just_noticeable_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "obvious bulge" response to Task 05</summary>
	--/ <quantity>meta.number</quantity>
	[t05_bulge_prominence_a12_obvious_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "obvious bulge" response to Task 05</summary>
	--/ <quantity>meta.number</quantity>
	[t05_bulge_prominence_a12_obvious_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "obvious bulge" out of all responses to Task 05</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t05_bulge_prominence_a12_obvious_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "obvious bulge" out of all responses to Task 05</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t05_bulge_prominence_a12_obvious_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "obvious bulge" out of all responses to Task 05</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t05_bulge_prominence_a12_obvious_debiased] [float] NOT NULL,

	--/ <summary>flag for "obvious bulge"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t05_bulge_prominence_a12_obvious_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "dominant bulge" response to Task 05</summary>
	--/ <quantity>meta.number</quantity>
	[t05_bulge_prominence_a13_dominant_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "dominant bulge" response to Task 05</summary>
	--/ <quantity>meta.number</quantity>
	[t05_bulge_prominence_a13_dominant_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "dominant bulge" out of all responses to Task 05</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t05_bulge_prominence_a13_dominant_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "dominant bulge" out of all responses to Task 05</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t05_bulge_prominence_a13_dominant_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "dominant bulge" out of all responses to Task 05</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t05_bulge_prominence_a13_dominant_debiased] [float] NOT NULL,

	--/ <summary>flag for "dominant bulge"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t05_bulge_prominence_a13_dominant_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "something odd" response to Task 06</summary>
	--/ <quantity>meta.number</quantity>
	[t06_odd_a14_yes_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "something odd" response to Task 06</summary>
	--/ <quantity>meta.number</quantity>
	[t06_odd_a14_yes_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "something odd" out of all responses to Task 06</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t06_odd_a14_yes_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "something odd" out of all responses to Task 06</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t06_odd_a14_yes_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "something odd" out of all responses to Task 06</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t06_odd_a14_yes_debiased] [float] NOT NULL,

	--/ <summary>flag for "something odd"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t06_odd_a14_yes_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "nothing odd" response to Task 06</summary>
	--/ <quantity>meta.number</quantity>
	[t06_odd_a15_no_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "nothing odd" response to Task 06</summary>
	--/ <quantity>meta.number</quantity>
	[t06_odd_a15_no_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "nothing odd" out of all responses to Task 06</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t06_odd_a15_no_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "nothing odd" out of all responses to Task 06</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t06_odd_a15_no_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "nothing odd" out of all responses to Task 06</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t06_odd_a15_no_debiased] [float] NOT NULL,

	--/ <summary>flag for "nothing odd"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t06_odd_a15_no_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "smooth and completely round" response to Task 07</summary>
	--/ <quantity>meta.number</quantity>
	[t07_rounded_a16_completely_round_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "smooth and completely round" response to Task 07</summary>
	--/ <quantity>meta.number</quantity>
	[t07_rounded_a16_completely_round_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "smooth and completely round" out of all responses to Task 07</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t07_rounded_a16_completely_round_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "smooth and completely round" out of all responses to Task 07</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t07_rounded_a16_completely_round_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "smooth and completely round" out of all responses to Task 07</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t07_rounded_a16_completely_round_debiased] [float] NOT NULL,

	--/ <summary>flag for "smooth and completely round"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t07_rounded_a16_completely_round_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "smooth and in-between roundness" response to Task 07</summary>
	--/ <quantity>meta.number</quantity>
	[t07_rounded_a17_in_between_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "smooth and in-between roundness" response to Task 07</summary>
	--/ <quantity>meta.number</quantity>
	[t07_rounded_a17_in_between_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "smooth and in-between roundness" out of all responses to Task 07</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t07_rounded_a17_in_between_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "smooth and in-between roundness" out of all responses to Task 07</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t07_rounded_a17_in_between_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "smooth and in-between roundness" out of all responses to Task 07</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t07_rounded_a17_in_between_debiased] [float] NOT NULL,

	--/ <summary>flag for "smooth and in-between roundness"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t07_rounded_a17_in_between_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "smooth and cigar-shaped" response to Task 07</summary>
	--/ <quantity>meta.number</quantity>
	[t07_rounded_a18_cigar_shaped_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "smooth and cigar-shaped" response to Task 07</summary>
	--/ <quantity>meta.number</quantity>
	[t07_rounded_a18_cigar_shaped_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "smooth and cigar-shaped" out of all responses to Task 07</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t07_rounded_a18_cigar_shaped_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "smooth and cigar-shaped" out of all responses to Task 07</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t07_rounded_a18_cigar_shaped_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "smooth and cigar-shaped" out of all responses to Task 07</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t07_rounded_a18_cigar_shaped_debiased] [float] NOT NULL,

	--/ <summary>flag for "smooth and cigar-shaped"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t07_rounded_a18_cigar_shaped_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "odd feature is a ring" response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a19_ring_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "odd feature is a ring" response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a19_ring_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "odd feature is a ring" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a19_ring_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "odd feature is a ring" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a19_ring_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "odd feature is a ring" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a19_ring_debiased] [float] NOT NULL,

	--/ <summary>flag for "odd feature is a ring"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t08_odd_feature_a19_ring_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "odd feature is a lens or arc" response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a20_lens_or_arc_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "odd feature is a lens or arc" response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a20_lens_or_arc_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "odd feature is a lens or arc" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a20_lens_or_arc_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "odd feature is a lens or arc" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a20_lens_or_arc_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "odd feature is a lens or arc" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a20_lens_or_arc_debiased] [float] NOT NULL,

	--/ <summary>flag for "odd feature is a lens or arc"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t08_odd_feature_a20_lens_or_arc_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "odd feature is a disturbed" galaxy response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a21_disturbed_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "odd feature is a disturbed galaxy response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a21_disturbed_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "odd feature is a disturbed" galaxy out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a21_disturbed_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "odd feature is a disturbed galaxy out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a21_disturbed_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "odd feature is a disturbed" galaxy out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a21_disturbed_debiased] [float] NOT NULL,

	--/ <summary>flag for "odd feature is a disturbed galaxy"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t08_odd_feature_a21_disturbed_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "odd feature is an irregular" galaxy response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a22_irregular_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "odd feature is an irregular galaxy response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a22_irregular_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "odd feature is an irregular" galaxy out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a22_irregular_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "odd feature is an irregular galaxy out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a22_irregular_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "odd feature is an irregular" galaxy out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a22_irregular_debiased] [float] NOT NULL,

	--/ <summary>flag for "odd feature is an irregular galaxy"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t08_odd_feature_a22_irregular_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "odd feature is something else" response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a23_other_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "odd feature is something else" response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a23_other_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "odd feature is something else" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a23_other_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "odd feature is something else" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a23_other_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "odd feature is something else" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a23_other_debiased] [float] NOT NULL,

	--/ <summary>flag for "odd feature is something else"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t08_odd_feature_a23_other_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "odd feature is a merger" response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a24_merger_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "odd feature is a merger" response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a24_merger_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "odd feature is a merger" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a24_merger_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "odd feature is a merger" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a24_merger_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "odd feature is a merger" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a24_merger_debiased] [float] NOT NULL,

	--/ <summary>flag for "odd feature is a merger"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t08_odd_feature_a24_merger_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "odd feature is a dust lane" response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a38_dust_lane_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "odd feature is a dust lane" response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a38_dust_lane_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "odd feature is a dust lane" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a38_dust_lane_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "odd feature is a dust lane" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a38_dust_lane_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "odd feature is a dust lane" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a38_dust_lane_debiased] [float] NOT NULL,

	--/ <summary>flag for "odd feature is a dust lane"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t08_odd_feature_a38_dust_lane_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "edge-on bulge is rounded" response to Task 09</summary>
	--/ <quantity>meta.number</quantity>
	[t09_bulge_shape_a25_rounded_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "edge-on bulge is rounded" response to Task 09</summary>
	--/ <quantity>meta.number</quantity>
	[t09_bulge_shape_a25_rounded_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "edge-on bulge is rounded" out of all responses to Task 09</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t09_bulge_shape_a25_rounded_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "edge-on bulge is rounded" out of all responses to Task 09</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t09_bulge_shape_a25_rounded_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "edge-on bulge is rounded" out of all responses to Task 09</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t09_bulge_shape_a25_rounded_debiased] [float] NOT NULL,

	--/ <summary>flag for "edge-on bulge is rounded"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t09_bulge_shape_a25_rounded_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "edge-on bulge is boxy" response to Task 09</summary>
	--/ <quantity>meta.number</quantity>
	[t09_bulge_shape_a26_boxy_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "edge-on bulge is boxy" response to Task 09</summary>
	--/ <quantity>meta.number</quantity>
	[t09_bulge_shape_a26_boxy_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "edge-on bulge is boxy" out of all responses to Task 09</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t09_bulge_shape_a26_boxy_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "edge-on bulge is boxy" out of all responses to Task 09</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t09_bulge_shape_a26_boxy_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "edge-on bulge is boxy" out of all responses to Task 09</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t09_bulge_shape_a26_boxy_debiased] [float] NOT NULL,

	--/ <summary>flag for "edge-on bulge is boxy"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t09_bulge_shape_a26_boxy_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "no edge-on bulge" response to Task 09</summary>
	--/ <quantity>meta.number</quantity>
	[t09_bulge_shape_a27_no_bulge_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "no edge-on bulge" response to Task 09</summary>
	--/ <quantity>meta.number</quantity>
	[t09_bulge_shape_a27_no_bulge_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "no edge-on bulge" out of all responses to Task 09</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t09_bulge_shape_a27_no_bulge_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "no edge-on bulge" out of all responses to Task 09</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t09_bulge_shape_a27_no_bulge_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "no edge-on bulge" out of all responses to Task 09</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t09_bulge_shape_a27_no_bulge_debiased] [float] NOT NULL,

	--/ <summary>flag for "no edge-on bulge"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t09_bulge_shape_a27_no_bulge_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "tightly wound spiral arms" response to Task 10</summary>
	--/ <quantity>meta.number</quantity>
	[t10_arms_winding_a28_tight_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "tightly wound spiral arms" response to Task 10</summary>
	--/ <quantity>meta.number</quantity>
	[t10_arms_winding_a28_tight_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "tightly wound spiral arms" out of all responses to Task 10</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t10_arms_winding_a28_tight_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "tightly wound spiral arms" out of all responses to Task 10</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t10_arms_winding_a28_tight_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "tightly wound spiral arms" out of all responses to Task 10</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t10_arms_winding_a28_tight_debiased] [float] NOT NULL,

	--/ <summary>flag for "tightly wound spiral arms"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t10_arms_winding_a28_tight_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "medium wound spiral arms" response to Task 10</summary>
	--/ <quantity>meta.number</quantity>
	[t10_arms_winding_a29_medium_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "medium wound spiral arms" response to Task 10</summary>
	--/ <quantity>meta.number</quantity>
	[t10_arms_winding_a29_medium_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "medium wound spiral arms" out of all responses to Task 10</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t10_arms_winding_a29_medium_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "medium wound spiral arms" out of all responses to Task 10</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t10_arms_winding_a29_medium_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "medium wound spiral arms" out of all responses to Task 10</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t10_arms_winding_a29_medium_debiased] [float] NOT NULL,

	--/ <summary>flag for "medium wound spiral arms"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t10_arms_winding_a29_medium_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "loosely wound spiral arms" response to Task 10</summary>
	--/ <quantity>meta.number</quantity>
	[t10_arms_winding_a30_loose_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "loosely wound spiral arms" response to Task 10</summary>
	--/ <quantity>meta.number</quantity>
	[t10_arms_winding_a30_loose_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "loosely wound spiral arms" out of all responses to Task 10</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t10_arms_winding_a30_loose_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "loosely wound spiral arms" out of all responses to Task 10</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t10_arms_winding_a30_loose_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "loosely wound spiral arms" out of all responses to Task 10</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t10_arms_winding_a30_loose_debiased] [float] NOT NULL,

	--/ <summary>flag for "loosely wound spiral arms"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t10_arms_winding_a30_loose_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "1 spiral arm" response to Task 11</summary>
	--/ <quantity>meta.number</quantity>
	[t11_arms_number_a31_1_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "1 spiral arm" response to Task 11</summary>
	--/ <quantity>meta.number</quantity>
	[t11_arms_number_a31_1_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "1 spiral arm" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a31_1_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "1 spiral arm" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a31_1_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "1 spiral arm" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a31_1_debiased] [float] NOT NULL,

	--/ <summary>flag for "1 spiral arm"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t11_arms_number_a31_1_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "2 spiral arms" response to Task 11</summary>
	--/ <quantity>meta.number</quantity>
	[t11_arms_number_a32_2_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "2 spiral arms" response to Task 11</summary>
	--/ <quantity>meta.number</quantity>
	[t11_arms_number_a32_2_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "2 spiral arms" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a32_2_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "2 spiral arms" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a32_2_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "2 spiral arms" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a32_2_debiased] [float] NOT NULL,

	--/ <summary>flag for "2 spiral arms"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t11_arms_number_a32_2_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "3 spiral arms" response to Task 11</summary>
	--/ <quantity>meta.number</quantity>
	[t11_arms_number_a33_3_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "3 spiral arms" response to Task 11</summary>
	--/ <quantity>meta.number</quantity>
	[t11_arms_number_a33_3_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "3 spiral arms" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a33_3_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "3 spiral arms" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a33_3_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "3 spiral arms" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a33_3_debiased] [float] NOT NULL,

	--/ <summary>flag for "3 spiral arms"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t11_arms_number_a33_3_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "4 spiral arms" response to Task 11</summary>
	--/ <quantity>meta.number</quantity>
	[t11_arms_number_a34_4_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "4 spiral arms" response to Task 11</summary>
	--/ <quantity>meta.number</quantity>
	[t11_arms_number_a34_4_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "4 spiral arms" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a34_4_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "4 spiral arms" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a34_4_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "4 spiral arms" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a34_4_debiased] [float] NOT NULL,

	--/ <summary>flag for "4 spiral arms"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t11_arms_number_a34_4_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "more than 4 spiral arms" response to Task 11</summary>
	--/ <quantity>meta.number</quantity>
	[t11_arms_number_a36_more_than_4_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "more than 4 spiral arms" response to Task 11</summary>
	--/ <quantity>meta.number</quantity>
	[t11_arms_number_a36_more_than_4_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "more than 4 spiral arms" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a36_more_than_4_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "more than 4 spiral arms" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a36_more_than_4_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "more than 4 spiral arms" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a36_more_than_4_debiased] [float] NOT NULL,

	--/ <summary>flag for "more than 4 spiral arms"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t11_arms_number_a36_more_than_4_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "spiral arms present, but can't tell how many" response to Task 11</summary>
	--/ <quantity>meta.number</quantity>
	[t11_arms_number_a37_cant_tell_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "spiral arms present, but can't tell how many" response to Task 11</summary>
	--/ <quantity>meta.number</quantity>
	[t11_arms_number_a37_cant_tell_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "spiral arms present, but can't tell how many" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a37_cant_tell_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "spiral arms present, but can't tell how many" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a37_cant_tell_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "spiral arms present, but can't tell how many" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a37_cant_tell_debiased] [float] NOT NULL,

	--/ <summary>flag for "spiral arms present, but can't tell how many"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t11_arms_number_a37_cant_tell_flag] [int] NOT NULL,
 CONSTRAINT [pk_zoo2Stripe82Coadd2_stripe82ob] PRIMARY KEY CLUSTERED 
(
	[stripe82objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[zoo2Stripe82Normal]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

--/ <summary> Morphological classifications of Stripe 82 normal-depth, spectroscopic  galaxies from Galaxy Zoo 2 </summary>
--/ <remarks> This table includes Stripe 82 galaxies with spectra in SDSS Data Release  7. Several columns give data that can be used to cross-match rows with  other SDSS tables, including objIDs and positions of the galaxies.  Morphological classifications include six parameters for each category:  unweighted and weighted versions of both the total number of votes and  the vote fraction for that response, the vote fraction after being  debiased, and flags for systems identified as being in clean samples.   Note that this table and zoo2MainSpecz contain some of the same  galaxies (with r &lt; 17.0).	Reference:	The project and data release are described in Willett et al.  (2013, in prep). Please cite this paper if making use of any data in  this table in publications. </remarks>
CREATE TABLE [dbo].[zoo2Stripe82Normal](

	--/ <summary>obj ID</summary>
	--/ <quantity>meta.id</quantity>
	[specobjid] [bigint] NOT NULL,

	--/ <summary>match to the DR8 objID for the corresponding normal-depth image</summary>
	--/ <quantity></quantity>
	[dr8objid] [bigint] NOT NULL,

	--/ <summary>match to the DR7 objID</summary>
	--/ <quantity>meta.id</quantity>
	[dr7objid] [bigint] NOT NULL,

	--/ <summary>right ascension [J2000.0], decimal degrees</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[ra] [real] NOT NULL,

	--/ <summary>declination [J2000.0], decimal degrees</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit>deg</unit>
	[dec] [real] NOT NULL,

	--/ <summary>right ascension [J2000.0], sexagesimal</summary>
	--/ <quantity></quantity>
	[rastring] [varchar](16) NOT NULL,
	
	--/ <summary>declination [J2000.0], sexagesimal</summary>
	--/ <quantity></quantity>
	[decstring] [varchar](16) NOT NULL,

	--/ <summary>sub-sample identification</summary>
	--/ <quantity>meta.id</quantity>
	[sample] [varchar](32) NOT NULL,

	--/ <summary>total number of classifications for this galaxy</summary>
	--/ <quantity>meta.number</quantity>
	[total_classifications] [int] NOT NULL,

	--/ <summary>total number of votes for each response, summed over all classifications</summary>
	--/ <quantity>meta.number</quantity>
	[total_votes] [int] NOT NULL,

	--/ <summary>number of votes for the "smooth" response to Task 01</summary>
	--/ <quantity>meta.number</quantity>
	[t01_smooth_or_features_a01_smooth_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "smooth" response to Task 01</summary>
	--/ <quantity>meta.number</quantity>
	[t01_smooth_or_features_a01_smooth_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "smooth" out of all responses to Task 01</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t01_smooth_or_features_a01_smooth_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "smooth" out of all responses to Task 01</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t01_smooth_or_features_a01_smooth_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "smooth" out of all responses to Task 01</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t01_smooth_or_features_a01_smooth_debiased] [float] NOT NULL,

	--/ <summary>flag for "smooth" - 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t01_smooth_or_features_a01_smooth_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "features or disk" response to Task 01</summary>
	--/ <quantity>meta.number</quantity>
	[t01_smooth_or_features_a02_features_or_disk_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "features or disk" response to Task 01</summary>
	--/ <quantity>meta.number</quantity>
	[t01_smooth_or_features_a02_features_or_disk_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "features or disk" out of all responses to Task 01</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t01_smooth_or_features_a02_features_or_disk_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "features or disk" out of all responses to Task 01</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t01_smooth_or_features_a02_features_or_disk_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "features or disk" out of all responses to Task 01</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t01_smooth_or_features_a02_features_or_disk_debiased] [float] NOT NULL,

	--/ <summary>flag for "features or disk"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t01_smooth_or_features_a02_features_or_disk_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "star or artifact" response to Task 01</summary>
	--/ <quantity>meta.number;</quantity>
	[t01_smooth_or_features_a03_star_or_artifact_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "star or artifact" response to Task 01</summary>
	--/ <quantity>meta.number;</quantity>
	[t01_smooth_or_features_a03_star_or_artifact_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "star or artifact" out of all responses to Task 01</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t01_smooth_or_features_a03_star_or_artifact_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "star or artifact" out of all responses to Task 01</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t01_smooth_or_features_a03_star_or_artifact_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "star or artifact" out of all responses to Task 01</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t01_smooth_or_features_a03_star_or_artifact_debiased] [float] NOT NULL,

	--/ <summary>flag for "star or artifact"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t01_smooth_or_features_a03_star_or_artifact_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "edge-on" response to Task 02</summary>
	--/ <quantity>meta.number</quantity>
	[t02_edgeon_a04_yes_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "edge-on" response to Task 02</summary>
	--/ <quantity>meta.number</quantity>
	[t02_edgeon_a04_yes_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "edge-on" out of all responses to Task 02</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t02_edgeon_a04_yes_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "edge-on" out of all responses to Task 02</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t02_edgeon_a04_yes_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "edge-on" out of all responses to Task 02</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t02_edgeon_a04_yes_debiased] [float] NOT NULL,

	--/ <summary>flag for "edge-on"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t02_edgeon_a04_yes_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "not edge-on" response to Task 02</summary>
	--/ <quantity>meta.number</quantity>
	[t02_edgeon_a05_no_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "not edge-on" response to Task 02</summary>
	--/ <quantity>meta.number</quantity>
	[t02_edgeon_a05_no_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "not edge-on" out of all responses to Task 02</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t02_edgeon_a05_no_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "not edge-on" out of all responses to Task 02</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t02_edgeon_a05_no_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "not edge-on" out of all responses to Task 02</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t02_edgeon_a05_no_debiased] [float] NOT NULL,

	--/ <summary>flag for "not edge-on"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>mta.code</quantity>
	[t02_edgeon_a05_no_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "bar" response to Task 03</summary>
	--/ <quantity>meta.number</quantity>
	[t03_bar_a06_bar_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "bar" response to Task 03</summary>
	--/ <quantity>meta.number</quantity>
	[t03_bar_a06_bar_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "bar" out of all responses to Task 03</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t03_bar_a06_bar_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "bar" out of all responses to Task 03</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t03_bar_a06_bar_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "bar" out of all responses to Task 03</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t03_bar_a06_bar_debiased] [float] NOT NULL,

	--/ <summary>flag for "bar"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t03_bar_a06_bar_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "no bar" response to Task 03</summary>
	--/ <quantity>meta.number</quantity>
	[t03_bar_a07_no_bar_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "no bar" response to Task 03</summary>
	--/ <quantity>meta.number</quantity>
	[t03_bar_a07_no_bar_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "no bar" out of all responses to Task 03</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t03_bar_a07_no_bar_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "no bar" out of all responses to Task 03</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t03_bar_a07_no_bar_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "no bar" out of all responses to Task 03</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t03_bar_a07_no_bar_debiased] [float] NOT NULL,

	--/ <summary>flag for "no bar"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t03_bar_a07_no_bar_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "spiral structure" response to Task 04</summary>
	--/ <quantity>meta.number</quantity>
	[t04_spiral_a08_spiral_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "spiral structure" response to Task 04</summary>
	--/ <quantity>meta.number</quantity>
	[t04_spiral_a08_spiral_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "spiral structure" out of all responses to Task 04</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t04_spiral_a08_spiral_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "spiral structure" out of all responses to Task 04</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t04_spiral_a08_spiral_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "spiral structure" out of all responses to Task 04</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t04_spiral_a08_spiral_debiased] [float] NOT NULL,

	--/ <summary>flag for "spiral structure"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t04_spiral_a08_spiral_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "no spiral structure" response to Task 04</summary>
	--/ <quantity>meta.number</quantity>
	[t04_spiral_a09_no_spiral_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "no spiral structure" response to Task 04</summary>
	--/ <quantity>meta.number</quantity>
	[t04_spiral_a09_no_spiral_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "no spiral structure" out of all responses to Task 04</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t04_spiral_a09_no_spiral_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "no spiral structure" out of all responses to Task 04</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t04_spiral_a09_no_spiral_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "no spiral structure" out of all responses to Task 04</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t04_spiral_a09_no_spiral_debiased] [float] NOT NULL,

	--/ <summary>flag for "no spiral structure"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t04_spiral_a09_no_spiral_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "no bulge" response to Task 05</summary>
	--/ <quantity>meta.number</quantity>
	[t05_bulge_prominence_a10_no_bulge_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "no bulge" response to Task 05</summary>
	--/ <quantity>meta.number</quantity>
	[t05_bulge_prominence_a10_no_bulge_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "no bulge" out of all responses to Task 05</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t05_bulge_prominence_a10_no_bulge_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "no bulge" out of all responses to Task 05</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t05_bulge_prominence_a10_no_bulge_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "no bulge" out of all responses to Task 05</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t05_bulge_prominence_a10_no_bulge_debiased] [float] NOT NULL,

	--/ <summary>flag for "no bulge"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t05_bulge_prominence_a10_no_bulge_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "just noticeable bulge" response to Task 05</summary>
	--/ <quantity>meta.number</quantity>
	[t05_bulge_prominence_a11_just_noticeable_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "just noticeable bulge" response to Task 05</summary>
	--/ <quantity>meta.number</quantity>
	[t05_bulge_prominence_a11_just_noticeable_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "just noticeable bulge" out of all responses to Task 05</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t05_bulge_prominence_a11_just_noticeable_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "just noticeable bulge" out of all responses to Task 05</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t05_bulge_prominence_a11_just_noticeable_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "just noticeable bulge" out of all responses to Task 05</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t05_bulge_prominence_a11_just_noticeable_debiased] [float] NOT NULL,

	--/ <summary>flag for "just noticeable bulge"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t05_bulge_prominence_a11_just_noticeable_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "obvious bulge" response to Task 05</summary>
	--/ <quantity>meta.number</quantity>
	[t05_bulge_prominence_a12_obvious_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "obvious bulge" response to Task 05</summary>
	--/ <quantity>meta.number</quantity>
	[t05_bulge_prominence_a12_obvious_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "obvious bulge" out of all responses to Task 05</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t05_bulge_prominence_a12_obvious_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "obvious bulge" out of all responses to Task 05</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t05_bulge_prominence_a12_obvious_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "obvious bulge" out of all responses to Task 05</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t05_bulge_prominence_a12_obvious_debiased] [float] NOT NULL,

	--/ <summary>flag for "obvious bulge"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t05_bulge_prominence_a12_obvious_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "dominant bulge" response to Task 05</summary>
	--/ <quantity>meta.number</quantity>
	[t05_bulge_prominence_a13_dominant_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "dominant bulge" response to Task 05</summary>
	--/ <quantity>meta.number</quantity>
	[t05_bulge_prominence_a13_dominant_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "dominant bulge" out of all responses to Task 05</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t05_bulge_prominence_a13_dominant_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "dominant bulge" out of all responses to Task 05</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t05_bulge_prominence_a13_dominant_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "dominant bulge" out of all responses to Task 05</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t05_bulge_prominence_a13_dominant_debiased] [float] NOT NULL,

	--/ <summary>flag for "dominant bulge"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t05_bulge_prominence_a13_dominant_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "something odd" response to Task 06</summary>
	--/ <quantity>meta.number</quantity>
	[t06_odd_a14_yes_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "something odd" response to Task 06</summary>
	--/ <quantity>meta.number</quantity>
	[t06_odd_a14_yes_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "something odd" out of all responses to Task 06</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t06_odd_a14_yes_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "something odd" out of all responses to Task 06</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t06_odd_a14_yes_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "something odd" out of all responses to Task 06</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t06_odd_a14_yes_debiased] [float] NOT NULL,

	--/ <summary>flag for "something odd"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t06_odd_a14_yes_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "nothing odd" response to Task 06</summary>
	--/ <quantity>meta.number</quantity>
	[t06_odd_a15_no_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "nothing odd" response to Task 06</summary>
	--/ <quantity>meta.number</quantity>
	[t06_odd_a15_no_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "nothing odd" out of all responses to Task 06</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t06_odd_a15_no_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "nothing odd" out of all responses to Task 06</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t06_odd_a15_no_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "nothing odd" out of all responses to Task 06</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t06_odd_a15_no_debiased] [float] NOT NULL,

	--/ <summary>flag for "nothing odd"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t06_odd_a15_no_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "smooth and completely round" response to Task 07</summary>
	--/ <quantity>meta.number</quantity>
	[t07_rounded_a16_completely_round_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "smooth and completely round" response to Task 07</summary>
	--/ <quantity>meta.number</quantity>
	[t07_rounded_a16_completely_round_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "smooth and completely round" out of all responses to Task 07</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t07_rounded_a16_completely_round_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "smooth and completely round" out of all responses to Task 07</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t07_rounded_a16_completely_round_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "smooth and completely round" out of all responses to Task 07</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t07_rounded_a16_completely_round_debiased] [float] NOT NULL,

	--/ <summary>flag for "smooth and completely round"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t07_rounded_a16_completely_round_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "smooth and in-between roundness" response to Task 07</summary>
	--/ <quantity>meta.number</quantity>
	[t07_rounded_a17_in_between_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "smooth and in-between roundness" response to Task 07</summary>
	--/ <quantity>meta.number</quantity>
	[t07_rounded_a17_in_between_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "smooth and in-between roundness" out of all responses to Task 07</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t07_rounded_a17_in_between_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "smooth and in-between roundness" out of all responses to Task 07</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t07_rounded_a17_in_between_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "smooth and in-between roundness" out of all responses to Task 07</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t07_rounded_a17_in_between_debiased] [float] NOT NULL,

	--/ <summary>flag for "smooth and in-between roundness"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t07_rounded_a17_in_between_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "smooth and cigar-shaped" response to Task 07</summary>
	--/ <quantity>meta.number</quantity>
	[t07_rounded_a18_cigar_shaped_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "smooth and cigar-shaped" response to Task 07</summary>
	--/ <quantity>meta.number</quantity>
	[t07_rounded_a18_cigar_shaped_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "smooth and cigar-shaped" out of all responses to Task 07</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t07_rounded_a18_cigar_shaped_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "smooth and cigar-shaped" out of all responses to Task 07</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t07_rounded_a18_cigar_shaped_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "smooth and cigar-shaped" out of all responses to Task 07</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t07_rounded_a18_cigar_shaped_debiased] [float] NOT NULL,

	--/ <summary>flag for "smooth and cigar-shaped"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t07_rounded_a18_cigar_shaped_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "odd feature is a ring" response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a19_ring_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "odd feature is a ring" response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a19_ring_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "odd feature is a ring" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a19_ring_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "odd feature is a ring" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a19_ring_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "odd feature is a ring" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a19_ring_debiased] [float] NOT NULL,

	--/ <summary>flag for "odd feature is a ring"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t08_odd_feature_a19_ring_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "odd feature is a lens or arc" response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a20_lens_or_arc_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "odd feature is a lens or arc" response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a20_lens_or_arc_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "odd feature is a lens or arc" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a20_lens_or_arc_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "odd feature is a lens or arc" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a20_lens_or_arc_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "odd feature is a lens or arc" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a20_lens_or_arc_debiased] [float] NOT NULL,

	--/ <summary>flag for "odd feature is a lens or arc"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t08_odd_feature_a20_lens_or_arc_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "odd feature is a disturbed" galaxy response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a21_disturbed_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "odd feature is a disturbed galaxy response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a21_disturbed_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "odd feature is a disturbed" galaxy out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a21_disturbed_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "odd feature is a disturbed galaxy out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a21_disturbed_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "odd feature is a disturbed" galaxy out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a21_disturbed_debiased] [float] NOT NULL,

	--/ <summary>flag for "odd feature is a disturbed galaxy"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t08_odd_feature_a21_disturbed_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "odd feature is an irregular" galaxy response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a22_irregular_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "odd feature is an irregular galaxy response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a22_irregular_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "odd feature is an irregular" galaxy out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a22_irregular_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "odd feature is an irregular galaxy out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a22_irregular_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "odd feature is an irregular" galaxy out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a22_irregular_debiased] [float] NOT NULL,

	--/ <summary>flag for "odd feature is an irregular galaxy"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t08_odd_feature_a22_irregular_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "odd feature is something else" response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a23_other_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "odd feature is something else" response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a23_other_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "odd feature is something else" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a23_other_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "odd feature is something else" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a23_other_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "odd feature is something else" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a23_other_debiased] [float] NOT NULL,

	--/ <summary>flag for "odd feature is something else"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t08_odd_feature_a23_other_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "odd feature is a merger" response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a24_merger_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "odd feature is a merger" response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a24_merger_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "odd feature is a merger" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a24_merger_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "odd feature is a merger" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a24_merger_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "odd feature is a merger" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a24_merger_debiased] [float] NOT NULL,

	--/ <summary>flag for "odd feature is a merger"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t08_odd_feature_a24_merger_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "odd feature is a dust lane" response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a38_dust_lane_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "odd feature is a dust lane" response to Task 08</summary>
	--/ <quantity>meta.number</quantity>
	[t08_odd_feature_a38_dust_lane_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "odd feature is a dust lane" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a38_dust_lane_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "odd feature is a dust lane" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a38_dust_lane_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "odd feature is a dust lane" out of all responses to Task 08</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t08_odd_feature_a38_dust_lane_debiased] [float] NOT NULL,

	--/ <summary>flag for "odd feature is a dust lane"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t08_odd_feature_a38_dust_lane_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "edge-on bulge is rounded" response to Task 09</summary>
	--/ <quantity>meta.number</quantity>
	[t09_bulge_shape_a25_rounded_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "edge-on bulge is rounded" response to Task 09</summary>
	--/ <quantity>meta.number</quantity>
	[t09_bulge_shape_a25_rounded_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "edge-on bulge is rounded" out of all responses to Task 09</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t09_bulge_shape_a25_rounded_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "edge-on bulge is rounded" out of all responses to Task 09</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t09_bulge_shape_a25_rounded_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "edge-on bulge is rounded" out of all responses to Task 09</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t09_bulge_shape_a25_rounded_debiased] [float] NOT NULL,

	--/ <summary>flag for "edge-on bulge is rounded"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t09_bulge_shape_a25_rounded_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "edge-on bulge is boxy" response to Task 09</summary>
	--/ <quantity>meta.number</quantity>
	[t09_bulge_shape_a26_boxy_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "edge-on bulge is boxy" response to Task 09</summary>
	--/ <quantity>meta.number</quantity>
	[t09_bulge_shape_a26_boxy_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "edge-on bulge is boxy" out of all responses to Task 09</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t09_bulge_shape_a26_boxy_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "edge-on bulge is boxy" out of all responses to Task 09</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t09_bulge_shape_a26_boxy_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "edge-on bulge is boxy" out of all responses to Task 09</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t09_bulge_shape_a26_boxy_debiased] [float] NOT NULL,

	--/ <summary>flag for "edge-on bulge is boxy"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t09_bulge_shape_a26_boxy_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "no edge-on bulge" response to Task 09</summary>
	--/ <quantity>meta.number</quantity>
	[t09_bulge_shape_a27_no_bulge_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "no edge-on bulge" response to Task 09</summary>
	--/ <quantity>meta.number</quantity>
	[t09_bulge_shape_a27_no_bulge_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "no edge-on bulge" out of all responses to Task 09</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t09_bulge_shape_a27_no_bulge_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "no edge-on bulge" out of all responses to Task 09</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t09_bulge_shape_a27_no_bulge_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "no edge-on bulge" out of all responses to Task 09</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t09_bulge_shape_a27_no_bulge_debiased] [float] NOT NULL,

	--/ <summary>flag for "no edge-on bulge"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t09_bulge_shape_a27_no_bulge_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "tightly wound spiral arms" response to Task 10</summary>
	--/ <quantity>meta.number</quantity>
	[t10_arms_winding_a28_tight_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "tightly wound spiral arms" response to Task 10</summary>
	--/ <quantity>meta.number</quantity>
	[t10_arms_winding_a28_tight_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "tightly wound spiral arms" out of all responses to Task 10</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t10_arms_winding_a28_tight_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "tightly wound spiral arms" out of all responses to Task 10</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t10_arms_winding_a28_tight_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "tightly wound spiral arms" out of all responses to Task 10</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t10_arms_winding_a28_tight_debiased] [float] NOT NULL,

	--/ <summary>flag for "tightly wound spiral arms"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t10_arms_winding_a28_tight_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "medium wound spiral arms" response to Task 10</summary>
	--/ <quantity>meta.number</quantity>
	[t10_arms_winding_a29_medium_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "medium wound spiral arms" response to Task 10</summary>
	--/ <quantity>meta.number</quantity>
	[t10_arms_winding_a29_medium_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "medium wound spiral arms" out of all responses to Task 10</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t10_arms_winding_a29_medium_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "medium wound spiral arms" out of all responses to Task 10</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t10_arms_winding_a29_medium_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "medium wound spiral arms" out of all responses to Task 10</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t10_arms_winding_a29_medium_debiased] [float] NOT NULL,

	--/ <summary>flag for "medium wound spiral arms"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t10_arms_winding_a29_medium_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "loosely wound spiral arms" response to Task 10</summary>
	--/ <quantity>meta.number</quantity>
	[t10_arms_winding_a30_loose_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "loosely wound spiral arms" response to Task 10</summary>
	--/ <quantity>meta.number</quantity>
	[t10_arms_winding_a30_loose_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "loosely wound spiral arms" out of all responses to Task 10</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t10_arms_winding_a30_loose_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "loosely wound spiral arms" out of all responses to Task 10</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t10_arms_winding_a30_loose_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "loosely wound spiral arms" out of all responses to Task 10</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t10_arms_winding_a30_loose_debiased] [float] NOT NULL,

	--/ <summary>flag for "loosely wound spiral arms"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t10_arms_winding_a30_loose_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "1 spiral arm" response to Task 11</summary>
	--/ <quantity>meta.number</quantity>
	[t11_arms_number_a31_1_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "1 spiral arm" response to Task 11</summary>
	--/ <quantity>meta.number</quantity>
	[t11_arms_number_a31_1_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "1 spiral arm" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a31_1_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "1 spiral arm" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a31_1_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "1 spiral arm" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a31_1_debiased] [float] NOT NULL,

	--/ <summary>flag for "1 spiral arm"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t11_arms_number_a31_1_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "2 spiral arms" response to Task 11</summary>
	--/ <quantity>meta.number</quantity>
	[t11_arms_number_a32_2_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "2 spiral arms" response to Task 11</summary>
	--/ <quantity>meta.number</quantity>
	[t11_arms_number_a32_2_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "2 spiral arms" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a32_2_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "2 spiral arms" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a32_2_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "2 spiral arms" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a32_2_debiased] [float] NOT NULL,

	--/ <summary>flag for "2 spiral arms"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t11_arms_number_a32_2_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "3 spiral arms" response to Task 11</summary>
	--/ <quantity>meta.number</quantity>
	[t11_arms_number_a33_3_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "3 spiral arms" response to Task 11</summary>
	--/ <quantity>meta.number</quantity>
	[t11_arms_number_a33_3_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "3 spiral arms" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a33_3_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "3 spiral arms" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a33_3_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "3 spiral arms" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a33_3_debiased] [float] NOT NULL,

	--/ <summary>flag for "3 spiral arms"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t11_arms_number_a33_3_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "4 spiral arms" response to Task 11</summary>
	--/ <quantity>meta.number</quantity>
	[t11_arms_number_a34_4_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "4 spiral arms" response to Task 11</summary>
	--/ <quantity>meta.number</quantity>
	[t11_arms_number_a34_4_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "4 spiral arms" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a34_4_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "4 spiral arms" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a34_4_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "4 spiral arms" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a34_4_debiased] [float] NOT NULL,

	--/ <summary>flag for "4 spiral arms"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t11_arms_number_a34_4_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "more than 4 spiral arms" response to Task 11</summary>
	--/ <quantity>meta.number</quantity>
	[t11_arms_number_a36_more_than_4_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "more than 4 spiral arms" response to Task 11</summary>
	--/ <quantity>meta.number</quantity>
	[t11_arms_number_a36_more_than_4_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "more than 4 spiral arms" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a36_more_than_4_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "more than 4 spiral arms" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a36_more_than_4_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "more than 4 spiral arms" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a36_more_than_4_debiased] [float] NOT NULL,

	--/ <summary>flag for "more than 4 spiral arms"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t11_arms_number_a36_more_than_4_flag] [int] NOT NULL,

	--/ <summary>number of votes for the "spiral arms present, but can't tell how many" response to Task 11</summary>
	--/ <quantity>meta.number</quantity>
	[t11_arms_number_a37_cant_tell_count] [int] NOT NULL,

	--/ <summary>consistency-weighted number of votes for the "spiral arms present, but can't tell how many" response to Task 11</summary>
	--/ <quantity>meta.number</quantity>
	[t11_arms_number_a37_cant_tell_weight] [float] NOT NULL,

	--/ <summary>fraction of votes for "spiral arms present, but can't tell how many" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a37_cant_tell_fraction] [float] NOT NULL,

	--/ <summary>consistency-weighted fraction of votes for "spiral arms present, but can't tell how many" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a37_cant_tell_weighted_fraction] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for "spiral arms present, but can't tell how many" out of all responses to Task 11</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[t11_arms_number_a37_cant_tell_debiased] [float] NOT NULL,

	--/ <summary>flag for "spiral arms present, but can't tell how many"	- 1 if galaxy is in clean sample, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[t11_arms_number_a37_cant_tell_flag] [int] NOT NULL,
 CONSTRAINT [pk_zoo2Stripe82Normal_dr7objid] PRIMARY KEY CLUSTERED 
(
	[dr7objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[zooConfidence]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

--/ <summary> Measures of classification confidence from Galaxy Zoo. </summary>
--/ <remarks> Only galaxies with spectra in DR7 are included (those in the zooSpec table).  This information is identical to that in Galaxy Zoo 1 Table 4.  The project is described in Lintott et al., 2008, MNRAS, 389, 1179 and the  data release is described in Lintott et al. 2010. Anyone making use of the   data should cite at least one of these papers in any resulting publications. </remarks>
CREATE TABLE [dbo].[zooConfidence](

	--/ <summary>match to DR8 spectrum object</summary>
	--/ <quantity>meta.id</quantity>
	[specobjid] [bigint] NOT NULL,

	--/ <summary>DR8 ObjID</summary>
	--/ <quantity>meta.id</quantity>
	[objid] [bigint] NOT NULL,

	--/ <summary>DR7 ObjID</summary>
	--/ <quantity>meta.id</quantity>
	[dr7objid] [bigint] NOT NULL,

	--/ <summary>Right Ascension, J2000 deg</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	[ra] [real] NOT NULL,

	--/ <summary>Declination, J2000 deg</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	[dec] [real] NOT NULL,

	--/ <summary>Right ascension in sexagesimal</summary>
	--/ <quantity>pos.eq.ra</quantity>
	[rastring] [varchar](11) NOT NULL,

	--/ <summary>Declination in sexagesimal</summary>
	--/ <quantity>pos.eq.dec</quantity>
	[decstring] [varchar](11) NOT NULL,

	--/ <summary>fraction of galaxies in same bin that are unclassified, clean condition</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[f_unclass_clean] [float] NOT NULL,

	--/ <summary>fraction of galaxies in same bin that are misclassified, clean condition</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[f_misclass_clean] [float] NOT NULL,

	--/ <summary>average bias correction in bin, clean condition</summary>
	--/ <quantity>stat.value</quantity>
	[avcorr_clean] [float] NOT NULL,

	--/ <summary>std dev of bias corrections in bin, clean condition</summary>
	--/ <quantity>stat.stdev</quantity>
	[stdcorr_clean] [float] NOT NULL,

	--/ <summary>fraction of galaxies in same bin that are misclassified, greater condition</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[f_misclass_greater] [float] NOT NULL,

	--/ <summary>average bias correction in bin, greater condition</summary>
	--/ <quantity>stat.value</quantity>
	[avcorr_greater] [float] NOT NULL,

	--/ <summary>std dev of bias corrections in bin, greater condition</summary>
	--/ <quantity>stat.stdev</quantity>
	[stdcorr_greater] [float] NOT NULL,
 CONSTRAINT [pk_zooConfidence_specObjID] PRIMARY KEY CLUSTERED 
(
	[specobjid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[zooMirrorBias]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

--/ <summary> Results from the bias study using mirrored images from Galaxy Zoo </summary>
--/ <remarks> This information is identical to that in Galaxy Zoo 1 Table 5.  The project is described in Lintott et al., 2008, MNRAS, 389, 1179 and the  data release is described in Lintott et al. 2010. Anyone making use of the   data should cite at least one of these papers in any resulting publications. </remarks>
CREATE TABLE [dbo].[zooMirrorBias](

	--/ <summary>match to DR8 spectrum object</summary>
	--/ <quantity>meta.id</quantity>
	[specobjid] [bigint] NOT NULL,

	--/ <summary>DR8 ObjID</summary>
	--/ <quantity>meta.id</quantity>
	[objid] [bigint] NOT NULL,

	--/ <summary>DR7 ObjID</summary>
	--/ <quantity>meta.id</quantity>
	[dr7objid] [bigint] NOT NULL,

	--/ <summary>Right Ascension, J2000 deg</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	[ra] [real] NOT NULL,

	--/ <summary>Declination, J2000 deg</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	[dec] [real] NOT NULL,

	--/ <summary>Right ascension in sexagesimal</summary>
	--/ <quantity>pos.eq.ra</quantity>
	[rastring] [varchar](11) NOT NULL,

	--/ <summary>Declination in sexagesimal</summary>
	--/ <quantity>pos.eq.dec</quantity>
	[decstring] [varchar](11) NOT NULL,

	--/ <summary>number of votes, vertical mirroring</summary>
	--/ <quantity>meta.number</quantity>
	[nvote_mr1] [int] NOT NULL,

	--/ <summary>fraction of votes for elliptical, vertical mirroring</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[p_el_mr1] [float] NOT NULL,

	--/ <summary>fraction of votes for clockwise spiral, vertical mirroring</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[p_cw_mr1] [float] NOT NULL,

	--/ <summary>fraction of votes for anticlockwise spiral, vertical mirroring</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[p_acw_mr1] [float] NOT NULL,

	--/ <summary>fraction of votes for edge-on disk, vertical mirroring</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[p_edge_mr1] [float] NOT NULL,

	--/ <summary>fraction of votes for don't know, vertical mirroring</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[p_dk_mr1] [float] NOT NULL,

	--/ <summary>fraction of votes for merger, vertical mirroring</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[p_mg_mr1] [float] NOT NULL,

	--/ <summary>fraction of votes for combined spiral, vertical mirroring</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[p_cs_mr1] [float] NOT NULL,

	--/ <summary>number of votes, diagonal mirroring</summary>
	--/ <quantity>meta.number</quantity>
	[nvote_mr2] [int] NOT NULL,

	--/ <summary>fraction of votes for elliptical, diagonal mirroring</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[p_el_mr2] [float] NOT NULL,

	--/ <summary>fraction of votes for clockwise spiral, diagonal mirroring</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[p_cw_mr2] [float] NOT NULL,

	--/ <summary>fraction of votes for anticlockwise spiral, diagonal mirroring</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[p_acw_mr2] [float] NOT NULL,

	--/ <summary>fraction of votes for edge-on disk, diagonal mirroring</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[p_edge_mr2] [float] NOT NULL,

	--/ <summary>fraction of votes for don't know, diagonal mirroring</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[p_dk_mr2] [float] NOT NULL,

	--/ <summary>fraction of votes for merger, diagonal mirroring</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[p_mg_mr2] [float] NOT NULL,

	--/ <summary>fraction of votes for combined spiral, diagonal mirroring</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[p_cs_mr2] [float] NOT NULL,
 CONSTRAINT [pk_zooMirrorBias_dr7objid] PRIMARY KEY CLUSTERED 
(
	[dr7objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[zooMonochromeBias]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

--/ <summary> Results from the bias study that introduced monochrome images in Galaxy Zoo. </summary>
--/ <remarks> This information is identical to that in Galaxy Zoo 1 Table 6.  The project is described in Lintott et al., 2008, MNRAS, 389, 1179 and the  data release is described in Lintott et al. 2010. Anyone making use of the   data should cite at least one of these papers in any resulting publications. </remarks>
CREATE TABLE [dbo].[zooMonochromeBias](

	--/ <summary>match to DR8 spectrum object</summary>
	--/ <quantity>meta.id</quantity>
	[specobjid] [bigint] NOT NULL,

	--/ <summary>DR8 ObjID</summary>
	--/ <quantity>meta.id</quantity>
	[objid] [bigint] NOT NULL,

	--/ <summary>DR7 ObjID</summary>
	--/ <quantity>meta.id</quantity>
	[dr7objid] [bigint] NOT NULL,

	--/ <summary>Right Ascension, J2000 deg</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	[ra] [real] NOT NULL,

	--/ <summary>Declination, J2000 deg</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	[dec] [real] NOT NULL,

	--/ <summary>Right ascension in sexagesimal</summary>
	--/ <quantity>pos.eq.ra</quantity>
	[rastring] [varchar](11) NOT NULL,

	--/ <summary>Declination in sexagesimal</summary>
	--/ <quantity>pos.eq.dec</quantity>
	[decstring] [varchar](11) NOT NULL,

	--/ <summary>number of votes, monochrome</summary>
	--/ <quantity>meta.number</quantity>
	[nvote_mon] [int] NOT NULL,

	--/ <summary>fraction of votes for elliptical, monochrome</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[p_el_mon] [float] NOT NULL,

	--/ <summary>fraction of votes for clockwise spiral, monochrome</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[p_cw_mon] [float] NOT NULL,

	--/ <summary>fraction of votes for anticlockwise spiral, monochrome</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[p_acw_mon] [float] NOT NULL,

	--/ <summary>fraction of votes for edge-on disk, monochrome</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[p_edge_mon] [float] NOT NULL,

	--/ <summary>fraction of votes for don't know, monochrome</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[p_dk_mon] [float] NOT NULL,

	--/ <summary>fraction of votes for merger, monochrome</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[p_mg_mon] [float] NOT NULL,

	--/ <summary>fraction of votes for combined spiral (cw + acw + edge-on), monochrome</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[p_cs_mon] [float] NOT NULL,
 CONSTRAINT [pk_zooMonochromeBias_dr7objid] PRIMARY KEY CLUSTERED 
(
	[dr7objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[zooNoSpec]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

--/ <summary> Morphology classifications of galaxies without spectra from Galaxy Zoo  </summary>
--/ <remarks> This information is identical to that in Galaxy Zoo 1 Table 3.   Some objects may have spectroscopic matches in DR8 (though they did   not in DR7) It is not possible to estimate the bias in the sample, and so   only the fraction of the vote in each of the six categories is given.  The project is described in Lintott et al., 2008, MNRAS, 389, 1179 and the  data release is described in Lintott et al. 2010. Anyone making use of the   data should cite at least one of these papers in any resulting publications. </remarks>
CREATE TABLE [dbo].[zooNoSpec](

	--/ <summary>match to DR8 spectrum object</summary>
	--/ <quantity>meta.id</quantity>
	[specobjid] [bigint] NOT NULL,

	--/ <summary>DR8 ObjID</summary>
	--/ <quantity>meta.id</quantity>
	[objid] [bigint] NOT NULL,

	--/ <summary>DR7 ObjID</summary>
	--/ <quantity>meta.id</quantity>
	[dr7objid] [bigint] NOT NULL,

	--/ <summary>Right Ascension, J2000 deg</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	[ra] [real] NOT NULL,

	--/ <summary>Declination, J2000 deg</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	[dec] [real] NOT NULL,

	--/ <summary>Right ascension in sexagesimal</summary>
	--/ <quantity>pos.eq.ra</quantity>
	[rastring] [varchar](11) NOT NULL,

	--/ <summary>number of votes</summary>
	--/ <quantity>pos.eq.dec</quantity>
	[nvote] [int] NOT NULL,

	--/ <summary>fraction of votes for elliptical</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[p_el] [float] NOT NULL,

	--/ <summary>fraction of votes for clockwise spiral</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[p_cw] [float] NOT NULL,

	--/ <summary>fraction of votes for anticlockwise spiral</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[p_acw] [float] NOT NULL,

	--/ <summary>fraction of votes for edge-on disk</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[p_edge] [float] NOT NULL,

	--/ <summary>fraction of votes for don't know</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[p_dk] [float] NOT NULL,

	--/ <summary>fraction of votes for merger</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[p_mg] [float] NOT NULL,

	--/ <summary>fraction of votes for combined spiral - cw + acw + edge-on</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[p_cs] [float] NOT NULL,
 CONSTRAINT [pk_zooNoSpec_dr7objid] PRIMARY KEY CLUSTERED 
(
	[dr7objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[zooSpec]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

--/ <summary> Morphological classifications of spectroscopic galaxies from Galaxy Zoo </summary>
--/ <remarks> This information is identical to that in Galaxy Zoo 1 Table 2.  This table includes galaxies with spectra in SDSS Data Release 7.  The fraction of the vote in each of the six categories is given, along with   debiased votes in elliptical and spiral categories and flags identifying   systems as classified as spiral, elliptical or uncertain.  The project is described in Lintott et al., 2008, MNRAS, 389, 1179 and the  data release is described in Lintott et al. 2010. Anyone making use of the   data should cite at least one of these papers in any resulting publications. </remarks>
CREATE TABLE [dbo].[zooSpec](

	--/ <summary>match to DR8 spectrum object</summary>
	--/ <quantity>meta.id</quantity>
	[specobjid] [bigint] NOT NULL,

	--/ <summary>DR8 ObjID</summary>
	--/ <quantity>meta.id</quantity>
	[objid] [bigint] NOT NULL,

	--/ <summary>DR7 ObjID</summary>
	--/ <quantity>meta.id</quantity>
	[dr7objid] [bigint] NOT NULL,

	--/ <summary>Right Ascension, J2000 deg</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	[ra] [real] NOT NULL,

	--/ <summary>Declination, J2000 deg</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	[dec] [real] NOT NULL,

	--/ <summary>Right ascension in sexagesimal</summary>
	--/ <quantity>pos.eq.ra</quantity>
	[rastring] [varchar](11) NOT NULL,

	--/ <summary>Declination in sexagesimal</summary>
	--/ <quantity>pos.eq.ra</quantity>
	[decstring] [varchar](11) NOT NULL,

	--/ <summary>number of votes</summary>
	--/ <quantity>meta.number</quantity>
	[nvote] [int] NOT NULL,

	--/ <summary>fraction of votes for elliptical</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[p_el] [float] NOT NULL,

	--/ <summary>fraction of votes for clockwise spiral</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[p_cw] [float] NOT NULL,

	--/ <summary>fraction of votes for anticlockwise spiral</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[p_acw] [float] NOT NULL,

	--/ <summary>fraction of votes for edge-on disk</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[p_edge] [float] NOT NULL,

	--/ <summary>fraction of votes for don't know</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[p_dk] [float] NOT NULL,

	--/ <summary>fraction of votes for merger</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[p_mg] [float] NOT NULL,

	--/ <summary>fraction of votes for combined spiral - cw + acw + edge-on</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[p_cs] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for elliptical</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[p_el_debiased] [float] NOT NULL,

	--/ <summary>debiased fraction of votes for combined spiral</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[p_cs_debiased] [float] NOT NULL,

	--/ <summary>flag for combined spiral - 1 if debiased spiral fraction &gt; 0.8, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[spiral] [int] NOT NULL,

	--/ <summary>flag for elliptical - 1 if debiased elliptical fraction &gt; 0.8, 0 otherwise</summary>
	--/ <quantity>meta.code</quantity>
	[elliptical] [int] NOT NULL,

	--/ <summary>flag for uncertain type - 1 if both spiral and elliptical flags are 0</summary>
	--/ <quantity>meta.code</quantity>
	[uncertain] [int] NOT NULL,
 CONSTRAINT [pk_zooSpec_specObjID] PRIMARY KEY CLUSTERED 
(
	[specobjid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[zooVotes]    Script Date: 4/1/2015 5:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

--/ <summary> Vote breakdown in Galaxy Zoo results. </summary>
--/ <remarks> Fraction of votes in each of the six categories, combining results from the main   and bias studies. This information is identical to that in Galaxy Zoo 1 Table 7.  The project is described in Lintott et al., 2008, MNRAS, 389, 1179 and the  data release is described in Lintott et al. 2010. Anyone making use of the   data should cite at least one of these papers in any resulting publications. </remarks>
CREATE TABLE [dbo].[zooVotes](

	--/ <summary>match to DR8 spectrum object</summary>
	--/ <quantity>meta.id</quantity>
	[specobjid] [bigint] NOT NULL,

	--/ <summary>DR8 ObjID</summary>
	--/ <quantity>meta.id</quantity>
	[objid] [bigint] NOT NULL,

	--/ <summary>DR7 ObjID</summary>
	--/ <quantity>meta.id</quantity>
	[dr7objid] [bigint] NOT NULL,

	--/ <summary>Right Ascension, J2000 deg</summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	[ra] [real] NOT NULL,

	--/ <summary>Declination, J2000 deg</summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	[dec] [real] NOT NULL,

	--/ <summary>Right ascension in sexagesimal</summary>
	--/ <quantity>pos.eq.ra</quantity>
	[rastring] [varchar](11) NOT NULL,

	--/ <summary>Declination in sexagesimal</summary>
	--/ <quantity>pos.eq.dec</quantity>
	[decstring] [varchar](11) NOT NULL,

	--/ <summary>Total votes</summary>
	--/ <quantity>meta.number</quantity>
	[nvote_tot] [int] NOT NULL,

	--/ <summary>Total votes for the standard classification</summary>
	--/ <quantity>meta.number</quantity>
	[nvote_std] [int] NOT NULL,

	--/ <summary>Total votes for the vertical mirrored classification</summary>
	--/ <quantity>meta.number</quantity>
	[nvote_mr1] [int] NOT NULL,

	--/ <summary>Total votes for the diagonally mirrored classification</summary>
	--/ <quantity>meta.number</quantity>
	[nvote_mr2] [int] NOT NULL,

	--/ <summary>Total votes for the monochrome classification</summary>
	--/ <quantity>meta.number</quantity>
	[nvote_mon] [int] NOT NULL,

	--/ <summary>Fraction of votes for elliptical</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[p_el] [float] NOT NULL,

	--/ <summary>Fraction of votes for clockwise spiral</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[p_cw] [float] NOT NULL,

	--/ <summary>Fraction of votes for anticlockwise spiral</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[p_acw] [float] NOT NULL,

	--/ <summary>Fraction of votes for edge-on disk</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[p_edge] [float] NOT NULL,

	--/ <summary>Fraction of votes for don't know</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[p_dk] [float] NOT NULL,

	--/ <summary>Fraction of votes for merger</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[p_mg] [float] NOT NULL,

	--/ <summary>Fraction of votes for combined spiral - cw + acw + edge-on</summary>
	--/ <quantity>meta.number;arith.ratio</quantity>
	[p_cs] [float] NOT NULL,
 CONSTRAINT [pk_zooVotes_dr7objid] PRIMARY KEY CLUSTERED 
(
	[dr7objid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

