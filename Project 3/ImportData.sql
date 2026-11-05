
CREATE TABLE IF NOT EXISTS sales(
    OrderID VARCHAR(50) PRIMARY KEY,
    DateOrdered DATE,
    CustomerID VARCHAR(50) NOT NULL,
    Product VARCHAR(50) NOT NULL,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10, 2) NOT NULL,
    ShippingAddress VARCHAR(50) NOT NULL,
    PaymentMethod VARCHAR(50),
    OrderStatus	ENUM("Delivered", "Pending", "Shipped", "Returned", "Cancelled") NOT NULL,
    TrackingNumber VARCHAR(50) NOT NULL UNIQUE,	
    ItemsInCart	INT,
    ReferralSource ENUM("Email", "Instagram", "Facebook", "Referral", "Google"),	
    TotalPrice DECIMAL(10, 2),
    CouponCode ENUM("NO COUPON", "FREESHIP", "WINTER15", "SAVE10") NOT NULL
);

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Data Cleaning- Project 1.csv"
INTO TABLE sales
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(OrderID, @DateOrdered, CustomerID, Product, Quantity, UnitPrice, 
ShippingAddress, PaymentMethod, OrderStatus, TrackingNumber, 
ItemsInCart, ReferralSource, TotalPrice, CouponCode)
SET DateOrdered = STR_TO_DATE(@DateOrdered, '%d/%m/%Y')




							