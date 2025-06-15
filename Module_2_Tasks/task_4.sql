/*
In this task, Little Lemon need you to create a procedure that:
displays the maximum ordered quantity in the Orders table.

In this case, this comes from the OrderItems table because of my
database Schema.
*/
DELIMITER //
CREATE PROCEDURE GetMaxQuantity()
BEGIN
    SELECT MAX(Quantity) AS MaxQuantity
    FROM OrderItems;
END //
DELIMITER ;

CALL GetMaxQuantity();