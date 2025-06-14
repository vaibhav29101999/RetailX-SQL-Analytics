-- Data Science - art that deals with working of data to solve business problem
-- Data science is not about a technology, it is a combination of analytical thinking, business domain knowledge and technical expertise. What will happen next?
-- Data Analytics - subset of Data science , focus on specific questions - what happened, why?
-- Tools and Technologies - SQL. Python, Excel, BI Tools, Stats and Probability

-- SQL -

-- Structured Query Language - language used to communicate with data

-- → structured - organised in tables , rows and columns - sql, python, excel,etc
-- → unstructured - no structures, no fixed format, text files, images, videos, social media posts, tools - AI and NLP
-- → semi-structured - has some structure but is not fully structured, json,xml
-- E.g., emails ; tools - json parsing, noSQL 

-- Data base -
-- → structured collection of data that allows efficient storage, retrieval 
-- → can store huge amount of data
-- → ensures that data is consistent

-- Different Types of Databases -

-- → Relational DBMS - stores data in tables which are related to each other
-- E.g., MySQL, SQL Server, Oracle, Postgre SQL
-- → No SQL Databases - support semi-structured and unstructured data 
-- E.g., mongoDB, Redis
-- → Cloud Databases - hosted on cloud platforms
-- E.g., Google GCP, AWS, azure
-- → Graph databases - store data as nodes and relationships
-- E.g., arango DB

-- SQL
-- → LinkedIN  - user profiles, posts, like , comments, shares, messages
-- → Food Delivery apps - sql tracks restaurant, menus, orders, complaints, delivery status

-- MYSQL - Workbench

-- Windows - https://www.simplilearn.com/tutorials/mysql-tutorial/mysql-workbench-installation
-- Mac - https://www.youtube.com/watch?v=vQPBNCvboSo

-- 02-02-25

-- MYSQL commands

-- → DDL - Data definition Language - creating and modifying database structures
--  create, alter, drop, truncate, rename
-- → DML - Data Manipulation Language - insertion, updation or modification
--  insert, update, delete
-- → DQL -  Data Query Language - used for fetching data
-- select
-- → TCL - Transaction Control Language - manage transactions
-- commit, rollback, savepoint
-- → DCL - Data Control Language - commands used for permission and security
--  grant,revoke

-- Data -
-- Data Type - what kind of data you can store in a table's columns
-- Constraints - rules applied to columns

-- Data Types -

-- Numeric - numbers, whole numbers and decimal numbers
-- INT - whole numbers, age , pin (SIZE - 4 BYTES)
-- BIGINT - VERY LARGE NUMBERS (SIZE - 8 BYTES), POPULATION, PRODUCT SERIAL NO
-- DECIMAL(X,Y) - PRICE, WEIGHT, HEIGHT, (SIZE - VARIABLE)
-- FLOAT - DECIMAL NUMBERS (SIZE = 4 BYTES)

-- String or Character - FOR TEXT (WORDS, SENTENCES, PARAGRAPHS), ENCLOSE WITHIN ‘’ OR “” 
-- CHAR(N) - FIXED LENGTH CHARACTER (E.G., CHAR(5) EVERY VALUE WILL HAVE EXACTLY 5 CHARACTERS, SIZE CAN BE 1-255 CHARACTERS), GENDER (M,F), AADHAR, REGNNO)
-- VARCHAR(N) - VARIABLE LENGTH TEXT (E.G., VARCHAR(10) VALUES CAN BE OF MAX 10 CHARACTERS, SIZE - 1-65535 CHARACTERS) E.G., NAME, EMAIL, CITY
-- TEXT - LARGE TEXT , PARAGRAPHS 
-- Date and Time - STORING DATE/TIME 
-- DATE - ONLY DATE (SIZE - 3 BYTES) - YYYY-MM-DD
-- DATETIME - DATE + TIME - YYYY-MM-DD HH:MM:SS (SIZE - 8 BYTES)
-- TIME - TIME VALUE (HH:MM:SS) (SIZE - 3 BYTES)

-- Other - NON TRADITIONAL DATA 
-- BOOLEAN/BOOL - TRUE/FALSE (TRUE - 1, FALSE - 0) (SIZE = 1 BYTE)
-- JSON - {“NAME”:’RAHUL’,’AGE’:25’}

-- Codes -
-- CREATE DATABASE (COMMENTS)
drop database practice ;
drop database retail ;
CREATE DATABASE RETAIL;
 
-- SHOWS US ALL THE DATABSES CURRENTLY PRESENT
SHOW DATABASES; 

-- INFORM SQL HEREAFTER USE THIS DATABASE
USE RETAIL;

-- create table
-- syntax - 
-- create table table_name (
-- col1 data_type, col2 datatype);

create table employees (
eid int, 
Name varchar(50),
age INT,
salary decimal(10,2) -- there can 10 digits max before decimal point and 2 after decimal
);

-- insertion

insert into employees (eid, Name,age,salary)
values (1,'Alice',25,50000.00),
(2,'Bob',27,55000.00);

-- basic query - show us the data

select eid, Name,age,salary
from employees;

-- or (* means selecting all columns)

select *
from employees;

select *
from coffee_sales;

-- select & where - select used to fetch data from a table, it has multiple clauses
-- from, where, groupby , having, limit, order by
-- where clause used to filter data based on specific condition

-- select column_names(separated by comma)
-- from table;
select Margin,Market_size
from coffee_sales;

-- display all columns
select * from coffee_sales;

-- where  
-- select columns
-- from table
-- where condition;

-- operators - symbol that help us make calculations/conditions
-- fruit = apple (value in fruit column equals to apple)

select Product_type,Product,Profit
from coffee_sales
where Product = 'Lemon';

--  >,<,>=,<= - arithmatic operators/comparison operators

