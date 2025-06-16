-- =============================================
-- CREATE TEST RECORDS SCRIPT
-- 1. Creates records use for testing tasks.
-- 2. Does not change default mock data.
-- =============================================
START TRANSACTION;

-- 1. CUSTOMERS (1 test customer)
INSERT INTO Customers (CustomerID, CustomerFirstName, CustomerLastName, CustomerPhone, CustomerEmail) 
VALUES (90001, 'Test', 'Customer', 5559000001, 'test@example.com');

-- 2. STAFF (1 test staff member)
INSERT INTO Staff (StaffID, StaffName, StaffRole, StaffPhone, StaffEmail, StaffStatus)
VALUES (90001, 'Test', 'Waiter', 5559000002, 'staff@test.com', 'Active');

-- 3. MENUITEMS (1 test menu item)
INSERT INTO MenuItems (ItemID, StarterName, CourseName, DessertName, ItemCost)
VALUES (90001, 'TestStarter', 'TestCourse', 'TestDessert', 10.00);

-- 4. BOOKINGS (1 test booking)
INSERT INTO Bookings (BookingID, BookingCustomerID, BookingTableNo, BookingDate, BookingTime)
VALUES (90001, 90001, 99, '2023-12-31', '19:00:00');

-- 5. DELIVERYSTATUS (1 test status)
INSERT INTO DeliveryStatus (DeliveryID, DeliveryTime, DeliveryStatus, AssignedStaffID)
VALUES (90001, NULL, 'Preparing', 90001);

-- 6. ORDERS (1 test order)
INSERT INTO Orders (OrderID, OrderCustomerID, OrderBookingID, OrderStatusID, OrderStaffID, OrderTime)
VALUES (90001, 90001, 90001, 90001, 90001, NOW());

-- 7. MENUS (1 test menu)
INSERT INTO Menus (MenuID, MenuItemID, MenuName, Cuisine)
VALUES (90001, 90001, 'TestMenu', 'TestCuisine');

-- 8. ORDERITEMS (1 test order item)
INSERT INTO OrderItems (OrderItemID, OrderID, ItemID, Quantity)
VALUES (90001, 90001, 90001, 1);

-- Verify all inserts
SELECT 
    'Customers' AS Tbl, (SELECT COUNT(*) FROM Customers WHERE CustomerID = 90001) AS TestRecords
    UNION ALL SELECT 'Staff', (SELECT COUNT(*) FROM Staff WHERE StaffID = 90001)
    UNION ALL SELECT 'MenuItems', (SELECT COUNT(*) FROM MenuItems WHERE ItemID = 90001)
    UNION ALL SELECT 'Bookings', (SELECT COUNT(*) FROM Bookings WHERE BookingID = 90001)
    UNION ALL SELECT 'DeliveryStatus', (SELECT COUNT(*) FROM DeliveryStatus WHERE DeliveryID = 90001)
    UNION ALL SELECT 'Orders', (SELECT COUNT(*) FROM Orders WHERE OrderID = 90001)
    UNION ALL SELECT 'Menus', (SELECT COUNT(*) FROM Menus WHERE MenuID = 90001)
    UNION ALL SELECT 'OrderItems', (SELECT COUNT(*) FROM OrderItems WHERE OrderItemID = 90001);

-- ROLLBACK;  -- Test first (verifies no errors)
COMMIT;       -- Then uncomment to actually insert