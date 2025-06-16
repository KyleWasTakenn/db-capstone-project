# META DATABASE PROJECT - COURSE 8
META DB Engineering project

## MODULE 1 TASKS:
- [x] SQL File for Database creation.
  - [x] No data, META didn't include any data inserts (So left blank).
  - [x] Obtained from Workbench Forward Engineering.
- [x] MySQL Workbench Model File.
- [x] EER Diagram exported as a PNG from Workbench.
- [x] Once finished, add files to Repo and push to GH.

## MODULE 2 TASKS:
### **Task 1**:
- [x] Create a virtual table called OrdersView that focuses on OrderID, Quantity, and Cost columns from the Orders table. Filter for all orders with a quantity > 2 only.
- [x] Add script file to Module 2 tasks folder.

### **Task 2**:
- [x] Use a JOIN clause to extract information from four tables on all customers with a cost more than $150.
  - Customers table: Customer ID and Full Name
  - Orders table: The Order ID and Cost
  - Menus table: The menus name
  - MenuItems table: Course name and starter name
- [x] Sort the result by the lowest cost amount.
- [x] Add script file to Module 2 tasks folder.

### **Task 3**:
- [x] Find all menu items for which at least 3 orders have been placed.
- [x] Create a subquery that lists the menu names from the menus table for any order with a quantity >2.
  - [x] Use the ANY operator
  - [x] Outer query selects Menu name
  - [x] Inner query checks order quantity
- [x] Add script file to Module 2 tasks folder.

### **Task 4**

In this first task, Little Lemon need you to:
- [x] Create a procedure that displays the maximum ordered quantity in the Orders table.

Creating this procedure will allow Little Lemon to reuse the logic implemented in the procedure easily without retyping the same code over again and again to check the maximum quantity.

## **Task 5**

In the fifth task, Little Lemon need you to help them to create a prepared statement called GetOrderDetail. This prepared statement will help to reduce the parsing time of queries. It will also help to secure the database from SQL injections.

- [x] The prepared statement should accept one input argument, the CustomerID value, from a variable.
- [x] The statement should return the order id, the quantity and the order cost from the Orders table. 
- [x] Prepared statement should return the order id, the quantity, the cost, and the item total

Once you create the prepared statement, you can create a variable called id and assign it value of 1 (501 in the case of this REPO's example data)

## **Task 6**

Your sixth and final task is to create a stored procedure called CancelOrder. Little Lemon want to use this stored procedure to delete an order record based on the user input of the order id.

Creating this procedure will allow Little Lemon to cancel any order by specifying the order id value in the procedure parameter without typing the entire SQL delete statement.

- [x] Check when finished

## **Task 7**

Only wanted us to populate the Bookings table-- which I've already done.

## **Task 8**

Little Lemon need you to create a stored procedure called CheckBooking to check whether a table in the restaurant is already booked. Creating this procedure helps to minimize the effort involved in repeatedly coding the same SQL statements.

The procedure should have two input parameters in the form of booking date and table number. You can also create a variable in the procedure to check the status of each table.
Procedure must take in 2 parameters-- a date (YYYY-MM-DD) and a table number-- then check whether or not the table is available for booking.

- [x] Check when finished.

## **Task 9**

Little Lemon need to verify a booking, and decline any reservations for tables that are already booked under another name.

Since integrity is not optional, Little Lemon need to ensure that every booking attempt includes these verification and decline steps. However, implementing these steps requires a stored procedure and a transaction.

To implement these steps, you need to create a new procedure called AddValidBooking. This procedure must use a transaction statement to perform a rollback if a customer reserves a table that’s already booked under another name.

Use the following guidelines to complete this task:

- [x] The procedure should include two input parameters in the form of booking date and table number.
    
- [x] It also requires at least one variable and should begin with a START TRANSACTION statement.
    
- [x] Your INSERT statement must add a new booking record using the input parameter's values.
    
- [x] Use an IF ELSE statement to check if a table is already booked on the given date.
    
- [x] If the table is already booked, then rollback the transaction. If the table is available, then commit the transaction.

## **Task 10**

Create a new procedure called AddBooking to add a new table booking record.

The procedure should include four input parameters in the form of the following bookings parameters:

- booking id,
- customer id,
- booking date,
- and table number.

- [x] Check when completed.
- [x] Added extra handling to optionally use auto-increment, which is already implemented in Bookings.BookingID.

## **Task 11**

Create a new procedure called UpdateBooking that they can use to update existing bookings in the booking table.

The procedure should have two input parameters in the form of booking id and booking date. You must also include an UPDATE statement inside the procedure.

- [x] Check when completed

## **Task 12**

Create a new procedure called CancelBooking that they can use to cancel or remove a booking.

The procedure should have one input parameter in the form of booking id. You must also write a DELETE statement inside the procedure.

- [x] Check when completed