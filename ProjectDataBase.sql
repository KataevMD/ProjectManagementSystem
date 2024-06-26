USE [master]
GO
USE [ProjectDataBase]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 18.04.2024 2:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeProject]    Script Date: 18.04.2024 2:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeProject](
	[ProjectId] [int] NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[IsProjectManager] [bit] NULL,
 CONSTRAINT [PK_EmployeeProject] PRIMARY KEY CLUSTERED 
(
	[ProjectId] ASC,
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 18.04.2024 2:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[Patronymic] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Projects]    Script Date: 18.04.2024 2:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projects](
	[ProjectId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[TitleCustomersCompany] [nvarchar](max) NOT NULL,
	[TitleContractorsCompany] [nvarchar](max) NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[ProjectPriority] [int] NOT NULL,
	[ProjectFilePath] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Projects] PRIMARY KEY CLUSTERED 
(
	[ProjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 18.04.2024 2:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tasks]    Script Date: 18.04.2024 2:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tasks](
	[TaskId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[TaskStatusId] [int] NOT NULL,
	[TaskPriority] [int] NOT NULL,
	[ProjectId] [int] NOT NULL,
	[AuthorTaskId] [int] NULL,
	[ContractorTaskId] [int] NULL,
 CONSTRAINT [PK_Tasks] PRIMARY KEY CLUSTERED 
(
	[TaskId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaskStatuses]    Script Date: 18.04.2024 2:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskStatuses](
	[TaskStatusId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_TaskStatuses] PRIMARY KEY CLUSTERED 
(
	[TaskStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 18.04.2024 2:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[EmployeeId] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240415130144_InitialCreate', N'8.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240415140610_UpdateRelationAndAddAtribute', N'8.0.4')
GO
INSERT [dbo].[EmployeeProject] ([ProjectId], [EmployeeId], [IsProjectManager]) VALUES (1, 3, 1)
INSERT [dbo].[EmployeeProject] ([ProjectId], [EmployeeId], [IsProjectManager]) VALUES (1, 4, 0)
INSERT [dbo].[EmployeeProject] ([ProjectId], [EmployeeId], [IsProjectManager]) VALUES (1, 7, 0)
INSERT [dbo].[EmployeeProject] ([ProjectId], [EmployeeId], [IsProjectManager]) VALUES (2, 3, 1)
INSERT [dbo].[EmployeeProject] ([ProjectId], [EmployeeId], [IsProjectManager]) VALUES (2, 4, 0)
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([EmployeeId], [LastName], [FirstName], [Patronymic], [Email], [RoleId]) VALUES (3, N'Петров', N'Перт', N'Петрович', N'1', 2)
INSERT [dbo].[Employees] ([EmployeeId], [LastName], [FirstName], [Patronymic], [Email], [RoleId]) VALUES (4, N'Иванов', N'Иван', N'Иванович', N'12', 3)
INSERT [dbo].[Employees] ([EmployeeId], [LastName], [FirstName], [Patronymic], [Email], [RoleId]) VALUES (5, N'Сидоров', N'Андрей', N'Иванович', N'232', 1)
INSERT [dbo].[Employees] ([EmployeeId], [LastName], [FirstName], [Patronymic], [Email], [RoleId]) VALUES (6, N'Андреев', N'Федор ', N'Игнатьевич', N'1111', 2)
INSERT [dbo].[Employees] ([EmployeeId], [LastName], [FirstName], [Patronymic], [Email], [RoleId]) VALUES (7, N'Игнатьев', N'Мирон', NULL, N'1', 3)
INSERT [dbo].[Employees] ([EmployeeId], [LastName], [FirstName], [Patronymic], [Email], [RoleId]) VALUES (8, N'Катаев', N'Максим', NULL, N'kataiev99.99@yandex.ru', 1)
INSERT [dbo].[Employees] ([EmployeeId], [LastName], [FirstName], [Patronymic], [Email], [RoleId]) VALUES (9, N'Андреев', N'Иван', NULL, N'andr@mail.ry', 2)
INSERT [dbo].[Employees] ([EmployeeId], [LastName], [FirstName], [Patronymic], [Email], [RoleId]) VALUES (10, N'Молотков', N'Даниил', NULL, N'molot@ya.ru', 3)
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[Projects] ON 

INSERT [dbo].[Projects] ([ProjectId], [Title], [TitleCustomersCompany], [TitleContractorsCompany], [StartDate], [EndDate], [ProjectPriority], [ProjectFilePath]) VALUES (1, N'1', N'3241342', N'42313412', CAST(N'2024-03-01' AS Date), CAST(N'2024-05-01' AS Date), 1, N'DownloadFiles/1')
INSERT [dbo].[Projects] ([ProjectId], [Title], [TitleCustomersCompany], [TitleContractorsCompany], [StartDate], [EndDate], [ProjectPriority], [ProjectFilePath]) VALUES (2, N'123', N'12321', N'2132312', CAST(N'2024-04-08' AS Date), CAST(N'2024-04-28' AS Date), 22, N'DownloadFiles/123')
SET IDENTITY_INSERT [dbo].[Projects] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleId], [Title]) VALUES (1, N'Manager')
INSERT [dbo].[Roles] ([RoleId], [Title]) VALUES (2, N'Project manager')
INSERT [dbo].[Roles] ([RoleId], [Title]) VALUES (3, N'Developer')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [Login], [Password], [EmployeeId]) VALUES (3, N'kataev', N'C0B2EDE27BB93340EB8F1F95842925C7E64D8C49A1030CE1F17BE1A9864DA4B2', 8)
INSERT [dbo].[Users] ([UserId], [Login], [Password], [EmployeeId]) VALUES (4, N'andr', N'4B18D7BD16F6BA1D6B46A5824C41E53F5FB548EF563E2513F24CE52D8BEB1A38', 9)
INSERT [dbo].[Users] ([UserId], [Login], [Password], [EmployeeId]) VALUES (5, N'molot', N'86E3AF77B82CB1AB02F8B81F643B4BE47DF1D931F8E6AAFF9B3180F0597F91D0', 10)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
/****** Object:  Index [IX_EmployeeProject_EmployeeId]    Script Date: 18.04.2024 2:04:11 ******/
CREATE NONCLUSTERED INDEX [IX_EmployeeProject_EmployeeId] ON [dbo].[EmployeeProject]
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Employees_RoleId]    Script Date: 18.04.2024 2:04:11 ******/
CREATE NONCLUSTERED INDEX [IX_Employees_RoleId] ON [dbo].[Employees]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Tasks_AuthorTaskId]    Script Date: 18.04.2024 2:04:11 ******/
CREATE NONCLUSTERED INDEX [IX_Tasks_AuthorTaskId] ON [dbo].[Tasks]
(
	[AuthorTaskId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Tasks_ContractorTaskId]    Script Date: 18.04.2024 2:04:11 ******/
CREATE NONCLUSTERED INDEX [IX_Tasks_ContractorTaskId] ON [dbo].[Tasks]
(
	[ContractorTaskId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Tasks_ProjectId]    Script Date: 18.04.2024 2:04:11 ******/
CREATE NONCLUSTERED INDEX [IX_Tasks_ProjectId] ON [dbo].[Tasks]
(
	[ProjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Tasks_TaskStatusId]    Script Date: 18.04.2024 2:04:11 ******/
CREATE NONCLUSTERED INDEX [IX_Tasks_TaskStatusId] ON [dbo].[Tasks]
(
	[TaskStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Users_EmployeeId]    Script Date: 18.04.2024 2:04:11 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_EmployeeId] ON [dbo].[Users]
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EmployeeProject] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsProjectManager]
GO
ALTER TABLE [dbo].[EmployeeProject]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeProject_Employees_EmployeeId] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([EmployeeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EmployeeProject] CHECK CONSTRAINT [FK_EmployeeProject_Employees_EmployeeId]
GO
ALTER TABLE [dbo].[EmployeeProject]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeProject_Projects_ProjectId] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Projects] ([ProjectId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EmployeeProject] CHECK CONSTRAINT [FK_EmployeeProject_Projects_ProjectId]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Roles_RoleId]
GO
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_Employees_AuthorTaskId] FOREIGN KEY([AuthorTaskId])
REFERENCES [dbo].[Employees] ([EmployeeId])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Tasks_Employees_AuthorTaskId]
GO
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_Employees_ContractorTaskId] FOREIGN KEY([ContractorTaskId])
REFERENCES [dbo].[Employees] ([EmployeeId])
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Tasks_Employees_ContractorTaskId]
GO
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_Projects_ProjectId] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Projects] ([ProjectId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Tasks_Projects_ProjectId]
GO
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_TaskStatuses_TaskStatusId] FOREIGN KEY([TaskStatusId])
REFERENCES [dbo].[TaskStatuses] ([TaskStatusId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Tasks_TaskStatuses_TaskStatusId]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Employees_EmployeeId] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([EmployeeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Employees_EmployeeId]
GO
USE [master]
GO
ALTER DATABASE [ProjectDataBase] SET  READ_WRITE 
GO
