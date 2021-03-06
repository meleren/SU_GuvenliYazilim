USE [SecureDB]
GO
ALTER TABLE [dbo].[SiparisDetay] DROP CONSTRAINT [FK_SiparisDetay_SiparisMaster]
GO
ALTER TABLE [dbo].[FaturaMaster] DROP CONSTRAINT [DF_FaturaMaster_VergiNo]
GO
ALTER TABLE [dbo].[FaturaMaster] DROP CONSTRAINT [DF_FaturaMaster_VergiDaire]
GO
ALTER TABLE [dbo].[FaturaMaster] DROP CONSTRAINT [DF_FaturaMaster_Adres]
GO
ALTER TABLE [dbo].[FaturaMaster] DROP CONSTRAINT [DF_FaturaMaster_BayiId]
GO
ALTER TABLE [dbo].[FaturaDetay] DROP CONSTRAINT [DF_FaturaDetay_SiparisDetayId]
GO
ALTER TABLE [dbo].[FaturaDetay] DROP CONSTRAINT [DF_FaturaDetay_BirimFiyat]
GO
ALTER TABLE [dbo].[FaturaDetay] DROP CONSTRAINT [DF_FaturaDetay_Miktar]
GO
ALTER TABLE [dbo].[FaturaDetay] DROP CONSTRAINT [DF_FaturaDetay_Birim]
GO
ALTER TABLE [dbo].[FaturaDetay] DROP CONSTRAINT [DF_FaturaDetay_UrunId]
GO
ALTER TABLE [dbo].[FaturaDetay] DROP CONSTRAINT [DF_FaturaDetay_MasterId]
GO
/****** Object:  Index [IX_SiparisDetay_1]    Script Date: 26.03.2017 19:48:16 ******/
DROP INDEX [IX_SiparisDetay_1] ON [dbo].[SiparisDetay]
GO
/****** Object:  Index [IX_SiparisDetay]    Script Date: 26.03.2017 19:48:16 ******/
DROP INDEX [IX_SiparisDetay] ON [dbo].[SiparisDetay]
GO
/****** Object:  Index [IX_FaturaDetay_1]    Script Date: 26.03.2017 19:48:16 ******/
DROP INDEX [IX_FaturaDetay_1] ON [dbo].[FaturaDetay]
GO
/****** Object:  Index [IX_FaturaDetay]    Script Date: 26.03.2017 19:48:16 ******/
DROP INDEX [IX_FaturaDetay] ON [dbo].[FaturaDetay]
GO
/****** Object:  Table [dbo].[Urunler]    Script Date: 26.03.2017 19:48:16 ******/
DROP TABLE [dbo].[Urunler]
GO
/****** Object:  Table [dbo].[SiparisMaster]    Script Date: 26.03.2017 19:48:16 ******/
DROP TABLE [dbo].[SiparisMaster]
GO
/****** Object:  Table [dbo].[SiparisDetay]    Script Date: 26.03.2017 19:48:16 ******/
DROP TABLE [dbo].[SiparisDetay]
GO
/****** Object:  Table [dbo].[Kullanici]    Script Date: 26.03.2017 19:48:16 ******/
DROP TABLE [dbo].[Kullanici]
GO
/****** Object:  Table [dbo].[FaturaMaster]    Script Date: 26.03.2017 19:48:16 ******/
DROP TABLE [dbo].[FaturaMaster]
GO
/****** Object:  Table [dbo].[FaturaDetay]    Script Date: 26.03.2017 19:48:16 ******/
DROP TABLE [dbo].[FaturaDetay]
GO
/****** Object:  Table [dbo].[Bayiler]    Script Date: 26.03.2017 19:48:16 ******/
DROP TABLE [dbo].[Bayiler]
GO
/****** Object:  Table [dbo].[Bayiler]    Script Date: 26.03.2017 19:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bayiler](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Tanim] [varchar](100) NOT NULL CONSTRAINT [DF_Bayiler_Tanim]  DEFAULT (''),
	[Adres] [varchar](400) NOT NULL CONSTRAINT [DF_Bayiler_Adres]  DEFAULT (''),
	[VergiDaire] [varchar](30) NOT NULL CONSTRAINT [DF_Bayiler_VergiDaire]  DEFAULT (''),
	[VergiNo] [varchar](30) NOT NULL CONSTRAINT [DF_Bayiler_VergiNo]  DEFAULT (''),
	[Tel] [varchar](20) NOT NULL CONSTRAINT [DF_Bayiler_Tel]  DEFAULT (''),
	[Email] [varchar](40) NULL CONSTRAINT [DF_Bayiler_Email]  DEFAULT (''),
 CONSTRAINT [PK_Bayiler] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FaturaDetay]    Script Date: 26.03.2017 19:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FaturaDetay](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MasterId] [int] NOT NULL,
	[UrunId] [int] NOT NULL,
	[Birim] [varchar](10) NOT NULL,
	[Miktar] [float] NOT NULL,
	[BirimFiyat] [float] NOT NULL,
	[SiparisDetayId] [int] NOT NULL,
 CONSTRAINT [PK_FaturaDetay] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FaturaMaster]    Script Date: 26.03.2017 19:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FaturaMaster](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Tarih] [smalldatetime] NOT NULL,
	[BayiId] [int] NOT NULL,
	[Adres] [varchar](400) NOT NULL,
	[VergiDaire] [varchar](30) NOT NULL,
	[VergiNo] [varchar](30) NOT NULL,
 CONSTRAINT [PK_FaturaMaster] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Kullanici]    Script Date: 26.03.2017 19:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Kullanici](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[KulAdi] [varchar](30) NOT NULL CONSTRAINT [DF_Bayi_KulAdi]  DEFAULT (''),
	[Sifre] [varchar](20) NOT NULL CONSTRAINT [DF_Bayi_Sifre]  DEFAULT (''),
	[Yetki] [int] NOT NULL CONSTRAINT [DF_Bayi_Yetki]  DEFAULT ((0)),
 CONSTRAINT [PK_Bayi] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SiparisDetay]    Script Date: 26.03.2017 19:48:16 ******/
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
/****** Object:  Table [dbo].[SiparisMaster]    Script Date: 26.03.2017 19:48:16 ******/
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
/****** Object:  Table [dbo].[Urunler]    Script Date: 26.03.2017 19:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Urunler](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Tanim] [varchar](100) NOT NULL CONSTRAINT [DF_Urunler_Tanim]  DEFAULT (''),
	[Birim] [varchar](10) NOT NULL CONSTRAINT [DF_Urunler_Birim]  DEFAULT (''),
	[BirimFiyat] [float] NOT NULL CONSTRAINT [DF_Urunler_BirimFiyat]  DEFAULT ((0)),
	[Marka] [varchar](50) NOT NULL CONSTRAINT [DF_Urunler_Marka]  DEFAULT (''),
 CONSTRAINT [PK_Urunler] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Index [IX_FaturaDetay]    Script Date: 26.03.2017 19:48:16 ******/
