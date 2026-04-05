USE [ZestIndiaAPI]
GO
/****** Object:  Table [dbo].[Permissions]    Script Date: 04/05/2026 6:34:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permissions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PermissionName] [nvarchar](256) NOT NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[IsDeleted] [bit] NULL,
	[DeletedBy] [int] NULL,
	[DeletedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RefreshTokens]    Script Date: 04/05/2026 6:34:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RefreshTokens](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Token] [nvarchar](500) NOT NULL,
	[ExpiryDate] [datetime] NOT NULL,
	[IsRevoked] [bit] NULL,
	[CreatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RolePermissions]    Script Date: 04/05/2026 6:34:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolePermissions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[PermissionId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 04/05/2026 6:34:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[IsDeleted] [bit] NULL,
	[DeletedBy] [int] NULL,
	[DeletedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 04/05/2026 6:34:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[Age] [int] NULL,
	[Course] [nvarchar](256) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[IsDeleted] [bit] NULL,
	[DeletedBy] [int] NULL,
	[DeletedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 04/05/2026 6:34:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[PasswordHash] [nvarchar](500) NOT NULL,
	[RoleId] [int] NOT NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[IsDeleted] [bit] NULL,
	[DeletedBy] [int] NULL,
	[DeletedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Permissions] ON 

INSERT [dbo].[Permissions] ([Id], [PermissionName], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted], [DeletedBy], [DeletedDate]) VALUES (1, N'AddStudent', 1, CAST(N'2026-04-05T14:47:56.150' AS DateTime), NULL, NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Permissions] ([Id], [PermissionName], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted], [DeletedBy], [DeletedDate]) VALUES (2, N'UpdateStudent', 1, CAST(N'2026-04-05T14:47:56.150' AS DateTime), NULL, NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Permissions] ([Id], [PermissionName], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted], [DeletedBy], [DeletedDate]) VALUES (3, N'DeleteStudent', 1, CAST(N'2026-04-05T14:47:56.150' AS DateTime), NULL, NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Permissions] ([Id], [PermissionName], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted], [DeletedBy], [DeletedDate]) VALUES (4, N'ViewStudent', 1, CAST(N'2026-04-05T14:47:56.150' AS DateTime), NULL, NULL, NULL, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Permissions] OFF
GO
SET IDENTITY_INSERT [dbo].[RefreshTokens] ON 

INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryDate], [IsRevoked], [CreatedDate]) VALUES (1, 1, N'e5ec363c-70e5-4d11-b6a7-90a864db5d5e', CAST(N'2026-04-12T10:55:24.387' AS DateTime), 0, CAST(N'2026-04-05T16:25:45.790' AS DateTime))
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryDate], [IsRevoked], [CreatedDate]) VALUES (2, 2, N'07a39946-dab6-4c9f-ab71-90e91de4a278', CAST(N'2026-04-12T12:33:42.527' AS DateTime), 0, CAST(N'2026-04-05T18:03:42.540' AS DateTime))
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryDate], [IsRevoked], [CreatedDate]) VALUES (3, 2, N'dad7a21c-d3dc-4868-8e55-245a3e6f390b', CAST(N'2026-04-12T12:35:04.260' AS DateTime), 0, CAST(N'2026-04-05T18:05:04.270' AS DateTime))
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryDate], [IsRevoked], [CreatedDate]) VALUES (4, 1, N'ccf8ca74-23fb-4baf-a154-832fd589337d', CAST(N'2026-04-12T12:36:46.677' AS DateTime), 0, CAST(N'2026-04-05T18:06:46.677' AS DateTime))
INSERT [dbo].[RefreshTokens] ([Id], [UserId], [Token], [ExpiryDate], [IsRevoked], [CreatedDate]) VALUES (5, 1, N'8d5ce06b-b235-4bb7-a19f-a887518a53c7', CAST(N'2026-04-12T12:38:40.683' AS DateTime), 0, CAST(N'2026-04-05T18:08:40.690' AS DateTime))
SET IDENTITY_INSERT [dbo].[RefreshTokens] OFF
GO
SET IDENTITY_INSERT [dbo].[RolePermissions] ON 

INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (1, 1, 1)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (2, 1, 2)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (3, 1, 3)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (4, 1, 4)
INSERT [dbo].[RolePermissions] ([Id], [RoleId], [PermissionId]) VALUES (5, 2, 4)
SET IDENTITY_INSERT [dbo].[RolePermissions] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [RoleName], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted], [DeletedBy], [DeletedDate]) VALUES (1, N'Admin', 1, CAST(N'2026-04-05T14:47:53.260' AS DateTime), NULL, NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Roles] ([Id], [RoleName], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted], [DeletedBy], [DeletedDate]) VALUES (2, N'User', 1, CAST(N'2026-04-05T14:47:53.260' AS DateTime), NULL, NULL, NULL, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([Id], [Name], [Email], [Age], [Course], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted], [DeletedBy], [DeletedDate]) VALUES (1, N'Akash', N'rahul@gmail.com', 25, N'Computer Science', CAST(N'2026-04-05T18:07:01.237' AS DateTime), 1, NULL, NULL, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Student] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [UserName], [PasswordHash], [RoleId], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted], [DeletedBy], [DeletedDate]) VALUES (1, N'Admin', N'$2a$10$SzVJR3Ryi4Pit9zRsTen3OnB5p2GmFxVQMJ7IKBRs06BQaO/6O1Ry', 1, 1, CAST(N'2026-04-05T16:20:55.107' AS DateTime), NULL, NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Users] ([Id], [UserName], [PasswordHash], [RoleId], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted], [DeletedBy], [DeletedDate]) VALUES (2, N'Student', N'$2a$10$FjG/Cb7ulM05l5caST/kVu0kgZA/WRkzlEN6hgrny8n5g9c64UD/y', 2, 1, CAST(N'2026-04-05T17:45:59.733' AS DateTime), NULL, NULL, NULL, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Permission]    Script Date: 04/05/2026 6:34:52 PM ******/
ALTER TABLE [dbo].[Permissions] ADD  CONSTRAINT [UQ_Permission] UNIQUE NONCLUSTERED 
(
	[PermissionName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ_RolePermission]    Script Date: 04/05/2026 6:34:52 PM ******/
ALTER TABLE [dbo].[RolePermissions] ADD  CONSTRAINT [UQ_RolePermission] UNIQUE NONCLUSTERED 
(
	[RoleId] ASC,
	[PermissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_RoleName]    Script Date: 04/05/2026 6:34:52 PM ******/
ALTER TABLE [dbo].[Roles] ADD  CONSTRAINT [UQ_RoleName] UNIQUE NONCLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__C9F28456CCA4982B]    Script Date: 04/05/2026 6:34:52 PM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Permissions] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Permissions] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Permissions] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[RefreshTokens] ADD  DEFAULT ((0)) FOR [IsRevoked]
GO
ALTER TABLE [dbo].[RefreshTokens] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Roles] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Roles] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Roles] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Student] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[RefreshTokens]  WITH CHECK ADD  CONSTRAINT [FK_Refresh_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[RefreshTokens] CHECK CONSTRAINT [FK_Refresh_User]
GO
ALTER TABLE [dbo].[RolePermissions]  WITH CHECK ADD  CONSTRAINT [FK_RolePermissions_Permissions] FOREIGN KEY([PermissionId])
REFERENCES [dbo].[Permissions] ([Id])
GO
ALTER TABLE [dbo].[RolePermissions] CHECK CONSTRAINT [FK_RolePermissions_Permissions]
GO
ALTER TABLE [dbo].[RolePermissions]  WITH CHECK ADD  CONSTRAINT [FK_RolePermissions_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[RolePermissions] CHECK CONSTRAINT [FK_RolePermissions_Roles]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Roles]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetRefreshToken]    Script Date: 04/05/2026 6:34:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[usp_GetRefreshToken]
    @Token NVARCHAR(500)