select `Inventory Margin`,Market,Product,Profit
from coffee_sales
where Profit > 500;

-- rows where product is not equal to "lemon" (<> or !=)
select Product_type,Product,Profit
from coffee_sales
where Product != 'lemon';

-- find products(product's name and type)  whose sales is greater than 300
select Product,Product_type,Sales
from coffee_sales
where Sales > 300;

-- find what product types are available in this data
select Product_type
from coffee_sales; 

-- to get only unique values (out of selected columns) - distinct
select distinct Product_type from coffee_sales; 
select distinct market from coffee_sales ; 
select distinct Product_type,Market from coffee_sales; 

-- Date 07-02-2025 

-- logical operators - used for combining conditions
-- and (if both are true outcome is true)
-- or (if even one is true outcome is true) 
-- not (opposite)

-- find data of sales where market is Central Asia and profit > 100

select Market,Product,Profit, Sales  from coffee_sales
where Market = 'Central Asia' and profit > 100;

select Market,Product,Profit, Sales from coffee_sales
where Market = 'Central Asia' or profit > 100;

select Market,Product,Profit, Sales  from coffee_sales
where not Market = 'Central Asia'; 

-- Get all sales where the margin is either 
-- greater than 10 or the inventory margin is greater than 5 

select Margin,`Inventory Margin`,Market,Profit,Sales
from coffee_sales
where Margin >10 or `Inventory Margin` >5;

-- Get all records except those from the Southeast Asia market
select Market,Sales from coffee_sales
where not Market = 'Southeast Asia';

-- Retrieve products where actual profit is less than target profit OR actual sales are less than target sales. 
SELECT Product, Profit, Target_profit, Sales, Target_sales  FROM coffee_sales 
WHERE Profit < Target_profit OR Sales < Target_sales;

-- Find all markets where profit is more than 200 AND market size is 'Medium' OR 'Large' 

select * from coffee_sales
where profit > 200 and (Market_size = 'Medium' or Market_size = 'Large');

-- between - check if a value falls within a range (incluse)
select Product_line,Target_profit,Profit from coffee_sales
where Target_profit between 50 and 150;

-- numeric values and with date values
-- membership operator - check if a value is present in a given set or not
-- in , not in

select distinct Product from coffee_sales;
select Product,Product_type,Product_line,sales, profit from coffee_sales
where product in ('lemon','Green Tea','Colombian');

-- where product = 'lemon' or product = 'green tea' .....
select Product,Product_type,Product_line,sales, profit from coffee_sales
where product not in ('lemon','Green Tea','Colombian');

-- Retrieve all coffee sales where the Product_type is 'Espresso', 'Cappuccino', or 'Latte'. 
SELECT Product, Product_type, Sales  FROM coffee_sales 
WHERE Product_type IN ('Espresso', 'Cappuccino', 'Latte');

-- Retrieve all records where the difference between actual and target profit ranges from -500 and 300. 
select Product,DifferenceBetweenActualandTargetProfit from coffee_sales
where DifferenceBetweenActualandTargetProfit between -500 and 300;

-- BLOB - Binary Large Object - date type to store images videos, audio files
-- enum - enumeration - data type that allows a column to have predefined values
-- fruits column --> apple, banana, cherry
-- save storage space

create table fruits (
fruit_name enum('apple','banana','cherry'),
price int);

insert into fruits (fruit_name, price)
values ('cherry',100),
('apple',45);

select * from fruits;

insert into fruits (fruit_name, price)
values ('kiwi',130);

insert into fruits (fruit_name, price)
values ('Cherry',200);

-- gender 
-- Both queries giving different result. Please explain once
-- Select Market, Product, Profit, Market_size from coffee_sales
-- Where Profit > 200 AND (Market_size = 'Medium' OR Market_size = 'Large');

-- Select Market, Product, Profit, Market_size from coffee_sales
-- Where Profit > 200 AND Market_size = ('Medium' OR 'Large');

-- Date 09-02-2025
-- Codes

-- Create Customers Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    city VARCHAR(50),
    join_date DATE
);

-- Insert Data into Customers
INSERT INTO customers (name, email, city, join_date) VALUES
('Alice Johnson', 'alice@example.com', 'New York', '2010-01-10'),
('Bob Smith', 'bob@example.com', 'Los Angeles', '2009-02-15'),
('Charlie Brown', 'charlie@example.com', 'Chicago', '1999-03-20'),
('David Lee', 'david@example.com', 'Houston', '1998-04-05'),
('Emma Wilson', 'emma@example.com', 'Miami', '1978-05-12'),
('Frank Harris', 'frank@example.com', 'Seattle', '1999-06-18'),
('Grace Adams', 'grace@example.com', 'Denver', '2010-07-23'),
('Hank Miller', 'hank@example.com', 'Boston', '2001-08-30'),
('Ivy Carter', 'ivy@example.com', 'San Francisco', '1998-09-14'),
('Jack Turner', 'jack@example.com', 'Dallas', '1996-10-22');

-- Create Products Table
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock_quantity INT
);

-- Insert Data into Products
INSERT INTO products (product_name, category, price, stock_quantity) VALUES
('Laptop', 'Electronics', 999.99, 10),
('Smartphone', 'Electronics', 699.99, 15),
('Headphones', 'Electronics', 99.99, 50),
('Coffee Maker', 'Home Appliances', 49.99, 20),
('Blender', 'Home Appliances', 39.99, 30),
('Frying Pan', 'Kitchenware', 19.99, 25),
('Notebook', 'Stationery', 2.99, 100),
('Backpack', 'Bags', 34.99, 40),
('Sneakers', 'Footwear', 59.99, 35),
('Gaming Console', 'Electronics', 399.99, 5),
('Tennis Racket', 'Sports', 79.99, 8),
('Yoga Mat', 'Fitness', 25.99, 12);

