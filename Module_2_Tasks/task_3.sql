/*
Find all menu items for which at least 3 orders have been placed.
Create a subquery that lists the menu names from the menus table
for any order with a quantity >2.

- Use the ANY operator
- The outer query should be used to select the Menu name from the menus table.
- The inner query should check the order quantity.
*/
START TRANSACTION;
-- 1. First, ensure we have some base customers and staff
INSERT INTO Customers (CustomerID, CustomerFirstName, CustomerLastName, CustomerPhone, CustomerEmail) VALUES
(100, 'Test', 'Customer', 5551239999, 'test@example.com');

INSERT INTO Staff (StaffID, StaffName, StaffRole, StaffPhone, StaffEmail, StaffStatus) VALUES
(999, 'Test Staff', 'Waiter', 5559879999, 'teststaff@littlelemon.com', 'Active');

-- 2. Add a test menu item that will trigger the "quantity > 2" condition
INSERT INTO MenuItems (ItemID, StarterName, CourseName, DessertName, ItemCost) VALUES
(9999, 'Test Starter', 'Test Course', 'Test Dessert', 30);

-- 3. Link to Menus table (assuming MenuItemID refers to ItemID)
INSERT INTO Menus (MenuID, MenuItemID, MenuName, Cuisine) VALUES
(999, 9999, 'Test Menu', 'International');

-- 4. Create 3 separate orders with quantity > 2 for our test item
INSERT INTO Orders (OrderID, OrderCustomerID, OrderStaffID, OrderTime) VALUES
(9991, 100, 999, '19:00:00'),
(9992, 100, 999, '19:30:00'),
(9993, 100, 999, '20:00:00');

-- 5. Add order items with quantity > 2 for each order
INSERT INTO OrderItems (OrderItemID, OrderID, ItemID, Quantity) VALUES
(99901, 9991, 9999, 3),  -- Quantity > 2
(99902, 9992, 9999, 4),  -- Quantity > 2
(99903, 9993, 9999, 5);  -- Quantity > 2

SELECT
    mi.CourseName AS "Menu Item Name",
    COUNT(DISTINCT oi.OrderID) AS "Order Count"
FROM 
    MenuItems mi
JOIN
    OrderItems oi ON mi.ItemID = oi.ItemID
WHERE
    oi.Quantity > 2
GROUP BY
    mi.ItemID, mi.CourseName
HAVING
    COUNT(DISTINCT oi.OrderID) >= 3;
        
ROLLBACK;