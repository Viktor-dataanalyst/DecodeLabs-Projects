
SELECT 
    PaymentMethod, 
    COUNT(PaymentMethod) AS Total_Order, 
    SUM(TotalPrice) AS Total_Sales,
    AVG(TotalPrice) AS Average_Sales
FROM sales
WHERE OrderStatus ='Cancelled'
GROUP BY PaymentMethod
ORDER BY Total_Sales DESC
