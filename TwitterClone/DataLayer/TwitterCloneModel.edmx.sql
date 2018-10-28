
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 10/20/2018 14:54:48
-- Generated from EDMX file: F:\CTS Source\CCP Assessment\TwittClone New\TwitterClone-master\TwitterClone-master\TwitterClone\EF\TwitterCloneModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [TwitterClone];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK__Following__user___1DE57479]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Following] DROP CONSTRAINT [FK__Following__user___1DE57479];
GO
IF OBJECT_ID(N'[dbo].[FK__Tweet__user_id__20C1E124]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Tweet] DROP CONSTRAINT [FK__Tweet__user_id__20C1E124];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Following]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Following];
GO
IF OBJECT_ID(N'[dbo].[Person]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Person];
GO
IF OBJECT_ID(N'[dbo].[Tweet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Tweet];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'People'
CREATE TABLE [dbo].[People] (
    [user_id] varchar(25)  NOT NULL,
    [password] varchar(50)  NOT NULL,
    [fullName] varchar(30)  NOT NULL,
    [email] varchar(50)  NOT NULL,
    [joined] datetime  NOT NULL,
    [active] bit  NOT NULL
);
GO

-- Creating table 'Tweets'
CREATE TABLE [dbo].[Tweets] (
    [tweet_id] int IDENTITY(1,1) NOT NULL,
    [user_id] varchar(25)  NOT NULL,
    [message] varchar(140)  NOT NULL,
    [created] datetime  NOT NULL
);
GO

-- Creating table 'Followings'
CREATE TABLE [dbo].[Followings] (
    [user_id] varchar(25)  NOT NULL,
    [following_id] varchar(25)  NOT NULL,
    [followid] int IDENTITY(1,1) NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [user_id] in table 'People'
ALTER TABLE [dbo].[People]
ADD CONSTRAINT [PK_People]
    PRIMARY KEY CLUSTERED ([user_id] ASC);
GO

-- Creating primary key on [tweet_id] in table 'Tweets'
ALTER TABLE [dbo].[Tweets]
ADD CONSTRAINT [PK_Tweets]
    PRIMARY KEY CLUSTERED ([tweet_id] ASC);
GO

-- Creating primary key on [user_id], [following_id], [followid] in table 'Followings'
ALTER TABLE [dbo].[Followings]
ADD CONSTRAINT [PK_Followings]
    PRIMARY KEY CLUSTERED ([user_id], [following_id], [followid] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [user_id] in table 'Tweets'
ALTER TABLE [dbo].[Tweets]
ADD CONSTRAINT [FK_Tweet_Person]
    FOREIGN KEY ([user_id])
    REFERENCES [dbo].[People]
        ([user_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Tweet_Person'
CREATE INDEX [IX_FK_Tweet_Person]
ON [dbo].[Tweets]
    ([user_id]);
GO

-- Creating foreign key on [user_id] in table 'Followings'
ALTER TABLE [dbo].[Followings]
ADD CONSTRAINT [FK__Following__user___1DE57479]
    FOREIGN KEY ([user_id])
    REFERENCES [dbo].[People]
        ([user_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------