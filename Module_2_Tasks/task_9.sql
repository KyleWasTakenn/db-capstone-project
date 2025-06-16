DELIMITER //

CREATE PROCEDURE AddValidBooking(
    IN booking_date DATE,
    IN table_number INT
)
BEGIN
    START TRANSACTION;
    SET @result = 'NULL';
    
    CALL CheckBooking(booking_date, table_number);
    
    IF @result = 'OPEN' THEN
        INSERT INTO Bookings (
            BookingCustomerID,
            BookingTableNo,
            BookingDate,
            BookingTime
        ) VALUES (
            90001,
            table_number,
            booking_date,
            CURRENT_TIME()
        );
        SELECT CONCAT("Successfully booked table ", table_number, " on ", booking_date) AS Status;
    ELSE
        SELECT CONCAT("Table ", table_number, " is already booked on ", booking_date) AS Status;
        ROLLBACK;
    END IF;
    
    COMMIT;
END//

DELIMITER ;

/*
Testing queries

CALL CheckBooking('2023-12-25', 5);
SELECT @result;

-- 2. Try to book it
CALL AddValidBooking('2023-12-25', 5);

-- 3. Verify
SELECT * FROM Bookings WHERE BookingTableNo = 5 AND BookingDate = '2023-12-25';
*/