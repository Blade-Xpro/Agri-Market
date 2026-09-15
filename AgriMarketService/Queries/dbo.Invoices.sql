-- Stores invoice details for completed orders
-- OrderId links each invoice to the order it was generated from

CREATE TABLE [dbo].[Invoices]
(
    [InvoiceId] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [OrderId] INT NOT NULL UNIQUE,
    [InvoiceNumber] VARCHAR(30) NOT NULL,
    [InvoiceDate] DATETIME NOT NULL DEFAULT GETDATE(),

    FOREIGN KEY ([OrderId])   REFERENCES [dbo].[Orders]([OrderId])
);
