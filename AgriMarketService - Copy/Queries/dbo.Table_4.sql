-- Stores each customer's shopping cart before checkout
-- UserId links the cart to the customer who owns it

CREATE TABLE [dbo].[ShoppingCart]
(
	[ShoppingCartId] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	[UserId] INT NOT NULL,
    [CreatedDate] DATETIME NOT NULL DEFAULT GETDATE(),
    [UpdatedDate] DATETIME NULL,
    [IsActive] BIT NOT NULL DEFAULT 1,

    FOREIGN KEY ([UserId]) REFERENCES [dbo].[UserTable]([Id])
)