-- Create Orders Table
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    product_id INT,
    order_date DATE,
    quantity INT
);

-- Insert Data into Orders 
INSERT INTO orders (customer_id, product_id, order_date, quantity) VALUES
(1, 1, '2023-01-10', 1),
(1, 2, '2023-02-15', 2),
(2, 3, '2023-03-20', 1),
(3, 4, '2023-04-05', 3),
(4, 1, '2023-05-12', 1),
(5, 5, '2023-06-18', 2),
(5, 6, '2023-07-23', 1),
(6, 7, '2023-08-30', 5),
(7, 8, '2023-09-14', 1),
(7, 2, '2023-10-22', 2),
(8, 10, '2023-11-05', 1),
(9, 11, '2023-12-12', 2);

select * from customers;
select * from orders;
select * from products;

-- update - modify existing records/rows
-- syntax - 
-- update table_name
-- set column1 = value1
-- where condition;

-- update a customer's city 
select * from customers where customer_id = 3;
update customers set city = 'San Diego' where customer_id = 3;
select * from customers where customer_id = 3;

-- update multiple columns 
-- update customer's city and email 

select * from customers where customer_id = 2;
update customers set city = 'London' , email = 'newemail@example.com' where customer_id = 2;

select * from customers where customer_id = 2;

-- update multiple rows 
-- increase the price of all electronic product by 10%
 
select * from products where category = 'Electronics'; 
 
update products set price = price * 1.1 where category = 'Electronics';

-- currently safe update mode is enabled
-- to disable it -
SET SQL_SAFE_UPDATES = 0;

-- update all rows
select * from fruits; 

update fruits set price = 100; -- all rows will get updated with price as 100

-- Update the price of all books in the products table by 500 where the category is 'Books'
select * from products ;
select distinct category from products ;
update products set price = price+500
where category = 'Books';

-- alter - modify the structure of an existing table
-- syntax -  
-- alter table table_name action;
-- add a new column - phone number
alter table customers add phone_number int;

select * from customers;

-- see columns
show columns from customers;  

update customers set phone_number = floor(900000000+ rand()*100000000);

-- floor - round it to nearest integer
-- rand() - generates a random decimal 
select rand();
select 90000+rand()* 10000;
 
-- add multiple columns
-- alter table customers
-- add column1 datatype,
-- add column2 datatype; 

-- rename a column 
alter table customers change column name customer_name varchar(100);

-- change the column named as 'name' to 'customer_name'
-- rename a table
alter table fruits rename to fruit_basket;

-- deletions
-- drop, delete, truncate  - remove data
-- drop - deletes the entire table , cannot be rolled back
-- delete - removes specific rows - can be rolled back
-- truncate - removes all the data but keeps the structure, can't be rolled back

create table fruits (
fruit_name enum('apple','banana','cherry'),
price int
);

insert into fruits (fruit_name, price)
values ('cherry',100),
('apple',45),
('Cherry',200),
('banana',50),
('banana',80);

select * from fruits; 

-- delete -
delete from fruits where price > 150;

-- delete rows where price > 150
delete from fruits; -- without a where clause it would then delete all rows

select * from fruits;
 
-- truncate
truncate table fruits;

-- drop table
drop table fruits;

-- Date 10-02-25

-- aggregations - peform calculations on a set of values and return a single result
-- summarising data 
-- group by
-- sum, min, max, avg, count

-- sum() - add up numeric values
select sum(quantity) as total_qty
from orders;

-- count() - counts the number of values/rows in a set of rows
-- returns the number of non-null values

-- count(*) - counts every row in the table including null values
 
select count(*) as total_rows from customers;
select count(customer_name) as total_rows from customers;
select * from customers;

update customers set city = null where customer_id in (2,6);

-- count rows where city value is null (is null)
select count(*) as null_rows from customers where city is null;

-- count(column_name) - counts only non null values in a column
select count(customer_id) as total_customers, count(city) as total_cities from customers;
select count(customer_id), count(city) from customers;
use retail ;
-- count(distinct columnname) - count distinct or unique non null values
select count(category), count(distinct category) from products;

-- 8 unique categories 
-- count(1) or count(2) - also counts all rows, faster than count(*)
-- min and max - minimum and maximum value

select min(price) as lowest_price,  max(price) as highest_price from products;

-- avg() -  mean or average of numerical values
-- ignores null values

select avg(price) as avg_price from products;

-- with avg function, try and use round()
select round(avg(price)) as avg_price from products;

-- round() - rounds a number to specific decimal values
select round(9.1333443333),
round(6.788888834); -- rounds to nearest integer

select round(6.788888834,2); -- round upto 2 decimal places

select round(6.5);

-- 14-02-25

-- Group by -  clause, group rows that have same values and apply aggregate functions on them
-- group by 1 or more columns
-- syntax -
-- select column_name, agg_func(column2)
-- from table_name
-- group by column_name

-- total stock_quanity for every category

select category, sum(stock_quantity) as total_stock from products group by category; 

select sum(stock_quantity) as total_stock from products group by category; 

select product_name,sum(stock_quantity) as total_stock from products group by 1;

-- columns mentioned in select before agg func has to be grouped

select sum(stock_quantity) as total_stock, category,product_name from products group by category,product_name;

select category,product_name from products group by category,product_name;

-- equivalent
select distinct category,product_name from products;

--  distinct is faster when you just need unique values

-- average age in every city

CREATE TABLE sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50),
    salesperson VARCHAR(50),
    city VARCHAR(50),
    sale_date DATE,
    quantity INT,
    price DECIMAL(10,2)
);

