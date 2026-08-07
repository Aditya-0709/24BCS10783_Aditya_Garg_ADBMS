-- 1.Employee and Manager Names: Display a list of employee names along with their manager's names. Use the 'employees' table provided.

-- 2.Every Possible Combination: Show every possible combination of 'customer_name' from the 'customers' table and 'product_name' from the 'products' table.

SELECT e.employee_name AS Employee , ee.employee_name AS Manager FROM employees as e
left JOIN employees as ee
ON e.manager_id=ee.employee_id;

SELECT c.customer_name,p.product_name FROM customers c 
CROSS JOIN
products p;