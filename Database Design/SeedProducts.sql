/*
    Product seed data for Agri Market.

    Prerequisite: at least one row must already exist in dbo.FarmerDetails.
    The script uses the first approved farmer, falling back to the first farmer.
    It can be run more than once: existing product names are not duplicated.
*/
SET NOCOUNT ON;
SET XACT_ABORT ON;

DECLARE @FarmerId INT =
(
    SELECT TOP (1) FarmerId
    FROM dbo.FarmerDetails
    ORDER BY CASE WHEN IsApproved = 1 THEN 0 ELSE 1 END, FarmerId
);

IF @FarmerId IS NULL
BEGIN
    RAISERROR ('Seed products requires at least one farmer in dbo.FarmerDetails.', 16, 1);
    RETURN;
END;

BEGIN TRANSACTION;

INSERT INTO dbo.Categories (CategoryName, Description, IsActive)
SELECT source.CategoryName, source.Description, 1
FROM (VALUES
    ('Fruits', 'Fresh seasonal fruit'),
    ('Vegetables', 'Fresh farm vegetables'),
  
) AS source (CategoryName, Description)
WHERE NOT EXISTS
(
    SELECT 1
    FROM dbo.Categories AS categoryRow
    WHERE categoryRow.CategoryName = source.CategoryName
);



IINSERT INTO dbo.Products
(
    CategoryId,
    FarmerId,
    ProductName,
    Description,
    Price,
    UnitOfMeasure,
    StockQuantity,
    ImageUrl,
    DateCreated,
    IsActive
)
VALUES

-- FRUITS - CategoryId = 1

(1, 1, 'Apples', 
 'Fresh and crispy apples', 
 28.00, 'kg', 50, 'img/apples.png', SYSDATETIME(), 1),

(1, 1, 'Oranges', 
 'Fresh and juicy oranges', 
 30.00, 'kg', 45, 'img/oranges.png', SYSDATETIME(), 1),

(1, 1, 'Grapes', 
 'Fresh sweet grapes', 
 45.00, 'kg', 35, 'img/grapes.png', SYSDATETIME(), 1),

(1, 1, 'Bananas', 
 'Fresh ripe bananas', 
 22.00, 'kg', 60, 'img/bananas.png', SYSDATETIME(), 1),

(1, 1, 'Apricots', 
 'Fresh ripe apricots', 
 30.00, 'kg', 30, 'img/apricots.png', SYSDATETIME(), 1),

(1, 1, 'Raspberries', 
 'Fresh sweet raspberries', 
 40.00, 'kg', 25, 'img/raspberries.png', SYSDATETIME(), 1),

(1, 1, 'Pears', 
 'Fresh and juicy pears', 
 27.00, 'kg', 40, 'img/pears.png', SYSDATETIME(), 1),

(1, 1, 'Peaches', 
 'Fresh ripe peaches', 
 32.00, 'kg', 35, 'img/peaches.png', SYSDATETIME(), 1),

(1, 1, 'Plums', 
 'Fresh ripe plums', 
 29.00, 'kg', 30, 'img/plums.png', SYSDATETIME(), 1),

(1, 1, 'Lemons', 
 'Fresh lemons', 
 18.00, 'kg', 50, 'img/lemons.png', SYSDATETIME(), 1),

(1, 1, 'Strawberries', 
 'Fresh sweet strawberries', 
 35.00, 'kg', 30, 'img/strawberries.png', SYSDATETIME(), 1),


-- VEGETABLES - CategoryId=2
(2, 1, 'Bell Peppers', 
 'Fresh colourful bell peppers', 
 28.00, 'kg', 30, 'img/bellpeppers.png', SYSDATETIME(), 1),

(2, 1, 'Potatoes', 
 'Fresh farm potatoes', 
 18.00, 'kg', 70, 'img/potatoes.png', SYSDATETIME(), 1),

(2, 1, 'Parsley', 
 'Fresh green parsley', 
 12.00, 'bunch', 40, 'img/parsley.png', SYSDATETIME(), 1),

(2, 1, 'Tomatoes', 
 'Fresh ripe tomatoes', 
 26.00, 'kg', 55, 'img/tomatoes.png', SYSDATETIME(), 1),

(2, 1, 'Carrots', 
 'Fresh crunchy carrots', 
 24.00, 'kg', 50, 'img/carrots.png', SYSDATETIME(), 1),

(2, 1, 'Onions', 
 'Fresh farm onions', 
 17.00, 'kg', 65, 'img/onions.png', SYSDATETIME(), 1),

(2, 1, 'Cabbage', 
 'Fresh green cabbage', 
 16.00, 'each', 35, 'img/cabbage.png', SYSDATETIME(), 1),

(2, 1, 'Spinach', 
 'Fresh green spinach', 
 18.00, 'bunch', 45, 'img/spinach.png', SYSDATETIME(), 1),

(2, 1, 'Cucumbers', 
 'Fresh crisp cucumbers', 
 21.00, 'kg', 40, 'img/cucumbers.png', SYSDATETIME(), 1),

(2, 1, 'Broccoli', 
 'Fresh green broccoli', 
 26.00, 'kg', 30, 'img/broccoli.png', SYSDATETIME(), 1);