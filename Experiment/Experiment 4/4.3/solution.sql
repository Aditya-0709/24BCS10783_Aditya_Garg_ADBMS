-- 1.All orders with Customers Details: Get all of the orders table and also the details of respective customers if they exist. Use the customer and orders table.

-- 2.Products and Categories: Create a combined list of all products and all categories. Include all product names and all category names. Where there's a match, show both; otherwise, use NULLs.

-- 3.All category names with product details: display category_name, along with all product names and price from all the categories present in categories table.

SELECT  c.customer_name, o.*
FROM customers as c
JOIN orders as o 
ON c.customer_id=o.customer_id;

SELECT p.product_name, c.category_name
FROM categories as c 
JOIN products as p 
ON c.category_id=p.category_id;

SELECT c.category_name,p.product_name, p.price
FROM categories as c 
JOIN products as p 
ON c.category_id=p.category_id;