CREATE NONCLUSTERED INDEX [IX_FaturaDetay] ON [dbo].[FaturaDetay]
(
	[MasterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FaturaDetay_1]    Script Date: 26.03.2017 19:48:16 ******/
CREATE NONCLUSTERED INDEX [IX_FaturaDetay_1] ON [dbo].[FaturaDetay]
(
	[UrunId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SiparisDetay]    Script Date: 26.03.2017 19:48:16 ******/
CREATE NONCLUSTERED INDEX [IX_SiparisDetay] ON [dbo].[SiparisDetay]
(
	[UrunId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SiparisDetay_1]    Script Date: 26.03.2017 19:48:16 ******/
CREATE NONCLUSTERED INDEX [IX_SiparisDetay_1] ON [dbo].[SiparisDetay]
(
	[MasterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FaturaDetay] ADD  CONSTRAINT [DF_FaturaDetay_MasterId]  DEFAULT ((0)) FOR [MasterId]
GO
ALTER TABLE [dbo].[FaturaDetay] ADD  CONSTRAINT [DF_FaturaDetay_UrunId]  DEFAULT ((0)) FOR [UrunId]
GO
ALTER TABLE [dbo].[FaturaDetay] ADD  CONSTRAINT [DF_FaturaDetay_Birim]  DEFAULT ((0)) FOR [Birim]
GO
ALTER TABLE [dbo].[FaturaDetay] ADD  CONSTRAINT [DF_FaturaDetay_Miktar]  DEFAULT ((0)) FOR [Miktar]
GO
ALTER TABLE [dbo].[FaturaDetay] ADD  CONSTRAINT [DF_FaturaDetay_BirimFiyat]  DEFAULT ((0)) FOR [BirimFiyat]
GO
ALTER TABLE [dbo].[FaturaDetay] ADD  CONSTRAINT [DF_FaturaDetay_SiparisDetayId]  DEFAULT ((0)) FOR [SiparisDetayId]
GO
ALTER TABLE [dbo].[FaturaMaster] ADD  CONSTRAINT [DF_FaturaMaster_BayiId]  DEFAULT ((0)) FOR [BayiId]
GO
ALTER TABLE [dbo].[FaturaMaster] ADD  CONSTRAINT [DF_FaturaMaster_Adres]  DEFAULT ('') FOR [Adres]
GO
ALTER TABLE [dbo].[FaturaMaster] ADD  CONSTRAINT [DF_FaturaMaster_VergiDaire]  DEFAULT ('') FOR [VergiDaire]
GO
ALTER TABLE [dbo].[FaturaMaster] ADD  CONSTRAINT [DF_FaturaMaster_VergiNo]  DEFAULT ('') FOR [VergiNo]
GO
ALTER TABLE [dbo].[SiparisDetay]  WITH CHECK ADD  CONSTRAINT [FK_SiparisDetay_SiparisMaster] FOREIGN KEY([MasterId])
REFERENCES [dbo].[SiparisMaster] ([Id])
GO
ALTER TABLE [dbo].[SiparisDetay] CHECK CONSTRAINT [FK_SiparisDetay_SiparisMaster]
GO
