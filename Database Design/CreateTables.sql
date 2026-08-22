CREATE Table [User](
[id] INT UNIQUE NOT NULL,
[Name] VARCHAR(20) NULL,
[Surname] VARCHAR(20) NULL,
[Phone_Number] VARCHAR(20) NULL,
[passwordHash] varchar(50) Not null,
[email] varchar(40) Null,
[userType] varchar(10) Not null,
[creationDate] date

PRIMARY KEY(id)
);
CREATE TABLE [Product](
    [id] int UNIQUE NOT NULL,
    [S_id] int not Null,
    [Name] varchar(30),
    [Price] int not null,
    [Description] varchar(MAX),
    [imageUrl] varchar(MAX),
    PRIMARY KEY(id)
    FOREIGN KEY (S_id) REFERENCES [Product]()
);
CREATE TABLE [CartItem](
    [id] int UNIQUE not null,
    [P_id] int not null,
    [P_Quantity] int not null,
    [Cart_id] int not null,


    PRIMARY KEY(id)
    FOREIGN KEY(P_id)REFERENCES [Product](id)
    FOREIGN KEY(Cart_id)REFERENCES [Cart](id)

);
CREATE TABLE [Cart](
[id] int UNIQUE not null,

PRIMARY KEY(id)
);

CREATE TABLE [Order](
    [id] INT UNIQUE NOT NULL,
    [Cart_id] int not null,
    [User_id] int not null,
    [DeliveryAddress] varchar(100) null,
    [Total_Cost] int not null
    [DeliveryDate] date null,
    [CreationDate] date null,

    PRIMARY KEY(id),
    FOREIGN KEY(Cart_id) REFERENCES [Cart](id),
    FOREIGN KEY(User_id) REFERENCES [User](id)

);
CREATE TABLE [OrderItem]{

    [id] int UNIQUE not null,
    [O_id] int not null,
    [P_id] int not null,
    [P_Quantity] int not null,

    PRIMARY KEY(id),
    FOREIGN KEY(O_id) REFERENCES [Order](id),
    FOREIGN KEY(P_id) REFERENCES [Product](id)
}
CREATE TABLE [Invoice](
[id] int UNIQUE not null,
[OrderID] int not null,

[dateCreated] date not null,
[pdf_Url_Location] varchar(100) not null,
[Total_Cost] int not null,

PRIMARY KEY(id),
FOREIGN KEY(OrderID) REFERENCES [Order](id)


);