AS
BEGIN
    SELECT rt.Id as UserId,rt.ExpiryDate,rt.IsRevoked,u.UserName FROM RefreshTokens rt
	inner join Users u on rt.id = u.id
    WHERE rt.Token = @Token AND rt.IsRevoked = 0
END
GO
/****** Object:  StoredProcedure [dbo].[usp_InsertRefreshToken]    Script Date: 04/05/2026 6:34:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_InsertRefreshToken]
    @UserId INT,
    @Token NVARCHAR(500),
    @ExpiryDate DATETIME
AS
BEGIN
    INSERT INTO RefreshTokens (UserId, Token, ExpiryDate)
    VALUES (@UserId, @Token, @ExpiryDate)
END
GO
/****** Object:  StoredProcedure [dbo].[usp_RevokeRefreshToken]    Script Date: 04/05/2026 6:34:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_RevokeRefreshToken]
    @Token NVARCHAR(500)
AS
BEGIN
    UPDATE RefreshTokens
    SET IsRevoked = 1
    WHERE Token = @Token
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Student_Add_Update_Delte_GetList_GetDetailsById]    Script Date: 04/05/2026 6:34:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[usp_Student_Add_Update_Delte_GetList_GetDetailsById]
(
@Id int = 0,
@Name nvarchar(256) =  null,
@Email nvarchar(256) = null,
@Age Int = null,
@Course nvarchar(256) = null,
@OperationType nvarchar(256) = null
)
as
begin
if(@OperationType = 'AddUpdate')
begin
	if(@Id is null or @Id = 0)
	begin
	insert into Student
	(
	[Name]
	,Email
	,Age
	,Course
	,CreatedDate
	,CreatedBy
	,IsDeleted
	)
	Values
	(
	@Name
	,@Email
	,@Age
	,@Course
	,GETDATE()
	,1
	,0
	)
	end
	else
	begin
	update Student
	set
	[Name] = ISNULL(@Name, [Name]),
    Email = ISNULL(@Email, Email),
    Age = ISNULL(@Age, Age),
    Course = ISNULL(@Course, Course),
	ModifiedDate = GetDate()
	,ModifiedBy = 1
	where Id = @Id AND ISNULL(IsDeleted,0) = 0
	end
end

if(@OperationType = 'GetList')
begin
	select
	Id
	,[Name]
	,Email
	,Age
	,Course
	,CreatedDate
	from Student
	where ISNULL(IsDeleted,0) = 0
end
if(@OperationType = 'GetDetailsById')
begin
	select
	Id
	,[Name]
	,Email
	,Age
	,Course
	,CreatedDate
	from Student
	where ISNULL(IsDeleted,0) = 0 and Id = @Id
end
if(@OperationType = 'Delete')
begin
	update Student
	set
	IsDeleted = 1,
	DeletedDate = GetDate(),
	DeletedBy = 1
	where Id = @Id AND ISNULL(IsDeleted,0) = 0
end
end
GO
/****** Object:  StoredProcedure [dbo].[usp_User_Login]    Script Date: 04/05/2026 6:34:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_User_Login]
    @UserName NVARCHAR(256)
AS
BEGIN
    SELECT 
        u.Id,
        u.UserName,
        u.PasswordHash,
        r.RoleName,
        p.PermissionName
    FROM Users u
    INNER JOIN Roles r ON u.RoleId = r.Id
    LEFT JOIN RolePermissions rp ON r.Id = rp.RoleId
    LEFT JOIN Permissions p ON rp.PermissionId = p.Id
    WHERE u.UserName = @UserName
      AND u.IsActive = 1
      AND u.IsDeleted = 0;
END
GO
/****** Object:  StoredProcedure [dbo].[usp_User_Register]    Script Date: 04/05/2026 6:34:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_User_Register]
    @UserName NVARCHAR(256),
    @PasswordHash NVARCHAR(500),
    @RoleId INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Duplicate check
    IF EXISTS (SELECT 1 FROM Users WHERE UserName = @UserName AND IsDeleted = 0)
    BEGIN
        SELECT -1 AS Result;
        RETURN;
    END

    INSERT INTO Users (UserName, PasswordHash, RoleId)
    VALUES (@UserName, @PasswordHash, @RoleId);

    SELECT 1 AS Result;
END
GO
