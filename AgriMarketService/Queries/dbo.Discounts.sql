-- Run against an existing Agri Market database to add the Discounts table.
-- Amounts are fixed monetary values, matching the checkout calculation.
CREATE TABLE [dbo].[Discounts]
(
    [DiscountId] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [DiscountCode] VARCHAR(50) NOT NULL UNIQUE,
    [DiscountAmount] DECIMAL(10,2) NOT NULL,

    CHECK (LEN(LTRIM(RTRIM([DiscountCode]))) > 0),
    CHECK ([DiscountAmount] >= 0)
);
