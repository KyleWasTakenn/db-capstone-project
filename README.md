# META DATABASE PROJECT - COURSE 8
META DB Engineering project

## MODULE 1 TASKS:
- SQL File for Database creation
     - No data, META didn't include any data inserts (So left blank)
     - Otained from Workbench Forward Engineering
- MYSQL Workbench Model File
- EER Diagram exported as a PNG from Workbench

## MODULE 2 TASKS:
- ~~Change Menu table to MenuItems, containing the Course, Starter, and Dessert name attributes.
	- ~~Add Menus table, reference the MenuItemsID as a Foreign Key.
		- ~~Include the MenuName, and Cuisine in this table as attributes.
- ~~Populate the tables with data... (META why the fuck isn't this included?)
- ~~Re Forward Engineer the new EER, update the SQL file and PNG.
	- ~~~Push changes to GitHub, and commit.
- ~~Proceed with the next tasks

Task 1:
Create a virtual table called OrdersView that focuses on OrderID, Quantity, and Cost columns from the Orders table. Filter for all orders with a quantity > 2 only.

Task 2:
Use a JOIN clause to extract information from four tables on all customers with a cost more than $150. 
- Customers table: Customer ID and Full Name
- Orders table: The Order ID and Cost
- Menus table: The menus name
- MenuItems table: Course name and starter name

Sort the result by the lowest cost amount.

Task 3:
Find all menu items for which at least 3 orders have been placed. Create a subquery that lists the menu names from the menus table for any order with a quantity >2.
- Use the ANY operator
- The outer query should be used to select the Menu name from the menus table.
- The inner query should check the order quantity.