-- Write a delete query to delete John Doe's details from Customers table and notice the changes in the Orders table


DELETE FROM Customers
WHERE customer_name = 'John Doe';
SELECT * FROM Orders;