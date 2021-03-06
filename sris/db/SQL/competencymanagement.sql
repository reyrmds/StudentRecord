USE [master]
GO
/****** Object:  Database [competencymanagement_db]    Script Date: 3/25/2018 12:07:10 AM ******/
CREATE DATABASE [competencymanagement_db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'competencymanagement_db', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\competencymanagement_db.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'competencymanagement_db_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\competencymanagement_db_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [competencymanagement_db] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [competencymanagement_db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [competencymanagement_db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [competencymanagement_db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [competencymanagement_db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [competencymanagement_db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [competencymanagement_db] SET ARITHABORT OFF 
GO
ALTER DATABASE [competencymanagement_db] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [competencymanagement_db] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [competencymanagement_db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [competencymanagement_db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [competencymanagement_db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [competencymanagement_db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [competencymanagement_db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [competencymanagement_db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [competencymanagement_db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [competencymanagement_db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [competencymanagement_db] SET  ENABLE_BROKER 
GO
ALTER DATABASE [competencymanagement_db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [competencymanagement_db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [competencymanagement_db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [competencymanagement_db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [competencymanagement_db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [competencymanagement_db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [competencymanagement_db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [competencymanagement_db] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [competencymanagement_db] SET  MULTI_USER 
GO
ALTER DATABASE [competencymanagement_db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [competencymanagement_db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [competencymanagement_db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [competencymanagement_db] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [competencymanagement_db]
GO
/****** Object:  Table [dbo].[tbl_competency]    Script Date: 3/25/2018 12:07:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_competency](
	[competency_id] [int] IDENTITY(1,1) NOT NULL,
	[competency_name] [nvarchar](70) NULL,
	[competency_cluster_id] [int] NULL,
	[competency_type] [nvarchar](50) NULL,
 CONSTRAINT [pk_competency_id] PRIMARY KEY CLUSTERED 
(
	[competency_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_competency_cluster]    Script Date: 3/25/2018 12:07:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_competency_cluster](
	[competency_cluster_id] [int] IDENTITY(1,1) NOT NULL,
	[competency_cluster_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [pk_competency_cluster_id] PRIMARY KEY CLUSTERED 
(
	[competency_cluster_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_competency_status]    Script Date: 3/25/2018 12:07:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_competency_status](
	[competency_status_id] [int] IDENTITY(1,1) NOT NULL,
	[competency_status_emp_id] [int] NOT NULL,
	[competency_status_competency_id] [int] NOT NULL,
	[competency_status_time_stamp] [datetime] NOT NULL CONSTRAINT [def_competency_status_time_stamp]  DEFAULT (getdate()),
	[competency_status_competency_score] [nvarchar](50) NULL DEFAULT ('Basic'),
 CONSTRAINT [pk_stat_id] PRIMARY KEY CLUSTERED 
(
	[competency_status_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_departments]    Script Date: 3/25/2018 12:07:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_departments](
	[dept_id] [int] IDENTITY(1,1) NOT NULL,
	[dept_name] [nvarchar](30) NOT NULL,
	[dept_manager_id] [int] NOT NULL,
 CONSTRAINT [pk_dept_id] PRIMARY KEY CLUSTERED 
(
	[dept_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_employees]    Script Date: 3/25/2018 12:07:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_employees](
	[emp_id] [int] IDENTITY(1,1) NOT NULL,
	[emp_first_name] [nvarchar](50) NULL,
	[emp_last_name] [nvarchar](50) NULL,
	[emp_email] [nvarchar](50) NULL,
	[emp_contact_no] [numeric](20, 0) NULL,
	[emp_manager_id] [int] NULL,
	[emp_job_id] [int] NULL,
 CONSTRAINT [pk_emp_id] PRIMARY KEY CLUSTERED 
(
	[emp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [ui_emp_email] UNIQUE NONCLUSTERED 
(
	[emp_email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_job]    Script Date: 3/25/2018 12:07:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_job](
	[job_id] [int] IDENTITY(1,1) NOT NULL,
	[job_title] [nvarchar](35) NOT NULL,
	[job_dept_id] [int] NULL,
 CONSTRAINT [pk_job_id] PRIMARY KEY CLUSTERED 
(
	[job_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_job_competency]    Script Date: 3/25/2018 12:07:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_job_competency](
	[job_competency_id] [int] IDENTITY(1,1) NOT NULL,
	[job_competency_job_id] [int] NOT NULL,
	[job_competency_competency_id] [int] NOT NULL,
	[job_competency_competency_level] [nvarchar](20) NULL CONSTRAINT [def_job_competency_competency_level]  DEFAULT ('Basic'),
 CONSTRAINT [pk_job_competency_id] PRIMARY KEY CLUSTERED 
(
	[job_competency_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_job_history]    Script Date: 3/25/2018 12:07:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_job_history](
	[hist_emp_id] [int] NOT NULL,
	[hist_start_date] [date] NOT NULL,
	[hist_end_date] [date] NULL,
	[hist_job_id] [int] NOT NULL,
 CONSTRAINT [pk_jhist_emp_id_st_date] PRIMARY KEY CLUSTERED 
(
	[hist_emp_id] ASC,
	[hist_start_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_training]    Script Date: 3/25/2018 12:07:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_training](
	[training_id] [int] IDENTITY(1,1) NOT NULL,
	[training_name] [nvarchar](100) NOT NULL,
	[training_desc] [nvarchar](300) NULL,
	[training_date_from] [datetime] NULL,
	[training_date_to] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[training_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_training_competency]    Script Date: 3/25/2018 12:07:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_training_competency](
	[training_competency_id] [int] IDENTITY(1,1) NOT NULL,
	[training_competency_training_id] [int] NOT NULL,
	[training_competency_competency_id] [int] NOT NULL,
	[training_competency_competency_level] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[training_competency_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[tbl_job_history] ADD  CONSTRAINT [def_hist_start_date]  DEFAULT (getdate()) FOR [hist_start_date]
GO
ALTER TABLE [dbo].[tbl_training_competency] ADD  CONSTRAINT [def_training_competency_competency_level]  DEFAULT ('Basic') FOR [training_competency_competency_level]
GO
ALTER TABLE [dbo].[tbl_competency]  WITH CHECK ADD  CONSTRAINT [fk_competency_cluster_id] FOREIGN KEY([competency_cluster_id])
REFERENCES [dbo].[tbl_competency_cluster] ([competency_cluster_id])
GO
ALTER TABLE [dbo].[tbl_competency] CHECK CONSTRAINT [fk_competency_cluster_id]
GO
ALTER TABLE [dbo].[tbl_competency_status]  WITH CHECK ADD  CONSTRAINT [fk_stat_competency_id] FOREIGN KEY([competency_status_competency_id])
REFERENCES [dbo].[tbl_competency] ([competency_id])
GO
ALTER TABLE [dbo].[tbl_competency_status] CHECK CONSTRAINT [fk_stat_competency_id]
GO
ALTER TABLE [dbo].[tbl_competency_status]  WITH CHECK ADD  CONSTRAINT [fk_stat_emp_id] FOREIGN KEY([competency_status_emp_id])
REFERENCES [dbo].[tbl_employees] ([emp_id])
GO
ALTER TABLE [dbo].[tbl_competency_status] CHECK CONSTRAINT [fk_stat_emp_id]
GO
ALTER TABLE [dbo].[tbl_departments]  WITH CHECK ADD  CONSTRAINT [fk_dept_mgr_id] FOREIGN KEY([dept_manager_id])
REFERENCES [dbo].[tbl_employees] ([emp_id])
GO
ALTER TABLE [dbo].[tbl_departments] CHECK CONSTRAINT [fk_dept_mgr_id]
GO
ALTER TABLE [dbo].[tbl_employees]  WITH CHECK ADD  CONSTRAINT [fk_emp_job_id] FOREIGN KEY([emp_job_id])
REFERENCES [dbo].[tbl_job] ([job_id])
GO
ALTER TABLE [dbo].[tbl_employees] CHECK CONSTRAINT [fk_emp_job_id]
GO
ALTER TABLE [dbo].[tbl_employees]  WITH CHECK ADD  CONSTRAINT [fk_emp_manager_id] FOREIGN KEY([emp_manager_id])
REFERENCES [dbo].[tbl_employees] ([emp_id])
GO
ALTER TABLE [dbo].[tbl_employees] CHECK CONSTRAINT [fk_emp_manager_id]
GO
ALTER TABLE [dbo].[tbl_job]  WITH CHECK ADD  CONSTRAINT [fk_job_dept_id] FOREIGN KEY([job_dept_id])
REFERENCES [dbo].[tbl_departments] ([dept_id])
GO
ALTER TABLE [dbo].[tbl_job] CHECK CONSTRAINT [fk_job_dept_id]
GO
ALTER TABLE [dbo].[tbl_job_competency]  WITH CHECK ADD  CONSTRAINT [fk_job_competency_competency_id] FOREIGN KEY([job_competency_competency_id])
REFERENCES [dbo].[tbl_competency] ([competency_id])
GO
ALTER TABLE [dbo].[tbl_job_competency] CHECK CONSTRAINT [fk_job_competency_competency_id]
GO
ALTER TABLE [dbo].[tbl_job_competency]  WITH CHECK ADD  CONSTRAINT [fk_job_competency_job_id] FOREIGN KEY([job_competency_job_id])
REFERENCES [dbo].[tbl_job] ([job_id])
GO
ALTER TABLE [dbo].[tbl_job_competency] CHECK CONSTRAINT [fk_job_competency_job_id]
GO
ALTER TABLE [dbo].[tbl_job_history]  WITH CHECK ADD  CONSTRAINT [fk_jhist_emp] FOREIGN KEY([hist_emp_id])
REFERENCES [dbo].[tbl_employees] ([emp_id])
GO
ALTER TABLE [dbo].[tbl_job_history] CHECK CONSTRAINT [fk_jhist_emp]
GO
ALTER TABLE [dbo].[tbl_job_history]  WITH CHECK ADD  CONSTRAINT [fk_jhist_job] FOREIGN KEY([hist_job_id])
REFERENCES [dbo].[tbl_job] ([job_id])
GO
ALTER TABLE [dbo].[tbl_job_history] CHECK CONSTRAINT [fk_jhist_job]
GO
ALTER TABLE [dbo].[tbl_training_competency]  WITH CHECK ADD  CONSTRAINT [fk_training_competency_competency_id] FOREIGN KEY([training_competency_competency_id])
REFERENCES [dbo].[tbl_competency] ([competency_id])
GO
ALTER TABLE [dbo].[tbl_training_competency] CHECK CONSTRAINT [fk_training_competency_competency_id]
GO
ALTER TABLE [dbo].[tbl_training_competency]  WITH CHECK ADD  CONSTRAINT [fk_training_competency_training_id] FOREIGN KEY([training_competency_training_id])
REFERENCES [dbo].[tbl_training] ([training_id])
GO
ALTER TABLE [dbo].[tbl_training_competency] CHECK CONSTRAINT [fk_training_competency_training_id]
GO
ALTER TABLE [dbo].[tbl_competency]  WITH NOCHECK ADD  CONSTRAINT [ck_competency_cluster_id] CHECK  ((case when [competency_cluster_id] IS NULL then (0) else (1) end=(1)))
GO
ALTER TABLE [dbo].[tbl_competency] CHECK CONSTRAINT [ck_competency_cluster_id]
GO
ALTER TABLE [dbo].[tbl_job_history]  WITH CHECK ADD  CONSTRAINT [chk_jhist_date_interval] CHECK  (([hist_end_date]>[hist_start_date]))
GO
ALTER TABLE [dbo].[tbl_job_history] CHECK CONSTRAINT [chk_jhist_date_interval]
GO
USE [master]
GO
ALTER DATABASE [competencymanagement_db] SET  READ_WRITE 
GO
