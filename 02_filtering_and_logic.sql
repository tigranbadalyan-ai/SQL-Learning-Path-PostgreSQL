/* SECTION 2: FILTERING DATA & LOGICAL OPERATORS
   Practice with WHERE clause, comparison operators (<, >, BETWEEN), 
   NULL handling, and Pattern Matching (LIKE).
*/

-- 1. Simple filtering by numeric value
-- Selecting products with a unit price less than 10
SELECT product_name
FROM products 
WHERE unit_price < 10;

-- 2. Using OR operator for multiple categories
-- Filtering products that belong to categories 1, 3, or 5
SELECT product_name, unit_price 
FROM products 
WHERE category_id = 1 OR category_id = 3 OR category_id = 5;

-- 3. Range filtering using BETWEEN
-- Finding products within the price range of 20 to 30
SELECT product_name 
FROM products 
WHERE unit_price BETWEEN 20 AND 30;

-- 4. Alternative range filtering using comparison operators
-- Achieving the same result as BETWEEN using >= and <=
SELECT product_name 
FROM products
WHERE unit_price >= 20 AND unit_price <= 30;

-- 5. Handling Missing Values (NULL)
-- Finding orders where the shipping region is not specified
SELECT order_id, customer_id 
FROM orders 
WHERE ship_region IS NULL;

-- 6. Filtering Non-NULL values
-- Retrieving orders that have a shipping region assigned
SELECT order_id, customer_id 
FROM orders 
WHERE ship_region IS NOT NULL;

-- 7. Filtering by exact string match
-- Looking for customers located in Spain
SELECT customer_id, company_name
FROM customers 
WHERE country = 'Spain';

-- 8. Combining filters for geographical data
-- Selecting orders shipped to North American neighbors (USA or Mexico)
SELECT order_id, order_date, shipped_date, ship_country
FROM orders 
WHERE ship_country = 'USA' OR ship_country = 'Mexico';

-- 9. Multi-condition filtering (Parentheses for clarity)
-- Finding a specific product within a specific price range
SELECT product_id, product_name, category_id
FROM products 
WHERE (unit_price BETWEEN 20 AND 30) AND product_name = 'Tofu';

-- 10. Pattern Matching with LIKE
-- Finding products where the name starts with 'G', contains 'c' later, 
-- and has one specific character at the end.
SELECT product_id, product_name, category_id
FROM products 
WHERE product_name LIKE 'G%c_';