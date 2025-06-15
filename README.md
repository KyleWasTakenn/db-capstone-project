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
- [x] create a procedure that displays the maximum ordered quantity in the Orders table.

Creating this procedure will allow Little Lemon to reuse the logic implemented in the procedure easily without retyping the same code over again and again to check the maximum quantity.

## **Task 5**

In the second task, Little Lemon need you to help them to create a prepared statement called GetOrderDetail. This prepared statement will help to reduce the parsing time of queries. It will also help to secure the database from SQL injections.

The prepared statement should accept one input argument, the CustomerID value, from a variable.

The statement should return the order id, the quantity and the order cost from the Orders table. 

Once you create the prepared statement, you can create a variable called id and assign it value of 1.

## **Task 6**

Your third and final task is to create a stored procedure called CancelOrder. Little Lemon want to use this stored procedure to delete an order record based on the user input of the order id.

Creating this procedure will allow Little Lemon to cancel any order by specifying the order id value in the procedure parameter without typing the entire SQL delete statement.