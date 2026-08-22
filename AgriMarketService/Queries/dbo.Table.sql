-- Stores all system users, including Customers, Farmers and Admins
-- The userType  determines what functionality each user can access
CREATE TABLE [dbo].[UserTable]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	[Name] VARCHAR(50) NOT NULL,
    [Surname] VARCHAR(50) NOT NULL,
    [phoneNumber] VARCHAR(20) NOT NULL,
    [passwordHash] VARCHAR(255) NOT NULL,
    [email] VARCHAR(100) NOT NULL UNIQUE,
    [userType] VARCHAR(20) NOT NULL,
    [creationDate] DATETIME NOT NULL DEFAULT GETDATE()
)
