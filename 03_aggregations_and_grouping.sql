/* SECTION 3: AGGREGATIONS AND GROUPING
   Practice with Aggregate Functions (COUNT, SUM), GROUP BY clause, 
   Filtering grouped data with HAVING, and Advanced Sorting.
*/

-- 1. Unique ID retrieval using GROUP BY
-- Getting distinct product IDs from order details and sorting them in descending order
SELECT 
    product_id
FROM order_details
GROUP BY product_id 
ORDER BY product_id DESC;

-- 2. Aggregation with Filtering (WHERE + GROUP BY)
-- Counting orders for countries starting with 'S', sorted by popularity
SELECT
    ship_country,
    COUNT(order_id) AS orders_count
FROM orders
WHERE ship_country LIKE 'S%'
GROUP BY ship_country
ORDER BY orders_count DESC;

-- 3. Filtering Grouped Data using HAVING
-- Identifying major markets: countries with more than 25 total orders
SELECT 
    ship_country,
    COUNT(order_id) AS orders_count
FROM orders
GROUP BY ship_country 
HAVING COUNT(order_id) > 25
ORDER BY ship_country ASC;

-- 4. Summing quantities with HAVING
-- Finding low-volume products: total quantity sold is 100 or less
SELECT 
    product_id, 
    SUM(quantity) AS total_quantity
FROM order_details 
GROUP BY product_id 
HAVING SUM(quantity) <= 100;

-- 5. Multi-level Sorting and BETWEEN in HAVING
-- Analyzing cities with a specific range of order volume (5 to 6 orders)
-- Sorted first by volume (desc) and then alphabetically by city name
SELECT
    ship_city,
    COUNT(order_id) AS orders_count
FROM orders 
GROUP BY ship_city 
HAVING COUNT(order_id) BETWEEN 5 AND 6
ORDER BY orders_count DESC, ship_city ASC;

-- 6. Performance tracking by Employee
-- Ranking employees by the total number of orders they processed
SELECT 
    employee_id,
    COUNT(order_id) AS processed_orders 
FROM orders
GROUP BY employee_id 
ORDER BY processed_orders DESC;
