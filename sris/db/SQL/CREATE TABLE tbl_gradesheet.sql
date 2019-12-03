USE [sris_db]
GO

/****** Object:  Table [dbo].[tbl_gradesheet]    Script Date: 3/29/2018 8:07:51 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tbl_gradesheet](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[section] [nvarchar](50) NULL,
	[semester] [nvarchar](50) NULL,
	[sy] [nvarchar](50) NULL,
	[subject_id] [int] NULL,
	[faculty_id] [int] NULL,
	[isdeleted] [bit] NULL DEFAULT ('0'),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[tbl_gradesheet]  WITH CHECK ADD FOREIGN KEY([faculty_id])
REFERENCES [dbo].[tbl_faculty] ([id])
GO

ALTER TABLE [dbo].[tbl_gradesheet]  WITH CHECK ADD FOREIGN KEY([subject_id])
REFERENCES [dbo].[tbl_subject] ([id])
GO


