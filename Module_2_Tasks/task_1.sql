/*
Create a virtual table called OrdersView that focuses on:
OrderID, Quantity, and Cost columns from the Orders table.

Filter for all orders with a quantity > 2 only.
*/
START TRANSACTION;

CREATE VIEW OrdersView AS
-- Selects Orders.OrderID, OrderItems Quantity, and calculates total cost)
SELECT
     o.OrderID AS "Order ID",
     SUM(oi.Quantity) AS "No. of items",
     SUM(oi.Quantity * mi.ItemCost) AS "Total Cost"
FROM
	Orders o
JOIN
	OrderItems oi ON o.OrderID = oi.OrderID
JOIN
	MenuItems mi ON oi.ItemID = mi.ItemID
GROUP BY o.OrderID
HAVING SUM(oi.Quantity) > 2;

-- OrderItems is essentially Shopping Cart.

-- COMMIT OR ROLLBACK (Don't think it's needed but just in case)
-- COMMIT;
-- ROLLBACK;