USE [Shop]
GO
/****** Object:  UserDefinedFunction [dbo].[SplitString]    Script Date: 18-02-2020 12:42:50 ******/
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
/****** Object:  Table [dbo].[AdminLoginMaster]    Script Date: 18-02-2020 12:42:50 ******/
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
	[JoinDate] [datetime] NULL,
 CONSTRAINT [PK_AdminLoginMaster] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart_Master]    Script Date: 18-02-2020 12:42:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart_Master](
	[Cart_ID] [int] IDENTITY(1,1) NOT NULL,
	[User_ID] [int] NULL,
	[Product_ID] [int] NULL,
	[Size] [varchar](50) NULL,
	[Quantity] [int] NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_Cart_Master] PRIMARY KEY CLUSTERED 
(
	[Cart_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category_Master]    Script Date: 18-02-2020 12:42:50 ******/
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
/****** Object:  Table [dbo].[ContactUS_Master]    Script Date: 18-02-2020 12:42:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactUS_Master](
	[Contact_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NULL,
	[Mobile] [varchar](50) NULL,
	[Address] [varchar](max) NULL,
	[Email] [varchar](150) NULL,
	[Subject] [varchar](550) NULL,
	[Message] [varchar](max) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_ContactUS_Master] PRIMARY KEY CLUSTERED 
(
	[Contact_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Email_Group_Master]    Script Date: 18-02-2020 12:42:50 ******/
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
/****** Object:  Table [dbo].[Information_Master]    Script Date: 18-02-2020 12:42:50 ******/
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
/****** Object:  Table [dbo].[MainMenu_Master]    Script Date: 18-02-2020 12:42:50 ******/
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
/****** Object:  Table [dbo].[Order_Item_Master]    Script Date: 18-02-2020 12:42:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Item_Master](
	[Order_Item_ID] [int] IDENTITY(1,1) NOT NULL,
	[Order_ID] [int] NULL,
	[Product_ID] [int] NULL,
	[Size] [varchar](50) NULL,
	[Quantity] [int] NULL,
	[Price] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Order_Item_Master] PRIMARY KEY CLUSTERED 
(
	[Order_Item_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Master]    Script Date: 18-02-2020 12:42:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Master](
	[Order_ID] [int] IDENTITY(1,1) NOT NULL,
	[Order_No] [varchar](50) NULL,
	[Order_Type] [varchar](20) NULL,
	[User_ID] [int] NULL,
	[User_Address_ID] [int] NULL,
	[Order_Status] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_Order_Master] PRIMARY KEY CLUSTERED 
(
	[Order_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_CK_Master]    Script Date: 18-02-2020 12:42:50 ******/
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
/****** Object:  Table [dbo].[Product_Image_Master]    Script Date: 18-02-2020 12:42:50 ******/
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
/****** Object:  Table [dbo].[Product_Master]    Script Date: 18-02-2020 12:42:50 ******/
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
/****** Object:  Table [dbo].[Product_Specification_Master]    Script Date: 18-02-2020 12:42:50 ******/
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
/****** Object:  Table [dbo].[Specification_Group_Master]    Script Date: 18-02-2020 12:42:50 ******/
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
/****** Object:  Table [dbo].[SubCategory_Master]    Script Date: 18-02-2020 12:42:50 ******/
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
/****** Object:  Table [dbo].[Subscribe_Master]    Script Date: 18-02-2020 12:42:50 ******/
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
/****** Object:  Table [dbo].[ThirdCategory_Master]    Script Date: 18-02-2020 12:42:50 ******/
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
/****** Object:  Table [dbo].[User_Address_Master]    Script Date: 18-02-2020 12:42:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Address_Master](
	[User_Address_ID] [int] IDENTITY(1,1) NOT NULL,
	[User_ID] [int] NULL,
	[BName] [varchar](150) NULL,
	[BEmail] [varchar](250) NULL,
	[BMobile] [varchar](50) NULL,
	[BAddress] [varchar](max) NULL,
	[BCity] [varchar](150) NULL,
	[BState] [varchar](150) NULL,
	[BZipcode] [varchar](50) NULL,
	[SName] [varchar](150) NULL,
	[SEmail] [varchar](250) NULL,
	[SMobile] [varchar](50) NULL,
	[SAddress] [varchar](max) NULL,
	[SCity] [varchar](150) NULL,
	[SState] [varchar](150) NULL,
	[SZipcode] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_User_Address_Master] PRIMARY KEY CLUSTERED 
(
	[User_Address_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserDetails_Master]    Script Date: 18-02-2020 12:42:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserDetails_Master](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](150) NULL,
	[LastName] [varchar](150) NULL,
	[User_Id] [int] NULL,
	[WebSite] [varchar](550) NULL,
	[ProfilePhoto] [varchar](150) NULL,
	[Bio] [varchar](max) NULL,
 CONSTRAINT [PK_UserDetails_Master] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AdminLoginMaster] ON 

INSERT [dbo].[AdminLoginMaster] ([User_ID], [EmailID], [Password], [UserName], [IsAdmin], [JoinDate]) VALUES (1, N'rajujikadra@gmail.com', N'password123#', N'Rajesh Jikadra', 1, CAST(N'2020-02-05T00:00:00.000' AS DateTime))
INSERT [dbo].[AdminLoginMaster] ([User_ID], [EmailID], [Password], [UserName], [IsAdmin], [JoinDate]) VALUES (2, N'rbj@gmail.com', N'Password123#', N'Raju', 0, CAST(N'2020-02-06T10:37:46.673' AS DateTime))
SET IDENTITY_INSERT [dbo].[AdminLoginMaster] OFF
SET IDENTITY_INSERT [dbo].[Category_Master] ON 

INSERT [dbo].[Category_Master] ([Category_ID], [Category_Name], [Menu_ID], [IsDeleted]) VALUES (1, N'DOG', 1, 0)
INSERT [dbo].[Category_Master] ([Category_ID], [Category_Name], [Menu_ID], [IsDeleted]) VALUES (2, N'CAT', 1, 0)
INSERT [dbo].[Category_Master] ([Category_ID], [Category_Name], [Menu_ID], [IsDeleted]) VALUES (3, N'FISHES', 1, 0)
SET IDENTITY_INSERT [dbo].[Category_Master] OFF
SET IDENTITY_INSERT [dbo].[Email_Group_Master] ON 

INSERT [dbo].[Email_Group_Master] ([Email_Group_ID], [Email_Group_Name]) VALUES (1, N'Email_Group_1')
SET IDENTITY_INSERT [dbo].[Email_Group_Master] OFF
SET IDENTITY_INSERT [dbo].[Information_Master] ON 

INSERT [dbo].[Information_Master] ([Information_ID], [Title], [Description], [CreatedDate]) VALUES (1, N'Pet''s Services', N'The focus on pet SPA and pet smart grooming implemented generously by the hostel for dogs with dedicated pet care catching the eyes of pet owners for best pet services for their lovable pets. Our hostel for dogs provide exclusive dog kennel in chennai.Our pet hostel in chennai under tree shade for your lovable pets.we are specialized in Grooming for dogs', CAST(N'2020-02-13T14:37:00.703' AS DateTime))
INSERT [dbo].[Information_Master] ([Information_ID], [Title], [Description], [CreatedDate]) VALUES (2, N'Keep Your Dog Feeling Full', N'The first step to measuring how much and what type of food keeps your dog full is to understand his body composition score, Remillard says. Not all dogs are built alike. A 50-pound Great Dane compares very differently to a 50-pound Cocker Spaniel. Odds are your vet has already noted your dog’s body composition score, and if they don’t, it’s simply an observation of weight to expected weight. A score of “one” is severely underweight, while “nine” represents a seriously obese dog. Sometimes vets will use a scale from one to five, rather than one to nine.

Remillard notes that all dogs eat differently and one dog might eat differently every day. But what’s important is that score. If he’s between 4-6, or around a 2.5 on a five-point scale, his weight is healthy. That means if your dog is maintaining his body condition score despite not eating everything in his bowl, he’s good, Remillard says. Similarly, if he’s maintaining and still appears to be begging for food, “He doesn’t need it and isn’t even hungry. He’s probably just looking for attention.”', CAST(N'2020-02-13T14:39:03.717' AS DateTime))
INSERT [dbo].[Information_Master] ([Information_ID], [Title], [Description], [CreatedDate]) VALUES (3, N'Feed Your Dog Vegetables', N'Looking for a quick, belly-filling fix for your dog? Reach for your refrigerator’s veggie drawer. several Dr''s agree that cucumbers, green beans, carrots, celery, and broccoli are all good choices. Steaming or boiling them is an acceptable option, but Remillard adds that these methods begin to break down some of the fiber which makes these great options to start with. Your best bet for feeding veggies to your pup? Clean and raw. They’re as good as or better than any commercial dog treat.', CAST(N'2020-02-13T14:40:32.713' AS DateTime))
SET IDENTITY_INSERT [dbo].[Information_Master] OFF
SET IDENTITY_INSERT [dbo].[MainMenu_Master] ON 

INSERT [dbo].[MainMenu_Master] ([Menu_ID], [Menu_Name], [IsDeleted]) VALUES (1, N'Shop by pet', 0)
SET IDENTITY_INSERT [dbo].[MainMenu_Master] OFF
SET IDENTITY_INSERT [dbo].[Order_Item_Master] ON 

INSERT [dbo].[Order_Item_Master] ([Order_Item_ID], [Order_ID], [Product_ID], [Size], [Quantity], [Price]) VALUES (1, 2, 72, N'', 2, CAST(6941.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Order_Item_Master] OFF
SET IDENTITY_INSERT [dbo].[Order_Master] ON 

INSERT [dbo].[Order_Master] ([Order_ID], [Order_No], [Order_Type], [User_ID], [User_Address_ID], [Order_Status], [CreatedDate]) VALUES (1, N'874529', N'Card', 1, 4, N'Shipped', CAST(N'2020-02-10T09:46:35.290' AS DateTime))
INSERT [dbo].[Order_Master] ([Order_ID], [Order_No], [Order_Type], [User_ID], [User_Address_ID], [Order_Status], [CreatedDate]) VALUES (2, N'241507', N'Card', 1, 4, N'Processing', CAST(N'2020-02-13T14:50:19.523' AS DateTime))
SET IDENTITY_INSERT [dbo].[Order_Master] OFF
SET IDENTITY_INSERT [dbo].[Product_CK_Master] ON 

INSERT [dbo].[Product_CK_Master] ([Product_CK_ID], [Product_ID], [CK_Title], [Description], [Created_date], [Updated_date]) VALUES (1, 15, N'Why We Love It:', N'For those cool weather days when your dog needs a little extra insulation, the Nautical Blue Basic Dog Hoodie is a smart choice! This bright blue hue will have your pup standing out and feeling toasty even on the dreariest of days. 
 
This dog hoodie is great for patriotic events or supporting your favorite blue sports teams!', CAST(N'2020-02-06T10:51:47.910' AS DateTime), NULL)
INSERT [dbo].[Product_CK_Master] ([Product_CK_ID], [Product_ID], [CK_Title], [Description], [Created_date], [Updated_date]) VALUES (2, 15, N'Why We Love It:', N'This garment won''t impede your pup on their walks thanks to the high-cut tummy designed to prevent soiling. Also handy is the leash hole found under the hood at the base of the neck that can be used with a collar and most harnesses. The handy pocket can hold treats or waste bags.', CAST(N'2020-02-06T10:51:58.013' AS DateTime), NULL)
INSERT [dbo].[Product_CK_Master] ([Product_CK_ID], [Product_ID], [CK_Title], [Description], [Created_date], [Updated_date]) VALUES (3, 15, N'Why We Love It:', N'The Basic Dog Hoodie is perfect for outings on crisp days but many sensitive pets appreciate wearing them indoors as well. For pets that don''t tolerate air conditioning, our hoodie is the ideal solution.', CAST(N'2020-02-06T10:52:10.267' AS DateTime), NULL)
INSERT [dbo].[Product_CK_Master] ([Product_CK_ID], [Product_ID], [CK_Title], [Description], [Created_date], [Updated_date]) VALUES (4, 67, N'Biologically Appropriate', N'Mirroring the ancestral dietary traits of dogs, Acana Puppy Large Breed Dog Food follows the whole prey diet model making the food species-appropriate for your pet.', CAST(N'2020-02-06T14:35:28.303' AS DateTime), NULL)
INSERT [dbo].[Product_CK_Master] ([Product_CK_ID], [Product_ID], [CK_Title], [Description], [Created_date], [Updated_date]) VALUES (5, 67, N'Rich in Protein', N'Protein is the building block of muscles. Fresh, regionally sourced, high-quality protein through fresh chicken, turkey, flounder, and eggs ensure a constant supply of protein to your growing pup.', CAST(N'2020-02-06T14:35:38.183' AS DateTime), NULL)
INSERT [dbo].[Product_CK_Master] ([Product_CK_ID], [Product_ID], [CK_Title], [Description], [Created_date], [Updated_date]) VALUES (6, 67, N'Made with Oats', N'Oats are a great source of carbs that are low on the glycemic index, keeping your pet feeling fuller for longer. The perfect way to bamboozle the pup that won’t stop eating; bazinga!', CAST(N'2020-02-06T14:35:48.703' AS DateTime), NULL)
INSERT [dbo].[Product_CK_Master] ([Product_CK_ID], [Product_ID], [CK_Title], [Description], [Created_date], [Updated_date]) VALUES (7, 68, N'Ingredients', N'Rice, dehydrated poultry protein, animal fats, vegetable protein isolate*, maize flour, vegetable fibres, hydrolysed animal proteins, minerals, beet pulp, soya oil, fish oil, copra oil, hydrolysed yeast (source of manno-oligosaccharides), hydrolysed crustaceans (source of glucosamine), green tea and grape extracts (source of polyphenols), marigold extract (source of lutein), hydrolysed cartilage (source of chondroitin).', CAST(N'2020-02-06T14:39:38.310' AS DateTime), NULL)
INSERT [dbo].[Product_CK_Master] ([Product_CK_ID], [Product_ID], [CK_Title], [Description], [Created_date], [Updated_date]) VALUES (8, 68, N'Nutritional Additives', N'Vitamin D3: 800 IU, Vitamin A: 24700 IU, E2 (Iodine): 2.8 mg, E4 (Copper): 12 mg,E1 (Iron): 40 mg, E6 (Zinc): 200 mg, E8 Selenium): 0.1 mg - Preservatives - Antioxidants,E5 (Manganese): 53 mg.', CAST(N'2020-02-06T14:39:46.403' AS DateTime), NULL)
INSERT [dbo].[Product_CK_Master] ([Product_CK_ID], [Product_ID], [CK_Title], [Description], [Created_date], [Updated_date]) VALUES (9, 68, N'Trace Elements', N'Protein: 24% - Fat content: 19% - Crude ash: 7.5% - Crude fibres: 3.8% - EPA and DHA fatty acids: 4 g/kg.ones. These dogs have to be exercised regularly to be active.', CAST(N'2020-02-06T14:39:59.203' AS DateTime), NULL)
INSERT [dbo].[Product_CK_Master] ([Product_CK_ID], [Product_ID], [CK_Title], [Description], [Created_date], [Updated_date]) VALUES (10, 69, N'Ingredients', N'Dehydrated poultry protein, maize, rice, maize gluten, animal fats, hydrolysed animal proteins, vegetable protein isolate*, vegetable fibres, beet pulp, yeasts, minerals, fish oil, soya oil, psyllium husks and seeds, fructooligo-saccharides, hydrolysed crustaceans (source of glucosamine), borage oil (0.1%), green tea and grape extracts (source of polyphenols), marigold extract(source of lutein), hydrolysed cartilage (source of chondroitin).', CAST(N'2020-02-06T14:41:37.813' AS DateTime), NULL)
INSERT [dbo].[Product_CK_Master] ([Product_CK_ID], [Product_ID], [CK_Title], [Description], [Created_date], [Updated_date]) VALUES (11, 69, N'Nutritional Additives', N'Vitamin A: 23900 IU, Vitamin D3: 800 IU, E1 (Iron): 39 mg, E2 (Iodine): 2.7 mg, E4 (Copper): 1 mg, E5 (Manganese): 52 mg, E6 (Zinc): 194 mg, E8 (Selenium): 0.1 mg - Preservatives - Antioxidants.', CAST(N'2020-02-06T14:41:47.067' AS DateTime), NULL)
INSERT [dbo].[Product_CK_Master] ([Product_CK_ID], [Product_ID], [CK_Title], [Description], [Created_date], [Updated_date]) VALUES (12, 69, N'Trace Elements', N'Protein: 30% - Fat content: 13% - Crude ash: 6.6% - Crude fibres: 3.6% - EPA and DHA fatty acids: 4 g/kg', CAST(N'2020-02-06T14:41:56.583' AS DateTime), NULL)
INSERT [dbo].[Product_CK_Master] ([Product_CK_ID], [Product_ID], [CK_Title], [Description], [Created_date], [Updated_date]) VALUES (13, 70, N'Ingredients', N'Rice, dehydrated poultry protein, maize, vegetable protein isolate*, maize gluten, animal fats, hydrolysed animal proteins, minerals, beet pulp, fish oil, vegetable fibres, soya oil, fructo-oligo-saccharides, psyllium husks and seeds, hydrolysed yeast (source of mannooligo-saccharides), hydrolysed crustaceans (source of glucosamine), borage oil, marigold extract (source of lutein), hydrolysed cartilage (source of chondroitin).', CAST(N'2020-02-06T14:46:01.080' AS DateTime), NULL)
INSERT [dbo].[Product_CK_Master] ([Product_CK_ID], [Product_ID], [CK_Title], [Description], [Created_date], [Updated_date]) VALUES (14, 70, N'Nutritional Additives', N'Vitamin A: 24300 IU, Vitamin D3: 800 IU, E1 (Iron): 40 mg, E2 (Iodine): 2.8 mg, E4 (Copper): 2 mg, E5 (Manganese): 52 mg, E6 (Zinc): 198 mg, E8 (Selenium): 0.1 mg.', CAST(N'2020-02-06T14:46:10.790' AS DateTime), NULL)
INSERT [dbo].[Product_CK_Master] ([Product_CK_ID], [Product_ID], [CK_Title], [Description], [Created_date], [Updated_date]) VALUES (15, 70, N'Trace Elements', N'Protein: 33% - Fat content: 14% - Crude ash: 7.3% - Crude fibres: 1.7% - Calcium: 9,9 g/kg, Phosphorus: 8,3 g/kg.', CAST(N'2020-02-06T14:46:19.137' AS DateTime), NULL)
INSERT [dbo].[Product_CK_Master] ([Product_CK_ID], [Product_ID], [CK_Title], [Description], [Created_date], [Updated_date]) VALUES (16, 71, N'Ingredients', N'Maize, dehydrated poultry protein, maize flour, animal fats, dehydrated pork protein, hydrolysed animal proteins, beet pulp, maize gluten, minerals, fish oil, soya oil, yeasts, hydrolysed crustaceans (source of glucosamine), hydrolysed cartilage (source of chondroitin).', CAST(N'2020-02-06T14:49:03.770' AS DateTime), NULL)
INSERT [dbo].[Product_CK_Master] ([Product_CK_ID], [Product_ID], [CK_Title], [Description], [Created_date], [Updated_date]) VALUES (17, 71, N'Nutritional Additives', N'Vitamin A: 16000 IU, Vitamin D3: 1000 IU, E1 (Iron): 50 mg, E2 (Iodine): 5.1 mg, E4 (Copper): 10 mg, E5 (Manganese): 66 mg, E6 (Zinc): 197 mg, E8 (Selenium): 0.09 mg - Preservatives - Antioxidants.', CAST(N'2020-02-06T14:49:11.623' AS DateTime), NULL)
INSERT [dbo].[Product_CK_Master] ([Product_CK_ID], [Product_ID], [CK_Title], [Description], [Created_date], [Updated_date]) VALUES (18, 71, N'Trace Elements', N'Protein: 26% - Fat content: 17% - Crude ash: 6.3% - Crude fibres: 1.2% - Per kg: Omega 3 fatty acids: 7.7 g including EPA/DHA: 4 g.', CAST(N'2020-02-06T14:49:20.940' AS DateTime), NULL)
INSERT [dbo].[Product_CK_Master] ([Product_CK_ID], [Product_ID], [CK_Title], [Description], [Created_date], [Updated_date]) VALUES (19, 72, N'Ingredients', N'Rice, dehydrated poultry protein, animal fats, vegetable protein isolate*, maize, hydrolysed animal proteins, minerals, vegetable fibres, fish oil, beet pulp, soya oil, dehydrated tomato, hydrolysed yeast (source of manno-oligosaccharides), hydrolysed crustaceans (source of glucosamine), marigold extract (source of lutein), green tea and grape extracts (source of polyphenols), hydrolysed cartilage (source of chondroitin).', CAST(N'2020-02-06T14:51:27.860' AS DateTime), NULL)
INSERT [dbo].[Product_CK_Master] ([Product_CK_ID], [Product_ID], [CK_Title], [Description], [Created_date], [Updated_date]) VALUES (20, 72, N'Nutritional Additives', N'Vitamin A: 26600 IU, Vitamin D3: 700 IU, E1 (Iron): 48 mg, E2 (Iodine): 4.8 mg, E4 (Copper): 6 mg, E5 (Manganese): 63 mg, E6 (Zinc): 188 mg, E8 (Selenium): 0.11 mg, Taurine: 2.5 g, L-carnitine: 830 mg - Preservatives - Antioxidants.', CAST(N'2020-02-06T14:52:00.117' AS DateTime), NULL)
INSERT [dbo].[Product_CK_Master] ([Product_CK_ID], [Product_ID], [CK_Title], [Description], [Created_date], [Updated_date]) VALUES (21, 72, N'Trace Elements', N'Protein: 26% - Fat content: 20% - Crude ash: 7% - Crude fibres: 2.6% - EPA and DHA fatty acids: 5 g/kg.', CAST(N'2020-02-06T14:52:13.603' AS DateTime), NULL)
INSERT [dbo].[Product_CK_Master] ([Product_CK_ID], [Product_ID], [CK_Title], [Description], [Created_date], [Updated_date]) VALUES (22, 73, N'Royal Canin Shih Tzu Puppy Dry Dog Food', N'Royal Canin Shih Tzu Puppy Dry Dog Food is designed to meet the nutritional needs of purebred Shih Tzus 8 weeks to 10 months old. Shih Tzu puppies can benefit from the right growth formula of Royal Canin Shih Tzu Puppy Food to help provide immune system support, skin and coat health, and digestive care as they take on puppyhood.

Royal Canin Shih Tzu dry puppy food is tailor-made nutrition created just for your pure breed Shih Tzu puppy.This exclusive breed-specific diet is uniquely formulated for your Shih Tzu puppy with specific nutrients to help them thrive.The unique kibble shape and texture are specially designed for your small breed Shih Tzu’s short muzzle and underbite, making it easy for them to pick up and chew.', CAST(N'2020-02-06T14:54:53.293' AS DateTime), NULL)
INSERT [dbo].[Product_CK_Master] ([Product_CK_ID], [Product_ID], [CK_Title], [Description], [Created_date], [Updated_date]) VALUES (23, 73, N'Key Benefits', N'-- Supports skin health and maintain a Shih Tzu’s growing, long coat with specific nutrients.
-- Exclusive kibble shape designed specifically for a Shih Tzu’s short muzzle and underbite.
-- Helps protect a puppy’s developing immune system and natural defenses with an exclusive complex of antioxidants including vitamin E.', CAST(N'2020-02-06T14:55:04.177' AS DateTime), NULL)
INSERT [dbo].[Product_CK_Master] ([Product_CK_ID], [Product_ID], [CK_Title], [Description], [Created_date], [Updated_date]) VALUES (24, 73, N'Ingredients', N'Chicken by-product meal, brewers rice, corn, chicken fat, wheat gluten, dried plain beet pulp, natural flavors, fish oil, vegetable oil, sodium silico aluminate, monocalcium phosphate, potassium chloride, calcium carbonate, fructooligosaccharides, sodium tripolyphosphate, vitamins [DL-alpha tocopherol acetate (source of vitamin E), niacin supplement, L-ascorbyl-2-polyphosphate (source of vitamin C), D-calcium pantothenate, biotin, pyridoxine hydrochloride (vitamin B6), riboflavin supplement, thiamine mononitrate (vitamin B1), vitamin A acetate, folic acid, vitamin B12 supplement, vitamin D3 supplement], salt, hydrolyzed yeast (source of betaglucans), choline chloride, L-lysine, L-tyrosine, marigold extract (Tagetes erecta L.), DL-methionine, taurine, trace minerals [zinc proteinate, zinc oxide, manganese proteinate, ferrous sulfate, manganous oxide, copper sulfate, calcium iodate, sodium selenite, copper proteinate], Yucca schidigera extract, L-carnitine, carotene, rosemary extract, preserved with mixed tocopherols and citric acid.', CAST(N'2020-02-06T14:55:18.260' AS DateTime), NULL)
INSERT [dbo].[Product_CK_Master] ([Product_CK_ID], [Product_ID], [CK_Title], [Description], [Created_date], [Updated_date]) VALUES (25, 74, N'Product Description', N'Royal Canin Adult Pug Dog Food is a diet designed especially for Pugs over 10 months of age. This diet is high in nutritional value that helps in enhancing the B1 Structure of the dog’s body that ultimately improves the bone strength and promotes the healthy development of Pugs.

The Product is a proven Kibble Technology that reduces the formation of tartar and maintains the dental health of Pugs. This Pug diet contains L-carnitine and a moderate level of fat that helps in maintaining an ideal weight of them.', CAST(N'2020-02-06T14:57:11.757' AS DateTime), NULL)
INSERT [dbo].[Product_CK_Master] ([Product_CK_ID], [Product_ID], [CK_Title], [Description], [Created_date], [Updated_date]) VALUES (26, 74, N'Ingredients', N'Rice, dehydrated poultry protein, maize flour, animal fats, maize,wheat flour, maize gluten, vegetable protein isolate*, hydrolysed animal proteins,beet pulp, minerals, vegetable fibres, fish oil, soya oil, fructo-oligo-saccharides,borage oil, green tea and grape extracts (source of polyphenols), hydrolysed crustaceans (source of glucosamine), marigold extract (source of lutein),hydrolysed cartilage (source of chondroitin).', CAST(N'2020-02-06T14:57:53.627' AS DateTime), NULL)
INSERT [dbo].[Product_CK_Master] ([Product_CK_ID], [Product_ID], [CK_Title], [Description], [Created_date], [Updated_date]) VALUES (27, 74, N'Nutritional Additives (per kg)', N'Vitamin A: 29500 IU, Vitamin D3: 800 IU, E1 (Iron): 52 mg, E2(Iodine):5.2 mg, E4 (Copper): 10 mg, E5 (Manganese): 67 mg, E6 (Zinc): 201 mg, E8(Selenium): 0.11 mg, Pentasodium triphosphate:3.5 g.', CAST(N'2020-02-06T14:58:04.663' AS DateTime), NULL)
INSERT [dbo].[Product_CK_Master] ([Product_CK_ID], [Product_ID], [CK_Title], [Description], [Created_date], [Updated_date]) VALUES (28, 75, N'Comfortable material', N'these Christmas pets hats and scarfs are made of polar fleece, touch soft and wear comfortable, sturdy and durable, reusable and long-lasting; please check the size carefully before buying it', CAST(N'2020-02-06T16:13:07.860' AS DateTime), NULL)
INSERT [dbo].[Product_CK_Master] ([Product_CK_ID], [Product_ID], [CK_Title], [Description], [Created_date], [Updated_date]) VALUES (29, 75, N'Classic Christmas colors', N' designed with red and white colors, which look cute and lovely, can make your pet become more attractive and charming. and classic colors can add the atmosphere to Christmas', CAST(N'2020-02-06T16:13:18.227' AS DateTime), NULL)
INSERT [dbo].[Product_CK_Master] ([Product_CK_ID], [Product_ID], [CK_Title], [Description], [Created_date], [Updated_date]) VALUES (30, 75, N'Suitable occasions', N'these santa pets hats and scarfs are suitable for most occasions such as Christmas party, Halloween, carnival, pet birthday party, photo shoot, daily life and various other occasions', CAST(N'2020-02-06T16:13:28.540' AS DateTime), NULL)
INSERT [dbo].[Product_CK_Master] ([Product_CK_ID], [Product_ID], [CK_Title], [Description], [Created_date], [Updated_date]) VALUES (31, 79, N'All Natural', N'Contains Only Premium All Natural Ingredients, No By-Products Meals, No Artificial Flavors, Colors Or Preservatives. Corn Free, Wheat Free, Soy Free.', CAST(N'2020-02-06T16:21:07.037' AS DateTime), NULL)
INSERT [dbo].[Product_CK_Master] ([Product_CK_ID], [Product_ID], [CK_Title], [Description], [Created_date], [Updated_date]) VALUES (32, 79, N'Complete Health', N'Premium Proteins Are The First Ingredients In All Our Recipes. All Formulas Provide Healthy Balanced Nutrition. High Quality Ingredients Ensure You Are Providing The Optimum Nutrition Your Pet Needs.', CAST(N'2020-02-06T16:21:17.227' AS DateTime), NULL)
INSERT [dbo].[Product_CK_Master] ([Product_CK_ID], [Product_ID], [CK_Title], [Description], [Created_date], [Updated_date]) VALUES (33, 79, N'Healthy Immune System', N'Avoderm Natural Pet Foods Have Vitamins, Minerals, And Antioxidant Nutrients To Help Protect Your Pet''S Immune Function.', CAST(N'2020-02-06T16:21:29.420' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Product_CK_Master] OFF
SET IDENTITY_INSERT [dbo].[Product_Image_Master] ON 

INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (1, 1, NULL, N'blejacket1.jpg', CAST(N'2020-02-05T22:33:00.190' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (2, 1, NULL, N'blue jacket.jpg', CAST(N'2020-02-05T22:33:05.713' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (4, 2, NULL, N'greenjacket.jpg', CAST(N'2020-02-05T22:41:30.983' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (5, 2, NULL, N'greenjacket1.jpg', CAST(N'2020-02-05T22:41:36.877' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (6, 3, NULL, N'largedog jacket.jpg', CAST(N'2020-02-05T22:43:37.773' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (7, 3, NULL, N'largedog jacket1.jpg', CAST(N'2020-02-05T22:43:44.137' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (8, 4, NULL, N'pinkjacket.jpg', CAST(N'2020-02-05T22:46:03.517' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (9, 4, NULL, N'pinkjacket1.jpg', CAST(N'2020-02-05T22:46:16.283' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (10, 4, NULL, N'pinkjacket2.jpg', CAST(N'2020-02-05T22:46:22.450' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (11, 5, NULL, N'bff shirt.jpg', CAST(N'2020-02-05T22:51:14.190' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (12, 5, NULL, N'bff shirt1.jpg', CAST(N'2020-02-05T22:51:19.700' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (13, 6, NULL, N'duckshirt.jpg', CAST(N'2020-02-05T22:55:44.617' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (14, 6, NULL, N'duckshirt2.jpg', CAST(N'2020-02-05T22:55:51.070' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (15, 6, NULL, N'duckshirt1.jpg', CAST(N'2020-02-05T22:55:58.580' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (16, 7, NULL, N'freakout shirt.jpg', CAST(N'2020-02-05T23:03:02.570' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (17, 8, NULL, N'furbaby.jpg', CAST(N'2020-02-05T23:08:53.703' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (18, 8, NULL, N'furbaby1.jpg', CAST(N'2020-02-05T23:09:00.313' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (19, 9, NULL, N'mickiemouse shirt.jpg', CAST(N'2020-02-05T23:14:23.467' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (20, 9, NULL, N'mickiemouseshirt1.jpg', CAST(N'2020-02-05T23:14:29.500' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (21, 10, NULL, N'multicolor2.jpg', CAST(N'2020-02-05T23:17:23.467' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (22, 10, NULL, N'multicolor shirt.jpg', CAST(N'2020-02-05T23:17:29.473' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (23, 11, NULL, N'pink halfsleeve.jpg', CAST(N'2020-02-05T23:21:45.163' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (24, 11, NULL, N'pink halfsleeve1.jpg', CAST(N'2020-02-05T23:21:52.700' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (25, 12, NULL, N'purpleshirt.jpg', CAST(N'2020-02-05T23:23:53.317' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (26, 12, NULL, N'purpleshirt1.jpg', CAST(N'2020-02-05T23:24:00.800' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (27, 13, NULL, N'tealbllue hoodie1.jpg', CAST(N'2020-02-05T23:29:13.840' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (28, 13, NULL, N'tealblue hoodie.jpg', CAST(N'2020-02-05T23:29:20.157' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (29, 14, NULL, N'wiinerwinner shirt.jpg', CAST(N'2020-02-05T23:33:29.857' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (30, 14, NULL, N'winnerwinner shirt2.jpg', CAST(N'2020-02-05T23:33:35.970' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (31, 15, NULL, N'blue hoodie.jpg', CAST(N'2020-02-06T10:47:38.850' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (32, 15, NULL, N'blue hoodie front.jpg', CAST(N'2020-02-06T10:47:44.800' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (33, 16, NULL, N'orange hoodie front.jpg', CAST(N'2020-02-06T10:49:07.037' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (34, 16, NULL, N'orange hoodie.jpg', CAST(N'2020-02-06T10:49:12.947' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (35, 17, NULL, N'red hoodie.jpg', CAST(N'2020-02-06T10:50:48.320' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (36, 17, NULL, N'red hoodie front.jpg', CAST(N'2020-02-06T10:50:52.937' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (37, 18, NULL, N'blackred ceks.jpg', CAST(N'2020-02-06T11:00:34.790' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (38, 19, NULL, N'blackwhite pattern.jpg', CAST(N'2020-02-06T11:03:53.163' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (39, 20, NULL, N'blue hearts sweater.jpg', CAST(N'2020-02-06T11:06:49.140' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (40, 20, NULL, N'blue hearts sweater1.jpg', CAST(N'2020-02-06T11:06:53.407' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (41, 21, NULL, N'bluestrip sweater1.jpg', CAST(N'2020-02-06T11:13:01.950' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (42, 21, NULL, N'bluestrip sweater2.jpg', CAST(N'2020-02-06T11:13:09.240' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (43, 21, NULL, N'bluestrip sweater.jpg', CAST(N'2020-02-06T11:13:14.563' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (44, 22, NULL, N'bow red  sweater.jpg', CAST(N'2020-02-06T11:15:03.910' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (45, 22, NULL, N'bow red  sweater1.jpg', CAST(N'2020-02-06T11:15:08.450' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (46, 22, NULL, N'bow red  sweater2.jpg', CAST(N'2020-02-06T11:15:12.787' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (47, 23, NULL, N'brown sweater.jpg', CAST(N'2020-02-06T11:16:43.797' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (48, 23, NULL, N'brown sweater1.jpg', CAST(N'2020-02-06T11:16:48.300' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (49, 24, NULL, N'christmas sweater3.jpg', CAST(N'2020-02-06T11:17:44.940' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (50, 24, NULL, N'christmas sweater2.jpg', CAST(N'2020-02-06T11:17:49.217' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (51, 24, NULL, N'christmas sweater.jpg', CAST(N'2020-02-06T11:17:53.413' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (52, 25, NULL, N'pinkred sweater large.jpg', CAST(N'2020-02-06T11:19:27.407' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (53, 25, NULL, N'pinkred sweater large2.jpg', CAST(N'2020-02-06T11:19:31.920' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (54, 26, NULL, N'redyellow checks.jpg', CAST(N'2020-02-06T11:22:11.377' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (55, 27, NULL, N'skin sweater1.jpg', CAST(N'2020-02-06T11:25:46.860' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (56, 27, NULL, N'skin sweater.jpg', CAST(N'2020-02-06T11:25:51.590' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (57, 27, NULL, N'skin sweater.2jpg.jpg', CAST(N'2020-02-06T11:25:56.537' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (58, 28, NULL, N'326773854_Pedigree-Adult-Small-Breed-Pouch-1.2kg_front.png', CAST(N'2020-02-06T11:35:19.857' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (59, 28, NULL, N'610121294_Pedigree-Active-Adult-Dog-Pouch-1.2kg_Front.png', CAST(N'2020-02-06T11:35:24.670' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (60, 29, NULL, N'acana light and fit.jpg', CAST(N'2020-02-06T11:40:33.860' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (61, 30, NULL, N'acana_heritage_adult-dog-1800.jpg', CAST(N'2020-02-06T11:45:14.640' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (62, 31, NULL, N'boxer adult.jpg', CAST(N'2020-02-06T11:50:27.070' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (63, 32, NULL, N'golden retriever adult.jpg', CAST(N'2020-02-06T11:54:37.697' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (64, 33, NULL, N'royal canin coker.jpg', CAST(N'2020-02-06T11:57:44.630' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (65, 34, NULL, N'acana grass fed lamb.jpg', CAST(N'2020-02-06T11:59:43.510' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (66, 35, NULL, N'acana large breed adult.jpg', CAST(N'2020-02-06T12:03:52.870' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (67, 36, NULL, N'acana light and fit.jpg', CAST(N'2020-02-06T12:07:39.033' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (68, 37, NULL, N'acana prairie.jpg', CAST(N'2020-02-06T12:11:04.143' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (69, 38, NULL, N'acana wild coast.jpg', CAST(N'2020-02-06T12:12:47.700' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (70, 39, NULL, N'adult rottwiler.jpeg', CAST(N'2020-02-06T12:15:28.447' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (71, 40, NULL, N'beagle adult.JPG', CAST(N'2020-02-06T12:17:24.523' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (72, 41, NULL, N'maci adult.jpg', CAST(N'2020-02-06T12:18:59.120' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (73, 42, NULL, N'royal canin mini adult.png', CAST(N'2020-02-06T12:22:17.683' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (74, 43, NULL, N'royal-canin-maxi-adult-dog-food-15kg-p1112-24393_zoom.jpg', CAST(N'2020-02-06T12:23:45.570' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (75, 44, NULL, N'fidele gravy food adult.jpg', CAST(N'2020-02-06T12:26:01.223' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (76, 45, NULL, N'Hills Science Adult wet food.png', CAST(N'2020-02-06T12:27:53.087' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (77, 46, NULL, N'pedigree wet food adult dogs.jpeg', CAST(N'2020-02-06T12:29:06.923' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (78, 47, NULL, N'royal canin gravy mini adult.jpg', CAST(N'2020-02-06T12:30:20.320' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (79, 48, NULL, N'Healthy treats Adult Dog.jpeg', CAST(N'2020-02-06T12:31:28.467' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (80, 49, NULL, N'Kanoodles Dental Chews.jpg', CAST(N'2020-02-06T12:32:49.647' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (81, 50, NULL, N'pedigree meat jerky sticks.jpg', CAST(N'2020-02-06T12:34:42.223' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (82, 51, NULL, N'Whimzees VEG treats for adult dogs.jpg', CAST(N'2020-02-06T12:36:06.003' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (83, 52, NULL, N'dream bone puppy treats.png', CAST(N'2020-02-06T12:39:45.400' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (84, 53, NULL, N'grawlers calcium milk bone.jpeg', CAST(N'2020-02-06T12:41:48.910' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (85, 54, NULL, N'Himalaya puppy biscuits.jpg', CAST(N'2020-02-06T12:43:09.710' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (86, 55, NULL, N'N-BONE puppy treats.jpg', CAST(N'2020-02-06T12:44:57.553' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (87, 56, NULL, N'pedigree dentatubes puppy.jpg', CAST(N'2020-02-06T12:46:52.927' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (88, 57, NULL, N'scoobie pet treats.jpg', CAST(N'2020-02-06T12:48:12.397' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (89, 58, NULL, N'835100316_PedigreeGravyPuppyDogFoodChickenRice100gmPouch-Front.png', CAST(N'2020-02-06T12:52:17.667' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (90, 59, NULL, N'Fredom.jpg', CAST(N'2020-02-06T12:54:51.547' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (91, 60, NULL, N'Nutro Puppy Wet.jpg', CAST(N'2020-02-06T12:56:00.577' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (92, 61, NULL, N'puppy wilderness.jpg', CAST(N'2020-02-06T12:56:41.207' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (93, 62, NULL, N'royal canin puppy wet.jpg', CAST(N'2020-02-06T12:57:37.400' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (94, 63, NULL, N'151498523_Pedigree-(Puppy---Dog-Food)-Milk--Vegetables-1 2-KG_sideview_big.png', CAST(N'2020-02-06T12:59:27.767' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (95, 64, NULL, N'389108941_Pedigree-Puppy-Small-Breed-Pouch-1.2kg_Front (1).png', CAST(N'2020-02-06T13:00:44.997' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (96, 65, NULL, N'461404355_Pedigree-Puppy-Large-Breed-Pouch-1.2kg_front.png', CAST(N'2020-02-06T13:01:52.637' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (97, 66, NULL, N'930344737_Pedigree-(Puppy Dog-Food)-Chicken Milk, 12KG sideview big.png', CAST(N'2020-02-06T14:32:57.557' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (98, 67, NULL, N'acana large breed puppy.jpg', CAST(N'2020-02-06T14:35:06.743' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (99, 68, NULL, N'germanshephard puppy.JPG', CAST(N'2020-02-06T14:39:11.867' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (100, 69, NULL, N'golden retriver puppy.JPG', CAST(N'2020-02-06T14:41:20.317' AS DateTime), NULL, N'')
GO
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (101, 70, NULL, N'labrador retrivers.jpg', CAST(N'2020-02-06T14:45:38.933' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (102, 71, NULL, N'maxi puppy.JPG', CAST(N'2020-02-06T14:48:48.453' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (103, 72, NULL, N'pu-rottweiler-packshot-bhn18.png', CAST(N'2020-02-06T14:51:10.037' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (104, 73, NULL, N'pu-shih-packshot-bhn18.png', CAST(N'2020-02-06T14:54:32.380' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (105, 74, NULL, N'royal canin pug puppy.jpg', CAST(N'2020-02-06T14:56:30.217' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (106, 75, NULL, N'Cat Funny Cute Christmas Hat And Muffler Combo.jpg', CAST(N'2020-02-06T16:12:47.520' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (107, 76, NULL, N'Cat red cheque dress.jpg', CAST(N'2020-02-06T16:15:01.870' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (108, 77, NULL, N'Fancy Fur collar coat for cats.jpg', CAST(N'2020-02-06T16:16:05.153' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (109, 78, NULL, N'APPLAWS cat dry food.png', CAST(N'2020-02-06T16:19:12.767' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (110, 79, NULL, N'AvoDerm Cat Dry Food.jpg', CAST(N'2020-02-06T16:20:50.480' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (111, 80, NULL, N'AuthorityPackagingUpdates_BrandShop_0004_5219892_5279240_CatDry.jpeg', CAST(N'2020-02-06T16:25:50.817' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (112, 81, NULL, N'Montegoclassic wet food.jpeg', CAST(N'2020-02-06T16:30:56.307' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (113, 82, NULL, N'BURTBEES cat shampoo.jpg', CAST(N'2020-02-06T16:33:02.933' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (114, 83, NULL, N'Forbis short coat shampoo for cats.jpg', CAST(N'2020-02-06T16:34:08.847' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (115, 84, NULL, N'Furbliss Refreshing Shampoo for cats.jpg', CAST(N'2020-02-06T16:35:11.353' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (116, 86, NULL, N'Customised cat collar.jpg', CAST(N'2020-02-06T16:40:56.273' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (117, 87, NULL, N'DaisyChains Floral print collar for cats.jpg', CAST(N'2020-02-06T16:41:44.000' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (118, 88, NULL, N'AQUADENE- Micro pellet Fish food (with multi vitamins).jpeg', CAST(N'2020-02-06T16:45:05.190' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (119, 89, NULL, N'AQUADENE RUBY RED - Fish Food with special colour enhancer formula.jpg', CAST(N'2020-02-06T16:46:06.603' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (120, 90, NULL, N'AZOO 9 IN 1- DRY food for Fish.jpeg', CAST(N'2020-02-06T16:47:26.787' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (121, 91, NULL, N'Aquatic Black Sculpture Bubble Releasing Stone For Aquarium Decoration.jpg', CAST(N'2020-02-06T16:48:30.650' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (122, 92, NULL, N'Aquatic Blue Ancient House Stone For Aquarium Decoration.jpg', CAST(N'2020-02-06T16:49:03.910' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (123, 93, NULL, N'Aquatic Bridge For Aquarium Decoration.jpg', CAST(N'2020-02-06T16:50:15.583' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (124, 94, NULL, N'BURT BEES dog shampoo.jpg', CAST(N'2020-02-06T16:52:54.473' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (125, 95, NULL, N'Himalaya Erina EP Shampoo.jpg', CAST(N'2020-02-06T16:54:16.710' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (126, 96, NULL, N'PAWD STORE GENUINE LEATHER BELT.jpg', CAST(N'2020-02-06T16:55:05.240' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (127, 97, NULL, N'Blue printed dog Body Belt.jpg', CAST(N'2020-02-06T16:56:22.503' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (128, 98, NULL, N'BODIE Dog Bed.jpg', CAST(N'2020-02-06T16:57:13.713' AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (129, 99, NULL, N'Bolster Dog bed Purple.jpg', CAST(N'2020-02-06T16:57:58.163' AS DateTime), NULL, N'')
SET IDENTITY_INSERT [dbo].[Product_Image_Master] OFF
SET IDENTITY_INSERT [dbo].[Product_Master] ON 

INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (1, N'Petsworld Denim Wear Patched blue Jacket for Dogs', N'Our blue vests are made from hard wearing 12 oz vintage look denim with added stretch for comfort. ', N'Our blue vests are made from hard wearing 12 oz vintage look denim with added stretch for comfort. Our vests are double stitched to last, with custom Pethaus pack brass dome fasteners and cotton lining for extra comfort.These jackets come with a built in harness hole which hides under the collar.', CAST(N'2020-02-05T22:32:33.550' AS DateTime), CAST(N'2020-02-05T22:37:42.497' AS DateTime), 1, 1, 1, CAST(670.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (2, N'Dog green Jacket / Denim Dog Coat', N'Our green vests are made from hard wearing 12 oz vintage look denim with added stretch for comfort.', N'Our green vests are made from hard wearing 12 oz vintage look denim with added stretch for comfort. Our vests are double stitched to last, with custom Pethaus pack brass dome fasteners and cotton lining for extra comfort.These jackets come with a built in harness hole which hides under the collar.

These aren''t any ordinary denim dog vest. The original and the best quality our vests have been designed by us to fit comfortably on breeds of all sizes and shapes. But most importantly to last just like your favourite denim. Show em'' who''s boss at the park!', CAST(N'2020-02-05T22:41:00.343' AS DateTime), NULL, 1, 1, 1, CAST(680.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (3, N'Larg Dog Red Denim Jacket', N'Bring out your dog''s inner Rocker with our PetHaus patched Battle Jackets. We''ve designed dog-centric rock patches, all you have to do is choose your dogs size.', N'?Made from hard wearing 12 oz vintage look denim with added stretch for comfort. Our vests are double stitched to last, with custom Pethaus pack brass dome fasteners and cotton lining for extra comfort.These jackets come with a built in harness hole which hides under the collar.

These aren''t any ordinary denim dog vest. The original and the best quality our vests have been designed by us to fit comfortably on breeds of all sizes and shapes.', CAST(N'2020-02-05T22:43:17.033' AS DateTime), NULL, 1, 1, 1, CAST(1110.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (4, N'Dog Pink Jacket / Denim Dog Coat', N'Sphynx clothes | Dog clothing | Small Dog Clothes | Denim Jeans Jacket for Dog | Personalized Denim Jeans Jacket for Dogs | Free Shipping', N'Blue personalized denim jeans jackets for dogs, warm and comfortable. Hypoallergenic, breathable fabrics. Available in blue XS, SMALL, and medium. Personalization includes 1st letter of pet’s name.

All of our cats’ and dogs’ clothes are handmade. We use high quality, hypoallergenic, breathable fabrics, strong and stretchy threads.', CAST(N'2020-02-05T22:45:50.927' AS DateTime), NULL, 1, 1, 1, CAST(720.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (5, N'Best Furry Friend (BFF) Shirt for Dog', N'Fur Baby Dog Shirt, NEW COLORS! - 17 Colors 10 Sizes Dog Raglan or Tank, Typography Black & White Cute Custom Baseball T-Shirt for Dogs', N'It''s no secret that dog mamas everywhere are proud of their four legged children, so much so that they refer to them as their beloved fur babies! We figured there should be a shirt especially for these irreplaceable family members and their humans, so we made these special tee sets!', CAST(N'2020-02-05T22:50:53.987' AS DateTime), NULL, 1, 1, 2, CAST(850.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (6, N'Duck Shirt For Dog', N'Due to the love of our dogs and the pleasure they bring us, we have created Duck Dog Clothing Company. ', N'', CAST(N'2020-02-05T22:55:29.300' AS DateTime), NULL, 1, 1, 2, CAST(550.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (7, N'Dog T Shirt Blue Freak Out For Large Dogs', N'Dog clothes | Dog clothing | Small Dog Clothes | T Shirt for Dog | Personalized T Shirt for Dogs | Free Shipping', N'', CAST(N'2020-02-05T23:02:34.687' AS DateTime), NULL, 1, 1, 2, CAST(550.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (8, N'Furendi Jacket For Dog', N'Ultra plush interior to keep your furbabys warm this winter. Sizing up is recommended ', N'', CAST(N'2020-02-05T23:08:27.523' AS DateTime), NULL, 1, 1, 2, CAST(450.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (9, N'Jakks Pacific Mickey Mouse Dog Sweatshirt', N'Our red vests are made from hard wearing 12 oz vintage look good with added stretch for comfort.', N'', CAST(N'2020-02-05T23:13:31.607' AS DateTime), NULL, 1, 1, 2, CAST(350.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (10, N'LovinPet Large Dog Pajamas', N'LovinPet Large Dog Pajamas/Cotton Big Dogs PJS/Pink Red and Green Stripes Dog Shirt/4-Legs Design/Full Body Coverage Protection/for Big Dogs/Pitbull Shirt/Bulldog Pajamas/Boxer Pajamas', N'GREAT DESIGN FOR PIT BULLS AND SIMILAR BREEDS: large short haired breeds like Pitbull, Labrador Retriever, German Shorthaired Pointer, Bulldog, Beagle
100% COTTON DOG PJS SAFETY: Cotton materials do not irritate the skin like polyester, wool, nylon, denim or other artificial or rough fibers. They do not cause skin irritation, dermatitis and itching or some infectious diseases. After surgery, pure cotton is more suitable for dogs. Large dog pyjamas are excellent protection for SKIN CONDITIONS, HOT SPOTS & ALLERGIES.', CAST(N'2020-02-05T23:16:59.173' AS DateTime), NULL, 1, 1, 2, CAST(350.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (11, N'Pink Half Sleeve For Dog', N'Pink Half Sleeve For Dog', N'', CAST(N'2020-02-05T23:21:25.357' AS DateTime), NULL, 1, 1, 2, CAST(380.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (12, N'WEONE Dog Striped Cotton T-Shirts,Pet Breathable Soft Basic Vest', N'Dog cotton t-shirt is made of 95% cotton and 5% polyster,light weight soft material will keep them from overheating', N'Dog breathable shirts is high elasticity and pretty well made, won''t tight your baby,hold up well after washing and drying
Pet classic striped vest shirt is designed for daily wear,basic wear,very cute and always in style
For medium dogs,reference weight from 17lbs to 21 lbs
Package include 2pcs,1*Green-Blue striped shirt and 1*Pink-Rose striped shirt', CAST(N'2020-02-05T23:23:31.977' AS DateTime), NULL, 1, 1, 2, CAST(700.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (13, N'Dog Teal Blue Coat Fleece Dog Hoodie Warm Dog Jacket', N'CLASSIC - Comfortable casual sports hoodie,Pet Hoodie Clothes is Cute and Adorable Clothes for your lovely sweet pet, make your pet become more attractive', N'', CAST(N'2020-02-05T23:29:01.910' AS DateTime), NULL, 1, 1, 2, CAST(490.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (14, N'Winerwinner Shirt For Dogs', N'CLASSIC - Comfortable casual sports hoodie,Pet Hoodie Clothes is Cute and Adorable winter Clothes for your lovely sweet pet, make your pet become more attractive', N'', CAST(N'2020-02-05T23:33:19.200' AS DateTime), NULL, 1, 1, 2, CAST(660.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (15, N'Basic Dog Hoodie - Nautical Blue', N'With our Zack & Zoey™ Basic Dog Hoodie in Nautical Blue, your pet can enjoy the same comfort you do in a hoodie made just for them!', N'=> Ribbed sleeves and hem for a comfy fit.
=> Leash hole for convenience.
=> Machine wash cold on a gentle cycle. Line dry.
=> Made with a poly/cotton blend.
=> Fashion pocket can hold treats or waste bags.

For those cool weather days when your dog needs a little extra insulation, the Nautical Blue Basic Dog Hoodie is a smart choice! This bright blue hue will have your pup standing out and feeling toasty even on the dreariest of days. ', CAST(N'2020-02-06T10:47:15.887' AS DateTime), NULL, 1, 1, 1, CAST(800.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (16, N'Basic Dog Hoodie - Nautical Orange', N'With our Zack & Zoey™ Basic Dog Hoodie in Nautical Orange, your pet can enjoy the same comfort you do in a hoodie made just for them!', N'For those cool weather days when your dog needs a little extra insulation, the Nautical Orange Basic Dog Hoodie is a smart choice! This bright blue hue will have your pup standing out and feeling toasty even on the dreariest of days. 

This dog hoodie is great for patriotic events or supporting your favorite orange sports teams!
This garment won''t impede your pup on their walks thanks to the high-cut tummy designed to prevent soiling. Also handy is the leash hole found under the hood at the base of the neck that can be used with a collar and most harnesses. The handy pocket can hold treats or waste bags.', CAST(N'2020-02-06T10:48:56.503' AS DateTime), CAST(N'2020-02-06T10:50:33.653' AS DateTime), 1, 1, 1, CAST(800.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (17, N'Basic Dog Hoodie - Nautical Red', N'With our Zack & Zoey™ Basic Dog Hoodie in Nautical Red, your pet can enjoy the same comfort you do in a hoodie made just for them!', N'For those cool weather days when your dog needs a little extra insulation, the Nautical Red Basic Dog Hoodie is a smart choice! This bright blue hue will have your pup standing out and feeling toasty even on the dreariest of days. 
 
This dog hoodie is great for patriotic events or supporting your favorite red sports teams!
 
This garment won''t impede your pup on their walks thanks to the high-cut tummy designed to prevent soiling. Also handy is the leash hole found under the hood at the base of the neck that can be used with a collar and most harnesses. The handy pocket can hold treats or waste bags.', CAST(N'2020-02-06T10:50:09.020' AS DateTime), NULL, 1, 1, 1, CAST(800.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (18, N'Black & Red Sweater For Dog', N'Fall will be your pup''s favorite season when they get to wear this comfortable Combed Black & Red Dog Sweater by Dogie Design in Jet Black!', N'', CAST(N'2020-02-06T11:00:13.840' AS DateTime), CAST(N'2020-02-06T11:02:52.443' AS DateTime), 1, 1, 3, CAST(1330.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (19, N'Black & White Sweater For Dog', N'Fall will be your pup''s favorite season when they get to wear this comfortable Combed Black & White Dog Sweater by Dogie Design in Jet Black!', N'', CAST(N'2020-02-06T11:01:50.950' AS DateTime), CAST(N'2020-02-06T11:03:18.847' AS DateTime), 1, 1, 3, CAST(1330.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (20, N'Handmade Blue Hearts Wool Dog Sweater', N'Don’t let your dog be left out in the cold without having on a stylish Handmade Red Hearts Wool Dog Sweater full of love!', N'Winters can be tough on our delicate pups, so bundle them up in the Handmade Red Hearts Wool Dog Sweater! Sweater is a pretty gray with hearts. Handmade wool dog sweaters from Chilly Dog are made with hand knit organic wool and all natural plant dyes, perfect for the Eco-conscious pet owner. This sweater is also made following the Fair Trade guidelines and is knitted by descendants of the Inca Indians. Because every sweater is handmade, they may vary slightly in color and style.', CAST(N'2020-02-06T11:06:34.843' AS DateTime), NULL, 1, 1, 3, CAST(1300.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (21, N'Worthy Dog Stars and Blue Stripes Dog Sweater Hoodie', N'Patriotic pups will love staying warm and showing their American pride in the adorable Worthy Dog Stars and Stripes Dog Sweater Hoodie!', N'Your pet will stay stylish, patriotic and warm this winter with a Worthy Dog sweater! These comfy double-knit sweaters feature a "button hole" in the back so that you can easily hook your pet''s lead to their harness. Made of 100% acrylic and a great fit, these are sure to keep them comfortable and warm all winter long! Great for Halloween pictures and parties!', CAST(N'2020-02-06T11:12:43.860' AS DateTime), NULL, 1, 1, 3, CAST(1350.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (22, N'Bow Red Sweater For Dog', N'Don’t let your dog be left out in the cold without having on a stylish sweater!', N'Winters can be tough on our delicate pups, so bundle them up in the Handmade Cable Knit Wool Dog Sweater! Sweater has a stylish knit design. Handmade wool dog sweaters from Chilly Dog are made with hand knit organic wool and all natural plant dyes, perfect for the Eco-conscious pet owner. This sweater is also made following the Fair Trade guidelines and is knitted by descendent''s of the Inca Indians.', CAST(N'2020-02-06T11:14:50.500' AS DateTime), NULL, 1, 1, 3, CAST(1200.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (23, N'Brown Doggies and Pattern Dog Sweater by Klippo', N'Bundle your dog up in a classically patterned dog sweater from Klippo!', N'Hand knitted sweater with dark brown doggies all around the upper part of the sweater, accented with icelandic patterns on the sleeves and body. A small D-Ring attached near the neck area to add on a "Klippo" charm or ID tag! (Each outfit comes in its own Klippo logo charm.)', CAST(N'2020-02-06T11:16:04.383' AS DateTime), NULL, 1, 1, 3, CAST(1400.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (24, N'Handmade Christmas Elf Wool Dog Sweater', N'Perk up your holiday spirit with the Handmade Christmas Elf Wool Dog Sweater by Chilly Dog!', N'Your best friend is your little helper and now they can dress the part during the holidays with our Handmade Christmas Elf Wool Dog Sweater! Your pup will stay cozy and warm with this handcrafted holiday dog sweater and bring festive cheer wherever they go!', CAST(N'2020-02-06T11:17:34.570' AS DateTime), NULL, 1, 1, 3, CAST(1400.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (25, N'Handmade Nordic Wool Dog Sweater - Pink & Red', N'The Handmade Nordic Wool Dog Sweater in Pink & Red brings the look of the alps to the dogs of the world!', N'Hit the slopes or just sit by the fire place with the Handmade Nordic Wool Dog Sweater! Sweater has a stylish nordic design.  Handmade wool dog sweaters from Chilly Dog are made with hand knit organic wool and all natural plant dyes, perfect for the Eco-conscious pet owner. This sweater is also made following the Fair Trade guidelines and is knitted by descendants of the Inca Indians. ', CAST(N'2020-02-06T11:19:12.787' AS DateTime), NULL, 1, 1, 3, CAST(1550.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (26, N'Red-Yellow Checks Dog Sweater', N'The Red-Yellow Checks Dog Sweater in Yellow brings the look of the alps to the dogs of the world!', N'Hit the slopes or just sit by the fire place with the Handmade Nordic Wool Dog Sweater! Sweater has a stylish nordic design.  Handmade wool dog sweaters from Chilly Dog are made with hand knit organic wool and all natural plant dyes, perfect for the Eco-conscious pet owner. This sweater is also made following the Fair Trade guidelines and is knitted by descendants of the Inca Indians. Because every sweater is handmade, they may vary slightly in color and style. ', CAST(N'2020-02-06T11:21:52.477' AS DateTime), NULL, 1, 1, 3, CAST(1000.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (27, N'The Worthy Dog Plaid Dog Sweater - Skin Color', N'The Worthy Dog Plaid Dog Sweater - Skin Color Sweater and it''s brings the look of the alps to the dogs of the world!', N'Hit the slopes or just sit by the fire place with the worthy dog plaid dog sweater - skin color ! Sweater has a stylish nordic design.  Handmade wool dog sweaters from Chilly Dog are made with hand knit organic wool and all natural plant dyes, perfect for the Eco-conscious pet owner. This sweater is also made following the Fair Trade guidelines and is knitted by descendants of the Inca Indians. Because every sweater is handmade, they may vary slightly in color and style. All sweaters are 100% Wool and can be machine washed, gentle cycle in cold water. Do not put sweaters in the dryer, lay flat to dry. Sweaters may also be hand washed or dry cleaned.', CAST(N'2020-02-06T11:25:35.207' AS DateTime), NULL, 1, 1, 3, CAST(1430.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (28, N'Pedigree Adult Breed Pouch 1.2 kg', N'Pedigree professional puppy large breed 1.2 Kg is a perfect meal to ensure the best possible growth potential to your little puppy. From weaning stage (usually starting at 3 months) till 18 months of age it can be f', N'Pedigree professional puppy large breed 1.2 Kg is a perfect meal to ensure the best possible growth potential to your little puppy. From weaning stage (usually starting at 3 months) till 18 months of age it can be fed as a complete food to the growing pup. Due to less moisture content what the meal needs as an accompaniment is a bowl full of fresh water. Pedigree pro 10 kg is endowed with elements like green lipped mussel for developing healthy joints, calcium, and phosphorus to maintain strong, healthy bones and joints. It has 27 important nutrients including prebiotics which helps to promote a healthy digestion, taking care of the sensitive digestive system of the young canines while maintaining an ideal weight.', CAST(N'2020-02-06T11:35:03.217' AS DateTime), NULL, 1, 2, 4, CAST(315.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (29, N'Acana Light & Fit Dog Food 2 Kg', N'Acana Light & Fit Dog Food 2 Kg is a complete meal having a decreased calorie content, making it a fitting food for obese dogs having a habit of overeating. The diet consists of free-range chicken', N'Acana Light & Fit Dog Food 2 Kg is a complete meal having a decreased calorie content, making it a fitting food for obese dogs having a habit of overeating. The diet consists of free-range chicken, whole nest laid eggs and wild caught flounder as the fundamental ingredients, providing a rich protein supply for building lean muscle mass and to enhance skin and hair growth. ', CAST(N'2020-02-06T11:40:17.537' AS DateTime), NULL, 1, 2, 4, CAST(1599.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (30, N'Acana Adult (Cobb Chicken & Greens) Dog Food 2 Kg', N'Dogs are primarily carnivorous creatures and they biologically thrive on a diet rich in varied fresh whole meats.', N'Dogs are primarily carnivorous creatures and they biologically thrive on a diet rich in varied fresh whole meats. Acana Adult Dog Food 11.4 Kg (formerly known as Acana Cobb Chicken and Greens) is a complete meal containing Free run chicken, Wild flounder and Nest laid eggs supplying high-quality protein for building lean muscle mass and strength. Acanas WholePrey formula reflects the dogs natural diet in the wild. ', CAST(N'2020-02-06T11:44:53.627' AS DateTime), NULL, 1, 2, 4, CAST(500.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (31, N'Royal Canin Boxer Adult Dog Food 2 Kg', N'Boxers are dogs who put a lot of pressure on their joints due to their active lifestyle. Their diet should consist of important vitamins and minerals that promotes strength and flexibility in their joints.', N'Royal Canin Boxer Adult 3 Kg is a splendid diet that contains exclusive kibble design for matching the Brachycephalic Jaws of Boxers. The ideal protein content of 30% in the diet maintains muscle mass and strength in the dogs. The addition of Taurine in the food keeps the heart healthy and also boost the eyesight. A blend of Vitamin C and E forms an excellent antioxidant blend which slows the ageing process in the Boxers. Royal Canin Boxer Adult contains fish oil providing EPA and DHA fatty acid, that reduces the risk of irregular heartbeat and inflammation. ', CAST(N'2020-02-06T11:49:59.450' AS DateTime), NULL, 1, 2, 4, CAST(780.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (32, N'Golden Retriever Adult', N'Dogs becoming overweight is definitely not a good sign. ', N' Dogs becoming overweight is definitely not a good sign. Critical health issues in dogs like osteoarthritis, high blood pressure, type 2 diabetes and cancer crop up from obesity. Golden Retriever Adult is a nutritionally balanced wet dog food that restricts the weight gain in obese. The diet contains all the necessary vitamins and minerals that increase metabolism.', CAST(N'2020-02-06T11:54:24.207' AS DateTime), NULL, 1, 2, 4, CAST(960.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (33, N'Royal Canin Coker Dog Food', N'The condition of a dog’s skin reveals a lot about its overall well being.', N'The condition of a dog’s skin reveals a lot about its overall well being. It is vital to note that an unhealthy diet often triggers an allergic reaction in dogs, resulting in skin irritation. Royal Canin Coker  Medium Dog Food is an apt meal for medium breed dogs that helps in enhancing the overall health of their skin and coat.', CAST(N'2020-02-06T11:57:28.670' AS DateTime), NULL, 1, 2, 4, CAST(1500.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (34, N'Acana Grass Fed Lamb Dog Treats 92 Gm', N'Acana Grass Fed Lamb Dog Treats 92 Gm is a delicious dog treat containing single digestible animal protein for easier and a healthier digestion. ', N'Acana Grass Fed Lamb Dog Treats 92 Gm is a delicious dog treat containing single digestible animal protein for easier and a healthier digestion. Nurtured on New Zealand ranches, the grass-fed lamb is blended with Canadian grown Red delicious apples and lavender flowers all supplied fresh to form a highly nutritious treat for your canine. Acana Grass Fed Lamb Treat is prepared without cooking and is mildly freeze dried for preserving its natural goodness and taste making it as one of the best dog treats to serve.', CAST(N'2020-02-06T11:59:29.950' AS DateTime), NULL, 1, 2, 4, CAST(899.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (35, N'Acana Adult Large Breed 17 Kg', N'Acana Adult Large Breed 17 Kg is a wholesome meal containing top quality ingredients which are rendered fresh from sustainable fisheries every day. ', N'The food is rich in high-quality meat offering adequate protein for building lean muscle mass and to repair body tissues. A low carbohydrate content ensures that your large breed canine maintains ideal weight and it also reduces stress produced in bones and joints. Acana Puppy Large Breed food gives the canine a WholePrey formula which embodies the dogs natural diet in the wild. Beneficial plant extracts from grasses and botanicals in the diet help in speeding up the metabolism and gives a sustained energy to large breed dogs. Infusion of freeze-dried liver meat assists in enhancing the palatability of the food. Zinc along with essential fatty acids like EPA and DHA support healthy skin and a lustrous coat. Acana Dog Food is a completely gluten and grain free meal and contains no synthetic additives.', CAST(N'2020-02-06T12:03:34.440' AS DateTime), NULL, 1, 2, 4, CAST(8999.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (36, N'Acana Light & Fit Dog Food ', N'Acana Light & Fit Dog Food is a highly nutritious meal involving a low-calorie content for making it an apt meal for overweight dogs having a tendency to binge eat. ', N'Containing free-range chicken, whole nest laid eggs and wild caught flounder as the fundamental ingredients, it offers a rich protein supply for building lean muscle mass and to repair body tissues. Acanas WholePrey formula mirrors the dogs natural diet in the wild. The meal also consists of 35% fresh green and botanicals from trusted, local sources delivered fresh each and every time. ', CAST(N'2020-02-06T12:07:20.010' AS DateTime), NULL, 1, 2, 4, CAST(349.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (37, N'Acana Prairie For Dog', N'Dogs are primarily carnivorous creatures and they biologically thrive on a diet rich in varied fresh whole meats', N'', CAST(N'2020-02-06T12:10:45.950' AS DateTime), NULL, 1, 2, 4, CAST(500.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (38, N'Acana Classic Wild Coast Dog Food', N'Modern Dogs are primarily carnivorous creatures and like their ancestors, they too biologically prosper on a diet having different meat and fish supplemented with vegetables', N'Modern Dogs are primarily carnivorous creatures and like their ancestors, they too biologically prosper on a diet having different meat and fish supplemented with vegetables, fruits and grasses. Acana Classic Wild Coast Dog Food 2 Kg is a wholesome meal formulated with wild caught fishes like Pacific herring, Arrowtooth flounder and Silver hake which give high-quality nutrition to canines. The meal contains a rich quantity of protein for building good muscle mass and to repair body tissues. Acana Wild Coast contains Omega 3 and Omega 6 fatty acids which encourage a healthy skin and give a shiny coat. Having a 0% glycemic grain content, the meal maintains a balanced blood sugar level and also help in countering obesity.', CAST(N'2020-02-06T12:12:38.837' AS DateTime), NULL, 1, 2, 4, CAST(999.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (39, N'Royal canin Adult Rottwiler ', N'Neutering of dogs is always linked to an increase in weight. When dogs become obese, they become vulnerable to health issues like type 2 diabetes and high blood pressure.', N'', CAST(N'2020-02-06T12:14:56.823' AS DateTime), NULL, 1, 2, 4, CAST(960.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (40, N'Beagle Adult Dog Food', N' Neutering of dogs is always linked to an increase in weight. When dogs become obese, they become vulnerable to health issues like type 2 diabetes and high blood pressure.', N'', CAST(N'2020-02-06T12:17:13.713' AS DateTime), NULL, 1, 2, 4, CAST(799.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (41, N'Maci Adult Dog Food', N'Lamb is a rich source of protein and fats that keep the dogs healthy and strong. Lamb also suits those dogs who experience food intolerance from other protein sources like Chicken and Beef. ', N'Lamb is a rich source of protein and fats that keep the dogs healthy and strong. Lamb also suits those dogs who experience food intolerance from other protein sources like Chicken and Beef. A diet like Smartheart Adult Dog Food Lamb and Rice Flavour 3 Kg consists of high-quality Lamb and Rice that offers a nutritional profile that serves all the dietary needs of your grown-up dogs. ', CAST(N'2020-02-06T12:18:50.587' AS DateTime), NULL, 1, 2, 4, CAST(550.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (42, N'Royal Canin Mini Adult Dog Food', N'Weight gain in large breed dogs is a matter of concern as it puts tremendous pressure on their bones and joints. It can also hamper their overall mobility. ', N'Weight gain in large breed dogs is a matter of concern as it puts tremendous pressure on their bones and joints. It can also hamper their overall mobility. Royal Canin Mini Adult is a richly nourishing diet having a nutritional formula that maintains optimal body weight in large breed dogs.', CAST(N'2020-02-06T12:22:06.920' AS DateTime), NULL, 1, 2, 4, CAST(780.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (43, N'Royal Canin Maxi Adult Dog Food', N'Weight gain in large breed dogs is a matter of concern as it puts tremendous pressure on their bones and joints. ', N'Weight gain in large breed dogs is a matter of concern as it puts tremendous pressure on their bones and joints. It can also hamper their overall mobility. Royal Canin Maxi Adult is a richly nourishing diet having a nutritional formula that maintains optimal body weight in large breed dogs. ', CAST(N'2020-02-06T12:23:37.910' AS DateTime), NULL, 1, 2, 4, CAST(699.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (44, N'Fidele Gravy Food Adult', N'Fidele in gravy to offer complete nutrition to your adult dog. ', N'Fidele in gravy to offer complete nutrition to your adult dog. Soft pieces of chicken and liver are submerged in gravy to provide a delicious wet dog food. Balanced amounts of protein, fats, carbohydrates, vitamins and minerals work to build and preserve strong and lean muscles, support bones and teeth, boost immunity and promote digestibility.', CAST(N'2020-02-06T12:25:45.317' AS DateTime), NULL, 1, 2, 5, CAST(360.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (45, N'Hills Science Adult Wet Food', N'Looking for the unique & tasty diet for your medium breed dog? ', N'Looking for the unique & tasty diet for your medium breed dog? Hills Science Plan Canine Adult Advanced Fitness Mini Chicken is formulated to support lean muscle and healthy vital organs. With clinically proven antioxidants, lean proteins and omega 3’s to keep your dog healthy.', CAST(N'2020-02-06T12:27:46.683' AS DateTime), NULL, 1, 2, 5, CAST(499.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (46, N'Pedigree Wet Food Adult Dogs', N'Pedigree Gravy is a nutritious and balanced food for your pet dog. Made with high-quality ingredients', N'Pedigree Gravy is a nutritious and balanced food for your pet dog. Made with high-quality ingredients, Pedigree provides dogs with the 5 Signs of Good Health - healthy skin and coat, strong bones and teeth, healthy digestive system, strong muscles and stronger immune system. Containing a higher moisture content, Pedigree gravy food pouches are ideal to keep your pooch hydrated and energetic. It can be mixed with any meal - Pedigree dry food or home-cooked food - to enhance taste and improve moisture-content.', CAST(N'2020-02-06T12:29:00.593' AS DateTime), NULL, 1, 2, 5, CAST(175.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (47, N'Royal Canin Gravy Mini Adult Dogs', N'Royal Canin gravy food is a complete and balanced diet for adult dogs of mini breed aged between 10 months to 12 years.', N'Royal Canin gravy food is a complete and balanced diet for adult dogs of mini breed aged between 10 months to 12 years. This diet contains animal and vegetable derivatives that help in boosting the immune system of dogs. This food is an assortment of antioxidants including Vitamin E and other essential nutrients that improve digestion and build dog’s natural defenses. It contains thiamine mononitrate commonly known as vitamin B1. Food is enriched with Omega 3 fatty acids like EPA-DHA.', CAST(N'2020-02-06T12:30:13.497' AS DateTime), NULL, 1, 2, 5, CAST(1010.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (48, N'Healthy Treats Adult Dogs', N'The herbal actives in Healthy Treats provide health benefits for adult dogs.', N'', CAST(N'2020-02-06T12:31:18.863' AS DateTime), NULL, 1, 2, 6, CAST(150.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (49, N'Kanoodles Dental Chews Dogs Food', N'Promotes playtime and is an efficient stress-free instrument', N'Promotes playtime and is an efficient stress-free instrument
They are the perfect treat at the time of teething and also provide high protein to your dog
They satisfy the natural urge to chew whilst reducing tartar and promoting healthy teeth and gums', CAST(N'2020-02-06T12:32:42.070' AS DateTime), NULL, 1, 2, 6, CAST(348.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (50, N'Pedigree Meat Jerky Sticks Dogs Food', N'Share moments of happiness and joy with your dog with Pedigree treat. ', N'Share moments of happiness and joy with your dog with Pedigree treat. These dog treats are the perfect combination of great tasting real meat and a soft chewy texture that makes it a special treat to be share every day. This Pedigree adult dog snack offers your best buddy an over-the-top meat experience. Made with real meat, these treats actually smell and taste great. Just watch as your dog comes running in after the first delicious whiff of meat as you open the pack. These tasty dog treats are a deliciously ideal for when you want to see that look of happiness on his sweet face or present as a reward when training your dog. ', CAST(N'2020-02-06T12:34:35.347' AS DateTime), NULL, 1, 2, 6, CAST(120.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (51, N'Whimzees VEG treats For Adult Dogs', N'WHIMZEES are all natural daily dental treats designed to freshen breath, clean teeth, and help remove plaque and tartar.', N'WHIMZEES are all natural daily dental treats designed to freshen breath, clean teeth, and help remove plaque and tartar. Our chews are vegetarian, gluten-free, and high in fiber. Providing daily dental care does more than help bad breath; it helps support a healthy life for your dog.', CAST(N'2020-02-06T12:35:58.863' AS DateTime), NULL, 1, 2, 6, CAST(250.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (52, N'Dream Bone Puppy Treats', N'No-rawhide DreamBone Medium Chews for dogs are made with real beef, chicken and wholesome vegetables for an irresistible taste dogs dream about.', N'', CAST(N'2020-02-06T12:39:33.553' AS DateTime), NULL, 1, 2, 6, CAST(330.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (53, N'Gnawlers Calcium Milk Bone For Puppies', N'Milk powder, Sodium caseinate, Calciumcarbonate, Cereal cellulose, Gelatin YuccaI, MO Natural flavor, Rosemary extract.', N'Gnawler Milk Bones are scientifically engineered with all food grade raw materials, no artificial flavours/colors and with adequate levels of calcium. It is easily digestible, cleans teeth and freshens breath. Go ahead and let your furry friend munch away his/her time!', CAST(N'2020-02-06T12:41:40.397' AS DateTime), NULL, 1, 2, 6, CAST(1025.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (54, N'Himalaya Puppy Biscuits', N'The herbal actives in Healthy Treats provide health benefits for puppies.', N'', CAST(N'2020-02-06T12:43:02.670' AS DateTime), NULL, 1, 2, 6, CAST(150.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (55, N'N-BONE Puppy Treats', N'N-Bone Puppy Teething treats help relieve pain and soreness during the time in which your puppy gets their adult teeth.', N'', CAST(N'2020-02-06T12:44:51.477' AS DateTime), NULL, 1, 2, 6, CAST(250.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (56, N'Pedigree Denta Tubos Puppy', N'PROMOTE ORAL HEALTH- These help in promoting oral health by reducing plaque and tartar buildup.', N'', CAST(N'2020-02-06T12:46:44.580' AS DateTime), NULL, 1, 2, 6, CAST(220.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (57, N'Scoobee  Pet Treats', N'', N'', CAST(N'2020-02-06T12:48:05.717' AS DateTime), NULL, 1, 2, 6, CAST(298.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (58, N'Pedigree Gravy Puppy Dog Food Chicken Rice', N'', N'', CAST(N'2020-02-06T12:52:08.707' AS DateTime), NULL, 1, 2, 5, CAST(450.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (59, N'Freedom Puppy Wet', N'', N'', CAST(N'2020-02-06T12:53:15.827' AS DateTime), NULL, 1, 2, 5, CAST(120.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (60, N'Nutro Puppy Wet', N'', N'', CAST(N'2020-02-06T12:55:18.937' AS DateTime), NULL, 1, 2, 5, CAST(220.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (61, N'Puppy Wilderness', N'', N'', CAST(N'2020-02-06T12:56:26.883' AS DateTime), NULL, 1, 2, 5, CAST(520.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (62, N'Royal Canin Puppy Wet', N'Royal Canin gravy food is a complete and balanced diet for puppies of mini breed up to 10 months of age.', N'Royal Canin gravy food is a complete and balanced diet for puppies of mini breed up to 10 months of age. This diet contains animal and vegetable derivatives that helps in boosting the immune system of puppies. It is an assortment of antioxidants including Vitamin E and other essential nutrients that improve digestion. It is a protein-rich diet as it is a mixture of chicken and its by-products and is enriched with Omega 3 fatty acids. This food contains thiamine mononitrate commonly known as vitamin B1 which is helpful in the proper brain development.', CAST(N'2020-02-06T12:57:28.370' AS DateTime), NULL, 1, 2, 5, CAST(1030.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (63, N'Pedigree (Puppy Dog Food) Milk Vegetables', N'PROVIDES ENERGY - This dog food provides instant energy required for lactating mothers who provide milk to their pups and the pups who are in their starter stage.', N'', CAST(N'2020-02-06T12:59:16.377' AS DateTime), NULL, 1, 2, 4, CAST(500.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (64, N'Pedigree Dog Food for Small Breed Puppies', N'HELPS TO MAINTAIN DIGESTIVE HEALTH- It helps to maintain diges', N'', CAST(N'2020-02-06T13:00:37.637' AS DateTime), NULL, 1, 2, 4, CAST(450.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (65, N'Pedigree Pro Dog Food for Large Breed Puppies(3 KG)', N'HELPS IN STRONG BONE DEVELOPMENT - This food helps in maintaining the calcium to phosphorus ratio and keeps the bones strong.', N'', CAST(N'2020-02-06T13:01:42.963' AS DateTime), NULL, 1, 2, 4, CAST(1000.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (66, N'Pedigree (Puppy Dog Food) Chicken Milk', N'PROVIDES ENERGY - This dog food provides instant energy required for lactating mothers who provide milk to their pups and the pups who are in their starter stage.', N'', CAST(N'2020-02-06T14:32:49.900' AS DateTime), NULL, 1, 2, 4, CAST(500.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (67, N'Acana Puppy Large Breed Dry Dog Food', N'Acana Puppy Large Breed Dry Dog Food is formulated in the award-winning kitchens of Acana and made with fresh regionally sourced ingredients, with no preservatives. This food is biologically appropriate & is rich in protein.', N'Pedigree Pro Dog Food (Starter mother and pup) provides instant energy for lactating mothers and ensures digestive health.

Your Large Breed (25 kgs+ fully grown) Puppy needs the right nutrition right from puppyhood in order to have smooth adult and geriatric years. Acana Puppy Large Breed Dry Dog Food is formulated in the award-winning kitchens of Acana and made with fresh regionally sourced ingredients, with no preservatives. The diet is perfectly balanced fit your growing pup’s needs just right. Only if human food could get so good, sigh!', CAST(N'2020-02-06T14:34:58.410' AS DateTime), NULL, 1, 2, 4, CAST(650.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (68, N'Royal Canin German Shepherd Adult Dry Puppy Food (3 KG)', N'Royal Canin German Shepherd Adult Dog food is a classic dog food having exclusive kibble design designed specifically for a grown-up German Shepherdâ€™s long and strong muzzle. A protein content of 24% maintains good endurance and muscle mass in the dogs.', N'Royal Canin German Shepherd food is apt for adult dogs of over 15 months of age. This food is composed especially to satisfies all the nutritional needs of this breed.

The protein, vitamin and carbohydrates contents provide proper nutritional support and also enhance the dog’s life. Also, the digestive system of these dogs is very weak so, high quality low indigestible proteins are used to make this food a comprehensive one.', CAST(N'2020-02-06T14:39:02.843' AS DateTime), NULL, 1, 2, 4, CAST(1800.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (69, N'Royal Canin Golden Retriever Puppy Food (3 KG)', N'Royal Canin Golden Retriever Puppy food is a diet designed for puppies, it is high in nutritional value which helps in enhancing the bone strength and promotes the health of pups.', N' Food contains apt amount of protein, calcium, and phosphorous that maintains an ideal weight of pups. This food helps in improve the digestive health and promotes a balance in the intestinal flora.', CAST(N'2020-02-06T14:41:09.390' AS DateTime), NULL, 1, 2, 4, CAST(2150.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (70, N'Royal Canin Labrador Retriever Junior Puppy Food (3 KG)', N'Royal Canin Labrador Retriever Junior is a top-quality diet that promotes overall growth and development in the puppy Labradors. An optimal ratio of calcium and phosphorus contribute to harmonious bone development in the pups.', N'Royal Canin Labrador Retriever Junior Puppy Food is designed especially for puppies of 2 to 15 months, who are learning to be a big pooch one day. This food is an assortment of various essential nutrients that helps in improving the B1 Structure of these pups and promotes bone strength essential for healthy development.

Royal Canin Labrador Retriever Junior/Puppy Food contains an apt amount of protein, calcium and phosphorous that promotes harmonious weight gain of growing puppies. This diet is a proven Kibble Technology that reduces the formation of tartar in teeth and promotes dental health. This food is a complete diet for weaning puppies.', CAST(N'2020-02-06T14:43:58.997' AS DateTime), NULL, 1, 2, 4, CAST(1735.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (71, N'Royal Canin Maxi Puppy Food (4 KG)', N'Royal Canin Maxi Puppy food is given to dogs who weigh from 26-44 kgs. This food is given during the period of 3-15 months from birth. It mainly contains nutrients, which are good for their digestive system and aids in having a balanced intestinal flora.', N'Royal Canin Maxi Puppy Food is a diet apt for Large Breed Puppies up to 15 months, who weight 26-44 Kgs when they are adult. This Food contains such a formula that helps in enhancing B1 structure of puppies that ultimately improves Bones’ Strength to promotes better development.

Royal Canin Maxi Puppy Food meets the moderate energy needs of Large Breed Puppies, who have a long growth period. It also contains an apt amount of EPA-DHA that helps in improving Skin & Coat of these puppies.

Royal Canin Maxi Puppy Food is a proven Kibble Technology that reduces the formation of tartar and maintains the dental health of growing puppies.', CAST(N'2020-02-06T14:48:40.533' AS DateTime), NULL, 1, 2, 4, CAST(2250.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (72, N'Royal Canin Rottweiler Junior (Puppy) Dog Food (12 KG)', N'APT FOR ROTTWEILER PUPPIES- Royal Canin Rottweiler Junior Puppy Food is apt for Rottweiler puppies from 2 to 15 months.', N'Royal Canin Rottweiler Junior Puppy Food is designed especially for Rottweiler puppies of 2 to 15 months, who are at a growing stage. This food is an assortment of various essential nutrients that help in improving the B1 Structure of growing pups that promotes bone strength and healthy development.

Royal Canin Puppy Food contains an apt amount of protein, calcium and phosphorous that promotes harmonious weight gain and helps in maintaining an ideal weight of growing puppies. The food is a proven Kibble Technology that reduces the formation of tartar on teeth and promotes Dental Health. This food is a complete diet for the weaning puppies, who are learning to grow.', CAST(N'2020-02-06T14:51:01.733' AS DateTime), NULL, 1, 2, 4, CAST(6941.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (73, N'Royal Canin Shih Tzu Puppy Dry Dog Food', N'Royal Canin Shih Tzu Puppy Dry Dog Food is designed to meet the nutritional needs of purebred Shih Tzus 8 weeks to 10 months old. It helps to provide immune system support, skin and coat health, and digestive care and natural defenses with an exclusive complex of antioxidants including vitamin E.', N'', CAST(N'2020-02-06T14:54:24.040' AS DateTime), NULL, 1, 2, 4, CAST(1349.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (74, N'Royal Canin Pug Puppy Dog Food (1.5 KG)', N'Royal Canin Adult Pug Dog Food is a diet designed especially for Pugs over 10 months of age. This diet is high in nutritional value that helps in enhancing the B1 Structure of the dog’s body that ultimately improves the bone strength and promotes the healthy development of Pugs.', N'', CAST(N'2020-02-06T14:56:20.633' AS DateTime), NULL, 1, 2, 4, CAST(1420.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (75, N'Cat Funny Cute Christmas Hat And Muffler Combo', N'Comfortable material: these Christmas pets hats and scarfs are made of polar fleece, touch soft and wear comfortable, sturdy and durable, reusable and long-lasting; please check the size carefully before buying it', N'', CAST(N'2020-02-06T16:12:31.453' AS DateTime), NULL, 2, 5, 10, CAST(490.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (76, N'Cat red cheque dress', N'This Dress made by Baju kucing tangerang, Indonesia.  High Quality Fabric that make your Pet confortable with this homemade clothing.', N'High Quality Fabric that make your Pet confortable with this homemade clothing.
Make good memories with your pet with cute outfit for going outside or photobooth, this clothes good for protect
Furr from dirt.', CAST(N'2020-02-06T16:14:54.777' AS DateTime), NULL, 2, 5, 10, CAST(700.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (77, N'Fancy Fur collar coat for cats', N'Stylish design for both everyday wear or photo Shooting', N'', CAST(N'2020-02-06T16:15:57.083' AS DateTime), NULL, 2, 5, 11, CAST(550.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (78, N'APPLAWS cat dry food', N'Grain and Potato Free, Limited Ingredients Recipe, Made With Natural Ingredients, Deboned Chicken First Ingredient, Energy Dense Legumes', N'', CAST(N'2020-02-06T16:19:02.360' AS DateTime), NULL, 2, 6, 7, CAST(550.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (79, N'AvoDerm Natural Chicken & Herring Meal Formula Dry Kitten Food', N'Chicken & Herring Meal Dry Kitten Food. Specially Formulated For Kittens. Made With Dha For Healthy Development.', N'', CAST(N'2020-02-06T16:20:43.263' AS DateTime), NULL, 2, 6, 7, CAST(490.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (80, N'AUTHORITY cat wet food for mature cats', N'Grain Free, Dry Cat Food for Kittens from WholeHearted, Real Chicken # 1 Ingredient, Feline Probiotics Help Maintain Digestive Health, No Corn, Wheat or Grains of Any Kind', N'', CAST(N'2020-02-06T16:23:15.790' AS DateTime), CAST(N'2020-02-06T16:23:28.990' AS DateTime), 2, 6, 13, CAST(320.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (81, N'Montego classic wet food', N'Montego Classic Wet Foods provide the balance, digestibility and delicious flavour that Montego dogs, cats, puppies and kittens across the country look forward to every day to provide everything they need for energy, wellbeing and happiness.', N'', CAST(N'2020-02-06T16:30:11.357' AS DateTime), NULL, 2, 6, 13, CAST(220.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (82, N'BURT-BEES cat shampoo', N'99.8% natural. Best Hypoallergenic Cat Shampoo Cleans, Softens Dry Skin, and Conditions Skin and Fur.', N'Mild formula is cruelty free, sulfate free, pH balanced for cats.
No colorants, No essential oils, and no fragrances.
Made with the highest quality all natural ingredients.
Made in the USA.', CAST(N'2020-02-06T16:32:49.520' AS DateTime), NULL, 2, 7, 14, CAST(250.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (83, N'Forbis short coat shampoo for cats', N'Cleanses and nourishes — Burt''s bees waterless shampoo for Cats cleanses, nourishes, and boosts shine', N'Made with the highest quality ingredients — All natural ingredients include Apple and honey, which acts as a natural cleanser rich in vitamins, minerals, and amino acids
Use regularly — spray your cat or kitten from back of ears to tail, while carefully avoiding eyes, and brush through. Repeat as needed', CAST(N'2020-02-06T16:34:01.813' AS DateTime), NULL, 2, 7, 14, CAST(350.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (84, N'Furbliss Refreshing Shampoo for cats', N'THE ULTIMATE CALMING SPRAY - Made with a calming essential oil blend, your pet will feel pure bliss with Furbliss Calming Spray. Naturally calms and soothes your dog or cat so they''ll feel their best.', N'MADE IN USA - Like all Furbliss products, the Furbliss Calming Spray is Made in the USA with the highest quality ingredients available. Our grooming spray creates a calm aroma to help stop anxiety and provide relief from stressful situations - thunderstorms, vet visits and car rides.', CAST(N'2020-02-06T16:35:03.593' AS DateTime), NULL, 2, 7, 14, CAST(400.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (85, N'CATCHECK Red & Black Harness For Cats', N'Measure Your Pets Before Selecting Size: This harness suit for most cats and small dogs, Pet Chest Girth =30cm/11.8in choose XS size, =36cm/14.2in choose S, =40cm/15.7in choose M, =46cm/18.1in choose L', N'Safe & Convenient To Use: The vest-like pet harness is easy to put on and take off, plastic clips on the back enables it to put on and off conveniently and fit dogs or cats fairly well. It easy seat belt attachment in your car. There is a piece of reflective material in the chest and a reflective strip on the edge which could make your pet clearly visible at night or somedays with low-visibility', CAST(N'2020-02-06T16:37:37.897' AS DateTime), NULL, 2, 8, 15, CAST(770.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (86, N'Customized cat collar', N'Strong break-away safety release buckle, easy to open and close. They have an easy to adjust strap made from high quality, durable, soft and skin-friendly fabric.', N'', CAST(N'2020-02-06T16:40:48.400' AS DateTime), NULL, 2, 8, 15, CAST(420.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (87, N'Daisy Chains Floral print collar for cats', N'Blueberry Pet bow tie cat collars are great gift ideas for Valentine''s Day, St. Patrick''s Day, Mother''s Day, Father''s Day, wedding, birthdays and etc.', N'', CAST(N'2020-02-06T16:41:37.223' AS DateTime), NULL, 2, 8, 15, CAST(320.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (88, N'AQUADENE- Micro pellet Fish food (with multi vitamins)', N'BLUE RIDGE KOI AND GOLDFISH FISH FOOD premium all-season floating food pellet and the same high quality diet used for Americas leading Koi breeder at a fraction of the price', N'EASILY DIGESTED Floating pellets soften quickly for easy digestion, encourage healthy growth, and wont pollute the water
PERFECT FOR MIXED SIZES OF KOI AND GOLDFISH This food provides a completely balanced nutritional diet that greatly enhances growth in all koi and goldfish
A HEALTHY CHOICE Contains a special blend of vitamins and minerals that promotes resistance to stress and immunity to disease.', CAST(N'2020-02-06T16:44:52.697' AS DateTime), NULL, 3, 9, 16, CAST(4130.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (89, N'AQUADENE RUBY RED - Fish Food with special colour enhancer formula', N'HEALTHY & TASTY - Tender shrimp meat with thin shells, which is an excellent source of protein and roughage', N'PREMIUM QUALITY - Provides protein, fat and Vitamin E that helps your fish look healthy and colorful
100% NATURAL - Naturally rich in antihistamine, which promotes development of fish''s natural pink to orange-red colors
EASY TO STORE - 7 Oz of Sun Dried Red Shrimp packed in a convenient plastic jar with a screw on top', CAST(N'2020-02-06T16:45:59.607' AS DateTime), NULL, 3, 9, 16, CAST(490.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (90, N'AZOO 9 IN 1- DRY food for Fish', N'Proprietary formula, Maximizes brightness, Optimized for GloFish fluorescent fish and other tropical fish, Colorful 4 flake blend', N'', CAST(N'2020-02-06T16:47:18.657' AS DateTime), NULL, 3, 9, 16, CAST(560.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (91, N'Aquatic Black Sculpture Bubble Releasing Stone For Aquarium Decoration', N'Hand crafted design from aquatics décor designer Samuel baker Made from durable high grade Resin that won’t fade', N'', CAST(N'2020-02-06T16:48:21.447' AS DateTime), NULL, 3, 10, 17, CAST(1100.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (92, N'Aquatic Blue Ancient House Stone For Aquarium Decoration', N'Hand crafted design from aquatics décor designer Samuel baker Made from durable high grade Resin that won’t fade', N'', CAST(N'2020-02-06T16:48:57.093' AS DateTime), NULL, 3, 10, 17, CAST(1350.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (93, N'Aquatic Bridge For Aquarium Decoration', N'DECORATE YOUR AQUARIUM - The realistic sunken ship decorations painted with detail and colors, increase the natural scenery in your fish tank. Impress guests and give realistic feel and excitement!', N'MADE OF RESIN MATERIAL - This ECO-Friendly resin material non-toxic, non-pollutant fish tank decorations is safe for the fish and water quality, also it won''t fade when the time goes long. Colourful scenery makes your fish vitality
WORTH HAVING - This 9 inch sunken ship decoration will change your ordinary aquarium.Simply clean and place this accessory inside of our fish tank and you’ll have a posh aquarium within a few minutes!', CAST(N'2020-02-06T16:50:07.720' AS DateTime), NULL, 3, 10, 17, CAST(3500.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (94, N'BURT BEES dog shampoo', N'CLEANS AND SOFTENS — Burt''s Bees Hypoallergenic Shampoo is a gentle cleanser that freshens up your dog''s coat without drying out their skin', N'MADE WITH THE HIGHEST QUALITY INGREDIENTS — All natural ingredients include skin-moisturizing shea butter and shine-boosting honey
DIRECTIONS — Apply to dog''s wet coat. Work from head to tail and rinse, carefully avoiding eyes. As is typical with natural formulas, this shampoo will only have a light lather
SUITABLE FOR ALL DOGS AND PUPPIES — This mild tearless shampoo is pH balanced especially for all dogs and puppies', CAST(N'2020-02-06T16:51:40.967' AS DateTime), NULL, 1, 3, 18, CAST(420.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (95, N'Himalaya Erina EP Shampoo', N'REPAIR DAMAGED HAIR: WOW shampoo and conditioner set uses virgin coconut and avocado oil to rejuvenate weak, thin, or damaged hair or dry scalp. The formulation of both oils replenish lost nutrition that''s vital in keeping strong, smooth hair.', N'LARIFYING, HEALTHY HAIR: Detoxify your hair and dry scalp to clear the buildups caused by dirt, filth, and style products. Apple cider vinegar removes filth that damages hair. Rich in vital protection to support healthier hair growth for Dog.', CAST(N'2020-02-06T16:54:02.570' AS DateTime), NULL, 1, 3, 18, CAST(230.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (96, N'PAWD STORE GENUINE LEATHER BELT', N'Please measure your dog''s neck circumference before purchasing. If you have any questions about the size after purchase, please contact us and we will solve it. Neck length of this collar: 17-22 inch.', N'', CAST(N'2020-02-06T16:54:58.977' AS DateTime), NULL, 1, 3, 18, CAST(550.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (97, N'Blue printed dog Body Belt', N'Blue printed dog Body Belt', N'', CAST(N'2020-02-06T16:56:13.743' AS DateTime), NULL, 1, 4, 19, CAST(450.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (98, N'BODIE Dog Bed', N'HIGH QUALITY COMFORT: The therapeutic gel memory foam comforts your dog by relieving body aches, joint pain, hip dysplasia, and arthritis, and giving optimal therapeutic support. It also works great as a cat bed, or a bed for all pets!', N'WATERPROOF & MACHINE WASHABLE: Easily combat accidents and keep your dog’s bed looking and smelling fresh and clean. No more messes! The zippered cover slides off seamlessly for convenient cleaning! Just throw it in the wash and it’ll be good as new.', CAST(N'2020-02-06T16:57:05.357' AS DateTime), NULL, 1, 4, 19, CAST(4500.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (99, N'Bolster Dog bed Purple', N'Designed with extra care, your pet''s comfort is our priority. Your dog will get a solid night''s sleep in this luxurious bed. The cushioned poly-fill bolster provides your dog exceptional comfort, even for dogs with joint pain or arthritis.', N'Water-resistant liner and human-grade mattress foam, this orthopedic bed has been put to the test proven to be durable and long lasting.
Bed Size: 36 x 28 x 9 inch, Mattress thickness 4 inch. Huge clearance is perfect for a couple smaller pets who like it cozy or 1 medium dog or 1 large dog breed up to 75lbs. Great head, hip and bone support.', CAST(N'2020-02-06T16:57:51.203' AS DateTime), NULL, 1, 4, 19, CAST(8500.00 AS Decimal(18, 2)), 0)
GO
SET IDENTITY_INSERT [dbo].[Product_Master] OFF
SET IDENTITY_INSERT [dbo].[Product_Specification_Master] ON 

INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (1, 28, N'TYPE', N'Adult Food', CAST(N'2020-02-06T11:35:50.940' AS DateTime), NULL, NULL)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (2, 28, N'QUANTITY', N'1.2 Kg', CAST(N'2020-02-06T11:35:59.417' AS DateTime), NULL, NULL)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (3, 28, N'BREED', N'Large Breed dogs with high energy requirements, pregnant or lactating bitches of the same breed.', CAST(N'2020-02-06T11:36:08.473' AS DateTime), NULL, NULL)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (4, 28, N'KEY BENEFITS', N'Essential fatty acids present in the diet promote healthy skin and a shiny coat.Rich in protein to maintain good muscle mass. Fulfills the energy requirement of dogs participating in endurance sports.', CAST(N'2020-02-06T11:36:47.873' AS DateTime), NULL, NULL)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (5, 28, N'INGREDIENTS', N'Cereals and cereal by-products, meat and meat by-products, vegetable by-products and proteins, vegetable oils, fish meal, chicken liver, prebiotics, iodised salt, essential vitamins and minerals, permitted preservatives, antioxidants and flavours. Co', CAST(N'2020-02-06T11:36:59.743' AS DateTime), NULL, NULL)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (6, 28, N'NUTRITIONAL ADDITIVES', N'Calcium (1.2g), Phosphorus (0.85g), Calcium: Phosphorus ratio (1.4:1), Sodium (0.3 g), Iron (18.92 mg), Copper (2.24 mg), Zinc (25.44 mg), Vitamin Per 100g: Vitamin A (3819.20 IU), Vitamin D3 (135.80 IU), Vitamin E (8.49 IU), Vitamin B1 (0.25 mg), Vi', CAST(N'2020-02-06T11:37:09.680' AS DateTime), NULL, NULL)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (7, 28, N'NUTRITION FACTS', N'Protein Min (28%), Fat Min (15%), Ash Max (10%), Crude Fibre Max (5%), Moisture Max (10%)', CAST(N'2020-02-06T11:37:19.400' AS DateTime), NULL, NULL)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (8, 29, N'TYPE', N'Adult Dog Food', CAST(N'2020-02-06T11:41:02.073' AS DateTime), NULL, NULL)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (9, 29, N'QUANTITY', N'2 Kg', CAST(N'2020-02-06T11:41:10.160' AS DateTime), NULL, NULL)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (10, 29, N'BENEFITS OF ACANA LIGHT & FIT DOG FOOD', N'High meat content in the diet provides a rich supply of protein for building lean muscle mass and strength. Reduced carbohydrate content for sustaining optimal weight and a balanced blood sugar level. Inclusion of freeze-dried liver meat enhances the', CAST(N'2020-02-06T11:41:28.623' AS DateTime), NULL, NULL)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (11, 29, N'INGREDIENTS', N'Deboned chicken, deboned turkey, turkey meal, chicken meal, whole red lentils, whole green peas, whole yellow peas, lentil fiber, atlantic flounder, chicken giblets, chicken broth, dried pumpkin, whole green lentils, whole pinto beans, whole chickpea', CAST(N'2020-02-06T11:41:45.560' AS DateTime), NULL, NULL)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (12, 29, N'SUPPLEMENTS', N'Zinc chelate. Vitamin E (preservative). *Contains mixed tocopherols (a tocopherol-rich extract of natural origin- Vitamin E and Rosemary Oil). Also contains the probiotic Enterococcus faecium.', CAST(N'2020-02-06T11:41:55.997' AS DateTime), NULL, NULL)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (13, 29, N'NUTRITION FACTS', N'Crude Fibre (8%), Calcium (1.7%), Fat (11%), Crude Ash (7%), Crude Fibres (8%) Moisture (12%), Omega 6 (2.2%), Omega 3 (0.9%), Vitamin A (13000.0 UI/kg), Crude Protein (35%), Phosphorus (1.1%), DHA (0.3%), EPA (0.3%), Vitamin E (120 IU/kg), Folic Aci', CAST(N'2020-02-06T11:42:07.317' AS DateTime), NULL, NULL)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (14, 30, N'TYPE', N'Adult and Puppy Food', CAST(N'2020-02-06T11:45:40.293' AS DateTime), NULL, NULL)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (15, 30, N'QUANTITY', N'2 Kg', CAST(N'2020-02-06T11:45:47.590' AS DateTime), NULL, NULL)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (16, 30, N'BREED', N'For dogs of all breed and life stages.', CAST(N'2020-02-06T11:45:56.853' AS DateTime), NULL, NULL)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (17, 30, N'INGREDIENTS', N'Fresh chicken meat (11%), chicken meal (10%), turkey meal (10%), red lentils, whole green peas (9%), field beans (8%), fresh chicken giblets (liver, heart, kidney) (6%), herring meal (5%), chicken fat (5%), green lentils (5%), whole yellow peas (4%),', CAST(N'2020-02-06T11:46:11.570' AS DateTime), NULL, NULL)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (18, 30, N'SUPPLEMENTS', N'Zinc chelate. Vitamin E (preservative). *Contains mixed tocopherols (a tocopherol-rich extract of natural origin- Vitamin E and Rosemary Oil). Also contains the probiotic Enterococcus faecium.', CAST(N'2020-02-06T11:46:22.490' AS DateTime), NULL, NULL)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (19, 34, N'TYPE', N'Dog Treat', CAST(N'2020-02-06T12:00:11.253' AS DateTime), NULL, NULL)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (20, 34, N'QUANTITY', N'92 grams', CAST(N'2020-02-06T12:00:17.757' AS DateTime), NULL, NULL)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (21, 34, N'BREED', N'Dogs of all breeds and life stages.', CAST(N'2020-02-06T12:00:26.167' AS DateTime), NULL, NULL)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (22, 34, N'INGREDIENTS', N'Lamb liver (fresh or raw, 30%), lamb meat (fresh or raw, 30%), fresh red delicious apples (20%), lamb tripe (fresh or raw, 19.5%), chicory root, milk thistle, burdock root, lavender, marshmallow root', CAST(N'2020-02-06T12:00:36.893' AS DateTime), NULL, NULL)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (23, 34, N'NUTRITION FACTS', N'Crude Fibre (3%), Fat (40%), Crude Protein (40%), Moisture (5%)', CAST(N'2020-02-06T12:00:46.573' AS DateTime), NULL, NULL)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (24, 35, N'TYPE', N'Adult Food', CAST(N'2020-02-06T12:04:14.940' AS DateTime), NULL, NULL)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (25, 35, N'QUANTITY', N'17 Kg', CAST(N'2020-02-06T12:04:23.070' AS DateTime), NULL, NULL)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (26, 35, N'BREED', N'For puppies having an adult weight of 25 Kg or more', CAST(N'2020-02-06T12:04:31.900' AS DateTime), NULL, NULL)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (27, 35, N'What makes Acana a Biologically appropriate dog Food', N'ACANA mimics the natural diet, incorporating meat, organs and cartilage in ratios that offer nutrients in the most organic way possible, providing a condensed and natural source of virtually every nutrient your dog needs to flourish. Thats why virtua', CAST(N'2020-02-06T12:04:44.683' AS DateTime), NULL, NULL)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (28, 35, N'INGREDIENTS', N'Fresh chicken meat (16%), chicken meal (15%), turkey meal (14%), red lentils, whole green peas, fresh chicken giblets (liver, heart, kidney) (6%), herring meal (4%), fresh whole eggs (4%), fresh whole flounder (4%), herring oil (3%), sun-cured alfalf', CAST(N'2020-02-06T12:05:00.827' AS DateTime), NULL, NULL)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (29, 35, N'NUTRITION FACTS', N'Crude Fibre (6%), Calcium (1.4%), Fat (15%), Crude Ash (7%), Crude Fibre (6%) Moisture (12%), Omega 6 (2.4%), Omega 3 (1.2%), Vitamin A (12000.0 UI/kg), Crude Protein (33%), Phosphorus (1%), DHA (0.4%), EPA (0.4%), Vitamin E (130 IU/kg), Folic Acid (', CAST(N'2020-02-06T12:05:12.467' AS DateTime), NULL, NULL)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (30, 35, N'SUPPLEMENTS', N'Zinc chelate. Vitamin E (preservative). *Contains mixed tocopherols (a tocopherol rich extract of natural origin- Vitamin E and Rosemary Oil). Also contains the probiotic Enterococcus faecium.', CAST(N'2020-02-06T12:05:22.747' AS DateTime), NULL, NULL)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (31, 36, N'TYPE', N'Adult Dog Food', CAST(N'2020-02-06T12:08:01.977' AS DateTime), NULL, NULL)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (32, 36, N'BREED', N'Adult dogs of all breed having an age of 1 or above.', CAST(N'2020-02-06T12:08:12.640' AS DateTime), NULL, NULL)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (33, 36, N'INGREDIENTS', N'Deboned chicken, deboned turkey, turkey meal, chicken meal, whole red lentils, whole green peas, whole yellow peas, lentil fiber, atlantic flounder, chicken giblets, chicken broth, dried pumpkin, whole green lentils, whole pinto beans, whole chickpea', CAST(N'2020-02-06T12:08:29.247' AS DateTime), NULL, NULL)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (34, 36, N'SUPPLEMENTS', N'Zinc chelate. Vitamin E (preservative). *Contains mixed tocopherols (a tocopherol-rich extract of natural origin- Vitamin E and Rosemary Oil). Also contains the probiotic Enterococcus faecium.', CAST(N'2020-02-06T12:08:44.183' AS DateTime), NULL, NULL)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (35, 36, N'NUTRITION FACTS', N'Crude Fibre (8%), Calcium (1.7%), Fat (11%), Crude Ash (7%), Crude Fibres (8%) Moisture (12%), Omega 6 (2.2%), Omega 3 (0.9%), Vitamin A (13000.0 UI/kg), Crude Protein (35%), Phosphorus (1.1%), DHA (0.3%), EPA (0.3%), Vitamin E (120 IU/kg), Folic Aci', CAST(N'2020-02-06T12:08:55.980' AS DateTime), NULL, NULL)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (36, 57, N'Brand', N'Scoobee', CAST(N'2020-02-06T12:48:32.557' AS DateTime), NULL, NULL)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (37, 57, N'Model Number', N'ec-scobee bones', CAST(N'2020-02-06T12:48:42.530' AS DateTime), NULL, NULL)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (38, 57, N'Pet Type', N'Dog', CAST(N'2020-02-06T12:48:51.700' AS DateTime), NULL, NULL)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (39, 57, N'Quantity', N'800g', CAST(N'2020-02-06T12:49:02.597' AS DateTime), NULL, NULL)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (40, 57, N'Model Name', N'Bones pack', CAST(N'2020-02-06T12:49:34.027' AS DateTime), NULL, NULL)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (41, 57, N'Suitable For', N'Puppies', CAST(N'2020-02-06T12:49:43.493' AS DateTime), NULL, NULL)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (42, 57, N'Treat Type', N'Cuttlebone', CAST(N'2020-02-06T12:49:59.033' AS DateTime), NULL, NULL)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (43, 67, N'Guaranteed Analysis', N'Crude protein (min.) 33 %, Fat content (min.) 15 %, Crude ash (max.) 7%, Crude fibres (max.) 6%, Moisture (max.) 12%, Calcium(min.) 1.4%Phosphorus(min.) 1%, Omega-6 fatty acids (min.) 2.4%, Omega-3 fatty acids (min.) 1.2%, DHA (min.) 0.4 %, EPA (min.', CAST(N'2020-02-06T14:36:17.407' AS DateTime), NULL, NULL)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (44, 67, N'Ingredients', N'Fresh chicken meat (16%), chicken meal (15%), fresh chicken cartilage (2%), fresh chicken giblets (liver, heart, kidney) (6%), freeze-dried chicken liver, chicken fat (2%), turkey meal (14%), freeze-dried turkey liver, red lentils, green lentils.', CAST(N'2020-02-06T14:36:32.233' AS DateTime), CAST(N'2020-02-06T14:36:52.377' AS DateTime), NULL)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (45, 69, N'COMPLETE DIET FOR PUPPIES', N'Royal Canin Golden Retriever Puppy food is a diet especially designed for puppies, taking the age and health requirements into consideration.', CAST(N'2020-02-06T14:42:18.930' AS DateTime), NULL, NULL)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (46, 69, N'ENHANCES BONE STRENGTH', N'This Dog Food is high in nutritional value that helps in enhancing the bone strength and promotes the health of pups.', CAST(N'2020-02-06T14:42:29.617' AS DateTime), NULL, NULL)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (47, 69, N'MAINTAINS IDEAL WEIGHT', N' This food contains an apt amount of protein, calcium, and phosphorous that maintains an ideal weight of pups at their growing stage.', CAST(N'2020-02-06T14:42:41.697' AS DateTime), NULL, NULL)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (48, 69, N'IMPROVES DIGESTIVE HEALTH', N'This formula improves the digestive health of Golden Retriever puppies and also promotes a balance in the intestinal flora.', CAST(N'2020-02-06T14:42:52.440' AS DateTime), NULL, NULL)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (49, 69, N'EXCLUSIVE KIBBLE DIET', N'The kibble texture and formula of this dog feed encourages pups to chew and also helps in removing tartar from the teeth.', CAST(N'2020-02-06T14:43:06.570' AS DateTime), NULL, NULL)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (50, 70, N'APT FOR LABRADOR PUPPIES', N'Royal Canin Labrador Retriever Junior/Puppy Food is apt for Labrador Retriever puppies of 2 to 15 months.', CAST(N'2020-02-06T14:46:40.743' AS DateTime), NULL, NULL)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (51, 70, N'MAINTAINS IDEAL WEIGHT', N'The feed contains an apt amount of protein, calcium, and phosphorous that promotes harmonious weight gain and maintains an ideal weight of growing puppies.', CAST(N'2020-02-06T14:46:51.217' AS DateTime), NULL, NULL)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (52, 70, N'ENHANCES B1 STRUCTURE', N'This Puppy Food is high in nutritional value that enhances the B1 Structure and improves bone strength to promotes healthy development of Puppies.', CAST(N'2020-02-06T14:46:59.990' AS DateTime), NULL, NULL)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (53, 70, N'IMPROVES DIGESTIVE HEALTH', N'Royal Canin Labrador Retriever Junior/Puppy Food improves the digestive health of growing puppies and also promotes a balance in the intestinal flora.', CAST(N'2020-02-06T14:47:09.007' AS DateTime), NULL, NULL)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (54, 70, N'EXCLUSIVE KIBBLE DIET', N'This is an exclusive kibble diet designed especially for weaning puppies.', CAST(N'2020-02-06T14:47:19.383' AS DateTime), NULL, NULL)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (55, 71, N'APT FOR LARGE BREED PUPPIES', N'Royal Canin Maxi Puppy Food is a diet apt for Large Breed Puppies up to 15 months (Adult Weight 26-44 Kg), who have a long growth period.', CAST(N'2020-02-06T14:49:36.460' AS DateTime), NULL, NULL)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (56, 71, N'ENHANCES B1 STRUCTURE', N'Royal Canin Maxi Puppy Food is high in nutritional value that enhances B1 Structure and improves bone strength to promotes the healthy development of Puppies.', CAST(N'2020-02-06T14:49:45.430' AS DateTime), NULL, NULL)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (57, 71, N'MAINTAINS ENERGY LEVEL', N'Royal Canin Maxi Puppy meets the moderate energy needs of Large Breed Puppies who have a long growth period.', CAST(N'2020-02-06T14:49:55.250' AS DateTime), NULL, NULL)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (58, 71, N'SUPPORTS GOOD DENTAL HEALTH', N'Royal Canin Maxi Puppy Food is a proven Kibble Technology that reduces the formation of tartar and supports good dental health of puppies.', CAST(N'2020-02-06T14:50:04.203' AS DateTime), NULL, NULL)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (59, 71, N'IMPROVES SKIN & COAT', N'RC Maxi Puppy contains ideal levels of EPA-DHA that helps in improving Skin and Coat of puppies. PROMOTES GROWTH- This food formula is designed to meet the specific needs of Large Breed Puppies that promotes growth throughout every stage of their lif', CAST(N'2020-02-06T14:50:13.723' AS DateTime), NULL, NULL)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (60, 72, N'APT FOR ROTTWEILER PUPPIES', N'Royal Canin Rottweiler Junior Puppy Food is apt for Rottweiler puppies from 2 to 15 months.', CAST(N'2020-02-06T14:52:32.320' AS DateTime), NULL, NULL)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (61, 72, N'ENHANCES B1 STRUCTURE', N'Royal Canin Rottweiler Junior Puppy Food is high in nutritional value that helps in enhancing B1 Structure improving bone strength to promote the healthy development of Puppies.', CAST(N'2020-02-06T14:52:43.173' AS DateTime), NULL, NULL)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (62, 72, N'MAINTAINS IDEAL WEIGHT', N'Royal Canin Rottweiler Junior Puppy Food contains an apt amount of protein, calcium, and phosphorous that promotes harmonious weight gain and also maintains an ideal weight to these puppies.', CAST(N'2020-02-06T14:52:59.770' AS DateTime), NULL, NULL)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (63, 72, N'IMPROVES DIGESTIVE HEALTH', N'This formula improves the digestive health of growing puppies and also promotes a balance in the intestinal flora.', CAST(N'2020-02-06T14:53:08.910' AS DateTime), NULL, NULL)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (64, 72, N'EXCLUSIVE KIBBLE DIET', N'Royal Canin Rottweiler Junior Puppy Food is an exclusive kibble diet designed especially for weaning puppies.', CAST(N'2020-02-06T14:53:19.647' AS DateTime), NULL, NULL)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (65, 74, N'APT FOR ADULT PUGS', N'Royal Canin Adult Pug Dog Food is a diet ideal for the Pugs over 10 months.', CAST(N'2020-02-06T14:58:34.387' AS DateTime), NULL, NULL)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (66, 74, N'ENHANCES B1 STRUCTURE', N'This Dog Food is high in nutritional value that helps in enhancing B1 Structure that improves bone strength and promotes the healthy development of Adult Pugs.', CAST(N'2020-02-06T14:58:43.900' AS DateTime), NULL, NULL)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (67, 74, N' IMPROVES SKIN & COAT', N'The product contains ideal levels of EPA-DHA that helps in improving Skin and Coat of Pugs.', CAST(N'2020-02-06T15:00:28.657' AS DateTime), NULL, NULL)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (68, 74, N'MAINTAINS DENTAL HEALTH', N'The Product is a proven Kibble Technology that reduces the formation of tartar and maintains the dental health of Pugs.', CAST(N'2020-02-06T15:00:40.247' AS DateTime), NULL, NULL)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (69, 74, N'SUPPORTS IDEAL WEIGHT', N'This Pug diet contains L-carnitine and a moderate level of fat that helps in maintaining ideal weight.', CAST(N'2020-02-06T15:00:48.833' AS DateTime), NULL, NULL)
INSERT [dbo].[Product_Specification_Master] ([Product_Specification_ID], [Product_ID], [Specification_Title], [Specification_Value], [CreatedDate], [UpdatedDate], [Specification_GroupID]) VALUES (70, 74, N'HIGH IN PROTEIN-', N'Muscle T1 formula makes this diet rich in protein that helps in maintaining the Pug’s T1 muscles.', CAST(N'2020-02-06T15:01:02.503' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Product_Specification_Master] OFF
SET IDENTITY_INSERT [dbo].[SubCategory_Master] ON 

INSERT [dbo].[SubCategory_Master] ([SubCategory_ID], [SubCategory_Name], [Category_ID], [IsDeleted], [Image], [IsHomePage], [ImageName], [Sortable], [Heading], [Description], [Page_Image], [Page_Image_Name], [AlterText]) VALUES (1, N'Clothes', 1, 0, NULL, 1, N'DogClothes.jpg', CAST(10 AS Numeric(18, 0)), N'Dog clothes', N'Dog clothes are made to be either functional or for show. Functional dog clothes are for protection from the elements and allergens.', NULL, N'HeaderImageDog.jpg', N'')
INSERT [dbo].[SubCategory_Master] ([SubCategory_ID], [SubCategory_Name], [Category_ID], [IsDeleted], [Image], [IsHomePage], [ImageName], [Sortable], [Heading], [Description], [Page_Image], [Page_Image_Name], [AlterText]) VALUES (2, N'Dog Food', 1, 0, NULL, 1, N'DogFoodCategory.jpg', CAST(1 AS Numeric(18, 0)), N'Dog Food', N'While the exact composition of dog food varies widely from one manufacturer to another, dog food generally is made up of meats, meat byproducts, cereals, grains, vitamins, and minerals.', NULL, N'DogFoodHeader.png', N'')
INSERT [dbo].[SubCategory_Master] ([SubCategory_ID], [SubCategory_Name], [Category_ID], [IsDeleted], [Image], [IsHomePage], [ImageName], [Sortable], [Heading], [Description], [Page_Image], [Page_Image_Name], [AlterText]) VALUES (3, N'Dog Health Care', 1, 0, NULL, 1, N'DogHealthCare.jpg', CAST(9 AS Numeric(18, 0)), N'Health Care of Dogs', N'Routine Health Care of Dogs. In addition to feeding and exercising your dog, other aspects of general care are needed to keep your dog healthy throughout its life.', NULL, N'DogHealthCareHeader.jpg', N'')
INSERT [dbo].[SubCategory_Master] ([SubCategory_ID], [SubCategory_Name], [Category_ID], [IsDeleted], [Image], [IsHomePage], [ImageName], [Sortable], [Heading], [Description], [Page_Image], [Page_Image_Name], [AlterText]) VALUES (4, N'Dog Supplies', 1, 0, NULL, 1, N'DogSuppliesCategory.jpg', CAST(8 AS Numeric(18, 0)), N'Dog Supplies', N'A pet shop or pet store is a retail business which sells different kinds of animals to the public. A variety of animal supplies and pet accessories are also sold in pet shops.', NULL, N'DogSuppliesHeader.jpg', N'')
INSERT [dbo].[SubCategory_Master] ([SubCategory_ID], [SubCategory_Name], [Category_ID], [IsDeleted], [Image], [IsHomePage], [ImageName], [Sortable], [Heading], [Description], [Page_Image], [Page_Image_Name], [AlterText]) VALUES (5, N'Cat Clothes', 2, 0, NULL, 1, N'CatClotheCategory.jpg', CAST(7 AS Numeric(18, 0)), N'Cat Clothes', N'', NULL, N'catHeader.png', N'')
INSERT [dbo].[SubCategory_Master] ([SubCategory_ID], [SubCategory_Name], [Category_ID], [IsDeleted], [Image], [IsHomePage], [ImageName], [Sortable], [Heading], [Description], [Page_Image], [Page_Image_Name], [AlterText]) VALUES (6, N'Cat Food', 2, 0, NULL, 1, N'CatFoodCategory.jpg', CAST(6 AS Numeric(18, 0)), N'Cat Food', N'Pet food is a specialty food for domesticated animals that is formulated according to their nutritional needs. Pet food generally consists of meat, meat byproducts, cereals, grain, vitamins, and minerals.', NULL, N'CatFoodHeader.jpg', N'')
INSERT [dbo].[SubCategory_Master] ([SubCategory_ID], [SubCategory_Name], [Category_ID], [IsDeleted], [Image], [IsHomePage], [ImageName], [Sortable], [Heading], [Description], [Page_Image], [Page_Image_Name], [AlterText]) VALUES (7, N'Cat Health Care', 2, 0, NULL, 1, N'CatHealthCare.jpg', CAST(5 AS Numeric(18, 0)), N'Cat Health Care', N'Proactive health measures to be taken to keep your cat healthy. Visit our page & understand the various health needs of your cat. Healthy & Shiny Coat. High Moisture Content.', NULL, N'CatHealthCareHeader.jpg', N'')
INSERT [dbo].[SubCategory_Master] ([SubCategory_ID], [SubCategory_Name], [Category_ID], [IsDeleted], [Image], [IsHomePage], [ImageName], [Sortable], [Heading], [Description], [Page_Image], [Page_Image_Name], [AlterText]) VALUES (8, N'Cat Supplies', 2, 0, NULL, 1, N'CatSupplyCategory.jpg', CAST(4 AS Numeric(18, 0)), N'Cat Supplies', N'', NULL, N'CatSuppliesHeader.jpg', N'')
INSERT [dbo].[SubCategory_Master] ([SubCategory_ID], [SubCategory_Name], [Category_ID], [IsDeleted], [Image], [IsHomePage], [ImageName], [Sortable], [Heading], [Description], [Page_Image], [Page_Image_Name], [AlterText]) VALUES (9, N'Fish Food', 3, 0, NULL, 1, N'FishFoodCategory.jpg', CAST(3 AS Numeric(18, 0)), N'Fish Food', N'', NULL, N'FishFoodHeader.jpg', N'')
INSERT [dbo].[SubCategory_Master] ([SubCategory_ID], [SubCategory_Name], [Category_ID], [IsDeleted], [Image], [IsHomePage], [ImageName], [Sortable], [Heading], [Description], [Page_Image], [Page_Image_Name], [AlterText]) VALUES (10, N'Fish Supplies', 3, 0, NULL, 1, N'FishSuppliesCategory.jpg', CAST(2 AS Numeric(18, 0)), N'Fish Supplies', N'', NULL, N'', N'')
SET IDENTITY_INSERT [dbo].[SubCategory_Master] OFF
SET IDENTITY_INSERT [dbo].[Subscribe_Master] ON 

INSERT [dbo].[Subscribe_Master] ([Subscribe_ID], [EmailID], [Email_Group_ID], [IsDeleted]) VALUES (1, N'mehul@gmail.com', 1, 1)
SET IDENTITY_INSERT [dbo].[Subscribe_Master] OFF
SET IDENTITY_INSERT [dbo].[ThirdCategory_Master] ON 

INSERT [dbo].[ThirdCategory_Master] ([ThirdCategory_ID], [SubCategory_ID], [ThirdCategory_Name]) VALUES (1, 1, N'Jackets')
INSERT [dbo].[ThirdCategory_Master] ([ThirdCategory_ID], [SubCategory_ID], [ThirdCategory_Name]) VALUES (2, 1, N'Shirts')
INSERT [dbo].[ThirdCategory_Master] ([ThirdCategory_ID], [SubCategory_ID], [ThirdCategory_Name]) VALUES (3, 1, N'Sweaters')
INSERT [dbo].[ThirdCategory_Master] ([ThirdCategory_ID], [SubCategory_ID], [ThirdCategory_Name]) VALUES (4, 2, N'Dry Food')
INSERT [dbo].[ThirdCategory_Master] ([ThirdCategory_ID], [SubCategory_ID], [ThirdCategory_Name]) VALUES (5, 2, N'Gravy Food')
INSERT [dbo].[ThirdCategory_Master] ([ThirdCategory_ID], [SubCategory_ID], [ThirdCategory_Name]) VALUES (6, 2, N'Treats and chews')
INSERT [dbo].[ThirdCategory_Master] ([ThirdCategory_ID], [SubCategory_ID], [ThirdCategory_Name]) VALUES (7, 6, N'Dry Food')
INSERT [dbo].[ThirdCategory_Master] ([ThirdCategory_ID], [SubCategory_ID], [ThirdCategory_Name]) VALUES (10, 5, N'Jacket')
INSERT [dbo].[ThirdCategory_Master] ([ThirdCategory_ID], [SubCategory_ID], [ThirdCategory_Name]) VALUES (11, 5, N'Coats')
INSERT [dbo].[ThirdCategory_Master] ([ThirdCategory_ID], [SubCategory_ID], [ThirdCategory_Name]) VALUES (13, 6, N'Wet Or Gravy Food')
INSERT [dbo].[ThirdCategory_Master] ([ThirdCategory_ID], [SubCategory_ID], [ThirdCategory_Name]) VALUES (14, 7, N'Health Care')
INSERT [dbo].[ThirdCategory_Master] ([ThirdCategory_ID], [SubCategory_ID], [ThirdCategory_Name]) VALUES (15, 8, N'Supplies')
INSERT [dbo].[ThirdCategory_Master] ([ThirdCategory_ID], [SubCategory_ID], [ThirdCategory_Name]) VALUES (16, 9, N'Fish Food')
INSERT [dbo].[ThirdCategory_Master] ([ThirdCategory_ID], [SubCategory_ID], [ThirdCategory_Name]) VALUES (17, 10, N'Supplies')
INSERT [dbo].[ThirdCategory_Master] ([ThirdCategory_ID], [SubCategory_ID], [ThirdCategory_Name]) VALUES (18, 3, N'Health Care')
INSERT [dbo].[ThirdCategory_Master] ([ThirdCategory_ID], [SubCategory_ID], [ThirdCategory_Name]) VALUES (19, 4, N'Supplies')
SET IDENTITY_INSERT [dbo].[ThirdCategory_Master] OFF
SET IDENTITY_INSERT [dbo].[User_Address_Master] ON 

INSERT [dbo].[User_Address_Master] ([User_Address_ID], [User_ID], [BName], [BEmail], [BMobile], [BAddress], [BCity], [BState], [BZipcode], [SName], [SEmail], [SMobile], [SAddress], [SCity], [SState], [SZipcode], [CreatedDate]) VALUES (1, 1, N'Rajesh Jikadra', N'rajujikadra@gmail.com', N'999590940', N'67, Shyamvilla raw house, Kamrej', N'Surat', N'Gujarat', N'395006', N'Rajesh Jikadra', N'rajujikadra@gmail.com', N'999590940', N'67, Shyamvilla raw house, Kamrej', N'Surat', N'Gujarat', N'395006', CAST(N'2020-02-08T11:00:24.777' AS DateTime))
INSERT [dbo].[User_Address_Master] ([User_Address_ID], [User_ID], [BName], [BEmail], [BMobile], [BAddress], [BCity], [BState], [BZipcode], [SName], [SEmail], [SMobile], [SAddress], [SCity], [SState], [SZipcode], [CreatedDate]) VALUES (2, 2, N'Rajesh Jikadra', N'rajujikadra@gmail.com', N'9998590940', N'67, Shyamvilla Raw House, Kenal Road, Kamrej.', N'Surat', N'Gujarat', N'395006', N'Rajesh Jikadra', N'rajujikadra@gmail.com', N'9998590940', N'67, Shyamvilla Raw House, Kenal Road, Kamrej.', N'Surat', N'Gujarat', N'395006', CAST(N'2020-02-08T18:07:30.333' AS DateTime))
INSERT [dbo].[User_Address_Master] ([User_Address_ID], [User_ID], [BName], [BEmail], [BMobile], [BAddress], [BCity], [BState], [BZipcode], [SName], [SEmail], [SMobile], [SAddress], [SCity], [SState], [SZipcode], [CreatedDate]) VALUES (3, 2, N'Nishant P.', N'nishant.pawdstore@gmail.com', N'8855665566', N'67, Shyamvilla Raw House near Iscon bungalows
Kamrej, Surat.', N'Surat', N'Gujarat', N'394180', N'Nishant P.', N'nishant.pawdstore@gmail.com', N'8855665566', N'67, Shyamvilla Raw House near Iscon bungalows
Kamrej, Surat.', N'Surat', N'Gujarat', N'394180', CAST(N'2020-02-09T14:06:25.513' AS DateTime))
INSERT [dbo].[User_Address_Master] ([User_Address_ID], [User_ID], [BName], [BEmail], [BMobile], [BAddress], [BCity], [BState], [BZipcode], [SName], [SEmail], [SMobile], [SAddress], [SCity], [SState], [SZipcode], [CreatedDate]) VALUES (4, 1, N'Raju Jikadra', N'rbj@gmail.email', N'9998590940', N'114, Regent Square', N'Surat', N'Gujarat', N'328596', N'Raju Jikadra', N'rbj@narola.email', N'9998590940', N'114, Regent Square', N'Surat', N'Gujarat', N'328596', CAST(N'2020-02-10T09:46:35.267' AS DateTime))
SET IDENTITY_INSERT [dbo].[User_Address_Master] OFF
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
ALTER TABLE [dbo].[Cart_Master]  WITH CHECK ADD  CONSTRAINT [FK_ProductKey] FOREIGN KEY([Product_ID])
REFERENCES [dbo].[Product_Master] ([Product_ID])
GO
ALTER TABLE [dbo].[Cart_Master] CHECK CONSTRAINT [FK_ProductKey]
GO
ALTER TABLE [dbo].[Cart_Master]  WITH CHECK ADD  CONSTRAINT [FK_UserKey] FOREIGN KEY([User_ID])
REFERENCES [dbo].[AdminLoginMaster] ([User_ID])
GO
ALTER TABLE [dbo].[Cart_Master] CHECK CONSTRAINT [FK_UserKey]
GO
ALTER TABLE [dbo].[Category_Master]  WITH CHECK ADD  CONSTRAINT [FK_Menu_ID] FOREIGN KEY([Menu_ID])
REFERENCES [dbo].[MainMenu_Master] ([Menu_ID])
GO
ALTER TABLE [dbo].[Category_Master] CHECK CONSTRAINT [FK_Menu_ID]
GO
ALTER TABLE [dbo].[Order_Item_Master]  WITH CHECK ADD  CONSTRAINT [FK_OrderRef] FOREIGN KEY([Order_ID])
REFERENCES [dbo].[Order_Master] ([Order_ID])
GO
ALTER TABLE [dbo].[Order_Item_Master] CHECK CONSTRAINT [FK_OrderRef]
GO
ALTER TABLE [dbo].[Order_Item_Master]  WITH CHECK ADD  CONSTRAINT [FK_ProductRefe] FOREIGN KEY([Product_ID])
REFERENCES [dbo].[Product_Master] ([Product_ID])
GO
ALTER TABLE [dbo].[Order_Item_Master] CHECK CONSTRAINT [FK_ProductRefe]
GO
ALTER TABLE [dbo].[Order_Master]  WITH CHECK ADD  CONSTRAINT [FK_UserAddress] FOREIGN KEY([User_Address_ID])
REFERENCES [dbo].[User_Address_Master] ([User_Address_ID])
GO
ALTER TABLE [dbo].[Order_Master] CHECK CONSTRAINT [FK_UserAddress]
GO
ALTER TABLE [dbo].[Order_Master]  WITH CHECK ADD  CONSTRAINT [FK_UserRef] FOREIGN KEY([User_ID])
REFERENCES [dbo].[AdminLoginMaster] ([User_ID])
GO
ALTER TABLE [dbo].[Order_Master] CHECK CONSTRAINT [FK_UserRef]
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
ALTER TABLE [dbo].[User_Address_Master]  WITH CHECK ADD  CONSTRAINT [FK_UserIdRefence] FOREIGN KEY([User_ID])
REFERENCES [dbo].[AdminLoginMaster] ([User_ID])
GO
ALTER TABLE [dbo].[User_Address_Master] CHECK CONSTRAINT [FK_UserIdRefence]
GO
ALTER TABLE [dbo].[UserDetails_Master]  WITH CHECK ADD  CONSTRAINT [FK_User] FOREIGN KEY([User_Id])
REFERENCES [dbo].[AdminLoginMaster] ([User_ID])
GO
ALTER TABLE [dbo].[UserDetails_Master] CHECK CONSTRAINT [FK_User]
GO
/****** Object:  StoredProcedure [dbo].[CategoryInsert]    Script Date: 18-02-2020 12:42:51 ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllProducts]    Script Date: 18-02-2020 12:42:51 ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllProductSubCategoryWise]    Script Date: 18-02-2020 12:42:51 ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllProductThirdCategoryWise]    Script Date: 18-02-2020 12:42:51 ******/
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
/****** Object:  StoredProcedure [dbo].[GetHomePageProduct]    Script Date: 18-02-2020 12:42:51 ******/
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
/****** Object:  StoredProcedure [dbo].[GetHotProduct]    Script Date: 18-02-2020 12:42:51 ******/
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
/****** Object:  StoredProcedure [dbo].[GetLastProduct]    Script Date: 18-02-2020 12:42:51 ******/
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
/****** Object:  StoredProcedure [dbo].[GetProductImage]    Script Date: 18-02-2020 12:42:51 ******/
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
/****** Object:  StoredProcedure [dbo].[GetProductMenu]    Script Date: 18-02-2020 12:42:51 ******/
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
/****** Object:  StoredProcedure [dbo].[GetProductSubCategory]    Script Date: 18-02-2020 12:42:51 ******/
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
/****** Object:  StoredProcedure [dbo].[GetSideBarProductList]    Script Date: 18-02-2020 12:42:51 ******/
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
/****** Object:  StoredProcedure [dbo].[MainMenuInsert]    Script Date: 18-02-2020 12:42:51 ******/
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
/****** Object:  StoredProcedure [dbo].[Product_specification_group_insert]    Script Date: 18-02-2020 12:42:51 ******/
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
/****** Object:  StoredProcedure [dbo].[Product_specification_insert]    Script Date: 18-02-2020 12:42:51 ******/
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
/****** Object:  StoredProcedure [dbo].[ProductCKInsert]    Script Date: 18-02-2020 12:42:51 ******/
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
/****** Object:  StoredProcedure [dbo].[ProductImageInsert]    Script Date: 18-02-2020 12:42:51 ******/
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
/****** Object:  StoredProcedure [dbo].[ProductInsert]    Script Date: 18-02-2020 12:42:51 ******/
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
/****** Object:  StoredProcedure [dbo].[RGetCategory]    Script Date: 18-02-2020 12:42:51 ******/
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
/****** Object:  StoredProcedure [dbo].[RGetSubCategory]    Script Date: 18-02-2020 12:42:51 ******/
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
/****** Object:  StoredProcedure [dbo].[SubCategoryInsert]    Script Date: 18-02-2020 12:42:51 ******/
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
/****** Object:  StoredProcedure [dbo].[ThirdCategoryInsert]    Script Date: 18-02-2020 12:42:51 ******/
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
/****** Object:  StoredProcedure [dbo].[ThirdCategoryUpdate]    Script Date: 18-02-2020 12:42:51 ******/
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
