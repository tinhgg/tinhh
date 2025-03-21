USE [master]
GO
/****** Object:  Database [quan_ly_dat_hang]    Script Date: 13/03/2025 11:10:24 CH ******/

/*
CREATE DATABASE quan_ly_dat_hang

 CONTAINMENT = NONE

 ON  PRIMARY 

( NAME = N'quan_ly_dat_hang', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\quan_ly_dat_hang.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )

 LOG ON 

( NAME = N'quan_ly_dat_hang_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\quan_ly_dat_hang_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )

 WITH CATALOG_COLLATION = DATABASE_DEFAULT

GO
*/

-- Fixed with auto path

DECLARE @data_path NVARCHAR(256);
DECLARE @log_path NVARCHAR(256);

-- Get the default data and log paths from the SQL Server instance
SET @data_path = CAST(SERVERPROPERTY('InstanceDefaultDataPath') AS NVARCHAR(256));
SET @log_path = CAST(SERVERPROPERTY('InstanceDefaultLogPath') AS NVARCHAR(256));

-- Declare a variable to hold the dynamic SQL statement
DECLARE @sql NVARCHAR(MAX);

-- Construct the CREATE DATABASE statement with dynamic paths
SET @sql = N'
CREATE DATABASE quan_ly_dat_hang
CONTAINMENT = NONE
ON PRIMARY
( NAME = N''quan_ly_dat_hang'', FILENAME = N''' + @data_path + 'quan_ly_dat_hang.mdf'' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
LOG ON
( NAME = N''quan_ly_dat_hang_log'', FILENAME = N''' + @log_path + 'quan_ly_dat_hang_log.ldf'' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
WITH CATALOG_COLLATION = DATABASE_DEFAULT
';

-- Execute the dynamic SQL
EXEC sp_executesql @sql;

GO
ALTER DATABASE [quan_ly_dat_hang] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [quan_ly_dat_hang].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [quan_ly_dat_hang] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [quan_ly_dat_hang] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [quan_ly_dat_hang] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [quan_ly_dat_hang] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [quan_ly_dat_hang] SET ARITHABORT OFF 
GO
ALTER DATABASE [quan_ly_dat_hang] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [quan_ly_dat_hang] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [quan_ly_dat_hang] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [quan_ly_dat_hang] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [quan_ly_dat_hang] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [quan_ly_dat_hang] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [quan_ly_dat_hang] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [quan_ly_dat_hang] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [quan_ly_dat_hang] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [quan_ly_dat_hang] SET  DISABLE_BROKER 
GO
ALTER DATABASE [quan_ly_dat_hang] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [quan_ly_dat_hang] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [quan_ly_dat_hang] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [quan_ly_dat_hang] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [quan_ly_dat_hang] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [quan_ly_dat_hang] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [quan_ly_dat_hang] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [quan_ly_dat_hang] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [quan_ly_dat_hang] SET  MULTI_USER 
GO
ALTER DATABASE [quan_ly_dat_hang] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [quan_ly_dat_hang] SET DB_CHAINING OFF 
GO
ALTER DATABASE [quan_ly_dat_hang] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [quan_ly_dat_hang] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [quan_ly_dat_hang] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [quan_ly_dat_hang] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [quan_ly_dat_hang] SET QUERY_STORE = OFF
GO
USE [quan_ly_dat_hang]
GO
/****** Object:  Table [dbo].[delivery_details]    Script Date: 13/03/2025 11:10:25 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[delivery_details](
	[delivery_detail_id] [int] NOT NULL,
	[delivery_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[delivery_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[delivery_notes]    Script Date: 13/03/2025 11:10:25 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[delivery_notes](
	[delivery_id] [int] NOT NULL,
	[order_id] [int] NOT NULL,
	[delivery_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[delivery_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_details]    Script Date: 13/03/2025 11:10:25 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_details](
	[order_detail_id] [int] NOT NULL,
	[order_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NULL,
	[price] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[order_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 13/03/2025 11:10:25 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[order_id] [int] NOT NULL,
	[supplier_id] [int] NOT NULL,
	[order_date] [date] NULL,
	[notes] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 13/03/2025 11:10:25 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[product_id] [int] NOT NULL,
	[name] [varchar](255) NULL,
	[unit] [varchar](50) NULL,
	[specification] [text] NULL,
	[stock] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[suppliers]    Script Date: 13/03/2025 11:10:25 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[suppliers](
	[supplier_id] [int] NOT NULL,
	[name] [varchar](255) NULL,
	[address] [varchar](255) NULL,
	[phone] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[supplier_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [idx_delivery_notes_date]    Script Date: 13/03/2025 11:10:25 CH ******/
CREATE NONCLUSTERED INDEX [idx_delivery_notes_date] ON [dbo].[delivery_notes]
(
	[delivery_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_order_details_product]    Script Date: 13/03/2025 11:10:25 CH ******/
CREATE NONCLUSTERED INDEX [idx_order_details_product] ON [dbo].[order_details]
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_orders_date]    Script Date: 13/03/2025 11:10:25 CH ******/
CREATE NONCLUSTERED INDEX [idx_orders_date] ON [dbo].[orders]
(
	[order_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_orders_supplier]    Script Date: 13/03/2025 11:10:25 CH ******/
CREATE NONCLUSTERED INDEX [idx_orders_supplier] ON [dbo].[orders]
(
	[supplier_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_suppliers_phone]    Script Date: 13/03/2025 11:10:25 CH ******/
CREATE UNIQUE NONCLUSTERED INDEX [idx_suppliers_phone] ON [dbo].[suppliers]
(
	[phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[delivery_details]  WITH CHECK ADD FOREIGN KEY([delivery_id])
REFERENCES [dbo].[delivery_notes] ([delivery_id])
GO
ALTER TABLE [dbo].[delivery_details]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([product_id])
GO
ALTER TABLE [dbo].[delivery_notes]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([order_id])
GO
ALTER TABLE [dbo].[order_details]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([order_id])
GO
ALTER TABLE [dbo].[order_details]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([product_id])
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([supplier_id])
REFERENCES [dbo].[suppliers] ([supplier_id])
GO
/****** Object:  StoredProcedure [dbo].[AddProduct]    Script Date: 13/03/2025 11:10:25 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddProduct]
    @ProductID INT,
    @ProductName VARCHAR(255),
    @Unit VARCHAR(50),
    @Specification TEXT,
    @Stock INT
AS
BEGIN
    INSERT INTO products (product_id, name, unit, specification, stock)
    VALUES (@ProductID, @ProductName, @Unit, @Specification, @Stock);
END;
GO
/****** Object:  StoredProcedure [dbo].[DeleteOrder]    Script Date: 13/03/2025 11:10:25 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteOrder]
    @OrderID INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM delivery_notes WHERE order_id = @OrderID)
    BEGIN
        DELETE FROM order_details WHERE order_id = @OrderID;
        DELETE FROM orders WHERE order_id = @OrderID;
    END;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetAllProducts]    Script Date: 13/03/2025 11:10:25 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllProducts]
AS
BEGIN
    SELECT * FROM products;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetOrdersBySupplier]    Script Date: 13/03/2025 11:10:25 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetOrdersBySupplier]
    @SupplierID INT
AS
BEGIN
    SELECT * FROM orders WHERE supplier_id = @SupplierID;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetTotalOrdersBySupplier]    Script Date: 13/03/2025 11:10:25 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTotalOrdersBySupplier]
    @SupplierID INT,
    @TotalOrders INT OUTPUT
AS
BEGIN
    SELECT @TotalOrders = COUNT(*) FROM orders WHERE supplier_id = @SupplierID;
END;
GO
USE [master]
GO
ALTER DATABASE [quan_ly_dat_hang] SET  READ_WRITE 
GO
