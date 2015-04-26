
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/26/2015 17:52:35
-- Generated from EDMX file: C:\Users\dorel\Downloads\CouponSystem\CouponSystem-master\Coupon_System\Model2.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [CS_DB1];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_CatalogCouponCategory]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CatalogCoupons] DROP CONSTRAINT [FK_CatalogCouponCategory];
GO
IF OBJECT_ID(N'[dbo].[FK_CatalogCouponOrderedCoupon]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OrderedCoupons] DROP CONSTRAINT [FK_CatalogCouponOrderedCoupon];
GO
IF OBJECT_ID(N'[dbo].[FK_CatalogCouponSystemAdministrator]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CatalogCoupons] DROP CONSTRAINT [FK_CatalogCouponSystemAdministrator];
GO
IF OBJECT_ID(N'[dbo].[FK_LocationCatalogCoupon]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CatalogCoupons] DROP CONSTRAINT [FK_LocationCatalogCoupon];
GO
IF OBJECT_ID(N'[dbo].[FK_SocialNetworkCoupon_inherits_CatalogCoupon]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CatalogCoupons_SocialNetworkCoupon] DROP CONSTRAINT [FK_SocialNetworkCoupon_inherits_CatalogCoupon];
GO
IF OBJECT_ID(N'[dbo].[FK_CustomerSocialNetworkCoupon]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CatalogCoupons_SocialNetworkCoupon] DROP CONSTRAINT [FK_CustomerSocialNetworkCoupon];
GO
IF OBJECT_ID(N'[dbo].[FK_LocationCustomer]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Users_Customer] DROP CONSTRAINT [FK_LocationCustomer];
GO
IF OBJECT_ID(N'[dbo].[FK_UserOrderedCoupon]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OrderedCoupons] DROP CONSTRAINT [FK_UserOrderedCoupon];
GO
IF OBJECT_ID(N'[dbo].[FK_BuisnessOwner_inherits_User]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Users_BuisnessOwner] DROP CONSTRAINT [FK_BuisnessOwner_inherits_User];
GO
IF OBJECT_ID(N'[dbo].[FK_Customer_inherits_User]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Users_Customer] DROP CONSTRAINT [FK_Customer_inherits_User];
GO
IF OBJECT_ID(N'[dbo].[FK_SystemAdministrator_inherits_User]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Users_SystemAdministrator] DROP CONSTRAINT [FK_SystemAdministrator_inherits_User];
GO
IF OBJECT_ID(N'[dbo].[FK_CategoryCustomer_Categories]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CategoryCustomer] DROP CONSTRAINT [FK_CategoryCustomer_Categories];
GO
IF OBJECT_ID(N'[dbo].[FK_CategoryCustomer_Users_Customer]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CategoryCustomer] DROP CONSTRAINT [FK_CategoryCustomer_Users_Customer];
GO
IF OBJECT_ID(N'[dbo].[FK_BuisnessCatalogCoupon]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Buisnesses] DROP CONSTRAINT [FK_BuisnessCatalogCoupon];
GO
IF OBJECT_ID(N'[dbo].[FK_BuisnessLocation]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Buisnesses] DROP CONSTRAINT [FK_BuisnessLocation];
GO
IF OBJECT_ID(N'[dbo].[FK_BuisnessUsers_BuisnessOwner]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Buisnesses] DROP CONSTRAINT [FK_BuisnessUsers_BuisnessOwner];
GO
IF OBJECT_ID(N'[dbo].[FK_BuisnessCategory]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Buisnesses] DROP CONSTRAINT [FK_BuisnessCategory];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Buisnesses]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Buisnesses];
GO
IF OBJECT_ID(N'[dbo].[CatalogCoupons]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CatalogCoupons];
GO
IF OBJECT_ID(N'[dbo].[CatalogCoupons_SocialNetworkCoupon]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CatalogCoupons_SocialNetworkCoupon];
GO
IF OBJECT_ID(N'[dbo].[Categories]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Categories];
GO
IF OBJECT_ID(N'[dbo].[Locations]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Locations];
GO
IF OBJECT_ID(N'[dbo].[OrderedCoupons]', 'U') IS NOT NULL
    DROP TABLE [dbo].[OrderedCoupons];
GO
IF OBJECT_ID(N'[dbo].[Users]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Users];
GO
IF OBJECT_ID(N'[dbo].[Users_BuisnessOwner]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Users_BuisnessOwner];
GO
IF OBJECT_ID(N'[dbo].[Users_Customer]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Users_Customer];
GO
IF OBJECT_ID(N'[dbo].[Users_SystemAdministrator]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Users_SystemAdministrator];
GO
IF OBJECT_ID(N'[dbo].[CategoryCustomer]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CategoryCustomer];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Buisnesses'
CREATE TABLE [dbo].[Buisnesses] (
    [buisName] varchar(500)  NOT NULL,
    [buisAddress] varchar(500)  NOT NULL,
    [buisCity] varchar(500)  NOT NULL,
    [BuisDescription] varchar(500)  NOT NULL,
    [Location_latitude] float  NOT NULL,
    [Location_longitude] float  NOT NULL,
    [Users_BuisnessOwner_userName] varchar(500)  NOT NULL,
    [Category_catName] varchar(500)  NOT NULL
);
GO

-- Creating table 'CatalogCoupons'
CREATE TABLE [dbo].[CatalogCoupons] (
    [catalogID] int IDENTITY(1,1) NOT NULL,
    [CouponName] varchar(500)  NULL,
    [originalPrice] float  NULL,
    [priceAfterDiscount] float  NULL,
    [deadLineForUse] datetime  NULL,
    [averageRank] float  NULL,
    [description] varchar(500)  NULL,
    [Category_catName] varchar(500)  NOT NULL,
    [Users_SystemAdministrator_userName] varchar(500)  NOT NULL,
    [Location_latitude] float  NOT NULL,
    [Location_longitude] float  NOT NULL,
    [Buisness_buisName] varchar(500)  NOT NULL
);
GO

-- Creating table 'CatalogCoupons_SocialNetworkCoupon'
CREATE TABLE [dbo].[CatalogCoupons_SocialNetworkCoupon] (
    [origionWebsite] varchar(500)  NULL,
    [socialCatalogID] int  NOT NULL,
    [Users_Customer_userName] varchar(500)  NOT NULL,
    [CatalogCoupon_catalogID] int  NOT NULL
);
GO

-- Creating table 'Categories'
CREATE TABLE [dbo].[Categories] (
    [catName] varchar(500)  NOT NULL
);
GO

-- Creating table 'Locations'
CREATE TABLE [dbo].[Locations] (
    [latitude] float  NOT NULL,
    [longitude] float  NOT NULL,
    [city] varchar(500)  NULL
);
GO

-- Creating table 'OrderedCoupons'
CREATE TABLE [dbo].[OrderedCoupons] (
    [serialKey] varchar(500)  NOT NULL,
    [rank] smallint  NULL,
    [isUsed] bit  NULL,
    [dateOfUse] datetime  NULL,
    [dateOfPurchase] datetime  NULL,
    [deadLineForUse] datetime  NULL,
    [OrderedCouponUsers_Customer_OrderedCoupon_userName] varchar(500)  NULL,
    [OrderedCouponUsers_Customer1_OrderedCoupon_userName] varchar(500)  NULL,
    [OrderedCouponUsers_Customer2_OrderedCoupon_userName] varchar(500)  NULL,
    [OrderedCouponCatalogCoupon_OrderedCoupon_catalogID] int  NOT NULL,
    [CatalogCouponOrderedCoupon_OrderedCoupon_catalogID] int  NOT NULL,
    [CatalogCoupon_catalogID] int  NOT NULL,
    [Users_Customer_userName] varchar(500)  NOT NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [userName] varchar(500)  NOT NULL,
    [password] varchar(500)  NULL,
    [fullName] varchar(500)  NULL,
    [email] varchar(500)  NULL,
    [phone] varchar(500)  NULL
);
GO

-- Creating table 'Users_BuisnessOwner'
CREATE TABLE [dbo].[Users_BuisnessOwner] (
    [userName] varchar(500)  NOT NULL
);
GO

-- Creating table 'Users_Customer'
CREATE TABLE [dbo].[Users_Customer] (
    [age] smallint  NULL,
    [gender] varchar(500)  NULL,
    [userName] varchar(500)  NOT NULL,
    [Location_latitude] float  NOT NULL,
    [Location_longitude] float  NOT NULL
);
GO

-- Creating table 'Users_SystemAdministrator'
CREATE TABLE [dbo].[Users_SystemAdministrator] (
    [userName] varchar(500)  NOT NULL
);
GO

-- Creating table 'CategoryCustomer'
CREATE TABLE [dbo].[CategoryCustomer] (
    [Categories_catName] varchar(500)  NOT NULL,
    [Users_Customer_userName] varchar(500)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [buisName] in table 'Buisnesses'
ALTER TABLE [dbo].[Buisnesses]
ADD CONSTRAINT [PK_Buisnesses]
    PRIMARY KEY CLUSTERED ([buisName] ASC);
GO

-- Creating primary key on [catalogID] in table 'CatalogCoupons'
ALTER TABLE [dbo].[CatalogCoupons]
ADD CONSTRAINT [PK_CatalogCoupons]
    PRIMARY KEY CLUSTERED ([catalogID] ASC);
GO

-- Creating primary key on [socialCatalogID] in table 'CatalogCoupons_SocialNetworkCoupon'
ALTER TABLE [dbo].[CatalogCoupons_SocialNetworkCoupon]
ADD CONSTRAINT [PK_CatalogCoupons_SocialNetworkCoupon]
    PRIMARY KEY CLUSTERED ([socialCatalogID] ASC);
GO

-- Creating primary key on [catName] in table 'Categories'
ALTER TABLE [dbo].[Categories]
ADD CONSTRAINT [PK_Categories]
    PRIMARY KEY CLUSTERED ([catName] ASC);
GO

-- Creating primary key on [latitude], [longitude] in table 'Locations'
ALTER TABLE [dbo].[Locations]
ADD CONSTRAINT [PK_Locations]
    PRIMARY KEY CLUSTERED ([latitude], [longitude] ASC);
GO

-- Creating primary key on [serialKey] in table 'OrderedCoupons'
ALTER TABLE [dbo].[OrderedCoupons]
ADD CONSTRAINT [PK_OrderedCoupons]
    PRIMARY KEY CLUSTERED ([serialKey] ASC);
GO

-- Creating primary key on [userName] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([userName] ASC);
GO

-- Creating primary key on [userName] in table 'Users_BuisnessOwner'
ALTER TABLE [dbo].[Users_BuisnessOwner]
ADD CONSTRAINT [PK_Users_BuisnessOwner]
    PRIMARY KEY CLUSTERED ([userName] ASC);
GO

-- Creating primary key on [userName] in table 'Users_Customer'
ALTER TABLE [dbo].[Users_Customer]
ADD CONSTRAINT [PK_Users_Customer]
    PRIMARY KEY CLUSTERED ([userName] ASC);
GO

-- Creating primary key on [userName] in table 'Users_SystemAdministrator'
ALTER TABLE [dbo].[Users_SystemAdministrator]
ADD CONSTRAINT [PK_Users_SystemAdministrator]
    PRIMARY KEY CLUSTERED ([userName] ASC);
GO

-- Creating primary key on [Categories_catName], [Users_Customer_userName] in table 'CategoryCustomer'
ALTER TABLE [dbo].[CategoryCustomer]
ADD CONSTRAINT [PK_CategoryCustomer]
    PRIMARY KEY CLUSTERED ([Categories_catName], [Users_Customer_userName] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [userName] in table 'Users_BuisnessOwner'
ALTER TABLE [dbo].[Users_BuisnessOwner]
ADD CONSTRAINT [FK_BuisnessOwner_inherits_User]
    FOREIGN KEY ([userName])
    REFERENCES [dbo].[Users]
        ([userName])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [userName] in table 'Users_Customer'
ALTER TABLE [dbo].[Users_Customer]
ADD CONSTRAINT [FK_Customer_inherits_User]
    FOREIGN KEY ([userName])
    REFERENCES [dbo].[Users]
        ([userName])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [userName] in table 'Users_SystemAdministrator'
ALTER TABLE [dbo].[Users_SystemAdministrator]
ADD CONSTRAINT [FK_SystemAdministrator_inherits_User]
    FOREIGN KEY ([userName])
    REFERENCES [dbo].[Users]
        ([userName])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Categories_catName] in table 'CategoryCustomer'
ALTER TABLE [dbo].[CategoryCustomer]
ADD CONSTRAINT [FK_CategoryCustomer_Categories]
    FOREIGN KEY ([Categories_catName])
    REFERENCES [dbo].[Categories]
        ([catName])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Users_Customer_userName] in table 'CategoryCustomer'
ALTER TABLE [dbo].[CategoryCustomer]
ADD CONSTRAINT [FK_CategoryCustomer_Users_Customer]
    FOREIGN KEY ([Users_Customer_userName])
    REFERENCES [dbo].[Users_Customer]
        ([userName])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_CategoryCustomer_Users_Customer'
CREATE INDEX [IX_FK_CategoryCustomer_Users_Customer]
ON [dbo].[CategoryCustomer]
    ([Users_Customer_userName]);
GO

-- Creating foreign key on [Location_latitude], [Location_longitude] in table 'Buisnesses'
ALTER TABLE [dbo].[Buisnesses]
ADD CONSTRAINT [FK_BuisnessLocation]
    FOREIGN KEY ([Location_latitude], [Location_longitude])
    REFERENCES [dbo].[Locations]
        ([latitude], [longitude])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_BuisnessLocation'
CREATE INDEX [IX_FK_BuisnessLocation]
ON [dbo].[Buisnesses]
    ([Location_latitude], [Location_longitude]);
GO

-- Creating foreign key on [Users_BuisnessOwner_userName] in table 'Buisnesses'
ALTER TABLE [dbo].[Buisnesses]
ADD CONSTRAINT [FK_BuisnessUsers_BuisnessOwner]
    FOREIGN KEY ([Users_BuisnessOwner_userName])
    REFERENCES [dbo].[Users_BuisnessOwner]
        ([userName])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_BuisnessUsers_BuisnessOwner'
CREATE INDEX [IX_FK_BuisnessUsers_BuisnessOwner]
ON [dbo].[Buisnesses]
    ([Users_BuisnessOwner_userName]);
GO

-- Creating foreign key on [Category_catName] in table 'Buisnesses'
ALTER TABLE [dbo].[Buisnesses]
ADD CONSTRAINT [FK_BuisnessCategory]
    FOREIGN KEY ([Category_catName])
    REFERENCES [dbo].[Categories]
        ([catName])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_BuisnessCategory'
CREATE INDEX [IX_FK_BuisnessCategory]
ON [dbo].[Buisnesses]
    ([Category_catName]);
GO

-- Creating foreign key on [Location_latitude], [Location_longitude] in table 'Users_Customer'
ALTER TABLE [dbo].[Users_Customer]
ADD CONSTRAINT [FK_Users_CustomerLocation]
    FOREIGN KEY ([Location_latitude], [Location_longitude])
    REFERENCES [dbo].[Locations]
        ([latitude], [longitude])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Users_CustomerLocation'
CREATE INDEX [IX_FK_Users_CustomerLocation]
ON [dbo].[Users_Customer]
    ([Location_latitude], [Location_longitude]);
GO

-- Creating foreign key on [Users_Customer_userName] in table 'CatalogCoupons_SocialNetworkCoupon'
ALTER TABLE [dbo].[CatalogCoupons_SocialNetworkCoupon]
ADD CONSTRAINT [FK_Users_CustomerCatalogCoupons_SocialNetworkCoupon]
    FOREIGN KEY ([Users_Customer_userName])
    REFERENCES [dbo].[Users_Customer]
        ([userName])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Users_CustomerCatalogCoupons_SocialNetworkCoupon'
CREATE INDEX [IX_FK_Users_CustomerCatalogCoupons_SocialNetworkCoupon]
ON [dbo].[CatalogCoupons_SocialNetworkCoupon]
    ([Users_Customer_userName]);
GO

-- Creating foreign key on [OrderedCouponUsers_Customer_OrderedCoupon_userName] in table 'OrderedCoupons'
ALTER TABLE [dbo].[OrderedCoupons]
ADD CONSTRAINT [FK_OrderedCouponUsers_Customer]
    FOREIGN KEY ([OrderedCouponUsers_Customer_OrderedCoupon_userName])
    REFERENCES [dbo].[Users_Customer]
        ([userName])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderedCouponUsers_Customer'
CREATE INDEX [IX_FK_OrderedCouponUsers_Customer]
ON [dbo].[OrderedCoupons]
    ([OrderedCouponUsers_Customer_OrderedCoupon_userName]);
GO

-- Creating foreign key on [OrderedCouponUsers_Customer1_OrderedCoupon_userName] in table 'OrderedCoupons'
ALTER TABLE [dbo].[OrderedCoupons]
ADD CONSTRAINT [FK_OrderedCouponUsers_Customer1]
    FOREIGN KEY ([OrderedCouponUsers_Customer1_OrderedCoupon_userName])
    REFERENCES [dbo].[Users_Customer]
        ([userName])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderedCouponUsers_Customer1'
CREATE INDEX [IX_FK_OrderedCouponUsers_Customer1]
ON [dbo].[OrderedCoupons]
    ([OrderedCouponUsers_Customer1_OrderedCoupon_userName]);
GO

-- Creating foreign key on [OrderedCouponUsers_Customer2_OrderedCoupon_userName] in table 'OrderedCoupons'
ALTER TABLE [dbo].[OrderedCoupons]
ADD CONSTRAINT [FK_OrderedCouponUsers_Customer2]
    FOREIGN KEY ([OrderedCouponUsers_Customer2_OrderedCoupon_userName])
    REFERENCES [dbo].[Users_Customer]
        ([userName])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderedCouponUsers_Customer2'
CREATE INDEX [IX_FK_OrderedCouponUsers_Customer2]
ON [dbo].[OrderedCoupons]
    ([OrderedCouponUsers_Customer2_OrderedCoupon_userName]);
GO

-- Creating foreign key on [OrderedCouponCatalogCoupon_OrderedCoupon_catalogID] in table 'OrderedCoupons'
ALTER TABLE [dbo].[OrderedCoupons]
ADD CONSTRAINT [FK_OrderedCouponCatalogCoupon]
    FOREIGN KEY ([OrderedCouponCatalogCoupon_OrderedCoupon_catalogID])
    REFERENCES [dbo].[CatalogCoupons]
        ([catalogID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderedCouponCatalogCoupon'
CREATE INDEX [IX_FK_OrderedCouponCatalogCoupon]
ON [dbo].[OrderedCoupons]
    ([OrderedCouponCatalogCoupon_OrderedCoupon_catalogID]);
GO

-- Creating foreign key on [CatalogCouponOrderedCoupon_OrderedCoupon_catalogID] in table 'OrderedCoupons'
ALTER TABLE [dbo].[OrderedCoupons]
ADD CONSTRAINT [FK_CatalogCouponOrderedCoupon]
    FOREIGN KEY ([CatalogCouponOrderedCoupon_OrderedCoupon_catalogID])
    REFERENCES [dbo].[CatalogCoupons]
        ([catalogID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_CatalogCouponOrderedCoupon'
CREATE INDEX [IX_FK_CatalogCouponOrderedCoupon]
ON [dbo].[OrderedCoupons]
    ([CatalogCouponOrderedCoupon_OrderedCoupon_catalogID]);
GO

-- Creating foreign key on [CatalogCoupon_catalogID] in table 'OrderedCoupons'
ALTER TABLE [dbo].[OrderedCoupons]
ADD CONSTRAINT [FK_CatalogCouponOrderedCoupon1]
    FOREIGN KEY ([CatalogCoupon_catalogID])
    REFERENCES [dbo].[CatalogCoupons]
        ([catalogID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_CatalogCouponOrderedCoupon1'
CREATE INDEX [IX_FK_CatalogCouponOrderedCoupon1]
ON [dbo].[OrderedCoupons]
    ([CatalogCoupon_catalogID]);
GO

-- Creating foreign key on [Users_Customer_userName] in table 'OrderedCoupons'
ALTER TABLE [dbo].[OrderedCoupons]
ADD CONSTRAINT [FK_OrderedCouponUsers_Customer3]
    FOREIGN KEY ([Users_Customer_userName])
    REFERENCES [dbo].[Users_Customer]
        ([userName])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderedCouponUsers_Customer3'
CREATE INDEX [IX_FK_OrderedCouponUsers_Customer3]
ON [dbo].[OrderedCoupons]
    ([Users_Customer_userName]);
GO

-- Creating foreign key on [Category_catName] in table 'CatalogCoupons'
ALTER TABLE [dbo].[CatalogCoupons]
ADD CONSTRAINT [FK_CategoryCatalogCoupon]
    FOREIGN KEY ([Category_catName])
    REFERENCES [dbo].[Categories]
        ([catName])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_CategoryCatalogCoupon'
CREATE INDEX [IX_FK_CategoryCatalogCoupon]
ON [dbo].[CatalogCoupons]
    ([Category_catName]);
GO

-- Creating foreign key on [Users_SystemAdministrator_userName] in table 'CatalogCoupons'
ALTER TABLE [dbo].[CatalogCoupons]
ADD CONSTRAINT [FK_Users_SystemAdministratorCatalogCoupon]
    FOREIGN KEY ([Users_SystemAdministrator_userName])
    REFERENCES [dbo].[Users_SystemAdministrator]
        ([userName])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Users_SystemAdministratorCatalogCoupon'
CREATE INDEX [IX_FK_Users_SystemAdministratorCatalogCoupon]
ON [dbo].[CatalogCoupons]
    ([Users_SystemAdministrator_userName]);
GO

-- Creating foreign key on [Location_latitude], [Location_longitude] in table 'CatalogCoupons'
ALTER TABLE [dbo].[CatalogCoupons]
ADD CONSTRAINT [FK_CatalogCouponLocation]
    FOREIGN KEY ([Location_latitude], [Location_longitude])
    REFERENCES [dbo].[Locations]
        ([latitude], [longitude])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_CatalogCouponLocation'
CREATE INDEX [IX_FK_CatalogCouponLocation]
ON [dbo].[CatalogCoupons]
    ([Location_latitude], [Location_longitude]);
GO

-- Creating foreign key on [Buisness_buisName] in table 'CatalogCoupons'
ALTER TABLE [dbo].[CatalogCoupons]
ADD CONSTRAINT [FK_BuisnessCatalogCoupon]
    FOREIGN KEY ([Buisness_buisName])
    REFERENCES [dbo].[Buisnesses]
        ([buisName])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_BuisnessCatalogCoupon'
CREATE INDEX [IX_FK_BuisnessCatalogCoupon]
ON [dbo].[CatalogCoupons]
    ([Buisness_buisName]);
GO

-- Creating foreign key on [CatalogCoupon_catalogID] in table 'CatalogCoupons_SocialNetworkCoupon'
ALTER TABLE [dbo].[CatalogCoupons_SocialNetworkCoupon]
ADD CONSTRAINT [FK_CatalogCoupons_SocialNetworkCouponCatalogCoupon]
    FOREIGN KEY ([CatalogCoupon_catalogID])
    REFERENCES [dbo].[CatalogCoupons]
        ([catalogID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_CatalogCoupons_SocialNetworkCouponCatalogCoupon'
CREATE INDEX [IX_FK_CatalogCoupons_SocialNetworkCouponCatalogCoupon]
ON [dbo].[CatalogCoupons_SocialNetworkCoupon]
    ([CatalogCoupon_catalogID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------