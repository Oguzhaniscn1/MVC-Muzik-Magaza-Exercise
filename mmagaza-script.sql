USE [master]
GO
/****** Object:  Database [mmagaza]    Script Date: 14.06.2023 07:47:23 ******/
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
/****** Object:  Table [dbo].[tbl_kategori]    Script Date: 14.06.2023 07:47:23 ******/
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
/****** Object:  View [dbo].[kategori]    Script Date: 14.06.2023 07:47:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[kategori] as
Select * from tbl_kategori 
GO
/****** Object:  Table [dbo].[tbl_kullanici]    Script Date: 14.06.2023 07:47:23 ******/
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
/****** Object:  Table [dbo].[tbl_login]    Script Date: 14.06.2023 07:47:23 ******/
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
/****** Object:  Table [dbo].[tbl_musteri]    Script Date: 14.06.2023 07:47:23 ******/
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
/****** Object:  Table [dbo].[tbl_satis]    Script Date: 14.06.2023 07:47:23 ******/
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
/****** Object:  Table [dbo].[tbl_urun]    Script Date: 14.06.2023 07:47:23 ******/
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
/****** Object:  StoredProcedure [dbo].[Urungetir]    Script Date: 14.06.2023 07:47:23 ******/
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
