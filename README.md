# META DATABASE PROJECT - COURSE 8
META DB Engineering project

## MODULE 1 TASKS:
- [ ] SQL File for Database creation.
  - [ ] No data, META didn't include any data inserts (So left blank).
  - [x] Obtained from Workbench Forward Engineering.
- [ ] MySQL Workbench Model File.
- [ ] EER Diagram exported as a PNG from Workbench.
- [x] Once finished, add files to Repo and push to GH.

## MODULE 2 TASKS:
### Task 1:
- [x] Create a virtual table called OrdersView that focuses on OrderID, Quantity, and Cost columns from the Orders table. Filter for all orders with a quantity > 2 only.
- [x] Add script file to Module 2 tasks folder.

### Task 2:
- [x] Use a JOIN clause to extract information from four tables on all customers with a cost more than $150.
  - Customers table: Customer ID and Full Name
  - Orders table: The Order ID and Cost
  - Menus table: The menus name
  - MenuItems table: Course name and starter name
- [x] Sort the result by the lowest cost amount.
- [x] Add script file to Module 2 tasks folder.

### Task 3:
- [x] Find all menu items for which at least 3 orders have been placed.
- [x] Create a subquery that lists the menu names from the menus table for any order with a quantity >2.
  - [x] Use the ANY operator
  - [x] Outer query selects Menu name
  - [x] Inner query checks order quantity
- [x] Add script file to Module 2 tasks folder.