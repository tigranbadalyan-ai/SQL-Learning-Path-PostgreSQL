/* SECTION 7: JOINS, SUBQUERIES & CASE LOGIC
   Combining multiple tables, using aggregate filters on joins, 
   implementing business logic with CASE, and basic subqueries.
*/

-- 1. Simple LEFT JOIN
-- Joining products with categories to get descriptive names
SELECT  
    p.product_name,
    c.category_name, 
    p.unit_price 
FROM products p
LEFT JOIN categories c ON p.category_id = c.category_id
WHERE p.unit_price > 60 AND p.supplier_id != 11
ORDER BY p.unit_price DESC;

-- 2. Multi-table JOIN (Orders, Employees, Customers, Shippers)
-- Building a comprehensive order report with 3+ joins
SELECT 
    o.order_id,
    e.last_name AS employee_name,
    c.company_name AS customer_name,
    s.company_name AS shipper_name
FROM orders o 
JOIN employees e ON o.employee_id = e.employee_id
JOIN customers c ON o.customer_id = c.customer_id 
JOIN shippers s ON o.ship_via = s.shipper_id 
WHERE e.last_name NOT IN ('Buchanan', 'Fuller')
ORDER BY o.order_id 
LIMIT 5;

-- 3. Aggregation across Joins
-- Counting products in each category using LEFT JOIN to include empty categories
SELECT 
    c.category_name,
    COUNT(p.product_id) AS product_count 
FROM categories c
LEFT JOIN products p ON c.category_id = p.category_id
GROUP BY c.category_name
ORDER BY product_count DESC, c.category_name ASC;

-- 4. Conditional Business Logic with CASE
-- Analyzing delivery performance: On-time vs Delayed
SELECT 
    CASE
        WHEN (o.shipped_date - o.order_date) < 14 THEN 'On Time'
        ELSE 'Delayed'
    END AS delivery_status,
    COUNT(*) AS order_count
FROM orders o
WHERE o.shipped_date IS NOT NULL
GROUP BY delivery_status
ORDER BY order_count DESC;

-- 5. Subquery in WHERE clause
-- Finding products belonging to the very last order recorded
SELECT 
    p.product_name
FROM products p 
JOIN order_details od ON p.product_id = od.product_id
WHERE od.order_id = (SELECT MAX(order_id) FROM order_details)
ORDER BY p.product_name;

-- 6. Complex Join with Date Filtering and Aggregation
-- Identifying active customers with high-volume orders in a specific period
SELECT 
    c.company_name 
FROM customers c 
JOIN orders o ON c.customer_id = o.customer_id 
JOIN order_details od ON o.order_id = od.order_id
WHERE o.order_date BETWEEN '1996-09-01' AND '1996-11-30'
GROUP BY c.company_name 
HAVING SUM(od.quantity) > 250
ORDER BY c.company_name ASC;

-- 7. Advanced 4-Table Join with Distinct Count
-- Analysis of unique customers per category for a specific year
SELECT 
    c.category_name,
    COUNT(DISTINCT o.customer_id) AS unique_customers_count 
FROM categories c 
JOIN products p ON c.category_id = p.category_id
JOIN order_details od ON p.product_id = od.product_id
JOIN orders o ON od.order_id = o.order_id
JOIN customers cu ON cu.customer_id = o.customer_id 
WHERE (o.order_date BETWEEN '1997-01-01' AND '1997-12-31') AND cu.fax IS NOT NULL
GROUP BY c.category_name 
ORDER BY c.category_name ASC;