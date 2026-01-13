/* SECTION 1: DATA RETRIEVAL BASICS
   In this section, I practice basic SELECT statements, column aliasing, 
   type casting, and simple calculations.
*/

-- 1. Simple selection from the 'orders' table
-- Retrieving essential order details for tracking
SELECT 
    order_id,
    customer_id,
    order_date,   
    ship_city   
FROM orders;

-- 2. Using Column Aliases (AS)
-- Renaming columns for better readability in the final output
SELECT 
    product_name AS product_title, 
    category_id AS category_id,
    unit_price AS price_per_unit
FROM products;

-- 3. Selecting personal data from employees
SELECT 
    last_name,
    first_name,
    birth_date,
    hire_date
FROM employees;

-- 4. Formatting output for logistics/shipping data
SELECT 
    company_name AS shipping_company, 
    phone AS contact_number
FROM shippers;

-- 5. Arithmetic operations and Type Casting
-- Calculating total amount (price * quantity)
-- Rounding the result to 3 decimal places and casting to numeric for precision
SELECT 
    product_id,
    ROUND((unit_price * quantity)::numeric, 3) AS total_amount
FROM order_details;

-- 6. Supplier information retrieval
SELECT 
    company_name AS supplier_name,
    address AS supplier_address
FROM suppliers;