INSERT INTO sales (product_name, category, salesperson, city, sale_date, quantity, price) VALUES
('Laptop', 'Electronics', 'Alice', 'New York', '2024-02-01', 3, 800.00),
('Smartphone', 'Electronics', 'Bob', 'Los Angeles', '2024-02-02', 5, 500.00),
('Tablet', 'Electronics', 'Alice', 'New York', '2024-02-05', 2, 300.00),
('T-Shirt', 'Clothing', 'Charlie', 'Chicago', '2024-02-06', 10, 20.00),
('Jeans', 'Clothing', 'David', 'Houston', '2024-02-07', 7, 40.00),
('Laptop', 'Electronics', 'Alice', 'New York', '2024-02-10', 2, 800.00),
('Smartphone', 'Electronics', 'Emma', 'San Francisco', '2024-02-12', 4, 500.00),
('Tablet', 'Electronics', 'Bob', 'Los Angeles', '2024-02-13', 3, 300.00),
('T-Shirt', 'Clothing', 'Charlie', 'Chicago', '2024-02-14', 8, 20.00),
('Smartwatch', 'Electronics', 'David', 'Houston', '2024-02-15', 6, 250.00),
('Laptop', 'Electronics', 'Emma', 'San Francisco', '2024-02-16', 1, 800.00),
('Jeans', 'Clothing', 'Charlie', 'Chicago', '2024-02-18', 5, 40.00),
('Smartphone', 'Electronics', 'Bob', 'Los Angeles', '2024-02-20', 3, 500.00),
('Tablet', 'Electronics', 'Alice', 'New York', '2024-02-22', 4, 300.00),
('T-Shirt', 'Clothing', 'Emma', 'San Francisco', '2024-02-25', 9, 20.00);

select * from sales;
-- total sales per category
select category,sum(quantity*price) as total_sales from sales group by category;

-- total sales per category for new york city
select category,sum(quantity*price) as total_sales from sales where city = 'New York' group by category;
select category,min(quantity*price) as total_sales from sales where city = 'New York' group by category;
select category,max(quantity*price) as total_sales from sales where city = 'New York' group by category;
select category,avg(quantity*price) as total_sales from sales where city = 'New York' group by category;
select category,count(quantity*price) as total_sales from sales where city = 'New York' group by category;

-- Order of Query clauses 
-- select -> from -> where -> group by -> having -> order by -> limit

select category,sum(quantity*price) as total_sales from sales group by 1;

-- short cut 
SELECT city,category, SUM(quantity * price) AS total_revenue FROM sales GROUP BY 1,2;

-- 16-02-25

-- or (logical op) in (membership op)

select * from sales where category = 'Electronics' or category = 'Clothing';
select * from sales where category in ('Electronics' ,'Clothing');

-- combine different conditions
-- either city is New York or price >500
select * from sales where city = 'new York' or price > 500;

-- concat
select concat("hello","!"," World");

select * from sales where (city = 'new York' or price > 500) and product_name in ('Laptop','Smartphone');

-- emp id - int (0000 -->0) , varchar (0000)
-- group by and distinct(eliminate duplicates)

select distinct category from sales;
select category from sales group by category;

-- aggreagation
select category, sum(price) from sales group by category;

-- unique (constraint) , distinct (query keyword)
select category, sum(price) from sales where price >200 group by category ;

-- % , like (pattern matching)
SELECT winner, subject,subject IN ('chemistry','physics') FROM nobel WHERE yr=1984 ORDER BY subject IN ('chemistry','physics'), subject,winner;
 
-- order by --> used to sort the result of a query
-- select
-- from 
-- -- where
-- -- group by
-- -- having
-- order by - by default it sorts in ascending(asc)

select price from sales order by price desc;

-- order by multiple columns
select price, quantity from sales order by price desc,quantity desc;

-- city = 'New York', !=
-- city in ('New York','Chicago') 

-- round() - round(number, decimal_places(optional --> by default it rounds to 0 decimal))
select round(9.876532567),round(9.876532567,2),round(9.876532567,1),round(9.876532567,3);

-- When you use a negative decimal_place value, MySQL rounds before the decimal point.
select round(12345,-2),round(12345,-1),round(12345,-3),round(12345,-4);

-- round gdp column to nearest column
select round(gdp,-2);

select round(12346,-1);

-- rand() - generate a random number between 0 and 1
select rand() ; 

-- rand() to give 3 digits number
select round(rand()* 1000);

-- 17-02-25

-- 1. Find the total quantity sold and total revenue for each category.
-- 2. Find the highest quantity sold in a single sale for each city.
-- 3. Calculate the average price of products sold per category.
-- 4. Find how many individual orders each salesperson made.
-- 5. Find the earliest sale date for each city.

