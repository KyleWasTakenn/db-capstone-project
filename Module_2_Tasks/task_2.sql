/*
Use a JOIN clause to extract information from four tables on all customers
with a cost more than $150. 
- Customers table: Customer ID and Full Name
- Orders table: The Order ID and Cost
- Menus table: The menus name
- MenuItems table: Course name and starter name

Sort the result by the lowest cost amount.
*/
SELECT
	c.CustomerID AS "Customer ID",
	CONCAT(c.CustomerFirstName, " ", c.CustomerLastName) AS "Full Name",
	o.OrderID AS "Order ID",
	SUM(mi.ItemCost * oi.Quantity) AS "Order Cost",
	m.MenuName AS "Menu Name",
	mi.CourseName AS "Course Name",
	mi.StarterName AS "Starter Name"
FROM
	Customers c
JOIN
	Orders o ON  o.OrderCustomerID = c.CustomerID
JOIN
	OrderItems oi ON o.OrderID = oi.OrderID
JOIN
	MenuItems mi ON oi.ItemID = mi.ItemID
JOIN
	Menus m ON mi.ItemID = m.MenuItemID
GROUP BY
	c.CustomerID,
    c.CustomerFirstName,
    c.CustomerLastName,
    o.OrderID,
    m.MenuName,
    mi.CourseName,
    mi.StarterName
HAVING SUM(mi.ItemCost * oi.Quantity) > 150
ORDER BY SUM(mi.ItemCost * oi.Quantity);

-- In this dataset, the expected result from this is 0 customers.
-- No customers have spent > $150 in my data.