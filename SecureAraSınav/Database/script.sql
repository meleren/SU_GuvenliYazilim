USE [SecureDB]
GO
/****** Object:  Table [dbo].[Bayiler]    Script Date: 03.04.2017 13:04:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bayiler](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Tanim] [varchar](100) NULL,
	[Adres] [varchar](400) NULL,
	[VergiDaire] [varchar](30) NULL,
	[VergiNo] [varchar](30) NULL,
	[Tel] [varchar](20) NULL,
	[Email] [varchar](40) NULL,
 CONSTRAINT [PK_Bayiler] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FaturaDetay]    Script Date: 03.04.2017 13:04:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FaturaDetay](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MasterId] [int] NOT NULL CONSTRAINT [DF_FaturaDetay_MasterId]  DEFAULT ((0)),
	[UrunId] [int] NOT NULL CONSTRAINT [DF_FaturaDetay_UrunId]  DEFAULT ((0)),
	[Birim] [varchar](10) NOT NULL CONSTRAINT [DF_FaturaDetay_Birim]  DEFAULT ((0)),
	[Miktar] [float] NOT NULL CONSTRAINT [DF_FaturaDetay_Miktar]  DEFAULT ((0)),
	[BirimFiyat] [float] NOT NULL CONSTRAINT [DF_FaturaDetay_BirimFiyat]  DEFAULT ((0)),
	[SiparisDetayId] [int] NULL,
 CONSTRAINT [PK_FaturaDetay] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FaturaMaster]    Script Date: 03.04.2017 13:04:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FaturaMaster](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Tarih] [smalldatetime] NOT NULL,
	[BayiId] [int] NOT NULL CONSTRAINT [DF_FaturaMaster_BayiId]  DEFAULT ((0)),
	[Adres] [varchar](400) NOT NULL CONSTRAINT [DF_FaturaMaster_Adres]  DEFAULT (''),
	[VergiDaire] [varchar](30) NOT NULL CONSTRAINT [DF_FaturaMaster_VergiDaire]  DEFAULT (''),
	[VergiNo] [varchar](30) NOT NULL CONSTRAINT [DF_FaturaMaster_VergiNo]  DEFAULT (''),
 CONSTRAINT [PK_FaturaMaster] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Kullanici]    Script Date: 03.04.2017 13:04:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Kullanici](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[KulAdi] [varchar](30) NOT NULL CONSTRAINT [DF_Bayi_KulAdi]  DEFAULT (''),
	[Tanim] [varchar](100) NOT NULL CONSTRAINT [DF_Bayi_Tanim]  DEFAULT (''),
	[Adres] [varchar](400) NOT NULL CONSTRAINT [DF_Bayi_Adres]  DEFAULT (''),
	[VergiDaire] [varchar](30) NOT NULL CONSTRAINT [DF_Table_1_VDaire]  DEFAULT (''),
	[VergiNo] [varchar](30) NOT NULL CONSTRAINT [DF_Table_1_VDaire1]  DEFAULT (''),
	[Tel] [varchar](20) NOT NULL CONSTRAINT [DF_Bayi_Tel]  DEFAULT (''),
	[Email] [varchar](40) NULL CONSTRAINT [DF_Table_1_Tel1]  DEFAULT (''),
	[Yetki] [smallint] NULL,
	[Sifre] [varchar](20) NOT NULL,
	[BayiId] [int] NOT NULL CONSTRAINT [DF_Kullanici_BayiId]  DEFAULT ((0)),
 CONSTRAINT [PK_Kullanici] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SiparisDetay]    Script Date: 03.04.2017 13:04:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SiparisDetay](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MasterId] [int] NOT NULL CONSTRAINT [DF_SiparisDetay_MasterId]  DEFAULT ((0)),
	[UrunId] [int] NOT NULL CONSTRAINT [DF_SiparisDetay_UrunId]  DEFAULT ((0)),
	[Birim] [varchar](10) NOT NULL CONSTRAINT [DF_SiparisDetay_Birim]  DEFAULT ((0)),
	[Miktar] [float] NOT NULL CONSTRAINT [DF_SiparisDetay_Miktar]  DEFAULT ((0)),
	[BirimFiyat] [float] NOT NULL CONSTRAINT [DF_SiparisDetay_BirimFiyat]  DEFAULT ((0)),
 CONSTRAINT [PK_SiparisDetay] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SiparisMaster]    Script Date: 03.04.2017 13:04:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SiparisMaster](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Tarih] [smalldatetime] NOT NULL,
	[BayiId] [int] NOT NULL CONSTRAINT [DF_SiparisMaster_BayiId]  DEFAULT ((0)),
 CONSTRAINT [PK_SiparisMaster] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Urunler]    Script Date: 03.04.2017 13:04:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Urunler](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Tanim] [varchar](100) NULL,
	[Birim] [varchar](10) NULL,
	[BirimFiyat] [float] NULL,
	[Marka] [varchar](50) NULL,
 CONSTRAINT [PK_Urunler] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Kullanici]  WITH CHECK ADD  CONSTRAINT [FK_Kullanici_Kullanici] FOREIGN KEY([Id])
REFERENCES [dbo].[Kullanici] ([Id])
GO
ALTER TABLE [dbo].[Kullanici] CHECK CONSTRAINT [FK_Kullanici_Kullanici]
GO
ALTER TABLE [dbo].[SiparisDetay]  WITH CHECK ADD  CONSTRAINT [FK_SiparisDetay_SiparisMaster] FOREIGN KEY([MasterId])
REFERENCES [dbo].[SiparisMaster] ([Id])
GO
ALTER TABLE [dbo].[SiparisDetay] CHECK CONSTRAINT [FK_SiparisDetay_SiparisMaster]
GO
