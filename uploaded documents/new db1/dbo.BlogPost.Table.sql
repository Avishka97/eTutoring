USE [eTotoring]
GO
/****** Object:  Table [dbo].[BlogPost]    Script Date: 11/08/2019 5:15:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BlogPost](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[BContent] [nvarchar](max) NULL,
	[Author] [varchar](50) NOT NULL,
	[BlogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
