
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/06/2017 17:01:24
-- Generated from EDMX file: c:\users\earnearn\source\repos\MeetingSche\MeetingSche\Models\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [MeetingS];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Profiles'
CREATE TABLE [dbo].[Profiles] (
    [Pid] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Tel] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [Pwd] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Events'
CREATE TABLE [dbo].[Events] (
    [Eid] int IDENTITY(1,1) NOT NULL,
    [Title] nvarchar(max)  NOT NULL,
    [Location] nvarchar(max)  NOT NULL,
    [Date] nvarchar(max)  NOT NULL,
    [Time] nvarchar(max)  NOT NULL,
    [Note] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Show'
CREATE TABLE [dbo].[Show] (
    [Profiles_Pid] int  NOT NULL,
    [Events_Eid] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Pid] in table 'Profiles'
ALTER TABLE [dbo].[Profiles]
ADD CONSTRAINT [PK_Profiles]
    PRIMARY KEY CLUSTERED ([Pid] ASC);
GO

-- Creating primary key on [Eid] in table 'Events'
ALTER TABLE [dbo].[Events]
ADD CONSTRAINT [PK_Events]
    PRIMARY KEY CLUSTERED ([Eid] ASC);
GO

-- Creating primary key on [Profiles_Pid], [Events_Eid] in table 'Show'
ALTER TABLE [dbo].[Show]
ADD CONSTRAINT [PK_Show]
    PRIMARY KEY CLUSTERED ([Profiles_Pid], [Events_Eid] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Profiles_Pid] in table 'Show'
ALTER TABLE [dbo].[Show]
ADD CONSTRAINT [FK_Show_Profile]
    FOREIGN KEY ([Profiles_Pid])
    REFERENCES [dbo].[Profiles]
        ([Pid])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Events_Eid] in table 'Show'
ALTER TABLE [dbo].[Show]
ADD CONSTRAINT [FK_Show_Event]
    FOREIGN KEY ([Events_Eid])
    REFERENCES [dbo].[Events]
        ([Eid])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Show_Event'
CREATE INDEX [IX_FK_Show_Event]
ON [dbo].[Show]
    ([Events_Eid]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------