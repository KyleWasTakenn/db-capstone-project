/*
Your sixth and final task is to create a stored procedure called CancelOrder.
Little Lemon want to use this stored procedure to delete
an order record based on the user input of the order id.

Creating this procedure will allow Little Lemon to cancel any order by
specifying the order id value in the procedure parameter
without typing the entire SQL delete statement.
*/

DELIMITER //
CREATE PROCEDURE CancelOrder(IN order_id INT)
BEGIN
    DECLARE booking_id INT;
    DECLARE status_id INT;
    
    START TRANSACTION;
    
    SELECT OrderBookingID, OrderStatusID INTO booking_id, status_id
    FROM Orders WHERE OrderID = order_id;
    
    DELETE FROM OrderItems WHERE OrderID = order_id;
    
    IF status_id IS NOT NULL THEN
        UPDATE DeliveryStatus 
        SET DeliveryStatus = 'Cancelled' 
        WHERE DeliveryID = status_id;
    END IF;
    
    DELETE FROM Orders WHERE OrderID = order_id;
    
    IF booking_id IS NOT NULL THEN
        DELETE FROM Bookings WHERE BookingID = booking_id;
    END IF;
    
    COMMIT;
    
    SELECT CONCAT('Order ', order_id, ' cancelled successfully') AS Result;
END //
DELIMITER ;

/*
Notes:
In order to test this:
-- =============================================
-- SAFE TEST SCRIPT FOR CancelOrder()
-- Uses high IDs (99990+) and ROLLBACK
-- =============================================

-- 1. Start transaction (all changes will be rolled back)
START TRANSACTION;

-- 2. Create test records (high IDs avoid conflicts)
INSERT INTO Customers (CustomerID, CustomerFirstName, CustomerLastName, CustomerPhone, CustomerEmail)
VALUES (99990, 'TestCustomer', 'CancelTest', 5550001111, 'cancel_test@example.com');

INSERT INTO Staff (StaffID, StaffName, StaffRole, StaffPhone, StaffEmail, StaffStatus)
VALUES (99990, 'TestStaff', 'Waiter', 5550002222, 'teststaff@littlelemon.com', 'Active');

INSERT INTO MenuItems (ItemID, StarterName, CourseName, DessertName, ItemCost)
VALUES (99990, 'TestStarter', 'TestCourse', 'TestDessert', 10.00);

INSERT INTO Bookings (BookingID, BookingCustomerID, BookingTableNo, BookingDate, BookingTime)
VALUES (99990, 99990, 99, '2023-12-31', '19:00:00');

INSERT INTO DeliveryStatus (DeliveryID, DeliveryTime, DeliveryStatus, AssignedStaffID)
VALUES (99990, NULL, 'Pending', 99990);

INSERT INTO Orders (OrderID, OrderCustomerID, OrderBookingID, OrderStatusID, OrderStaffID, OrderTime)
VALUES (99990, 99990, 99990, 99990, 99990, NOW());

INSERT INTO OrderItems (OrderItemID, OrderID, ItemID, Quantity)
VALUES (99990, 99990, 99990, 2);

-- 3. Verify test data exists
SELECT '=== BEFORE CANCELLATION ===' AS Status;
SELECT * FROM Orders WHERE OrderID = 99990;
SELECT * FROM OrderItems WHERE OrderID = 99990;
SELECT * FROM DeliveryStatus WHERE DeliveryID = 99990;
SELECT * FROM Bookings WHERE BookingID = 99990;

-- 4. Call your procedure
SELECT '=== CALLING CancelOrder(99990) ===' AS Status;
CALL CancelOrder(99990);

-- 5. Verify cancellation worked
SELECT '=== AFTER CANCELLATION ===' AS Status;
SELECT 'Orders' AS Table, COUNT(*) AS Count FROM Orders WHERE OrderID = 99990
UNION ALL
SELECT 'OrderItems', COUNT(*) FROM OrderItems WHERE OrderID = 99990
UNION ALL
SELECT 'DeliveryStatus', COUNT(*) FROM DeliveryStatus WHERE DeliveryID = 99990
UNION ALL
SELECT 'Bookings', COUNT(*) FROM Bookings WHERE BookingID = 99990;

-- 6. Undo all test data (no permanent changes)
ROLLBACK;

-- 7. Final verification
SELECT '=== POST-ROLLBACK VERIFICATION ===' AS Status;
SELECT 'Orders' AS Table, COUNT(*) AS Count FROM Orders WHERE OrderID = 99990
UNION ALL
SELECT 'OrderItems', COUNT(*) FROM OrderItems WHERE OrderID = 99990;
*/