CREATE TABLE example_data (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO example_data (name, city) VALUES
('Nancy', 'New York'),
('Nathan', 'Los Angeles'),
('Nina', 'Nairobi'),
('Alan', 'New Delhi'),
('Banana', 'Boston'),
('Brandon', 'Berlin'),
('Anna', 'Amsterdam'),
('Annie', 'New Orleans'),
('Aniket', 'Mumbai'),
('Bbnathan', 'Bangalore'),
('Nanette', 'New Jersey'),
('Noah', 'Chicago'),
('Naomi', 'Houston'),
('Natalie', 'Paris'),
('Ethan', 'Newcastle'),
('Abby', 'San Francisco'),
('Naresh', 'Hyderabad'),
('Ben', 'Brisbane'),
('Anwar', 'Cairo'),
('Bbnick', 'Barcelona'),
('Nash', 'Toronto'),
('Annabelle', 'Manchester'),
('Neha', 'Kolkata'),
('Nathaniel', 'Dubai'),
('Nelson', 'Sydney'),
('N','London'),
('Aan','Manhattan'),
('Ana','Sydney');

select * from example_data;

-- 1. Find the total quantity sold and total revenue for each category.
select category, sum(quantity) as total_qty, sum(price*quantity) as total_revenue from sales group by 1;

-- 2. Find the highest quantity sold in a single sale for each city.
select city, max(quantity) as highest_qty from sales group by 1;

-- 3. Calculate the average price of products sold per category.
SELECT category, AVG(price) AS avg_price FROM sales GROUP BY category;

-- 4. Find how many individual orders each salesperson made.
select salesperson, count(distinct sale_id) as no_of_sales from sales group by 1 order by 2 desc;

-- 5. Find the earliest sale date for each city.
select city, min(sale_date) as earliest_date from sales group by 1;

-- limit - restrict the number of rows returned in a query result
select * from sales limit 5; -- restricting the query result to just first 5 rows

-- get the 3 most expensive products
select * from products order by price desc limit 3;

-- find the city with highest revenue
 select city, sum(price*quantity) as total_revenue from sales group by 1 order by 2 desc limit 1;

-- skip some rows -> offset
select * from sales limit 5 offset 5; -- skip 5 rows and show next 5

select * from sales limit 3 offset 5; 
select * from sales limit 4,2; -- skip 4 rows and fetch/show the next 2 rows

-- find the city with second highest revenue
select city, sum(price*quantity) as total_revenue from sales group by 1 order by 2 desc limit 1,1;

-- like operator - pattern matching in a where clause
-- find all cities that start with 'a', find the rows where city is New York
-- wildcards - %(represent any number of characters) , _(represent a single character)
-- find cities that start with 'N'
select * from sales where city like 'N%';

CREATE TABLE example_data (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50)
);
INSERT INTO example_data (name, city) VALUES
('Nancy', 'New York'),
('Nathan', 'Los Angeles'),
('Nina', 'Nairobi'),
('Alan', 'New Delhi'),
('Banana', 'Boston'),
('Brandon', 'Berlin'),
('Anna', 'Amsterdam'),
('Annie', 'New Orleans'),
('Aniket', 'Mumbai'),
('Bbnathan', 'Bangalore'),
('Nanette', 'New Jersey'),
('Noah', 'Chicago'),
('Naomi', 'Houston'),
('Natalie', 'Paris'),
('Ethan', 'Newcastle'),
('Abby', 'San Francisco'),
('Naresh', 'Hyderabad'),
('Ben', 'Brisbane'),
('Anwar', 'Cairo'),
('Bbnick', 'Barcelona'),
('Nash', 'Toronto'),
('Annabelle', 'Manchester'),
('Neha', 'Kolkata'),
('Nathaniel', 'Dubai'),
('Nelson', 'Sydney'),
('N','London'),
('Aan','Manhattan'),
('Ana','Sydney');

select * from example_data;

-- find names that start with n
select * from example_data where name like 'N%';
select * from example_data where name like 'n';
select * from example_data where name like 'n_';
select * from example_data where name like '_n%';
select * from example_data where name like '__n%';

-- words whose 3rd character is n
select * from example_data where name like '%n%'; -- words that contain 'n'

-- 21-02-25

-- 1. Find all names that start with ‘N’ and end with ‘a’.
-- 2. Retrieve all records where the name contains ‘bbn’ anywhere.
-- 3. Find names where the second letter is ‘a’.
-- 4. Count how many customers belong to cities that start with ‘New’.
-- 5. Find names that are exactly 5 letters long.
-- 6. Find products where the name contains ‘an’ anywhere.
-- 7. Group sales data by category and find the total quantity sold per category.
-- 8. Find the total sales value per city (assuming sales table has a city column).
-- 9. Find the average quantity sold for each product, but only for products with names starting with ‘B’.
-- 10. Find the highest sales value for each product.

-- 1. Find all names that start with ‘N’ and end with ‘a’.
select * from example_data where name like 'n%a';

-- 2. Retrieve all records where the name contains ‘bbn’ anywhere.
SELECT * FROM example_data WHERE name LIKE '%bbn%';

-- 3. Find names where the second letter is ‘a’.
SELECT * FROM example_data WHERE name LIKE '_a%';

-- 4. Count how many customers belong to cities that start with ‘New’.
SELECT COUNT(*) AS total_customers FROM example_data WHERE city LIKE 'New%';

-- 5. Find names that are exactly 5 letters long.
select name from example_data where name like '_____';

select name from example_data where length(name) = 5;

-- 6. Find products where the name contains ‘an’ anywhere.
SELECT * FROM sales WHERE product_name LIKE '%an%';

-- 7. Group sales data by category and find the total quantity sold per category.
SELECT category, SUM(quantity) AS total_quantity FROM sale GROUP BY category;

-- 8. Find the total sales value per city (assuming sales table has a city column).
SELECT city, SUM(quantity*price) AS total_sales FROM sales GROUP BY city;


-- 9. Find the average quantity sold for each product, but only for products with names starting with ‘B’.
SELECT product_name, AVG(quantity) AS avg_quantity FROM sales WHERE product_name LIKE 'B%' group by 1;

-- 10. Find the highest sales value for each product.
SELECT product_name, MAX(quantity*price) AS highest_sale FROM sales GROUP BY product_name;

-- 23-02-25
-- 1. Find cities where total sales revenue is greater than 50,000.
-- 2. ind salespeople who sold more than 100 products in total.
-- 3. Find product categories that have at least 3 different products 
-- but total sales are below 10,000.
-- 4. Find salespeople who have made sales in at least 3 different
--  cities and generated revenue above 40,000.

-- having - clause used to filter result after aggregation
select * from sales;

-- find product names whose highest sale > 1000
SELECT product_name, MAX(quantity*price) AS highest_sale FROM sales GROUP BY product_name having MAX(quantity*price) > 1000;

-- find product names whose highest sale > 1000 and qty sold at each transaction > 3
SELECT product_name, MAX(quantity*price) AS highest_sale FROM sales where quantity>3 GROUP BY product_name having MAX(quantity*price) > 1000;

