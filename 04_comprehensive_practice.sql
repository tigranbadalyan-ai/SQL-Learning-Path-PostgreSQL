/* SECTION 4: COMPREHENSIVE PRACTICE
   Consolidating knowledge: Complex filtering, String functions, 
   Aggregations with GROUP BY/HAVING, and Result limiting.
*/

-- 1. Complex filtering with multiple conditions
-- Finding expensive products from specific suppliers
SELECT product_id, product_name, unit_price 
FROM products 
WHERE (unit_price BETWEEN 30 AND 40) AND supplier_id IN (3, 5, 7)
ORDER BY unit_price DESC;

-- 2. Range filtering using comparison operators
SELECT product_name
FROM products 
WHERE unit_price >= 3 AND unit_price < 7;

-- 3. Working with String functions
-- Selecting products where the name is exactly 10 characters long
SELECT product_name 
FROM products 
WHERE CHARACTER_LENGTH(product_name) = 10;

-- 4. Global Market Analysis
-- Counting customers per country, sorted alphabetically
SELECT 
    country,
    COUNT(company_name) AS customer_count 
FROM customers 
GROUP BY country
ORDER BY country ASC;

-- 5. Supplier Inventory Analysis
-- Identifying suppliers with a wide product range (5+ products)
SELECT 
    supplier_id,
    COUNT(product_name) AS product_count
FROM products 
GROUP BY supplier_id 
HAVING COUNT(product_name) >= 5
ORDER BY product_count DESC;

-- 6. Specific category statistics
-- Finding the lowest price in Category 1
SELECT 
    MIN(unit_price) AS min_price 
FROM products 
WHERE category_id = 1;

-- 7. Calculating order totals and limiting results
-- Top 5 latest order details with calculated line totals
SELECT 
    order_id,
    product_id,
    (unit_price * quantity) AS line_total
FROM order_details 
ORDER BY order_id DESC
LIMIT 5;

-- 8. Single order deep-dive
-- Calculating the total sum for a specific order ID
SELECT 
    SUM(unit_price * quantity) AS total_order_sum
FROM order_details
WHERE order_id = 10425;

-- 9. Filtering grouped data by specific IDs
-- Finding the most expensive product for selected suppliers
SELECT 
    supplier_id,
    MAX(unit_price) AS max_price
FROM products 
WHERE supplier_id IN (1, 3, 5)
GROUP BY supplier_id
ORDER BY supplier_id;

-- 10. High-volume shipping destinations
-- Listing countries with more than 30 orders
SELECT 
    ship_country
FROM orders 
GROUP BY ship_country 
HAVING COUNT(ship_country) > 30
ORDER BY ship_country;

-- 11. Unique values retrieval
-- Getting a list of all unique countries we ship to
SELECT DISTINCT (ship_country)
FROM orders;