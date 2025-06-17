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

## **MODULE 3 TASKS:**
Uploading Tableau workbook, and screenshots to REPO.

## **TASK 1**

In this first task, you need to connect to Little Lemon data stored in the Excel Sheet called LittleLemonDB. Then filter data in the data source page and select the United States as the country.

Here’s some guidance for completing this task:

- Open Tableau. In the Connection Pane select Excel, then navigate to the data source.
- In the data source page, select Filter Tab.

- [x] Check this box when completed

## **TASK 2**

In the second task, you need to create two new data fields called First Name and Last Name. Related values should be extracted from the Full Name field.

Here’s some guidance for completing this task:

- You can use the Split feature in Tableau.
- Rename the new fields.

- [x] Check this box when completed
## **TASK 3**

For your third task, you need to create a new data field that stores the profits for each sale, or order as shown in the screenshot below.

Here’s some guidance for completing this task:

- Select Sales field in the Data Pane, then select Create Calculated field.
- Name the calculated field Profit.    
- Write a formula that deducts Cost from Sales.

- [x] Check this box when completed

## **TASK 4**

You need to create a bar chart that shows customers sales and filter data based on sales with at least $70.

Here’s some guidance for completing this task:

- Drag and drop relevant fields from the data pane into the shelves section.
- Use a suitable colour scheme.
- Filter sales based on sales >= $70.
- Name the chart Customers sales.

- [x] Check this box when completed

## **TASK 5**

In the second task, you need to create a line chart to show the sales trend from 2019 to 2022.

Here’s some guidance for completing this task:

- Drag and drop relevant fields from the data pane.
- Use a suitable colour scheme.
- Filter data to exclude 2023.
- Name the chart Profit chart.

- [x] Check this box when completed

## **TASK 6**

In the third task, you need to create a Bubble chart of sales for all customers. The chart should show the names of all customers. Once you roll over a bubble, the chart should show the name, profit and sale.

Here’s some guidance for completing this task:

- Drag and drop relevant fields from the data pane.
- Use a suitable colour scheme.    
- Name the chart Sales Bubble Chart

- [x] Check box when completed

## **TASK 7**

In this task, you need to compare the sales of the three different cuisines sold at Little Lemon. Create a Bar chart that shows the sales of the Turkish, Italian and Greek cuisines.

You need to display sales data for 2020, 2021, and 2022 only. Each bar should display the profit of each cuisine.

Here’s some guidance for completing this task:

- Drag and drop relevant fields from the data pane.    
- Use a suitable color scheme.
- Name the worksheet Cuisine Sales and Profits.    
- Sort data in descending order by the sum of the sale.

- [x] Check this box when completed

## **TASK 8**

In this final task, you need to create an interactive dashboard that combines the Bar chart called Customers sales and the Sales Bubble Chart. Once you click a bar, and roll over the related bubble, the name, sales and profit figures should be displayed in the Bubble chart.

- [x] Check this box when completed

## **TASK 9**

Your first task is to navigate to your terminal and ensure that Python is installed and available on the command path.

- [x] Check this box when completed

## **TASK 10**

