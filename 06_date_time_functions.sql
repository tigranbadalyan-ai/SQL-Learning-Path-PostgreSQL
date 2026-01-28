/* SECTION 6: DATE AND TIME MANIPULATION
   Practicing with EXTRACT (Year, Month, Day, DOW, Quarter, Week), 
   TO_CHAR for date formatting, and Date arithmetic (Age calculation).
*/

-- 1. Extracting Year from a date
-- Identifying the birth year of employees
SELECT last_name, EXTRACT(YEAR FROM birth_date) AS birth_year
FROM employees 
ORDER BY last_name;

-- 2. Extracting Month
SELECT 
    last_name,
    EXTRACT(MONTH FROM birth_date) AS birth_month
FROM employees
ORDER BY last_name;

-- 3. Formatting Date to String (Month Name)
-- Displaying the full name of the month when the employee was hired
SELECT 
    last_name,
    TO_CHAR(hire_date, 'Month') AS hire_month_name
FROM employees
ORDER BY last_name;

-- 4. Extracting Day of the month
SELECT 
    last_name,
    EXTRACT(DAY FROM birth_date) AS birth_day
FROM employees 
ORDER BY last_name ASC;

-- 5. Date Arithmetic: Calculating Age at Hire
-- Calculating approximate age by subtracting birth date from hire date
SELECT 
    last_name,
    (hire_date - birth_date) / 365 AS age_at_hire
FROM employees 
ORDER BY last_name;

-- 6. Complex String Formatting with Date Parts
-- Creating a descriptive sentence using CONCAT and EXTRACT
SELECT 
    last_name,
    CONCAT(first_name, ' ', last_name, ' was hired in ', EXTRACT(YEAR FROM hire_date)) AS hire_description
FROM employees
ORDER BY last_name;

-- 7. Extracting Day of Week (DOW)
-- Getting the numeric representation of the day of the week (0-6)
SELECT 
    last_name,
    EXTRACT(DOW FROM birth_date) AS birth_day_of_week
FROM employees 
ORDER BY last_name;

-- 8. Formatting Date to Day Name
-- Displaying the specific day of the week (e.g., 'Monday')
SELECT 
    last_name,
    TO_CHAR(birth_date, 'Day') AS birth_day_name
FROM employees 
ORDER BY last_name;

-- 9. Extracting Quarter
-- Identifying which fiscal quarter the employee joined
SELECT
    last_name,
    EXTRACT(QUARTER FROM hire_date) AS hire_quarter
FROM employees 
ORDER BY last_name;

-- 10. Extracting Week Number
-- Getting the ISO week number of the hire date
SELECT 
    last_name,
    EXTRACT(WEEK FROM hire_date) AS hire_week_number
FROM employees
ORDER BY last_name;