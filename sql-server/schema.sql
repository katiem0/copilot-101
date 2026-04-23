-- Sample SQL Server schema for a small order-management system.
-- Intentionally minimal so Copilot can suggest indexes, constraints,
-- and query improvements during demos.

CREATE TABLE Customers (
    CustomerId   INT            IDENTITY(1,1) PRIMARY KEY,
    FirstName    NVARCHAR(50)   NOT NULL,
    LastName     NVARCHAR(50)   NOT NULL,
    Email        NVARCHAR(200)  NOT NULL,
    CreatedAt    DATETIME2      NOT NULL DEFAULT SYSUTCDATETIME()
);

CREATE TABLE Products (
    ProductId    INT            IDENTITY(1,1) PRIMARY KEY,
    Name         NVARCHAR(100)  NOT NULL,
    UnitPrice    DECIMAL(10,2)  NOT NULL,
    InStock      BIT            NOT NULL DEFAULT 1
);

CREATE TABLE Orders (
    OrderId      INT            IDENTITY(1,1) PRIMARY KEY,
    CustomerId   INT            NOT NULL,
    OrderDate    DATETIME2      NOT NULL DEFAULT SYSUTCDATETIME(),
    Status       NVARCHAR(20)   NOT NULL DEFAULT 'Pending',
    CONSTRAINT FK_Orders_Customers FOREIGN KEY (CustomerId) REFERENCES Customers(CustomerId)
);

CREATE TABLE OrderItems (
    OrderItemId  INT            IDENTITY(1,1) PRIMARY KEY,
    OrderId      INT            NOT NULL,
    ProductId    INT            NOT NULL,
    Quantity     INT            NOT NULL,
    CONSTRAINT FK_OrderItems_Orders   FOREIGN KEY (OrderId)   REFERENCES Orders(OrderId),
    CONSTRAINT FK_OrderItems_Products FOREIGN KEY (ProductId) REFERENCES Products(ProductId)
);
