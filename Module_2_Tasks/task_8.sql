/*
TASK 8 -- Create a procedure to check for available bookings.

The procedure should take in 2 parameters--
a date (YYYY-MM-DD), and a table number (INT).

The procedure should then check the bookings table to see if the
booking is available.
*/
DELIMITER //
CREATE PROCEDURE CheckBooking
(
	IN booking_date DATE,
	IN table_number INT
)
BEGIN
	-- Varible that will store the result of the check
    DECLARE is_booked BOOL DEFAULT FALSE;
    
    -- IF statement to check if a booking matching the params exists
    IF EXISTS
    (
		SELECT
			1
        FROM
			Bookings b
		WHERE
			b.BookingDate = booking_date AND b.BookingTableNo = table_number
    ) THEN
		SET is_booked = TRUE;
	END IF;
    
    IF is_booked THEN
		SET @result = 'ALREADY BOOKED';
	ELSE
		SET @result = 'OPEN';
	END IF;
    
    SELECT @result AS 'Booking Status';
END//

DELIMITER ;