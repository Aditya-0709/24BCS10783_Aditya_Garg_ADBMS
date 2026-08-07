/* Write a query to find out what percentage of the total revenue (sum of all orders) is contributed by American Cuisine. Round the final value to 2 decimal places */
SELECT ROUND(
    SUM(CASE WHEN cuisine = 'American' THEN price END) * 100 / SUM(price),
    2
) AS American_Revenue
FROM Orders;