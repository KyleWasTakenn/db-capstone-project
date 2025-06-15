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