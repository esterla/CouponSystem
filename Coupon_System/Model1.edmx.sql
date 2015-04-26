
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/24/2015 00:29:14
-- Generated from EDMX file: C:\לימודים\ניתוץ\Coupon_System\Coupon_System\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [CS_DB];
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

-- Creating table 'Buisnesses'
CREATE TABLE [dbo].[Buisnesses] (
    [buisName] varchar(500)  NOT NULL,
    [buisAddress] varchar(500)  NULL,
    [buisCity] varchar(500)  NULL,
    [BuisDescription] varchar(500)  NULL,
    [Location_latitude] float  NULL,
    [Location_longitude] float  NULL,
    [Category_name] varchar(500)  NULL,
    [Location_latitude1] float  NULL,
    [Location_longitude1] float  NULL,
    [BuisnessOwner_userName] varchar(500)  NULL
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
    [Location_latitude] float  NULL,
    [Location_longitude] float  NULL,
    [description] varchar(500)  NULL,
    [SystemAdministrator_userName] varchar(500)  NULL,
    [Buisness_name] varchar(500)  NULL,
    [Category_name] varchar(500)  NULL
);
GO

-- Creating table 'CatalogCoupons_SocialNetworkCoupon'
CREATE TABLE [dbo].[CatalogCoupons_SocialNetworkCoupon] (
    [origionWebsite] varchar(500)  NULL,
    [Customer_userName] varchar(500)  NULL,
    [Customer_userName1] varchar(500)  NULL,
    [catalogID] int  NOT NULL
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
    [CatalogCoupon_catalogID] int  NULL,
    [User_userName] varchar(500)  NULL
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
    [Location_latitude] float  NULL,
    [Location_longitude] float  NULL,
    [userName] varchar(500)  NOT NULL
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

-- Creating primary key on [catalogID] in table 'CatalogCoupons_SocialNetworkCoupon'
ALTER TABLE [dbo].[CatalogCoupons_SocialNetworkCoupon]
ADD CONSTRAINT [PK_CatalogCoupons_SocialNetworkCoupon]
    PRIMARY KEY CLUSTERED ([catalogID] ASC);
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

-- Creating foreign key on [BuisnessOwner_userName] in table 'Buisnesses'
ALTER TABLE [dbo].[Buisnesses]
ADD CONSTRAINT [FK_BuisnessBuisnessOwner]
    FOREIGN KEY ([BuisnessOwner_userName])
    REFERENCES [dbo].[Users_BuisnessOwner]
        ([userName])
    ON DELETE CASCADE ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_BuisnessBuisnessOwner'
CREATE INDEX [IX_FK_BuisnessBuisnessOwner]
ON [dbo].[Buisnesses]
    ([BuisnessOwner_userName]);
GO

-- Creating foreign key on [Buisness_name] in table 'CatalogCoupons'
ALTER TABLE [dbo].[CatalogCoupons]
ADD CONSTRAINT [FK_CatalogCouponBuisness]
    FOREIGN KEY ([Buisness_name])
    REFERENCES [dbo].[Buisnesses]
        ([buisName])
    ON DELETE CASCADE ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_CatalogCouponBuisness'
CREATE INDEX [IX_FK_CatalogCouponBuisness]
ON [dbo].[CatalogCoupons]
    ([Buisness_name]);
GO

-- Creating foreign key on [Category_name] in table 'Buisnesses'
ALTER TABLE [dbo].[Buisnesses]
ADD CONSTRAINT [FK_CategoryBuisness]
    FOREIGN KEY ([Category_name])
    REFERENCES [dbo].[Categories]
        ([catName])
    ON DELETE CASCADE ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_CategoryBuisness'
CREATE INDEX [IX_FK_CategoryBuisness]
ON [dbo].[Buisnesses]
    ([Category_name]);
GO

-- Creating foreign key on [CatalogCoupon_catalogID] in table 'OrderedCoupons'
ALTER TABLE [dbo].[OrderedCoupons]
ADD CONSTRAINT [FK_CatalogCouponOrderedCoupon]
    FOREIGN KEY ([CatalogCoupon_catalogID])
    REFERENCES [dbo].[CatalogCoupons]
        ([catalogID])
    ON DELETE CASCADE ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_CatalogCouponOrderedCoupon'
CREATE INDEX [IX_FK_CatalogCouponOrderedCoupon]
ON [dbo].[OrderedCoupons]
    ([CatalogCoupon_catalogID]);
GO

-- Creating foreign key on [SystemAdministrator_userName] in table 'CatalogCoupons'
ALTER TABLE [dbo].[CatalogCoupons]
ADD CONSTRAINT [FK_CatalogCouponSystemAdministrator]
    FOREIGN KEY ([SystemAdministrator_userName])
    REFERENCES [dbo].[Users_SystemAdministrator]
        ([userName])
    ON DELETE CASCADE ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_CatalogCouponSystemAdministrator'
CREATE INDEX [IX_FK_CatalogCouponSystemAdministrator]
ON [dbo].[CatalogCoupons]
    ([SystemAdministrator_userName]);
GO

-- Creating foreign key on [Location_latitude], [Location_longitude] in table 'CatalogCoupons'
ALTER TABLE [dbo].[CatalogCoupons]
ADD CONSTRAINT [FK_LocationCatalogCoupon]
    FOREIGN KEY ([Location_latitude], [Location_longitude])
    REFERENCES [dbo].[Locations]
        ([latitude], [longitude])
    ON DELETE CASCADE ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_LocationCatalogCoupon'
CREATE INDEX [IX_FK_LocationCatalogCoupon]
ON [dbo].[CatalogCoupons]
    ([Location_latitude], [Location_longitude]);
GO

-- Creating foreign key on [Customer_userName1] in table 'CatalogCoupons_SocialNetworkCoupon'
ALTER TABLE [dbo].[CatalogCoupons_SocialNetworkCoupon]
ADD CONSTRAINT [FK_CustomerSocialNetworkCoupon]
    FOREIGN KEY ([Customer_userName1])
    REFERENCES [dbo].[Users_Customer]
        ([userName])
    ON DELETE CASCADE ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_CustomerSocialNetworkCoupon'
CREATE INDEX [IX_FK_CustomerSocialNetworkCoupon]
ON [dbo].[CatalogCoupons_SocialNetworkCoupon]
    ([Customer_userName1]);
GO

-- Creating foreign key on [Location_latitude], [Location_longitude] in table 'Users_Customer'
ALTER TABLE [dbo].[Users_Customer]
ADD CONSTRAINT [FK_LocationCustomer]
    FOREIGN KEY ([Location_latitude], [Location_longitude])
    REFERENCES [dbo].[Locations]
        ([latitude], [longitude])
    ON DELETE CASCADE ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_LocationCustomer'
CREATE INDEX [IX_FK_LocationCustomer]
ON [dbo].[Users_Customer]
    ([Location_latitude], [Location_longitude]);
GO

-- Creating foreign key on [User_userName] in table 'OrderedCoupons'
ALTER TABLE [dbo].[OrderedCoupons]
ADD CONSTRAINT [FK_UserOrderedCoupon]
    FOREIGN KEY ([User_userName])
    REFERENCES [dbo].[Users]
        ([userName])
    ON DELETE CASCADE ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_UserOrderedCoupon'
CREATE INDEX [IX_FK_UserOrderedCoupon]
ON [dbo].[OrderedCoupons]
    ([User_userName]);
GO

-- Creating foreign key on [userName] in table 'Users_Customer'
ALTER TABLE [dbo].[Users_Customer]
ADD CONSTRAINT [FK_Customer_inherits_User]
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

-- Creating foreign key on [Location_latitude1], [Location_longitude1] in table 'Buisnesses'
ALTER TABLE [dbo].[Buisnesses]
ADD CONSTRAINT [FK_BuisnessLocation]
    FOREIGN KEY ([Location_latitude1], [Location_longitude1])
    REFERENCES [dbo].[Locations]
        ([latitude], [longitude])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_BuisnessLocation'
CREATE INDEX [IX_FK_BuisnessLocation]
ON [dbo].[Buisnesses]
    ([Location_latitude1], [Location_longitude1]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------