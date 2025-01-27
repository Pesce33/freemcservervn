--/ <dataset>
--/ <summary> Updated Zwicky Catalog </summary>
--/ <remarks>
--/ The Zwicky Catalog of Galaxies, with a magnitude limit m_Zw &lt;=15.5, has been the basis for the 
--/ Center for Astrophysics (CfA) redshift surveys. To date, analyses of the Zwicky Catalog and redshift
--/  surveys based on it have relied on heterogeneous sets of galaxy coordinates and redshifts. In this 
--/ Updated Zwicky Catalog (UZC), some of the inadequacies of previous catalogs are corrected by 
--/ providing (1) coordinates with ~&lt;2 arcsecond errors for all of the 19,369 catalog galaxies, (2) 
--/ homogeneously estimated redshifts cz (radial velocities) for the majority (98%) of the data taken at
--/  the CfA (14,632 spectra), and (3) an estimate of the remaining "blunder" rate for both the CfA 
--/ redshifts and for those compiled from the literature.
--/ </remarks>
--/ <url>http://tdc-www.harvard.edu/uzc/</url>
--/ <icon>uzc.png</icon>
--/ <docpage>uzc.html</docpage>
--/ </dataset>
 GO

-- CREATE SpecObj TABLE

--/ <summary>UZC catalog</summary>
--/ <remarks>UZC catalog</remarks>
CREATE TABLE dbo.SpecObj
(
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
	--/ <quantity>pos.eq.HTM; pos.frame=j2000</quantity>
	[htmid] bigint NOT NULL,

	--/ <summary> Zone ID </summary>
	--/ <quantity>pos.eq.zone;pos.frame=j2000</quantity>
	[zoneid] int NOT NULL,

	--/ <summary> Sequential ID </summary>
	--/ <quantity>meta.record</quantity>
	[seqID] bigint NOT NULL,

	--/ <summary> Right ascension (J2000) </summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit> deg </unit>
	[RA] float NOT NULL,

	--/ <summary> Declination (J2000)  </summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit> deg </unit>
	[DEC] float NOT NULL,

	--/ <summary> B magnitude (Zwicky magnitude)  </summary>
	--/ <quantity>phot.mag;em.opt.B</quantity>
	--/ <unit> mag </unit>
	[Bmag] real NOT NULL,

	--/ <summary> Heliocentric redshift  </summary>
	--/ <quantity>src.redshift;pos.heliocentric</quantity>
	--/ <unit> km s-1 </unit>
	[z] int NOT NULL,

	--/ <summary> rms uncertainty on z  </summary>
	--/ <quantity>stat.error;src.redshift;pos.heliocentric</quantity>
	--/ <unit> km s-1 </unit>
	[e_z] smallint NOT NULL,

	--/ <summary> [ABE] Spectral characteristics. the symbol means: 
	--/ A:absorption 
	--/ E:emission 
	--/ B:both emission and absorption </summary>
	--/ <quantity>meta.note</quantity>
	[T] char(1) NOT NULL,

	--/ <summary> [0/4] UZC class 0-4. the UZC class is defined as:
	--/ 
	--/ 0:a "hit", where the GSC and Zwicky objects are separated in position by less than 180", are comparable in brightness as 
	--/ visually, and there is no other object within the field that could be a Zwicky galaxy.
	--/ 
	--/ 
	--/ 1:a "hit" with positional difference less than 180", again with a GSC brightness in the vicinity of the Zwicky value. 
	--/ the field is centered on a GSC "star" rather than on a "nonstar", but there is only one possible Zwicky galaxy nearby, 
	--/ the field. Thus, index 1 merely indicated that the nearest GSC object to the Zwicky coordinates is a star rather than the 
	--/ galaxy.
	--/ 
	--/ 
	--/ 2:a near "hit" with positional difference less than 180". However, there is confusion because there are at least two 
	--/ with an estimated spread in magnitudes |Δm| within the expected range, either of which could be a Zwicky galaxy.
	--/ 
	--/ 
	--/ 3:A near "hit" with positional difference less than 180", but with |Δm| outside the expected range, raising suspicions 
	--/ the match of the GSC object to the Zwicky galaxy.
	--/ 
	--/ 
	--/ 4:No "hit" at all for a positional difference less than 180", i.e., there is no match for a Zwicky galaxy. </summary>
	--/ <quantity>meta.code.qual</quantity>
	[U] tinyint NOT NULL,

	--/ <summary> Number of UZC neighboring galaxies, within 3' </summary>
	--/ <quantity>meta.number;src</quantity>
	[N] tinyint NOT NULL,

	--/ <summary> Zwicky label based on 1950 positions </summary>
	--/ <quantity>meta.ref</quantity>
	[Zname] char(12) NOT NULL,

	--/ <summary> [FMTXZ] Origin of the redshift measurement. Code for the origin of the redshift measurement taken at the CfA: Z for 
	--/ M for the MMT (4.5m Multiple Mirror Telescope) F for FAST spectra taken from our own and from other projects X flags a 
	--/ spectrum for Z-machine (FAST) measurements and 
	--/ indicatesa low S/N match with a spectrum at c&lt;100km/s. </summary>
	--/ <quantity>meta.ref;src.redshift</quantity>
	[f_z] char(1) NOT NULL,

	--/ <summary> Reference code detailed in file refs.dat (blank for CfA unpublished data) </summary>
	--/ <quantity>meta.ref</quantity>
	[r_z] int NOT NULL,

	--/ <summary> Other name </summary>
	--/ <quantity>meta.id</quantity>
	[Name] char(11) NOT NULL,

	--/ <summary> [*] UZC multiplicity, * if multiple </summary>
	--/ <quantity>meta.code.multip</quantity>
	[UZC] char(1) NOT NULL,

	--/ <summary> [PTG] NED multiplicity: Pair, Triple, Group  </summary>
	--/ <quantity>meta.code.multip</quantity>
	[mul] char(1) NOT NULL,

	CONSTRAINT [PK_SpecObj] PRIMARY KEY CLUSTERED
(
	[seqID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

