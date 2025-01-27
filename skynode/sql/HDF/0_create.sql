--/ <dataset>
--/ <summary> Hubble Deep Field </summary>
--/ <remarks>
--/ The Hubble Deep Field (HDF) is a Director's Discretionary program on HST in Cycle 5 to image a 
--/ typical field at high galactic latitude in four wavelength passbands as deeply as reasonably 
--/ possible. In order to optimize observing in the time available, a field in the northern continuous 
--/ viewing zone (CVZ) was selected and images were taken for 10 consecutive days, or approximately 
--/ 150 orbits. Shorter 1-orbit images were also obtained of the fields immediately adjacent to the 
--/ primary HDF in order to facilitate spectroscopic follow-up by ground-based telescopes. The 
--/ observations were carried out from 18-30 December 1995, and the data are available to the 
--/ community for study.
--/ </remarks>
--/ <url>http://www.stsci.edu/ftp/science/hdf/hdf.html</url>
--/ <icon>hdf.png</icon>
--/ <docpage>hdf.html</docpage>
--/ </dataset>
 GO
 
-- CREATE PhotoObj TABLE

--/ <summary></summary>
--/ <remarks></remarks>
CREATE TABLE dbo.PhotoObj
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

	--/ <summary> This is the FOCAS catalog entry number. The numbers after the decimal point indicate the level of splitting.
	--/ Both parents and daughters are included in the catalog shown here. Thus many objects are included repeatedly in the catalog,
	--/ both as part of the parent and as a separate daughter entry. </summary>
	--/ <quantity>meta.id</quantity>
	[objID] char(14) NOT NULL,

	--/ <summary> The x pixel position of each object, as defined by brightest pixel within the 3x3 pixel grid with the greatest 
	--/ luminosity within the detection area. For objects with a bright off-center peak, this position can be significantly different 
	--/ from the weighted center of the luminosity distribution within the detection area. For the HDF, such differences are typically 
	--/ less than 0.1 arsces.</summary>
	--/ <quantity>pos.cartesian.x;obs.image</quantity>
	--/ <unit> pix </unit>
	[x] real NOT NULL,

	--/ <summary> The y pixel position of each object, as defined by brightest pixel within the 3x3 pixel grid with the greatest 
	--/ luminosity within the detection area. For objects with a bright off-center peak, this position can be significantly different 
	--/ from the weighted center of the luminosity distribution within the detection area. For the HDF, such differences are typically 
	--/ less than 0.1 arsces. </summary>
	--/ <quantity>pos.cartesian.y;obs.image</quantity>
	--/ <unit> pix </unit>
	[y] real NOT NULL,

	--/ <summary> Degrees of the right ascension corresponding to the x, y centers, epoch J2000. </summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit> deg</unit>
	[ra] float NOT NULL,

	--/ <summary> Degrees of the declination corresponding to the x, y centers, epoch J2000. </summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit> deg  </unit>
	[dec] float NOT NULL,

	--/ <summary> Total magnitude. The magnitudes of the detected sources in the F606W image. 
	--/ These magnitudes are in he AB system, where m = -2,5 log f_v � 48.60. The �isophotal� 
	--/ magnitude mi is determined from the sum of the counts within the detection isophote. 
	--/ The �total magnitude is computed from the number of counts within a �grown� area. 
	--/ The total area is determined by first filling in any x or y concavities in the isophote 
	--/ shape and then adding by rings around the object until the area exceeds the detection
	--/ area by at least a factor of two. For daughter objects, the total magnitude is divided
	--/ between the daughters in proportion to their isophotal luminosities. The isophoal
	--/ mangitudes correspond to the higher isophotes at which the object broke into multiple components. </summary>
	--/ <quantity>phot.mag</quantity>	
	--/ <unit>mag</unit>
	[mt] real NOT NULL,

	--/ <summary> Tells if the value in the mt column is an upper/lower limit. </summary>
	--/ <quantity>meta.note;phot.mag</quantity>
	[mt_limit] char(5) NOT NULL,

	--/ <summary> Isophotal magnitude. The magnitudes of the detected sources in the F606W image. 
	--/ These magnitudes are in he AB system, where m = -2,5 log f_v � 48.60. The �isophotal� 
	--/ magnitude mi is determined from the sum of the counts within the detection isophote. 
	--/ The �total magnitude is computed from the number of counts within a �grown� area. 
	--/ The total area is determined by first filling in any x or y concavities in the isophote 
	--/ shape and then adding by rings around the object until the area exceeds the detection
	--/ area by at least a factor of two. For daughter objects, the total magnitude is divided
	--/ between the daughters in proportion to their isophotal luminosities. The isophoal
	--/ mangitudes correspond to the higher isophotes at which the object broke into multiple components.  </summary>
	--/ <quantity>phot.mag.isophotal</quantity>
	--/ <unit>mag</unit>
	[mi] real NOT NULL,

	--/ <summary> Tells if the value in the mi column is an upper/lower limit. </summary>
	--/ <quantity>meta.note;phot.mag.isophotal</quantity>
	[mi_limit] char(5) NOT NULL,

	--/ <summary> Colors within the detection area. These are essentially isophotal colors measured to a 
	--/ faint limiting isophote defined from the summed F606W+F814W image. They are expressed in the AB system.  
	--/ (Our preferred notation for these colors is U_300 � B_450, B_450 � V606, and V_606 � I_814, to avoid  
	--/ confusion with the ground based Johnson and Str�mgren systems. Galaxies where one band is a non-detection,  
	--/ as defined by having signal-to-noise ration S/N&lt;2 within one of the bands, are marked as upper or lower  
	--/ limits (depending on which band drops out, see column xxx_limit). If both bands are upper limits, no color is given (-99). </summary>
	--/ <quantity>phot.color;em.opt.U;em.opt.B</quantity>
	[U_B] real NOT NULL,

	--/ <summary> Galaxies where one band is a non-detection,  as defined by having signal-to-noise ratio S/N&lt;2 within one of the bands, 
	--/ are marked as upper, lower or both limits (depending on which band drops out). </summary>
	--/ <quantity>meta.note;phot.color</quantity>
	[U_B_limit] char(5) NOT NULL,

	--/ <summary> Colors within the detection area. These are essentially isophotal colors measured to a 
	--/ faint limiting isophote defined from the summed F606W+F814W image. They are expressed in the AB system.  
	--/ (Our preferred notation for these colors is U_300 � B_450, B_450 � V606, and V_606 � I_814, to avoid  
	--/ confusion with the ground based Johnson and Str�mgren systems. Galaxies where one band is a non-detection,  
	--/ as defined by having signal-to-noise ration S/N&lt;2 within one of the bands, are marked as upper or lower  
	--/ limits (depending on which band drops out, see column xxx_limit). If both bands are upper limits, no color is given (-99).  </summary>
	--/ <quantity>phot.color;em.opt.B;em.opt.V</quantity>
	[B_V] real NOT NULL,

	--/ <summary> Galaxies where one band is a non-detection,  as defined by having signal-to-noise ratio S/N&lt;2 within one of the bands, 
	--/ are marked as upper, lower or both limits (depending on which band drops out). </summary>
	--/ <quantity>meta.note;phot.color</quantity>
	[B_V_limit] char(5) NOT NULL,

	--/ <summary> Colors within the detection area. These are essentially isophotal colors measured to a 
	--/ faint limiting isophote defined from the summed F606W+F814W image. They are expressed in the AB system.  
	--/ (Our preferred notation for these colors is U_300 � B_450, B_450 � V606, and V_606 � I_814, to avoid  
	--/ confusion with the ground based Johnson and Str�mgren systems. Galaxies where one band is a non-detection,  
	--/ as defined by having signal-to-noise ration S/N&lt;2 within one of the bands, are marked as upper or lower  
	--/ limits (depending on which band drops out, see column xxx_limit). If both bands are upper limits, no color is given (-99).  </summary>
	--/ <quantity>phot.color;em.opt.V;em.opt.I</quantity>
	[V_I] real NOT NULL,

	--/ <summary> Galaxies where one band is a non-detection,  as defined by having signal-to-noise ratio S/N&lt;2 within one of the bands, 
	--/ are marked as upper, lower or both limits (depending on which band drops out). </summary>
	--/ <quantity>meta.note;phot.color</quantity>
	[V_I_limit] char(5) NOT NULL,

	--/ <summary> The signal-to-noise ratio of the detection in the summed F606W+F814W image, based on a semi-empirical noise model. (See 1996AJ....112.1335W) </summary>
	--/ <quantity>stat.snr</quantity>
	[SN] real NOT NULL,

	--/ <summary> Area in pixels within the detection isophote. </summary>
	--/ <quantity>phys.size.area</quantity>
	--/ <unit> pix </unit>
	[area] real NOT NULL,

	--/ <summary> Intensity-weighted first-moment radius determined from pixels within the detection isophote. The radii are determined relative 
	--/ to the x,y centers listed in the catalog. </summary>
	--/ <quantity>phyas.angSize.radius</quantity>
	--/ <unit> arcsec </unit>
	[r1] real NOT NULL,

	--/ <summary> The intensity-weighted axial ratio taken from the second moment of the light distribution </summary>
	--/ <quantity>phys.size.axisRatio</quantity>
	[bpa] real NOT NULL,

	--/ <summary> The intensity weighted position angle defined such that an object pointing North-South has Phi = 0, 
	--/ and the position angle increase as the major axis of the object rotates toward the east. (For further details see 1996AJ....112.1335W .)</summary>
	--/ <quantity>pos.posAng</quantity>
	[PA] real NOT NULL,

	--/ <summary> S indicates that the source is a single object (not split into subcomponents). B indicates that the outer 
	--/ isophote of the source overlaps a chip boundary in one or more banpasses. F indicates that object components originally 
	--/ detected by FOCAS were manually merged back into their parent. </summary>
	--/ <quantity>meta.code</quantity>
	[Flags] char(3) NOT NULL,

	CONSTRAINT [PK_PhotoObj] PRIMARY KEY CLUSTERED
(
	[objID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

