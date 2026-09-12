-- Stores the individual products included in each order
-- OrderId links the item to an order, while ProductId links it to the purchased product

CREATE TABLE [dbo].[OrderItems]
(
    [OrderItemId] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [OrderId] INT NOT NULL,
    [ProductId] INT NOT NULL,
    [ProductName] VARCHAR(100) NOT NULL,
    [UnitPrice] DECIMAL(10,2) NOT NULL,
    [Quantity] DECIMAL(10,2) NOT NULL,

	--LineTotal = UnitPrice × Quantity
    [LineTotal] DECIMAL(10,2) NOT NULL,

    FOREIGN KEY ([OrderId])  REFERENCES [dbo].[Orders]([OrderId]),
    FOREIGN KEY ([ProductId])   REFERENCES [dbo].[Products]([ProductId]),

    CHECK ([UnitPrice] >= 0),
    CHECK ([Quantity] > 0),
    CHECK ([LineTotal] >= 0)
);
