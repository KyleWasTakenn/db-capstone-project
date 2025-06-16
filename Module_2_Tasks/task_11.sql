DELIMITER //

CREATE PROCEDURE UpdateBooking(
IN p_booking_id INT,
IN p_booking_date DATE
)
BEGIN
	START TRANSACTION;
	/*
    -- If they want validation, can uncomment this area.
    
	SET @result = 'NULL';
	CALL CheckBooking(p_booking_date, (SELECT b.BookingTableNo FROM Bookings b WHERE b.BookingID = p_booking_id));
    
    IF @result =  'OPEN' THEN
    -- Execute the below code. Finish IF statement if using this code.
    */
	
	UPDATE
		Bookings
    SET
        BookingDate = p_booking_date
    WHERE
		BookingID = p_booking_id;
        
	SELECT CONCAT("Booking number ", p_booking_id, " was updated to the following date: ", p_booking_date) AS 'Confirmation Message';
    
    COMMIT;
END//

DELIMITER //

/*
Testing invokations

CALL UpdateBooking(90001, '2050-01-01')
-- CALL RESET_ALL_DATA()
*/