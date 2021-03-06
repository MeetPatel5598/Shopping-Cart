USE [master]
GO
/****** Object:  Database [ShoppingDB_VMJP]    Script Date: 8/2/2020 4:01:34 PM ******/
CREATE DATABASE [ShoppingDB_VMJP]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShoppingDB_VMJP', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ShoppingDB_VMJP.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ShoppingDB_VMJP_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ShoppingDB_VMJP_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ShoppingDB_VMJP] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShoppingDB_VMJP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShoppingDB_VMJP] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShoppingDB_VMJP] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShoppingDB_VMJP] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShoppingDB_VMJP] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShoppingDB_VMJP] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShoppingDB_VMJP] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ShoppingDB_VMJP] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShoppingDB_VMJP] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShoppingDB_VMJP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShoppingDB_VMJP] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShoppingDB_VMJP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShoppingDB_VMJP] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShoppingDB_VMJP] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShoppingDB_VMJP] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShoppingDB_VMJP] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ShoppingDB_VMJP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShoppingDB_VMJP] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShoppingDB_VMJP] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShoppingDB_VMJP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShoppingDB_VMJP] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShoppingDB_VMJP] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShoppingDB_VMJP] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShoppingDB_VMJP] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ShoppingDB_VMJP] SET  MULTI_USER 
GO
ALTER DATABASE [ShoppingDB_VMJP] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShoppingDB_VMJP] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShoppingDB_VMJP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShoppingDB_VMJP] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShoppingDB_VMJP] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ShoppingDB_VMJP] SET QUERY_STORE = OFF
GO
USE [ShoppingDB_VMJP]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 8/2/2020 4:01:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[DiscountPercentage] [decimal](10, 2) NULL,
	[IsCustomerCheckedOut] [bit] NULL,
	[QtyOrdered] [int] NOT NULL,
	[FinalProductPrice] [decimal](10, 2) NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 8/2/2020 4:01:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](max) NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NULL,
 CONSTRAINT [PK_Categtory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 8/2/2020 4:01:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](max) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Quantity] [int] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 8/2/2020 4:01:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](max) NOT NULL,
	[PasswordSalt] [varbinary](max) NOT NULL,
	[PasswordHash] [varbinary](max) NOT NULL,
	[Role] [nvarchar](max) NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NULL,
 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [DiscountPercentage], [IsCustomerCheckedOut], [QtyOrdered], [FinalProductPrice], [DateCreated], [DateModified]) VALUES (32, 3, 4, CAST(20.00 AS Decimal(10, 2)), 1, 2, CAST(10.06 AS Decimal(10, 2)), CAST(N'2020-08-02T17:48:18.1323737' AS DateTime2), CAST(N'2020-08-02T19:39:44.0687231' AS DateTime2))
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [DiscountPercentage], [IsCustomerCheckedOut], [QtyOrdered], [FinalProductPrice], [DateCreated], [DateModified]) VALUES (33, 3, 9, CAST(20.00 AS Decimal(10, 2)), 1, 1, CAST(44.08 AS Decimal(10, 2)), CAST(N'2020-08-02T17:48:25.8885835' AS DateTime2), CAST(N'2020-08-02T19:40:58.6012366' AS DateTime2))
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [DiscountPercentage], [IsCustomerCheckedOut], [QtyOrdered], [FinalProductPrice], [DateCreated], [DateModified]) VALUES (34, 3, 8, CAST(20.00 AS Decimal(10, 2)), 1, 3, CAST(58.01 AS Decimal(10, 2)), CAST(N'2020-08-02T17:48:30.0704936' AS DateTime2), CAST(N'2020-08-02T19:40:58.6140885' AS DateTime2))
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [DiscountPercentage], [IsCustomerCheckedOut], [QtyOrdered], [FinalProductPrice], [DateCreated], [DateModified]) VALUES (35, 4, 6, CAST(20.00 AS Decimal(10, 2)), 0, 1, CAST(54.14 AS Decimal(10, 2)), CAST(N'2020-08-02T20:00:12.6464344' AS DateTime2), CAST(N'2020-08-02T20:00:12.6464344' AS DateTime2))
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [DiscountPercentage], [IsCustomerCheckedOut], [QtyOrdered], [FinalProductPrice], [DateCreated], [DateModified]) VALUES (36, 4, 8, CAST(20.00 AS Decimal(10, 2)), 0, 1, CAST(19.34 AS Decimal(10, 2)), CAST(N'2020-08-02T20:00:16.3035867' AS DateTime2), CAST(N'2020-08-02T20:00:16.3035867' AS DateTime2))
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [DiscountPercentage], [IsCustomerCheckedOut], [QtyOrdered], [FinalProductPrice], [DateCreated], [DateModified]) VALUES (37, 5, 4, CAST(20.00 AS Decimal(10, 2)), 0, 1, CAST(10.06 AS Decimal(10, 2)), CAST(N'2020-08-02T20:00:31.4764366' AS DateTime2), CAST(N'2020-08-02T20:00:31.4764366' AS DateTime2))
INSERT [dbo].[Cart] ([Id], [UserId], [ProductId], [DiscountPercentage], [IsCustomerCheckedOut], [QtyOrdered], [FinalProductPrice], [DateCreated], [DateModified]) VALUES (38, 5, 1, CAST(20.00 AS Decimal(10, 2)), 0, 1, CAST(4.00 AS Decimal(10, 2)), CAST(N'2020-08-02T20:00:35.2428471' AS DateTime2), CAST(N'2020-08-02T20:00:35.2428471' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Cart] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [CategoryName], [DateCreated], [DateModified]) VALUES (1, N'Food', CAST(N'2020-07-29T23:27:14.9200000' AS DateTime2), NULL)
INSERT [dbo].[Category] ([Id], [CategoryName], [DateCreated], [DateModified]) VALUES (2, N'Beauty', CAST(N'2020-07-29T23:27:29.0800000' AS DateTime2), NULL)
INSERT [dbo].[Category] ([Id], [CategoryName], [DateCreated], [DateModified]) VALUES (3, N'Kids', CAST(N'2020-07-29T23:27:37.0200000' AS DateTime2), NULL)
INSERT [dbo].[Category] ([Id], [CategoryName], [DateCreated], [DateModified]) VALUES (4, N'Sports', CAST(N'2020-07-29T23:27:44.7333333' AS DateTime2), NULL)
INSERT [dbo].[Category] ([Id], [CategoryName], [DateCreated], [DateModified]) VALUES (5, N'Clothing', CAST(N'2020-07-29T23:27:57.9866667' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [ProductName], [CategoryId], [Price], [Description], [Quantity], [DateCreated], [DateModified]) VALUES (1, N'Pringles BBQ', 1, CAST(5.00 AS Decimal(10, 2)), N'Tasty Baked wafers with BBQ flavour', 4, CAST(N'2020-07-29T00:00:00.0000000' AS DateTime2), CAST(N'2020-08-02T20:00:35.2465797' AS DateTime2))
INSERT [dbo].[Products] ([Id], [ProductName], [CategoryId], [Price], [Description], [Quantity], [DateCreated], [DateModified]) VALUES (2, N'Ah! Choy! Cookies', 1, CAST(2.32 AS Decimal(10, 2)), N'Freshly baked cookies', 13, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Products] ([Id], [ProductName], [CategoryId], [Price], [Description], [Quantity], [DateCreated], [DateModified]) VALUES (3, N'Basmati Rice', 1, CAST(19.30 AS Decimal(10, 2)), N'Best Rice in world', 20, CAST(N'2020-07-10T00:00:00.0000000' AS DateTime2), CAST(N'2020-08-02T18:48:11.2121641' AS DateTime2))
INSERT [dbo].[Products] ([Id], [ProductName], [CategoryId], [Price], [Description], [Quantity], [DateCreated], [DateModified]) VALUES (4, N'Garnier Face Wash', 2, CAST(12.57 AS Decimal(10, 2)), N'Figths Acne', 52, CAST(N'2020-07-20T00:00:00.0000000' AS DateTime2), CAST(N'2020-08-02T20:00:31.4786436' AS DateTime2))
INSERT [dbo].[Products] ([Id], [ProductName], [CategoryId], [Price], [Description], [Quantity], [DateCreated], [DateModified]) VALUES (5, N'Nivea Body Lotion', 2, CAST(24.68 AS Decimal(10, 2)), N'Keeps skin moistured', 17, CAST(N'2020-07-22T00:00:00.0000000' AS DateTime2), CAST(N'2020-08-02T19:27:31.0864025' AS DateTime2))
INSERT [dbo].[Products] ([Id], [ProductName], [CategoryId], [Price], [Description], [Quantity], [DateCreated], [DateModified]) VALUES (6, N'Head and Arm Protector', 4, CAST(67.68 AS Decimal(10, 2)), N'Protects your arms and head while riding bicycle', 30, CAST(N'2020-07-22T00:00:00.0000000' AS DateTime2), CAST(N'2020-08-02T20:00:12.6540258' AS DateTime2))
INSERT [dbo].[Products] ([Id], [ProductName], [CategoryId], [Price], [Description], [Quantity], [DateCreated], [DateModified]) VALUES (8, N'Star Wars Yoda', 3, CAST(24.17 AS Decimal(10, 2)), N'Special collectible for kids', 18, CAST(N'2020-07-19T00:00:00.0000000' AS DateTime2), CAST(N'2020-08-02T20:00:16.3079680' AS DateTime2))
INSERT [dbo].[Products] ([Id], [ProductName], [CategoryId], [Price], [Description], [Quantity], [DateCreated], [DateModified]) VALUES (9, N'Denim Jeans', 5, CAST(55.10 AS Decimal(10, 2)), N'Denim Jeans', 98, CAST(N'2020-07-29T00:00:00.0000000' AS DateTime2), CAST(N'2020-08-02T19:40:58.6118103' AS DateTime2))
INSERT [dbo].[Products] ([Id], [ProductName], [CategoryId], [Price], [Description], [Quantity], [DateCreated], [DateModified]) VALUES (10, N'Floral Shirt', 5, CAST(25.00 AS Decimal(10, 2)), N'Outstanding designed shirt', 15, CAST(N'2020-12-07T00:00:00.0000000' AS DateTime2), CAST(N'2020-08-02T18:50:38.5106777' AS DateTime2))
INSERT [dbo].[Products] ([Id], [ProductName], [CategoryId], [Price], [Description], [Quantity], [DateCreated], [DateModified]) VALUES (11, N'French Vanilla', 1, CAST(2.05 AS Decimal(10, 2)), N'Winter drink', 5, CAST(N'2020-10-07T00:00:00.0000000' AS DateTime2), CAST(N'2020-08-02T19:31:27.3611239' AS DateTime2))
INSERT [dbo].[Products] ([Id], [ProductName], [CategoryId], [Price], [Description], [Quantity], [DateCreated], [DateModified]) VALUES (12, N'Whimsical Wheel', 3, CAST(12.05 AS Decimal(10, 2)), N'Toy having sound tracking', 5, CAST(N'2020-10-07T00:00:00.0000000' AS DateTime2), CAST(N'2020-08-02T19:31:24.7439971' AS DateTime2))
INSERT [dbo].[Products] ([Id], [ProductName], [CategoryId], [Price], [Description], [Quantity], [DateCreated], [DateModified]) VALUES (14, N'Hot Chocolate', 1, CAST(3.00 AS Decimal(10, 2)), N'Winter drink', 3, CAST(N'2020-03-07T00:00:00.0000000' AS DateTime2), CAST(N'2020-08-02T19:38:38.5938436' AS DateTime2))
INSERT [dbo].[Products] ([Id], [ProductName], [CategoryId], [Price], [Description], [Quantity], [DateCreated], [DateModified]) VALUES (15, N'BBQ Rice Crackers', 1, CAST(15.00 AS Decimal(10, 2)), N'Salty and Baked', 10, CAST(N'2020-07-16T00:00:00.0000000' AS DateTime2), CAST(N'2020-08-02T19:38:40.4777265' AS DateTime2))
INSERT [dbo].[Products] ([Id], [ProductName], [CategoryId], [Price], [Description], [Quantity], [DateCreated], [DateModified]) VALUES (16, N'Cheese Macaroni', 1, CAST(1.50 AS Decimal(10, 2)), N'Cheesy Macaroniiiii', 20, CAST(N'2020-12-07T00:00:00.0000000' AS DateTime2), CAST(N'2020-08-02T19:38:41.4712218' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [UserName], [PasswordSalt], [PasswordHash], [Role], [DateCreated], [DateModified]) VALUES (2, N'admin', 0xB7D68112F70C17E9D5F5E5AFFDDBE3287DFB4792AD26DB38FF49FA73770F6DF4, 0xF554F729D39BA7A78533160336BE3CF8860BCDB8198561D23D36540875C5F183, N'Admin', CAST(N'2020-08-01T05:59:26.9408478' AS DateTime2), CAST(N'2020-08-01T08:01:08.9467065' AS DateTime2))
INSERT [dbo].[Users] ([Id], [UserName], [PasswordSalt], [PasswordHash], [Role], [DateCreated], [DateModified]) VALUES (3, N'Vatsal', 0x24ABDF8F6A0AA3A4C42DEEA6B50E511C53DDD9A88154BBD8265CF30FB84421D4, 0xDC6AAD43D63D743244DFC2F9E5EF6471635D7B6AA2FCC833D5FAD370567D36C9, N'Customer', CAST(N'2020-08-01T06:31:27.7930678' AS DateTime2), CAST(N'2020-08-01T08:32:46.4680697' AS DateTime2))
INSERT [dbo].[Users] ([Id], [UserName], [PasswordSalt], [PasswordHash], [Role], [DateCreated], [DateModified]) VALUES (4, N'janki', 0xE447A004493E5B453DF332082DDC5045001D4540AD7C65A91C22B5B00C7CD345, 0x0B892152C6F1DCC1E0FFCD77567448674A258A2BF78603DFEE775AB99C4C84AD, N'Customer', CAST(N'2020-08-02T19:59:41.0086398' AS DateTime2), CAST(N'2020-08-02T19:59:41.0086398' AS DateTime2))
INSERT [dbo].[Users] ([Id], [UserName], [PasswordSalt], [PasswordHash], [Role], [DateCreated], [DateModified]) VALUES (5, N'meet', 0x21A0A89AB01E1D24291339A6DA7747878265A21FB8271556189D7C23C0AEA3E6, 0x650453E293E324E230460DE249BF49AB0DBE2AD2573B738C800C8BA523CE0E66, N'Customer', CAST(N'2020-08-02T19:59:48.1686486' AS DateTime2), CAST(N'2020-08-02T19:59:48.1686486' AS DateTime2))
INSERT [dbo].[Users] ([Id], [UserName], [PasswordSalt], [PasswordHash], [Role], [DateCreated], [DateModified]) VALUES (6, N'parth', 0x41103B8774A39052FDB711DDE2D39E88B841292CE7F4382DA9B1C676C9BCDEAA, 0xEBF92B5EC417409CC2C1C8571272D2D0E2EAEE7B463336BA0938B325B78E2180, N'Customer', CAST(N'2020-08-02T19:59:54.6544182' AS DateTime2), CAST(N'2020-08-02T19:59:54.6544182' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Login] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Login]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Products]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categtory] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categtory]
GO
USE [master]
GO
ALTER DATABASE [ShoppingDB_VMJP] SET  READ_WRITE 
GO
