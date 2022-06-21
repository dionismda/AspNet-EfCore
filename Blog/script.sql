﻿IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
GO

CREATE TABLE [Category] (
    [Id] int NOT NULL IDENTITY,
    [Name] NVARCHAR(80) NOT NULL,
    [Slug] VARCHAR(80) NOT NULL,
    CONSTRAINT [PK_Category] PRIMARY KEY ([Id])
);
GO

CREATE TABLE [Role] (
    [Id] int NOT NULL IDENTITY,
    [Name] nvarchar(max) NOT NULL,
    [Slug] nvarchar(max) NOT NULL,
    CONSTRAINT [PK_Role] PRIMARY KEY ([Id])
);
GO

CREATE TABLE [Tag] (
    [Id] int NOT NULL IDENTITY,
    [Name] nvarchar(max) NOT NULL,
    [Slug] nvarchar(max) NOT NULL,
    CONSTRAINT [PK_Tag] PRIMARY KEY ([Id])
);
GO

CREATE TABLE [User] (
    [Id] int NOT NULL IDENTITY,
    [Name] NVARCHAR(80) NOT NULL,
    [Email] VARCHAR(250) NOT NULL,
    [PasswordHash] VARCHAR(20) NOT NULL,
    [Image] VARCHAR(250) NOT NULL,
    [Slug] VARCHAR(80) NOT NULL,
    [Bio] VARCHAR(80) NOT NULL,
    CONSTRAINT [PK_User] PRIMARY KEY ([Id])
);
GO

CREATE TABLE [Post] (
    [Id] int NOT NULL IDENTITY,
    [CategoryId] int NOT NULL,
    [AuthorId] int NOT NULL,
    [Title] NVARCHAR(250) NOT NULL,
    [Summary] VARCHAR(250) NOT NULL,
    [Body] VARCHAR(250) NOT NULL,
    [Slug] VARCHAR(80) NOT NULL,
    [CreateDate] SMALLDATETIME NOT NULL DEFAULT (GETDATE()),
    [LastUpdateDate] SMALLDATETIME NOT NULL DEFAULT (GETDATE()),
    CONSTRAINT [PK_Post] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Post_Author] FOREIGN KEY ([AuthorId]) REFERENCES [User] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_Post_Category] FOREIGN KEY ([CategoryId]) REFERENCES [Category] ([Id]) ON DELETE CASCADE
);
GO

CREATE TABLE [UserRole] (
    [RoleId] int NOT NULL,
    [UserId] int NOT NULL,
    CONSTRAINT [PK_UserRole] PRIMARY KEY ([RoleId], [UserId]),
    CONSTRAINT [FK_UserRole_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [Role] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_UserRole_UserId] FOREIGN KEY ([UserId]) REFERENCES [User] ([Id]) ON DELETE CASCADE
);
GO

CREATE TABLE [PostTag] (
    [PostId] int NOT NULL,
    [TagId] int NOT NULL,
    CONSTRAINT [PK_PostTag] PRIMARY KEY ([PostId], [TagId]),
    CONSTRAINT [FK_PostTag_Postid] FOREIGN KEY ([PostId]) REFERENCES [Tag] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_PostTag_Tagid] FOREIGN KEY ([TagId]) REFERENCES [Post] ([Id]) ON DELETE CASCADE
);
GO

CREATE UNIQUE INDEX [IDX_Category_Slug] ON [Category] ([Slug]);
GO

CREATE UNIQUE INDEX [IDX_Post_Slug] ON [Post] ([Slug]);
GO

CREATE INDEX [IX_Post_AuthorId] ON [Post] ([AuthorId]);
GO

CREATE INDEX [IX_Post_CategoryId] ON [Post] ([CategoryId]);
GO

CREATE INDEX [IX_PostTag_TagId] ON [PostTag] ([TagId]);
GO

CREATE UNIQUE INDEX [IDX_User_Slug] ON [User] ([Slug]);
GO

CREATE INDEX [IX_UserRole_UserId] ON [UserRole] ([UserId]);
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20220621121758_InitialCreation', N'6.0.6');
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

ALTER TABLE [User] ADD [Github] VARCHAR(250) NOT NULL DEFAULT '';
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20220621122536_AddFieldGithub', N'6.0.6');
GO

COMMIT;
GO

