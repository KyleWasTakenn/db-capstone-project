DELIMITER //

CREATE PROCEDURE CancelBooking(
IN p_booking_id INT
)
BEGIN
	START TRANSACTION;
		
        -- Handles dependency in Order table
		UPDATE Orders
		SET OrderBookingID = NULL
		WHERE OrderBookingID = p_booking_id;
		
        -- Deletes everything from the Booking record at given Booking ID
        DELETE FROM Bookings b
		WHERE b.BookingID = p_booking_id;
        
        SELECT CONCAT("Booking number", p_booking_id,  " has been canceled.") AS 'Confirmation Message';
			
	COMMIT;
END//

DELIMITER ;
/*
-- Checking data before invoking CancelBooking()
SELECT * FROM Bookings b
JOIN
Orders o ON o.OrderBookingID = b.BookingID ;


-- Using a Testing ID I setup in my mock data
CALL CancelBooking(90001);

-- Checking the data after invokation
SELECT * FROM Bookings b
JOIN
Orders o ON o.OrderBookingID = b.BookingID;

-- Resetting data back to the original mock + testing records
-- CALL RESET_ALL_DATA();
*/