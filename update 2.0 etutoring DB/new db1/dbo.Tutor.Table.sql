USE [eTotoring]
GO
/****** Object:  Table [dbo].[Tutor]    Script Date: 11/08/2019 5:15:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tutor](
	[T_ID] [int] IDENTITY(1,1) NOT NULL,
	[T_Name] [varchar](max) NOT NULL,
	[Username] [varchar](max) NOT NULL,
	[Email] [varchar](max) NOT NULL,
	[Password] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Tutor] PRIMARY KEY CLUSTERED 
(
	[T_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