SELECT product_name, MAX(quantity*price) AS highest_sale FROM sales where quantity>3 GROUP BY product_name having highest_sale > 1000;

-- Find categories where total sales exceed 60.

select category,sum(price) as total_sales from products group by 1 having total_sales > 60;

-- 1. Find cities where total sales revenue is greater than 50,000.
SELECT city, SUM(quantity * price) AS total_revenue FROM sales GROUP BY city HAVING total_revenue > 50000;

-- 2. Find salespeople who sold more than 10 products in total.
SELECT salesperson, SUM(quantity) AS total_quantity_sold FROM sales GROUP BY salesperson HAVING total_quantity_sold > 10;

-- 3. Find product categories that have at least 3 different products 
-- but total sales are below 10,000.
SELECT category, COUNT(DISTINCT product_name) AS num_products, SUM(quantity * price) AS total_sales FROM sales GROUP BY category HAVING num_products >= 3 AND total_sales < 10000;

-- 4. Find salespeople who have made sales in at least 3 different cities and generated revenue above 40,000.
SELECT salesperson, COUNT(DISTINCT city) AS unique_cities, SUM(quantity * price) AS total_revenue FROM sales GROUP BY salesperson HAVING unique_cities >= 3 AND total_revenue > 40000;

-- 1. Find product categories where total sales revenue exceeds 25,000.
SELECT category, SUM(quantity * price) AS total_revenue FROM sales GROUP BY category HAVING total_revenue > 25000;

-- 2. Find customers who have placed more than 5 orders.
SELECT customer_id, COUNT(order_id) AS total_orders FROM orders GROUP BY customer_id HAVING total_orders > 5;

-- 3. Find product categories that have at least 3 different products but total sales are below 10,000.
SELECT p.category, COUNT(DISTINCT p.product_id) AS product_count, SUM(s.quantity * s.price) AS total_sales FROM products p JOIN sales s ON p.product_name = s.product_name GROUP BY p.category HAVING product_count >= 3 AND total_sales < 10000;

-- 4. Find cities where more than 5 different salespeople have made sales.
SELECT city, COUNT(DISTINCT salesperson) AS total_salespeople FROM sales GROUP BY city HAVING total_salespeople > 5;

-- 5. Find months where total sales exceeded 100,000.
SELECT MONTH(sale_date) AS sale_month, SUM(quantity * price) AS total_revenue FROM sales GROUP BY sale_month HAVING total_revenue > 100000;

-- 24-02-25
-- joins - help combine data from multiple tables but witgh the help of a related columns/keys
select * from sales;
-- syntax 
-- select table1.col1,table2.col2,table2.col3
-- from table1 join_type table2
-- on table1.col1 = table2.col1

USE MEGNA ;
-- customers who placed an order (inner join or join)
select * from customers ;
select * from orders ;
select customers.customer_id,name,city,order_date,quantity
from customers inner join orders
on customers.customer_id = orders.customer_id;

select c.customer_id,name as c_name,city,order_date,quantity
from customers c join orders o
on c.customer_id = o.customer_id;

-- if we use alias in select we need 'as' but not in from 
select * from customers c join orders o on c.customer_id = o.customer_id;

-- all customers along with their order information
select c.customer_id,name as c_name,city,order_date,quantity from customers c left join orders o on c.customer_id = o.customer_id;

-- customers who place an order but there customer info is missing
select c.customer_id, name, city, product_id, order_date, quantity from customers c right join orders o on c.customer_id = o.customer_id ;

-- Find customers who haven’t placed any orders
select c.customer_id, name, city, order_date, quantity from customers c left join orders o on c.customer_id = o.customer_id where order_id IS NULL ;

-- Find the total number of orders placed by each customer.
select c.customer_ID, name, city, count(quantity ) as total_orders from customers c left join orders o on c.customer_id = o.customer_id group by 1 order by total_orders desc;

-- Find customers who ordered in January 2024.
select c.customer_id, name, city, order_date, quantity from customers c join orders o on c.customer_id = o.customer_id where order_date between '2024-01-01' and '2024-01-31' ;

-- Find all customers and their orders, even if they haven’t 
select * from customers c left join orders o on c.customer_id = o.customer_id ; 

-- ordered anything. Sort results by customer name.
select * from customers c left join orders o on c.customer_id = o.customer_id order by name ;
 
-- 28-02-25
-- full join/full outer join
-- select c.customer_id,name as c_name,city,order_date,quantity
-- from customers c full join orders o
-- on c.customer_id = o.customer_id;

-- full join/ full outer join
-- union/union all
CREATE TABLE fruits1 (
    fruit_id INT PRIMARY KEY AUTO_INCREMENT,
    fruit_name VARCHAR(50),
    color VARCHAR(30),
    price DECIMAL(5,2)
);
INSERT INTO fruits1 (fruit_name, color, price) VALUES
('Apple', 'Red', 3.50),
('Banana', 'Yellow', 1.20),
('Cherry', 'Red', 5.00),
('Grapes', 'Purple', 4.30),
('Mango', 'Yellow', 2.80);

CREATE TABLE fruits2 (
    fruit_id INT PRIMARY KEY AUTO_INCREMENT,
    fruit_name VARCHAR(50),
    color VARCHAR(30),
    price DECIMAL(5,2)
);

INSERT INTO fruits2 (fruit_name, color, price) VALUES
('Apple', 'Red', 3.50),  -- Duplicate from fruits1
('Orange', 'Orange', 2.50),
('Pineapple', 'Brown', 6.00),
('Banana', 'Yellow', 1.20), -- Duplicate from fruits1
('Strawberry', 'Red', 4.90);

select * from fruits1;
select * from fruits2;

select fruit_name, price from fruits1 union select fruit_name, price from fruits2;

select fruit_name, price from fruits1 union all select fruit_name, price from fruits2;

