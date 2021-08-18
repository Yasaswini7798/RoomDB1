
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 08/18/2021 17:33:30
-- Generated from EDMX file: C:\Users\User\source\repos\RoomDB\RoomDB\RoomModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [ROOMDB];
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

-- Creating table 'Rooms'
CREATE TABLE [dbo].[Rooms] (
    [IdRoom] int IDENTITY(1,1) NOT NULL,
    [name] nvarchar(max)  NOT NULL,
    [description] nvarchar(max)  NOT NULL,
    [capacity] int  NOT NULL,
    [enabled] int  NOT NULL,
    [note] nvarchar(max)  NOT NULL,
    [smart] int  NOT NULL,
    [floor] int  NOT NULL,
    [BuildingIdBuilding] int  NOT NULL
);
GO

-- Creating table 'Buildings'
CREATE TABLE [dbo].[Buildings] (
    [IdBuilding] int IDENTITY(1,1) NOT NULL,
    [Floornumber] int  NOT NULL,
    [Latitude] int  NOT NULL,
    [Longitude] int  NOT NULL,
    [AddressIdAddress] int  NOT NULL
);
GO

-- Creating table 'Addresses'
CREATE TABLE [dbo].[Addresses] (
    [IdAddress] int IDENTITY(1,1) NOT NULL,
    [Address1] nvarchar(max)  NOT NULL,
    [Address2] nvarchar(max)  NOT NULL,
    [Address3] nvarchar(max)  NOT NULL,
    [Postalcode] nvarchar(max)  NOT NULL,
    [CityCityId] int  NOT NULL
);
GO

-- Creating table 'Cities'
CREATE TABLE [dbo].[Cities] (
    [CityId] int IDENTITY(1,1) NOT NULL,
    [CityName] nvarchar(max)  NOT NULL,
    [CountryCountryId] int  NOT NULL
);
GO

-- Creating table 'Countries'
CREATE TABLE [dbo].[Countries] (
    [CountryId] int IDENTITY(1,1) NOT NULL,
    [CountryName] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [IdRoom] in table 'Rooms'
ALTER TABLE [dbo].[Rooms]
ADD CONSTRAINT [PK_Rooms]
    PRIMARY KEY CLUSTERED ([IdRoom] ASC);
GO

-- Creating primary key on [IdBuilding] in table 'Buildings'
ALTER TABLE [dbo].[Buildings]
ADD CONSTRAINT [PK_Buildings]
    PRIMARY KEY CLUSTERED ([IdBuilding] ASC);
GO

-- Creating primary key on [IdAddress] in table 'Addresses'
ALTER TABLE [dbo].[Addresses]
ADD CONSTRAINT [PK_Addresses]
    PRIMARY KEY CLUSTERED ([IdAddress] ASC);
GO

-- Creating primary key on [CityId] in table 'Cities'
ALTER TABLE [dbo].[Cities]
ADD CONSTRAINT [PK_Cities]
    PRIMARY KEY CLUSTERED ([CityId] ASC);
GO

-- Creating primary key on [CountryId] in table 'Countries'
ALTER TABLE [dbo].[Countries]
ADD CONSTRAINT [PK_Countries]
    PRIMARY KEY CLUSTERED ([CountryId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [BuildingIdBuilding] in table 'Rooms'
ALTER TABLE [dbo].[Rooms]
ADD CONSTRAINT [FK_BuildingRoom]
    FOREIGN KEY ([BuildingIdBuilding])
    REFERENCES [dbo].[Buildings]
        ([IdBuilding])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BuildingRoom'
CREATE INDEX [IX_FK_BuildingRoom]
ON [dbo].[Rooms]
    ([BuildingIdBuilding]);
GO

-- Creating foreign key on [AddressIdAddress] in table 'Buildings'
ALTER TABLE [dbo].[Buildings]
ADD CONSTRAINT [FK_AddressBuilding]
    FOREIGN KEY ([AddressIdAddress])
    REFERENCES [dbo].[Addresses]
        ([IdAddress])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AddressBuilding'
CREATE INDEX [IX_FK_AddressBuilding]
ON [dbo].[Buildings]
    ([AddressIdAddress]);
GO

-- Creating foreign key on [CountryCountryId] in table 'Cities'
ALTER TABLE [dbo].[Cities]
ADD CONSTRAINT [FK_CountryCity]
    FOREIGN KEY ([CountryCountryId])
    REFERENCES [dbo].[Countries]
        ([CountryId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CountryCity'
CREATE INDEX [IX_FK_CountryCity]
ON [dbo].[Cities]
    ([CountryCountryId]);
GO

-- Creating foreign key on [CityCityId] in table 'Addresses'
ALTER TABLE [dbo].[Addresses]
ADD CONSTRAINT [FK_CityAddress]
    FOREIGN KEY ([CityCityId])
    REFERENCES [dbo].[Cities]
        ([CityId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CityAddress'
CREATE INDEX [IX_FK_CityAddress]
ON [dbo].[Addresses]
    ([CityCityId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------