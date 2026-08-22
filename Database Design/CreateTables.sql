-- Stores all system users, including Customers, Farmers and Admins.
-- The userType field determines what functionality each user can access.
CREATE TABLE [dbo].[UserTable]
(
    [Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [Name] VARCHAR(50) NOT NULL,
    [Surname] VARCHAR(50) NOT NULL,
    [phoneNumber] VARCHAR(20) NOT NULL,
    [passwordHash] VARCHAR(255) NOT NULL,
    [email] VARCHAR(100) NOT NULL UNIQUE,
    [userType] VARCHAR(20) NOT NULL,
    [creationDate] DATETIME NOT NULL DEFAULT GETDATE()
);


-- Stores additional information for users whose userType is Farmer.
-- FarmerId links the farmer details to the matching user in UserTable.
CREATE TABLE [dbo].[FarmerDetails]
(
    [FarmerId] INT NOT NULL PRIMARY KEY,
    [FarmName] VARCHAR(100) NOT NULL,
    [FarmLocation] VARCHAR(150) NOT NULL,
    [FarmDescription] VARCHAR(500) NULL,
    [IsApproved] BIT NOT NULL DEFAULT 0,

    FOREIGN KEY ([FarmerId])
        REFERENCES [dbo].[UserTable]([Id])
);


-- Stores the different product categories used to organise products.
-- Each product is linked to one category using CategoryId.
CREATE TABLE [dbo].[Categories]
(
    [CategoryId] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [CategoryName] VARCHAR(100) NOT NULL UNIQUE,
    [Description] VARCHAR(255) NULL,
    [IsActive] BIT NOT NULL DEFAULT 1
);


-- Stores all products sold on the system, including price, stock and product details.
-- CategoryId links the product to a category, while FarmerId links it to the supplying farmer.
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


-- Stores each customer's shopping cart before checkout.
-- UserId links the cart to the customer who owns it.
CREATE TABLE [dbo].[ShoppingCart]
(
    [CartId] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [UserId] INT NOT NULL,
    [CreatedDate] DATETIME NOT NULL DEFAULT GETDATE(),
    [UpdatedDate] DATETIME NULL,
    [IsActive] BIT NOT NULL DEFAULT 1,

    FOREIGN KEY ([UserId])
        REFERENCES [dbo].[UserTable]([Id])
);


-- Stores the individual products added to a shopping cart.
-- CartId identifies the cart, while ProductId identifies the product added.
CREATE TABLE [dbo].[ShoppingCartItems]
(
    [CartItemId] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [CartId] INT NOT NULL,
    [ProductId] INT NOT NULL,
    [Quantity] DECIMAL(10,2) NOT NULL,
    [DateAdded] DATETIME NOT NULL DEFAULT GETDATE(),

    FOREIGN KEY ([CartId])
        REFERENCES [dbo].[ShoppingCart]([CartId]),

    FOREIGN KEY ([ProductId])
        REFERENCES [dbo].[Products]([ProductId]),

    CHECK ([Quantity] > 0)
);


-- Stores each completed customer order and the calculated transaction totals.
-- UserId links the order to the customer who placed it.
CREATE TABLE [dbo].[Orders]
(
    [OrderId] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [UserId] INT NOT NULL,
    [OrderDate] DATETIME NOT NULL DEFAULT GETDATE(),
    [OrderStatus] VARCHAR(30) NOT NULL,
    [DeliveryMethod] VARCHAR(20) NOT NULL,
    [DeliveryAddress] VARCHAR(255) NULL,
    [Subtotal] DECIMAL(10,2) NOT NULL,
    [TaxAmount] DECIMAL(10,2) NOT NULL DEFAULT 0,
    [DiscountAmount] DECIMAL(10,2) NOT NULL DEFAULT 0,
    [DeliveryFee] DECIMAL(10,2) NOT NULL DEFAULT 0,
    [TotalAmount] DECIMAL(10,2) NOT NULL,

    FOREIGN KEY ([UserId])
        REFERENCES [dbo].[UserTable]([Id]),

    CHECK ([Subtotal] >= 0),
    CHECK ([TaxAmount] >= 0),
    CHECK ([DiscountAmount] >= 0),
    CHECK ([DeliveryFee] >= 0),
    CHECK ([TotalAmount] >= 0)
);


-- Stores the individual products included in each order.
-- OrderId links the item to an order, while ProductId links it to the purchased product.
CREATE TABLE [dbo].[OrderItems]
(
    [OrderItemId] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [OrderId] INT NOT NULL,
    [ProductId] INT NOT NULL,
    [ProductName] VARCHAR(100) NOT NULL,
    [UnitPrice] DECIMAL(10,2) NOT NULL,
    [Quantity] DECIMAL(10,2) NOT NULL,
    [LineTotal] DECIMAL(10,2) NOT NULL,

    FOREIGN KEY ([OrderId])
        REFERENCES [dbo].[Orders]([OrderId]),

    FOREIGN KEY ([ProductId])
        REFERENCES [dbo].[Products]([ProductId]),

    CHECK ([UnitPrice] >= 0),
    CHECK ([Quantity] > 0),
    CHECK ([LineTotal] >= 0)
);


-- Stores invoice details for completed orders.
-- OrderId links each invoice to the order it was generated from.
CREATE TABLE [dbo].[Invoices]
(
    [InvoiceId] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [OrderId] INT NOT NULL UNIQUE,
    [InvoiceNumber] VARCHAR(30) NOT NULL,
    [InvoiceDate] DATETIME NOT NULL DEFAULT GETDATE(),

    FOREIGN KEY ([OrderId])
        REFERENCES [dbo].[Orders]([OrderId])
);


-- Stores customer ratings and comments for products they have purchased.
-- UserId identifies the customer, while ProductId identifies the reviewed product.
CREATE TABLE [dbo].[ProductReviews]
(
    [ReviewId] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [UserId] INT NOT NULL,
    [ProductId] INT NOT NULL,
    [Rating] INT NOT NULL,
    [ReviewText] VARCHAR(1000) NULL,
    [ReviewDate] DATETIME NOT NULL DEFAULT GETDATE(),
    [UpdatedDate] DATETIME NULL,

    FOREIGN KEY ([UserId])
        REFERENCES [dbo].[UserTable]([Id]),

    FOREIGN KEY ([ProductId])
        REFERENCES [dbo].[Products]([ProductId]),

    CHECK ([Rating] BETWEEN 1 AND 5)
);