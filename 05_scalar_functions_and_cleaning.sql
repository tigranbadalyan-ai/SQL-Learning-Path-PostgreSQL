/* SECTION 5: SCALAR FUNCTIONS & DATA CLEANING
   Practicing with String manipulation (CONCAT, SUBSTRING, POS), 
   Numeric rounding (CEILING, FLOOR, ROUND), and Null handling (COALESCE).
*/

-- 1. Handling NULL values with COALESCE
-- Selecting suppliers while treating NULL regions as empty strings to filter out 'Québec'
SELECT company_name
FROM suppliers s 
WHERE COALESCE(region, '') != 'Québec'
ORDER BY company_name ASC;

-- 2. String Concatenation
-- Combining category name and description into a single readable field
SELECT 
    category_id,
    CONCAT(category_name, ': ', description) AS category_full_info 
FROM categories;

-- 3. Numeric Rounding and Type Casting
-- Rounding prices to 1 decimal place for specific price ranges
SELECT 
    product_name,
    unit_price,
    ROUND(unit_price::numeric, 1) AS rounded_price 
FROM products
WHERE unit_price BETWEEN 16 AND 18
ORDER BY product_name ASC;

-- 4. String Trimming (LEFT and RIGHT)
-- Extracting the first and last 3 characters of category names
SELECT
    category_name,
    LEFT(category_name, 3) AS prefix,
    RIGHT(category_name, 3) AS suffix
FROM categories 
ORDER BY category_name;

-- 5. Using CEILING (Rounding up)
-- Rounding unit prices UP to the nearest integer
SELECT
    product_name, 
    unit_price,
    CEILING(unit_price) AS ceiling_price 
FROM products
WHERE unit_price BETWEEN 30 AND 31.5
ORDER BY product_name;

-- 6. String Length and Case Transformation
-- Measuring length and demonstrating LOWER/UPPER case conversions
SELECT 
    category_name,
    LENGTH(category_name) AS name_length,
    LOWER(category_name) AS lowercase_name,
    UPPER(category_name) AS uppercase_name
FROM categories 
ORDER BY category_name;

-- 7. Advanced String Positioning and Substrings
-- Extracting specific characters and finding positions of patterns
SELECT 
    category_name,
    SUBSTRING(category_name, 3, 1) AS third_character,
    STRPOS(category_name, 'c') AS position_of_c
FROM categories 
ORDER BY category_name;

-- 8. Using FLOOR (Rounding down)
-- Rounding unit prices DOWN to the nearest integer
SELECT 
    product_name, 
    unit_price,
    FLOOR(unit_price) AS floor_price 
FROM products 
WHERE unit_price BETWEEN 9 AND 10 
ORDER BY product_name ASC;