USE [Shop]
GO
/****** Object:  UserDefinedFunction [dbo].[SplitString]    Script Date: 30-01-2020 16:25:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[SplitString]
(    
      @Input NVARCHAR(MAX),
      @Character CHAR(1)
)
RETURNS @Output TABLE (
      Item NVARCHAR(1000)
)
AS
BEGIN
      DECLARE @StartIndex INT, @EndIndex INT
 
      SET @StartIndex = 1
      IF SUBSTRING(@Input, LEN(@Input) - 1, LEN(@Input)) <> @Character
      BEGIN
            SET @Input = @Input + @Character
      END
 
      WHILE CHARINDEX(@Character, @Input) > 0
      BEGIN
            SET @EndIndex = CHARINDEX(@Character, @Input)
           
            INSERT INTO @Output(Item)
            SELECT SUBSTRING(@Input, @StartIndex, @EndIndex - 1)
           
            SET @Input = SUBSTRING(@Input, @EndIndex + 1, LEN(@Input))
      END
 
      RETURN
END


GO
/****** Object:  Table [dbo].[AdminLoginMaster]    Script Date: 30-01-2020 16:25:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminLoginMaster](
	[User_ID] [int] IDENTITY(1,1) NOT NULL,
	[EmailID] [varchar](250) NULL,
	[Password] [varchar](150) NULL,
	[UserName] [varchar](50) NULL,
	[IsAdmin] [bit] NOT NULL,
 CONSTRAINT [PK_AdminLoginMaster] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category_Master]    Script Date: 30-01-2020 16:25:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category_Master](
	[Category_ID] [int] IDENTITY(1,1) NOT NULL,
	[Category_Name] [varchar](150) NULL,
	[Menu_ID] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Category_Master] PRIMARY KEY CLUSTERED 
(
	[Category_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Email_Group_Master]    Script Date: 30-01-2020 16:25:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Email_Group_Master](
	[Email_Group_ID] [int] IDENTITY(1,1) NOT NULL,
	[Email_Group_Name] [varchar](50) NULL,
 CONSTRAINT [PK_Email_Group_Master] PRIMARY KEY CLUSTERED 
(
	[Email_Group_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Information_Master]    Script Date: 30-01-2020 16:25:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Information_Master](
	[Information_ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](100) NULL,
	[Description] [varchar](max) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_Information_Master] PRIMARY KEY CLUSTERED 
(
	[Information_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MainMenu_Master]    Script Date: 30-01-2020 16:25:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MainMenu_Master](
	[Menu_ID] [int] IDENTITY(1,1) NOT NULL,
	[Menu_Name] [varchar](150) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_MainMenu_Master] PRIMARY KEY CLUSTERED 
(
	[Menu_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_CK_Master]    Script Date: 30-01-2020 16:25:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_CK_Master](
	[Product_CK_ID] [int] IDENTITY(1,1) NOT NULL,
	[Product_ID] [int] NULL,
	[CK_Title] [varchar](250) NULL,
	[Description] [text] NULL,
	[Created_date] [datetime] NULL,
	[Updated_date] [datetime] NULL,
 CONSTRAINT [PK_Product_CK_Master] PRIMARY KEY CLUSTERED 
(
	[Product_CK_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Image_Master]    Script Date: 30-01-2020 16:25:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Image_Master](
	[Procut_image_ID] [int] IDENTITY(1,1) NOT NULL,
	[Product_ID] [int] NULL,
	[Product_image] [varbinary](max) NULL,
	[Image_name] [varchar](250) NULL,
	[Created_date] [datetime] NULL,
	[Updated_date] [datetime] NULL,
	[AlterText] [varchar](350) NULL,
 CONSTRAINT [PK_Product_Image_Master] PRIMARY KEY CLUSTERED 
(
	[Procut_image_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Master]    Script Date: 30-01-2020 16:25:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Master](
	[Product_ID] [int] IDENTITY(1,1) NOT NULL,
	[Product_Title] [varchar](200) NULL,
	[Product_short_description] [text] NULL,
	[Product_long_description] [text] NULL,
	[Created_date] [datetime] NULL,
	[Updated_date] [datetime] NULL,
	[Category_ID] [int] NULL,
	[SubCategory_ID] [int] NULL,
	[ThirdCategory_ID] [int] NULL,
	[Product_Price] [decimal](18, 2) NULL,
	[IsHotProduct] [bit] NULL,
 CONSTRAINT [PK_Product_Master] PRIMARY KEY CLUSTERED 
(
	[Product_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Specification_Master]    Script Date: 30-01-2020 16:25:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Specification_Master](
	[Product_Specification_ID] [int] IDENTITY(1,1) NOT NULL,
	[Product_ID] [int] NULL,
	[Specification_Title] [varchar](250) NULL,
	[Specification_Value] [varchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[Specification_GroupID] [int] NULL,
 CONSTRAINT [PK_Product_Specification_Master] PRIMARY KEY CLUSTERED 
(
	[Product_Specification_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Specification_Group_Master]    Script Date: 30-01-2020 16:25:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specification_Group_Master](
	[Specification_GroupID] [int] IDENTITY(1,1) NOT NULL,
	[Product_ID] [int] NULL,
	[Specification_Group_Name] [varchar](250) NULL,
 CONSTRAINT [PK_Specification_Group_Master] PRIMARY KEY CLUSTERED 
(
	[Specification_GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubCategory_Master]    Script Date: 30-01-2020 16:25:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategory_Master](
	[SubCategory_ID] [int] IDENTITY(1,1) NOT NULL,
	[SubCategory_Name] [varchar](150) NULL,
	[Category_ID] [int] NULL,
	[IsDeleted] [bit] NULL,
	[Image] [varbinary](max) NULL,
	[IsHomePage] [bit] NULL,
	[ImageName] [varchar](250) NULL,
	[Sortable] [numeric](18, 0) NULL,
	[Heading] [varchar](550) NULL,
	[Description] [varchar](max) NULL,
	[Page_Image] [varbinary](max) NULL,
	[Page_Image_Name] [varchar](250) NULL,
	[AlterText] [varchar](350) NULL,
 CONSTRAINT [PK_SubCategory_Master] PRIMARY KEY CLUSTERED 
(
	[SubCategory_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subscribe_Master]    Script Date: 30-01-2020 16:25:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subscribe_Master](
	[Subscribe_ID] [int] IDENTITY(1,1) NOT NULL,
	[EmailID] [varchar](250) NULL,
	[Email_Group_ID] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Subscribe_Master] PRIMARY KEY CLUSTERED 
(
	[Subscribe_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThirdCategory_Master]    Script Date: 30-01-2020 16:25:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThirdCategory_Master](
	[ThirdCategory_ID] [int] IDENTITY(1,1) NOT NULL,
	[SubCategory_ID] [int] NULL,
	[ThirdCategory_Name] [varchar](250) NULL,
 CONSTRAINT [PK_ThirdCategory_Master] PRIMARY KEY CLUSTERED 
(
	[ThirdCategory_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AdminLoginMaster] ON 

INSERT [dbo].[AdminLoginMaster] ([User_ID], [EmailID], [Password], [UserName], [IsAdmin]) VALUES (1, N'test@gmail.com', N'12345', N'Manish', 1)
INSERT [dbo].[AdminLoginMaster] ([User_ID], [EmailID], [Password], [UserName], [IsAdmin]) VALUES (2, N'rajujikadra@gmail.com', N'Password123#', N'Rajesh Jikadra', 1)
SET IDENTITY_INSERT [dbo].[AdminLoginMaster] OFF
SET IDENTITY_INSERT [dbo].[Category_Master] ON 

INSERT [dbo].[Category_Master] ([Category_ID], [Category_Name], [Menu_ID], [IsDeleted]) VALUES (29, N'Birds', 10, 0)
INSERT [dbo].[Category_Master] ([Category_ID], [Category_Name], [Menu_ID], [IsDeleted]) VALUES (30, N'Fish', 10, 0)
INSERT [dbo].[Category_Master] ([Category_ID], [Category_Name], [Menu_ID], [IsDeleted]) VALUES (31, N'Cat', 10, 0)
INSERT [dbo].[Category_Master] ([Category_ID], [Category_Name], [Menu_ID], [IsDeleted]) VALUES (41, N'Dogs', 10, 0)
SET IDENTITY_INSERT [dbo].[Category_Master] OFF
SET IDENTITY_INSERT [dbo].[Email_Group_Master] ON 

INSERT [dbo].[Email_Group_Master] ([Email_Group_ID], [Email_Group_Name]) VALUES (3, N'Email_Group_1')
SET IDENTITY_INSERT [dbo].[Email_Group_Master] OFF
SET IDENTITY_INSERT [dbo].[MainMenu_Master] ON 

INSERT [dbo].[MainMenu_Master] ([Menu_ID], [Menu_Name], [IsDeleted]) VALUES (10, N'Shop by pet', 0)
SET IDENTITY_INSERT [dbo].[MainMenu_Master] OFF
SET IDENTITY_INSERT [dbo].[Product_CK_Master] ON 

INSERT [dbo].[Product_CK_Master] ([Product_CK_ID], [Product_ID], [CK_Title], [Description], [Created_date], [Updated_date]) VALUES (1, 16, N'DESCRIPTION', N'Dogs have a body structure just like their ancestors and it is of vital importance that their diets should match too. Acana Classic Prairie Poultry Dog Food 11.4 Kg offers high-quality free-run chicken and turkey plus whole nest laid eggs which are delivered fresh or raw daily in Whole prey ratios from local prairie farms. Having 0% high glycemic carbohydrates, the meal provides low-glycemic and locally grown steel-cut oats that help maintain a stable blood sugar level and to prevent obesity. Acana Prairie poultry has a rich protein content which builds lean muscle mass and nourishes the canine according to his evolutionary needs. It contains Omega 3 and Omega 6 fatty acids to counter inflammation in dogs and to promote a healthy and shiny coat in them. The meal offers a decent amount of fat to meet the high energy requirements in active canines. Acana Classic is a biologically appropriate food and is suitable for all breeds and life stages.', CAST(N'2020-01-30T12:42:56.073' AS DateTime), NULL)
INSERT [dbo].[Product_CK_Master] ([Product_CK_ID], [Product_ID], [CK_Title], [Description], [Created_date], [Updated_date]) VALUES (2, 16, N'BENEFITS OF ACANA CLASSIC PRAIRIE POULTRY FOOD', N'High-quality free-run chicken and turkey plus whole nest eggs make the meal delicious for canines.
Loaded with protein for building lean muscle mass and to enhance skin and hair growth.
Decent amount of fat present in the diet meets the high energy requirements in active dogs.
Omega 3 and Omega 6 fatty acids promote healthy skin and give a lustrous coat.
Having a 0% high glycemic carbohydrates, Acana Classic food helps in countering obesity and diabetes.
Suitable for all breeds and life stages.', CAST(N'2020-01-30T12:43:10.383' AS DateTime), NULL)
INSERT [dbo].[Product_CK_Master] ([Product_CK_ID], [Product_ID], [CK_Title], [Description], [Created_date], [Updated_date]) VALUES (3, 16, N'INGREDIENTS', N'Chicken meal (25%), steel-cut oats (23%), fresh chicken meat (5%), fresh chicken giblets (liver, heart, kidney) (5%), whole red lentils, whole green peas, whole green lentils, fresh turkey meat (4%), fresh whole eggs (4%), chicken fat (4%), whole garbanzo beans, whole yellow peas, whole oats, herring oil (3%), sun-cured alfalfa, lentil fiber, dried brown kelp, fresh pumpkin, fresh butternut squash, fresh parsnips, fresh green kale, fresh spinach, fresh carrots, fresh red delicious apples, fresh bartlett pears, freeze-dried chicken liver (0.1%), salt, fresh cranberries, fresh blueberries, chicory root, turmeric root, milk thistle, burdock root, lavender, marshmallow root, rosehips', CAST(N'2020-01-30T12:43:24.100' AS DateTime), NULL)
INSERT [dbo].[Product_CK_Master] ([Product_CK_ID], [Product_ID], [CK_Title], [Description], [Created_date], [Updated_date]) VALUES (4, 18, N'AQUADENE Natural Red Ruby', N'It provides essential elements found in the natural environment that are missing in aquariums. With the belief that all fish require a complete and fully balanced varied diet, New Life also contains Algae Meal, that consists of seaweed, kelp, and haematococcus pluvialis (a micro algae), a premium grade of natural spirulina', CAST(N'2020-01-30T14:57:51.070' AS DateTime), NULL)
INSERT [dbo].[Product_CK_Master] ([Product_CK_ID], [Product_ID], [CK_Title], [Description], [Created_date], [Updated_date]) VALUES (5, 18, N'Feeding', N'Feed as much food as the fish can consume within 5 min, twice-daily. Remove immediately all the uneaten food from the tank with a net after the feeding time and eating time of the fishes.', CAST(N'2020-01-30T14:58:03.260' AS DateTime), NULL)
INSERT [dbo].[Product_CK_Master] ([Product_CK_ID], [Product_ID], [CK_Title], [Description], [Created_date], [Updated_date]) VALUES (6, 18, N'Ingredient', N' Fish meal, shrimp meal, wheat germ meal, wheat flour, natural coloring, vitamins and other mineral element.

', CAST(N'2020-01-30T14:58:14.260' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Product_CK_Master] OFF
SET IDENTITY_INSERT [dbo].[Product_Image_Master] ON 

INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (1, 16, NULL, N'acanaprairie.jpg', CAST(N'2020-01-30T12:32:22.547' AS DateTime), CAST(N'2020-01-30T14:15:36.010' AS DateTime), N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (2, 16, NULL, N'acanaprairie (1).jpg', CAST(N'2020-01-30T12:45:48.380' AS DateTime), CAST(N'2020-01-30T14:14:48.377' AS DateTime), N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (3, 17, NULL, N'adultcatsalmon.jpg', CAST(N'2020-01-30T14:35:18.137' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (4, 17, NULL, N'adultcatsalmonNew.jpg', CAST(N'2020-01-30T14:42:38.793' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (5, 18, NULL, N'ruby-red.jpg', CAST(N'2020-01-30T14:55:21.917' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (6, 18, NULL, N'Natural-Red-Ruby.jpg', CAST(N'2020-01-30T14:55:59.613' AS DateTime), NULL, N'')
SET IDENTITY_INSERT [dbo].[Product_Image_Master] OFF
SET IDENTITY_INSERT [dbo].[Product_Master] ON 

INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (16, N'Acana Classic Prairie Poultry Dog Food 11.4 Kg', N'Dogs have a body structure just like their ancestors and it is of vital importance that their diets should match too.', N'Dogs have a body structure just like their ancestors and it is of vital importance that their diets should match too. Acana Classic Prairie Poultry Dog Food 11.4 Kg offers high-quality free-run chicken and turkey plus whole nest laid eggs which are delivered fresh or raw daily in Whole prey ratios from local prairie farms. Having 0% high glycemic carbohydrates, the meal provides low-glycemic and locally grown steel-cut oats that help maintain a stable blood sugar level and to prevent obesity. Acana Prairie poultry has a rich protein content which builds lean muscle mass and nourishes the canine according to his evolutionary needs. It contains Omega 3 and Omega 6 fatty acids to counter inflammation in dogs and to promote a healthy and shiny coat in them. The meal offers a decent amount of fat to meet the high energy requirements in active canines. Acana Classic is a biologically appropriate food and is suitable for all breeds and life stages.', CAST(N'2020-01-30T12:31:31.917' AS DateTime), NULL, 41, 49, 4, CAST(6199.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (17, N'Arden Grange Adult Cat Fresh Salmon And Potato Food 4 Kg', N'Arden Grange Adult Cat Salmon Food 4 Kg is a highly nutritious cat food containing ethically produced human grade chicken and potato having a rich protein content along with essential vitamins and minerals for maintaining a healthy and active lifestyle in adult cats of all breeds.', N'The diet is completely free from grains and cereals for mirroring your cats natural diet in the wild. A rich amino acid profile helps in sustaining ideal body function and to promote skin and hair growth. Omega 3 and Omega 6 fatty acids eliminate skin outbreaks and encourages a shiny fur in cats. Arden Grange Adult Cat Salmon contains Taurine for assisting good cardiac health and a healthy eyesight. ', CAST(N'2020-01-30T14:34:53.300' AS DateTime), NULL, 31, 52, 11, CAST(2644.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (18, N'Aquadene Ruby Red Fish Food 1 Ltr', N'Ruby Red Cliched Formula is a hormone-free, color enhancing formula. Spectrum food is made with high-quality easily digestible krill', N'Ruby Red Cliched Formula is a hormone-free, color enhancing formula. Spectrum food is made with high-quality easily digestible krill, herring and squid protein with all-natural color-enhancing ingredients for a balanced diet that boosts immune system function and enhances the full spectrum of your fish’s color. It provides essential elements found in the natural environment that are missing in aquariums. ', CAST(N'2020-01-30T14:55:07.330' AS DateTime), NULL, 30, 53, 19, CAST(550.00 AS Decimal(18, 2)), 1)
SET IDENTITY_INSERT [dbo].[Product_Master] OFF
SET IDENTITY_INSERT [dbo].[Product_Specification_Master] ON 

INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (1, 16, N'BREED', N'For all breeds and life stages.', CAST(N'2020-01-30T12:39:52.517' AS DateTime), NULL, 29)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (2, 16, N'INGREDIENTS', N'Chicken meal (25%), steel-cut oats (23%), fresh chicken meat (5%), fresh chicken giblets (liver, heart, kidney) (5%), whole red lentils, whole green peas, whole green lentils, fresh turkey meat (4%), fresh whole eggs (4%), chicken fat (4%), whole gar', CAST(N'2020-01-30T12:40:20.423' AS DateTime), NULL, 30)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (3, 16, N'NUTRITION FACTS', N'Crude Fibre (5%), Glucosamine (1200mg/kg), Chondroitin Sulfate (900 mg/kg) , Crude Ash (7.5%), Linoleic acid (2.4%), Calcium (1.2%), Fat (17%), Moisture (12%), Omega 6 (2.6%), Omega 3 (0.5%), Methionine Cystine (0.86%), Vitamin A 10000.0 (UI/kg, Crud', CAST(N'2020-01-30T12:40:39.507' AS DateTime), NULL, 32)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (4, 16, N'QUANTITY', N'11.4 Kg', CAST(N'2020-01-30T12:41:10.417' AS DateTime), NULL, 28)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (5, 16, N'SUPPLEMENTS', N'Vitamin A, Vitamin D3, Vitamin E, Choline Chloride, Zinc Chelate, Vitamin B5.', CAST(N'2020-01-30T12:41:27.083' AS DateTime), NULL, 31)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (6, 16, N'TYPE', N'Adult and Puppy Food', CAST(N'2020-01-30T12:41:42.680' AS DateTime), NULL, 27)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (7, 17, N'Antioxidants', N'Mixed Tocopherols', CAST(N'2020-01-30T14:37:08.127' AS DateTime), NULL, 42)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (8, 17, N'Breed', N'Adult cats of all breeds having a normal activity level. Adult cats who need skin and coat care. (All breeds)', CAST(N'2020-01-30T14:37:43.833' AS DateTime), NULL, 37)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (9, 17, N'Ingredients', N'Fresh salmon (26%), potato (26%), salmon meat meal (22%), chicken oil, pea starch, egg powder, chicken digest, krill, yeast extract, malt extract, pea fibre, minerals, prebiotic FOS, prebiotic MOS, cranberry extract, glucosamine, MSM, chondroitin, nu', CAST(N'2020-01-30T14:38:13.427' AS DateTime), NULL, 38)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (10, 17, N'Nutrition Facts', N'Crude Protein (31%), Fat Content (19%), Crude Ash (8%), Crude Fibres (2.2%), Calcium (1.5%), Phosphorous (1%), Taurine (1000mg/kg), Omega- 3 (1%), Omega-6 (4.3%)', CAST(N'2020-01-30T14:38:41.127' AS DateTime), NULL, 39)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (11, 17, N'Quantity', N'4 Kg', CAST(N'2020-01-30T14:39:13.273' AS DateTime), NULL, 36)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (12, 17, N'Trace Elements', N'Zinc chelate of amino acid hydrate 500mg, Copper chelate of amino acid hydrate 100mg, Manganese chelate of amino acid hydrate 67mg, Calcium iodate anhydrous 2.4mg, Selenised Yeast (inactivated) 65mg.', CAST(N'2020-01-30T14:39:37.227' AS DateTime), NULL, 41)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (13, 17, N'Type', N'Adult Cat Food', CAST(N'2020-01-30T14:39:52.280' AS DateTime), NULL, 35)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (14, 17, N'Vitamins', N'Vitamin A 28,000 IU, Vitamin D3 2,000 IU, Vitamin E 200 IU', CAST(N'2020-01-30T14:40:11.880' AS DateTime), NULL, 40)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (17, 18, N'Weight', N'830 g', CAST(N'2020-01-30T14:59:46.717' AS DateTime), NULL, 45)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (18, 18, N'Dimensions', N'12 × 12 × 14 cm', CAST(N'2020-01-30T15:00:01.753' AS DateTime), NULL, 44)
SET IDENTITY_INSERT [dbo].[Product_Specification_Master] OFF
SET IDENTITY_INSERT [dbo].[Specification_Group_Master] ON 

INSERT [dbo].[Specification_Group_Master] ([Specification_GroupID], [Product_ID], [Specification_Group_Name]) VALUES (27, 16, N'TYPE')
INSERT [dbo].[Specification_Group_Master] ([Specification_GroupID], [Product_ID], [Specification_Group_Name]) VALUES (28, 16, N'QUANTITY')
INSERT [dbo].[Specification_Group_Master] ([Specification_GroupID], [Product_ID], [Specification_Group_Name]) VALUES (29, 16, N'BREED')
INSERT [dbo].[Specification_Group_Master] ([Specification_GroupID], [Product_ID], [Specification_Group_Name]) VALUES (30, 16, N'INGREDIENTS')
INSERT [dbo].[Specification_Group_Master] ([Specification_GroupID], [Product_ID], [Specification_Group_Name]) VALUES (31, 16, N'SUPPLEMENTS')
INSERT [dbo].[Specification_Group_Master] ([Specification_GroupID], [Product_ID], [Specification_Group_Name]) VALUES (32, 16, N'NUTRITION FACTS')
INSERT [dbo].[Specification_Group_Master] ([Specification_GroupID], [Product_ID], [Specification_Group_Name]) VALUES (35, 17, N'TYPE')
INSERT [dbo].[Specification_Group_Master] ([Specification_GroupID], [Product_ID], [Specification_Group_Name]) VALUES (36, 17, N'QUANTITY')
INSERT [dbo].[Specification_Group_Master] ([Specification_GroupID], [Product_ID], [Specification_Group_Name]) VALUES (37, 17, N'BREED')
INSERT [dbo].[Specification_Group_Master] ([Specification_GroupID], [Product_ID], [Specification_Group_Name]) VALUES (38, 17, N'INGREDIENTS')
INSERT [dbo].[Specification_Group_Master] ([Specification_GroupID], [Product_ID], [Specification_Group_Name]) VALUES (39, 17, N'NUTRITION FACTS')
INSERT [dbo].[Specification_Group_Master] ([Specification_GroupID], [Product_ID], [Specification_Group_Name]) VALUES (40, 17, N'VITAMINS')
INSERT [dbo].[Specification_Group_Master] ([Specification_GroupID], [Product_ID], [Specification_Group_Name]) VALUES (41, 17, N'TRACE ELEMENTS')
INSERT [dbo].[Specification_Group_Master] ([Specification_GroupID], [Product_ID], [Specification_Group_Name]) VALUES (42, 17, N'ANTIOXIDANTS')
INSERT [dbo].[Specification_Group_Master] ([Specification_GroupID], [Product_ID], [Specification_Group_Name]) VALUES (44, 18, N'Dimensions')
INSERT [dbo].[Specification_Group_Master] ([Specification_GroupID], [Product_ID], [Specification_Group_Name]) VALUES (45, 18, N'Weight')
SET IDENTITY_INSERT [dbo].[Specification_Group_Master] OFF
SET IDENTITY_INSERT [dbo].[SubCategory_Master] ON 

INSERT [dbo].[SubCategory_Master] ([SubCategory_ID], [SubCategory_Name], [Category_ID], [IsDeleted], [Image], [IsHomePage], [ImageName], [Sortable], [Heading], [Description], [Page_Image], [Page_Image_Name], [AlterText]) VALUES (49, N'Dog Food', 41, 0, NULL, 1, N'DogFoodImg.jpg', CAST(5 AS Numeric(18, 0)), N'Find The Right Food For Your Dog', N'100% Complete and Balanced food for dogs Find The Right Food For Your Dog', NULL, N'AD2.jpg', N'')
INSERT [dbo].[SubCategory_Master] ([SubCategory_ID], [SubCategory_Name], [Category_ID], [IsDeleted], [Image], [IsHomePage], [ImageName], [Sortable], [Heading], [Description], [Page_Image], [Page_Image_Name], [AlterText]) VALUES (50, N'Treats & Chews', 41, 0, NULL, 0, N'DogFoodImg.jpg', CAST(4 AS Numeric(18, 0)), N'Test ', N'Test', NULL, N'', N'')
INSERT [dbo].[SubCategory_Master] ([SubCategory_ID], [SubCategory_Name], [Category_ID], [IsDeleted], [Image], [IsHomePage], [ImageName], [Sortable], [Heading], [Description], [Page_Image], [Page_Image_Name], [AlterText]) VALUES (51, N'Supplies', 41, 0, NULL, 1, N'dogSupplie.jpg', CAST(3 AS Numeric(18, 0)), N'test', N'test', NULL, N'', N'')
INSERT [dbo].[SubCategory_Master] ([SubCategory_ID], [SubCategory_Name], [Category_ID], [IsDeleted], [Image], [IsHomePage], [ImageName], [Sortable], [Heading], [Description], [Page_Image], [Page_Image_Name], [AlterText]) VALUES (52, N'Cat Food', 31, 0, NULL, 1, N'CatFood.jpeg', CAST(2 AS Numeric(18, 0)), N'Find The Right Food For Your Cat', N'100% Complete and Balanced food for dogs Find The Right Food For Your Cat', NULL, N'CatFoodCategoryheader.jpg', N'')
INSERT [dbo].[SubCategory_Master] ([SubCategory_ID], [SubCategory_Name], [Category_ID], [IsDeleted], [Image], [IsHomePage], [ImageName], [Sortable], [Heading], [Description], [Page_Image], [Page_Image_Name], [AlterText]) VALUES (53, N'Fish Food', 30, 0, NULL, 1, N'baned_archer_fish.jpg', CAST(1 AS Numeric(18, 0)), N'Find The Right Food For Your Fish', N'100% Complete and Balanced food for dogs Find The Right Food For Your Cat', NULL, N'FishCatImage.jpg', N'')
SET IDENTITY_INSERT [dbo].[SubCategory_Master] OFF
SET IDENTITY_INSERT [dbo].[Subscribe_Master] ON 

INSERT [dbo].[Subscribe_Master] ([Subscribe_ID], [EmailID], [Email_Group_ID], [IsDeleted]) VALUES (1, N'rajujikadra@gmail.com', 3, 1)
INSERT [dbo].[Subscribe_Master] ([Subscribe_ID], [EmailID], [Email_Group_ID], [IsDeleted]) VALUES (2, N'hetaldhandhukiya2410@gmail.com', 3, 1)
INSERT [dbo].[Subscribe_Master] ([Subscribe_ID], [EmailID], [Email_Group_ID], [IsDeleted]) VALUES (3, N'rajujikadra@gmail.com', 3, 1)
SET IDENTITY_INSERT [dbo].[Subscribe_Master] OFF
SET IDENTITY_INSERT [dbo].[ThirdCategory_Master] ON 

INSERT [dbo].[ThirdCategory_Master] ([ThirdCategory_ID], [SubCategory_ID], [ThirdCategory_Name]) VALUES (4, 49, N'Dry Food')
INSERT [dbo].[ThirdCategory_Master] ([ThirdCategory_ID], [SubCategory_ID], [ThirdCategory_Name]) VALUES (5, 49, N'Gravy Food')
INSERT [dbo].[ThirdCategory_Master] ([ThirdCategory_ID], [SubCategory_ID], [ThirdCategory_Name]) VALUES (6, 49, N'Veg Food')
INSERT [dbo].[ThirdCategory_Master] ([ThirdCategory_ID], [SubCategory_ID], [ThirdCategory_Name]) VALUES (7, 49, N'Human Grade Food')
INSERT [dbo].[ThirdCategory_Master] ([ThirdCategory_ID], [SubCategory_ID], [ThirdCategory_Name]) VALUES (8, 49, N'Prescription Food')
INSERT [dbo].[ThirdCategory_Master] ([ThirdCategory_ID], [SubCategory_ID], [ThirdCategory_Name]) VALUES (9, 49, N'Puppy Food')
INSERT [dbo].[ThirdCategory_Master] ([ThirdCategory_ID], [SubCategory_ID], [ThirdCategory_Name]) VALUES (10, 49, N'Starters')
INSERT [dbo].[ThirdCategory_Master] ([ThirdCategory_ID], [SubCategory_ID], [ThirdCategory_Name]) VALUES (11, 52, N'Dry Food')
INSERT [dbo].[ThirdCategory_Master] ([ThirdCategory_ID], [SubCategory_ID], [ThirdCategory_Name]) VALUES (12, 52, N'Gravy Food')
INSERT [dbo].[ThirdCategory_Master] ([ThirdCategory_ID], [SubCategory_ID], [ThirdCategory_Name]) VALUES (13, 52, N'Prescription Food')
INSERT [dbo].[ThirdCategory_Master] ([ThirdCategory_ID], [SubCategory_ID], [ThirdCategory_Name]) VALUES (14, 52, N'Canned Food')
INSERT [dbo].[ThirdCategory_Master] ([ThirdCategory_ID], [SubCategory_ID], [ThirdCategory_Name]) VALUES (15, 52, N'Kitten Food')
INSERT [dbo].[ThirdCategory_Master] ([ThirdCategory_ID], [SubCategory_ID], [ThirdCategory_Name]) VALUES (16, 52, N'Treats')
INSERT [dbo].[ThirdCategory_Master] ([ThirdCategory_ID], [SubCategory_ID], [ThirdCategory_Name]) VALUES (19, 53, N'Regular Food')
INSERT [dbo].[ThirdCategory_Master] ([ThirdCategory_ID], [SubCategory_ID], [ThirdCategory_Name]) VALUES (20, 53, N'Tropical Freshwater Fish')
INSERT [dbo].[ThirdCategory_Master] ([ThirdCategory_ID], [SubCategory_ID], [ThirdCategory_Name]) VALUES (21, 53, N'Gold Fish')
INSERT [dbo].[ThirdCategory_Master] ([ThirdCategory_ID], [SubCategory_ID], [ThirdCategory_Name]) VALUES (22, 53, N'Betta Food')
INSERT [dbo].[ThirdCategory_Master] ([ThirdCategory_ID], [SubCategory_ID], [ThirdCategory_Name]) VALUES (23, 53, N'Flower Horn')
INSERT [dbo].[ThirdCategory_Master] ([ThirdCategory_ID], [SubCategory_ID], [ThirdCategory_Name]) VALUES (24, 53, N'Cichlid Food')
INSERT [dbo].[ThirdCategory_Master] ([ThirdCategory_ID], [SubCategory_ID], [ThirdCategory_Name]) VALUES (25, 53, N'Herbivore Food')
INSERT [dbo].[ThirdCategory_Master] ([ThirdCategory_ID], [SubCategory_ID], [ThirdCategory_Name]) VALUES (26, 53, N'Shrimps')
INSERT [dbo].[ThirdCategory_Master] ([ThirdCategory_ID], [SubCategory_ID], [ThirdCategory_Name]) VALUES (27, 53, N'Turtle Food')
SET IDENTITY_INSERT [dbo].[ThirdCategory_Master] OFF
ALTER TABLE [dbo].[AdminLoginMaster] ADD  CONSTRAINT [DF_AdminLoginMaster_IsAdmin]  DEFAULT ((0)) FOR [IsAdmin]
GO
ALTER TABLE [dbo].[Category_Master] ADD  CONSTRAINT [DF_Category_Master_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[MainMenu_Master] ADD  CONSTRAINT [DF_MainMenu_Master_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Product_Master] ADD  CONSTRAINT [DF_Product_Master_IsHotProduct]  DEFAULT ((0)) FOR [IsHotProduct]
GO
ALTER TABLE [dbo].[SubCategory_Master] ADD  CONSTRAINT [DF_SubCategory_Master_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[SubCategory_Master] ADD  CONSTRAINT [DF_SubCategory_Master_IsHomePage]  DEFAULT ((0)) FOR [IsHomePage]
GO
ALTER TABLE [dbo].[Subscribe_Master] ADD  CONSTRAINT [DF_Subscribe_Master_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Category_Master]  WITH CHECK ADD  CONSTRAINT [FK_Menu_ID] FOREIGN KEY([Menu_ID])
REFERENCES [dbo].[MainMenu_Master] ([Menu_ID])
GO
ALTER TABLE [dbo].[Category_Master] CHECK CONSTRAINT [FK_Menu_ID]
GO
ALTER TABLE [dbo].[Product_CK_Master]  WITH CHECK ADD  CONSTRAINT [FK_Product_CK_Editor] FOREIGN KEY([Product_ID])
REFERENCES [dbo].[Product_Master] ([Product_ID])
GO
ALTER TABLE [dbo].[Product_CK_Master] CHECK CONSTRAINT [FK_Product_CK_Editor]
GO
ALTER TABLE [dbo].[Product_Image_Master]  WITH CHECK ADD  CONSTRAINT [FK_Product_Image] FOREIGN KEY([Product_ID])
REFERENCES [dbo].[Product_Master] ([Product_ID])
GO
ALTER TABLE [dbo].[Product_Image_Master] CHECK CONSTRAINT [FK_Product_Image]
GO
ALTER TABLE [dbo].[Product_Master]  WITH CHECK ADD  CONSTRAINT [FK_Cat_ID] FOREIGN KEY([Category_ID])
REFERENCES [dbo].[Category_Master] ([Category_ID])
GO
ALTER TABLE [dbo].[Product_Master] CHECK CONSTRAINT [FK_Cat_ID]
GO
ALTER TABLE [dbo].[Product_Master]  WITH CHECK ADD  CONSTRAINT [FK_Sub_Cat_ID] FOREIGN KEY([SubCategory_ID])
REFERENCES [dbo].[SubCategory_Master] ([SubCategory_ID])
GO
ALTER TABLE [dbo].[Product_Master] CHECK CONSTRAINT [FK_Sub_Cat_ID]
GO
ALTER TABLE [dbo].[Product_Master]  WITH CHECK ADD  CONSTRAINT [FK_Third_Cat_ID] FOREIGN KEY([ThirdCategory_ID])
REFERENCES [dbo].[ThirdCategory_Master] ([ThirdCategory_ID])
GO
ALTER TABLE [dbo].[Product_Master] CHECK CONSTRAINT [FK_Third_Cat_ID]
GO
ALTER TABLE [dbo].[Product_Specification_Master]  WITH CHECK ADD  CONSTRAINT [FK_ProductID] FOREIGN KEY([Product_ID])
REFERENCES [dbo].[Product_Master] ([Product_ID])
GO
ALTER TABLE [dbo].[Product_Specification_Master] CHECK CONSTRAINT [FK_ProductID]
GO
ALTER TABLE [dbo].[Product_Specification_Master]  WITH CHECK ADD  CONSTRAINT [FK_specification_groupID] FOREIGN KEY([Specification_GroupID])
REFERENCES [dbo].[Specification_Group_Master] ([Specification_GroupID])
GO
ALTER TABLE [dbo].[Product_Specification_Master] CHECK CONSTRAINT [FK_specification_groupID]
GO
ALTER TABLE [dbo].[Specification_Group_Master]  WITH CHECK ADD  CONSTRAINT [FK_product_id] FOREIGN KEY([Product_ID])
REFERENCES [dbo].[Product_Master] ([Product_ID])
GO
ALTER TABLE [dbo].[Specification_Group_Master] CHECK CONSTRAINT [FK_product_id]
GO
ALTER TABLE [dbo].[SubCategory_Master]  WITH CHECK ADD  CONSTRAINT [FK_Category_ID] FOREIGN KEY([Category_ID])
REFERENCES [dbo].[Category_Master] ([Category_ID])
GO
ALTER TABLE [dbo].[SubCategory_Master] CHECK CONSTRAINT [FK_Category_ID]
GO
ALTER TABLE [dbo].[Subscribe_Master]  WITH CHECK ADD  CONSTRAINT [FK_Email_Group] FOREIGN KEY([Email_Group_ID])
REFERENCES [dbo].[Email_Group_Master] ([Email_Group_ID])
GO
ALTER TABLE [dbo].[Subscribe_Master] CHECK CONSTRAINT [FK_Email_Group]
GO
ALTER TABLE [dbo].[ThirdCategory_Master]  WITH CHECK ADD  CONSTRAINT [FK_SubCategory] FOREIGN KEY([SubCategory_ID])
REFERENCES [dbo].[SubCategory_Master] ([SubCategory_ID])
GO
ALTER TABLE [dbo].[ThirdCategory_Master] CHECK CONSTRAINT [FK_SubCategory]
GO
/****** Object:  StoredProcedure [dbo].[CategoryInsert]    Script Date: 30-01-2020 16:25:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CategoryInsert]  
	-- Add the parameters for the stored procedure here
	@Category_Name varchar(150),
	@Menu_ID int,
	@IsDeleted bit
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
		insert into [dbo].[Category_Master] (Category_Name, Menu_ID, IsDeleted)
		values(@Category_Name,@Menu_ID,@IsDeleted)
		select 'success' as result	
	END TRY
	BEGIN CATCH
		select 'fail' as result
	END CATCH
END



GO
/****** Object:  StoredProcedure [dbo].[GetAllProducts]    Script Date: 30-01-2020 16:25:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllProducts]
	
AS
BEGIN
	SET NOCOUNT ON;     
      select P.*,C.Category_Name,S.SubCategory_Name,T.ThirdCategory_Name
      from Product_Master as P
      left join Category_Master as C on P.Category_ID = C.Category_ID
      left join SubCategory_Master as S on P.SubCategory_ID = S.SubCategory_ID
      left join ThirdCategory_Master as T on P.ThirdCategory_ID = T.ThirdCategory_ID
      order by P.Product_ID desc
	END





GO
/****** Object:  StoredProcedure [dbo].[GetAllProductSubCategoryWise]    Script Date: 30-01-2020 16:25:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllProductSubCategoryWise]
	@SubCategoryID int
AS
BEGIN
	SET NOCOUNT ON;
          select P.*,
         C.Category_Name, 
		 S.SubCategory_Name,
		 T.ThirdCategory_Name,
		 --img.Procut_image_ID,
		 img.Product_image,
		 img.Image_name,
		 img.AlterText
   from Product_Master as P
   inner join Category_Master as C on P.Category_ID = C.Category_ID
   inner join SubCategory_Master as S on P.SubCategory_ID = S.SubCategory_ID
   left join ThirdCategory_Master as T on P.ThirdCategory_ID = T.ThirdCategory_ID          
   OUTER APPLY (select top 1 Product_image,Image_name,AlterText
          		from Product_Image_Master
				where P.Product_ID = Product_Image_Master.Product_ID
          )img 
          where S.SubCategory_ID = @SubCategoryID
          order by P.Product_ID desc
	END





GO
/****** Object:  StoredProcedure [dbo].[GetAllProductThirdCategoryWise]    Script Date: 30-01-2020 16:25:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllProductThirdCategoryWise]
	@ThirdCategory_ID varchar(100)
AS
BEGIN
	SET NOCOUNT ON;
          select P.*,
         C.Category_Name, 
		 S.SubCategory_Name,
		 T.ThirdCategory_Name,
		 --img.Procut_image_ID,
		 img.Product_image,
		 img.Image_name,
		 img.AlterText
   from Product_Master as P
   inner join Category_Master as C on P.Category_ID = C.Category_ID
   inner join SubCategory_Master as S on P.SubCategory_ID = S.SubCategory_ID
   left join ThirdCategory_Master as T on P.ThirdCategory_ID = T.ThirdCategory_ID          
   OUTER APPLY (select top 1 Product_image,Image_name,AlterText
          		from Product_Image_Master
				where P.Product_ID = Product_Image_Master.Product_ID
          )img 
          where T.ThirdCategory_ID IN (select cast(Item as int) as id from [dbo].[SplitString](@ThirdCategory_ID,','))
          order by P.Product_ID desc
	END





GO
/****** Object:  StoredProcedure [dbo].[GetHomePageProduct]    Script Date: 30-01-2020 16:25:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetHomePageProduct] 
	
AS
BEGIN
	SET NOCOUNT ON;
       select Top 12 * from SubCategory_Master
       where IsHomePage = 1
       order by Sortable 

	END



GO
/****** Object:  StoredProcedure [dbo].[GetHotProduct]    Script Date: 30-01-2020 16:25:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetHotProduct] 
AS
BEGIN
	SET NOCOUNT ON;
 select P.*,
         C.Category_Name, 
		 S.SubCategory_Name,
		 T.ThirdCategory_Name,
		 --img.Procut_image_ID,
		 img.Product_image,
		 img.Image_name,
		 img.AlterText
   from Product_Master as P
   inner join Category_Master as C on P.Category_ID = C.Category_ID
   inner join SubCategory_Master as S on P.SubCategory_ID = S.SubCategory_ID
   left join ThirdCategory_Master as T on P.ThirdCategory_ID = T.ThirdCategory_ID          
   OUTER APPLY (select top 1 Product_image,Image_name,AlterText
          		from Product_Image_Master
				where P.Product_ID = Product_Image_Master.Product_ID
          )img 
          where P.IsHotProduct = 1
          order by P.Product_ID desc
	END





GO
/****** Object:  StoredProcedure [dbo].[GetLastProduct]    Script Date: 30-01-2020 16:25:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetLastProduct] 
AS
BEGIN
	SET NOCOUNT ON;       
        select top 3 P.*,
                 C.Category_Name, 
        		 S.SubCategory_Name,
        		 T.ThirdCategory_Name,
        		 img.Procut_image_ID,
        		 img.Product_image,
        		 img.Image_name
        from Product_Master as P
        inner join Category_Master as C on P.Category_ID = C.Category_ID
        inner join SubCategory_Master as S on P.SubCategory_ID = S.SubCategory_ID
        left join ThirdCategory_Master as T on P.ThirdCategory_ID = T.ThirdCategory_ID          
        CROSS APPLY (select top 1  Procut_image_ID,Product_image,Image_name
                  		from Product_Image_Master
        				where P.Product_ID = Product_Image_Master.Product_ID 
                  )img 
        where P.Created_date between DATEADD(MONTH,-1,GETDATE()) and GETDATE()
        order by P.Product_ID desc
	END




GO
/****** Object:  StoredProcedure [dbo].[GetProductImage]    Script Date: 30-01-2020 16:25:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetProductImage] 
	@Product_ID int
AS
BEGIN
	SET NOCOUNT ON;
          select I.*, 
                 P.Product_Title,
          	   P.Product_short_description,
          	   P.Product_long_description,
          	   P.Created_date,
          	   P.Updated_date,
          	   P.Category_ID,
          	   P.SubCategory_ID,
          	   P.ThirdCategory_ID,
          	   P.Product_Price
          from Product_Image_Master as I
          inner join Product_Master as P on I.Product_ID = P.Product_ID
          where P.Product_ID = @Product_ID
          order by I.Procut_image_ID
	END




GO
/****** Object:  StoredProcedure [dbo].[GetProductMenu]    Script Date: 30-01-2020 16:25:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetProductMenu]  
	
AS
BEGIN
	SET NOCOUNT ON;
       select * 
      from MainMenu_Master
      where Menu_Name like '%shop%'
	END





GO
/****** Object:  StoredProcedure [dbo].[GetProductSubCategory]    Script Date: 30-01-2020 16:25:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetProductSubCategory]
	@Menu_ID int
AS
BEGIN
	SET NOCOUNT ON;
      
     select M.*,C.Category_Name,C.Category_ID,S.SubCategory_ID,S.SubCategory_Name
     from MainMenu_Master as M
     inner join Category_Master as C on M.Menu_ID = C.Menu_ID
     inner join SubCategory_Master as S on C.Category_ID = S.Category_ID
     where M.Menu_ID = @Menu_ID
	 order by S.Sortable

	END





GO
/****** Object:  StoredProcedure [dbo].[GetSideBarProductList]    Script Date: 30-01-2020 16:25:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetSideBarProductList] 
	@SubCategory_ID int
AS
BEGIN
	SET NOCOUNT ON;
     select T.ThirdCategory_ID, 
       T.ThirdCategory_Name,
	   S.SubCategory_ID,
	   S.SubCategory_Name,
	   C.Category_ID,
	   C.Category_Name,
	   C.Menu_ID
     from ThirdCategory_Master as T
     inner join SubCategory_Master as S on T.SubCategory_ID = S.SubCategory_ID
     inner join Category_Master as C on S.Category_ID = C.Category_ID
     Where S.SubCategory_ID = @SubCategory_ID
	END





GO
/****** Object:  StoredProcedure [dbo].[MainMenuInsert]    Script Date: 30-01-2020 16:25:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MainMenuInsert] 
	-- Add the parameters for the stored procedure here
	@Menu_Name varchar(150),
	@IsDeleted bit
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
		insert into [dbo].[MainMenu_Master] (Menu_Name, IsDeleted)
		values(@Menu_Name,@IsDeleted)
		select 'success' as result	
	END TRY
	BEGIN CATCH
		select 'fail' as result
	END CATCH
END








GO
/****** Object:  StoredProcedure [dbo].[Product_specification_group_insert]    Script Date: 30-01-2020 16:25:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Product_specification_group_insert]
	-- Add the parameters for the stored procedure here
	@Product_ID int,
	@Specification_Group varchar(250)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
		insert into [dbo].[Specification_Group_Master] (Product_ID,Specification_Group_Name)
		values(@Product_ID,@Specification_Group)
		select 'success' as result	
	END TRY
	BEGIN CATCH
		select 'fail' as result
	END CATCH
END




GO
/****** Object:  StoredProcedure [dbo].[Product_specification_insert]    Script Date: 30-01-2020 16:25:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Product_specification_insert]
	-- Add the parameters for the stored procedure here
	@SpecGrpID int,
	@Product_ID int,
	@Specification_Title varchar(250),
	@Specification_Value varchar(250),
	@CreatedDate datetime,
	@UpdatedDate datetime
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
		insert into [dbo].[Product_Specification_Master] (Product_ID,Specification_Title,Specification_Value,CreatedDate,UpdatedDate,Specification_GroupID)
		values(@Product_ID,@Specification_Title,@Specification_Value,@CreatedDate,@UpdatedDate,@SpecGrpID)
		select 'success' as result	
	END TRY
	BEGIN CATCH
		select 'fail' as result
	END CATCH
END




GO
/****** Object:  StoredProcedure [dbo].[ProductCKInsert]    Script Date: 30-01-2020 16:25:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ProductCKInsert] 
	-- Add the parameters for the stored procedure here
	@Product_ID int,
	@CK_Title varchar(250),
	@Description text,
	@Created_date datetime,
	@Updated_date datetime
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
		insert into [dbo].[Product_CK_Master] (Product_ID, CK_Title, Description, Created_date,Updated_date)
		values(@Product_ID,@CK_Title,@Description,@Created_date,@Updated_date)
		select 'success' as result	
	END TRY
	BEGIN CATCH
		select 'fail' as result
	END CATCH
END





GO
/****** Object:  StoredProcedure [dbo].[ProductImageInsert]    Script Date: 30-01-2020 16:25:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ProductImageInsert]
	-- Add the parameters for the stored procedure here
	@Product_ID int,
	@Product_image varbinary(MAX),
	@Image_name varchar(250),
	@Created_date datetime,
	@Updated_date datetime,
	@AlterText varchar(350)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
		insert into [dbo].[Product_Image_Master] (Product_ID, Product_image, Image_name, Created_date,Updated_date, AlterText)
		values(@Product_ID,@Product_image,@Image_name,@Created_date,@Updated_date,@AlterText)
		select 'success' as result	
	END TRY
	BEGIN CATCH
		select 'fail' as result
	END CATCH
END



GO
/****** Object:  StoredProcedure [dbo].[ProductInsert]    Script Date: 30-01-2020 16:25:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ProductInsert]  
	-- Add the parameters for the stored procedure here
	@Product_Title varchar(200),
	@Product_short_description text,
	@Product_long_description text,
	@Created_date datetime,
	@Updated_date datetime,
	@Category_ID int = null,
	@SubCategory_ID int = null,
	@ThirdCategory_ID int = null,
	@Product_Price decimal = null
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
		insert into [dbo].[Product_Master] (Product_Title, Product_short_description, Product_long_description,Created_date,Updated_date,Category_ID,SubCategory_ID,ThirdCategory_ID,Product_Price)
		values(@Product_Title,@Product_short_description,@Product_long_description,@Created_date,@Updated_date,@Category_ID,@SubCategory_ID,@ThirdCategory_ID,@Product_Price)
		select 'success' as result	
	END TRY
	BEGIN CATCH
		select 'fail' as result
	END CATCH
END




GO
/****** Object:  StoredProcedure [dbo].[RGetCategory]    Script Date: 30-01-2020 16:25:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[RGetCategory]
	
AS
BEGIN
	SET NOCOUNT ON;
	 select C.*, M.Menu_Name 
	 from Category_Master as C
	 inner join MainMenu_Master as M on C.Menu_ID = M.Menu_ID
	 where C.IsDeleted = 0
	 order by C.Category_ID desc
	END



GO
/****** Object:  StoredProcedure [dbo].[RGetSubCategory]    Script Date: 30-01-2020 16:25:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[RGetSubCategory]
AS
BEGIN
	SET NOCOUNT ON;
	 select S.*, C.Category_Name,C.Menu_ID,M.Menu_Name
	 from SubCategory_Master as S
	 inner join Category_Master as C on S.Category_ID = C.Category_ID
	 inner join MainMenu_Master as M on C.Menu_ID = M.Menu_ID
	 where S.IsDeleted = 0
	 order by S.Sortable
END



GO
/****** Object:  StoredProcedure [dbo].[SubCategoryInsert]    Script Date: 30-01-2020 16:25:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SubCategoryInsert]  
	-- Add the parameters for the stored procedure here
	@SubCategory_Name varchar(150),
	@Category_ID int,
	@IsDeleted bit,
	@Image varbinary(MAX),
	@IsHomePage bit,
	@ImageName varchar(250),
	@Sortable numeric,
	@Heading varchar(550),
	@Description varchar(max),
	@Page_Image varbinary(max),
	@Page_Image_Name varchar(250),
	@AlterText varchar(350)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
		insert into [dbo].[SubCategory_Master] (SubCategory_Name, Category_ID, IsDeleted,Image,IsHomePage,ImageName,Sortable,Heading,Description,Page_Image,Page_Image_Name,AlterText)
		values(@SubCategory_Name,@Category_ID,@IsDeleted,@Image,@IsHomePage,@ImageName,@Sortable,@Heading,@Description,@Page_Image,@Page_Image_Name,@AlterText)
		select 'success' as result	
	END TRY
	BEGIN CATCH
		select 'fail' as result
	END CATCH
END




GO
/****** Object:  StoredProcedure [dbo].[ThirdCategoryInsert]    Script Date: 30-01-2020 16:25:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ThirdCategoryInsert]  
	-- Add the parameters for the stored procedure here
	@SubCategory_ID int,
	@ThirdCategoryName varchar(250)
	
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
		insert into [dbo].[ThirdCategory_Master] (SubCategory_ID, ThirdCategory_Name)
		values(@SubCategory_ID,@ThirdCategoryName)
		select 'success' as result	
	END TRY
	BEGIN CATCH
		select 'fail' as result
	END CATCH
END



GO
/****** Object:  StoredProcedure [dbo].[ThirdCategoryUpdate]    Script Date: 30-01-2020 16:25:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ThirdCategoryUpdate]  
	-- Add the parameters for the stored procedure here
	@ThirdCategory_ID int,
	@SubCategory_ID int,
	@ThirdCategoryName varchar(250)
	
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
		update [dbo].[ThirdCategory_Master] 
		set SubCategory_ID = @SubCategory_ID,
		    ThirdCategory_Name = @ThirdCategoryName
		where ThirdCategory_ID = @ThirdCategory_ID
		select 'success' as result	
	END TRY
	BEGIN CATCH
		select 'fail' as result
	END CATCH
END



GO
