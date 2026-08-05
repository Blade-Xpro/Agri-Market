CREATE Table [User](
[id] INT UNIQUE NOT NULL,
[Name] VARCHAR(20) NULL,
[Surname] VARCHAR(20) NULL,
[Phone_Number] VARCHAR(20) NULL,
[passwordHash] varchar(50) Not null,
[email] varchar(40) Null,
[userType] varchar(10) Not null,
[creationDate] date

);
CREATE TABLE [Product](
    [id] int UNIQUE NOT NULL,
    [S_id] int not Null,
    [Name] varchar(30),
    [Price] int not null,
    [Description] varchar(MAX),
    [imageUrl] varchar(MAX),

    FOREIGN KEY (S_id) REFERENCES [Product]()
);
CREATE TABLE [CartItem](
    [id] int UNIQUE not null,
    [P_id] int not null,



    FOREIGN KEY(P_id)REFERENCES [Product]
);
CREATE TABLE [Cart](

);

CREATE TABLE [Order](
    [id] INT UNIQUE NOT NULL,
    [C_id]
);