USE [Shop]
GO
/****** Object:  StoredProcedure [dbo].[CategoryInsert]    Script Date: 2/5/2020 11:43:31 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllProducts]    Script Date: 2/5/2020 11:43:31 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllProductSubCategoryWise]    Script Date: 2/5/2020 11:43:31 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllProductThirdCategoryWise]    Script Date: 2/5/2020 11:43:31 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetHomePageProduct]    Script Date: 2/5/2020 11:43:31 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetHotProduct]    Script Date: 2/5/2020 11:43:31 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetLastProduct]    Script Date: 2/5/2020 11:43:31 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetProductImage]    Script Date: 2/5/2020 11:43:31 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetProductMenu]    Script Date: 2/5/2020 11:43:31 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetProductSubCategory]    Script Date: 2/5/2020 11:43:31 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetSideBarProductList]    Script Date: 2/5/2020 11:43:31 PM ******/
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
/****** Object:  StoredProcedure [dbo].[MainMenuInsert]    Script Date: 2/5/2020 11:43:31 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Product_specification_group_insert]    Script Date: 2/5/2020 11:43:31 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Product_specification_insert]    Script Date: 2/5/2020 11:43:31 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ProductCKInsert]    Script Date: 2/5/2020 11:43:31 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ProductImageInsert]    Script Date: 2/5/2020 11:43:31 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ProductInsert]    Script Date: 2/5/2020 11:43:31 PM ******/
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
/****** Object:  StoredProcedure [dbo].[RGetCategory]    Script Date: 2/5/2020 11:43:31 PM ******/
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
/****** Object:  StoredProcedure [dbo].[RGetSubCategory]    Script Date: 2/5/2020 11:43:31 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SubCategoryInsert]    Script Date: 2/5/2020 11:43:31 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ThirdCategoryInsert]    Script Date: 2/5/2020 11:43:31 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ThirdCategoryUpdate]    Script Date: 2/5/2020 11:43:31 PM ******/
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
/****** Object:  UserDefinedFunction [dbo].[SplitString]    Script Date: 2/5/2020 11:43:31 PM ******/
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
/****** Object:  Table [dbo].[AdminLoginMaster]    Script Date: 2/5/2020 11:43:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cart_Master]    Script Date: 2/5/2020 11:43:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart_Master](
	[Cart_ID] [int] IDENTITY(1,1) NOT NULL,
	[User_ID] [int] NULL,
	[Product_ID] [int] NULL,
	[Quantity] [int] NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_Cart_Master] PRIMARY KEY CLUSTERED 
(
	[Cart_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category_Master]    Script Date: 2/5/2020 11:43:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ContactUS_Master]    Script Date: 2/5/2020 11:43:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Email_Group_Master]    Script Date: 2/5/2020 11:43:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Information_Master]    Script Date: 2/5/2020 11:43:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MainMenu_Master]    Script Date: 2/5/2020 11:43:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Order_Item_Master]    Script Date: 2/5/2020 11:43:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Item_Master](
	[Order_Item_ID] [int] IDENTITY(1,1) NOT NULL,
	[Order_ID] [int] NULL,
	[Product_ID] [int] NULL,
	[Quantity] [int] NULL,
	[Price] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Order_Item_Master] PRIMARY KEY CLUSTERED 
(
	[Order_Item_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order_Master]    Script Date: 2/5/2020 11:43:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product_CK_Master]    Script Date: 2/5/2020 11:43:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product_Image_Master]    Script Date: 2/5/2020 11:43:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product_Master]    Script Date: 2/5/2020 11:43:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product_Specification_Master]    Script Date: 2/5/2020 11:43:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Specification_Group_Master]    Script Date: 2/5/2020 11:43:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SubCategory_Master]    Script Date: 2/5/2020 11:43:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Subscribe_Master]    Script Date: 2/5/2020 11:43:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ThirdCategory_Master]    Script Date: 2/5/2020 11:43:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User_Address_Master]    Script Date: 2/5/2020 11:43:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserDetails_Master]    Script Date: 2/5/2020 11:43:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[AdminLoginMaster] ON 

INSERT [dbo].[AdminLoginMaster] ([User_ID], [EmailID], [Password], [UserName], [IsAdmin], [JoinDate]) VALUES (1, N'rajujikadra@gmail.com', N'password123#', N'Rajesh Jikadra', 1, CAST(0x0000AB5800000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[AdminLoginMaster] OFF
SET IDENTITY_INSERT [dbo].[Category_Master] ON 

INSERT [dbo].[Category_Master] ([Category_ID], [Category_Name], [Menu_ID], [IsDeleted]) VALUES (1, N'DOG', 1, 0)
INSERT [dbo].[Category_Master] ([Category_ID], [Category_Name], [Menu_ID], [IsDeleted]) VALUES (2, N'CAT', 1, 0)
INSERT [dbo].[Category_Master] ([Category_ID], [Category_Name], [Menu_ID], [IsDeleted]) VALUES (3, N'FISHES', 1, 0)
SET IDENTITY_INSERT [dbo].[Category_Master] OFF
SET IDENTITY_INSERT [dbo].[MainMenu_Master] ON 

INSERT [dbo].[MainMenu_Master] ([Menu_ID], [Menu_Name], [IsDeleted]) VALUES (1, N'Shop by pet', 0)
SET IDENTITY_INSERT [dbo].[MainMenu_Master] OFF
SET IDENTITY_INSERT [dbo].[Product_Image_Master] ON 

INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (1, 1, NULL, N'blejacket1.jpg', CAST(0x0000AB5801739D09 AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (2, 1, NULL, N'blue jacket.jpg', CAST(0x0000AB580173A382 AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (4, 2, NULL, N'greenjacket.jpg', CAST(0x0000AB580175F39F AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (5, 2, NULL, N'greenjacket1.jpg', CAST(0x0000AB580175FA87 AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (6, 3, NULL, N'largedog jacket.jpg', CAST(0x0000AB5801768834 AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (7, 3, NULL, N'largedog jacket1.jpg', CAST(0x0000AB5801768FA9 AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (8, 4, NULL, N'pinkjacket.jpg', CAST(0x0000AB58017732FF AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (9, 4, NULL, N'pinkjacket1.jpg', CAST(0x0000AB58017741F5 AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (10, 4, NULL, N'pinkjacket2.jpg', CAST(0x0000AB580177492F AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (11, 5, NULL, N'bff shirt.jpg', CAST(0x0000AB5801789F11 AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (12, 5, NULL, N'bff shirt1.jpg', CAST(0x0000AB580178A586 AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (13, 6, NULL, N'duckshirt.jpg', CAST(0x0000AB580179DBF9 AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (14, 6, NULL, N'duckshirt2.jpg', CAST(0x0000AB580179E389 AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (15, 6, NULL, N'duckshirt1.jpg', CAST(0x0000AB580179EC56 AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (16, 7, NULL, N'freakout shirt.jpg', CAST(0x0000AB58017BDD33 AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (17, 8, NULL, N'furbaby.jpg', CAST(0x0000AB58017D78AF AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (18, 8, NULL, N'furbaby1.jpg', CAST(0x0000AB58017D806E AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (19, 9, NULL, N'mickiemouse shirt.jpg', CAST(0x0000AB58017EFB20 AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (20, 9, NULL, N'mickiemouseshirt1.jpg', CAST(0x0000AB58017F0232 AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (21, 10, NULL, N'multicolor2.jpg', CAST(0x0000AB58017FCE10 AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (22, 10, NULL, N'multicolor shirt.jpg', CAST(0x0000AB58017FD51A AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (23, 11, NULL, N'pink halfsleeve.jpg', CAST(0x0000AB58018100BD AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (24, 11, NULL, N'pink halfsleeve1.jpg', CAST(0x0000AB5801810992 AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (25, 12, NULL, N'purpleshirt.jpg', CAST(0x0000AB58018196EB AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (26, 12, NULL, N'purpleshirt1.jpg', CAST(0x0000AB5801819FB0 AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (27, 13, NULL, N'tealbllue hoodie1.jpg', CAST(0x0000AB5801830E88 AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (28, 13, NULL, N'tealblue hoodie.jpg', CAST(0x0000AB58018315EF AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (29, 14, NULL, N'wiinerwinner shirt.jpg', CAST(0x0000AB5801843A8D AS DateTime), NULL, N'')
INSERT [dbo].[Product_Image_Master] ([Procut_image_ID], [Product_ID], [Product_image], [Image_name], [Created_date], [Updated_date], [AlterText]) VALUES (30, 14, NULL, N'winnerwinner shirt2.jpg', CAST(0x0000AB58018441B7 AS DateTime), NULL, N'')
SET IDENTITY_INSERT [dbo].[Product_Image_Master] OFF
SET IDENTITY_INSERT [dbo].[Product_Master] ON 

INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (1, N'Petsworld Denim Wear Patched blue Jacket for Dogs', N'Our blue vests are made from hard wearing 12 oz vintage look denim with added stretch for comfort. ', N'Our blue vests are made from hard wearing 12 oz vintage look denim with added stretch for comfort. Our vests are double stitched to last, with custom Pethaus pack brass dome fasteners and cotton lining for extra comfort.These jackets come with a built in harness hole which hides under the collar.', CAST(0x0000AB5801737DD1 AS DateTime), CAST(0x0000AB580174E7DD AS DateTime), 1, 1, 1, CAST(670.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (2, N'Dog green Jacket / Denim Dog Coat', N'Our green vests are made from hard wearing 12 oz vintage look denim with added stretch for comfort.', N'Our green vests are made from hard wearing 12 oz vintage look denim with added stretch for comfort. Our vests are double stitched to last, with custom Pethaus pack brass dome fasteners and cotton lining for extra comfort.These jackets come with a built in harness hole which hides under the collar.

These aren''t any ordinary denim dog vest. The original and the best quality our vests have been designed by us to fit comfortably on breeds of all sizes and shapes. But most importantly to last just like your favourite denim. Show em'' who''s boss at the park!', CAST(0x0000AB580175CFB7 AS DateTime), NULL, 1, 1, 1, CAST(680.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (3, N'Larg Dog Red Denim Jacket', N'Bring out your dog''s inner Rocker with our PetHaus patched Battle Jackets. We''ve designed dog-centric rock patches, all you have to do is choose your dogs size.', N'?Made from hard wearing 12 oz vintage look denim with added stretch for comfort. Our vests are double stitched to last, with custom Pethaus pack brass dome fasteners and cotton lining for extra comfort.These jackets come with a built in harness hole which hides under the collar.

These aren''t any ordinary denim dog vest. The original and the best quality our vests have been designed by us to fit comfortably on breeds of all sizes and shapes.', CAST(0x0000AB5801766FE6 AS DateTime), NULL, 1, 1, 1, CAST(1110.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (4, N'Dog Pink Jacket / Denim Dog Coat', N'Sphynx clothes | Dog clothing | Small Dog Clothes | Denim Jeans Jacket for Dog | Personalized Denim Jeans Jacket for Dogs | Free Shipping', N'Blue personalized denim jeans jackets for dogs, warm and comfortable. Hypoallergenic, breathable fabrics. Available in blue XS, SMALL, and medium. Personalization includes 1st letter of pet’s name.

All of our cats’ and dogs’ clothes are handmade. We use high quality, hypoallergenic, breathable fabrics, strong and stretchy threads.', CAST(0x0000AB580177243E AS DateTime), NULL, 1, 1, 1, CAST(720.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (5, N'Best Furry Friend (BFF) Shirt for Dog', N'Fur Baby Dog Shirt, NEW COLORS! - 17 Colors 10 Sizes Dog Raglan or Tank, Typography Black & White Cute Custom Baseball T-Shirt for Dogs', N'It''s no secret that dog mamas everywhere are proud of their four legged children, so much so that they refer to them as their beloved fur babies! We figured there should be a shirt especially for these irreplaceable family members and their humans, so we made these special tee sets!', CAST(0x0000AB5801788764 AS DateTime), NULL, 1, 1, 2, CAST(850.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (6, N'Duck Shirt For Dog', N'Due to the love of our dogs and the pleasure they bring us, we have created Duck Dog Clothing Company. ', N'', CAST(0x0000AB580179CA06 AS DateTime), NULL, 1, 1, 2, CAST(550.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (7, N'Dog T Shirt Blue Freak Out For Large Dogs', N'Dog clothes | Dog clothing | Small Dog Clothes | T Shirt for Dog | Personalized T Shirt for Dogs | Free Shipping', N'', CAST(0x0000AB58017BBC86 AS DateTime), NULL, 1, 1, 2, CAST(550.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (8, N'Furendi Jacket For Dog', N'Ultra plush interior to keep your furbabys warm this winter. Sizing up is recommended ', N'', CAST(0x0000AB58017D5A01 AS DateTime), NULL, 1, 1, 2, CAST(450.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (9, N'Jakks Pacific Mickey Mouse Dog Sweatshirt', N'Our red vests are made from hard wearing 12 oz vintage look good with added stretch for comfort.', N'', CAST(0x0000AB58017EBE5A AS DateTime), NULL, 1, 1, 2, CAST(350.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (10, N'LovinPet Large Dog Pajamas', N'LovinPet Large Dog Pajamas/Cotton Big Dogs PJS/Pink Red and Green Stripes Dog Shirt/4-Legs Design/Full Body Coverage Protection/for Big Dogs/Pitbull Shirt/Bulldog Pajamas/Boxer Pajamas', N'GREAT DESIGN FOR PIT BULLS AND SIMILAR BREEDS: large short haired breeds like Pitbull, Labrador Retriever, German Shorthaired Pointer, Bulldog, Beagle
100% COTTON DOG PJS SAFETY: Cotton materials do not irritate the skin like polyester, wool, nylon, denim or other artificial or rough fibers. They do not cause skin irritation, dermatitis and itching or some infectious diseases. After surgery, pure cotton is more suitable for dogs. Large dog pyjamas are excellent protection for SKIN CONDITIONS, HOT SPOTS & ALLERGIES.', CAST(0x0000AB58017FB198 AS DateTime), NULL, 1, 1, 2, CAST(350.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (11, N'Pink Half Sleeve For Dog', N'Pink Half Sleeve For Dog', N'', CAST(0x0000AB580180E987 AS DateTime), NULL, 1, 1, 2, CAST(380.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (12, N'WEONE Dog Striped Cotton T-Shirts,Pet Breathable Soft Basic Vest', N'Dog cotton t-shirt is made of 95% cotton and 5% polyster,light weight soft material will keep them from overheating', N'Dog breathable shirts is high elasticity and pretty well made, won''t tight your baby,hold up well after washing and drying
Pet classic striped vest shirt is designed for daily wear,basic wear,very cute and always in style
For medium dogs,reference weight from 17lbs to 21 lbs
Package include 2pcs,1*Green-Blue striped shirt and 1*Pink-Rose striped shirt', CAST(0x0000AB5801817DE9 AS DateTime), NULL, 1, 1, 2, CAST(700.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (13, N'Dog Teal Blue Coat Fleece Dog Hoodie Warm Dog Jacket', N'CLASSIC - Comfortable casual sports hoodie,Pet Hoodie Clothes is Cute and Adorable Clothes for your lovely sweet pet, make your pet become more attractive', N'', CAST(0x0000AB580183008D AS DateTime), NULL, 1, 1, 2, CAST(490.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product_Master] ([Product_ID], [Product_Title], [Product_short_description], [Product_long_description], [Created_date], [Updated_date], [Category_ID], [SubCategory_ID], [ThirdCategory_ID], [Product_Price], [IsHotProduct]) VALUES (14, N'Winerwinner Shirt For Dogs', N'CLASSIC - Comfortable casual sports hoodie,Pet Hoodie Clothes is Cute and Adorable winter Clothes for your lovely sweet pet, make your pet become more attractive', N'', CAST(0x0000AB5801842E10 AS DateTime), NULL, 1, 1, 2, CAST(660.00 AS Decimal(18, 2)), 0)
SET IDENTITY_INSERT [dbo].[Product_Master] OFF
SET IDENTITY_INSERT [dbo].[SubCategory_Master] ON 

INSERT [dbo].[SubCategory_Master] ([SubCategory_ID], [SubCategory_Name], [Category_ID], [IsDeleted], [Image], [IsHomePage], [ImageName], [Sortable], [Heading], [Description], [Page_Image], [Page_Image_Name], [AlterText]) VALUES (1, N'Clothes', 1, 0, NULL, 1, N'DogClothes.jpg', CAST(10 AS Numeric(18, 0)), N'Dog clothes', N'Dog clothes are made to be either functional or for show. Functional dog clothes are for protection from the elements and allergens.', NULL, N'HeaderImageDog.jpg', N'')
INSERT [dbo].[SubCategory_Master] ([SubCategory_ID], [SubCategory_Name], [Category_ID], [IsDeleted], [Image], [IsHomePage], [ImageName], [Sortable], [Heading], [Description], [Page_Image], [Page_Image_Name], [AlterText]) VALUES (2, N'Dog Food', 1, 0, NULL, 1, N'DogFoodCategory.jpg', CAST(9 AS Numeric(18, 0)), N'Dog Food', N'While the exact composition of dog food varies widely from one manufacturer to another, dog food generally is made up of meats, meat byproducts, cereals, grains, vitamins, and minerals.', NULL, N'DogFoodHeader.png', N'')
INSERT [dbo].[SubCategory_Master] ([SubCategory_ID], [SubCategory_Name], [Category_ID], [IsDeleted], [Image], [IsHomePage], [ImageName], [Sortable], [Heading], [Description], [Page_Image], [Page_Image_Name], [AlterText]) VALUES (3, N'Health Care', 1, 0, NULL, 1, N'DogHealthCare.jpg', CAST(8 AS Numeric(18, 0)), N'Health Care of Dogs', N'Routine Health Care of Dogs. In addition to feeding and exercising your dog, other aspects of general care are needed to keep your dog healthy throughout its life.', NULL, N'DogHealthCareHeader.jpg', N'')
INSERT [dbo].[SubCategory_Master] ([SubCategory_ID], [SubCategory_Name], [Category_ID], [IsDeleted], [Image], [IsHomePage], [ImageName], [Sortable], [Heading], [Description], [Page_Image], [Page_Image_Name], [AlterText]) VALUES (4, N'Supplies', 1, 0, NULL, 1, N'DogSuppliesCategory.jpg', CAST(7 AS Numeric(18, 0)), N'Dog Supplies', N'A pet shop or pet store is a retail business which sells different kinds of animals to the public. A variety of animal supplies and pet accessories are also sold in pet shops.', NULL, N'DogSuppliesHeader.jpg', N'')
INSERT [dbo].[SubCategory_Master] ([SubCategory_ID], [SubCategory_Name], [Category_ID], [IsDeleted], [Image], [IsHomePage], [ImageName], [Sortable], [Heading], [Description], [Page_Image], [Page_Image_Name], [AlterText]) VALUES (5, N'Cat Clothes', 2, 0, NULL, 1, N'CatClotheCategory.jpg', CAST(6 AS Numeric(18, 0)), N'Cat Clothes', N'', NULL, N'catHeader.png', N'')
INSERT [dbo].[SubCategory_Master] ([SubCategory_ID], [SubCategory_Name], [Category_ID], [IsDeleted], [Image], [IsHomePage], [ImageName], [Sortable], [Heading], [Description], [Page_Image], [Page_Image_Name], [AlterText]) VALUES (6, N'Cat Food', 2, 0, NULL, 1, N'CatFoodCategory.jpg', CAST(5 AS Numeric(18, 0)), N'Cat Food', N'Pet food is a specialty food for domesticated animals that is formulated according to their nutritional needs. Pet food generally consists of meat, meat byproducts, cereals, grain, vitamins, and minerals.', NULL, N'CatFoodHeader.jpg', N'')
INSERT [dbo].[SubCategory_Master] ([SubCategory_ID], [SubCategory_Name], [Category_ID], [IsDeleted], [Image], [IsHomePage], [ImageName], [Sortable], [Heading], [Description], [Page_Image], [Page_Image_Name], [AlterText]) VALUES (7, N'Health Care', 2, 0, NULL, 1, N'CatHealthCare.jpg', CAST(4 AS Numeric(18, 0)), N'Cat Health Care', N'Proactive health measures to be taken to keep your cat healthy. Visit our page & understand the various health needs of your cat. Healthy & Shiny Coat. High Moisture Content.', NULL, N'CatHealthCareHeader.jpg', N'')
INSERT [dbo].[SubCategory_Master] ([SubCategory_ID], [SubCategory_Name], [Category_ID], [IsDeleted], [Image], [IsHomePage], [ImageName], [Sortable], [Heading], [Description], [Page_Image], [Page_Image_Name], [AlterText]) VALUES (8, N'Supplies', 2, 0, NULL, 1, N'CatSupplyCategory.jpg', CAST(3 AS Numeric(18, 0)), N'Cat Supplies', N'', NULL, N'CatSuppliesHeader.jpg', N'')
INSERT [dbo].[SubCategory_Master] ([SubCategory_ID], [SubCategory_Name], [Category_ID], [IsDeleted], [Image], [IsHomePage], [ImageName], [Sortable], [Heading], [Description], [Page_Image], [Page_Image_Name], [AlterText]) VALUES (9, N'Fish Food', 3, 0, NULL, 1, N'FishFoodCategory.jpg', CAST(2 AS Numeric(18, 0)), N'Fish Food', N'', NULL, N'FishFoodHeader.jpg', N'')
INSERT [dbo].[SubCategory_Master] ([SubCategory_ID], [SubCategory_Name], [Category_ID], [IsDeleted], [Image], [IsHomePage], [ImageName], [Sortable], [Heading], [Description], [Page_Image], [Page_Image_Name], [AlterText]) VALUES (10, N'Supplies', 3, 0, NULL, 1, N'FishSuppliesCategory.jpg', CAST(1 AS Numeric(18, 0)), N'Fish Supplies', N'', NULL, N'', N'')
SET IDENTITY_INSERT [dbo].[SubCategory_Master] OFF
SET IDENTITY_INSERT [dbo].[ThirdCategory_Master] ON 

INSERT [dbo].[ThirdCategory_Master] ([ThirdCategory_ID], [SubCategory_ID], [ThirdCategory_Name]) VALUES (1, 1, N'Jackets')
INSERT [dbo].[ThirdCategory_Master] ([ThirdCategory_ID], [SubCategory_ID], [ThirdCategory_Name]) VALUES (2, 1, N'Shirts')
INSERT [dbo].[ThirdCategory_Master] ([ThirdCategory_ID], [SubCategory_ID], [ThirdCategory_Name]) VALUES (3, 1, N'Sweaters')
INSERT [dbo].[ThirdCategory_Master] ([ThirdCategory_ID], [SubCategory_ID], [ThirdCategory_Name]) VALUES (4, 2, N'Dry Food')
INSERT [dbo].[ThirdCategory_Master] ([ThirdCategory_ID], [SubCategory_ID], [ThirdCategory_Name]) VALUES (5, 2, N'Gravy Food')
INSERT [dbo].[ThirdCategory_Master] ([ThirdCategory_ID], [SubCategory_ID], [ThirdCategory_Name]) VALUES (6, 2, N'Treats and chews')
INSERT [dbo].[ThirdCategory_Master] ([ThirdCategory_ID], [SubCategory_ID], [ThirdCategory_Name]) VALUES (7, 6, N'Dry Food')
INSERT [dbo].[ThirdCategory_Master] ([ThirdCategory_ID], [SubCategory_ID], [ThirdCategory_Name]) VALUES (8, 6, N'Wet Food')
INSERT [dbo].[ThirdCategory_Master] ([ThirdCategory_ID], [SubCategory_ID], [ThirdCategory_Name]) VALUES (9, 6, N'Gravy Food')
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
