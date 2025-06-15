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

START TRANSACTION;

-- Choose any of the ID's from the below query to use for testing.
SELECT * FROM Orders;

-- Call the procedure with the selected ID
CALL CancelOrder(order_id_here);

-- Verify the order has been deleted, and the conditionals are met.
SELECT * FROM Orders WHERE Orders.OrderID = order_id_here;


*/