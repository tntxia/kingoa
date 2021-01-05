USE [einfoic2009]
GO

/****** Object:  Table [dbo].[zzsp]    Script Date: 01/05/2021 17:09:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[zzsp](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dept] [char](30) NULL,
	[role] [char](15) NULL,
	[dd_man] [char](15) NOT NULL,
	[fif] [char](10) NOT NULL,
	[fspman] [varchar](50) NOT NULL,
	[firspif] [char](10) NULL,
	[firspman] [char](20) NULL,
	[remark] [varchar](350) NULL,
	[dd_date] [datetime] NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

