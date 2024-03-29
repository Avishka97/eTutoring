USE [eTotoring]
GO
/****** Object:  Table [dbo].[Message]    Script Date: 10/24/2019 12:24:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Message](
	[M_ID] [int] IDENTITY(1,1) NOT NULL,
	[Date_Time] [datetime] NOT NULL,
	[To_Whom] [varchar](max) NOT NULL,
	[From_Whom] [varchar](max) NOT NULL,
	[Message] [varchar](max) NOT NULL,
	[Sender] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Message] PRIMARY KEY CLUSTERED 
(
	[M_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
