/*
In the second task, Little Lemon need you to help them to create a prepared statement called GetOrderDetail.
This prepared statement will help to reduce the parsing time of queries.
It will also help to secure the database from SQL injections.

The prepared statement should accept one input argument, the CustomerID value, from a variable.

The statement should return the order id, the quantity and the order cost from the Orders table. 
*/

-- Used 501 since that is the first Order ID in my generated testing data.
SET @order_id = 501;

PREPARE GetOrderDetail FROM '
SELECT 
    o.OrderID AS "Order ID",
    mi.CourseName AS "Menu Item",
    oi.Quantity,
    (oi.Quantity * mi.ItemCost) AS "Item Total",
    SUM(oi.Quantity * mi.ItemCost) OVER() AS "Order Total"
FROM 
    Orders o
JOIN 
    OrderItems oi ON o.OrderID = oi.OrderID
JOIN 
    MenuItems mi ON oi.ItemID = mi.ItemID
WHERE 
    o.OrderID = ?
';

EXECUTE GetOrderDetail USING @order_id;