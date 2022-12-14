
CREATE TABLE [dbo].[ArticleGroup](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[DistrictId] [int] NOT NULL,
	[HighestHierarchyLevel2] [int] NOT NULL,
	[HighestHierarchyLevel] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[GetOneFreeThreshold_Id] [int] NULL,
 CONSTRAINT [PK_dbo.ArticleGroup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArticleBase]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArticleBase](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](30) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[FixedPrice] [bit] NOT NULL,
	[PurchasePrice] [decimal](18, 2) NOT NULL,
	[OrderLimit] [decimal](18, 2) NOT NULL,
	[TaxPercentIndex] [int] NOT NULL,
	[PriceDistrict] [int] NOT NULL,
	[DecimalDistrict] [bit] NOT NULL,
	[NegativeArticle] [bit] NOT NULL,
	[ZeroPriceAllowed] [bit] NOT NULL,
	[OnlyForVendingMachines] [bit] NOT NULL,
	[MerchandiseTypeId] [int] NOT NULL,
	[Notes] [nvarchar](1000) NULL,
	[TranslatedNotes] [nvarchar](1000) NULL,
	[ImagePath] [nvarchar](50) NULL,
	[MixMatchGroupId] [int] NULL,
	[ArticleTypeId] [int] NULL,
	[TrackStock] [bit] NOT NULL,
	[StockId] [int] NULL,
	[AutomaticQuantity] [decimal](18, 2) NULL,
	[PrintLineTotal] [bit] NOT NULL,
	[EnableVoucher] [bit] NOT NULL,
	[XYZQuantity] [nvarchar](1) NULL,
	[DiscGroupDataEntityId] [int] NULL,
	[ArticleForm] [int] NOT NULL,
	[ResourceStock] [decimal](18, 2) NOT NULL,
	[ResourceSize] [decimal](18, 2) NOT NULL,
	[WebArticleType] [nvarchar](max) NULL,
	[RequiresAdministration] [bit] NOT NULL,
	[Deductable] [bit] NOT NULL,
	[RegistrationDate] [datetime2](7) NOT NULL,
	[LastUpdatedDate] [datetime2](7) NOT NULL,
	[InventoryDate] [datetime2](7) NOT NULL,
	[DistrictId] [int] NOT NULL,
	[HighestHierarchyLevel2] [int] NOT NULL,
	[HighestHierarchyLevel] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Discriminator] [nvarchar](128) NOT NULL,
	[District_Id] [int] NULL,
	[ComparePrice] [decimal](18, 2) NOT NULL,
	[ComparePriceDistrict] [int] NOT NULL,
	[HideArticleUntilDate] [datetime2](7) NULL,
	[ArticleFilterId] [int] NULL,
	[SalaryTypeId] [int] NULL,
	[DeliverMonday] [bit] NOT NULL,
	[DeliverTuesday] [bit] NOT NULL,
	[DeliverWednesday] [bit] NOT NULL,
	[DeliverThursday] [bit] NOT NULL,
	[DeliverFriday] [bit] NOT NULL,
	[DeliverSaturday] [bit] NOT NULL,
	[DeliverSunday] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.ArticleBase] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArticleBaseArticleGroup]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArticleBaseArticleGroup](
	[ArticleBase_Id] [int] NOT NULL,
	[ArticleGroup_Id] [int] NOT NULL,
 CONSTRAINT [PK_dbo.ArticleBaseArticleGroup] PRIMARY KEY CLUSTERED 
(
	[ArticleBase_Id] ASC,
	[ArticleGroup_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ViewArticleBaseArticleGroup]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewArticleBaseArticleGroup]
AS
SELECT
dbo.ArticleBase.Id AS ArticleBaseId, 
dbo.ArticleBaseArticleGroup.ArticleBase_Id AS ArticleBase_Id, 
dbo.ArticleBaseArticleGroup.ArticleGroup_Id AS ArticleGroup_Id, 
dbo.ArticleGroup.HighestHierarchyLevel as HighestHierarchyLevel, 
dbo.ArticleGroup.HighestHierarchyLevel2 as HighestHierarchyLevel2
FROM dbo.ArticleBase INNER JOIN
dbo.ArticleBaseArticleGroup ON dbo.ArticleBase.Id = dbo.ArticleBaseArticleGroup.ArticleBase_Id INNER JOIN
dbo.ArticleGroup ON dbo.ArticleBaseArticleGroup.ArticleGroup_Id = dbo.ArticleGroup.Id
GO
/****** Object:  Table [dbo].[DiscGroup]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscGroup](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[SinglePurchasePerDay] [bit] NOT NULL,
	[GetOneFreeThresholdId] [int] NULL,
	[TaxFree] [bit] NOT NULL,
	[PromptOptionsId] [int] NULL,
	[DefaultForNewTopup] [bit] NOT NULL,
	[DefaultForNewTopupMinValue] [int] NOT NULL,
	[HighestHierarchyLevel2] [int] NOT NULL,
	[HighestHierarchyLevel] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[PriceChannelNumber] [int] NULL,
 CONSTRAINT [PK_dbo.DiscGroup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiscGroupArticleGroup]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscGroupArticleGroup](
	[DiscGroup_Id] [int] NOT NULL,
	[ArticleGroup_Id] [int] NOT NULL,
 CONSTRAINT [PK_dbo.DiscGroupArticleGroup] PRIMARY KEY CLUSTERED 
(
	[DiscGroup_Id] ASC,
	[ArticleGroup_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ViewDiscGroupArticleGroup]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewDiscGroupArticleGroup]
AS
SELECT
dbo.DiscGroupArticleGroup.DiscGroup_Id, dbo.DiscGroupArticleGroup.ArticleGroup_Id, dbo.ArticleGroup.HighestHierarchyLevel, dbo.ArticleGroup.HighestHierarchyLevel2
FROM dbo.DiscGroup INNER JOIN
dbo.DiscGroupArticleGroup ON dbo.DiscGroup.Id = dbo.DiscGroupArticleGroup.DiscGroup_Id INNER JOIN
dbo.ArticleGroup ON dbo.DiscGroupArticleGroup.ArticleGroup_Id = dbo.ArticleGroup.Id
GO
/****** Object:  Table [dbo].[PriceSelector]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PriceSelector](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PriceListIndex] [int] NOT NULL,
	[Priority] [int] NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Note] [nvarchar](1000) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DiscGroup_Id] [int] NULL,
 CONSTRAINT [PK_dbo.PriceSelector] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PriceSelectorArticle]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PriceSelectorArticle](
	[PriceSelector_Id] [int] NOT NULL,
	[Article_Id] [int] NOT NULL,
 CONSTRAINT [PK_dbo.PriceSelectorArticle] PRIMARY KEY CLUSTERED 
(
	[PriceSelector_Id] ASC,
	[Article_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ViewPriceSelectorArticle]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewPriceSelectorArticle]
AS
SELECT
dbo.PriceSelectorArticle.PriceSelector_Id, dbo.PriceSelectorArticle.Article_Id, dbo.ArticleBase.HighestHierarchyLevel2, dbo.ArticleBase.HighestHierarchyLevel
FROM dbo.PriceSelector INNER JOIN
dbo.PriceSelectorArticle ON dbo.PriceSelector.Id = dbo.PriceSelectorArticle.PriceSelector_Id INNER JOIN
dbo.ArticleBase ON dbo.PriceSelectorArticle.Article_Id = dbo.ArticleBase.Id
GO
/****** Object:  Table [dbo].[TransactionPaymentRow]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionPaymentRow](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MediaType] [int] NOT NULL,
	[ReportPaymentMediaCode] [int] NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[MediaDescription] [nvarchar](128) NULL,
	[SuppressSignReceipt] [bit] NOT NULL,
	[SuppressSignLines] [bit] NOT NULL,
	[SignReceiptPrinted] [bit] NOT NULL,
	[SignLinesLabel] [nvarchar](max) NULL,
	[PTMDisc_IsDeleted] [bit] NOT NULL,
	[RegisterId] [int] NULL,
	[ManuallyEntered] [bit] NULL,
	[PTMDisc_DiscNumber] [nvarchar](128) NULL,
	[PTMDisc_DeliveryNoteOnHold] [bit] NULL,
	[PTMDisc_DiscGroupNumber] [int] NULL,
	[PTMDisc_DiscType] [tinyint] NULL,
	[PTMDisc_DiscName] [nvarchar](128) NULL,
	[PTMDisc_DiscCustomerNumber] [nvarchar](128) NULL,
	[PTMDisc_DiscCustomerName] [nvarchar](max) NULL,
	[PTMDisc_DiscValue] [decimal](18, 2) NULL,
	[PTMDisc_DiscAmount] [decimal](18, 2) NULL,
	[PTMDisc_DiscValueAfter] [decimal](18, 2) NULL,
	[PTMDisc_DiscAmountAfter] [decimal](18, 2) NULL,
	[PTMDisc_DiscLastUsed] [datetime2](7) NULL,
	[PTMDisc_CustomerInvoiceRecipient] [nvarchar](128) NULL,
	[PTMDisc_CustomerInvoiceStatus] [int] NULL,
	[PTMDisc_DiscSystemId] [nvarchar](128) NULL,
	[PTMDisc_DiscSection] [nvarchar](128) NULL,
	[PTMDisc_DiscPersonalId] [nvarchar](128) NULL,
	[PTMDisc_PTMVoucherNumber] [nvarchar](128) NULL,
	[CreditDisc_BankName] [nvarchar](max) NULL,
	[CreditDisc_AcquirerRefNo] [nvarchar](max) NULL,
	[CreditDisc_PaymentCode] [nvarchar](max) NULL,
	[CreditDisc_PaymentDateTime] [nvarchar](max) NULL,
	[CreditDisc_TerminalId] [nvarchar](128) NULL,
	[CreditDisc_AuthorizationCode] [nvarchar](max) NULL,
	[CreditDisc_ReferenceNumber] [nvarchar](128) NULL,
	[CreditDisc_ResultMessage] [nvarchar](max) NULL,
	[CreditDisc_MerchantId] [nvarchar](max) NULL,
	[CreditDisc_VerificationMethod] [int] NULL,
	[CreditDisc_DiscTypeId] [nvarchar](128) NULL,
	[CreditDisc_IdDiscNumber] [nvarchar](max) NULL,
	[CreditDisc_DiscHolderName] [nvarchar](max) NULL,
	[CreditDisc_DiscPaymentOptions] [nvarchar](max) NULL,
	[CreditDisc_AuthorizationType] [nvarchar](max) NULL,
	[CreditDisc_DiscTypeDescription] [nvarchar](max) NULL,
	[CreditDisc_UseDiscCreditValue] [nvarchar](max) NULL,
	[CreditDisc_MaskedDiscNumber] [nvarchar](128) NULL,
	[ForeignCurrency_AmountInForeignCurrency] [decimal](18, 2) NULL,
	[ForeignCurrency_ExchangeRate] [decimal](18, 2) NULL,
	[RefundVoucher_VoucherNumber] [nvarchar](128) NULL,
	[Discriminator] [nvarchar](128) NOT NULL,
	[Transaction_Id] [bigint] NOT NULL,
	[PTMDisc_PaymentBatch_Id] [int] NULL,
	[CashBatch_Id] [int] NULL,
	[PTMDisc_DiscEmployeeNumber] [nvarchar](128) NULL,
 CONSTRAINT [PK_dbo.TransactionPaymentRow] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TransactionType] [int] NOT NULL,
	[MigrationId] [uniqueidentifier] NOT NULL,
	[SpecifyDiscountPercent] [bit] NOT NULL,
	[TaxAmount0] [decimal](16, 6) NOT NULL,
	[TaxAmount0_Text] [nvarchar](max) NULL,
	[TaxAmount1] [decimal](16, 6) NOT NULL,
	[TaxAmount1_Text] [nvarchar](max) NULL,
	[TaxAmount2] [decimal](16, 6) NOT NULL,
	[TaxAmount2_Text] [nvarchar](max) NULL,
	[TaxAmount3] [decimal](16, 6) NOT NULL,
	[TaxAmount3_Text] [nvarchar](max) NULL,
	[TaxableSales0] [decimal](16, 6) NOT NULL,
	[TaxableSales1] [decimal](16, 6) NOT NULL,
	[TaxableSales2] [decimal](16, 6) NOT NULL,
	[TaxableSales3] [decimal](16, 6) NOT NULL,
	[TaxableReturns] [decimal](18, 2) NOT NULL,
	[TaxAmountReturns] [decimal](18, 2) NOT NULL,
	[TableOrWebOrderNumber] [nvarchar](128) NULL,
	[PTMWebOrder_PTMDiscNumber] [nvarchar](max) NULL,
	[OrderTypeName] [nvarchar](max) NULL,
	[OrderReference] [nvarchar](128) NULL,
	[Total] [decimal](18, 2) NOT NULL,
	[TotalReturns] [decimal](18, 2) NOT NULL,
	[DateTime] [datetime2](7) NOT NULL,
	[JournalDay] [datetime2](7) NULL,
	[ReceiptPrinted] [bit] NOT NULL,
	[CityRegistrationId] [nvarchar](128) NULL,
	[RecieptNumber] [bigint] NOT NULL,
	[DeliveryNoteNumber] [bigint] NOT NULL,
	[Rounding] [decimal](18, 2) NOT NULL,
	[ReportConnectedArticlesAsSubArticles] [bit] NOT NULL,
	[ClerkId] [nvarchar](128) NULL,
	[ClerkName] [nvarchar](128) NULL,
	[SystemId] [nvarchar](128) NULL,
	[DistrictNumber] [bigint] NOT NULL,
	[DeviceNumber] [bigint] NOT NULL,
	[DistrictName] [nvarchar](max) NULL,
	[DeviceName] [nvarchar](max) NULL,
	[WebTerminalId] [uniqueidentifier] NOT NULL,
	[IsOnlineTransaction] [bit] NOT NULL,
	[FiscalDistrictId] [nvarchar](128) NULL,
	[FiscalDistrictVerificationCode] [nvarchar](max) NULL,
	[PTMDiscNumber] [nvarchar](128) NULL,
	[PTMDiscCustomer] [nvarchar](128) NULL,
	[PTMReportSpender] [nvarchar](128) NULL,
	[PTMReportProject] [nvarchar](128) NULL,
	[PTMReportObject] [nvarchar](128) NULL,
	[PTMReportVerksamhet] [nvarchar](128) NULL,
	[PTMReportGuests] [nvarchar](128) NULL,
	[PTMDiscNumberAttestant] [nvarchar](128) NULL,
	[Account] [nvarchar](128) NULL,
	[OrderNumber] [nvarchar](128) NULL,
	[ClerkReport_Id] [int] NULL,
	[Voucher_Id] [bigint] NULL,
	[Z2ReportQueue_Id] [bigint] NULL,
	[DeviceId] [int] NOT NULL,
	[DistrictId] [int] NOT NULL,
	[HighestHierarchyLevel2] [int] NOT NULL,
	[HighestHierarchyLevel] [int] NOT NULL,
	[CustomerAddressLine1] [nvarchar](max) NULL,
	[CustomerAddressLine2] [nvarchar](max) NULL,
	[CustomerAddressCity] [nvarchar](max) NULL,
	[CustomerAddressPostalCode] [nvarchar](max) NULL,
	[Identifier] [uniqueidentifier] NULL,
	[Exported] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Transaction] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransactionArticleRow]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionArticleRow](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ConnectedType] [int] NOT NULL,
	[AutomaticQuantity] [decimal](18, 2) NULL,
	[PrintLineTotal] [bit] NOT NULL,
	[EnableVoucher] [bit] NOT NULL,
	[XYZQuantity] [char](1) NULL,
	[GroupingKey] [nvarchar](max) NULL,
	[DecimalArticle] [bit] NOT NULL,
	[IsTraining] [bit] NOT NULL,
	[ArticleType] [int] NOT NULL,
	[Quantity] [decimal](18, 2) NOT NULL,
	[Discount] [decimal](18, 2) NOT NULL,
	[SpecifyDiscountPercent] [bit] NOT NULL,
	[TaxAmount] [decimal](16, 6) NOT NULL,
	[TaxPercent] [decimal](18, 2) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[IsPriceSet] [bit] NOT NULL,
	[Name] [nvarchar](128) NULL,
	[KitchenPrinters] [nvarchar](max) NULL,
	[PrintedQuantity] [decimal](18, 2) NOT NULL,
	[Accounting_Account] [nvarchar](max) NULL,
	[Accounting_AccountType] [nvarchar](max) NULL,
	[Accounting_AccountSubType] [nvarchar](max) NULL,
	[Accounting_DeclarationType] [int] NULL,
	[DiscTopUp_Type] [int] NULL,
	[DiscTopUp_Reference1] [nvarchar](128) NULL,
	[DiscTopUp_Reference2] [nvarchar](128) NULL,
	[DiscTopUp_DiscNumber] [nvarchar](128) NULL,
	[DiscTopUp_DiscGroupNumber] [int] NULL,
	[DiscTopUp_DiscCustomer] [nvarchar](max) NULL,
	[DiscTopUp_DiscHolderName] [nvarchar](128) NULL,
	[DiscTopUp_DiscPersonalId] [nvarchar](128) NULL,
	[DiscTopUp_DiscValueAfter] [decimal](18, 2) NULL,
	[DiscTopUp_DiscAmountAfter] [decimal](18, 2) NULL,
	[DiscTopUp_DiscSystemId] [nvarchar](max) NULL,
	[PtmVoucher_Type] [int] NULL,
	[SalesArticle_ReturnKind] [int] NULL,
	[SalesArticle_SupplierId] [nvarchar](max) NULL,
	[SalesArticle_SupplierArticleId] [nvarchar](max) NULL,
	[SalesArticle_StockQuantity] [decimal](18, 2) NULL,
	[SalesArticle_StockNetValue] [decimal](18, 2) NULL,
	[SalesArticle_IsStockArticle] [bit] NULL,
	[SalesArticle_PriceList] [int] NULL,
	[SalesArticle_ProductGroupNumber] [int] NULL,
	[SalesArticle_ProductGroupName] [nvarchar](max) NULL,
	[SalesArticle_MixGroupKey] [nvarchar](128) NULL,
	[SalesArticle_MixGroupDiscountAmount] [decimal](18, 2) NULL,
	[SalesArticle_MixGroupDiscountQuantity] [decimal](18, 2) NULL,
	[SalesArticle_QuantityXDistrict] [nvarchar](max) NULL,
	[SalesArticle_QuantityYDistrict] [nvarchar](max) NULL,
	[SalesArticle_QuantityZDistrict] [nvarchar](max) NULL,
	[SalesArticle_InPrice] [decimal](18, 2) NULL,
	[SalesArticle_ArticleNumber] [nvarchar](max) NULL,
	[SalesArticle_StockGrossValue] [decimal](18, 2) NULL,
	[SalesArticle_QuantityX] [decimal](18, 2) NULL,
	[SalesArticle_QuantityY] [decimal](18, 2) NULL,
	[SalesArticle_QuantityZ] [decimal](18, 2) NULL,
	[IsQuantitySet] [bit] NULL,
	[Discriminator] [nvarchar](128) NOT NULL,
	[MainArticle_ArticleId] [bigint] NULL,
	[Transaction_Id] [bigint] NULL,
	[ProductGroupAccount] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.TransactionArticleRow] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[viewReportTransaction]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[viewReportTransaction]
AS
SELECT dbo.[Transaction].DateTime, dbo.[Transaction].DeliveryNoteNumber, dbo.[Transaction].OrderNumber, dbo.[Transaction].DistrictName, dbo.[Transaction].RecieptNumber, dbo.[Transaction].HighestHierarchyLevel2, dbo.[Transaction].HighestHierarchyLevel, dbo.[Transaction].Identifier, dbo.[Transaction].PTMDiscCustomer, dbo.TransactionPaymentRow.PTMDisc_DiscCustomerName, dbo.TransactionPaymentRow.PTMDisc_DiscName, dbo.[Transaction].PTMDiscNumber, dbo.[Transaction].DistrictId, dbo.[Transaction].DeviceId, dbo.[Transaction].DeviceName,
                  dbo.[Transaction].Id, dbo.TransactionArticleRow.Id AS TransactionArticleRow_Id, dbo.TransactionArticleRow.Quantity, dbo.TransactionArticleRow.Discount, dbo.TransactionArticleRow.Name, dbo.TransactionArticleRow.Price, 
                  dbo.TransactionArticleRow.TaxPercent, dbo.TransactionArticleRow.TaxAmount, dbo.TransactionArticleRow.ArticleType, dbo.TransactionPaymentRow.Amount, dbo.TransactionPaymentRow.PTMDisc_DiscType, dbo.TransactionPaymentRow.Id AS TransactionPaymentRow_Id, dbo.[Transaction].TaxAmount0, 
                  dbo.[Transaction].TaxAmount1, dbo.[Transaction].TaxAmount2, dbo.[Transaction].TaxAmount3, dbo.[Transaction].TaxableSales0, dbo.[Transaction].TaxableSales1, dbo.[Transaction].TaxableSales2, dbo.[Transaction].TaxableSales3, dbo.[Transaction].TransactionType, dbo.TransactionPaymentRow.PTMDisc_DiscEmployeeNumber
FROM     dbo.[Transaction] INNER JOIN
                  dbo.TransactionArticleRow ON dbo.[Transaction].Id = dbo.TransactionArticleRow.Transaction_Id INNER JOIN
                  dbo.TransactionPaymentRow ON dbo.[Transaction].Id = dbo.TransactionPaymentRow.Transaction_Id
GO
/****** Object:  Table [dbo].[Discount]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discount](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[Priority] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Note] [nvarchar](1000) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DiscGroup_Id] [int] NULL,
 CONSTRAINT [PK_dbo.Discount] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiscountArticle]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscountArticle](
	[Discount_Id] [int] NOT NULL,
	[Article_Id] [int] NOT NULL,
 CONSTRAINT [PK_dbo.DiscountArticle] PRIMARY KEY CLUSTERED 
(
	[Discount_Id] ASC,
	[Article_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ViewDiscountArticle]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[ViewDiscountArticle]
	AS
	SELECT dbo.DiscountArticle.Discount_Id, dbo.DiscountArticle.Article_Id, cg.HighestHierarchyLevel2, cg.HighestHierarchyLevel
	FROM dbo.Discount 
	INNER JOIN dbo.DiscGroup cg ON cg.Id=dbo.Discount.DiscGroup_Id 
	INNER JOIN 	dbo.DiscountArticle ON dbo.Discount.Id = dbo.DiscountArticle.Discount_Id 
	INNER JOIN 	dbo.ArticleBase ON dbo.DiscountArticle.Article_Id = dbo.ArticleBase.Id
GO
/****** Object:  Table [dbo].[DiscountArticleGroup]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscountArticleGroup](
	[Discount_Id] [int] NOT NULL,
	[ArticleGroup_Id] [int] NOT NULL,
 CONSTRAINT [PK_dbo.DiscountArticleGroup] PRIMARY KEY CLUSTERED 
(
	[Discount_Id] ASC,
	[ArticleGroup_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ViewDiscountArticleGroup]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[ViewDiscountArticleGroup]
AS
SELECT
dbo.DiscountArticleGroup.Discount_Id, dbo.DiscountArticleGroup.ArticleGroup_Id, dbo.ArticleGroup.HighestHierarchyLevel, dbo.ArticleGroup.HighestHierarchyLevel2
FROM dbo.Discount 
INNER JOIN dbo.DiscGroup cg ON cg.Id=dbo.Discount.DiscGroup_Id 
INNER JOIN dbo.DiscountArticleGroup ON dbo.Discount.Id = dbo.DiscountArticleGroup.Discount_Id 
INNER JOIN dbo.ArticleGroup ON dbo.DiscountArticleGroup.ArticleGroup_Id = dbo.ArticleGroup.Id
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountDimension]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountDimension](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[DisplayName] [nvarchar](40) NOT NULL,
	[ForcedRule] [int] NOT NULL,
	[MaxLength] [int] NULL,
	[MinLength] [int] NULL,
	[Mask] [nvarchar](max) NULL,
	[AllowedChars] [nvarchar](max) NULL,
	[DiscGroupId] [int] NOT NULL,
	[Type] [int] NOT NULL,
	[Conditions] [nvarchar](max) NULL,
	[Values] [nvarchar](max) NULL,
	[HighestHierarchyLevel2] [int] NOT NULL,
	[HighestHierarchyLevel] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ActiveInOrderFlow] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.AccountDimension] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountDimensionValue]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountDimensionValue](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PresetValue] [nvarchar](max) NOT NULL,
	[AccountDimension_Id] [int] NULL,
	[ValidUntil] [datetime2](7) NULL,
 CONSTRAINT [PK_dbo.AccountDimensionValue] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Line1] [nvarchar](100) NULL,
	[Line2] [nvarchar](100) NULL,
	[City] [nvarchar](50) NULL,
	[PostalCode] [nvarchar](20) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Address] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Anomaly]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Anomaly](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](40) NOT NULL,
	[Description] [nvarchar](80) NULL,
	[EnglishName] [nvarchar](40) NULL,
	[EnglishDescription] [nvarchar](80) NULL,
	[HighestHierarchyLevel2] [int] NOT NULL,
	[HighestHierarchyLevel] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Abbreviation] [nvarchar](4) NULL,
 CONSTRAINT [PK_dbo.Anomaly] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApiClient]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiClient](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ApiKey] [nvarchar](max) NULL,
	[Identifier] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[HighestHierarchyLevel2] [int] NOT NULL,
	[HighestHierarchyLevel] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.ApiClient] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArticleFilter]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArticleFilter](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[HighestHierarchyLevel2] [int] NOT NULL,
	[HighestHierarchyLevel] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.ArticleFilter] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArticleReportQueue]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArticleReportQueue](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SystemId] [nvarchar](128) NOT NULL,
	[DistrictNumber] [bigint] NOT NULL,
	[DeviceNumber] [bigint] NOT NULL,
	[ClerkId] [nvarchar](128) NOT NULL,
	[ReportLevel] [int] NOT NULL,
	[Discriminator] [nvarchar](128) NOT NULL,
	[DeviceId] [int] NOT NULL,
	[DistrictId] [int] NOT NULL,
	[HighestHierarchyLevel2] [int] NOT NULL,
 CONSTRAINT [PK_dbo.ArticleReportQueue] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArticleReportQueueTransactionArticle]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArticleReportQueueTransactionArticle](
	[ArticleReportQueue_Id] [bigint] NOT NULL,
	[TransactionArticle_ArticleId] [bigint] NOT NULL,
 CONSTRAINT [PK_dbo.ArticleReportQueueTransactionArticle] PRIMARY KEY CLUSTERED 
(
	[ArticleReportQueue_Id] ASC,
	[TransactionArticle_ArticleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArticleType]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArticleType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[DistrictId] [int] NOT NULL,
	[HighestHierarchyLevel2] [int] NOT NULL,
	[HighestHierarchyLevel] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.ArticleType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AttachedAccountDimensionValues]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttachedAccountDimensionValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DiscId] [int] NULL,
	[AccountDimensionId] [int] NULL,
	[Values] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.AttachedAccountDimensionValues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiscBase]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscBase](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SerialNumber] [nvarchar](30) NULL,
	[RegistrationDate] [datetimeoffset](7) NOT NULL,
	[IsBlocked] [bit] NOT NULL,
	[Notes] [nvarchar](255) NULL,
	[ValidUntil] [datetime2](7) NOT NULL,
	[DiscGroupId] [int] NULL,
	[UserId] [int] NULL,
	[DiscType] [int] NOT NULL,
	[BlockedDate] [datetimeoffset](7) NOT NULL,
	[Balance] [decimal](18, 2) NOT NULL,
	[Saldo] [decimal](18, 2) NOT NULL,
	[LastUsed] [datetimeoffset](7) NOT NULL,
	[HighestHierarchyLevel2] [int] NOT NULL,
	[HighestHierarchyLevel] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreditLimit] [decimal](18, 2) NULL,
	[CanChangeCostPlace] [bit] NULL,
	[Discriminator] [nvarchar](128) NOT NULL,
	[EmployeeId] [int] NULL,
	[UserId] [int] NULL,
	[DiscTag] [nvarchar](32) NULL,
	[Identifier] [uniqueidentifier] NOT NULL,
	[LastUpdated] [datetimeoffset](7) NOT NULL,
 CONSTRAINT [PK_dbo.DiscBase] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiscBaseAudit]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscBaseAudit](
	[DiscBaseAuditID] [int] IDENTITY(1,1) NOT NULL,
	[Id] [int] NULL,
	[SerialNumber] [nvarchar](30) NULL,
	[RegistrationDate] [datetimeoffset](7) NOT NULL,
	[IsBlocked] [bit] NOT NULL,
	[Notes] [nvarchar](255) NULL,
	[ValidUntil] [datetime2](7) NOT NULL,
	[DiscGroupId] [int] NULL,
	[DiscType] [int] NOT NULL,
	[BlockedDate] [datetimeoffset](7) NOT NULL,
	[Balance] [decimal](18, 2) NOT NULL,
	[Saldo] [decimal](18, 2) NOT NULL,
	[LastUsed] [datetimeoffset](7) NOT NULL,
	[HighestHierarchyLevel2] [int] NOT NULL,
	[HighestHierarchyLevel] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreditLimit] [decimal](18, 2) NULL,
	[CanChangeCostPlace] [bit] NULL,
	[Discriminator] [nvarchar](128) NOT NULL,
	[UserId] [int] NULL,
	[DiscTag] [nvarchar](32) NULL,
	[LastUpdated] [datetimeoffset](7) NOT NULL,
	[Identifier] [uniqueidentifier] NOT NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_dbo.DiscBaseAudit] PRIMARY KEY CLUSTERED 
(
	[DiscBaseAuditID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiscExport]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscExport](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PaymentBatchId] [int] NULL,
	[ExportProfileItemId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ExportBatch_Id] [int] NULL,
 CONSTRAINT [PK_dbo.DiscExport] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CashExport]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CashExport](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CashPaymentBatchId] [int] NULL,
	[ExportProfileItemId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CashExportBatch_Id] [int] NULL,
 CONSTRAINT [PK_dbo.CashExport] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CashExportBatch]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CashExportBatch](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ExportProfileId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[ExportRunDate] [datetime2](7) NOT NULL,
	[Log] [nvarchar](max) NULL,
	[ExportTillDate] [datetime2](7) NOT NULL,
	[HighestHierarchyLevel2] [int] NOT NULL,
	[HighestHierarchyLevel] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.CashExportBatch] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cashier]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cashier](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[IsInTraining] [bit] NOT NULL,
	[Notes] [nvarchar](255) NULL,
	[IsSystemCashier] [bit] NOT NULL,
	[IsBlocked] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[UserName] [nvarchar](max) NULL,
	[AlternativeUserName] [nvarchar](max) NULL,
	[DistrictId] [int] NOT NULL,
	[HighestHierarchyLevel2] [int] NOT NULL,
	[HighestHierarchyLevel] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Cashier] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CashPaymentBatch]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CashPaymentBatch](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[User] [nvarchar](max) NULL,
	[UserReferenceId] [int] NOT NULL,
	[HighestHierarchyLevel2] [int] NOT NULL,
	[ExportRunDate] [datetime2](7) NOT NULL,
	[ExportToDate] [datetime2](7) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[PaymentCount] [int] NOT NULL,
	[PaymentTotal] [decimal](18, 2) NOT NULL,
	[Status] [int] NOT NULL,
	[Log] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.CashPaymentBatch] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CashRegister]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CashRegister](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [int] NOT NULL,
	[Version] [nvarchar](max) NULL,
	[DeviceName] [nvarchar](max) NOT NULL,
	[LayoutName] [nvarchar](max) NULL,
	[Layout] [xml] NULL,
	[License] [varbinary](max) NULL,
	[Token] [nvarchar](max) NULL,
	[Location] [nvarchar](max) NULL,
	[DayEndsAt] [time](7) NOT NULL,
	[VendingServiceConfigurationName] [nvarchar](max) NULL,
	[VendingServiceConfiguration] [nvarchar](max) NULL,
	[CashGuardConfigurationName] [nvarchar](max) NULL,
	[CashGuardConfiguration] [nvarchar](max) NULL,
	[SettingsId] [int] NULL,
	[NextReceiptNumber] [int] NOT NULL,
	[NextDeliveryNoteNumber] [int] NOT NULL,
	[NextDepositReportNumber] [int] NOT NULL,
	[NextZReportNumber] [int] NOT NULL,
	[NextZ2ReportNumber] [int] NOT NULL,
	[DistrictId] [int] NOT NULL,
	[HighestHierarchyLevel2] [int] NOT NULL,
	[HighestHierarchyLevel] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeviceNumber] [int] NOT NULL,
	[LanguageOverrides_SerializedValue] [nvarchar](max) NULL,
	[LastUpdated] [datetimeoffset](7) NOT NULL,
	[MPSTerminalId] [nvarchar](100) NULL,
 CONSTRAINT [PK_dbo.CashRegister] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClerkReport]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClerkReport](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DateTime] [datetime2](7) NOT NULL,
	[SystemId] [nvarchar](128) NULL,
	[DistrictNumber] [bigint] NOT NULL,
	[DeviceNumber] [bigint] NOT NULL,
	[ClerkId] [nvarchar](128) NULL,
	[Voucher_Id] [bigint] NULL,
 CONSTRAINT [PK_dbo.ClerkReport] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[ImagePath] [nvarchar](max) NULL,
	[ThemeId] [int] NOT NULL,
	[EnforcePasswords] [bit] NOT NULL,
	[ExportPath] [nvarchar](max) NULL,
	[EnabledModules] [nvarchar](max) NULL,
	[License] [nvarchar](max) NULL,
	[SystemId] [nvarchar](max) NULL,
	[NextOrderNumber] [int] NOT NULL,
	[NextPTMVoucherNumber] [int] NOT NULL,
	[SettingsId] [int] NULL,
	[UppercaseArticleNames] [bit] NOT NULL,
	[Currency] [int] NOT NULL,
	[MailHost] [nvarchar](max) NOT NULL,
	[MailUseDefaultCredentials] [bit] NOT NULL,
	[MailUserName] [nvarchar](max) NULL,
	[MailPassword] [nvarchar](max) NULL,
	[MailPort] [int] NOT NULL,
	[MailEnableSsl] [bit] NOT NULL,
	[MailFromAddress] [nvarchar](max) NOT NULL,
	[HighestHierarchyLevel] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[OrganizationNumber] [nvarchar](max) NULL,
	[SupportPhoneNumber] [nvarchar](max) NULL,
	[SupportEmailAddress] [nvarchar](max) NULL,
	[SystemUrl] [nvarchar](max) NULL,
	[EnforceEmployeeNumbers] [bit] NOT NULL,
	[EmployeePersonalNumberLength] [int] NOT NULL,
	[SessionTimeout] [int] NOT NULL,
	[AllowedLogins] [int] NOT NULL,
	[PasswordComplexity] [int] NOT NULL,
	[CashRegistersToken] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.City] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConfigurableSettings]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConfigurableSettings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Vat_SerializedValue] [nvarchar](max) NULL,
	[VendingMaxCredit] [int] NULL,
	[CountryCode] [nvarchar](max) NULL,
	[PasswordGeneral] [nvarchar](max) NULL,
	[PasswordXReport] [nvarchar](max) NULL,
	[PasswordZReport] [nvarchar](max) NULL,
	[PasswordClerkReport] [nvarchar](max) NULL,
	[PasswordSettings] [nvarchar](max) NULL,
	[PasswordStatistics] [nvarchar](max) NULL,
	[PasswordBrowseJournal] [nvarchar](max) NULL,
	[PasswordReturns] [nvarchar](max) NULL,
	[PasswordButtonEdit] [nvarchar](max) NULL,
	[PasswordLayoutEdit] [nvarchar](max) NULL,
	[PasswordDeclaration] [nvarchar](max) NULL,
	[PasswordInvoiceCredit] [nvarchar](max) NULL,
	[PTMWebAutoOrderNumber] [bit] NULL,
	[PTMDiscAutoGetOrder] [bit] NULL,
	[PTMWebNotifyUrl] [nvarchar](max) NULL,
	[TableWebLockTimeout] [int] NULL,
	[PTMWebSessionId] [int] NULL,
	[PTMDiscTypesOffline_SerializedValue] [nvarchar](max) NULL,
	[PTMDiscTopupOffline] [bit] NULL,
	[SqlConnectString] [nvarchar](max) NULL,
	[ConfirmCustomerForInvoice] [bit] NULL,
	[ConfirmCredit] [bit] NULL,
	[AskCreditAll] [bit] NULL,
	[PTMDisc] [bit] NULL,
	[PTMDiscSelectDupBySystemId] [bit] NULL,
	[PTMDiscDeniedPaymentReceipts] [bit] NULL,
	[PTMDiscPriceOnFullPayOnly] [bit] NULL,
	[PTMCityNewDiscs] [nvarchar](max) NULL,
	[PTMDiscUnregPrefix] [nvarchar](max) NULL,
	[PTMDiscAccountsChangeable] [bit] NULL,
	[PTMVoucherLimit_SerializedValue] [nvarchar](max) NULL,
	[PTMDiscSpecifyNewGroup] [bit] NULL,
	[SerialDiscReader] [nvarchar](max) NULL,
	[CityNameOnReceipts] [bit] NULL,
	[SerialDiscReaderType] [nvarchar](max) NULL,
	[PTMDiscNumDaysBalanceReport] [int] NULL,
	[PTMDiscReceiptsOnBalanceReport] [bit] NULL,
	[PTMDiscExportedOnBalanceRep] [bit] NULL,
	[PTMDiscAllowMultipleDiscs] [bit] NULL,
	[PTMDiscServer] [nvarchar](max) NULL,
	[PTMDiscConfirmPayment_SerializedValue] [nvarchar](max) NULL,
	[PTMDiscEncryptedDiscNumbers] [bit] NULL,
	[PTMDiscNumberMaskNonDigits] [bit] NULL,
	[ShowNameAtEndOfPayment] [bit] NULL,
	[PTMDiscPrintVipAmount] [bit] NULL,
	[ShowNameOnCustomerDisplay] [bit] NULL,
	[PTMDiscLockTime] [int] NULL,
	[PTMDiscExceptionSingleUsePerDay] [bit] NULL,
	[PTMDiscMaskProfile] [nvarchar](max) NULL,
	[PTMDiscMaxLength] [int] NULL,
	[PTMDiscAltSearchIndices_SerializedValue] [nvarchar](max) NULL,
	[PTMDiscMaxTopUpAmount] [decimal](18, 2) NULL,
	[PTMTopUpExistingDiscsOnly] [bit] NULL,
	[PTMDiscAllowedCharsSpender] [nvarchar](max) NULL,
	[PTMDiscAllowedCharsProject] [nvarchar](max) NULL,
	[PTMDiscAllowedCharsObject] [nvarchar](max) NULL,
	[PTMDiscAllowedCharsVerksamhet] [nvarchar](max) NULL,
	[PTMDiscAllowedCharsGuestCount] [nvarchar](max) NULL,
	[PTMDiscNameOnReceipts] [bit] NULL,
	[PTMDiscNumberOnReceipts] [bit] NULL,
	[PTMDiscMinLengthSpender] [int] NULL,
	[PTMDiscMinLengthProject] [int] NULL,
	[PTMDiscMinLengthObject] [int] NULL,
	[PTMDiscMinLengthVerksamhet] [int] NULL,
	[PTMDiscMaxLengthSpender] [int] NULL,
	[PTMDiscMaxLengthProject] [int] NULL,
	[PTMDiscMaxLengthObject] [int] NULL,
	[PTMDiscMaxLengthVerksamhet] [int] NULL,
	[PTMDiscMaxLengthGuestCount] [int] NULL,
	[PTMDiscRequireNumberOfGuests] [bit] NULL,
	[PTMDiscAllowedNewPrefix_SerializedValue] [nvarchar](max) NULL,
	[PTMDiscDaysValidAfterTopUp] [int] NULL,
	[PTMVoucherValidDays_SerializedValue] [nvarchar](max) NULL,
	[PTMDiscType4NotAllowed] [bit] NULL,
	[BusinessSection] [nvarchar](max) NULL,
	[PTMDiscCaptionCity] [nvarchar](max) NULL,
	[PTMDiscCaptionSection] [nvarchar](max) NULL,
	[PTMDiscCaptionSpender] [nvarchar](max) NULL,
	[PTMDiscCaptionProject] [nvarchar](max) NULL,
	[PTMDiscCaptionObject] [nvarchar](max) NULL,
	[PTMDiscCaptionVerksamhet] [nvarchar](max) NULL,
	[PTMDiscCaptionGuests] [nvarchar](max) NULL,
	[TaxFreePriceList] [tinyint] NULL,
	[PTMDiscTopUpTerminal] [bit] NULL,
	[PTMDiscUnattendedTerminal] [bit] NULL,
	[PTMDiscNumberForAdministration] [nvarchar](max) NULL,
	[PTMDiscNumberForZeroReport] [nvarchar](max) NULL,
	[ExternalDisc] [bit] NULL,
	[ExternalDiscProvider] [nvarchar](max) NULL,
	[ExternalDiscServer_SerializedValue] [nvarchar](max) NULL,
	[ExternalDiscPaymentMedias_SerializedValue] [nvarchar](max) NULL,
	[ExternalDiscPath] [nvarchar](max) NULL,
	[ExternalDiscNumberMinLength] [int] NULL,
	[ExternalDiscNumberMaxLength] [int] NULL,
	[AllowManuallyEnteredDiscNumbers] [bit] NULL,
	[ExternalDiscFloorLimit] [int] NULL,
	[ExternalDiscIdCheck] [bit] NULL,
	[ExternalDiscIdCheckAmount] [int] NULL,
	[ExternalDiscNumberOnSignReceipts] [bit] NULL,
	[ExternalDiscCloseBatch] [bit] NULL,
	[AutoAcceptSignReceipts] [bit] NULL,
	[ExternalDiscsOffline] [bit] NULL,
	[ExternalDiscTerminalReport] [bit] NULL,
	[UsePed] [bit] NULL,
	[AutoRespondSwipedChipDiscs] [nvarchar](max) NULL,
	[AllowSignatureFallback] [bit] NULL,
	[AbortPed] [bit] NULL,
	[PrintSignReceiptsForPedReadDiscs] [bit] NULL,
	[ReadInternalDiscsInPed] [bit] NULL,
	[TwoPeDs] [bit] NULL,
	[PedLanguage] [nvarchar](max) NULL,
	[CleanCashPort] [nvarchar](max) NULL,
	[OrgNr] [nvarchar](max) NULL,
	[PaymentMediaCodesProForma_SerializedValue] [nvarchar](max) NULL,
	[PrintControlCodeOnReceipts] [bit] NULL,
	[MaxPrice] [decimal](18, 2) NULL,
	[AllowZeroPrice] [bit] NULL,
	[HappyHour_SerializedValue] [nvarchar](max) NULL,
	[HappyHourPriceList] [tinyint] NULL,
	[PricelistAsDiscount] [bit] NULL,
	[GiveChangeInForeignCurrency] [bit] NULL,
	[ForeignCurrencies_SerializedValue] [nvarchar](max) NULL,
	[KeyArticles_SerializedValue] [nvarchar](max) NULL,
	[AutomaticQuantityPosition] [tinyint] NULL,
	[WarningColors_SerializedValue] [nvarchar](max) NULL,
	[PositionMultidimensionalXyz] [tinyint] NULL,
	[DistrictX] [nvarchar](max) NULL,
	[DistrictY] [nvarchar](max) NULL,
	[DistrictZ] [nvarchar](max) NULL,
	[AutomaticArticle] [nvarchar](max) NULL,
	[AutomaticArticlePTMDiscGroups_SerializedValue] [nvarchar](max) NULL,
	[DetailedDeliveryNotes] [bit] NULL,
	[SpecifyDiscountAmount] [bit] NULL,
	[Location] [nvarchar](max) NULL,
	[ClerkKeyTitle] [nvarchar](max) NULL,
	[LayoutContextMenu] [bit] NULL,
	[ExternalDiscLocalPath] [nvarchar](max) NULL,
	[AllowChangeArticleNumber] [bit] NULL,
	[AddPercentDiscounts] [bit] NULL,
	[ReloadLayoutAfterZReport] [bit] NULL,
	[ReturnTypeNames_SerializedValue] [nvarchar](max) NULL,
	[TimingLog] [bit] NULL,
	[AutoReactivateWindow] [bit] NULL,
	[BufferKeyboardInput] [bit] NULL,
	[OnScreenKeyboardMacros_SerializedValue] [nvarchar](max) NULL,
	[Blackboard_SerializedValue] [nvarchar](max) NULL,
	[ReturnToMainRegLayout] [bit] NULL,
	[UploadLogFileOnStartup] [bit] NULL,
	[KeepAliveInterval] [int] NULL,
	[TimeoutRegistration] [int] NULL,
	[AutoLogoutClerk] [bit] NULL,
	[TimeoutMessageBoxes] [int] NULL,
	[TimeRegisteredMessage] [int] NULL,
	[ShowMessageWaitingPrintReceipt] [bit] NULL,
	[GeneralMaxOverPayment] [decimal](18, 2) NULL,
	[MaxOverPayments_SerializedValue] [nvarchar](max) NULL,
	[PasswordRequiredForReturns] [bit] NULL,
	[PayOutAnyPaymentMedia] [bit] NULL,
	[AllowMultipleReceiptCopies] [bit] NULL,
	[AllowReceiptCopies] [bit] NULL,
	[AllowPaymentMediaTransfer] [bit] NULL,
	[AllowCombinedReturnReceipts] [bit] NULL,
	[MaxTransferPaidAmount] [bit] NULL,
	[ConfirmCancels] [bit] NULL,
	[RequireCashDrawRegistration] [bit] NULL,
	[ClerkTitle] [nvarchar](max) NULL,
	[DeviceName] [nvarchar](max) NULL,
	[ConfirmRefundVoucherPrinting] [bit] NULL,
	[HideOnScreenKeyboards] [bit] NULL,
	[ShowReturnKindSelection] [bit] NULL,
	[AllowSalesWithDrawerOpen] [bit] NULL,
	[PTMSystemId] [nvarchar](max) NULL,
	[TablesEnabled] [bit] NULL,
	[OrderNumberWrapValue] [int] NULL,
	[WarnOpenTablesOnZReport] [bit] NULL,
	[TableNumberRequired] [bit] NULL,
	[ClerksShareTables] [bit] NULL,
	[ConfirmTransferTables] [bit] NULL,
	[ConfirmAddToExistingTable] [bit] NULL,
	[AllowAddToExistingTable] [bit] NULL,
	[ParkReceiptOnClerk] [bit] NULL,
	[PrintNewBalance] [bit] NULL,
	[KitchenPrintOnNewBalance] [bit] NULL,
	[RegisterTableReferences] [bit] NULL,
	[RegisterTableNumberOfGuests] [bit] NULL,
	[PTMVoucherHeaderLogo] [tinyint] NULL,
	[PTMVoucherFooterLogo] [tinyint] NULL,
	[PTMVoucherHeaderTexts_SerializedValue] [nvarchar](max) NULL,
	[PTMVoucherFooterTexts_SerializedValue] [nvarchar](max) NULL,
	[CustomerReceiptHeaderLogo] [tinyint] NULL,
	[BackgroundImage] [nvarchar](max) NULL,
	[ButtonBackgroundImage] [nvarchar](max) NULL,
	[CustomerReceiptFooterLogo] [tinyint] NULL,
	[CustomerReceiptHeaderTexts_SerializedValue] [nvarchar](max) NULL,
	[CustomerReceiptFooterTexts_SerializedValue] [nvarchar](max) NULL,
	[VoucherHeaderLogo] [tinyint] NULL,
	[VoucherFooterLogo] [tinyint] NULL,
	[VoucherHeaderTexts_SerializedValue] [nvarchar](max) NULL,
	[VoucherFooterTexts_SerializedValue] [nvarchar](max) NULL,
	[DiscTopUpTexts_SerializedValue] [nvarchar](max) NULL,
	[RegisterStaffOnTerminal] [bit] NULL,
	[RequireRegisteredClerkLogon] [bit] NULL,
	[ClerkReportRequired] [bit] NULL,
	[ZeroTime] [nvarchar](max) NULL,
	[LocalJournalCopies_SerializedValue] [nvarchar](max) NULL,
	[JournalArchiveDirectories_SerializedValue] [nvarchar](max) NULL,
	[SystemWideClerks] [bit] NULL,
	[AllowMultipleZeroReports] [bit] NULL,
	[PrintZeroReport] [bit] NULL,
	[PrintFullZeroReport] [bit] NULL,
	[ExportProfiles_SerializedValue] [nvarchar](max) NULL,
	[TransExportProfiles_SerializedValue] [nvarchar](max) NULL,
	[PreviewReportsOnScreen] [bit] NULL,
	[ClerkStatistics] [bit] NULL,
	[SalesStatistics] [bit] NULL,
	[ClearSalesStatsAfterZeroReport] [bit] NULL,
	[HourlyReportFactor] [tinyint] NULL,
	[ReceiptDateTimeFormat] [nvarchar](max) NULL,
	[SplitReportConnectedArticles] [bit] NULL,
	[SignLinesOnReturnReceipts] [bit] NULL,
	[StockListEnabled] [bit] NULL,
	[CashRegisterStatistics] [bit] NULL,
	[RefundVouchersEnabled] [bit] NULL,
	[GuestsLinesOnReceipt] [bit] NULL,
	[RoundTotals] [bit] NULL,
	[UseLocalTime] [bit] NULL,
	[ReportGroupsExcludingTax] [bit] NULL,
	[SalesReportsSpecArticles] [bit] NULL,
	[PreTransExportProfiles_SerializedValue] [nvarchar](max) NULL,
	[MaxAmountInClerkReport] [decimal](18, 2) NULL,
	[CostsAccounts_SerializedValue] [nvarchar](max) NULL,
	[CostsVatAccount] [nvarchar](max) NULL,
	[GainsAccounts_SerializedValue] [nvarchar](max) NULL,
	[LimitAmountDeclarations] [bit] NULL,
	[PaymentMediaDeposit_SerializedValue] [nvarchar](max) NULL,
	[PaymentMediaBalance_SerializedValue] [nvarchar](max) NULL,
	[DifferenceAccount] [nvarchar](max) NULL,
	[ClerkReportDiffArticle] [nvarchar](max) NULL,
	[PaymentMediaCodeInvoiceExport] [int] NULL,
	[InvoiceMaxLengthRef] [int] NULL,
	[InvoiceAllowDelayed] [bit] NULL,
	[AlwaysShowInvoiceRef] [bit] NULL,
	[InvoiceRowTextMaxLength] [int] NULL,
	[InvoiceRowTextPrompt] [bit] NULL,
	[InvoiceTypeDescriptions_SerializedValue] [nvarchar](max) NULL,
	[InvoiceRef1Description] [nvarchar](max) NULL,
	[InvoiceRef2Description] [nvarchar](max) NULL,
	[InvoiceRefundDebRefDescr] [nvarchar](max) NULL,
	[CreditInvoiceRequiresDebit] [bit] NULL,
	[InvoiceExportPath] [nvarchar](max) NULL,
	[InternalOrderSystemName] [nvarchar](max) NULL,
	[ExternalOrderSystemName] [nvarchar](max) NULL,
	[PaymentMediaCodeExTaxRounding_SerializedValue] [nvarchar](max) NULL,
	[PaymentMediaCodesDelayedBooking_SerializedValue] [nvarchar](max) NULL,
	[DelayedBookingGroup] [int] NULL,
	[PaymentMediaCodesClerkReport_SerializedValue] [nvarchar](max) NULL,
	[SmallestCoinDistrict] [decimal](18, 2) NULL,
	[GiveChangeAnyPaymentMedia] [bit] NULL,
	[PaymentMediaCodesSignReceipt_SerializedValue] [nvarchar](max) NULL,
	[PaymentMediaCodesDrawerKickout_SerializedValue] [nvarchar](max) NULL,
	[PaymentMediaCodesRounding_SerializedValue] [nvarchar](max) NULL,
	[WinPrinterName] [nvarchar](max) NULL,
	[SmallReceiptPrinterFont] [bit] NULL,
	[WinPrintDeliveryNotes] [bit] NULL,
	[PrintCustomerReceipts] [bit] NULL,
	[DetailedSignReceipts] [bit] NULL,
	[OpenDrawer] [bit] NULL,
	[NumberOfDeliveryNotes] [int] NULL,
	[NumberOfExtraSignReceiptLines] [int] NULL,
	[ShowMsgTearAndContinue] [bit] NULL,
	[ReceiptPrinterPortName] [nvarchar](max) NULL,
	[ReceiptPrinterPortSpeed] [int] NULL,
	[EnableCustomerDisplay] [bit] NULL,
	[AdditionalCustomerDisplayPorts_SerializedValue] [nvarchar](max) NULL,
	[ArticleNumberOnReceipts] [bit] NULL,
	[KitchenPrinting] [bit] NULL,
	[KitchenPrinterRCount] [bit] NULL,
	[KitchenPrinterEnlargedRCount] [bit] NULL,
	[KitchenPrinterEnlarged] [bit] NULL,
	[KitchenPrinterPorts_SerializedValue] [nvarchar](max) NULL,
	[UseBackupKitchenPrinter] [bit] NULL,
	[BackupKitchenPrinterPort] [nvarchar](max) NULL,
	[KitchenPrintRetryCount] [int] NULL,
	[PrinterRetryWait] [int] NULL,
	[DrawerNumber] [tinyint] NULL,
	[DrawerOpenPulseTimeOn] [int] NULL,
	[DrawerOpenPulseTimeOff] [int] NULL,
	[IgnoreDsrSignal] [bit] NULL,
	[NoCheckPaperRollSensor] [bit] NULL,
	[DrawerKickoutPort] [nvarchar](max) NULL,
	[DrawerKickoutKitchenPrinter] [bit] NULL,
	[PrintRowTextsOnReceipts] [bit] NULL,
	[KitchenMessagesOnReceipts] [bit] NULL,
	[PrintVouchers] [bit] NULL,
	[VoucherPrinterPort] [nvarchar](max) NULL,
	[ReceiptPrinterLeftMargin] [int] NULL,
	[CustomerDisplayClock] [bit] NULL,
	[GroupArticlesByTaxPercent] [bit] NULL,
	[PositionVoucherPrinting] [tinyint] NULL,
	[VoucherEachArticleRow] [bit] NULL,
	[PrintSubArticles] [bit] NULL,
	[PTMDiscNameOnVouchers] [bit] NULL,
	[PTMDiscPersonalIdOnVouchers] [bit] NULL,
	[WeekDayOnVouchers] [bit] NULL,
	[PTMDiscNumberOnVouchers] [bit] NULL,
	[DisDiscZeroPriceOnReceipt] [bit] NULL,
	[GroupDecimalArticlesOnReceipt] [bit] NULL,
	[KitchenMessages_SerializedValue] [nvarchar](max) NULL,
	[EnableCustomKitchenMessages] [bit] NULL,
	[CashChangerModel] [nvarchar](max) NULL,
	[CashChangerConnection] [nvarchar](max) NULL,
	[CashChangerInitString] [nvarchar](max) NULL,
	[PaymentMediaCodeCashChanger] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
	[ClearScreenAfterPurchase] [bit] NULL,
 CONSTRAINT [PK_dbo.ConfigurableSettings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CopyOfArticleBase]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CopyOfArticleBase](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](30) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[FixedPrice] [bit] NOT NULL,
	[PurchasePrice] [decimal](18, 2) NOT NULL,
	[OrderLimit] [decimal](18, 2) NOT NULL,
	[TaxPercentIndex] [int] NOT NULL,
	[PriceDistrict] [int] NOT NULL,
	[DecimalDistrict] [bit] NOT NULL,
	[NegativeArticle] [bit] NOT NULL,
	[ZeroPriceAllowed] [bit] NOT NULL,
	[OnlyForVendingMachines] [bit] NOT NULL,
	[MerchandiseTypeId] [int] NOT NULL,
	[Notes] [nvarchar](1000) NULL,
	[TranslatedNotes] [nvarchar](1000) NULL,
	[ImagePath] [nvarchar](50) NULL,
	[MixMatchGroupId] [int] NULL,
	[ArticleTypeId] [int] NULL,
	[TrackStock] [bit] NOT NULL,
	[StockId] [int] NULL,
	[AutomaticQuantity] [decimal](18, 2) NULL,
	[PrintLineTotal] [bit] NOT NULL,
	[EnableVoucher] [bit] NOT NULL,
	[XYZQuantity] [nvarchar](1) NULL,
	[DiscGroupDataEntityId] [int] NULL,
	[ArticleForm] [int] NOT NULL,
	[ResourceStock] [decimal](18, 2) NOT NULL,
	[ResourceSize] [decimal](18, 2) NOT NULL,
	[WebArticleType] [nvarchar](max) NULL,
	[RequiresAdministration] [bit] NOT NULL,
	[Deductable] [bit] NOT NULL,
	[RegistrationDate] [datetime2](7) NOT NULL,
	[LastUpdatedDate] [datetime2](7) NOT NULL,
	[InventoryDate] [datetime2](7) NOT NULL,
	[DistrictId] [int] NOT NULL,
	[HighestHierarchyLevel2] [int] NOT NULL,
	[HighestHierarchyLevel] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Discriminator] [nvarchar](128) NOT NULL,
	[District_Id] [int] NULL,
	[ComparePrice] [decimal](18, 2) NOT NULL,
	[ComparePriceDistrict] [int] NOT NULL,
	[HideArticleUntilDate] [datetime2](7) NULL,
	[ArticleFilterId] [int] NULL,
	[SalaryTypeId] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CopyOfMixMatchGroup]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CopyOfMixMatchGroup](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[TriggerAmount] [decimal](18, 2) NOT NULL,
	[DiscountType] [int] NOT NULL,
	[DistrictId] [int] NOT NULL,
	[HighestHierarchyLevel2] [int] NOT NULL,
	[HighestHierarchyLevel] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Discriminator] [nvarchar](128) NOT NULL,
	[NewPrice] [decimal](18, 2) NULL,
	[PriceReduction] [decimal](18, 2) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CostCenter]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CostCenter](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Code] [nvarchar](max) NOT NULL,
	[HighestHierarchyLevel2] [int] NOT NULL,
	[HighestHierarchyLevel] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.CostCenter] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Counter]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Counter](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](max) NULL,
	[SystemId] [nvarchar](max) NULL,
	[DistrictNumber] [bigint] NULL,
	[DeviceNumber] [bigint] NULL,
	[ClerkId] [nvarchar](max) NULL,
	[FloatValue] [decimal](18, 2) NULL,
	[IntegerValue] [int] NULL,
	[Discriminator] [nvarchar](128) NOT NULL,
	[HighestHierarchyLevel2] [int] NOT NULL,
	[HighestHierarchyLevel] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Counter] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[AddressId] [int] NOT NULL,
	[AlternativeAddressId] [int] NULL,
	[ExportPluginName] [nvarchar](max) NULL,
	[CreditDiscFee] [decimal](18, 2) NOT NULL,
	[RepresentationDiscFee] [decimal](18, 2) NOT NULL,
	[Operation] [nvarchar](max) NULL,
	[PaymentMethod] [nvarchar](max) NULL,
	[IdFromOtherSystems] [nvarchar](max) NULL,
	[OrganizationNumber] [nvarchar](max) NULL,
	[HighestHierarchyLevel2] [int] NOT NULL,
	[HighestHierarchyLevel] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[TaxRegistrationNumber] [nvarchar](max) NULL,
	[ContactPerson] [nvarchar](max) NULL,
	[IdFromOtherSystem2] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DailyReport]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DailyReport](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CashRegisterId] [int] NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[DateTime] [datetimeoffset](7) NOT NULL,
	[DistrictId] [int] NOT NULL,
	[HighestHierarchyLevel2] [int] NOT NULL,
	[HighestHierarchyLevel] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.DailyReport] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DbFile]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DbFile](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[BaseName] [nvarchar](max) NOT NULL,
	[Extension] [nvarchar](max) NULL,
	[Content] [varbinary](max) NOT NULL,
	[CashRegister_Id] [int] NULL,
 CONSTRAINT [PK_dbo.DbFile] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeliveryArea]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeliveryArea](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](40) NOT NULL,
	[Email] [nvarchar](60) NOT NULL,
	[CashRegisterId] [int] NOT NULL,
	[DistrictId] [int] NOT NULL,
	[HighestHierarchyLevel2] [int] NOT NULL,
	[HighestHierarchyLevel] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.DeliveryArea] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeliveryLocationBase]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeliveryLocationBase](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](80) NOT NULL,
	[Building] [nvarchar](80) NOT NULL,
	[OpeningTime] [nvarchar](5) NOT NULL,
	[ClosingTime] [nvarchar](5) NOT NULL,
	[MinimumDeliveryTimeSameDay] [nvarchar](5) NOT NULL,
	[AdminOnly] [bit] NOT NULL,
	[DeliveryAreaId] [int] NOT NULL,
	[ArticleGroupId] [int] NULL,
	[TransportRouteId] [int] NULL,
	[LocationType] [int] NOT NULL,
	[DistrictId] [int] NOT NULL,
	[HighestHierarchyLevel2] [int] NOT NULL,
	[HighestHierarchyLevel] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[RoomArticleId] [int] NULL,
	[Discriminator] [nvarchar](128) NOT NULL,
	[DeliveryTimeOffset] [int] NOT NULL,
	[OtherInformation] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.DeliveryLocationBase] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeliveryLocationTime]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeliveryLocationTime](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DeliveryLocationId] [int] NULL,
	[DeliveryTime] [nvarchar](max) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.DeliveryLocationTime] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Costplace] [nvarchar](max) NOT NULL,
	[HighestHierarchyLevel2] [int] NOT NULL,
	[HighestHierarchyLevel] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Department] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Country] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EntityLocalization]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EntityLocalization](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EntityName] [nvarchar](max) NULL,
	[En] [nvarchar](max) NULL,
	[Sv] [nvarchar](max) NULL,
	[HighestHierarchyLevel2] [int] NOT NULL,
	[HighestHierarchyLevel] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.EntityLocalization] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Event]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[StartTime] [nvarchar](max) NOT NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[StopDate] [datetime2](7) NULL,
	[StopTime] [nvarchar](max) NULL,
	[Information] [nvarchar](max) NOT NULL,
	[DiscId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[HighestHierarchyLevel2] [int] NOT NULL,
	[HighestHierarchyLevel] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Event] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExcludeFromDeadline]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExcludeFromDeadline](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ArticleId] [int] NULL,
	[DeliveryLocationId] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.ExcludeFromDeadline] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExportBatch]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExportBatch](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ExportProfileId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[ExportRunDate] [datetime2](7) NOT NULL,
	[Log] [nvarchar](max) NULL,
	[ExportTillDate] [datetime2](7) NOT NULL,
	[HighestHierarchyLevel2] [int] NOT NULL,
	[HighestHierarchyLevel] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.ExportBatch] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExportProfile]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExportProfile](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[HighestHierarchyLevel2] [int] NOT NULL,
	[HighestHierarchyLevel] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CashExport] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.ExportProfile] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExportProfileItem]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExportProfileItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NULL,
	[DiscType] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ExportProfile_Id] [int] NULL,
	[CashExport] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.ExportProfileItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExportProfileItemFileExport]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExportProfileItemFileExport](
	[ExportProfileItem_Id] [int] NOT NULL,
	[FileExport_Id] [int] NOT NULL,
 CONSTRAINT [PK_dbo.ExportProfileItemFileExport] PRIMARY KEY CLUSTERED 
(
	[ExportProfileItem_Id] ASC,
	[FileExport_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RegistrationDate] [datetimeoffset](7) NOT NULL,
	[FirstName] [nvarchar](40) NOT NULL,
	[LastName] [nvarchar](40) NOT NULL,
	[WorkAddressId] [int] NULL,
	[ImagePath] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[AlternativePhoneNumber] [nvarchar](max) NULL,
	[PreferedApproverId] [int] NULL,
	[EmployeeNumber] [nvarchar](10) NULL,
	[PersonalNumber] [nvarchar](15) NULL,
	[Approver] [bit] NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
	[LastUsedRole] [int] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[UserName] [nvarchar](max) NOT NULL,
	[HighestHierarchyLevel2] [int] NOT NULL,
	[HighestHierarchyLevel] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DistrictId] [int] NULL,
	[CustomerId] [int] NULL,
	[DepartmentId] [int] NULL,
	[Discriminator] [nvarchar](128) NOT NULL,
	[LastLoginDate] [datetimeoffset](7) NULL,
	[ApprovedGDPR] [datetime2](7) NULL,
	[LastLoginAttempt] [datetimeoffset](7) NULL,
	[LoginAttempts] [int] NOT NULL,
	[isBlocked] [bit] NOT NULL,
	[LastUpdated] [datetimeoffset](7) NOT NULL,
 CONSTRAINT [PK_dbo.User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GetOneFreeThreshold]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GetOneFreeThreshold](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Quantity] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_dbo.GetOneFreeThreshold] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HangfireLscExport]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HangfireLscExport](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[ExportProfileId] [int] NOT NULL,
	[RunAt] [time](7) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Interval] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.HangfireLscExport] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KitchenPrinter]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KitchenPrinter](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PrinterNumber] [int] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[NameSe] [nvarchar](max) NULL,
	[HighestHierarchyLevel2] [int] NOT NULL,
	[HighestHierarchyLevel] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.KitchenPrinter] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KitchenPrinterArticleBase]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KitchenPrinterArticleBase](
	[KitchenPrinter_Id] [int] NOT NULL,
	[ArticleBase_Id] [int] NOT NULL,
 CONSTRAINT [PK_dbo.KitchenPrinterArticleBase] PRIMARY KEY CLUSTERED 
(
	[KitchenPrinter_Id] ASC,
	[ArticleBase_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LegacyFormatReport]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LegacyFormatReport](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CashRegisterId] [int] NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
	[DateTime] [datetimeoffset](7) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Discriminator] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.LegacyFormatReport] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LogonAuditItem]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogonAuditItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CashRegisterId] [int] NOT NULL,
	[PersonalNumber] [nvarchar](max) NULL,
	[FullName] [nvarchar](max) NULL,
	[CashierId] [int] NOT NULL,
	[DateTime] [datetime2](7) NOT NULL,
	[Type] [int] NOT NULL,
	[DistrictId] [int] NOT NULL,
	[HighestHierarchyLevel2] [int] NOT NULL,
	[HighestHierarchyLevel] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.LogonAuditItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MandatoryArticles]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MandatoryArticles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ArticleId] [int] NULL,
	[DeliveryLocationId] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.MandatoryArticles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MealStub]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MealStub](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LinkedDiscId] [int] NOT NULL,
	[ValidUntil] [datetime2](7) NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[StubId] [nvarchar](max) NOT NULL,
	[UsedOn] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.MealStub] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MerchandiseType]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MerchandiseType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Account] [nvarchar](20) NOT NULL,
	[HighestHierarchyLevel2] [int] NOT NULL,
	[HighestHierarchyLevel] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.MerchandiseType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MixMatchGroup]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MixMatchGroup](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[TriggerAmount] [decimal](18, 2) NOT NULL,
	[NewPrice] [decimal](18, 2) NULL,
	[PriceReduction] [decimal](18, 2) NULL,
	[DiscountType] [int] NOT NULL,
	[DistrictId] [int] NOT NULL,
	[HighestHierarchyLevel2] [int] NOT NULL,
	[HighestHierarchyLevel] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.MixMatchGroup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [bigint] NOT NULL,
	[DeliveryDate] [datetime2](7) NOT NULL,
	[OrderDate] [datetime2](7) NOT NULL,
	[LastChange] [datetime2](7) NOT NULL,
	[CreatedAtDevice] [nvarchar](max) NULL,
	[MovedFromTable] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[LastDevice] [nvarchar](max) NULL,
	[LastClerk] [nvarchar](max) NULL,
	[NumberOfGuests] [int] NOT NULL,
	[Locked] [bit] NOT NULL,
	[CreatedByClerk] [nvarchar](max) NULL,
	[MainOrder_Id] [bigint] NULL,
	[DeviceId] [int] NOT NULL,
	[DistrictId] [int] NOT NULL,
	[HighestHierarchyLevel2] [int] NOT NULL,
	[HighestHierarchyLevel] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderAccountDimension]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderAccountDimension](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderBaseId] [int] NOT NULL,
	[DisplayName] [nvarchar](max) NULL,
	[AccountDimensionId] [int] NULL,
	[Value] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
	[ForcedRule] [int] NOT NULL,
 CONSTRAINT [PK_dbo.OrderAccountDimension] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderAccountDimensionMetadata]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderAccountDimensionMetadata](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](max) NULL,
	[Value] [nvarchar](max) NULL,
	[OrderAccountDimensionId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.OrderAccountDimensionMetadata] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderAnomaly]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderAnomaly](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderBaseId] [int] NOT NULL,
	[ArticleId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[FreeText] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.OrderAnomaly] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderAnomalyAnomaly]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderAnomalyAnomaly](
	[OrderAnomaly_Id] [int] NOT NULL,
	[Anomaly_Id] [int] NOT NULL,
 CONSTRAINT [PK_dbo.OrderAnomalyAnomaly] PRIMARY KEY CLUSTERED 
(
	[OrderAnomaly_Id] ASC,
	[Anomaly_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderBase]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderBase](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderName] [nvarchar](max) NULL,
	[OrderNumber] [int] NOT NULL,
	[OrderDate] [datetimeoffset](7) NOT NULL,
	[ContactPerson] [nvarchar](max) NOT NULL,
	[Guests] [int] NOT NULL,
	[Purpose] [nvarchar](max) NULL,
	[Participants] [nvarchar](max) NULL,
	[Note] [nvarchar](max) NULL,
	[OrderStatus] [int] NOT NULL,
	[ApproverStatus] [int] NOT NULL,
	[DiscId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[OtherUser] [nvarchar](max) NULL,
	[DeliveryLocationId] [int] NOT NULL,
	[OrderType] [int] NOT NULL,
	[DeliveryDate] [datetime2](7) NOT NULL,
	[DeliveryTime] [nvarchar](max) NOT NULL,
	[Payed] [bit] NOT NULL,
	[AdministratorId] [int] NULL,
	[ApproverId] [int] NULL,
	[DistrictId] [int] NOT NULL,
	[HighestHierarchyLevel2] [int] NOT NULL,
	[HighestHierarchyLevel] [int] NOT NULL,
	[RequiresAdministration] [bit] NOT NULL,
	[TransactionId] [bigint] NULL,
	[IsDeleted] [bit] NOT NULL,
	[ToTime] [nvarchar](max) NULL,
	[Discriminator] [nvarchar](128) NOT NULL,
	[InternalOrderNote] [nvarchar](max) NULL,
	[ShowExcluded] [bit] NOT NULL,
	[ReviewerStatus] [int] NOT NULL,
	[ReviewDate] [datetime2](7) NULL,
	[ReviewerId] [int] NULL,
 CONSTRAINT [PK_dbo.OrderBase] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderCateringArticle]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderCateringArticle](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderBaseId] [int] NOT NULL,
	[ArticleId] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Total] [decimal](18, 2) NOT NULL,
	[DeliveryTime] [nvarchar](max) NULL,
	[Delivered] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.OrderCateringArticle] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDisabledDates]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDisabledDates](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [nvarchar](max) NOT NULL,
	[Disabled] [bit] NOT NULL,
	[HighestHierarchyLevel2] [int] NOT NULL,
	[HighestHierarchyLevel] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.OrderDisabledDates] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderMessage]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderMessage](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Message] [nvarchar](max) NULL,
	[UserName] [nvarchar](max) NULL,
	[OrderBaseId] [int] NULL,
	[UserId] [int] NULL,
	[OrderRole] [int] NOT NULL,
	[Date] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[hideFromPurchaser] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.OrderMessage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderMessageStatus]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderMessageStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderMessageId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[IsRead] [bit] NOT NULL,
	[OrderBaseId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.OrderMessageStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderMessageUnsubscribe]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderMessageUnsubscribe](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[OrderBaseId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.OrderMessageUnsubscribe] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderNumber]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderNumber](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Counter] [int] NOT NULL,
	[HighestHierarchyLevel2] [int] NOT NULL,
	[HighestHierarchyLevel] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.OrderNumber] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderResourceArticle]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderResourceArticle](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderBaseId] [int] NOT NULL,
	[ArticleId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[StartTime] [nvarchar](max) NOT NULL,
	[StopTime] [nvarchar](max) NOT NULL,
	[PriceDistrict] [int] NOT NULL,
	[Total] [decimal](18, 2) NOT NULL,
	[Room] [bit] NOT NULL,
	[Delivered] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.OrderResourceArticle] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderSettings]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderSettings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TransportRoutesActive] [bit] NOT NULL,
	[ShowOtherCustomer] [bit] NOT NULL,
	[ForceOtherCustomer] [bit] NOT NULL,
	[ForcePurpose] [bit] NOT NULL,
	[ForceParticipants] [bit] NOT NULL,
	[ForceNote] [bit] NOT NULL,
	[ClosedSaturday] [bit] NOT NULL,
	[ClosedSunday] [bit] NOT NULL,
	[LowestOrderValue] [int] NOT NULL,
	[DiscTypeCreditActive] [bit] NOT NULL,
	[DiscTypePrepaidActive] [bit] NOT NULL,
	[DiscTypeRepresentationActive] [bit] NOT NULL,
	[OrderCounterStartValue] [int] NOT NULL,
	[HighestHierarchyLevel2] [int] NOT NULL,
	[HighestHierarchyLevel] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[InternalOrderNote] [nvarchar](max) NULL,
	[HeadlineOrderOverview] [nvarchar](max) NULL,
	[ForceReviewer] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.OrderSettings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderSettingsCustomer]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderSettingsCustomer](
	[OrderSettings_Id] [int] NOT NULL,
	[Customer_Id] [int] NOT NULL,
 CONSTRAINT [PK_dbo.OrderSettingsCustomer] PRIMARY KEY CLUSTERED 
(
	[OrderSettings_Id] ASC,
	[Customer_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentBatch]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentBatch](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[User] [nvarchar](128) NULL,
	[UserReferenceId] [int] NOT NULL,
	[HighestHierarchyLevel2] [int] NOT NULL,
	[ExportRunDate] [datetime2](7) NOT NULL,
	[ExportToDate] [datetime2](7) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[DiscType] [tinyint] NOT NULL,
	[PaymentCount] [int] NOT NULL,
	[PaymentTotal] [decimal](18, 2) NOT NULL,
	[Status] [int] NOT NULL,
	[Log] [nvarchar](max) NULL,
	[ExportHistoryId] [int] NULL,
	[IsExportedByPtmIO] [bit] NULL,
	[IOExportRunId] [uniqueidentifier] NULL,
	[IOInvoiceExportReferenceKey] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.PaymentBatch] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentProviderAutoDebitTransaction]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentProviderAutoDebitTransaction](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DiscId] [int] NOT NULL,
	[DiscSerial] [nvarchar](max) NULL,
	[TransactionId] [nvarchar](max) NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[TransactionDate] [datetime2](7) NOT NULL,
	[TransactionMessage] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.PaymentProviderAutoDebitTransaction] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentProviderDiscLink]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentProviderDiscLink](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DiscId] [int] NOT NULL,
	[DiscSerialNumber] [nvarchar](max) NULL,
	[PanHash] [nvarchar](max) NULL,
	[TransactionId] [nvarchar](max) NULL,
	[HighestHierarchyLevel2] [int] NOT NULL,
	[HighestHierarchyLevel] [int] NOT NULL,
	[AutoDebitIfAmountLessThan] [decimal](18, 2) NOT NULL,
	[AutoDebitOnDayOfMonth] [int] NOT NULL,
	[AutoDebitAmount] [decimal](18, 2) NOT NULL,
	[ActivationDate] [datetime2](7) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.PaymentProviderDiscLink] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentProviderConfiguration]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentProviderConfiguration](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DesktopMerchantId] [nvarchar](max) NULL,
	[DesktopToken] [nvarchar](max) NULL,
	[MobileMerchantId] [nvarchar](max) NULL,
	[MobileToken] [nvarchar](max) NULL,
	[OrderNumber] [int] NOT NULL,
	[TestEnviroment] [bit] NOT NULL,
	[CashRegisterId] [int] NOT NULL,
	[TopUpValues] [nvarchar](max) NULL,
	[HighestHierarchyLevel2] [int] NOT NULL,
	[HighestHierarchyLevel] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[AutoDebitPeriodicalAllowed] [bit] NOT NULL,
	[AutoDebitMinimumValueAllowed] [bit] NOT NULL,
	[PeriodicalSubscriptionValues] [nvarchar](max) NULL,
	[BalanceBasedSubscriptionValues] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.PaymentProviderConfiguration] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentProviderTransaction]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentProviderTransaction](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TransactionIdFromProvider] [nvarchar](max) NULL,
	[AuthCodeFromProvider] [nvarchar](max) NULL,
	[StatusFromProvider] [nvarchar](max) NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[DiscId] [int] NULL,
	[TransactionId] [bigint] NOT NULL,
	[UserId] [int] NOT NULL,
	[HighestHierarchyLevel2] [int] NOT NULL,
	[HighestHierarchyLevel] [int] NOT NULL,
	[Mobile] [bit] NOT NULL,
	[DateTime] [datetime2](7) NOT NULL,
	[CashRegisterId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.PaymentProviderTransaction] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PluginPack]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PluginPack](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[FullName] [nvarchar](max) NOT NULL,
	[Version] [nvarchar](max) NOT NULL,
	[Content] [varbinary](max) NOT NULL,
	[OriginalFileName] [nvarchar](max) NOT NULL,
	[NormalizedFileName] [nvarchar](max) NOT NULL,
	[SortableVersion] [nvarchar](max) NOT NULL,
	[HighestHierarchyLevel2] [int] NOT NULL,
	[HighestHierarchyLevel] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.PluginPack] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PosLocalization]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PosLocalization](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Value] [nvarchar](255) NULL,
	[HighestHierarchyLevel2] [int] NOT NULL,
	[HighestHierarchyLevel] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.PosLocalization] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PosSetting]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PosSetting](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Value] [nvarchar](1000) NULL,
	[HighestHierarchyLevel2] [int] NOT NULL,
	[HighestHierarchyLevel] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.PosSetting] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PriceCorrection]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PriceCorrection](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ListNumber] [int] NOT NULL,
	[PriceReduction] [decimal](18, 2) NULL,
	[PriceReductionInPercent] [decimal](18, 2) NULL,
	[NewPrice] [decimal](18, 2) NULL,
	[Discriminator] [nvarchar](128) NOT NULL,
	[ArticleBase_Id] [int] NULL,
 CONSTRAINT [PK_dbo.PriceCorrection] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PrintEvent]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrintEvent](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetimeoffset](7) NOT NULL,
	[Data] [nvarchar](max) NOT NULL,
	[DeviceId] [int] NOT NULL,
	[DistrictId] [int] NOT NULL,
	[HighestHierarchyLevel2] [int] NOT NULL,
	[HighestHierarchyLevel] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ShowInPos] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.PrintEvent] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductionTime]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductionTime](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ArticleId] [int] NULL,
	[Days] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_dbo.ProductionTime] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PromptOptions]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PromptOptions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AskForProjectObject] [bit] NOT NULL,
	[AskForOperation] [bit] NOT NULL,
	[AskForGuestCount] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.PromptOptions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PtmVoucher]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PtmVoucher](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SerialNumber] [nvarchar](13) NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[DiscId] [int] NULL,
	[CashRegisterId] [int] NULL,
	[CashierId] [int] NULL,
	[Created] [datetime2](7) NOT NULL,
	[Expire] [datetime2](7) NOT NULL,
	[HighestHierarchyLevel2] [int] NOT NULL,
	[HighestHierarchyLevel] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.PtmVoucher] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegisterCashFloat]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegisterCashFloat](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DeviceNumber] [bigint] NULL,
	[DistrictNumber] [bigint] NULL,
	[ClerkId] [nvarchar](max) NULL,
	[SystemId] [nvarchar](max) NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[Voucher_Id] [bigint] NULL,
	[DeviceId] [int] NOT NULL,
	[DistrictId] [int] NOT NULL,
	[HighestHierarchyLevel2] [int] NOT NULL,
 CONSTRAINT [PK_dbo.RegisterCashFloat] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReportPortalEntity]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportPortalEntity](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReportName] [nvarchar](max) NULL,
	[ProcedureName] [nvarchar](max) NULL,
	[ColumnsInfo] [nvarchar](max) NULL,
	[ReportSummaryInfo] [nvarchar](max) NULL,
	[StoredProcedureParameters] [nvarchar](max) NULL,
	[ReportDescription] [nvarchar](max) NULL,
	[ReportsLevel] [int] NULL,
	[IsShared] [bit] NULL,
	[HighestHierarchyLevel] [int] NULL,
	[HighestHierarchyLevel2] [int] NULL,
	[DistrictId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReportResult]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportResult](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReportTypeId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DiscExport_Id] [int] NULL,
	[CashExport_Id] [int] NULL,
 CONSTRAINT [PK_dbo.ReportResult] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReportRun]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportRun](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RunDate] [datetime2](7) NOT NULL,
	[Result] [int] NOT NULL,
	[Content] [nvarchar](max) NULL,
	[Log] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
	[ReportResult_Id] [int] NULL,
 CONSTRAINT [PK_dbo.ReportRun] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReportType]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[AssemblyName] [nvarchar](max) NULL,
	[PluginTypeName] [nvarchar](max) NULL,
	[HighestHierarchyLevel2] [int] NOT NULL,
	[HighestHierarchyLevel] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[OutputPath] [nvarchar](max) NULL,
	[Configuration] [nvarchar](max) NULL,
	[ExportType] [int] NOT NULL,
	[WithoutBom] [bit] NULL,
 CONSTRAINT [PK_dbo.ReportType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalaryType]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalaryType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[IsDefault] [bit] NOT NULL,
	[HighestHierarchyLevel2] [int] NOT NULL,
	[HighestHierarchyLevel] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[FriendlyName] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.SalaryType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SchoolSystemAppSettings]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SchoolSystemAppSettings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LicenseKey] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[IsAdminPanel] [bit] NOT NULL,
	[MessageDelayTime] [int] NOT NULL,
	[PageDismissTime] [int] NOT NULL,
	[HighestHierarchyLevel2] [int] NOT NULL,
	[HighestHierarchyLevel] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.SchoolSystemAppSettings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SchoolSystemMealType]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SchoolSystemMealType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FromTime] [nvarchar](max) NOT NULL,
	[ToTime] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[ArticleBaseId] [int] NOT NULL,
	[OnlyOnePurchasePerMealType] [bit] NOT NULL,
	[HighestHierarchyLevel2] [int] NOT NULL,
	[HighestHierarchyLevel] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.SchoolSystemMealType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SchoolSystemMealTypeSchoolSystemAppSettings]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SchoolSystemMealTypeSchoolSystemAppSettings](
	[SchoolSystemMealType_Id] [int] NOT NULL,
	[SchoolSystemAppSettings_Id] [int] NOT NULL,
 CONSTRAINT [PK_dbo.SchoolSystemMealTypeSchoolSystemAppSettings] PRIMARY KEY CLUSTERED 
(
	[SchoolSystemMealType_Id] ASC,
	[SchoolSystemAppSettings_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SchoolSystemPermission]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SchoolSystemPermission](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Identifier] [nvarchar](max) NULL,
	[Prefix] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[DiscType] [int] NOT NULL,
	[HighestHierarchyLevel2] [int] NOT NULL,
	[HighestHierarchyLevel] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.SchoolSystemPermission] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SchoolSystemProfile]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SchoolSystemProfile](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[IsDefault] [bit] NOT NULL,
	[HighestHierarchyLevel2] [int] NOT NULL,
	[HighestHierarchyLevel] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.SchoolSystemProfile] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SchoolSystemProfilePermission]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SchoolSystemProfilePermission](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SchoolSystemProfileId] [int] NOT NULL,
	[SchoolSystemPermissionId] [int] NOT NULL,
	[HighestHierarchyLevel2] [int] NOT NULL,
	[HighestHierarchyLevel] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.SchoolSystemProfilePermission] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SchoolSystemSetting]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SchoolSystemSetting](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentDiscGroupId] [int] NOT NULL,
	[UpdateTime] [nvarchar](max) NOT NULL,
	[HighestHierarchyLevel2] [int] NOT NULL,
	[HighestHierarchyLevel] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.SchoolSystemSetting] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SchoolSystemUser]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SchoolSystemUser](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[SchoolSystemProfileId] [int] NOT NULL,
	[HighestHierarchyLevel2] [int] NOT NULL,
	[HighestHierarchyLevel] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.SchoolSystemUser] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SomeReport]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SomeReport](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Path] [nvarchar](max) NULL,
	[Content] [nvarchar](max) NULL,
	[CreatedAt] [datetimeoffset](7) NOT NULL,
	[CashierId] [int] NULL,
	[CashRegisterId] [int] NOT NULL,
	[Message] [nvarchar](max) NULL,
	[Exported] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.SomeReport] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stock]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CurrentAmount] [decimal](18, 2) NOT NULL,
	[CriticalAmount] [decimal](18, 2) NOT NULL,
	[LowAmount] [decimal](18, 2) NOT NULL,
	[OptimalAmount] [decimal](18, 2) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Stock] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Theme]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Theme](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[HighestHierarchyLevel] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Theme] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeRule]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeRule](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Priority] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Day] [int] NULL,
	[DisabledOnDays] [nvarchar](max) NULL,
	[DisabledOnHours] [nvarchar](max) NULL,
	[DisabledOnMonths] [nvarchar](max) NULL,
	[Month] [int] NULL,
	[From] [time](7) NULL,
	[To] [time](7) NULL,
	[Discriminator] [nvarchar](128) NOT NULL,
	[Discount_Id] [int] NULL,
	[PriceSelector_Id] [int] NULL,
	[DiscGroup_Id] [int] NULL,
 CONSTRAINT [PK_dbo.TimeRule] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransactionArticleRowKitchenMessage]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionArticleRowKitchenMessage](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](max) NULL,
	[TransactionArticle_ArticleId] [bigint] NOT NULL,
 CONSTRAINT [PK_dbo.TransactionArticleRowKitchenMessage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransactionArticleRowText]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionArticleRowText](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](max) NULL,
	[TransactionArticle_ArticleId] [bigint] NOT NULL,
 CONSTRAINT [PK_dbo.TransactionArticleRowText] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransactionPaymentRowText]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionPaymentRowText](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](max) NULL,
	[PaymentMedia_Id] [int] NOT NULL,
 CONSTRAINT [PK_dbo.TransactionPaymentRowText] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransactionTextRow]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionTextRow](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](max) NULL,
	[Transaction_Id] [bigint] NOT NULL,
 CONSTRAINT [PK_dbo.TransactionTextRow] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransportRoute]    Script Date: 11/26/2021 2:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransportRoute](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](40) NOT NULL,
	[Description] [nvarchar](80) NOT NULL,
	[HighestHierarchyLevel2] [int] NOT NULL,
	[HighestHierarchyLevel] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.TransportRoute] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[District]    Script Date: 11/26/2021 2:44:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[District](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[SettingsId] [int] NULL,
	[HighestHierarchyLevel2] [int] NOT NULL,
	[HighestHierarchyLevel] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DistrictNumber] [int] NOT NULL,
 CONSTRAINT [PK_dbo.District] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserCostCenter]    Script Date: 11/26/2021 2:44:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserCostCenter](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[CostCenterId] [int] NOT NULL,
	[IsApprover] [bit] NOT NULL,
	[IsDefault] [bit] NOT NULL,
	[UserId] [int] NULL,
 CONSTRAINT [PK_dbo.UserCostCenter] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 11/26/2021 2:44:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Role] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.UserRole] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Voucher]    Script Date: 11/26/2021 2:44:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Voucher](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Number] [int] NOT NULL,
	[Series] [nvarchar](128) NULL,
	[Name] [nvarchar](max) NULL,
	[DateTime] [datetime2](7) NOT NULL,
	[ExportDate] [datetime2](7) NOT NULL,
	[SystemId] [nvarchar](128) NULL,
	[BusinessSection] [nvarchar](128) NULL,
	[DistrictNumber] [int] NOT NULL,
	[DeviceNumber] [int] NOT NULL,
	[DistrictName] [nvarchar](max) NULL,
	[DeviceName] [nvarchar](max) NULL,
	[DeviceId] [int] NOT NULL,
	[DistrictId] [int] NOT NULL,
	[HighestHierarchyLevel2] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Voucher] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VoucherRow]    Script Date: 11/26/2021 2:44:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VoucherRow](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Number] [nvarchar](128) NULL,
	[Spender] [nvarchar](128) NULL,
	[Name] [nvarchar](max) NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[Voucher_Id] [bigint] NOT NULL,
	[Vat] [decimal](18, 2) NOT NULL,
	[RowType] [int] NOT NULL,
 CONSTRAINT [PK_dbo.VoucherRow] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebLog]    Script Date: 11/26/2021 2:44:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime2](7) NOT NULL,
	[Thread] [nvarchar](255) NULL,
	[Level] [nvarchar](50) NULL,
	[Logger] [nvarchar](255) NULL,
	[Method] [nvarchar](255) NULL,
	[Message] [nvarchar](4000) NULL,
	[Exception] [nvarchar](2000) NULL,
 CONSTRAINT [PK_dbo.WebLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Z2ReportQueue]    Script Date: 11/26/2021 2:44:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Z2ReportQueue](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SystemId] [nvarchar](128) NOT NULL,
	[DistrictNumber] [bigint] NOT NULL,
	[DeviceNumber] [bigint] NOT NULL,
	[DeviceId] [int] NOT NULL,
	[DistrictId] [int] NOT NULL,
	[HighestHierarchyLevel2] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Z2ReportQueue] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_DiscGroupId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_DiscGroupId] ON [dbo].[AccountDimension]
(
	[DiscGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AccountDimension_Id]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_AccountDimension_Id] ON [dbo].[AccountDimensionValue]
(
	[AccountDimension_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ArticleFilterId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_ArticleFilterId] ON [dbo].[ArticleBase]
(
	[ArticleFilterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ArticleTypeId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_ArticleTypeId] ON [dbo].[ArticleBase]
(
	[ArticleTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HighestHierarchyLevel2]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_HighestHierarchyLevel2] ON [dbo].[ArticleBase]
(
	[HighestHierarchyLevel2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_LastUpdated]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_LastUpdated] ON [dbo].[ArticleBase]
(
	[LastUpdatedDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_MerchandiseTypeId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_MerchandiseTypeId] ON [dbo].[ArticleBase]
(
	[MerchandiseTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_MixMatchGroupId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_MixMatchGroupId] ON [dbo].[ArticleBase]
(
	[MixMatchGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SalaryTypeId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_SalaryTypeId] ON [dbo].[ArticleBase]
(
	[SalaryTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_StockId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_StockId] ON [dbo].[ArticleBase]
(
	[StockId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_District_Id]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_District_Id] ON [dbo].[ArticleBase]
(
	[District_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DistrictId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_DistrictId] ON [dbo].[ArticleBase]
(
	[DistrictId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ArticleBase_Id]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_ArticleBase_Id] ON [dbo].[ArticleBaseArticleGroup]
(
	[ArticleBase_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ArticleGroup_Id]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_ArticleGroup_Id] ON [dbo].[ArticleBaseArticleGroup]
(
	[ArticleGroup_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_GetOneFreeThreshold_Id]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_GetOneFreeThreshold_Id] ON [dbo].[ArticleGroup]
(
	[GetOneFreeThreshold_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DistrictId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_DistrictId] ON [dbo].[ArticleGroup]
(
	[DistrictId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DistrictID]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_DistrictID] ON [dbo].[ArticleReportQueue]
(
	[DistrictId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ArticleReportQueue_Id]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_ArticleReportQueue_Id] ON [dbo].[ArticleReportQueueTransactionArticle]
(
	[ArticleReportQueue_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_TransactionArticle_ArticleId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_TransactionArticle_ArticleId] ON [dbo].[ArticleReportQueueTransactionArticle]
(
	[TransactionArticle_ArticleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AccountDimensionId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_AccountDimensionId] ON [dbo].[AttachedAccountDimensionValues]
(
	[AccountDimensionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DiscId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_DiscId] ON [dbo].[AttachedAccountDimensionValues]
(
	[DiscId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DiscGroupId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_DiscGroupId] ON [dbo].[DiscBase]
(
	[DiscGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HighestHierarchyLevel2]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_HighestHierarchyLevel2] ON [dbo].[DiscBase]
(
	[HighestHierarchyLevel2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[DiscBase]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ExportBatch_Id]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_ExportBatch_Id] ON [dbo].[DiscExport]
(
	[ExportBatch_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ExportProfileItemId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_ExportProfileItemId] ON [dbo].[DiscExport]
(
	[ExportProfileItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PaymentBatchId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_PaymentBatchId] ON [dbo].[DiscExport]
(
	[PaymentBatchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_GetOneFreeThresholdId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_GetOneFreeThresholdId] ON [dbo].[DiscGroup]
(
	[GetOneFreeThresholdId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PromptOptionsId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_PromptOptionsId] ON [dbo].[DiscGroup]
(
	[PromptOptionsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ArticleGroup_Id]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_ArticleGroup_Id] ON [dbo].[DiscGroupArticleGroup]
(
	[ArticleGroup_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DiscGroup_Id]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_DiscGroup_Id] ON [dbo].[DiscGroupArticleGroup]
(
	[DiscGroup_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CashExportBatch_Id]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_CashExportBatch_Id] ON [dbo].[CashExport]
(
	[CashExportBatch_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CashPaymentBatchId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_CashPaymentBatchId] ON [dbo].[CashExport]
(
	[CashPaymentBatchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ExportProfileItemId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_ExportProfileItemId] ON [dbo].[CashExport]
(
	[ExportProfileItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ExportProfileId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_ExportProfileId] ON [dbo].[CashExportBatch]
(
	[ExportProfileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[CashExportBatch]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HighestHierarchyLevel2]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_HighestHierarchyLevel2] ON [dbo].[Cashier]
(
	[HighestHierarchyLevel2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[Cashier]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DistrictId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_DistrictId] ON [dbo].[Cashier]
(
	[DistrictId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HighestHierarchyLevel2]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_HighestHierarchyLevel2] ON [dbo].[CashRegister]
(
	[HighestHierarchyLevel2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SettingsId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_SettingsId] ON [dbo].[CashRegister]
(
	[SettingsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DistrictId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_DistrictId] ON [dbo].[CashRegister]
(
	[DistrictId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Voucher_Id]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_Voucher_Id] ON [dbo].[ClerkReport]
(
	[Voucher_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SettingsId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_SettingsId] ON [dbo].[City]
(
	[SettingsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ThemeId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_ThemeId] ON [dbo].[City]
(
	[ThemeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CustomerId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_CustomerId] ON [dbo].[CostCenter]
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AddressId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_AddressId] ON [dbo].[Customer]
(
	[AddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AlternativeAddressId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_AlternativeAddressId] ON [dbo].[Customer]
(
	[AlternativeAddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DistrictID]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_DistrictID] ON [dbo].[DailyReport]
(
	[DistrictId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CashRegister_Id]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_CashRegister_Id] ON [dbo].[DbFile]
(
	[CashRegister_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CashRegisterId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_CashRegisterId] ON [dbo].[DeliveryArea]
(
	[CashRegisterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DistrictId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_DistrictId] ON [dbo].[DeliveryArea]
(
	[DistrictId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ArticleGroupId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_ArticleGroupId] ON [dbo].[DeliveryLocationBase]
(
	[ArticleGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DeliveryAreaId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_DeliveryAreaId] ON [dbo].[DeliveryLocationBase]
(
	[DeliveryAreaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RoomArticleId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoomArticleId] ON [dbo].[DeliveryLocationBase]
(
	[RoomArticleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_TransportRouteId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_TransportRouteId] ON [dbo].[DeliveryLocationBase]
(
	[TransportRouteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DeliveryLocationId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_DeliveryLocationId] ON [dbo].[DeliveryLocationTime]
(
	[DeliveryLocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CustomerId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_CustomerId] ON [dbo].[Department]
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DiscGroup_Id]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_DiscGroup_Id] ON [dbo].[Discount]
(
	[DiscGroup_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Article_Id]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_Article_Id] ON [dbo].[DiscountArticle]
(
	[Article_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Discount_Id]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_Discount_Id] ON [dbo].[DiscountArticle]
(
	[Discount_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ArticleGroup_Id]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_ArticleGroup_Id] ON [dbo].[DiscountArticleGroup]
(
	[ArticleGroup_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Discount_Id]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_Discount_Id] ON [dbo].[DiscountArticleGroup]
(
	[Discount_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DiscId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_DiscId] ON [dbo].[Event]
(
	[DiscId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[Event]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ArticleId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_ArticleId] ON [dbo].[ExcludeFromDeadline]
(
	[ArticleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DeliveryLocationId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_DeliveryLocationId] ON [dbo].[ExcludeFromDeadline]
(
	[DeliveryLocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ExportProfileId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_ExportProfileId] ON [dbo].[ExportBatch]
(
	[ExportProfileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[ExportBatch]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CustomerId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_CustomerId] ON [dbo].[ExportProfileItem]
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ExportProfile_Id]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_ExportProfile_Id] ON [dbo].[ExportProfileItem]
(
	[ExportProfile_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ExportProfileItem_Id]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_ExportProfileItem_Id] ON [dbo].[ExportProfileItemFileExport]
(
	[ExportProfileItem_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FileExport_Id]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_FileExport_Id] ON [dbo].[ExportProfileItemFileExport]
(
	[FileExport_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HighestHierarchyLevel2]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_HighestHierarchyLevel2] ON [dbo].[User]
(
	[HighestHierarchyLevel2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CustomerId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_CustomerId] ON [dbo].[User]
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DepartmentId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_DepartmentId] ON [dbo].[User]
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_LastUpdated]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_LastUpdated] ON [dbo].[User]
(
	[LastUpdated] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PreferedApproverId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_PreferedApproverId] ON [dbo].[User]
(
	[PreferedApproverId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DistrictId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_DistrictId] ON [dbo].[User]
(
	[DistrictId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_WorkAddressId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_WorkAddressId] ON [dbo].[User]
(
	[WorkAddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ArticleBase_Id]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_ArticleBase_Id] ON [dbo].[KitchenPrinterArticleBase]
(
	[ArticleBase_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_KitchenPrinter_Id]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_KitchenPrinter_Id] ON [dbo].[KitchenPrinterArticleBase]
(
	[KitchenPrinter_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ArticleId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_ArticleId] ON [dbo].[MandatoryArticles]
(
	[ArticleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DeliveryLocationId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_DeliveryLocationId] ON [dbo].[MandatoryArticles]
(
	[DeliveryLocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Id]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_Id] ON [dbo].[Order]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_MainOrder_Id]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_MainOrder_Id] ON [dbo].[Order]
(
	[MainOrder_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AccountDimensionId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_AccountDimensionId] ON [dbo].[OrderAccountDimension]
(
	[AccountDimensionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderBaseId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderBaseId] ON [dbo].[OrderAccountDimension]
(
	[OrderBaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderAccountDimensionId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderAccountDimensionId] ON [dbo].[OrderAccountDimensionMetadata]
(
	[OrderAccountDimensionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ArticleId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_ArticleId] ON [dbo].[OrderAnomaly]
(
	[ArticleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderBaseId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderBaseId] ON [dbo].[OrderAnomaly]
(
	[OrderBaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Anomaly_Id]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_Anomaly_Id] ON [dbo].[OrderAnomalyAnomaly]
(
	[Anomaly_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderAnomaly_Id]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderAnomaly_Id] ON [dbo].[OrderAnomalyAnomaly]
(
	[OrderAnomaly_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AdministratorId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_AdministratorId] ON [dbo].[OrderBase]
(
	[AdministratorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ApproverId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_ApproverId] ON [dbo].[OrderBase]
(
	[ApproverId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DiscId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_DiscId] ON [dbo].[OrderBase]
(
	[DiscId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DeliveryLocationId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_DeliveryLocationId] ON [dbo].[OrderBase]
(
	[DeliveryLocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ReviewerId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_ReviewerId] ON [dbo].[OrderBase]
(
	[ReviewerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[OrderBase]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ArticleId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_ArticleId] ON [dbo].[OrderCateringArticle]
(
	[ArticleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderBaseId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderBaseId] ON [dbo].[OrderCateringArticle]
(
	[OrderBaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderBaseId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderBaseId] ON [dbo].[OrderMessage]
(
	[OrderBaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[OrderMessage]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderBaseId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderBaseId] ON [dbo].[OrderMessageStatus]
(
	[OrderBaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderMessageId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderMessageId] ON [dbo].[OrderMessageStatus]
(
	[OrderMessageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[OrderMessageStatus]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderBaseId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderBaseId] ON [dbo].[OrderMessageUnsubscribe]
(
	[OrderBaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[OrderMessageUnsubscribe]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HighestHierarchyLevel2]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_HighestHierarchyLevel2] ON [dbo].[OrderNumber]
(
	[HighestHierarchyLevel2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ArticleId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_ArticleId] ON [dbo].[OrderResourceArticle]
(
	[ArticleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderBaseId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderBaseId] ON [dbo].[OrderResourceArticle]
(
	[OrderBaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Customer_Id]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_Customer_Id] ON [dbo].[OrderSettingsCustomer]
(
	[Customer_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderSettings_Id]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderSettings_Id] ON [dbo].[OrderSettingsCustomer]
(
	[OrderSettings_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HighestHierarchyLevel2]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_HighestHierarchyLevel2] ON [dbo].[PaymentProviderConfiguration]
(
	[HighestHierarchyLevel2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[PaymentProviderTransaction]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ArticleBase_Id]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_ArticleBase_Id] ON [dbo].[PriceCorrection]
(
	[ArticleBase_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DiscGroup_Id]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_DiscGroup_Id] ON [dbo].[PriceSelector]
(
	[DiscGroup_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Article_Id]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_Article_Id] ON [dbo].[PriceSelectorArticle]
(
	[Article_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PriceSelector_Id]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_PriceSelector_Id] ON [dbo].[PriceSelectorArticle]
(
	[PriceSelector_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DistrictID]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_DistrictID] ON [dbo].[PrintEvent]
(
	[DistrictId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ArticleId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_ArticleId] ON [dbo].[ProductionTime]
(
	[ArticleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DiscId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_DiscId] ON [dbo].[PtmVoucher]
(
	[DiscId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CashierId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_CashierId] ON [dbo].[PtmVoucher]
(
	[CashierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CashRegisterId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_CashRegisterId] ON [dbo].[PtmVoucher]
(
	[CashRegisterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SerialNumber]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_SerialNumber] ON [dbo].[PtmVoucher]
(
	[SerialNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Voucher_Id]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_Voucher_Id] ON [dbo].[RegisterCashFloat]
(
	[Voucher_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DiscExport_Id]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_DiscExport_Id] ON [dbo].[ReportResult]
(
	[DiscExport_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CashExport_Id]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_CashExport_Id] ON [dbo].[ReportResult]
(
	[CashExport_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ReportTypeId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_ReportTypeId] ON [dbo].[ReportResult]
(
	[ReportTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ReportResult_Id]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_ReportResult_Id] ON [dbo].[ReportRun]
(
	[ReportResult_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ArticleBaseId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_ArticleBaseId] ON [dbo].[SchoolSystemMealType]
(
	[ArticleBaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SchoolSystemAppSettings_Id]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_SchoolSystemAppSettings_Id] ON [dbo].[SchoolSystemMealTypeSchoolSystemAppSettings]
(
	[SchoolSystemAppSettings_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SchoolSystemMealType_Id]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_SchoolSystemMealType_Id] ON [dbo].[SchoolSystemMealTypeSchoolSystemAppSettings]
(
	[SchoolSystemMealType_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SchoolSystemPermissionId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_SchoolSystemPermissionId] ON [dbo].[SchoolSystemProfilePermission]
(
	[SchoolSystemPermissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SchoolSystemProfileId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_SchoolSystemProfileId] ON [dbo].[SchoolSystemProfilePermission]
(
	[SchoolSystemProfileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[SchoolSystemUser]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SchoolSystemProfileId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_SchoolSystemProfileId] ON [dbo].[SchoolSystemUser]
(
	[SchoolSystemProfileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CashierId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_CashierId] ON [dbo].[SomeReport]
(
	[CashierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CashRegisterId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_CashRegisterId] ON [dbo].[SomeReport]
(
	[CashRegisterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DiscGroup_Id]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_DiscGroup_Id] ON [dbo].[TimeRule]
(
	[DiscGroup_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Discount_Id]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_Discount_Id] ON [dbo].[TimeRule]
(
	[Discount_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PriceSelector_Id]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_PriceSelector_Id] ON [dbo].[TimeRule]
(
	[PriceSelector_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClerkReport_Id]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_ClerkReport_Id] ON [dbo].[Transaction]
(
	[ClerkReport_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Identifier]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Identifier] ON [dbo].[Transaction]
(
	[Identifier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Transaction_DateTime]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_Transaction_DateTime] ON [dbo].[Transaction]
(
	[DateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Transaction_Type]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_Transaction_Type] ON [dbo].[Transaction]
(
	[TransactionType] ASC
)
INCLUDE([DateTime]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Transaction_Type_DateTime]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_Transaction_Type_DateTime] ON [dbo].[Transaction]
(
	[TransactionType] ASC,
	[DateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DistrictID]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_DistrictID] ON [dbo].[Transaction]
(
	[DistrictId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Voucher_Id]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_Voucher_Id] ON [dbo].[Transaction]
(
	[Voucher_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Z2ReportQueue_Id]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_Z2ReportQueue_Id] ON [dbo].[Transaction]
(
	[Z2ReportQueue_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_MainArticle_ArticleId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_MainArticle_ArticleId] ON [dbo].[TransactionArticleRow]
(
	[MainArticle_ArticleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Transaction_Id]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_Transaction_Id] ON [dbo].[TransactionArticleRow]
(
	[Transaction_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_TransactionArticle_ArticleId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_TransactionArticle_ArticleId] ON [dbo].[TransactionArticleRowKitchenMessage]
(
	[TransactionArticle_ArticleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_TransactionArticle_ArticleId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_TransactionArticle_ArticleId] ON [dbo].[TransactionArticleRowText]
(
	[TransactionArticle_ArticleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CashBatch_Id]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_CashBatch_Id] ON [dbo].[TransactionPaymentRow]
(
	[CashBatch_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PaymentMedia_Type_DiscType]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_PaymentMedia_Type_DiscType] ON [dbo].[TransactionPaymentRow]
(
	[MediaType] ASC,
	[PTMDisc_DiscType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PTMDisc_PaymentBatch_Id]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_PTMDisc_PaymentBatch_Id] ON [dbo].[TransactionPaymentRow]
(
	[PTMDisc_PaymentBatch_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Transaction_Id]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_Transaction_Id] ON [dbo].[TransactionPaymentRow]
(
	[Transaction_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PaymentMedia_Id]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_PaymentMedia_Id] ON [dbo].[TransactionPaymentRowText]
(
	[PaymentMedia_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Transaction_Id]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_Transaction_Id] ON [dbo].[TransactionTextRow]
(
	[Transaction_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HighestHierarchyLevel2]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_HighestHierarchyLevel2] ON [dbo].[District]
(
	[HighestHierarchyLevel2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SettingsId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_SettingsId] ON [dbo].[District]
(
	[SettingsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CostCenterId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_CostCenterId] ON [dbo].[UserCostCenter]
(
	[CostCenterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[UserCostCenter]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[UserRole]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Voucher_Id]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_Voucher_Id] ON [dbo].[VoucherRow]
(
	[Voucher_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Z2_System_District_Device_HighestHierarchyLevel2]    Script Date: 11/26/2021 2:44:34 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Z2_System_District_Device_HighestHierarchyLevel2] ON [dbo].[Z2ReportQueue]
(
	[SystemId] ASC,
	[DistrictNumber] ASC,
	[DeviceNumber] ASC,
	[HighestHierarchyLevel2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AccountDimension] ADD  DEFAULT ((0)) FOR [ActiveInOrderFlow]
GO
ALTER TABLE [dbo].[ArticleBase] ADD  DEFAULT ((0)) FOR [ComparePrice]
GO
ALTER TABLE [dbo].[ArticleBase] ADD  DEFAULT ((0)) FOR [ComparePriceDistrict]
GO
ALTER TABLE [dbo].[ArticleBase] ADD  DEFAULT ((1)) FOR [DeliverMonday]
GO
ALTER TABLE [dbo].[ArticleBase] ADD  DEFAULT ((1)) FOR [DeliverTuesday]
GO
ALTER TABLE [dbo].[ArticleBase] ADD  DEFAULT ((1)) FOR [DeliverWednesday]
GO
ALTER TABLE [dbo].[ArticleBase] ADD  DEFAULT ((1)) FOR [DeliverThursday]
GO
ALTER TABLE [dbo].[ArticleBase] ADD  DEFAULT ((1)) FOR [DeliverFriday]
GO
ALTER TABLE [dbo].[ArticleBase] ADD  DEFAULT ((1)) FOR [DeliverSaturday]
GO
ALTER TABLE [dbo].[ArticleBase] ADD  DEFAULT ((1)) FOR [DeliverSunday]
GO
ALTER TABLE [dbo].[ArticleReportQueue] ADD  DEFAULT ((0)) FOR [DeviceId]
GO
ALTER TABLE [dbo].[ArticleReportQueue] ADD  DEFAULT ((0)) FOR [DistrictId]
GO
ALTER TABLE [dbo].[ArticleReportQueue] ADD  DEFAULT ((0)) FOR [HighestHierarchyLevel2]
GO
ALTER TABLE [dbo].[DiscBase] ADD  DEFAULT (newid()) FOR [Identifier]
GO
ALTER TABLE [dbo].[DiscBase] ADD  DEFAULT ('1900-01-01') FOR [LastUpdated]
GO
ALTER TABLE [dbo].[CashRegister] ADD  DEFAULT ((0)) FOR [DeviceNumber]
GO
ALTER TABLE [dbo].[CashRegister] ADD  DEFAULT ('1900-01-01') FOR [LastUpdated]
GO
ALTER TABLE [dbo].[City] ADD  DEFAULT ((0)) FOR [EnforceEmployeeNumbers]
GO
ALTER TABLE [dbo].[City] ADD  DEFAULT ((0)) FOR [EmployeePersonalNumberLength]
GO
ALTER TABLE [dbo].[City] ADD  DEFAULT ((0)) FOR [SessionTimeout]
GO
ALTER TABLE [dbo].[City] ADD  DEFAULT ((0)) FOR [AllowedLogins]
GO
ALTER TABLE [dbo].[City] ADD  DEFAULT ((0)) FOR [PasswordComplexity]
GO
ALTER TABLE [dbo].[City] ADD  DEFAULT ('AEQLz9VHJkhEM1I92tTJVG3zPEJGERNP+eJI8WIjfRzgo705YWDvRWStPCBLPIZtQg==') FOR [CashRegistersToken]
GO
ALTER TABLE [dbo].[Counter] ADD  DEFAULT ((0)) FOR [HighestHierarchyLevel2]
GO
ALTER TABLE [dbo].[Counter] ADD  DEFAULT ((0)) FOR [HighestHierarchyLevel]
GO
ALTER TABLE [dbo].[Customer] ADD  DEFAULT (NULL) FOR [IdFromOtherSystem2]
GO
ALTER TABLE [dbo].[DeliveryLocationBase] ADD  DEFAULT ((0)) FOR [DeliveryTimeOffset]
GO
ALTER TABLE [dbo].[Country] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[ExportProfile] ADD  DEFAULT ((0)) FOR [CashExport]
GO
ALTER TABLE [dbo].[ExportProfileItem] ADD  DEFAULT ((0)) FOR [CashExport]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT ((0)) FOR [LoginAttempts]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT ((0)) FOR [isBlocked]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT (sysdatetimeoffset()) FOR [LastUpdated]
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT ((0)) FOR [DeviceId]
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT ((0)) FOR [DistrictId]
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT ((0)) FOR [HighestHierarchyLevel2]
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT ((0)) FOR [HighestHierarchyLevel]
GO
ALTER TABLE [dbo].[OrderAccountDimension] ADD  DEFAULT ((0)) FOR [ForcedRule]
GO
ALTER TABLE [dbo].[OrderBase] ADD  DEFAULT ((0)) FOR [ShowExcluded]
GO
ALTER TABLE [dbo].[OrderBase] ADD  DEFAULT ((0)) FOR [ReviewerStatus]
GO
ALTER TABLE [dbo].[OrderMessage] ADD  DEFAULT ((0)) FOR [hideFromPurchaser]
GO
ALTER TABLE [dbo].[OrderSettings] ADD  DEFAULT ((0)) FOR [ForceReviewer]
GO
ALTER TABLE [dbo].[PaymentProviderConfiguration] ADD  DEFAULT ((0)) FOR [AutoDebitPeriodicalAllowed]
GO
ALTER TABLE [dbo].[PaymentProviderConfiguration] ADD  DEFAULT ((0)) FOR [AutoDebitMinimumValueAllowed]
GO
ALTER TABLE [dbo].[PrintEvent] ADD  DEFAULT ((0)) FOR [ShowInPos]
GO
ALTER TABLE [dbo].[RegisterCashFloat] ADD  DEFAULT ((0)) FOR [DeviceId]
GO
ALTER TABLE [dbo].[RegisterCashFloat] ADD  DEFAULT ((0)) FOR [DistrictId]
GO
ALTER TABLE [dbo].[RegisterCashFloat] ADD  DEFAULT ((0)) FOR [HighestHierarchyLevel2]
GO
ALTER TABLE [dbo].[ReportType] ADD  DEFAULT ((0)) FOR [ExportType]
GO
ALTER TABLE [dbo].[Transaction] ADD  DEFAULT ((0)) FOR [DeviceId]
GO
ALTER TABLE [dbo].[Transaction] ADD  DEFAULT ((0)) FOR [DistrictId]
GO
ALTER TABLE [dbo].[Transaction] ADD  DEFAULT ((0)) FOR [HighestHierarchyLevel2]
GO
ALTER TABLE [dbo].[Transaction] ADD  DEFAULT ((0)) FOR [HighestHierarchyLevel]
GO
ALTER TABLE [dbo].[Transaction] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Identifier]
GO
ALTER TABLE [dbo].[Transaction] ADD  DEFAULT ((0)) FOR [Exported]
GO
ALTER TABLE [dbo].[District] ADD  DEFAULT ((0)) FOR [DistrictNumber]
GO
ALTER TABLE [dbo].[Voucher] ADD  DEFAULT ((0)) FOR [DeviceId]
GO
ALTER TABLE [dbo].[Voucher] ADD  DEFAULT ((0)) FOR [DistrictId]
GO
ALTER TABLE [dbo].[Voucher] ADD  DEFAULT ((0)) FOR [HighestHierarchyLevel2]
GO
ALTER TABLE [dbo].[VoucherRow] ADD  DEFAULT ((0)) FOR [Vat]
GO
ALTER TABLE [dbo].[VoucherRow] ADD  DEFAULT ((0)) FOR [RowType]
GO
ALTER TABLE [dbo].[Z2ReportQueue] ADD  DEFAULT ((0)) FOR [DeviceId]
GO
ALTER TABLE [dbo].[Z2ReportQueue] ADD  DEFAULT ((0)) FOR [DistrictId]
GO
ALTER TABLE [dbo].[Z2ReportQueue] ADD  DEFAULT ((0)) FOR [HighestHierarchyLevel2]
GO
ALTER TABLE [dbo].[AccountDimension]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AccountDimension_dbo.DiscGroup_DiscGroupId] FOREIGN KEY([DiscGroupId])
REFERENCES [dbo].[DiscGroup] ([Id])
GO
ALTER TABLE [dbo].[AccountDimension] CHECK CONSTRAINT [FK_dbo.AccountDimension_dbo.DiscGroup_DiscGroupId]
GO
ALTER TABLE [dbo].[AccountDimensionValue]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AccountDimensionValue_dbo.AccountDimension_AccountDimension_Id] FOREIGN KEY([AccountDimension_Id])
REFERENCES [dbo].[AccountDimension] ([Id])
GO
ALTER TABLE [dbo].[AccountDimensionValue] CHECK CONSTRAINT [FK_dbo.AccountDimensionValue_dbo.AccountDimension_AccountDimension_Id]
GO
ALTER TABLE [dbo].[ArticleBase]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ArticleBase_dbo.ArticleFilter_ArticleFilterId] FOREIGN KEY([ArticleFilterId])
REFERENCES [dbo].[ArticleFilter] ([Id])
GO
ALTER TABLE [dbo].[ArticleBase] CHECK CONSTRAINT [FK_dbo.ArticleBase_dbo.ArticleFilter_ArticleFilterId]
GO
ALTER TABLE [dbo].[ArticleBase]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ArticleBase_dbo.ArticleType_ArticleTypeId] FOREIGN KEY([ArticleTypeId])
REFERENCES [dbo].[ArticleType] ([Id])
GO
ALTER TABLE [dbo].[ArticleBase] CHECK CONSTRAINT [FK_dbo.ArticleBase_dbo.ArticleType_ArticleTypeId]
GO
ALTER TABLE [dbo].[ArticleBase]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ArticleBase_dbo.City_HighestHierarchyLevel2] FOREIGN KEY([HighestHierarchyLevel2])
REFERENCES [dbo].[City] ([Id])
GO
ALTER TABLE [dbo].[ArticleBase] CHECK CONSTRAINT [FK_dbo.ArticleBase_dbo.City_HighestHierarchyLevel2]
GO
ALTER TABLE [dbo].[ArticleBase]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ArticleBase_dbo.MerchandiseType_MerchandiseTypeId] FOREIGN KEY([MerchandiseTypeId])
REFERENCES [dbo].[MerchandiseType] ([Id])
GO
ALTER TABLE [dbo].[ArticleBase] CHECK CONSTRAINT [FK_dbo.ArticleBase_dbo.MerchandiseType_MerchandiseTypeId]
GO
ALTER TABLE [dbo].[ArticleBase]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ArticleBase_dbo.MixMatchGroup_MixMatchGroupId] FOREIGN KEY([MixMatchGroupId])
REFERENCES [dbo].[MixMatchGroup] ([Id])
GO
ALTER TABLE [dbo].[ArticleBase] CHECK CONSTRAINT [FK_dbo.ArticleBase_dbo.MixMatchGroup_MixMatchGroupId]
GO
ALTER TABLE [dbo].[ArticleBase]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ArticleBase_dbo.SalaryType_SalaryTypeId] FOREIGN KEY([SalaryTypeId])
REFERENCES [dbo].[SalaryType] ([Id])
GO
ALTER TABLE [dbo].[ArticleBase] CHECK CONSTRAINT [FK_dbo.ArticleBase_dbo.SalaryType_SalaryTypeId]
GO
ALTER TABLE [dbo].[ArticleBase]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ArticleBase_dbo.Stock_StockId] FOREIGN KEY([StockId])
REFERENCES [dbo].[Stock] ([Id])
GO
ALTER TABLE [dbo].[ArticleBase] CHECK CONSTRAINT [FK_dbo.ArticleBase_dbo.Stock_StockId]
GO
ALTER TABLE [dbo].[ArticleBase]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ArticleBase_dbo.District_District_Id] FOREIGN KEY([District_Id])
REFERENCES [dbo].[District] ([Id])
GO
ALTER TABLE [dbo].[ArticleBase] CHECK CONSTRAINT [FK_dbo.ArticleBase_dbo.District_District_Id]
GO
ALTER TABLE [dbo].[ArticleBase]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ArticleBase_dbo.District_DistrictId] FOREIGN KEY([DistrictId])
REFERENCES [dbo].[District] ([Id])
GO
ALTER TABLE [dbo].[ArticleBase] CHECK CONSTRAINT [FK_dbo.ArticleBase_dbo.District_DistrictId]
GO
ALTER TABLE [dbo].[ArticleBaseArticleGroup]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ArticleBaseArticleGroup_dbo.ArticleBase_ArticleBase_Id] FOREIGN KEY([ArticleBase_Id])
REFERENCES [dbo].[ArticleBase] ([Id])
GO
ALTER TABLE [dbo].[ArticleBaseArticleGroup] CHECK CONSTRAINT [FK_dbo.ArticleBaseArticleGroup_dbo.ArticleBase_ArticleBase_Id]
GO
ALTER TABLE [dbo].[ArticleBaseArticleGroup]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ArticleBaseArticleGroup_dbo.ArticleGroup_ArticleGroup_Id] FOREIGN KEY([ArticleGroup_Id])
REFERENCES [dbo].[ArticleGroup] ([Id])
GO
ALTER TABLE [dbo].[ArticleBaseArticleGroup] CHECK CONSTRAINT [FK_dbo.ArticleBaseArticleGroup_dbo.ArticleGroup_ArticleGroup_Id]
GO
ALTER TABLE [dbo].[ArticleGroup]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ArticleGroup_dbo.GetOneFreeThreshold_GetOneFreeThreshold_Id] FOREIGN KEY([GetOneFreeThreshold_Id])
REFERENCES [dbo].[GetOneFreeThreshold] ([Id])
GO
ALTER TABLE [dbo].[ArticleGroup] CHECK CONSTRAINT [FK_dbo.ArticleGroup_dbo.GetOneFreeThreshold_GetOneFreeThreshold_Id]
GO
ALTER TABLE [dbo].[ArticleGroup]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ArticleGroup_dbo.District_DistrictId] FOREIGN KEY([DistrictId])
REFERENCES [dbo].[District] ([Id])
GO
ALTER TABLE [dbo].[ArticleGroup] CHECK CONSTRAINT [FK_dbo.ArticleGroup_dbo.District_DistrictId]
GO
ALTER TABLE [dbo].[ArticleReportQueueTransactionArticle]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ArticleReportQueueTransactionArticle_dbo.ArticleReportQueue_ArticleReportQueue_Id] FOREIGN KEY([ArticleReportQueue_Id])
REFERENCES [dbo].[ArticleReportQueue] ([Id])
GO
ALTER TABLE [dbo].[ArticleReportQueueTransactionArticle] CHECK CONSTRAINT [FK_dbo.ArticleReportQueueTransactionArticle_dbo.ArticleReportQueue_ArticleReportQueue_Id]
GO
ALTER TABLE [dbo].[ArticleReportQueueTransactionArticle]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ArticleReportQueueTransactionArticle_dbo.TransactionArticleRow_TransactionArticle_ArticleId] FOREIGN KEY([TransactionArticle_ArticleId])
REFERENCES [dbo].[TransactionArticleRow] ([Id])
GO
ALTER TABLE [dbo].[ArticleReportQueueTransactionArticle] CHECK CONSTRAINT [FK_dbo.ArticleReportQueueTransactionArticle_dbo.TransactionArticleRow_TransactionArticle_ArticleId]
GO
ALTER TABLE [dbo].[AttachedAccountDimensionValues]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AttachedAccountDimensionValues_dbo.AccountDimension_AccountDimensionId] FOREIGN KEY([AccountDimensionId])
REFERENCES [dbo].[AccountDimension] ([Id])
GO
ALTER TABLE [dbo].[AttachedAccountDimensionValues] CHECK CONSTRAINT [FK_dbo.AttachedAccountDimensionValues_dbo.AccountDimension_AccountDimensionId]
GO
ALTER TABLE [dbo].[AttachedAccountDimensionValues]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AttachedAccountDimensionValues_dbo.DiscBase_DiscId] FOREIGN KEY([DiscId])
REFERENCES [dbo].[DiscBase] ([Id])
GO
ALTER TABLE [dbo].[AttachedAccountDimensionValues] CHECK CONSTRAINT [FK_dbo.AttachedAccountDimensionValues_dbo.DiscBase_DiscId]
GO
ALTER TABLE [dbo].[DiscBase]  WITH CHECK ADD  CONSTRAINT [FK_dbo.DiscBase_dbo.DiscGroup_DiscGroupId] FOREIGN KEY([DiscGroupId])
REFERENCES [dbo].[DiscGroup] ([Id])
GO
ALTER TABLE [dbo].[DiscBase] CHECK CONSTRAINT [FK_dbo.DiscBase_dbo.DiscGroup_DiscGroupId]
GO
ALTER TABLE [dbo].[DiscBase]  WITH CHECK ADD  CONSTRAINT [FK_dbo.DiscBase_dbo.City_HighestHierarchyLevel2] FOREIGN KEY([HighestHierarchyLevel2])
REFERENCES [dbo].[City] ([Id])
GO
ALTER TABLE [dbo].[DiscBase] CHECK CONSTRAINT [FK_dbo.DiscBase_dbo.City_HighestHierarchyLevel2]
GO
ALTER TABLE [dbo].[DiscBase]  WITH CHECK ADD  CONSTRAINT [FK_dbo.DiscBase_dbo.User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[DiscBase] CHECK CONSTRAINT [FK_dbo.DiscBase_dbo.User_UserId]
GO
ALTER TABLE [dbo].[DiscExport]  WITH CHECK ADD  CONSTRAINT [FK_dbo.DiscExport_dbo.ExportBatch_ExportBatch_Id] FOREIGN KEY([ExportBatch_Id])
REFERENCES [dbo].[ExportBatch] ([Id])
GO
ALTER TABLE [dbo].[DiscExport] CHECK CONSTRAINT [FK_dbo.DiscExport_dbo.ExportBatch_ExportBatch_Id]
GO
ALTER TABLE [dbo].[DiscExport]  WITH CHECK ADD  CONSTRAINT [FK_dbo.DiscExport_dbo.ExportProfileItem_ExportProfileItemId] FOREIGN KEY([ExportProfileItemId])
REFERENCES [dbo].[ExportProfileItem] ([Id])
GO
ALTER TABLE [dbo].[DiscExport] CHECK CONSTRAINT [FK_dbo.DiscExport_dbo.ExportProfileItem_ExportProfileItemId]
GO
ALTER TABLE [dbo].[DiscExport]  WITH CHECK ADD  CONSTRAINT [FK_dbo.DiscExport_dbo.PaymentBatch_PaymentBatchId] FOREIGN KEY([PaymentBatchId])
REFERENCES [dbo].[PaymentBatch] ([Id])
GO
ALTER TABLE [dbo].[DiscExport] CHECK CONSTRAINT [FK_dbo.DiscExport_dbo.PaymentBatch_PaymentBatchId]
GO
ALTER TABLE [dbo].[DiscGroup]  WITH CHECK ADD  CONSTRAINT [FK_dbo.DiscGroup_dbo.GetOneFreeThreshold_GetOneFreeThresholdId] FOREIGN KEY([GetOneFreeThresholdId])
REFERENCES [dbo].[GetOneFreeThreshold] ([Id])
GO
ALTER TABLE [dbo].[DiscGroup] CHECK CONSTRAINT [FK_dbo.DiscGroup_dbo.GetOneFreeThreshold_GetOneFreeThresholdId]
GO
ALTER TABLE [dbo].[DiscGroup]  WITH CHECK ADD  CONSTRAINT [FK_dbo.DiscGroup_dbo.PromptOptions_PromptOptionsId] FOREIGN KEY([PromptOptionsId])
REFERENCES [dbo].[PromptOptions] ([Id])
GO
ALTER TABLE [dbo].[DiscGroup] CHECK CONSTRAINT [FK_dbo.DiscGroup_dbo.PromptOptions_PromptOptionsId]
GO
ALTER TABLE [dbo].[DiscGroupArticleGroup]  WITH CHECK ADD  CONSTRAINT [FK_dbo.DiscGroupArticleGroup_dbo.ArticleGroup_ArticleGroup_Id] FOREIGN KEY([ArticleGroup_Id])
REFERENCES [dbo].[ArticleGroup] ([Id])
GO
ALTER TABLE [dbo].[DiscGroupArticleGroup] CHECK CONSTRAINT [FK_dbo.DiscGroupArticleGroup_dbo.ArticleGroup_ArticleGroup_Id]
GO
ALTER TABLE [dbo].[DiscGroupArticleGroup]  WITH CHECK ADD  CONSTRAINT [FK_dbo.DiscGroupArticleGroup_dbo.DiscGroup_DiscGroup_Id] FOREIGN KEY([DiscGroup_Id])
REFERENCES [dbo].[DiscGroup] ([Id])
GO
ALTER TABLE [dbo].[DiscGroupArticleGroup] CHECK CONSTRAINT [FK_dbo.DiscGroupArticleGroup_dbo.DiscGroup_DiscGroup_Id]
GO
ALTER TABLE [dbo].[CashExport]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CashExport_dbo.CashExportBatch_CashExportBatch_Id] FOREIGN KEY([CashExportBatch_Id])
REFERENCES [dbo].[CashExportBatch] ([Id])
GO
ALTER TABLE [dbo].[CashExport] CHECK CONSTRAINT [FK_dbo.CashExport_dbo.CashExportBatch_CashExportBatch_Id]
GO
ALTER TABLE [dbo].[CashExport]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CashExport_dbo.CashPaymentBatch_CashPaymentBatchId] FOREIGN KEY([CashPaymentBatchId])
REFERENCES [dbo].[CashPaymentBatch] ([Id])
GO
ALTER TABLE [dbo].[CashExport] CHECK CONSTRAINT [FK_dbo.CashExport_dbo.CashPaymentBatch_CashPaymentBatchId]
GO
ALTER TABLE [dbo].[CashExport]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CashExport_dbo.ExportProfileItem_ExportProfileItemId] FOREIGN KEY([ExportProfileItemId])
REFERENCES [dbo].[ExportProfileItem] ([Id])
GO
ALTER TABLE [dbo].[CashExport] CHECK CONSTRAINT [FK_dbo.CashExport_dbo.ExportProfileItem_ExportProfileItemId]
GO
ALTER TABLE [dbo].[CashExportBatch]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CashExportBatch_dbo.ExportProfile_ExportProfileId] FOREIGN KEY([ExportProfileId])
REFERENCES [dbo].[ExportProfile] ([Id])
GO
ALTER TABLE [dbo].[CashExportBatch] CHECK CONSTRAINT [FK_dbo.CashExportBatch_dbo.ExportProfile_ExportProfileId]
GO
ALTER TABLE [dbo].[CashExportBatch]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CashExportBatch_dbo.User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[CashExportBatch] CHECK CONSTRAINT [FK_dbo.CashExportBatch_dbo.User_UserId]
GO
ALTER TABLE [dbo].[Cashier]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Cashier_dbo.City_HighestHierarchyLevel2] FOREIGN KEY([HighestHierarchyLevel2])
REFERENCES [dbo].[City] ([Id])
GO
ALTER TABLE [dbo].[Cashier] CHECK CONSTRAINT [FK_dbo.Cashier_dbo.City_HighestHierarchyLevel2]
GO
ALTER TABLE [dbo].[Cashier]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Cashier_dbo.User_EmployeeId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Cashier] CHECK CONSTRAINT [FK_dbo.Cashier_dbo.User_EmployeeId]
GO
ALTER TABLE [dbo].[Cashier]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Cashier_dbo.District_DistrictId] FOREIGN KEY([DistrictId])
REFERENCES [dbo].[District] ([Id])
GO
ALTER TABLE [dbo].[Cashier] CHECK CONSTRAINT [FK_dbo.Cashier_dbo.District_DistrictId]
GO
ALTER TABLE [dbo].[CashRegister]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CashRegister_dbo.City_HighestHierarchyLevel2] FOREIGN KEY([HighestHierarchyLevel2])
REFERENCES [dbo].[City] ([Id])
GO
ALTER TABLE [dbo].[CashRegister] CHECK CONSTRAINT [FK_dbo.CashRegister_dbo.City_HighestHierarchyLevel2]
GO
ALTER TABLE [dbo].[CashRegister]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CashRegister_dbo.ConfigurableSettings_SettingsId] FOREIGN KEY([SettingsId])
REFERENCES [dbo].[ConfigurableSettings] ([Id])
GO
ALTER TABLE [dbo].[CashRegister] CHECK CONSTRAINT [FK_dbo.CashRegister_dbo.ConfigurableSettings_SettingsId]
GO
ALTER TABLE [dbo].[CashRegister]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CashRegister_dbo.District_DistrictId] FOREIGN KEY([DistrictId])
REFERENCES [dbo].[District] ([Id])
GO
ALTER TABLE [dbo].[CashRegister] CHECK CONSTRAINT [FK_dbo.CashRegister_dbo.District_DistrictId]
GO
ALTER TABLE [dbo].[ClerkReport]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ClerkReport_dbo.Voucher_Voucher_Id] FOREIGN KEY([Voucher_Id])
REFERENCES [dbo].[Voucher] ([Id])
GO
ALTER TABLE [dbo].[ClerkReport] CHECK CONSTRAINT [FK_dbo.ClerkReport_dbo.Voucher_Voucher_Id]
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_dbo.City_dbo.ConfigurableSettings_SettingsId] FOREIGN KEY([SettingsId])
REFERENCES [dbo].[ConfigurableSettings] ([Id])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_dbo.City_dbo.ConfigurableSettings_SettingsId]
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_dbo.City_dbo.Theme_ThemeId] FOREIGN KEY([ThemeId])
REFERENCES [dbo].[Theme] ([Id])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_dbo.City_dbo.Theme_ThemeId]
GO
ALTER TABLE [dbo].[CostCenter]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CostCenter_dbo.Customer_CustomerId] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[CostCenter] CHECK CONSTRAINT [FK_dbo.CostCenter_dbo.Customer_CustomerId]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Customer_dbo.Address_AddressId] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Address] ([Id])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_dbo.Customer_dbo.Address_AddressId]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Customer_dbo.Address_AlternativeAddressId] FOREIGN KEY([AlternativeAddressId])
REFERENCES [dbo].[Address] ([Id])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_dbo.Customer_dbo.Address_AlternativeAddressId]
GO
ALTER TABLE [dbo].[DbFile]  WITH CHECK ADD  CONSTRAINT [FK_dbo.DbFile_dbo.CashRegister_CashRegister_Id] FOREIGN KEY([CashRegister_Id])
REFERENCES [dbo].[CashRegister] ([Id])
GO
ALTER TABLE [dbo].[DbFile] CHECK CONSTRAINT [FK_dbo.DbFile_dbo.CashRegister_CashRegister_Id]
GO
ALTER TABLE [dbo].[DeliveryArea]  WITH CHECK ADD  CONSTRAINT [FK_dbo.DeliveryArea_dbo.CashRegister_CashRegisterId] FOREIGN KEY([CashRegisterId])
REFERENCES [dbo].[CashRegister] ([Id])
GO
ALTER TABLE [dbo].[DeliveryArea] CHECK CONSTRAINT [FK_dbo.DeliveryArea_dbo.CashRegister_CashRegisterId]
GO
ALTER TABLE [dbo].[DeliveryArea]  WITH CHECK ADD  CONSTRAINT [FK_dbo.DeliveryArea_dbo.District_DistrictId] FOREIGN KEY([DistrictId])
REFERENCES [dbo].[District] ([Id])
GO
ALTER TABLE [dbo].[DeliveryArea] CHECK CONSTRAINT [FK_dbo.DeliveryArea_dbo.District_DistrictId]
GO
ALTER TABLE [dbo].[DeliveryLocationBase]  WITH CHECK ADD  CONSTRAINT [FK_dbo.DeliveryLocationBase_dbo.ArticleBase_RoomArticleId] FOREIGN KEY([RoomArticleId])
REFERENCES [dbo].[ArticleBase] ([Id])
GO
ALTER TABLE [dbo].[DeliveryLocationBase] CHECK CONSTRAINT [FK_dbo.DeliveryLocationBase_dbo.ArticleBase_RoomArticleId]
GO
ALTER TABLE [dbo].[DeliveryLocationBase]  WITH CHECK ADD  CONSTRAINT [FK_dbo.DeliveryLocationBase_dbo.ArticleGroup_ArticleGroupId] FOREIGN KEY([ArticleGroupId])
REFERENCES [dbo].[ArticleGroup] ([Id])
GO
ALTER TABLE [dbo].[DeliveryLocationBase] CHECK CONSTRAINT [FK_dbo.DeliveryLocationBase_dbo.ArticleGroup_ArticleGroupId]
GO
ALTER TABLE [dbo].[DeliveryLocationBase]  WITH CHECK ADD  CONSTRAINT [FK_dbo.DeliveryLocationBase_dbo.DeliveryArea_DeliveryAreaId] FOREIGN KEY([DeliveryAreaId])
REFERENCES [dbo].[DeliveryArea] ([Id])
GO
ALTER TABLE [dbo].[DeliveryLocationBase] CHECK CONSTRAINT [FK_dbo.DeliveryLocationBase_dbo.DeliveryArea_DeliveryAreaId]
GO
ALTER TABLE [dbo].[DeliveryLocationBase]  WITH CHECK ADD  CONSTRAINT [FK_dbo.DeliveryLocationBase_dbo.TransportRoute_TransportRouteId] FOREIGN KEY([TransportRouteId])
REFERENCES [dbo].[TransportRoute] ([Id])
GO
ALTER TABLE [dbo].[DeliveryLocationBase] CHECK CONSTRAINT [FK_dbo.DeliveryLocationBase_dbo.TransportRoute_TransportRouteId]
GO
ALTER TABLE [dbo].[DeliveryLocationTime]  WITH CHECK ADD  CONSTRAINT [FK_dbo.DeliveryLocationTime_dbo.DeliveryLocationBase_DeliveryLocationId] FOREIGN KEY([DeliveryLocationId])
REFERENCES [dbo].[DeliveryLocationBase] ([Id])
GO
ALTER TABLE [dbo].[DeliveryLocationTime] CHECK CONSTRAINT [FK_dbo.DeliveryLocationTime_dbo.DeliveryLocationBase_DeliveryLocationId]
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Department_dbo.Customer_CustomerId] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_dbo.Department_dbo.Customer_CustomerId]
GO
ALTER TABLE [dbo].[Discount]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Discount_dbo.DiscGroup_DiscGroup_Id] FOREIGN KEY([DiscGroup_Id])
REFERENCES [dbo].[DiscGroup] ([Id])
GO
ALTER TABLE [dbo].[Discount] CHECK CONSTRAINT [FK_dbo.Discount_dbo.DiscGroup_DiscGroup_Id]
GO
ALTER TABLE [dbo].[DiscountArticle]  WITH CHECK ADD  CONSTRAINT [FK_dbo.DiscountArticle_dbo.ArticleBase_Article_Id] FOREIGN KEY([Article_Id])
REFERENCES [dbo].[ArticleBase] ([Id])
GO
ALTER TABLE [dbo].[DiscountArticle] CHECK CONSTRAINT [FK_dbo.DiscountArticle_dbo.ArticleBase_Article_Id]
GO
ALTER TABLE [dbo].[DiscountArticle]  WITH CHECK ADD  CONSTRAINT [FK_dbo.DiscountArticle_dbo.Discount_Discount_Id] FOREIGN KEY([Discount_Id])
REFERENCES [dbo].[Discount] ([Id])
GO
ALTER TABLE [dbo].[DiscountArticle] CHECK CONSTRAINT [FK_dbo.DiscountArticle_dbo.Discount_Discount_Id]
GO
ALTER TABLE [dbo].[DiscountArticleGroup]  WITH CHECK ADD  CONSTRAINT [FK_dbo.DiscountArticleGroup_dbo.ArticleGroup_ArticleGroup_Id] FOREIGN KEY([ArticleGroup_Id])
REFERENCES [dbo].[ArticleGroup] ([Id])
GO
ALTER TABLE [dbo].[DiscountArticleGroup] CHECK CONSTRAINT [FK_dbo.DiscountArticleGroup_dbo.ArticleGroup_ArticleGroup_Id]
GO
ALTER TABLE [dbo].[DiscountArticleGroup]  WITH CHECK ADD  CONSTRAINT [FK_dbo.DiscountArticleGroup_dbo.Discount_Discount_Id] FOREIGN KEY([Discount_Id])
REFERENCES [dbo].[Discount] ([Id])
GO
ALTER TABLE [dbo].[DiscountArticleGroup] CHECK CONSTRAINT [FK_dbo.DiscountArticleGroup_dbo.Discount_Discount_Id]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Event_dbo.DiscBase_DiscId] FOREIGN KEY([DiscId])
REFERENCES [dbo].[DiscBase] ([Id])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK_dbo.Event_dbo.DiscBase_DiscId]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Event_dbo.User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK_dbo.Event_dbo.User_UserId]
GO
ALTER TABLE [dbo].[ExcludeFromDeadline]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ExcludeFromDeadline_dbo.ArticleBase_ArticleId] FOREIGN KEY([ArticleId])
REFERENCES [dbo].[ArticleBase] ([Id])
GO
ALTER TABLE [dbo].[ExcludeFromDeadline] CHECK CONSTRAINT [FK_dbo.ExcludeFromDeadline_dbo.ArticleBase_ArticleId]
GO
ALTER TABLE [dbo].[ExcludeFromDeadline]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ExcludeFromDeadline_dbo.DeliveryLocationBase_DeliveryLocationId] FOREIGN KEY([DeliveryLocationId])
REFERENCES [dbo].[DeliveryLocationBase] ([Id])
GO
ALTER TABLE [dbo].[ExcludeFromDeadline] CHECK CONSTRAINT [FK_dbo.ExcludeFromDeadline_dbo.DeliveryLocationBase_DeliveryLocationId]
GO
ALTER TABLE [dbo].[ExportBatch]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ExportBatch_dbo.ExportProfile_ExportProfileId] FOREIGN KEY([ExportProfileId])
REFERENCES [dbo].[ExportProfile] ([Id])
GO
ALTER TABLE [dbo].[ExportBatch] CHECK CONSTRAINT [FK_dbo.ExportBatch_dbo.ExportProfile_ExportProfileId]
GO
ALTER TABLE [dbo].[ExportBatch]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ExportBatch_dbo.User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[ExportBatch] CHECK CONSTRAINT [FK_dbo.ExportBatch_dbo.User_UserId]
GO
ALTER TABLE [dbo].[ExportProfileItem]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ExportProfileItem_dbo.Customer_CustomerId] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[ExportProfileItem] CHECK CONSTRAINT [FK_dbo.ExportProfileItem_dbo.Customer_CustomerId]
GO
ALTER TABLE [dbo].[ExportProfileItem]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ExportProfileItem_dbo.ExportProfile_ExportProfile_Id] FOREIGN KEY([ExportProfile_Id])
REFERENCES [dbo].[ExportProfile] ([Id])
GO
ALTER TABLE [dbo].[ExportProfileItem] CHECK CONSTRAINT [FK_dbo.ExportProfileItem_dbo.ExportProfile_ExportProfile_Id]
GO
ALTER TABLE [dbo].[ExportProfileItemFileExport]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ExportProfileItemFileExport_dbo.ExportProfileItem_ExportProfileItem_Id] FOREIGN KEY([ExportProfileItem_Id])
REFERENCES [dbo].[ExportProfileItem] ([Id])
GO
ALTER TABLE [dbo].[ExportProfileItemFileExport] CHECK CONSTRAINT [FK_dbo.ExportProfileItemFileExport_dbo.ExportProfileItem_ExportProfileItem_Id]
GO
ALTER TABLE [dbo].[ExportProfileItemFileExport]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ExportProfileItemFileExport_dbo.ReportType_FileExport_Id] FOREIGN KEY([FileExport_Id])
REFERENCES [dbo].[ReportType] ([Id])
GO
ALTER TABLE [dbo].[ExportProfileItemFileExport] CHECK CONSTRAINT [FK_dbo.ExportProfileItemFileExport_dbo.ReportType_FileExport_Id]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_dbo.User_dbo.Address_WorkAddressId] FOREIGN KEY([WorkAddressId])
REFERENCES [dbo].[Address] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_dbo.User_dbo.Address_WorkAddressId]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_dbo.User_dbo.City_HighestHierarchyLevel2] FOREIGN KEY([HighestHierarchyLevel2])
REFERENCES [dbo].[City] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_dbo.User_dbo.City_HighestHierarchyLevel2]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_dbo.User_dbo.Customer_CustomerId] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_dbo.User_dbo.Customer_CustomerId]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_dbo.User_dbo.Department_DepartmentId] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_dbo.User_dbo.Department_DepartmentId]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_dbo.User_dbo.User_PreferedApproverId] FOREIGN KEY([PreferedApproverId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_dbo.User_dbo.User_PreferedApproverId]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_dbo.User_dbo.District_DistrictId] FOREIGN KEY([DistrictId])
REFERENCES [dbo].[District] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_dbo.User_dbo.District_DistrictId]
GO
ALTER TABLE [dbo].[KitchenPrinterArticleBase]  WITH CHECK ADD  CONSTRAINT [FK_dbo.KitchenPrinterArticleBase_dbo.ArticleBase_ArticleBase_Id] FOREIGN KEY([ArticleBase_Id])
REFERENCES [dbo].[ArticleBase] ([Id])
GO
ALTER TABLE [dbo].[KitchenPrinterArticleBase] CHECK CONSTRAINT [FK_dbo.KitchenPrinterArticleBase_dbo.ArticleBase_ArticleBase_Id]
GO
ALTER TABLE [dbo].[KitchenPrinterArticleBase]  WITH CHECK ADD  CONSTRAINT [FK_dbo.KitchenPrinterArticleBase_dbo.KitchenPrinter_KitchenPrinter_Id] FOREIGN KEY([KitchenPrinter_Id])
REFERENCES [dbo].[KitchenPrinter] ([Id])
GO
ALTER TABLE [dbo].[KitchenPrinterArticleBase] CHECK CONSTRAINT [FK_dbo.KitchenPrinterArticleBase_dbo.KitchenPrinter_KitchenPrinter_Id]
GO
ALTER TABLE [dbo].[MandatoryArticles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.MandatoryArticles_dbo.ArticleBase_ArticleId] FOREIGN KEY([ArticleId])
REFERENCES [dbo].[ArticleBase] ([Id])
GO
ALTER TABLE [dbo].[MandatoryArticles] CHECK CONSTRAINT [FK_dbo.MandatoryArticles_dbo.ArticleBase_ArticleId]
GO
ALTER TABLE [dbo].[MandatoryArticles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.MandatoryArticles_dbo.DeliveryLocationBase_DeliveryLocationId] FOREIGN KEY([DeliveryLocationId])
REFERENCES [dbo].[DeliveryLocationBase] ([Id])
GO
ALTER TABLE [dbo].[MandatoryArticles] CHECK CONSTRAINT [FK_dbo.MandatoryArticles_dbo.DeliveryLocationBase_DeliveryLocationId]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Order_dbo.Order_MainOrder_Id] FOREIGN KEY([MainOrder_Id])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_dbo.Order_dbo.Order_MainOrder_Id]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Order_dbo.Transaction_Id] FOREIGN KEY([Id])
REFERENCES [dbo].[Transaction] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_dbo.Order_dbo.Transaction_Id]
GO
ALTER TABLE [dbo].[OrderAccountDimension]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderAccountDimension_dbo.AccountDimension_AccountDimensionId] FOREIGN KEY([AccountDimensionId])
REFERENCES [dbo].[AccountDimension] ([Id])
GO
ALTER TABLE [dbo].[OrderAccountDimension] CHECK CONSTRAINT [FK_dbo.OrderAccountDimension_dbo.AccountDimension_AccountDimensionId]
GO
ALTER TABLE [dbo].[OrderAccountDimension]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderAccountDimension_dbo.OrderBase_OrderBaseId] FOREIGN KEY([OrderBaseId])
REFERENCES [dbo].[OrderBase] ([Id])
GO
ALTER TABLE [dbo].[OrderAccountDimension] CHECK CONSTRAINT [FK_dbo.OrderAccountDimension_dbo.OrderBase_OrderBaseId]
GO
ALTER TABLE [dbo].[OrderAccountDimensionMetadata]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderAccountDimensionMetadata_dbo.OrderAccountDimension_OrderAccountDimensionId] FOREIGN KEY([OrderAccountDimensionId])
REFERENCES [dbo].[OrderAccountDimension] ([Id])
GO
ALTER TABLE [dbo].[OrderAccountDimensionMetadata] CHECK CONSTRAINT [FK_dbo.OrderAccountDimensionMetadata_dbo.OrderAccountDimension_OrderAccountDimensionId]
GO
ALTER TABLE [dbo].[OrderAnomaly]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderAnomaly_dbo.ArticleBase_ArticleId] FOREIGN KEY([ArticleId])
REFERENCES [dbo].[ArticleBase] ([Id])
GO
ALTER TABLE [dbo].[OrderAnomaly] CHECK CONSTRAINT [FK_dbo.OrderAnomaly_dbo.ArticleBase_ArticleId]
GO
ALTER TABLE [dbo].[OrderAnomaly]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderAnomaly_dbo.OrderBase_OrderBaseId] FOREIGN KEY([OrderBaseId])
REFERENCES [dbo].[OrderBase] ([Id])
GO
ALTER TABLE [dbo].[OrderAnomaly] CHECK CONSTRAINT [FK_dbo.OrderAnomaly_dbo.OrderBase_OrderBaseId]
GO
ALTER TABLE [dbo].[OrderAnomalyAnomaly]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderAnomalyAnomaly_dbo.Anomaly_Anomaly_Id] FOREIGN KEY([Anomaly_Id])
REFERENCES [dbo].[Anomaly] ([Id])
GO
ALTER TABLE [dbo].[OrderAnomalyAnomaly] CHECK CONSTRAINT [FK_dbo.OrderAnomalyAnomaly_dbo.Anomaly_Anomaly_Id]
GO
ALTER TABLE [dbo].[OrderAnomalyAnomaly]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderAnomalyAnomaly_dbo.OrderAnomaly_OrderAnomaly_Id] FOREIGN KEY([OrderAnomaly_Id])
REFERENCES [dbo].[OrderAnomaly] ([Id])
GO
ALTER TABLE [dbo].[OrderAnomalyAnomaly] CHECK CONSTRAINT [FK_dbo.OrderAnomalyAnomaly_dbo.OrderAnomaly_OrderAnomaly_Id]
GO
ALTER TABLE [dbo].[OrderBase]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderBase_dbo.DiscBase_DiscId] FOREIGN KEY([DiscId])
REFERENCES [dbo].[DiscBase] ([Id])
GO
ALTER TABLE [dbo].[OrderBase] CHECK CONSTRAINT [FK_dbo.OrderBase_dbo.DiscBase_DiscId]
GO
ALTER TABLE [dbo].[OrderBase]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderBase_dbo.DeliveryLocationBase_DeliveryLocationId] FOREIGN KEY([DeliveryLocationId])
REFERENCES [dbo].[DeliveryLocationBase] ([Id])
GO
ALTER TABLE [dbo].[OrderBase] CHECK CONSTRAINT [FK_dbo.OrderBase_dbo.DeliveryLocationBase_DeliveryLocationId]
GO
ALTER TABLE [dbo].[OrderBase]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderBase_dbo.User_AdministratorId] FOREIGN KEY([AdministratorId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[OrderBase] CHECK CONSTRAINT [FK_dbo.OrderBase_dbo.User_AdministratorId]
GO
ALTER TABLE [dbo].[OrderBase]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderBase_dbo.User_ApproverId] FOREIGN KEY([ApproverId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[OrderBase] CHECK CONSTRAINT [FK_dbo.OrderBase_dbo.User_ApproverId]
GO
ALTER TABLE [dbo].[OrderBase]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderBase_dbo.User_ReviewerId] FOREIGN KEY([ReviewerId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[OrderBase] CHECK CONSTRAINT [FK_dbo.OrderBase_dbo.User_ReviewerId]
GO
ALTER TABLE [dbo].[OrderBase]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderBase_dbo.User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[OrderBase] CHECK CONSTRAINT [FK_dbo.OrderBase_dbo.User_UserId]
GO
ALTER TABLE [dbo].[OrderCateringArticle]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderCateringArticle_dbo.ArticleBase_ArticleId] FOREIGN KEY([ArticleId])
REFERENCES [dbo].[ArticleBase] ([Id])
GO
ALTER TABLE [dbo].[OrderCateringArticle] CHECK CONSTRAINT [FK_dbo.OrderCateringArticle_dbo.ArticleBase_ArticleId]
GO
ALTER TABLE [dbo].[OrderCateringArticle]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderCateringArticle_dbo.OrderBase_OrderBaseId] FOREIGN KEY([OrderBaseId])
REFERENCES [dbo].[OrderBase] ([Id])
GO
ALTER TABLE [dbo].[OrderCateringArticle] CHECK CONSTRAINT [FK_dbo.OrderCateringArticle_dbo.OrderBase_OrderBaseId]
GO
ALTER TABLE [dbo].[OrderMessage]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderMessage_dbo.User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[OrderMessage] CHECK CONSTRAINT [FK_dbo.OrderMessage_dbo.User_UserId]
GO
ALTER TABLE [dbo].[OrderMessage]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderMessage_dbo.OrderBase_OrderBaseId] FOREIGN KEY([OrderBaseId])
REFERENCES [dbo].[OrderBase] ([Id])
GO
ALTER TABLE [dbo].[OrderMessage] CHECK CONSTRAINT [FK_dbo.OrderMessage_dbo.OrderBase_OrderBaseId]
GO
ALTER TABLE [dbo].[OrderMessageStatus]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderMessageStatus_dbo.User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[OrderMessageStatus] CHECK CONSTRAINT [FK_dbo.OrderMessageStatus_dbo.User_UserId]
GO
ALTER TABLE [dbo].[OrderMessageStatus]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderMessageStatus_dbo.OrderBase_OrderBaseId] FOREIGN KEY([OrderBaseId])
REFERENCES [dbo].[OrderBase] ([Id])
GO
ALTER TABLE [dbo].[OrderMessageStatus] CHECK CONSTRAINT [FK_dbo.OrderMessageStatus_dbo.OrderBase_OrderBaseId]
GO
ALTER TABLE [dbo].[OrderMessageStatus]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderMessageStatus_dbo.OrderMessage_OrderMessageId] FOREIGN KEY([OrderMessageId])
REFERENCES [dbo].[OrderMessage] ([Id])
GO
ALTER TABLE [dbo].[OrderMessageStatus] CHECK CONSTRAINT [FK_dbo.OrderMessageStatus_dbo.OrderMessage_OrderMessageId]
GO
ALTER TABLE [dbo].[OrderMessageUnsubscribe]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderMessageUnsubscribe_dbo.User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[OrderMessageUnsubscribe] CHECK CONSTRAINT [FK_dbo.OrderMessageUnsubscribe_dbo.User_UserId]
GO
ALTER TABLE [dbo].[OrderMessageUnsubscribe]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderMessageUnsubscribe_dbo.OrderBase_OrderBaseId] FOREIGN KEY([OrderBaseId])
REFERENCES [dbo].[OrderBase] ([Id])
GO
ALTER TABLE [dbo].[OrderMessageUnsubscribe] CHECK CONSTRAINT [FK_dbo.OrderMessageUnsubscribe_dbo.OrderBase_OrderBaseId]
GO
ALTER TABLE [dbo].[OrderNumber]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderNumber_dbo.City_HighestHierarchyLevel2] FOREIGN KEY([HighestHierarchyLevel2])
REFERENCES [dbo].[City] ([Id])
GO
ALTER TABLE [dbo].[OrderNumber] CHECK CONSTRAINT [FK_dbo.OrderNumber_dbo.City_HighestHierarchyLevel2]
GO
ALTER TABLE [dbo].[OrderResourceArticle]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderResourceArticle_dbo.ArticleBase_ArticleId] FOREIGN KEY([ArticleId])
REFERENCES [dbo].[ArticleBase] ([Id])
GO
ALTER TABLE [dbo].[OrderResourceArticle] CHECK CONSTRAINT [FK_dbo.OrderResourceArticle_dbo.ArticleBase_ArticleId]
GO
ALTER TABLE [dbo].[OrderResourceArticle]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderResourceArticle_dbo.OrderBase_OrderBaseId] FOREIGN KEY([OrderBaseId])
REFERENCES [dbo].[OrderBase] ([Id])
GO
ALTER TABLE [dbo].[OrderResourceArticle] CHECK CONSTRAINT [FK_dbo.OrderResourceArticle_dbo.OrderBase_OrderBaseId]
GO
ALTER TABLE [dbo].[OrderSettingsCustomer]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderSettingsCustomer_dbo.Customer_Customer_Id] FOREIGN KEY([Customer_Id])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[OrderSettingsCustomer] CHECK CONSTRAINT [FK_dbo.OrderSettingsCustomer_dbo.Customer_Customer_Id]
GO
ALTER TABLE [dbo].[OrderSettingsCustomer]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderSettingsCustomer_dbo.OrderSettings_OrderSettings_Id] FOREIGN KEY([OrderSettings_Id])
REFERENCES [dbo].[OrderSettings] ([Id])
GO
ALTER TABLE [dbo].[OrderSettingsCustomer] CHECK CONSTRAINT [FK_dbo.OrderSettingsCustomer_dbo.OrderSettings_OrderSettings_Id]
GO
ALTER TABLE [dbo].[PaymentProviderTransaction]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PaymentProviderTransaction_dbo.User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[PaymentProviderTransaction] CHECK CONSTRAINT [FK_dbo.PaymentProviderTransaction_dbo.User_UserId]
GO
ALTER TABLE [dbo].[PriceCorrection]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PriceCorrection_dbo.ArticleBase_ArticleBase_Id] FOREIGN KEY([ArticleBase_Id])
REFERENCES [dbo].[ArticleBase] ([Id])
GO
ALTER TABLE [dbo].[PriceCorrection] CHECK CONSTRAINT [FK_dbo.PriceCorrection_dbo.ArticleBase_ArticleBase_Id]
GO
ALTER TABLE [dbo].[PriceSelector]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PriceSelector_dbo.DiscGroup_DiscGroup_Id] FOREIGN KEY([DiscGroup_Id])
REFERENCES [dbo].[DiscGroup] ([Id])
GO
ALTER TABLE [dbo].[PriceSelector] CHECK CONSTRAINT [FK_dbo.PriceSelector_dbo.DiscGroup_DiscGroup_Id]
GO
ALTER TABLE [dbo].[PriceSelectorArticle]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PriceSelectorArticle_dbo.ArticleBase_Article_Id] FOREIGN KEY([Article_Id])
REFERENCES [dbo].[ArticleBase] ([Id])
GO
ALTER TABLE [dbo].[PriceSelectorArticle] CHECK CONSTRAINT [FK_dbo.PriceSelectorArticle_dbo.ArticleBase_Article_Id]
GO
ALTER TABLE [dbo].[PriceSelectorArticle]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PriceSelectorArticle_dbo.PriceSelector_PriceSelector_Id] FOREIGN KEY([PriceSelector_Id])
REFERENCES [dbo].[PriceSelector] ([Id])
GO
ALTER TABLE [dbo].[PriceSelectorArticle] CHECK CONSTRAINT [FK_dbo.PriceSelectorArticle_dbo.PriceSelector_PriceSelector_Id]
GO
ALTER TABLE [dbo].[ProductionTime]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ProductionTime_dbo.ArticleBase_ArticleId] FOREIGN KEY([ArticleId])
REFERENCES [dbo].[ArticleBase] ([Id])
GO
ALTER TABLE [dbo].[ProductionTime] CHECK CONSTRAINT [FK_dbo.ProductionTime_dbo.ArticleBase_ArticleId]
GO
ALTER TABLE [dbo].[PtmVoucher]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PtmVoucher_dbo.DiscBase_DiscId] FOREIGN KEY([DiscId])
REFERENCES [dbo].[DiscBase] ([Id])
GO
ALTER TABLE [dbo].[PtmVoucher] CHECK CONSTRAINT [FK_dbo.PtmVoucher_dbo.DiscBase_DiscId]
GO
ALTER TABLE [dbo].[PtmVoucher]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PtmVoucher_dbo.Cashier_CashierId] FOREIGN KEY([CashierId])
REFERENCES [dbo].[Cashier] ([Id])
GO
ALTER TABLE [dbo].[PtmVoucher] CHECK CONSTRAINT [FK_dbo.PtmVoucher_dbo.Cashier_CashierId]
GO
ALTER TABLE [dbo].[PtmVoucher]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PtmVoucher_dbo.CashRegister_CashRegisterId] FOREIGN KEY([CashRegisterId])
REFERENCES [dbo].[CashRegister] ([Id])
GO
ALTER TABLE [dbo].[PtmVoucher] CHECK CONSTRAINT [FK_dbo.PtmVoucher_dbo.CashRegister_CashRegisterId]
GO
ALTER TABLE [dbo].[RegisterCashFloat]  WITH CHECK ADD  CONSTRAINT [FK_dbo.RegisterCashFloat_dbo.Voucher_Voucher_Id] FOREIGN KEY([Voucher_Id])
REFERENCES [dbo].[Voucher] ([Id])
GO
ALTER TABLE [dbo].[RegisterCashFloat] CHECK CONSTRAINT [FK_dbo.RegisterCashFloat_dbo.Voucher_Voucher_Id]
GO
ALTER TABLE [dbo].[ReportResult]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ReportResult_dbo.DiscExport_DiscExport_Id] FOREIGN KEY([DiscExport_Id])
REFERENCES [dbo].[DiscExport] ([Id])
GO
ALTER TABLE [dbo].[ReportResult] CHECK CONSTRAINT [FK_dbo.ReportResult_dbo.DiscExport_DiscExport_Id]
GO
ALTER TABLE [dbo].[ReportResult]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ReportResult_dbo.CashExport_CashExport_Id] FOREIGN KEY([CashExport_Id])
REFERENCES [dbo].[CashExport] ([Id])
GO
ALTER TABLE [dbo].[ReportResult] CHECK CONSTRAINT [FK_dbo.ReportResult_dbo.CashExport_CashExport_Id]
GO
ALTER TABLE [dbo].[ReportResult]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ReportResult_dbo.ReportType_ReportTypeId] FOREIGN KEY([ReportTypeId])
REFERENCES [dbo].[ReportType] ([Id])
GO
ALTER TABLE [dbo].[ReportResult] CHECK CONSTRAINT [FK_dbo.ReportResult_dbo.ReportType_ReportTypeId]
GO
ALTER TABLE [dbo].[ReportRun]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ReportRun_dbo.ReportResult_ReportResult_Id] FOREIGN KEY([ReportResult_Id])
REFERENCES [dbo].[ReportResult] ([Id])
GO
ALTER TABLE [dbo].[ReportRun] CHECK CONSTRAINT [FK_dbo.ReportRun_dbo.ReportResult_ReportResult_Id]
GO
ALTER TABLE [dbo].[SchoolSystemMealType]  WITH CHECK ADD  CONSTRAINT [FK_dbo.SchoolSystemMealType_dbo.ArticleBase_ArticleBaseId] FOREIGN KEY([ArticleBaseId])
REFERENCES [dbo].[ArticleBase] ([Id])
GO
ALTER TABLE [dbo].[SchoolSystemMealType] CHECK CONSTRAINT [FK_dbo.SchoolSystemMealType_dbo.ArticleBase_ArticleBaseId]
GO
ALTER TABLE [dbo].[SchoolSystemMealTypeSchoolSystemAppSettings]  WITH CHECK ADD  CONSTRAINT [FK_dbo.SchoolSystemMealTypeSchoolSystemAppSettings_dbo.SchoolSystemAppSettings_SchoolSystemAppSettings_Id] FOREIGN KEY([SchoolSystemAppSettings_Id])
REFERENCES [dbo].[SchoolSystemAppSettings] ([Id])
GO
ALTER TABLE [dbo].[SchoolSystemMealTypeSchoolSystemAppSettings] CHECK CONSTRAINT [FK_dbo.SchoolSystemMealTypeSchoolSystemAppSettings_dbo.SchoolSystemAppSettings_SchoolSystemAppSettings_Id]
GO
ALTER TABLE [dbo].[SchoolSystemMealTypeSchoolSystemAppSettings]  WITH CHECK ADD  CONSTRAINT [FK_dbo.SchoolSystemMealTypeSchoolSystemAppSettings_dbo.SchoolSystemMealType_SchoolSystemMealType_Id] FOREIGN KEY([SchoolSystemMealType_Id])
REFERENCES [dbo].[SchoolSystemMealType] ([Id])
GO
ALTER TABLE [dbo].[SchoolSystemMealTypeSchoolSystemAppSettings] CHECK CONSTRAINT [FK_dbo.SchoolSystemMealTypeSchoolSystemAppSettings_dbo.SchoolSystemMealType_SchoolSystemMealType_Id]
GO
ALTER TABLE [dbo].[SchoolSystemProfilePermission]  WITH CHECK ADD  CONSTRAINT [FK_dbo.SchoolSystemProfilePermission_dbo.SchoolSystemPermission_SchoolSystemPermissionId] FOREIGN KEY([SchoolSystemPermissionId])
REFERENCES [dbo].[SchoolSystemPermission] ([Id])
GO
ALTER TABLE [dbo].[SchoolSystemProfilePermission] CHECK CONSTRAINT [FK_dbo.SchoolSystemProfilePermission_dbo.SchoolSystemPermission_SchoolSystemPermissionId]
GO
ALTER TABLE [dbo].[SchoolSystemProfilePermission]  WITH CHECK ADD  CONSTRAINT [FK_dbo.SchoolSystemProfilePermission_dbo.SchoolSystemProfile_SchoolSystemProfileId] FOREIGN KEY([SchoolSystemProfileId])
REFERENCES [dbo].[SchoolSystemProfile] ([Id])
GO
ALTER TABLE [dbo].[SchoolSystemProfilePermission] CHECK CONSTRAINT [FK_dbo.SchoolSystemProfilePermission_dbo.SchoolSystemProfile_SchoolSystemProfileId]
GO
ALTER TABLE [dbo].[SchoolSystemUser]  WITH CHECK ADD  CONSTRAINT [FK_dbo.SchoolSystemUser_dbo.User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[SchoolSystemUser] CHECK CONSTRAINT [FK_dbo.SchoolSystemUser_dbo.User_UserId]
GO
ALTER TABLE [dbo].[SchoolSystemUser]  WITH CHECK ADD  CONSTRAINT [FK_dbo.SchoolSystemUser_dbo.SchoolSystemProfile_SchoolSystemProfileId] FOREIGN KEY([SchoolSystemProfileId])
REFERENCES [dbo].[SchoolSystemProfile] ([Id])
GO
ALTER TABLE [dbo].[SchoolSystemUser] CHECK CONSTRAINT [FK_dbo.SchoolSystemUser_dbo.SchoolSystemProfile_SchoolSystemProfileId]
GO
ALTER TABLE [dbo].[SomeReport]  WITH CHECK ADD  CONSTRAINT [FK_dbo.SomeReport_dbo.Cashier_CashierId] FOREIGN KEY([CashierId])
REFERENCES [dbo].[Cashier] ([Id])
GO
ALTER TABLE [dbo].[SomeReport] CHECK CONSTRAINT [FK_dbo.SomeReport_dbo.Cashier_CashierId]
GO
ALTER TABLE [dbo].[SomeReport]  WITH CHECK ADD  CONSTRAINT [FK_dbo.SomeReport_dbo.CashRegister_CashRegisterId] FOREIGN KEY([CashRegisterId])
REFERENCES [dbo].[CashRegister] ([Id])
GO
ALTER TABLE [dbo].[SomeReport] CHECK CONSTRAINT [FK_dbo.SomeReport_dbo.CashRegister_CashRegisterId]
GO
ALTER TABLE [dbo].[TimeRule]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TimeRule_dbo.DiscGroup_DiscGroup_Id] FOREIGN KEY([DiscGroup_Id])
REFERENCES [dbo].[DiscGroup] ([Id])
GO
ALTER TABLE [dbo].[TimeRule] CHECK CONSTRAINT [FK_dbo.TimeRule_dbo.DiscGroup_DiscGroup_Id]
GO
ALTER TABLE [dbo].[TimeRule]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TimeRule_dbo.Discount_Discount_Id] FOREIGN KEY([Discount_Id])
REFERENCES [dbo].[Discount] ([Id])
GO
ALTER TABLE [dbo].[TimeRule] CHECK CONSTRAINT [FK_dbo.TimeRule_dbo.Discount_Discount_Id]
GO
ALTER TABLE [dbo].[TimeRule]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TimeRule_dbo.PriceSelector_PriceSelector_Id] FOREIGN KEY([PriceSelector_Id])
REFERENCES [dbo].[PriceSelector] ([Id])
GO
ALTER TABLE [dbo].[TimeRule] CHECK CONSTRAINT [FK_dbo.TimeRule_dbo.PriceSelector_PriceSelector_Id]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Transaction_dbo.ClerkReport_ClerkReport_Id] FOREIGN KEY([ClerkReport_Id])
REFERENCES [dbo].[ClerkReport] ([Id])
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_dbo.Transaction_dbo.ClerkReport_ClerkReport_Id]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Transaction_dbo.Voucher_Voucher_Id] FOREIGN KEY([Voucher_Id])
REFERENCES [dbo].[Voucher] ([Id])
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_dbo.Transaction_dbo.Voucher_Voucher_Id]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Transaction_dbo.Z2ReportQueue_Z2ReportQueue_Id] FOREIGN KEY([Z2ReportQueue_Id])
REFERENCES [dbo].[Z2ReportQueue] ([Id])
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_dbo.Transaction_dbo.Z2ReportQueue_Z2ReportQueue_Id]
GO
ALTER TABLE [dbo].[TransactionArticleRow]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TransactionArticleRow_dbo.Transaction_Transaction_Id] FOREIGN KEY([Transaction_Id])
REFERENCES [dbo].[Transaction] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TransactionArticleRow] CHECK CONSTRAINT [FK_dbo.TransactionArticleRow_dbo.Transaction_Transaction_Id]
GO
ALTER TABLE [dbo].[TransactionArticleRow]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TransactionArticleRow_dbo.TransactionArticleRow_MainArticle_ArticleId] FOREIGN KEY([MainArticle_ArticleId])
REFERENCES [dbo].[TransactionArticleRow] ([Id])
GO
ALTER TABLE [dbo].[TransactionArticleRow] CHECK CONSTRAINT [FK_dbo.TransactionArticleRow_dbo.TransactionArticleRow_MainArticle_ArticleId]
GO
ALTER TABLE [dbo].[TransactionArticleRowKitchenMessage]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TransactionArticleRowKitchenMessage_dbo.TransactionArticleRow_TransactionArticle_ArticleId] FOREIGN KEY([TransactionArticle_ArticleId])
REFERENCES [dbo].[TransactionArticleRow] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TransactionArticleRowKitchenMessage] CHECK CONSTRAINT [FK_dbo.TransactionArticleRowKitchenMessage_dbo.TransactionArticleRow_TransactionArticle_ArticleId]
GO
ALTER TABLE [dbo].[TransactionArticleRowText]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TransactionArticleRowText_dbo.TransactionArticleRow_TransactionArticle_ArticleId] FOREIGN KEY([TransactionArticle_ArticleId])
REFERENCES [dbo].[TransactionArticleRow] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TransactionArticleRowText] CHECK CONSTRAINT [FK_dbo.TransactionArticleRowText_dbo.TransactionArticleRow_TransactionArticle_ArticleId]
GO
ALTER TABLE [dbo].[TransactionPaymentRow]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TransactionPaymentRow_dbo.CashPaymentBatch_CashBatch_Id] FOREIGN KEY([CashBatch_Id])
REFERENCES [dbo].[CashPaymentBatch] ([Id])
GO
ALTER TABLE [dbo].[TransactionPaymentRow] CHECK CONSTRAINT [FK_dbo.TransactionPaymentRow_dbo.CashPaymentBatch_CashBatch_Id]
GO
ALTER TABLE [dbo].[TransactionPaymentRow]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TransactionPaymentRow_dbo.PaymentBatch_PTMDisc_PaymentBatch_Id] FOREIGN KEY([PTMDisc_PaymentBatch_Id])
REFERENCES [dbo].[PaymentBatch] ([Id])
GO
ALTER TABLE [dbo].[TransactionPaymentRow] CHECK CONSTRAINT [FK_dbo.TransactionPaymentRow_dbo.PaymentBatch_PTMDisc_PaymentBatch_Id]
GO
ALTER TABLE [dbo].[TransactionPaymentRow]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TransactionPaymentRow_dbo.Transaction_Transaction_Id] FOREIGN KEY([Transaction_Id])
REFERENCES [dbo].[Transaction] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TransactionPaymentRow] CHECK CONSTRAINT [FK_dbo.TransactionPaymentRow_dbo.Transaction_Transaction_Id]
GO
ALTER TABLE [dbo].[TransactionPaymentRowText]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TransactionPaymentRowText_dbo.TransactionPaymentRow_PaymentMedia_Id] FOREIGN KEY([PaymentMedia_Id])
REFERENCES [dbo].[TransactionPaymentRow] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TransactionPaymentRowText] CHECK CONSTRAINT [FK_dbo.TransactionPaymentRowText_dbo.TransactionPaymentRow_PaymentMedia_Id]
GO
ALTER TABLE [dbo].[TransactionTextRow]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TransactionTextRow_dbo.Transaction_Transaction_Id] FOREIGN KEY([Transaction_Id])
REFERENCES [dbo].[Transaction] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TransactionTextRow] CHECK CONSTRAINT [FK_dbo.TransactionTextRow_dbo.Transaction_Transaction_Id]
GO
ALTER TABLE [dbo].[District]  WITH CHECK ADD  CONSTRAINT [FK_dbo.District_dbo.City_HighestHierarchyLevel2] FOREIGN KEY([HighestHierarchyLevel2])
REFERENCES [dbo].[City] ([Id])
GO
ALTER TABLE [dbo].[District] CHECK CONSTRAINT [FK_dbo.District_dbo.City_HighestHierarchyLevel2]
GO
ALTER TABLE [dbo].[District]  WITH CHECK ADD  CONSTRAINT [FK_dbo.District_dbo.ConfigurableSettings_SettingsId] FOREIGN KEY([SettingsId])
REFERENCES [dbo].[ConfigurableSettings] ([Id])
GO
ALTER TABLE [dbo].[District] CHECK CONSTRAINT [FK_dbo.District_dbo.ConfigurableSettings_SettingsId]
GO
ALTER TABLE [dbo].[UserCostCenter]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserCostCenter_dbo.CostCenter_CostCenterId] FOREIGN KEY([CostCenterId])
REFERENCES [dbo].[CostCenter] ([Id])
GO
ALTER TABLE [dbo].[UserCostCenter] CHECK CONSTRAINT [FK_dbo.UserCostCenter_dbo.CostCenter_CostCenterId]
GO
ALTER TABLE [dbo].[UserCostCenter]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserCostCenter_dbo.User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[UserCostCenter] CHECK CONSTRAINT [FK_dbo.UserCostCenter_dbo.User_UserId]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserRole_dbo.User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_dbo.UserRole_dbo.User_UserId]
GO
ALTER TABLE [dbo].[VoucherRow]  WITH CHECK ADD  CONSTRAINT [FK_dbo.VoucherRow_dbo.Voucher_Voucher_Id] FOREIGN KEY([Voucher_Id])
REFERENCES [dbo].[Voucher] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[VoucherRow] CHECK CONSTRAINT [FK_dbo.VoucherRow_dbo.Voucher_Voucher_Id]
GO
/****** Object:  StoredProcedure [dbo].[DiscBalanceReport]    Script Date: 11/26/2021 2:44:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

				CREATE PROCEDURE [dbo].[DiscBalanceReport](@Country_ID INT, @City_ID INT, @Disc_TYPE INT, @CUSTOMER_ID INT) AS
					BEGIN
						IF @CUSTOMER_ID != 0 AND @Disc_TYPE != 0
						BEGIN
							SELECT cb.Id as [Id], felixUser.FirstName + ' ' + felixUser.LastName as [Name], customer.Name as [Customer], cb.SerialNumber as [Disc number], cb.ValidUntil as [Valid to], CAST(cb.LastUsed AS DATE) as [Last used], cb.Balance as [Disc value]
							FROM DiscBase as cb
							JOIN User as felixUser ON cb.UserId = felixUser.Id
							JOIN Customer as customer ON felixUser.CustomerId = customer.Id
							WHERE cb.HighestHierarchyLevel = @Country_ID AND cb.HighestHierarchyLevel2 = @City_ID AND cb.DiscType = @Disc_TYPE AND customer.Id = @CUSTOMER_ID
						END

						ELSE IF @CUSTOMER_ID = 0 AND @Disc_TYPE = 0
						BEGIN
							SELECT cb.Id as [Id], felixUser.FirstName + ' ' + felixUser.LastName as [Name], customer.Name as [Customer], cb.SerialNumber as [Disc number], cb.ValidUntil as [Valid to], CAST(cb.LastUsed AS DATE) as [Last used], cb.Balance as [Disc value]
							FROM DiscBase as cb
							JOIN User as felixUser ON cb.UserId = felixUser.Id
							JOIN Customer as customer ON felixUser.CustomerId = customer.Id
							WHERE cb.HighestHierarchyLevel = @Country_ID AND cb.HighestHierarchyLevel2 = @City_ID
						END

						ELSE IF @CUSTOMER_ID = 0 AND @Disc_TYPE != 0
						BEGIN
							SELECT cb.Id as [Id], felixUser.FirstName + ' ' + felixUser.LastName as [Name], customer.Name as [Customer], cb.SerialNumber as [Disc number], cb.ValidUntil as [Valid to], CAST(cb.LastUsed AS DATE) as [Last used], cb.Balance as [Disc value]
							FROM DiscBase as cb
							JOIN User as felixUser ON cb.UserId = felixUser.Id
							JOIN Customer as customer ON felixUser.CustomerId = customer.Id
							WHERE cb.HighestHierarchyLevel = @Country_ID AND cb.HighestHierarchyLevel2 = @City_ID AND cb.DiscType = @Disc_TYPE
						END

						IF @CUSTOMER_ID != 0 AND @Disc_TYPE = 0
						BEGIN
							SELECT cb.Id as [Id], felixUser.FirstName + ' ' + felixUser.LastName as [Name], customer.Name as [Customer], cb.SerialNumber as [Disc number], cb.ValidUntil as [Valid to], CAST(cb.LastUsed AS DATE) as [Last used], cb.Balance as [Disc value]
							FROM DiscBase as cb
							JOIN User as felixUser ON cb.UserId = felixUser.Id
							JOIN Customer as customer ON felixUser.CustomerId = customer.Id
							WHERE cb.HighestHierarchyLevel = @Country_ID AND cb.HighestHierarchyLevel2 = @City_ID AND customer.Id = @CUSTOMER_ID
						END
					END
		
GO
/****** Object:  StoredProcedure [dbo].[POS_AutoIncrementingDeliveryNoteNumber]    Script Date: 11/26/2021 2:44:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- 
-- =============================================
CREATE PROCEDURE [dbo].[POS_AutoIncrementingDeliveryNoteNumber] @CashRegisterId int
AS
BEGIN
	UPDATE CashRegister SET NextDeliveryNoteNumber = NextDeliveryNoteNumber + 1 WHERE Id = @CashRegisterId and IsDeleted = 0

	SELECT NextDeliveryNoteNumber FROM CashRegister WHERE Id = @CashRegisterId and IsDeleted = 0
END
	
GO
/****** Object:  StoredProcedure [dbo].[POS_AutoIncrementingDepositReportNumber]    Script Date: 11/26/2021 2:44:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
CREATE PROCEDURE [dbo].[POS_AutoIncrementingDepositReportNumber] @CashRegisterId int
AS
BEGIN
	UPDATE CashRegister SET NextDepositReportNumber = NextDepositReportNumber + 1 WHERE Id = @CashRegisterId and IsDeleted = 0

	SELECT NextDepositReportNumber FROM CashRegister WHERE Id = @CashRegisterId and IsDeleted = 0
END
GO
/****** Object:  StoredProcedure [dbo].[POS_AutoIncrementingOrderNumber]    Script Date: 11/26/2021 2:44:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
CREATE PROCEDURE [dbo].[POS_AutoIncrementingOrderNumber] @HighestHierarchyLevel2 int
AS
BEGIN
	UPDATE City SET NextOrderNumber = NextOrderNumber + 1 WHERE Id = @HighestHierarchyLevel2 and IsDeleted = 0

	SELECT NextOrderNumber FROM City WHERE Id = @HighestHierarchyLevel2 and IsDeleted = 0
END
	

	
GO
/****** Object:  StoredProcedure [dbo].[POS_AutoIncrementingPtmVoucherNumber]    Script Date: 11/26/2021 2:44:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
CREATE PROCEDURE [dbo].[POS_AutoIncrementingPtmVoucherNumber] @HighestHierarchyLevel2 int
AS
BEGIN
	UPDATE City SET NextPTMVoucherNumber = NextPTMVoucherNumber + 1 WHERE Id = @HighestHierarchyLevel2 and IsDeleted = 0

	SELECT NextPTMVoucherNumber FROM City WHERE Id = @HighestHierarchyLevel2 and IsDeleted = 0
END
GO
/****** Object:  StoredProcedure [dbo].[POS_AutoIncrementingReceiptNumber]    Script Date: 11/26/2021 2:44:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Niklas Berntsson
-- Create date: 2019-01-28
-- Description:	Getting next recipient number for ARS7100
-- =============================================
CREATE PROCEDURE [dbo].[POS_AutoIncrementingReceiptNumber] @CashRegisterId int
	
AS
BEGIN
	UPDATE CashRegister SET NextReceiptNumber = NextReceiptNumber + 1 WHERE Id = @CashRegisterId and IsDeleted = 0

	SELECT NextReceiptNumber FROM CashRegister WHERE Id = @CashRegisterId and IsDeleted = 0
END
GO
/****** Object:  StoredProcedure [dbo].[POS_AutoIncrementingZ2ReportNumber]    Script Date: 11/26/2021 2:44:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
CREATE PROCEDURE [dbo].[POS_AutoIncrementingZ2ReportNumber] @CashRegisterId int
AS
BEGIN
	UPDATE CashRegister SET NextZ2ReportNumber = NextZ2ReportNumber + 1 WHERE Id = @CashRegisterId and IsDeleted = 0

	SELECT NextZ2ReportNumber FROM CashRegister WHERE Id = @CashRegisterId and IsDeleted = 0
END
GO
/****** Object:  StoredProcedure [dbo].[POS_AutoIncrementingZReportNumber]    Script Date: 11/26/2021 2:44:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
CREATE PROCEDURE [dbo].[POS_AutoIncrementingZReportNumber] @CashRegisterId int
AS
BEGIN
	UPDATE CashRegister SET NextZReportNumber = NextZReportNumber + 1 WHERE Id = @CashRegisterId and IsDeleted = 0

	SELECT NextZReportNumber FROM CashRegister WHERE Id = @CashRegisterId and IsDeleted = 0
END
GO
/****** Object:  StoredProcedure [dbo].[POS_SetAutoIncrementingDeliveryNoteNumber]    Script Date: 11/26/2021 2:44:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- 
-- =============================================
CREATE PROCEDURE [dbo].[POS_SetAutoIncrementingDeliveryNoteNumber] @CashRegisterId int, @Value int
AS
BEGIN
	UPDATE CashRegister SET NextDeliveryNoteNumber = @Value WHERE Id = @CashRegisterId and IsDeleted = 0

END
	
GO
/****** Object:  StoredProcedure [dbo].[POS_SetAutoIncrementingDepositReportNumber]    Script Date: 11/26/2021 2:44:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- 
-- =============================================
CREATE PROCEDURE [dbo].[POS_SetAutoIncrementingDepositReportNumber] @CashRegisterId int, @Value int
AS
BEGIN
	UPDATE CashRegister SET NextDepositReportNumber = @Value WHERE Id = @CashRegisterId and IsDeleted = 0

END
	
GO
/****** Object:  StoredProcedure [dbo].[POS_SetAutoIncrementingOrderNumber]    Script Date: 11/26/2021 2:44:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- 
-- =============================================
CREATE PROCEDURE [dbo].[POS_SetAutoIncrementingOrderNumber] @HighestHierarchyLevel2 int, @Value int
AS
BEGIN
	UPDATE City SET NextOrderNumber = @Value WHERE Id = @HighestHierarchyLevel2 and IsDeleted = 0

END
GO
/****** Object:  StoredProcedure [dbo].[POS_SetAutoIncrementingPtmVoucherNumber]    Script Date: 11/26/2021 2:44:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- 
-- =============================================
CREATE PROCEDURE [dbo].[POS_SetAutoIncrementingPtmVoucherNumber] @HighestHierarchyLevel2 int, @Value int
AS
BEGIN
	UPDATE City SET NextPTMVoucherNumber = @Value WHERE Id = @HighestHierarchyLevel2 and IsDeleted = 0

END
GO
/****** Object:  StoredProcedure [dbo].[POS_SetAutoIncrementingReceiptNumber]    Script Date: 11/26/2021 2:44:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- 
-- =============================================
CREATE PROCEDURE [dbo].[POS_SetAutoIncrementingReceiptNumber] @CashRegisterId int, @Value int
AS
BEGIN
	UPDATE CashRegister SET NextReceiptNumber = @Value WHERE Id = @CashRegisterId and IsDeleted = 0

END
	
GO
/****** Object:  StoredProcedure [dbo].[POS_SetAutoIncrementingZ2ReportNumber]    Script Date: 11/26/2021 2:44:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- 
-- =============================================
CREATE PROCEDURE [dbo].[POS_SetAutoIncrementingZ2ReportNumber] @CashRegisterId int, @Value int
AS
BEGIN
	UPDATE CashRegister SET NextZ2ReportNumber = @Value WHERE Id = @CashRegisterId and IsDeleted = 0

END
	
GO
/****** Object:  StoredProcedure [dbo].[POS_SetAutoIncrementingZReportNumber]    Script Date: 11/26/2021 2:44:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- 
-- =============================================
CREATE PROCEDURE [dbo].[POS_SetAutoIncrementingZReportNumber] @CashRegisterId int, @Value int
AS
BEGIN
	UPDATE CashRegister SET NextZReportNumber = @Value WHERE Id = @CashRegisterId and IsDeleted = 0

END
	
GO
/****** Object:  StoredProcedure [dbo].[UsersData]    Script Date: 11/26/2021 2:44:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

				CREATE PROCEDURE [dbo].[UsersData](@Country_ID INT, @City_ID INT) AS
					BEGIN
					  SELECT User.Id, 
							 FirstName as [First name], 
							 LastName as [Last name], 
							 UserName as [Username], 
							 Customer.Name as [Customer name], 
							 CAST(RegistrationDate AS DATE) as [Registration date],
							 EmployeeNumber as [Employee number], 
							 User.IsDeleted as [Is deleted]
					  FROM User
					  JOIN Customer on User.CustomerId = Customer.Id
					  WHERE User.HighestHierarchyLevel = @Country_ID 
							  AND User.HighestHierarchyLevel2 = @City_ID
					END;
		
GO
/****** Object:  StoredProcedure [dbo].[UsersDataWhitDataFilter]    Script Date: 11/26/2021 2:44:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

				CREATE PROCEDURE [dbo].[UsersDataWhitDataFilter](@Country_ID INT, @City_ID INT, @FROM DATETIME, @TO DATETIME) AS
					BEGIN
					  SELECT User.Id, 
							 FirstName as [First name], 
							 LastName as [Last name], 
							 UserName as [Username], 
							 Customer.Name as [Customer name], 
							 CAST(RegistrationDate AS DATE) as [Registration date], 
							 EmployeeNumber as [Employee number], 
							 User.IsDeleted as [Is deleted]
					  FROM User
					  JOIN Customer on User.CustomerId = Customer.Id
					  WHERE User.HighestHierarchyLevel = @Country_ID 
							  AND User.HighestHierarchyLevel2 = @City_ID 
							  AND RegistrationDate >= @FROM 
							  AND RegistrationDate <= @TO
					END;
		
GO
USE [master]
GO
ALTER DATABASE [SQL_Server_DB] SET  READ_WRITE 
GO
