-- Stores the different product categories used to organise products
-- Each product is linked to one category using CategoryId

CREATE TABLE [dbo].[Categories]
(
	[CategoryId] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [CategoryName] VARCHAR(100) NOT NULL UNIQUE,
    [Description] VARCHAR(255) NULL,
    [IsActive] BIT NOT NULL DEFAULT 1
)
