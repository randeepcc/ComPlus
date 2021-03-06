USE [Trades]
GO
/****** Object:  Table [dbo].[tbl_Broker]    Script Date: 5/7/2021 11:16:19 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Broker](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[brokerName] [nvarchar](250) NOT NULL,
	[isActive] [bit] NOT NULL,
	[isReconEnabled] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_Broker] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_CurrencyRates]    Script Date: 5/7/2021 11:16:19 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_CurrencyRates](
	[id] [int] NOT NULL,
	[ccy] [nvarchar](10) NOT NULL,
	[ccy_ref] [nvarchar](10) NOT NULL,
	[ccy_rt] [decimal](18, 5) NOT NULL,
	[eff_date] [datetime] NOT NULL,
	[exipry_date] [datetime] NOT NULL,
	[last_modified] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_recon_exceptions]    Script Date: 5/7/2021 11:16:19 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_recon_exceptions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tradeID] [int] NOT NULL,
	[reason] [nvarchar](max) NULL,
	[amountDiff] [decimal](18, 5) NULL,
	[created_date] [datetime] NOT NULL,
	[lastModified_date] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_recon_exceptions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Ticker]    Script Date: 5/7/2021 11:16:19 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Ticker](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Ticker] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](250) NULL,
 CONSTRAINT [PK_tbl_Ticker] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Trade]    Script Date: 5/7/2021 11:16:19 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Trade](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tradeRef] [nvarchar](50) NOT NULL,
	[imntRef] [int] NULL,
	[imntTicker] [nvarchar](50) NOT NULL,
	[tradeDate] [datetime] NOT NULL,
	[valueDate] [datetime] NOT NULL,
	[qty] [int] NOT NULL,
	[buySell] [char](1) NOT NULL,
	[price] [decimal](18, 5) NOT NULL,
 CONSTRAINT [PK_tbl_Trade] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_TradeTransactions]    Script Date: 5/7/2021 11:16:19 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_TradeTransactions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tradeRef] [nvarchar](50) NOT NULL,
	[brokerID] [int] NOT NULL,
	[tickerID] [int] NOT NULL,
	[tradeTypeID] [int] NOT NULL,
	[tradeDate] [date] NOT NULL,
	[valueDate] [date] NOT NULL,
	[price] [decimal](18, 5) NOT NULL,
	[quantity] [int] NOT NULL,
	[create_date] [datetime] NOT NULL,
	[lstmodified_dt] [datetime] NOT NULL,
	[buySell] [char](1) NULL,
	[isReconciled] [bit] NULL,
 CONSTRAINT [PK_tbl_TradeTransactions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Tradetypes]    Script Date: 5/7/2021 11:16:19 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Tradetypes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[trade_Type] [nvarchar](250) NOT NULL,
	[trade_Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_tbl_Tradetypes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_Broker] ON 

INSERT [dbo].[tbl_Broker] ([id], [brokerName], [isActive], [isReconEnabled]) VALUES (1, N'Mike', 1, 1)
INSERT [dbo].[tbl_Broker] ([id], [brokerName], [isActive], [isReconEnabled]) VALUES (2, N'John', 1, 1)
INSERT [dbo].[tbl_Broker] ([id], [brokerName], [isActive], [isReconEnabled]) VALUES (3, N'Randeep', 1, 1)
SET IDENTITY_INSERT [dbo].[tbl_Broker] OFF
SET IDENTITY_INSERT [dbo].[tbl_Ticker] ON 

INSERT [dbo].[tbl_Ticker] ([ID], [Ticker], [Description]) VALUES (1, N'USDHKD', N'USD to HKD')
INSERT [dbo].[tbl_Ticker] ([ID], [Ticker], [Description]) VALUES (2, N'AUDJPY', N'AUD to JPY')
INSERT [dbo].[tbl_Ticker] ([ID], [Ticker], [Description]) VALUES (3, N'USDSGD', N'USD to SGD')
INSERT [dbo].[tbl_Ticker] ([ID], [Ticker], [Description]) VALUES (4, N'INRAED', N'INR to AED')
SET IDENTITY_INSERT [dbo].[tbl_Ticker] OFF
SET IDENTITY_INSERT [dbo].[tbl_TradeTransactions] ON 

INSERT [dbo].[tbl_TradeTransactions] ([id], [tradeRef], [brokerID], [tickerID], [tradeTypeID], [tradeDate], [valueDate], [price], [quantity], [create_date], [lstmodified_dt], [buySell], [isReconciled]) VALUES (1, N'T-FWD-1', 1, 1, 1, CAST(N'2021-07-04' AS Date), CAST(N'2021-07-04' AS Date), CAST(7.77820 AS Decimal(18, 5)), 1000000, CAST(N'2021-07-04T22:19:47.097' AS DateTime), CAST(N'2021-07-04T22:19:47.097' AS DateTime), N'B', 0)
INSERT [dbo].[tbl_TradeTransactions] ([id], [tradeRef], [brokerID], [tickerID], [tradeTypeID], [tradeDate], [valueDate], [price], [quantity], [create_date], [lstmodified_dt], [buySell], [isReconciled]) VALUES (2, N'T-FWD-2', 1, 2, 2, CAST(N'2021-07-05' AS Date), CAST(N'2021-07-05' AS Date), CAST(70.00120 AS Decimal(18, 5)), 8000000, CAST(N'2021-07-05T22:09:46.403' AS DateTime), CAST(N'2021-07-05T22:09:46.403' AS DateTime), N'S', 0)
INSERT [dbo].[tbl_TradeTransactions] ([id], [tradeRef], [brokerID], [tickerID], [tradeTypeID], [tradeDate], [valueDate], [price], [quantity], [create_date], [lstmodified_dt], [buySell], [isReconciled]) VALUES (3, N'T-FWD-3', 1, 3, 1, CAST(N'2021-07-05' AS Date), CAST(N'2021-07-05' AS Date), CAST(1.41320 AS Decimal(18, 5)), 25000000, CAST(N'2021-07-05T22:10:42.580' AS DateTime), CAST(N'2021-07-05T22:10:42.580' AS DateTime), N'B', 0)
INSERT [dbo].[tbl_TradeTransactions] ([id], [tradeRef], [brokerID], [tickerID], [tradeTypeID], [tradeDate], [valueDate], [price], [quantity], [create_date], [lstmodified_dt], [buySell], [isReconciled]) VALUES (4, N'T-FWD-4', 1, 3, 1, CAST(N'2021-07-05' AS Date), CAST(N'2021-07-05' AS Date), CAST(1.41320 AS Decimal(18, 5)), 11000000, CAST(N'2021-07-05T22:10:42.580' AS DateTime), CAST(N'2021-07-05T22:10:42.580' AS DateTime), N'S', 0)
SET IDENTITY_INSERT [dbo].[tbl_TradeTransactions] OFF
SET IDENTITY_INSERT [dbo].[tbl_Tradetypes] ON 

INSERT [dbo].[tbl_Tradetypes] ([id], [trade_Type], [trade_Description]) VALUES (1, N'FX Forward Trades', N'Foriegn exchange forward Trades')
INSERT [dbo].[tbl_Tradetypes] ([id], [trade_Type], [trade_Description]) VALUES (2, N'Bonds', N'Financial Instrument')
SET IDENTITY_INSERT [dbo].[tbl_Tradetypes] OFF
ALTER TABLE [dbo].[tbl_CurrencyRates] ADD  CONSTRAINT [DF_tbl_CurrencyRates_last_modified]  DEFAULT (getdate()) FOR [last_modified]
GO
ALTER TABLE [dbo].[tbl_recon_exceptions] ADD  CONSTRAINT [DF_tbl_recon_exceptions_created_date]  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[tbl_recon_exceptions] ADD  CONSTRAINT [DF_tbl_recon_exceptions_lastModified_date]  DEFAULT (getdate()) FOR [lastModified_date]
GO
/****** Object:  StoredProcedure [dbo].[sp_RetrieveBrokers]    Script Date: 5/7/2021 11:16:20 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Randeep
-- Create date: 08.June.2021
-- Description:	SP to Retrieve Trade records eligible for Reconciliation
-- =============================================
CREATE PROCEDURE [dbo].[sp_RetrieveBrokers]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT id, brokername from tbl_Broker with (NOLOCK);
END
GO
/****** Object:  StoredProcedure [dbo].[sp_RetrieveTradeforRecon]    Script Date: 5/7/2021 11:16:20 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Randeep
-- Create date: 08.June.2021
-- Description:	SP to Retrieve Trade records eligible for Reconciliation
-- =============================================
CREATE PROCEDURE [dbo].[sp_RetrieveTradeforRecon]
	@brokerName	Varchar(250)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
		select TT.TradeRef,TT.ID,TIC.ticker,TT.TradeDate,TT.ValueDate,TT.Quantity,TT.buysell,TT.price 
		from [dbo].[tbl_TradeTransactions] TT Join tbl_Broker TB on TT.brokerID=TB.ID
			join tbl_ticker TIC on TT.tickerID=TIC.ID 
			join tbl_Tradetypes TTY on TT.tradetypeID=TTY.id
		where TB.isActive=1 and 
			TB.isReconEnabled=1 and 
			TT.isReconciled =0 
			and TB.brokerName=@brokerName
		order by TT.TradeDate, TT.TradeRef, TT.buysell
END
GO
/****** Object:  StoredProcedure [dbo].[sp_updReconciliation]    Script Date: 5/7/2021 11:16:20 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Randeep
-- Create date: 08.June.2021
-- Description:	SP to Retrieve Trade records eligible for Reconciliation
-- =============================================
CREATE PROCEDURE [dbo].[sp_updReconciliation]
@brokerName	Varchar(250)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	Update [dbo].[tbl_TradeTransactions] SET isReconciled=1 where brokerid in (
	select id from tbl_broker where brokerName=@brokerName); 
END
GO
