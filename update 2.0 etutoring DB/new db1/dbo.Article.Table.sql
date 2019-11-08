USE [eTotoring]
GO
/****** Object:  Table [dbo].[Article]    Script Date: 11/08/2019 5:15:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Article](
	[A_ID] [int] IDENTITY(1,1) NOT NULL,
	[S_ID] [int] NOT NULL,
	[Date_Time] [datetime] NOT NULL,
	[Article] [varchar](max) NOT NULL,
	[Article_Path] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Article] PRIMARY KEY CLUSTERED 
(
	[A_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