-- full outer join --> matched + umatched rows
-- left join +right join (union)
select customers.customer_id,name,city,order_date,quantity
from customers left join orders
on customers.customer_id = orders.customer_id
union
select customers.customer_id,name,city,order_date,quantity
from customers right join orders
on customers.customer_id = orders.customer_id
order by 1;

drop table employees;
CREATE TABLE departments (
    dept_id INT PRIMARY KEY AUTO_INCREMENT,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);
INSERT INTO departments (dept_name, location) VALUES
('HR', 'New York'),
('Finance', 'Chicago'),
('IT', 'San Francisco'),
('Marketing', 'Los Angeles'),
('Sales', 'Miami');
CREATE TABLE employees1 (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_name VARCHAR(50),
    dept_id INT,
    salary DECIMAL(10,2),
    hire_date DATE,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);
INSERT INTO employees (emp_name, dept_id, salary, hire_date) VALUES
('Alice', 1, 60000, '2020-05-10'),  -- HR
('Bob', 2, 75000, '2018-09-23'),  -- Finance
('Charlie', 3, 90000, '2019-11-30'),  -- IT
('David', 1, 55000, '2021-07-15'),  -- HR
('Eve', 4, 72000, '2022-01-05'),  -- Marketing
('Frank', NULL, 50000, '2023-03-19'),  -- No dept (Unmatched)
('Grace', 5, 67000, '2020-06-28');  -- Sales

select * from departments;
select * from employees1;

-- 1. Find employees along with their department names.
select emp_name, dept_name from employees1 e join departments d on e.dept_id = d.dept_id ;
select e.emp_name, d.dept_name from employees1 e left join departments d on e.dept_id = d.dept_id where d.dept_id is not null;

-- 2. Find all employees, even those without a department.
select e.emp_name, d.dept_name from employees1 e left join departments d on e.dept_id = d.dept_id ;

-- 3. Find all departments and show employees working in them.
select e.emp_id, e.emp_name, d.dept_name, location from employees1 e right join departments d on e.dept_id = d.dept_id ;

-- 4. Find all employees and all departments.
-- (Even if an employee has no department or a department has no employees, show them.)
select e.emp_name, d.dept_name from employees1 e left join departments d on e.dept_id = d.dept_id
union
select e.emp_name, d.dept_name from employees1 e right join departments d on e.dept_id = d.dept_id ; 

-- 5. Find employees who don’t belong to any department.
select e.emp_name, d.dept_name from employees1 e LEFT join departments d on e.dept_id = d.dept_id where dept_name IS NULL ;

SELECT e.emp_name  FROM employees1 e LEFT JOIN departments d ON e.dept_id = d.dept_id WHERE e.dept_id IS NULL;

-- cross joins - cartesian product of two tables (no common column needed)

create table a(
col1 varchar(5)
);

insert into a values
('a'),('b'),('c'),('d');

select * from a;

create table b(
col2 int
);

insert into b values
(1),(2),(3);

select * from b;

select col1,col2
from a cross join b
order by 1,2;

-- 03-03-25 (SELF JOIN)

use retail ;
CREATE TABLE emp (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_name VARCHAR(50),
    dept VARCHAR(50),
    salary DECIMAL(10,2),
    manager_id INT  
);
INSERT INTO emp (emp_name, dept, salary, manager_id) VALUES
('Alice', 'HR', 60000, NULL),       
('Bob', 'HR', 40000, 1),             
('Charlie', 'IT', 75000, NULL),    
('David', 'IT', 50000, 3),     
('Eve', 'IT', 45000, 3), 
('Frank', 'Sales', 70000, NULL),   
('Grace', 'Sales', 48000, 6), 
('Hank', 'Sales', 42000, 6),  
('Ivy', 'HR', 39000, 1), 
('Jack', 'IT', 5200, 3); 
USE RETAIL ;
select * from emp ;
select * from orders ;
select * from customers;
-- Find the total number of orders placed by each customer.
select o.customer_id, c.customer_name, count(o.order_id) AS total_number_of_orders 
from orders o 
join customers c on o.customer_id = c.customer_id
GROUP BY o.customer_id, c.customer_name order by 2;

SELECT o.customer_id, c.customer_name, COUNT(o.order_id) AS total_orders
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY o.customer_id, c.customer_name;

-- 2️⃣ Find customers who ordered in January 2024
select * from customers ;
select * from orders ;
select c.customer_id, c.customer_name, o.order_date from customers c join orders o on c.customer_id = o.customer_id 
where o.order_date between '2024-01-01' and '2024-01-31' ;

SELECT DISTINCT c.customer_id, c.customer_name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_date BETWEEN '2024-01-01' AND '2024-01-31';

-- 3️⃣ Find all customers and their orders, even if they haven’t ordered anything. Sort results by customer name.
select c.customer_id, c.customer_name, o.order_id, order_date, quantity from customers c left join orders o 
on c.customer_id = o.customer_id order by 1 ;

SELECT c.customer_id, c.customer_name, o.order_id, o.order_date FROM customers c LEFT JOIN orders o ON c.customer_id = o.customer_id
ORDER BY c.customer_name;

select * from emp;

-- find all employee names and their manager names
select e1.emp_name as employee_name, e2.emp_name as manager_name 
from emp e1 left join emp e2 
on e1.manager_id = e2.emp_id ;

select e1.emp_name as employee_name, e2.emp_name as manager_name
from emp e1 left join emp e2
on e1.manager_id = e2.emp_id;

select e2.emp_name as employee_name, e1.emp_name as manager_name
from emp e2 right join emp e1
on e2.manager_id = e1.emp_id;

-- Find Employees Who Earn More Than Their Managers
select * from emp ;
select e1.emp_name as Employee_name, e1.salary as Employee_salary,
e2.emp_name as Manager_name, e2.salary as Manager_salary
from emp e1 join emp e2
on e1.manager_id = e2.emp_id 
where e1.salary > e1.salary;

