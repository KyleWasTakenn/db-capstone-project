DELIMITER //
CREATE PROCEDURE GetMaxQuantity()
BEGIN
    SELECT MAX(Quantity) AS MaxQuantity
    FROM OrderItems;
END //
DELIMITER ;

CALL GetMaxQuantity();