-- Stores customer ratings and comments for products they have purchased
-- UserId identifies the customer, while ProductId identifies the reviewed product

CREATE TABLE [dbo].[ProductReviews]
(
    [ReviewId] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [UserId] INT NOT NULL,
    [ProductId] INT NOT NULL,
    [Rating] INT NOT NULL,
    [ReviewText] VARCHAR(1000) NULL,
    [ReviewDate] DATETIME NOT NULL DEFAULT GETDATE(),
    [UpdatedDate] DATETIME NULL,

    FOREIGN KEY ([UserId])REFERENCES [dbo].[UserTable]([Id]),

    FOREIGN KEY ([ProductId]) REFERENCES [dbo].[Products]([ProductId]),
    CHECK ([Rating] BETWEEN 1 AND 5)
);
