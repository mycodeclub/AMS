USE [AMS]
GO
ALTER TABLE [dbo].[TrainingCenter] DROP CONSTRAINT [FK_TrainingCenter_TrainingCenter]
GO
ALTER TABLE [dbo].[Student] DROP CONSTRAINT [FK_Student_Batch]
GO
ALTER TABLE [dbo].[Login] DROP CONSTRAINT [FK_Login_Login]
GO
ALTER TABLE [dbo].[Attendance] DROP CONSTRAINT [FK_Attendance_Student]
GO
ALTER TABLE [dbo].[Student] DROP CONSTRAINT [DF_Student_CreatedDate]
GO
ALTER TABLE [dbo].[Batch] DROP CONSTRAINT [DF_Batch_CreatedDate]
GO
ALTER TABLE [dbo].[Attendance] DROP CONSTRAINT [DF_Attendance_CreatedDate]
GO
ALTER TABLE [dbo].[Attendance] DROP CONSTRAINT [DF_Attendance_punchOutTime]
GO
ALTER TABLE [dbo].[Attendance] DROP CONSTRAINT [DF_Attendance_punchInTime]
GO
/****** Object:  Table [dbo].[TrainingPartner]    Script Date: 17-02-2019 15:19:41 ******/
DROP TABLE [dbo].[TrainingPartner]
GO
/****** Object:  Table [dbo].[TrainingCenter]    Script Date: 17-02-2019 15:19:41 ******/
DROP TABLE [dbo].[TrainingCenter]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 17-02-2019 15:19:41 ******/
DROP TABLE [dbo].[Student]
GO
/****** Object:  Table [dbo].[Login]    Script Date: 17-02-2019 15:19:41 ******/
DROP TABLE [dbo].[Login]
GO
/****** Object:  Table [dbo].[Batch]    Script Date: 17-02-2019 15:19:41 ******/
DROP TABLE [dbo].[Batch]
GO
/****** Object:  Table [dbo].[Attendance]    Script Date: 17-02-2019 15:19:41 ******/
DROP TABLE [dbo].[Attendance]
GO
USE [master]
GO
/****** Object:  Database [AMS]    Script Date: 17-02-2019 15:19:41 ******/
DROP DATABASE [AMS]
GO
/****** Object:  Database [AMS]    Script Date: 17-02-2019 15:19:41 ******/
CREATE DATABASE [AMS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AMS', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\AMS.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'AMS_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\AMS_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [AMS] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AMS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AMS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AMS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AMS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AMS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AMS] SET ARITHABORT OFF 
GO
ALTER DATABASE [AMS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AMS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AMS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AMS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AMS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AMS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AMS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AMS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AMS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AMS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AMS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AMS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AMS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AMS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AMS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AMS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AMS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AMS] SET  MULTI_USER 
GO
ALTER DATABASE [AMS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AMS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AMS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AMS] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [AMS] SET DELAYED_DURABILITY = DISABLED 
GO
USE [AMS]
GO
/****** Object:  Table [dbo].[Attendance]    Script Date: 17-02-2019 15:19:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendance](
	[AttendanceId] [bigint] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NULL,
	[punchInTime] [datetime] NULL,
	[punchOutTime] [datetime] NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_Attendance] PRIMARY KEY CLUSTERED 
(
	[AttendanceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Batch]    Script Date: 17-02-2019 15:19:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Batch](
	[BatchId] [int] NOT NULL,
	[TrainingCenterId] [int] NULL,
	[BatchDurationInDays] [int] NULL,
	[StartTime] [time](7) NULL,
	[EndTime] [time](7) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_Batch] PRIMARY KEY CLUSTERED 
(
	[BatchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Login]    Script Date: 17-02-2019 15:19:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[loginId] [int] IDENTITY(1,1) NOT NULL,
	[TpId] [int] NULL,
	[UserName] [nvarchar](250) NULL,
	[Password] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL CONSTRAINT [DF_Login_CreatedDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED 
(
	[loginId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Student]    Script Date: 17-02-2019 15:19:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Student](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[CandidateCode] [nvarchar](50) NULL,
	[BatchId] [int] NULL,
	[TrainingCenterId] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[StudentName] [nchar](10) NULL,
	[FatherName] [varchar](250) NULL,
	[MotherName] [varchar](250) NULL,
	[Category] [varchar](10) NULL,
	[Gender] [nchar](6) NULL,
	[District] [varchar](250) NULL,
	[MobileNo] [varchar](16) NULL,
	[DOB] [date] NULL,
	[Age] [int] NULL,
	[SchemeName] [varchar](250) NULL,
	[ReligionName] [varchar](250) NULL,
	[BOCW] [varchar](250) NULL,
	[BPL] [varchar](250) NULL,
	[BlockOrTown] [varchar](250) NULL,
	[Tehsil] [varchar](250) NULL,
	[Village] [varchar](250) NULL,
	[Address] [varchar](max) NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TrainingCenter]    Script Date: 17-02-2019 15:19:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrainingCenter](
	[TrainingCenterId] [int] IDENTITY(1,1) NOT NULL,
	[TpId] [int] NULL,
	[TrainingCenterName] [nvarchar](250) NULL,
 CONSTRAINT [PK_TrainingCenter] PRIMARY KEY CLUSTERED 
(
	[TrainingCenterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TrainingPartner]    Script Date: 17-02-2019 15:19:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrainingPartner](
	[TpId] [int] IDENTITY(1,1) NOT NULL,
	[TrainingPartners] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL CONSTRAINT [DF_TrainingPartner_CreatedDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_TrainingPartner] PRIMARY KEY CLUSTERED 
(
	[TpId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Login] ON 

INSERT [dbo].[Login] ([loginId], [TpId], [UserName], [Password], [CreatedDate]) VALUES (1, 1, N'tp1', N'tp1', CAST(N'2019-02-17 10:44:55.173' AS DateTime))
SET IDENTITY_INSERT [dbo].[Login] OFF
SET IDENTITY_INSERT [dbo].[TrainingCenter] ON 

INSERT [dbo].[TrainingCenter] ([TrainingCenterId], [TpId], [TrainingCenterName]) VALUES (1, NULL, N'Sitapur')
SET IDENTITY_INSERT [dbo].[TrainingCenter] OFF
SET IDENTITY_INSERT [dbo].[TrainingPartner] ON 

INSERT [dbo].[TrainingPartner] ([TpId], [TrainingPartners], [CreatedDate]) VALUES (1, N'Rehan', CAST(N'2019-02-17 10:38:02.040' AS DateTime))
SET IDENTITY_INSERT [dbo].[TrainingPartner] OFF
ALTER TABLE [dbo].[Attendance] ADD  CONSTRAINT [DF_Attendance_punchInTime]  DEFAULT (getdate()) FOR [punchInTime]
GO
ALTER TABLE [dbo].[Attendance] ADD  CONSTRAINT [DF_Attendance_punchOutTime]  DEFAULT (getdate()) FOR [punchOutTime]
GO
ALTER TABLE [dbo].[Attendance] ADD  CONSTRAINT [DF_Attendance_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Batch] ADD  CONSTRAINT [DF_Batch_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Student] ADD  CONSTRAINT [DF_Student_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([StudentId])
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_Student]
GO
ALTER TABLE [dbo].[Login]  WITH CHECK ADD  CONSTRAINT [FK_Login_Login] FOREIGN KEY([TpId])
REFERENCES [dbo].[TrainingPartner] ([TpId])
GO
ALTER TABLE [dbo].[Login] CHECK CONSTRAINT [FK_Login_Login]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Batch] FOREIGN KEY([BatchId])
REFERENCES [dbo].[Batch] ([BatchId])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Batch]
GO
ALTER TABLE [dbo].[TrainingCenter]  WITH CHECK ADD  CONSTRAINT [FK_TrainingCenter_TrainingCenter] FOREIGN KEY([TpId])
REFERENCES [dbo].[TrainingPartner] ([TpId])
GO
ALTER TABLE [dbo].[TrainingCenter] CHECK CONSTRAINT [FK_TrainingCenter_TrainingCenter]
GO
USE [master]
GO
ALTER DATABASE [AMS] SET  READ_WRITE 
GO
