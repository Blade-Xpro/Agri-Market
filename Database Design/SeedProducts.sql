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
    ('Grains', 'Whole grains and cereal crops'),
    ('Legumes', 'Protein-rich beans and pulses'),
    ('Herbs', 'Fresh culinary herbs')
) AS source (CategoryName, Description)
WHERE NOT EXISTS
(
    SELECT 1
    FROM dbo.Categories AS categoryRow
    WHERE categoryRow.CategoryName = source.CategoryName
);



INSERT INTO @Products
    (CategoryName, ProductName, Description, Price, UnitOfMeasure, StockQuantity, ImageUrl)
VALUES
    ('Fruits', 'Apples', 'Crisp, sweet apples picked fresh from the orchard.', 28.00, 'kg', 85.00, 'img/fruite-item-1.jpg'),
    ('Fruits', 'Bananas', 'Naturally sweet bananas, ideal for snacks and smoothies.', 22.00, 'kg', 120.00, 'img/fruite-item-3.jpg'),
    ('Fruits', 'Oranges', 'Juicy vitamin C rich oranges.', 30.00, 'kg', 95.00, 'img/fruite-item-4.jpg'),
    ('Fruits', 'Table Grapes', 'Seedless grapes with a crisp, refreshing flavour.', 45.00, 'kg', 60.00, 'img/fruite-item-5.jpg'),
    ('Fruits', 'Strawberries', 'Sweet strawberries packed in convenient punnets.', 35.00, 'punnet', 40.00, 'img/fruite-item-2.jpg'),
    ('Vegetables', 'Tomatoes', 'Ripe red tomatoes for salads, sauces and cooking.', 26.00, 'kg', 110.00, 'img/vegetable-item-1.jpg'),
    ('Vegetables', 'Spinach', 'Tender leafy spinach harvested daily.', 18.00, 'bunch', 75.00, 'img/vegetable-item-2.jpg'),
    ('Vegetables', 'Carrots', 'Crunchy orange carrots, washed and ready to use.', 24.00, 'kg', 90.00, 'img/vegetable-item-3.png'),
    ('Vegetables', 'Green Beans', 'Fresh green beans with a delicate, crisp texture.', 32.00, 'kg', 55.00, 'img/vegetable-item-4.jpg'),
    ('Vegetables', 'Sweet Potatoes', 'Naturally sweet, earthy sweet potatoes.', 27.00, 'kg', 80.00, 'img/vegetable-item-5.jpg'),
    ('Vegetables', 'Butternut Squash', 'Creamy butternut squash for roasting and soups.', 25.00, 'kg', 70.00, 'img/vegetable-item-6.jpg'),
    ('Grains', 'White Maize Meal', 'Stone-ground white maize meal for traditional dishes.', 48.00, '5 kg bag', 50.00, 'img/fruite-item-6.jpg'),
    ('Grains', 'Brown Rice', 'Nutty whole-grain brown rice.', 42.00, 'kg', 65.00, 'img/fruite-item-6.jpg'),
    ('Grains', 'Rolled Oats', 'Whole-grain rolled oats for a hearty breakfast.', 38.00, 'kg', 45.00, 'img/fruite-item-6.jpg'),
    ('Grains', 'Pearled Barley', 'Versatile pearled barley for soups and stews.', 36.00, 'kg', 40.00, 'img/fruite-item-6.jpg'),
    ('Legumes', 'Sugar Beans', 'Dried sugar beans, high in plant protein.', 55.00, 'kg', 55.00, 'img/fruite-item-6.jpg'),
    ('Legumes', 'Red Lentils', 'Quick-cooking red lentils for curries and soups.', 58.00, 'kg', 50.00, 'img/fruite-item-6.jpg'),
    ('Legumes', 'Chickpeas', 'Nutritious dried chickpeas for salads and hummus.', 52.00, 'kg', 45.00, 'img/fruite-item-6.jpg'),
    ('Herbs', 'Fresh Basil', 'Fragrant basil leaves, freshly picked.', 16.00, 'bunch', 35.00, 'img/fruite-item-1.jpg'),
    ('Herbs', 'Fresh Coriander', 'Aromatic coriander for salads, curries and salsas.', 14.00, 'bunch', 40.00, 'img/fruite-item-2.jpg');

INSERT INTO dbo.Products
    (CategoryId, FarmerId, ProductName, Description, Price, UnitOfMeasure, StockQuantity, ImageUrl, IsActive)
SELECT
    categoryRow.CategoryId,
    @FarmerId,
    productRow.ProductName,
    productRow.Description,
    productRow.Price,
    productRow.UnitOfMeasure,
    productRow.StockQuantity,
    productRow.ImageUrl,
    1
FROM @Products AS productRow
INNER JOIN dbo.Categories AS categoryRow
    ON categoryRow.CategoryName = productRow.CategoryName
WHERE NOT EXISTS
(
    SELECT 1
    FROM dbo.Products AS existingProduct
    WHERE existingProduct.ProductName = productRow.ProductName
);

COMMIT TRANSACTION;

SELECT ProductId, ProductName, Price, UnitOfMeasure, StockQuantity, IsActive
FROM dbo.Products
WHERE FarmerId = @FarmerId
ORDER BY ProductName;