Having established that an up-to date version of python is installed on your machine you will need to install Jupyter.
(I'm using Jupyter file extension files in VSCode)

- [x] Check this box when completed

## **TASK 11**

Establish a connection between Python and your database using the following steps:

**Step One:**
Ensure that mysql-connector is installed by running the command:

**Step Two:**
Import the connector under the alias connector:

```PYTHON
import mysql.connector as connector
```

**Step Three:**
Verify that a connection can be made with your database by calling the connection method from the connector

```PYTHON
connection = connector.connect
	(
     user = "your_user_name",
     password = "your_password_for_database"
     )
```

- [x] Check this box when completed

## **TASK 12**

In the previous exercise you created a Python environment. In the first task of this exercise, you are tasked with extending the environment to connect with your database and interact with the data it holds.

Your first step is to import the connector module, enter your user details and connect with the database (Hint: you can use an alias when importing the module).

This gives you access to all the functionality available from the connector API, which can be accessed through the variable named connector (or whichever alias you choose).

This code should look very familiar to you from the previous course, apart from the parameter db. DB stands for database. When instantiating the connection, you can pass the database name here in place of calling the USE command later.

The final step is to instantiate an instance of cursor to pass queries and return results (Hint: the cursor is part of the connection class outlined above).

```PYTHON
try:
     connection = connector.connect(
          user = "root",
          password = "Tib4lt_cosmic_!mpo$ter",
          db = 'littlelemondb'
          )
except connector.Error as e:
     print(f'Error connecting to database: {e}')

cursor = connection.cursor()
```

- [x] Check this box when completed

## **TASK 13**

In this second task, you now need to query the database to show all tables within the database.

Having established a connection in the first task, you need to execute a test query to ensure that there are no issues. You can do this by executing, or passing, a generic query that returns a snapshot of the database tables.

You need to execute the query on the cursor using the code that follows. The cursor, as you should recall, is the bridge through which you can pass queries and return results.

```PYTHON
show_tables_query = "SHOW tables" 
cursor.execute(show_tables_query)
```

As before, a variable is used to hold the query. To gain a general insight, the query asks to display all tables within the database.

The second line calls the cursor execute method. This method takes the Python string and ports it into a viable SQL statement. It then passes it to the database and returns the result.

To view the results of your query, you can create another variable called _results_ (Hint: the cursor has a method that can return all results in one call).

To view the tables that are associated with a database, you can print out the results variable using the following code:

```PYTHON
print(results)
```

```PYTHON
# Executing Queries
cursor.execute(qry_show_tables)
results = sorted(result[0] for result in cursor.fetchall())

print(f'Displaying all tables:')
for result in results:
     print(f'- {result}')
```

- [x] Check this box when completed

## **TASK 14**

**Query with table JOIN**

Little Lemon need you to return specific details from your database. They require the full name and contact details for every customer that has placed an order greater than $60 for a promotional campaign.

You can use the following steps to implement this functionality in your database directory:

**Step One:** Identify which tables are required. To complete the query, you first need to identify which table has the required data.

The bill paid can be found in Orders as TotalCost and the customer contact information can be found in the Customers table.

When selecting attributes from a specific table, specify the table name, followed by a dot and the target attribute as below (Hint: select the column attributes that you will need).

**Step Two:** Next, specify a table (Hint: The FROM keyword allows you to identify a table.)

To join two tables, specify the type of JOIN and the attribute to join the table on. The tables must be joined on an attribute that is common to both tables (such as a common column).

**Step Three:** Finally, include a clause to filter the data on. (Hint: the WHERE clause can be used to add conditional parameters.)

When you have completed these steps, wrap this query as a string and pass it to the .execute() method of the cursor class. When executed, your SELECT query must extract the full name, contact details and bill amount for every customer who spent more than $60.

```PYTHON
qry_promotional_sales_data = '''
SELECT
     CONCAT(c.CustomerFirstName, ' ', c.CustomerLastName) AS 'Full Name',
     c.CustomerPhone AS 'Customer Phone',
     c.CustomerEmail AS 'Customer Email',
     SUM(oi.Quantity * mi.ItemCost) AS 'Order Cost'
FROM
     Customers c
JOIN
     Orders o ON o.OrderCustomerID = c.CustomerID
JOIN
     OrderItems oi ON oi.OrderID = o.OrderID
JOIN
     MenuItems mi ON mi.ItemID = oi.ItemID
GROUP BY
    c.CustomerID, c.CustomerFirstName, c.CustomerLastName, 
    c.CustomerPhone, c.CustomerEmail
HAVING
     SUM(oi.Quantity * mi.ItemCost) > 60;
'''
```

```PYTHON
'''
Little Lemon would like the following data:
From Customers Table:
- Full Name
- Email
- Phone Number
For every order >$60
'''

cursor.execute(qry_promotional_sales_data)
results = sorted(cursor.fetchall())

print(f'Customers valid for upcoming promotion:')
print(f'Full Name | Phone Number | Email | Total Order Cost\n')
for result in results:
     print(f'{result[0]}, {result[1]}, {result[2]}, ${result[3]}')
```

- [x] Check this box when completed