-- Stores additional information for users whose userType is Farmer
-- FarmerId links the farmer details to the matching user in UserTable

CREATE TABLE [dbo].[FarmerDetails]
(
	[FarmerId] INT NOT NULL PRIMARY KEY,
	[FarmName] VARCHAR(100) NOT NULL,
    [FarmLocation] VARCHAR(150) NOT NULL,
    [FarmDescription] VARCHAR(500) NULL,
    [IsApproved] BIT NOT NULL DEFAULT 0,
	CONSTRAINT [FK_FarmerDetails_UserTable]
    FOREIGN KEY ([FarmerId])REFERENCES [dbo].[UserTable]([Id])
)
