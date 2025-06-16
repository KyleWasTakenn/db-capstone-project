-- =============================================
-- COMPLETE DATABASE RESET SCRIPT
-- 1. Deletes all existing data
-- 2. Reinserts default mock data
-- =============================================

START TRANSACTION;

-- Disable foreign key checks temporarily
SET FOREIGN_KEY_CHECKS = 0;

-- ===== PHASE 1: DELETE ALL DATA =====
-- Delete in reverse dependency order (children first)
DELETE FROM OrderItems;
DELETE FROM Orders;
DELETE FROM Menus;
DELETE FROM Bookings;
DELETE FROM DeliveryStatus;
DELETE FROM MenuItems;
DELETE FROM Staff;
DELETE FROM Customers;

-- Reset auto-increment counters
ALTER TABLE OrderItems AUTO_INCREMENT = 1;
ALTER TABLE Orders AUTO_INCREMENT = 1;
ALTER TABLE Menus AUTO_INCREMENT = 1;
ALTER TABLE Bookings AUTO_INCREMENT = 1;
ALTER TABLE DeliveryStatus AUTO_INCREMENT = 1;
ALTER TABLE MenuItems AUTO_INCREMENT = 1;
ALTER TABLE Staff AUTO_INCREMENT = 1;
ALTER TABLE Customers AUTO_INCREMENT = 1;

-- ===== PHASE 2: INSERT MOCK DATA =====
-- 1. CUSTOMERS (Parent table - no dependencies)
INSERT INTO Customers (CustomerID, CustomerFirstName, CustomerLastName, CustomerPhone, CustomerEmail) VALUES
(1, 'Sophia', 'Rossi', 5551002000, 'sophia.rossi@example.com'),
(2, 'Luca', 'Bianchi', 5551002001, 'luca.bianchi@example.com'),
(3, 'Giulia', 'Romano', 5551002002, 'giulia.romano@example.com'),
(4, 'Marco', 'Ferrari', 5551002003, 'marco.ferrari@example.com'),
(5, 'Elena', 'Conti', 5551002004, 'elena.conti@example.com');

-- 2. STAFF (Parent table - no dependencies)
INSERT INTO Staff (StaffID, StaffName, StaffRole, StaffPhone, StaffEmail, StaffStatus) VALUES
(101, 'Antonio', 'Head Chef', 5552003000, 'antonio@littlelemon.com', 'Active'),
(102, 'Isabella', 'Waiter', 5552003001, 'isabella@littlelemon.com', 'Active'),
(103, 'Riccardo', 'Waiter', 5552003002, 'riccardo@littlelemon.com', 'Active'),
(104, 'Francesca', 'Manager', 5552003003, 'francesca@littlelemon.com', 'Active');

-- 3. MENUITEMS (Parent table for Menus and OrderItems)
INSERT INTO MenuItems (ItemID, StarterName, CourseName, DessertName, ItemCost) VALUES
(1001, 'Bruschetta', 'Spaghetti Carbonara', 'Tiramisu', 22),
(1002, 'Caprese Salad', 'Margherita Pizza', 'Panna Cotta', 18),
(1003, 'Mushroom Risotto', 'Grilled Salmon', 'Chocolate Lava Cake', 25),
(1004, 'Garlic Bread', 'Lasagna', 'Cannoli', 20);

-- 4. BOOKINGS (Depends on Customers)
INSERT INTO Bookings (BookingID, BookingCustomerID, BookingTableNo, BookingDate, BookingTime) VALUES
(201, 1, 3, '2025-06-10', '18:30:00'),
(202, 2, 5, '2025-06-10', '19:00:00'),
(203, 3, 2, '2025-06-11', '20:00:00'),
(204, 4, 4, '2025-06-12', '19:30:00'),
(205, 5, 1, '2025-06-12', '20:30:00');

-- 5. DELIVERYSTATUS (Depends on Staff)
INSERT INTO DeliveryStatus (DeliveryID, DeliveryTime, DeliveryStatus, AssignedStaffID) VALUES
(301, '18:45:00', 'Delivered', 102),
(302, '19:20:00', 'Preparing', 101),
(303, '20:15:00', 'Cancelled', 103);

-- 6. ORDERS (Depends on Customers, Bookings, DeliveryStatus, Staff)
INSERT INTO Orders (OrderID, OrderCustomerID, OrderBookingID, OrderStatusID, OrderStaffID, OrderTime) VALUES
(501, 1, 201, 301, 102, '18:30:00'),
(502, 2, 202, 302, 103, '19:00:00'),
(503, 3, 203, 303, 102, '20:00:00'),
(504, 4, NULL, NULL, 103, '19:15:00'),
(505, 5, 205, NULL, 102, '20:30:00');

-- 7. MENUS (Depends on MenuItems)
INSERT INTO Menus (MenuID, MenuItemID, MenuName, Cuisine) VALUES
(2001, 1001, 'Classic Italian Set', 'Italian'),
(2002, 1003, 'Premium Dinner Set', 'International');

-- 8. ORDERITEMS (Depends on Orders and MenuItems)
INSERT INTO OrderItems (OrderItemID, OrderID, ItemID, Quantity) VALUES
(10001, 501, 1001, 1),
(10002, 501, 1003, 2),
(10003, 502, 1002, 1),
(10004, 503, 1004, 3),
(10005, 504, 1001, 1),
(10006, 504, 1004, 1),
(10007, 505, 1003, 2),
(10008, 505, 1002, 1);

-- ===== VERIFICATION =====
SELECT 'Customers' AS TableName, COUNT(*) AS RowCount FROM Customers
UNION ALL SELECT 'Staff', COUNT(*) FROM Staff
UNION ALL SELECT 'MenuItems', COUNT(*) FROM MenuItems
UNION ALL SELECT 'Bookings', COUNT(*) FROM Bookings
UNION ALL SELECT 'DeliveryStatus', COUNT(*) FROM DeliveryStatus
UNION ALL SELECT 'Orders', COUNT(*) FROM Orders
UNION ALL SELECT 'OrderItems', COUNT(*) FROM OrderItems
UNION ALL SELECT 'Menus', COUNT(*) FROM Menus;

-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;

-- ===== EXECUTION CONTROL =====
-- ROLLBACK;  -- Run this first to test the script safely
COMMIT;       -- Uncomment to actually execute the reset

-- ===== POST-RESET VERIFICATION =====
-- Check sample data
SELECT * FROM Customers LIMIT 1;
SELECT * FROM Orders WHERE OrderID = 501;