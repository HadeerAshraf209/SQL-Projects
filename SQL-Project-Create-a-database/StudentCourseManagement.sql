USE [master]
GO
/****** Object:  Database [StudentCourseManagement]    Script Date: 2024-09-12 10:33:33 PM ******/
CREATE DATABASE [StudentCourseManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StudentCourseManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\StudentCourseManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'StudentCourseManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\StudentCourseManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StudentCourseManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StudentCourseManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StudentCourseManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StudentCourseManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StudentCourseManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StudentCourseManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [StudentCourseManagement] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [StudentCourseManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StudentCourseManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StudentCourseManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StudentCourseManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StudentCourseManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StudentCourseManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StudentCourseManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StudentCourseManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StudentCourseManagement] SET  ENABLE_BROKER 
GO
ALTER DATABASE [StudentCourseManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StudentCourseManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StudentCourseManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StudentCourseManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StudentCourseManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StudentCourseManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StudentCourseManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StudentCourseManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [StudentCourseManagement] SET  MULTI_USER 
GO
ALTER DATABASE [StudentCourseManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StudentCourseManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StudentCourseManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StudentCourseManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StudentCourseManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [StudentCourseManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [StudentCourseManagement] SET QUERY_STORE = ON
GO
ALTER DATABASE [StudentCourseManagement] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [StudentCourseManagement]
GO
/****** Object:  Schema [StudentCourseManagement]    Script Date: 2024-09-12 10:33:33 PM ******/
CREATE SCHEMA [StudentCourseManagement]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 2024-09-12 10:33:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[course_id] [int] IDENTITY(1,1) NOT NULL,
	[course_name] [varchar](100) NULL,
	[course_description] [text] NULL,
	[instructor_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[course_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enrollments]    Script Date: 2024-09-12 10:33:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enrollments](
	[enrollment_id] [int] IDENTITY(1,1) NOT NULL,
	[student_id] [int] NULL,
	[course_id] [int] NULL,
	[enrollment_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[enrollment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Instructors]    Script Date: 2024-09-12 10:33:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructors](
	[instructor_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](50) NULL,
	[last_name] [varchar](50) NULL,
	[email] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[instructor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 2024-09-12 10:33:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[student_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](50) NULL,
	[last_name] [varchar](50) NULL,
	[email] [varchar](100) NULL,
	[date_of_birth] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[student_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([course_id], [course_name], [course_description], [instructor_id]) VALUES (1, N'Introduction to Programming', N'Learn the basics of programming with Python.', 1)
INSERT [dbo].[Courses] ([course_id], [course_name], [course_description], [instructor_id]) VALUES (2, N'Data Structures and Algorithms', N'An in-depth study of data structures and algorithms.', 2)
INSERT [dbo].[Courses] ([course_id], [course_name], [course_description], [instructor_id]) VALUES (3, N'Web Development', N'Building websites and web applications with HTML, CSS, and JavaScript.', 3)
INSERT [dbo].[Courses] ([course_id], [course_name], [course_description], [instructor_id]) VALUES (4, N'Database Management Systems', N'Understanding and managing relational databases.', 3)
INSERT [dbo].[Courses] ([course_id], [course_name], [course_description], [instructor_id]) VALUES (5, N'Machine Learning', N'Introduction to machine learning concepts and techniques.', 1)
SET IDENTITY_INSERT [dbo].[Courses] OFF
GO
SET IDENTITY_INSERT [dbo].[Enrollments] ON 

INSERT [dbo].[Enrollments] ([enrollment_id], [student_id], [course_id], [enrollment_date]) VALUES (1, 4, 3, CAST(N'2023-10-15' AS Date))
INSERT [dbo].[Enrollments] ([enrollment_id], [student_id], [course_id], [enrollment_date]) VALUES (2, 2, 2, CAST(N'2023-09-20' AS Date))
INSERT [dbo].[Enrollments] ([enrollment_id], [student_id], [course_id], [enrollment_date]) VALUES (3, 3, 4, CAST(N'2023-09-10' AS Date))
INSERT [dbo].[Enrollments] ([enrollment_id], [student_id], [course_id], [enrollment_date]) VALUES (4, 4, 3, CAST(N'2023-10-25' AS Date))
INSERT [dbo].[Enrollments] ([enrollment_id], [student_id], [course_id], [enrollment_date]) VALUES (5, 5, 1, CAST(N'2023-10-14' AS Date))
INSERT [dbo].[Enrollments] ([enrollment_id], [student_id], [course_id], [enrollment_date]) VALUES (6, 6, 5, CAST(N'2023-09-30' AS Date))
INSERT [dbo].[Enrollments] ([enrollment_id], [student_id], [course_id], [enrollment_date]) VALUES (7, 7, 2, CAST(N'2023-09-22' AS Date))
INSERT [dbo].[Enrollments] ([enrollment_id], [student_id], [course_id], [enrollment_date]) VALUES (8, 8, 3, CAST(N'2023-09-18' AS Date))
INSERT [dbo].[Enrollments] ([enrollment_id], [student_id], [course_id], [enrollment_date]) VALUES (9, 9, 1, CAST(N'2023-09-05' AS Date))
INSERT [dbo].[Enrollments] ([enrollment_id], [student_id], [course_id], [enrollment_date]) VALUES (10, 10, 5, CAST(N'2023-10-01' AS Date))
INSERT [dbo].[Enrollments] ([enrollment_id], [student_id], [course_id], [enrollment_date]) VALUES (11, 4, 2, CAST(N'2023-09-01' AS Date))
INSERT [dbo].[Enrollments] ([enrollment_id], [student_id], [course_id], [enrollment_date]) VALUES (12, 10, 4, CAST(N'2023-10-01' AS Date))
INSERT [dbo].[Enrollments] ([enrollment_id], [student_id], [course_id], [enrollment_date]) VALUES (13, 9, 3, CAST(N'2023-10-01' AS Date))
INSERT [dbo].[Enrollments] ([enrollment_id], [student_id], [course_id], [enrollment_date]) VALUES (14, 4, 5, CAST(N'2023-10-01' AS Date))
INSERT [dbo].[Enrollments] ([enrollment_id], [student_id], [course_id], [enrollment_date]) VALUES (15, 2, 1, CAST(N'2023-10-05' AS Date))
INSERT [dbo].[Enrollments] ([enrollment_id], [student_id], [course_id], [enrollment_date]) VALUES (16, 6, 1, CAST(N'2023-10-06' AS Date))
INSERT [dbo].[Enrollments] ([enrollment_id], [student_id], [course_id], [enrollment_date]) VALUES (17, 8, 1, CAST(N'2023-10-07' AS Date))
INSERT [dbo].[Enrollments] ([enrollment_id], [student_id], [course_id], [enrollment_date]) VALUES (18, 9, 1, CAST(N'2023-10-08' AS Date))
INSERT [dbo].[Enrollments] ([enrollment_id], [student_id], [course_id], [enrollment_date]) VALUES (19, 10, 1, CAST(N'2023-10-09' AS Date))
INSERT [dbo].[Enrollments] ([enrollment_id], [student_id], [course_id], [enrollment_date]) VALUES (20, 4, 3, CAST(N'2023-10-15' AS Date))
INSERT [dbo].[Enrollments] ([enrollment_id], [student_id], [course_id], [enrollment_date]) VALUES (21, 2, 2, CAST(N'2023-09-20' AS Date))
INSERT [dbo].[Enrollments] ([enrollment_id], [student_id], [course_id], [enrollment_date]) VALUES (22, 3, 4, CAST(N'2023-09-10' AS Date))
INSERT [dbo].[Enrollments] ([enrollment_id], [student_id], [course_id], [enrollment_date]) VALUES (23, 4, 3, CAST(N'2023-10-25' AS Date))
INSERT [dbo].[Enrollments] ([enrollment_id], [student_id], [course_id], [enrollment_date]) VALUES (24, 5, 1, CAST(N'2023-10-14' AS Date))
INSERT [dbo].[Enrollments] ([enrollment_id], [student_id], [course_id], [enrollment_date]) VALUES (25, 6, 5, CAST(N'2023-09-30' AS Date))
INSERT [dbo].[Enrollments] ([enrollment_id], [student_id], [course_id], [enrollment_date]) VALUES (26, 7, 2, CAST(N'2023-09-22' AS Date))
INSERT [dbo].[Enrollments] ([enrollment_id], [student_id], [course_id], [enrollment_date]) VALUES (27, 8, 3, CAST(N'2023-09-18' AS Date))
INSERT [dbo].[Enrollments] ([enrollment_id], [student_id], [course_id], [enrollment_date]) VALUES (28, 9, 1, CAST(N'2023-09-05' AS Date))
INSERT [dbo].[Enrollments] ([enrollment_id], [student_id], [course_id], [enrollment_date]) VALUES (29, 10, 5, CAST(N'2023-10-01' AS Date))
INSERT [dbo].[Enrollments] ([enrollment_id], [student_id], [course_id], [enrollment_date]) VALUES (30, 4, 2, CAST(N'2023-09-01' AS Date))
INSERT [dbo].[Enrollments] ([enrollment_id], [student_id], [course_id], [enrollment_date]) VALUES (31, 10, 4, CAST(N'2023-10-01' AS Date))
INSERT [dbo].[Enrollments] ([enrollment_id], [student_id], [course_id], [enrollment_date]) VALUES (32, 9, 3, CAST(N'2023-10-01' AS Date))
INSERT [dbo].[Enrollments] ([enrollment_id], [student_id], [course_id], [enrollment_date]) VALUES (33, 4, 5, CAST(N'2023-10-01' AS Date))
INSERT [dbo].[Enrollments] ([enrollment_id], [student_id], [course_id], [enrollment_date]) VALUES (34, 2, 1, CAST(N'2023-10-05' AS Date))
INSERT [dbo].[Enrollments] ([enrollment_id], [student_id], [course_id], [enrollment_date]) VALUES (35, 6, 1, CAST(N'2023-10-06' AS Date))
INSERT [dbo].[Enrollments] ([enrollment_id], [student_id], [course_id], [enrollment_date]) VALUES (36, 8, 1, CAST(N'2023-10-07' AS Date))
INSERT [dbo].[Enrollments] ([enrollment_id], [student_id], [course_id], [enrollment_date]) VALUES (37, 9, 1, CAST(N'2023-10-08' AS Date))
INSERT [dbo].[Enrollments] ([enrollment_id], [student_id], [course_id], [enrollment_date]) VALUES (38, 10, 1, CAST(N'2023-10-09' AS Date))
SET IDENTITY_INSERT [dbo].[Enrollments] OFF
GO
SET IDENTITY_INSERT [dbo].[Instructors] ON 

INSERT [dbo].[Instructors] ([instructor_id], [first_name], [last_name], [email]) VALUES (1, N'Ahmed', N'Shawky', N'ahmed.shawky@alexu.edu.eg')
INSERT [dbo].[Instructors] ([instructor_id], [first_name], [last_name], [email]) VALUES (2, N'Hoda', N'Hassan', N'hoda.hassan@alexu.edu.eg')
INSERT [dbo].[Instructors] ([instructor_id], [first_name], [last_name], [email]) VALUES (3, N'Aymen', N'Khalil', N'aymen.khalil@alexu.edu.eg')
INSERT [dbo].[Instructors] ([instructor_id], [first_name], [last_name], [email]) VALUES (4, N'Ahmed', N'Shawky', N'ahmed.shawky@alexu.edu.eg')
INSERT [dbo].[Instructors] ([instructor_id], [first_name], [last_name], [email]) VALUES (5, N'Hoda', N'Hassan', N'hoda.hassan@alexu.edu.eg')
INSERT [dbo].[Instructors] ([instructor_id], [first_name], [last_name], [email]) VALUES (6, N'Aymen', N'Khalil', N'aymen.khalil@alexu.edu.eg')
SET IDENTITY_INSERT [dbo].[Instructors] OFF
GO
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([student_id], [first_name], [last_name], [email], [date_of_birth]) VALUES (1, N'Ahmed', N'Nasser', N'ahmed.nasser@alexu.com', CAST(N'2001-05-12' AS Date))
INSERT [dbo].[Students] ([student_id], [first_name], [last_name], [email], [date_of_birth]) VALUES (2, N'Fatima', N'Saeed', N'fatima.saeed@alexu.com', CAST(N'2003-11-24' AS Date))
INSERT [dbo].[Students] ([student_id], [first_name], [last_name], [email], [date_of_birth]) VALUES (3, N'Omar', N'Khaled', N'omar.khaled@alexu.com', CAST(N'2002-02-18' AS Date))
INSERT [dbo].[Students] ([student_id], [first_name], [last_name], [email], [date_of_birth]) VALUES (4, N'Sara', N'Hassan', N'updated.email@alexu.com', CAST(N'2004-07-29' AS Date))
INSERT [dbo].[Students] ([student_id], [first_name], [last_name], [email], [date_of_birth]) VALUES (5, N'Youssef', N'Ali', N'youssef.ali@alexu.com', CAST(N'2001-09-15' AS Date))
INSERT [dbo].[Students] ([student_id], [first_name], [last_name], [email], [date_of_birth]) VALUES (6, N'Mariam', N'Adel', N'mariam.adel@alexu.com', CAST(N'2003-04-07' AS Date))
INSERT [dbo].[Students] ([student_id], [first_name], [last_name], [email], [date_of_birth]) VALUES (7, N'Mohamed', N'Fathy', N'mohamed.fathy@alexu.com', CAST(N'2002-12-10' AS Date))
INSERT [dbo].[Students] ([student_id], [first_name], [last_name], [email], [date_of_birth]) VALUES (8, N'Noor', N'Ibrahim', N'noor.ibrahim@alexu.com', CAST(N'2005-01-19' AS Date))
INSERT [dbo].[Students] ([student_id], [first_name], [last_name], [email], [date_of_birth]) VALUES (9, N'Hala', N'Mostafa', N'hala.mostafa@alexu.com', CAST(N'2004-06-03' AS Date))
INSERT [dbo].[Students] ([student_id], [first_name], [last_name], [email], [date_of_birth]) VALUES (10, N'Rami', N'Ziad', N'rami.ziad@alexu.com', CAST(N'2001-08-27' AS Date))
INSERT [dbo].[Students] ([student_id], [first_name], [last_name], [email], [date_of_birth]) VALUES (11, N'Ahmed', N'Nasser', N'ahmed.nasser@alexu.com', CAST(N'2001-05-12' AS Date))
INSERT [dbo].[Students] ([student_id], [first_name], [last_name], [email], [date_of_birth]) VALUES (12, N'Fatima', N'Saeed', N'fatima.saeed@alexu.com', CAST(N'2003-11-24' AS Date))
INSERT [dbo].[Students] ([student_id], [first_name], [last_name], [email], [date_of_birth]) VALUES (13, N'Omar', N'Khaled', N'omar.khaled@alexu.com', CAST(N'2002-02-18' AS Date))
INSERT [dbo].[Students] ([student_id], [first_name], [last_name], [email], [date_of_birth]) VALUES (14, N'Sara', N'Hassan', N'sara.hassan@alexu.com', CAST(N'2004-07-29' AS Date))
INSERT [dbo].[Students] ([student_id], [first_name], [last_name], [email], [date_of_birth]) VALUES (15, N'Youssef', N'Ali', N'youssef.ali@alexu.com', CAST(N'2001-09-15' AS Date))
INSERT [dbo].[Students] ([student_id], [first_name], [last_name], [email], [date_of_birth]) VALUES (16, N'Mariam', N'Adel', N'mariam.adel@alexu.com', CAST(N'2003-04-07' AS Date))
INSERT [dbo].[Students] ([student_id], [first_name], [last_name], [email], [date_of_birth]) VALUES (17, N'Mohamed', N'Fathy', N'mohamed.fathy@alexu.com', CAST(N'2002-12-10' AS Date))
INSERT [dbo].[Students] ([student_id], [first_name], [last_name], [email], [date_of_birth]) VALUES (18, N'Noor', N'Ibrahim', N'noor.ibrahim@alexu.com', CAST(N'2005-01-19' AS Date))
INSERT [dbo].[Students] ([student_id], [first_name], [last_name], [email], [date_of_birth]) VALUES (19, N'Hala', N'Mostafa', N'hala.mostafa@alexu.com', CAST(N'2004-06-03' AS Date))
INSERT [dbo].[Students] ([student_id], [first_name], [last_name], [email], [date_of_birth]) VALUES (20, N'Rami', N'Ziad', N'rami.ziad@alexu.com', CAST(N'2001-08-27' AS Date))
SET IDENTITY_INSERT [dbo].[Students] OFF
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD FOREIGN KEY([instructor_id])
REFERENCES [dbo].[Instructors] ([instructor_id])
GO
ALTER TABLE [dbo].[Enrollments]  WITH CHECK ADD FOREIGN KEY([course_id])
REFERENCES [dbo].[Courses] ([course_id])
GO
ALTER TABLE [dbo].[Enrollments]  WITH CHECK ADD FOREIGN KEY([student_id])
REFERENCES [dbo].[Students] ([student_id])
GO
USE [master]
GO
ALTER DATABASE [StudentCourseManagement] SET  READ_WRITE 
GO
