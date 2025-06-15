/*
USE SCRIPT TO RESET THE DATA BACK TO THE DEFAULT MOCK DATA
*/
START TRANSACTION;
SET FOREIGN_KEY_CHECKS = 0;

-- 1. CUSTOMERS (Parent table - no dependencies)
REPLACE INTO LittleLemonDB.Customers (CustomerID, CustomerFirstName, CustomerLastName, CustomerPhone, CustomerEmail) VALUES
(1, 'Sophia', 'Rossi', 5551002000, 'sophia.rossi@example.com'),
(2, 'Luca', 'Bianchi', 5551002001, 'luca.bianchi@example.com'),
(3, 'Giulia', 'Romano', 5551002002, 'giulia.romano@example.com'),
(4, 'Marco', 'Ferrari', 5551002003, 'marco.ferrari@example.com'),
(5, 'Elena', 'Conti', 5551002004, 'elena.conti@example.com');

-- 2. STAFF (Parent table - no dependencies)
REPLACE INTO LittleLemonDB.Staff (StaffID, StaffName, StaffRole, StaffPhone, StaffEmail, StaffStatus) VALUES
(101, 'Antonio', 'Head Chef', 5552003000, 'antonio@littlelemon.com', 'Active'),
(102, 'Isabella', 'Waiter', 5552003001, 'isabella@littlelemon.com', 'Active'),
(103, 'Riccardo', 'Waiter', 5552003002, 'riccardo@littlelemon.com', 'Active'),
(104, 'Francesca', 'Manager', 5552003003, 'francesca@littlelemon.com', 'Active');

-- 3. MENUITEMS (Parent table for Menus and OrderItems)
REPLACE INTO LittleLemonDB.MenuItems (ItemID, StarterName, CourseName, DessertName, ItemCost) VALUES
(1001, 'Bruschetta', 'Spaghetti Carbonara', 'Tiramisu', 22),
(1002, 'Caprese Salad', 'Margherita Pizza', 'Panna Cotta', 18),
(1003, 'Mushroom Risotto', 'Grilled Salmon', 'Chocolate Lava Cake', 25),
(1004, 'Garlic Bread', 'Lasagna', 'Cannoli', 20);

-- 4. BOOKINGS (Depends on Customers)
REPLACE INTO LittleLemonDB.Bookings (BookingID, BookingCustomerID, BookingTableNo, BookingDate, BookingTime) VALUES
(201, 1, 3, '2025-06-10', '18:30:00'),
(202, 2, 5, '2025-06-10', '19:00:00'),
(203, 3, 2, '2025-06-11', '20:00:00'),
(204, 4, 4, '2025-06-12', '19:30:00'),
(205, 5, 1, '2025-06-12', '20:30:00');

-- 5. DELIVERYSTATUS (Depends on Staff)
REPLACE INTO LittleLemonDB.DeliveryStatus (DeliveryID, DeliveryTime, DeliveryStatus, AssignedStaffID) VALUES
(301, '18:45:00', 'Delivered', 102),
(302, '19:20:00', 'Preparing', 101),
(303, '20:15:00', 'Cancelled', 103);

-- 6. ORDERS (Depends on Customers, Bookings, DeliveryStatus, Staff)
REPLACE INTO LittleLemonDB.Orders (OrderID, OrderCustomerID, OrderBookingID, OrderStatusID, OrderStaffID, OrderTime) VALUES
(501, 1, 201, 301, 102, '18:30:00'),
(502, 2, 202, 302, 103, '19:00:00'),
(503, 3, 203, 303, 102, '20:00:00'),
(504, 4, NULL, NULL, 103, '19:15:00'),
(505, 5, 205, NULL, 102, '20:30:00');

-- 7. MENUS (Depends on MenuItems)
REPLACE INTO LittleLemonDB.Menus (MenuID, MenuItemID, MenuName, Cuisine) VALUES
(2001, 1001, 'Classic Italian Set', 'Italian'),
(2002, 1003, 'Premium Dinner Set', 'International');

-- 8. ORDERITEMS (Depends on Orders and MenuItems)
REPLACE INTO LittleLemonDB.OrderItems (OrderItemID, OrderID, ItemID, Quantity) VALUES
(10001, 501, 1001, 1),
(10002, 501, 1003, 2),
(10003, 502, 1002, 1),
(10004, 503, 1004, 3),
(10005, 504, 1001, 1),
(10006, 504, 1004, 1),
(10007, 505, 1003, 2),
(10008, 505, 1002, 1);

-- Verification
SELECT 'Customers' AS TableName, COUNT(*) AS RowCount FROM LittleLemonDB.Customers
UNION ALL
SELECT 'Staff', COUNT(*) FROM LittleLemonDB.Staff
UNION ALL
SELECT 'MenuItems', COUNT(*) FROM LittleLemonDB.MenuItems
UNION ALL
SELECT 'Bookings', COUNT(*) FROM LittleLemonDB.Bookings
UNION ALL
SELECT 'DeliveryStatus', COUNT(*) FROM LittleLemonDB.DeliveryStatus
UNION ALL
SELECT 'Orders', COUNT(*) FROM LittleLemonDB.Orders
UNION ALL
SELECT 'OrderItems', COUNT(*) FROM LittleLemonDB.OrderItems
UNION ALL
SELECT 'Menus', COUNT(*) FROM LittleLemonDB.Menus;

SET FOREIGN_KEY_CHECKS = 1;

-- COMMIT or ROLLBACK;
-- COMMIT;