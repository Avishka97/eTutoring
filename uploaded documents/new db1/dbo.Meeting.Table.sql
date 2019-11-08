USE [eTotoring]
GO
/****** Object:  Table [dbo].[Meeting]    Script Date: 11/08/2019 5:15:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Meeting](
	[M_ID] [int] IDENTITY(1,1) NOT NULL,
	[S_ID] [int] NOT NULL,
	[T_ID] [int] NOT NULL,
	[Date_Time] [datetime] NOT NULL,
	[Venue] [varchar](max) NOT NULL,
	[Meeting] [varchar](max) NOT NULL,
	[T_Approved] [varchar](max) NULL,
	[Remarks] [varchar](max) NULL,
 CONSTRAINT [PK_Meeting] PRIMARY KEY CLUSTERED 
(
	[M_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
