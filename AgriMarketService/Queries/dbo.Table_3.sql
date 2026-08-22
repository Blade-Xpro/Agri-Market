-- Stores all products sold on the system, including price, stock and product details
-- CategoryId links the product to a category, while FarmerId links it to the supplying farmer

CREATE TABLE [dbo].[Products]
(
    [ProductId] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,

    [CategoryId] INT NOT NULL,
    [FarmerId] INT NOT NULL,

    [ProductName] VARCHAR(100) NOT NULL,
    [Description] VARCHAR(500) NULL,

    [Price] DECIMAL(10,2) NOT NULL,
    [UnitOfMeasure] VARCHAR(30) NOT NULL,
    [StockQuantity] DECIMAL(10,2) NOT NULL DEFAULT 0,

    [ImageUrl] VARCHAR(255) NULL,

    [DateCreated] DATETIME NOT NULL DEFAULT GETDATE(),
    [IsActive] BIT NOT NULL DEFAULT 1,

    FOREIGN KEY ([CategoryId])
        REFERENCES [dbo].[Categories]([CategoryId]),

    FOREIGN KEY ([FarmerId])
        REFERENCES [dbo].[FarmerDetails]([FarmerId]),

    CHECK ([Price] >= 0),
    CHECK ([StockQuantity] >= 0)
);
