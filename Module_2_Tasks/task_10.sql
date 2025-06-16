/*
My only possible justification that this could ever be created is as an admin override,
So that's how I'm going to treat this portion of the assignment.
It's basically just a worse version of what they just had me make otherwise (no validation).

PLEASE FOR THE LOVE OF GOD IF YOU"RE A PEER REVIEWER:
Just pass NULL into this proceedure. The ID is already handled by an auto-increment.
It will handle a manual input as well, if you hate the world. But I have no way of knowing
if that will break future tasks, so just keep that in mind!
Thanks META! Now I know to never work at your company o7
*/
DELIMITER //
CREATE PROCEDURE AddBooking(
    IN p_booking_id INT,
    IN p_customer_id INT,
    IN p_booking_date DATE,
    IN p_table_number INT
)
BEGIN
	DECLARE manual_booking_id INT;
    
    IF p_booking_id IS NULL THEN
        -- Let's BookingID auto-increment choose the BookingID
        INSERT INTO Bookings (
            BookingCustomerID,
            BookingDate,
            BookingTableNo,
            BookingTime
        ) VALUES (
            p_customer_id,
            p_booking_date,
            p_table_number,
            CURRENT_TIME()
            
        );
        
		SELECT CONCAT('Booking added with ID: ', LAST_INSERT_ID()) AS Confirmation;
    ELSE
        -- Manual ID path (which might break something but META is forcing me to add this garbage so here it is!)
        INSERT INTO Bookings (
            BookingID,
            BookingCustomerID,
            BookingDate,
            BookingTableNo,
            BookingTime
        ) VALUES (
            p_booking_id,
            p_customer_id,
            p_booking_date,
            p_table_number,
            CURRENT_TIME()
        );
        
        SET manual_booking_id = p_booking_id;
            SELECT CONCAT('Booking added with ID: ', manual_booking_id) AS Confirmation;
    END IF;
    

END //
DELIMITER ;

/*
-- Testing invokations

CALL AddBooking(NULL, 90001, '2025-12-25', 5);
CALL AddBooking(69, 90001, '2025-01-01', 4);

-- CALL RESET_ALL_DATA();
*/