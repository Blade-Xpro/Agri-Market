-- Stores each completed customer order and the calculated transaction totals
-- UserId links the order to the customer who placed it

CREATE TABLE [dbo].[Orders] (
    [OrderId]         INT             IDENTITY (1, 1) NOT NULL,
    [UserId]          INT             NOT NULL,
    [OrderDate]       DATETIME        DEFAULT (getdate()) NOT NULL,
    [OrderStatus]     VARCHAR (30)    NOT NULL,
    [DeliveryMethod]  VARCHAR (20)    NOT NULL,
    [DeliveryAddress] VARCHAR (255)   NULL,
    [Subtotal]        DECIMAL (10, 2) NOT NULL,
    [TaxAmount]       DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    [DiscountAmount]  DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    [DeliveryFee]     DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    [TotalAmount]     DECIMAL (10, 2) NOT NULL,
    PRIMARY KEY CLUSTERED ([OrderId] ASC),
    FOREIGN KEY ([UserId]) REFERENCES [dbo].[UserTable] ([Id]),
    CHECK ([Subtotal]>=(0)),
    CHECK ([TaxAmount]>=(0)),
    CHECK ([DiscountAmount]>=(0)),
    CHECK ([DeliveryFee]>=(0)),
    CHECK ([TotalAmount]>=(0))
);

