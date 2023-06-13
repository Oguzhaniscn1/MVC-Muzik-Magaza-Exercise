USE [master]
GO
/****** Object:  Database [mmagaza]    Script Date: 7.06.2023 21:35:52 ******/
CREATE DATABASE [mmagaza]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'mmagaza', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\mmagaza.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'mmagaza_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\mmagaza_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [mmagaza] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [mmagaza].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [mmagaza] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [mmagaza] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [mmagaza] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [mmagaza] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [mmagaza] SET ARITHABORT OFF 
GO
ALTER DATABASE [mmagaza] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [mmagaza] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [mmagaza] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [mmagaza] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [mmagaza] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [mmagaza] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [mmagaza] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [mmagaza] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [mmagaza] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [mmagaza] SET  DISABLE_BROKER 
GO
ALTER DATABASE [mmagaza] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [mmagaza] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [mmagaza] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [mmagaza] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [mmagaza] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [mmagaza] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [mmagaza] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [mmagaza] SET RECOVERY FULL 
GO
ALTER DATABASE [mmagaza] SET  MULTI_USER 
GO
ALTER DATABASE [mmagaza] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [mmagaza] SET DB_CHAINING OFF 
GO
ALTER DATABASE [mmagaza] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [mmagaza] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [mmagaza] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [mmagaza] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [mmagaza] SET QUERY_STORE = OFF
GO
USE [mmagaza]
GO
/****** Object:  Table [dbo].[tbl_kategori]    Script Date: 7.06.2023 21:35:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_kategori](
	[KategoriID] [int] IDENTITY(1,1) NOT NULL,
	[KategoriAd] [varchar](30) NULL,
 CONSTRAINT [PK_tbl_kategori] PRIMARY KEY CLUSTERED 
(
	[KategoriID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[kategori]    Script Date: 7.06.2023 21:35:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[kategori] as
Select * from tbl_kategori 
GO
/****** Object:  Table [dbo].[tbl_kullanici]    Script Date: 7.06.2023 21:35:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_kullanici](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AdSoyad] [varchar](50) NULL,
	[KullaniciAdi] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Sifre] [varchar](50) NULL,
	[SifreTekrar] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_login]    Script Date: 7.06.2023 21:35:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_login](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Kuladi] [varchar](30) NULL,
	[Sifre] [varchar](30) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_musteri]    Script Date: 7.06.2023 21:35:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_musteri](
	[MusteriID] [int] IDENTITY(1,1) NOT NULL,
	[MusteriAdsoyad] [varchar](50) NULL,
	[Telno] [varchar](20) NULL,
	[TC] [varchar](11) NULL,
	[Adres] [text] NULL,
	[Sehir] [varchar](20) NULL,
	[KulAdi] [varchar](50) NULL,
	[Sifre] [varchar](50) NULL,
	[Yetki] [bit] NULL,
 CONSTRAINT [PK_tbl_musteri] PRIMARY KEY CLUSTERED 
(
	[MusteriID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_satis]    Script Date: 7.06.2023 21:35:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_satis](
	[SatisID] [int] IDENTITY(1,1) NOT NULL,
	[SatisFiyat] [decimal](18, 2) NULL,
	[Satisadet] [int] NULL,
	[Satistarih] [smalldatetime] NULL,
	[Urun] [int] NULL,
	[Musteri] [int] NULL,
 CONSTRAINT [PK_tbl_satis] PRIMARY KEY CLUSTERED 
(
	[SatisID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_urun]    Script Date: 7.06.2023 21:35:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_urun](
	[UrunID] [int] IDENTITY(1,1) NOT NULL,
	[Urunad] [varchar](50) NULL,
	[Marka] [varchar](30) NULL,
	[UrunFiyat] [decimal](18, 2) NULL,
	[UrunStok] [int] NULL,
	[Kategori] [int] NULL,
	[ImagePath] [varchar](max) NULL,
	[UrunAciklama] [varchar](max) NULL,
 CONSTRAINT [PK_tbl_urun] PRIMARY KEY CLUSTERED 
(
	[UrunID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_kategori] ON 

INSERT [dbo].[tbl_kategori] ([KategoriID], [KategoriAd]) VALUES (1, N'ElektroGitar')
INSERT [dbo].[tbl_kategori] ([KategoriID], [KategoriAd]) VALUES (2, N'Bateri')
INSERT [dbo].[tbl_kategori] ([KategoriID], [KategoriAd]) VALUES (3, N'BasGitar')
INSERT [dbo].[tbl_kategori] ([KategoriID], [KategoriAd]) VALUES (4, N'Piyano')
INSERT [dbo].[tbl_kategori] ([KategoriID], [KategoriAd]) VALUES (5, N'Klavye')
INSERT [dbo].[tbl_kategori] ([KategoriID], [KategoriAd]) VALUES (7, N'Efekt')
INSERT [dbo].[tbl_kategori] ([KategoriID], [KategoriAd]) VALUES (17, N'deneme')
INSERT [dbo].[tbl_kategori] ([KategoriID], [KategoriAd]) VALUES (19, N'oguzhan')
INSERT [dbo].[tbl_kategori] ([KategoriID], [KategoriAd]) VALUES (20, N'gökhan')
INSERT [dbo].[tbl_kategori] ([KategoriID], [KategoriAd]) VALUES (21, N'denemeeee')
SET IDENTITY_INSERT [dbo].[tbl_kategori] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_login] ON 

INSERT [dbo].[tbl_login] ([ID], [Kuladi], [Sifre]) VALUES (1, N'Aydintu', N'1234')
SET IDENTITY_INSERT [dbo].[tbl_login] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_musteri] ON 

INSERT [dbo].[tbl_musteri] ([MusteriID], [MusteriAdsoyad], [Telno], [TC], [Adres], [Sehir], [KulAdi], [Sifre], [Yetki]) VALUES (25, N'Oğuzhan İŞCAN', N'05380606214', N'12271801170', N'Ortaköy', N'istanbul', N'oguz', N'1234', 1)
INSERT [dbo].[tbl_musteri] ([MusteriID], [MusteriAdsoyad], [Telno], [TC], [Adres], [Sehir], [KulAdi], [Sifre], [Yetki]) VALUES (26, N'Loli YIKICI', N'05372253036', N'32165498787', N'ataşehir', N'istanbul', N'loli', N'123', 0)
INSERT [dbo].[tbl_musteri] ([MusteriID], [MusteriAdsoyad], [Telno], [TC], [Adres], [Sehir], [KulAdi], [Sifre], [Yetki]) VALUES (27, N'Gökhan Fikret ÖKTEN', N'05392088519', N'74125896321', N'Kadıköy', N'istanbul', N'gökhan', N'123', 0)
INSERT [dbo].[tbl_musteri] ([MusteriID], [MusteriAdsoyad], [Telno], [TC], [Adres], [Sehir], [KulAdi], [Sifre], [Yetki]) VALUES (28, N'Deniz MERT', N'05322460180', N'25896321458', N'Mecidiyeköy', N'istanbul', N'deniz', N'123', 0)
INSERT [dbo].[tbl_musteri] ([MusteriID], [MusteriAdsoyad], [Telno], [TC], [Adres], [Sehir], [KulAdi], [Sifre], [Yetki]) VALUES (29, N'Gamze SEVİNÇ', N'05357245800', N'85479651234', N'Bahçeşehir', N'istanbul', N'gamze', N'123', 0)
INSERT [dbo].[tbl_musteri] ([MusteriID], [MusteriAdsoyad], [Telno], [TC], [Adres], [Sehir], [KulAdi], [Sifre], [Yetki]) VALUES (30, N'Ege KONAKOĞLU', N'05397168489', N'87412565478', N'Ümraniye', N'istanbul', N'ege', N'123', 0)
INSERT [dbo].[tbl_musteri] ([MusteriID], [MusteriAdsoyad], [Telno], [TC], [Adres], [Sehir], [KulAdi], [Sifre], [Yetki]) VALUES (32, N'dışardan deneme', N'05380626014', N'12271801700', N'orta', N'İstanbul', N'dışardan', N'123', 0)
INSERT [dbo].[tbl_musteri] ([MusteriID], [MusteriAdsoyad], [Telno], [TC], [Adres], [Sehir], [KulAdi], [Sifre], [Yetki]) VALUES (33, N'dışardannn', N'05380626014', N'14754541248', N'asd', N'İstanbul', N'dışardan', N'123', 0)
INSERT [dbo].[tbl_musteri] ([MusteriID], [MusteriAdsoyad], [Telno], [TC], [Adres], [Sehir], [KulAdi], [Sifre], [Yetki]) VALUES (34, N'dışardan deneme', N'05380606214', N'12271801170', N'Ortaköy', N'istanbul', N'dışardan', N'oguz123', 1)
INSERT [dbo].[tbl_musteri] ([MusteriID], [MusteriAdsoyad], [Telno], [TC], [Adres], [Sehir], [KulAdi], [Sifre], [Yetki]) VALUES (35, N'Selin Menek', N'05380626014', N'12271821170', N'LA', N'ABD', N'menek', N'1234', 0)
SET IDENTITY_INSERT [dbo].[tbl_musteri] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_satis] ON 

INSERT [dbo].[tbl_satis] ([SatisID], [SatisFiyat], [Satisadet], [Satistarih], [Urun], [Musteri]) VALUES (11, CAST(1500.00 AS Decimal(18, 2)), 1, CAST(N'2023-06-03T04:10:00' AS SmallDateTime), 22, 25)
INSERT [dbo].[tbl_satis] ([SatisID], [SatisFiyat], [Satisadet], [Satistarih], [Urun], [Musteri]) VALUES (13, CAST(4500.00 AS Decimal(18, 2)), 3, CAST(N'2023-06-04T21:52:00' AS SmallDateTime), 22, 25)
INSERT [dbo].[tbl_satis] ([SatisID], [SatisFiyat], [Satisadet], [Satistarih], [Urun], [Musteri]) VALUES (14, CAST(1500.00 AS Decimal(18, 2)), 1, CAST(N'2023-06-07T12:43:00' AS SmallDateTime), 24, 25)
INSERT [dbo].[tbl_satis] ([SatisID], [SatisFiyat], [Satisadet], [Satistarih], [Urun], [Musteri]) VALUES (15, CAST(1500.00 AS Decimal(18, 2)), 1, CAST(N'2023-06-07T12:46:00' AS SmallDateTime), 25, 25)
INSERT [dbo].[tbl_satis] ([SatisID], [SatisFiyat], [Satisadet], [Satistarih], [Urun], [Musteri]) VALUES (16, CAST(1500.00 AS Decimal(18, 2)), 1, CAST(N'2023-06-07T12:48:00' AS SmallDateTime), 24, 26)
INSERT [dbo].[tbl_satis] ([SatisID], [SatisFiyat], [Satisadet], [Satistarih], [Urun], [Musteri]) VALUES (17, CAST(1500.00 AS Decimal(18, 2)), 1, CAST(N'2023-06-07T17:18:00' AS SmallDateTime), 24, 25)
INSERT [dbo].[tbl_satis] ([SatisID], [SatisFiyat], [Satisadet], [Satistarih], [Urun], [Musteri]) VALUES (18, CAST(1500.00 AS Decimal(18, 2)), 1, CAST(N'2023-06-07T17:21:00' AS SmallDateTime), 24, 25)
INSERT [dbo].[tbl_satis] ([SatisID], [SatisFiyat], [Satisadet], [Satistarih], [Urun], [Musteri]) VALUES (19, CAST(1500.00 AS Decimal(18, 2)), 1, CAST(N'2023-06-07T17:24:00' AS SmallDateTime), 24, 25)
INSERT [dbo].[tbl_satis] ([SatisID], [SatisFiyat], [Satisadet], [Satistarih], [Urun], [Musteri]) VALUES (20, CAST(1500.00 AS Decimal(18, 2)), 1, CAST(N'2023-06-07T17:25:00' AS SmallDateTime), 24, 29)
INSERT [dbo].[tbl_satis] ([SatisID], [SatisFiyat], [Satisadet], [Satistarih], [Urun], [Musteri]) VALUES (21, CAST(1500.00 AS Decimal(18, 2)), 1, CAST(N'2023-06-07T17:29:00' AS SmallDateTime), 24, 29)
INSERT [dbo].[tbl_satis] ([SatisID], [SatisFiyat], [Satisadet], [Satistarih], [Urun], [Musteri]) VALUES (22, CAST(1500.00 AS Decimal(18, 2)), 1, CAST(N'2023-06-07T17:29:00' AS SmallDateTime), 24, 29)
INSERT [dbo].[tbl_satis] ([SatisID], [SatisFiyat], [Satisadet], [Satistarih], [Urun], [Musteri]) VALUES (23, CAST(1500.00 AS Decimal(18, 2)), 1, CAST(N'2023-06-07T17:32:00' AS SmallDateTime), 24, 29)
INSERT [dbo].[tbl_satis] ([SatisID], [SatisFiyat], [Satisadet], [Satistarih], [Urun], [Musteri]) VALUES (24, CAST(1500.00 AS Decimal(18, 2)), 1, CAST(N'2023-06-07T17:43:00' AS SmallDateTime), 24, 25)
INSERT [dbo].[tbl_satis] ([SatisID], [SatisFiyat], [Satisadet], [Satistarih], [Urun], [Musteri]) VALUES (25, CAST(1500.00 AS Decimal(18, 2)), 1, CAST(N'2023-06-07T21:07:00' AS SmallDateTime), 24, 35)
SET IDENTITY_INSERT [dbo].[tbl_satis] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_urun] ON 

INSERT [dbo].[tbl_urun] ([UrunID], [Urunad], [Marka], [UrunFiyat], [UrunStok], [Kategori], [ImagePath], [UrunAciklama]) VALUES (22, N'1998 SG', N'Gibson', CAST(1500.00 AS Decimal(18, 2)), 11, 1, N'/Images/dd7c4dd8507d583eb109e3c4beadbade.jpg', N'deneme acıklama')
INSERT [dbo].[tbl_urun] ([UrunID], [Urunad], [Marka], [UrunFiyat], [UrunStok], [Kategori], [ImagePath], [UrunAciklama]) VALUES (23, N'bateri denemesi', N'denememarka', CAST(1500.00 AS Decimal(18, 2)), 12, 2, N'/Images/satis.png', N'acıklama')
INSERT [dbo].[tbl_urun] ([UrunID], [Urunad], [Marka], [UrunFiyat], [UrunStok], [Kategori], [ImagePath], [UrunAciklama]) VALUES (24, N'deneme gitar ', N'denememarka', CAST(1500.00 AS Decimal(18, 2)), 1, 1, N'/Images/satis.png', N'deneme acıklama')
INSERT [dbo].[tbl_urun] ([UrunID], [Urunad], [Marka], [UrunFiyat], [UrunStok], [Kategori], [ImagePath], [UrunAciklama]) VALUES (25, N'deneme gitar 2222', N'denememarka', CAST(1500.00 AS Decimal(18, 2)), 11, 1, N'/Images/satis.png', N'deneme acıklama')
INSERT [dbo].[tbl_urun] ([UrunID], [Urunad], [Marka], [UrunFiyat], [UrunStok], [Kategori], [ImagePath], [UrunAciklama]) VALUES (26, N'1998 SG', N'denememarka', CAST(1500.00 AS Decimal(18, 2)), 12, 1, N'/Images/satis.png', N'deneme acıklama')
INSERT [dbo].[tbl_urun] ([UrunID], [Urunad], [Marka], [UrunFiyat], [UrunStok], [Kategori], [ImagePath], [UrunAciklama]) VALUES (27, N'deneme', N'denememarka', CAST(1500.00 AS Decimal(18, 2)), 12, 1, N'/Images/satis.png', N'deneme acıklama')
INSERT [dbo].[tbl_urun] ([UrunID], [Urunad], [Marka], [UrunFiyat], [UrunStok], [Kategori], [ImagePath], [UrunAciklama]) VALUES (28, N'deneme', N'asd', CAST(1500.00 AS Decimal(18, 2)), 12, 1, N'/Images/unnamed.jpg', N'deneme acıklama')
INSERT [dbo].[tbl_urun] ([UrunID], [Urunad], [Marka], [UrunFiyat], [UrunStok], [Kategori], [ImagePath], [UrunAciklama]) VALUES (29, N'asd', N'asd', CAST(1500.00 AS Decimal(18, 2)), 23, 1, N'/Images/unnamed.jpg', N'deneme acıklama')
INSERT [dbo].[tbl_urun] ([UrunID], [Urunad], [Marka], [UrunFiyat], [UrunStok], [Kategori], [ImagePath], [UrunAciklama]) VALUES (30, N'local denme', N'local denme', CAST(1500.00 AS Decimal(18, 2)), 12, 4, N'/Images/unnamed.jpg', N'deneme')
SET IDENTITY_INSERT [dbo].[tbl_urun] OFF
GO
ALTER TABLE [dbo].[tbl_satis]  WITH CHECK ADD  CONSTRAINT [FK_tbl_satis_tbl_musteri] FOREIGN KEY([Musteri])
REFERENCES [dbo].[tbl_musteri] ([MusteriID])
GO
ALTER TABLE [dbo].[tbl_satis] CHECK CONSTRAINT [FK_tbl_satis_tbl_musteri]
GO
ALTER TABLE [dbo].[tbl_satis]  WITH CHECK ADD  CONSTRAINT [FK_tbl_satis_tbl_urun] FOREIGN KEY([Urun])
REFERENCES [dbo].[tbl_urun] ([UrunID])
GO
ALTER TABLE [dbo].[tbl_satis] CHECK CONSTRAINT [FK_tbl_satis_tbl_urun]
GO
ALTER TABLE [dbo].[tbl_urun]  WITH CHECK ADD  CONSTRAINT [FK_tbl_urun_tbl_kategori] FOREIGN KEY([Kategori])
REFERENCES [dbo].[tbl_kategori] ([KategoriID])
GO
ALTER TABLE [dbo].[tbl_urun] CHECK CONSTRAINT [FK_tbl_urun_tbl_kategori]
GO
/****** Object:  StoredProcedure [dbo].[Urungetir]    Script Date: 7.06.2023 21:35:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[Urungetir]
As
Select top 1 Marka from tbl_urun group by Marka Order By
COUNT(*) desc
GO
USE [master]
GO
ALTER DATABASE [mmagaza] SET  READ_WRITE 
GO
