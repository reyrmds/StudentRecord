USE [master]
GO
/****** Object:  Database [sris_db]    Script Date: 4/14/2018 6:57:19 PM ******/
CREATE DATABASE [sris_db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'sris_db', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\sris_db.mdf' , SIZE = 24640KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'sris_db_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\sris_db_log.ldf' , SIZE = 94528KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [sris_db] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [sris_db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [sris_db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [sris_db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [sris_db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [sris_db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [sris_db] SET ARITHABORT OFF 
GO
ALTER DATABASE [sris_db] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [sris_db] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [sris_db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [sris_db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [sris_db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [sris_db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [sris_db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [sris_db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [sris_db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [sris_db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [sris_db] SET  ENABLE_BROKER 
GO
ALTER DATABASE [sris_db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [sris_db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [sris_db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [sris_db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [sris_db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [sris_db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [sris_db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [sris_db] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [sris_db] SET  MULTI_USER 
GO
ALTER DATABASE [sris_db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [sris_db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [sris_db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [sris_db] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [sris_db]
GO
/****** Object:  Table [dbo].[COMPILED]    Script Date: 4/14/2018 6:57:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COMPILED](
	[STUDENT NUMBER] [nvarchar](255) NULL,
	[STUDENT NAME] [nvarchar](255) NULL,
	[FINAL GRADE] [float] NULL,
	[REMARKS] [nvarchar](255) NULL,
	[SUBJECT CODE] [nvarchar](255) NULL,
	[DESCRIPTION] [nvarchar](255) NULL,
	[NO#of UNIT] [float] NULL,
	[YEAR/SEC] [nvarchar](255) NULL,
	[SEMESTER] [nvarchar](255) NULL,
	[SCHOOL YEAR] [nvarchar](255) NULL,
	[PROFESSOR] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ref_subject_curriculum]    Script Date: 4/14/2018 6:57:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ref_subject_curriculum](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[curriculum_id] [int] NULL,
	[subject_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sris]    Script Date: 4/14/2018 6:57:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sris](
	[STUDENT_NUMBER] [nvarchar](255) NULL,
	[STUDENT_NAME] [nvarchar](255) NULL,
	[FINAL_GRADE] [float] NULL,
	[REMARKS] [nvarchar](255) NULL,
	[SUBJECT_CODE] [nvarchar](255) NULL,
	[UNITS] [float] NULL,
	[YEAR_SECTION] [nvarchar](255) NULL,
	[SEMESTER] [nvarchar](255) NULL,
	[SY] [nvarchar](255) NULL,
	[STUDENT_ID] [int] NULL,
	[SUBJECT_ID] [int] NULL,
	[FACULTY_ID] [int] NULL,
	[FACULTY_NAME] [nvarchar](255) NULL,
	[SUBJECT_DESCRIPTION] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_curriculum]    Script Date: 4/14/2018 6:57:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_curriculum](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[sy] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[sy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_faculty]    Script Date: 4/14/2018 6:57:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_faculty](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](200) NOT NULL,
	[isdeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_faculty_subject]    Script Date: 4/14/2018 6:57:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_faculty_subject](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[faculty_id] [int] NULL,
	[subject_id] [int] NULL,
	[isdeleted] [bit] NULL DEFAULT ('0'),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_record]    Script Date: 4/14/2018 6:57:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_record](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[section] [nvarchar](50) NULL,
	[grade] [nvarchar](50) NULL,
	[remarks] [nvarchar](50) NULL,
	[semester] [nvarchar](50) NULL,
	[sy] [nvarchar](50) NULL,
	[student_id] [int] NULL,
	[subject_id] [int] NULL,
	[isdeleted] [bit] NULL CONSTRAINT [DF_tbl_record_isdeleted]  DEFAULT ((0)),
	[faculty_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_student]    Script Date: 4/14/2018 6:57:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_student](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[number] [nvarchar](50) NULL,
	[name] [nvarchar](100) NULL,
	[isdeleted] [bit] NULL,
 CONSTRAINT [PK_tbl_student] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_subject]    Script Date: 4/14/2018 6:57:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_subject](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](50) NULL,
	[description] [nvarchar](100) NULL,
	[units] [nvarchar](50) NULL,
	[isdeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_users]    Script Date: 4/14/2018 6:57:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fullname] [nvarchar](100) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[role] [nvarchar](20) NOT NULL,
	[isdeleted] [bit] NULL DEFAULT ('0'),
PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[ref_subject_curriculum]  WITH CHECK ADD  CONSTRAINT [fk_sc_curriculum_id] FOREIGN KEY([curriculum_id])
REFERENCES [dbo].[tbl_curriculum] ([id])
GO
ALTER TABLE [dbo].[ref_subject_curriculum] CHECK CONSTRAINT [fk_sc_curriculum_id]
GO
ALTER TABLE [dbo].[ref_subject_curriculum]  WITH CHECK ADD  CONSTRAINT [fk_sc_subject_id] FOREIGN KEY([subject_id])
REFERENCES [dbo].[tbl_subject] ([id])
GO
ALTER TABLE [dbo].[ref_subject_curriculum] CHECK CONSTRAINT [fk_sc_subject_id]
GO
ALTER TABLE [dbo].[tbl_faculty_subject]  WITH CHECK ADD FOREIGN KEY([faculty_id])
REFERENCES [dbo].[tbl_faculty] ([id])
GO
ALTER TABLE [dbo].[tbl_faculty_subject]  WITH CHECK ADD FOREIGN KEY([subject_id])
REFERENCES [dbo].[tbl_subject] ([id])
GO
ALTER TABLE [dbo].[tbl_record]  WITH CHECK ADD FOREIGN KEY([faculty_id])
REFERENCES [dbo].[tbl_faculty] ([id])
GO
ALTER TABLE [dbo].[tbl_record]  WITH CHECK ADD FOREIGN KEY([subject_id])
REFERENCES [dbo].[tbl_subject] ([id])
GO
ALTER TABLE [dbo].[tbl_record]  WITH CHECK ADD  CONSTRAINT [fk_student_id] FOREIGN KEY([student_id])
REFERENCES [dbo].[tbl_student] ([id])
GO
ALTER TABLE [dbo].[tbl_record] CHECK CONSTRAINT [fk_student_id]
GO
USE [master]
GO
ALTER DATABASE [sris_db] SET  READ_WRITE 
GO
