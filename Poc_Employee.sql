USE [master]
GO
/****** Object:  Database [Poc_Client]    Script Date: 16-01-2024 22:40:05 ******/
CREATE DATABASE [Poc_Client]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Poc_Client', FILENAME = N'C:\Users\vijay\Poc_Client.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Poc_Client_log', FILENAME = N'C:\Users\vijay\Poc_Client_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Poc_Client] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Poc_Client].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Poc_Client] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Poc_Client] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Poc_Client] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Poc_Client] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Poc_Client] SET ARITHABORT OFF 
GO
ALTER DATABASE [Poc_Client] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Poc_Client] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Poc_Client] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Poc_Client] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Poc_Client] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Poc_Client] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Poc_Client] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Poc_Client] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Poc_Client] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Poc_Client] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Poc_Client] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Poc_Client] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Poc_Client] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Poc_Client] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Poc_Client] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Poc_Client] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Poc_Client] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Poc_Client] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Poc_Client] SET  MULTI_USER 
GO
ALTER DATABASE [Poc_Client] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Poc_Client] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Poc_Client] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Poc_Client] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Poc_Client] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Poc_Client] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Poc_Client] SET QUERY_STORE = OFF
GO
USE [Poc_Client]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 16-01-2024 22:40:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 16-01-2024 22:40:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[DepartmentId] [int] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([Id], [Name]) VALUES (1, N'HR')
INSERT [dbo].[Department] ([Id], [Name]) VALUES (2, N'IT')
INSERT [dbo].[Department] ([Id], [Name]) VALUES (3, N'Sales')
INSERT [dbo].[Department] ([Id], [Name]) VALUES (4, N'Finance')
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Department]
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteDepartment]    Script Date: 16-01-2024 22:40:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[sp_DeleteDepartment]
 @Id int
AS
BEGIN
	
	SET NOCOUNT ON;

 DELETE Department
  WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteEmployee]    Script Date: 16-01-2024 22:40:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[sp_DeleteEmployee]
 @Id int
AS
BEGIN
	
	SET NOCOUNT ON;

 DELETE Employee
  WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetDepartmentById]    Script Date: 16-01-2024 22:40:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[sp_GetDepartmentById]
 @Id int
AS
BEGIN
	
	SET NOCOUNT ON;

 SELECT * FROM Department
  WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetDepartments]    Script Date: 16-01-2024 22:40:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GetDepartments]

AS
BEGIN
	
	SET NOCOUNT ON;

   select * from Department
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetEmployeeById]    Script Date: 16-01-2024 22:40:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetEmployeeById]
 @Id int
AS
BEGIN
	
	SET NOCOUNT ON;

  select e.Id ,e.[Name] , DateOfBirth ,d.Name as DepartmentName ,e.DepartmentId  from Employee e inner join Department d on e.DepartmentId = d.Id
  WHERE e.Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetEmployees]    Script Date: 16-01-2024 22:40:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GetEmployees]

AS
BEGIN
	
	SET NOCOUNT ON;

   select e.Id ,e.[Name] , DateOfBirth ,d.Name as DepartmentName ,e.DepartmentId  from Employee e inner join Department d on e.DepartmentId = d.Id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertDepartment]    Script Date: 16-01-2024 22:40:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_InsertDepartment]
 @Name nvarchar(100)
AS
BEGIN
	
	SET NOCOUNT ON;

  INSERT INTO Department(Name)
  VALUES (@Name)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertEmployee]    Script Date: 16-01-2024 22:40:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_InsertEmployee]
 @Name nvarchar(100),
 @DateOfBirth date,
 @DepartmentId int
AS
BEGIN
	
	SET NOCOUNT ON;

  INSERT INTO Employee(Name , DateOfBirth , DepartmentId)
  VALUES (@Name ,@DateOfBirth , @DepartmentId)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateDepartment]    Script Date: 16-01-2024 22:40:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[sp_UpdateDepartment]
 @Name nvarchar(100),
 @Id int
AS
BEGIN
	
	SET NOCOUNT ON;

  UPDATE Department
  SET [Name] = @Name
  WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateEmployee]    Script Date: 16-01-2024 22:40:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_UpdateEmployee]
 @Name nvarchar(100),
 @DateOfBirth date,
 @DepartmentId int,
 @Id int
AS
BEGIN
	
	SET NOCOUNT ON;

  UPDATE Employee 
  SET NAME = @Name , DateOfBirth = @DateOfBirth , DepartmentId = @DepartmentId
  WHERE Id = @Id
END
GO
USE [master]
GO
ALTER DATABASE [Poc_Client] SET  READ_WRITE 
GO
