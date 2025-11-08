CREATE TABLE User_Entity (
    UserID SERIAL PRIMARY KEY,
    Username VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    Full_Name VARCHAR(255) NOT NULL,
    Address TEXT,
    Phone_Number VARCHAR(13) 
);

CREATE TABLE Product_Entity (
    ProductID SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Description TEXT,
    Price NUMERIC(10, 2) NOT NULL,
    Category VARCHAR(100) NOT NULL,
	Available_Quantity INT
);

CREATE TABLE "Order_Entity" (
    OrderID SERIAL PRIMARY KEY,
    UserID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    Order_Date TIMESTAMP NOT NULL,
    FOREIGN KEY (UserID) REFERENCES "user_entity"(UserID),
    FOREIGN KEY (ProductID) REFERENCES "product_entity"(ProductID)
);


CREATE TABLE Payment_Entity (
    PaymentID SERIAL PRIMARY KEY,
    OrderID INT NOT NULL,
    Amount NUMERIC(10, 2) NOT NULL,
    Payment_Method VARCHAR(100) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES "Order_Entity"(OrderID),
    SellerID INTEGER REFERENCES Seller_Entity(SellerID)
);

CREATE TABLE Seller_Entity (
    SellerID SERIAL PRIMARY KEY,
    Seller_Name VARCHAR(255) NOT NULL,
    Contact_Info VARCHAR(255) NOT NULL,
    Location VARCHAR(255) NOT NULL
);
CREATE TABLE Review_Entity (
    ReviewID SERIAL PRIMARY KEY,
    UserID INT NOT NULL,
    ProductID INT NOT NULL,
    Rating INT NOT NULL,
    Comment TEXT,
    FOREIGN KEY (UserID) REFERENCES "user_entity"(UserID),
    FOREIGN KEY (ProductID) REFERENCES "product_entity"(ProductID)
);

ALTER TABLE Product_Entity
ADD COLUMN Available_Quantity INT;