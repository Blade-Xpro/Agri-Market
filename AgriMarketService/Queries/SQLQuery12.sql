-- Stores discount codes with fixed monetary amounts deducted at checkout.
CREATE TABLE [dbo].[Discounts]
(
    [DiscountId] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [DiscountCode] VARCHAR(50) NOT NULL UNIQUE,
    [DiscountAmount] DECIMAL(10,2) NOT NULL,

    CHECK (LEN(LTRIM(RTRIM([DiscountCode]))) > 0),
    CHECK ([DiscountAmount] >= 0)
);