select e1.emp_name as employee_name,e1.salary as employee_salary ,
e2.emp_name as manager_name,e2.salary as manager_salary
from emp e1 join emp e2
on e1.manager_id = e2.emp_id
where e1.salary > e2.salary;

-- Count the Number of Employees Under Each Manager
select e2.emp_name as manager_name, count(distinct e1.emp_id) as emplyees
from emp e1 join emp e2 
on e1.manager_id = e2.emp_id group by 1 ;

select e2.emp_name as manager_name, count(distinct e1.emp_id) as employees
from emp e1 join emp e2
on e1.manager_id = e2.emp_id
group by 1;

-- Find Managers with More Than 2 Employees
select e2.emp_name as manager_name, count(distinct e1.emp_id) as employee
from emp e1 join emp e2
on e1.manager_id = e2.emp_id group by 1 having count(distinct e1.emp_id) > 2 ;

select e2.emp_name as manager_name, count(distinct e1.emp_id) as employees
from emp e1 join emp e2
on e1.manager_id = e2.emp_id
group by 1
having count(distinct e1.emp_id)>2;

-- Find the total salary paid under each manager.

-- Find employees who report to a manager whose name starts with 'C'.

-- find managers with no employees under them

-- 05-MAR-25
-- 1.Find product categories where the average price of products is higher than ₹5000.
select * from sales ;
select category from sales where price > 500 ;
select category, avg(price) from sales group by 1 order by 1 ;

use retail ;
-- 2. Find salespeople who made sales in at least 3 different cities.
select salesperson, product_name, category, count(city) from sales group by salesperson, product_name, category order by count(city);
select * from sales group by salesperson having count(distinct city) >= 1 ; 

-- 3. Find the top 3 customers who placed the highest number of orders.
select c.customer_id, c.customer_name, o.quantity from customers c join orders o on c.customer_id = o.customer_id order by quantity desc;
select c.customer_id, c.customer_name, count(o.order_id) as total_orders 
from customers c join orders o on c.customer_id = o.customer_id
group by customer_id, customer_name 
order by total_orders desc limit 3 ;

-- 4. Find product names that contain exactly 5 characters.
select product_name from products where product_name like '_____' ; 
select product_name from products where length(product_name) = 5 ;

-- 5. Find customers who have placed at least one order AND whose name starts with 'A' or ends with 'n'.
select c.customer_id, c.customer_name, o.order_id from customers c join orders o 
on c.customer_id = o.customer_id 
where (customer_name like 'A%' or customer_name like'%n') ;

use retail ;
-- 6. Find employees (salespeople) who have the same city as another salesperson.
select * from sales ;
select distinct salesperson from sales ;
select distinct s1.salesperson, s1.city from sales s1 join sales s2 on s1.city = s2.city and s1.salesperson <> s2.salesperson 
order by s1.city, s1.salesperson ;

-- 6. Find employees (salespeople) who have the same city as another salesperson.
use megna ;
select distinct state from employees;
select first_name from employees where state = 'arizona' ;
select e1.first_name, e1.state from employees e1 join employees e2 on e1.city = e2.city ;
SELECT DISTINCT e1.first_name, e1.last_name, e1.state 
FROM employees e1 
JOIN employees e2 
ON e1.city = e2.city 
AND e1.employee_id <> e2.employee_id
where e1.state = 'Utah';

select distinct state from employees;

SELECT employee, city
FROM sales
WHERE city IN (
    SELECT city
    FROM sales
    GROUP BY city
    HAVING COUNT(DISTINCT salesperson) > 1
);

-- 7. Find products that have never been sold.

-- 8. Find cities where total revenue from sales exceeded ₹1,00,000, but only for cities with more than 5 sales transactions.

-- 9. Find the salesperson who has generated the highest total revenue.

-- 10. Find customers who have placed orders in at least two different months.

-- positions
select locate('SQL','This is a SQL class');
select locate('sql','This is a SQL class');

-- return the position where a substring starts -- instr

-- full name --> first_name last_name - extract firstname and last name

select reverse("hello");

select repeat('Hi ',3);

select ascii('@');
select char(65);

-- Date Functions -- mysql's date -> YYYY-MM-DD (2024-06-09)
-- HH:MM:SS - time

select date('2024-09-14'), date('09-14-2024');

select now(), -- current date and time
 curdate() ; -- current date

-- extract
select date(now()), date('2024-05-14 05:09:15'), time(now());
select day('2024-03-19'),
 month('2024-03-19'),
quarter('2024-03-19'),
 year('2024-03-19');
 
select hour(now()), minute(now()),second(now());

-- names
select dayname('2024-03-19'),
 monthname('2024-03-19');

-- add or subtract days or years or months to a date

select adddate('2025-01-18', interval 10 day);
select subdate('2025-01-18', interval 10 day);

-- to find difference between 2 dates in days

select datediff('2025-01-16','2025-01-10');

-- difference in years

SELECT YEAR('2025-01-16') - YEAR('2023-01-10');

-- date_format(date,format)
-- format - specifiers
-- %Y(full year - 4 digits - 2024)
-- %y year (2 digits - 24)
-- %M - full month name - January
-- %m - month number - 01
-- %b - abbv month name - Jan
-- %d - Day - 19
-- %W - Weekday name - Tuesday

select date_format('2024-09-19','%d-%M-%y');

-- display full date with day name
SELECT DATE_FORMAT('2024-03-05', '%W, %M %d, %Y') AS formatted_date;

select date_format('03-19-2024','%Y-%m-%d');
-- str_to date
select year(str_to_date('03-19-2024','%m-%d-%Y'));
-- identifies in what format is the str given and then converts to sql date format

