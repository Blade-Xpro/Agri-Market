-- Stores the individual products added to a shopping cart
-- CartId identifies the cart, while ProductId identifies the product added

CREATE TABLE [dbo].[ShoppingCartItems]
(
	[CartItemId] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	[ShoppingCartId] INT NOT NULL,
    [ProductId] INT NOT NULL,
    [Quantity] DECIMAL(10,2) NOT NULL,
    [DateAdded] DATETIME NOT NULL DEFAULT GETDATE(),

    FOREIGN KEY ([ShoppingCartId]) REFERENCES [dbo].[ShoppingCart]([ShoppingCartId]),
    FOREIGN KEY ([ProductId]) REFERENCES [dbo].[Products]([ProductId]),

    CHECK ([Quantity] > 0)
)
