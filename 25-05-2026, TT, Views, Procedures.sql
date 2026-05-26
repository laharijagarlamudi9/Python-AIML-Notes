-- 25-05-2026 | Temporary Tables, Views, and Stored Procedures

-- -----------------------------------------------------------------------
-- TEMPORARY TABLES : A Temporary Table is a table that exists only for the current session.
-- That means: You create it, You use it, Once MySQL closes, it disappears automatically
-- Think of it like: “A rough notebook page used only while solving a problem.”
-- -----------------------------------------------------------------------
-- We use temporary tables when:
		-- Breaking large queries into smaller steps
		-- Storing intermediate results
		-- Avoiding repeated calculations
		-- Making queries easier to understand

-- Basic syntax: 
-- CREATE TEMPORARY TABLE table_name AS
-- SELECT ...

USE sakila;

-- Example: Store Top Customers Temporarily
-- Remove old temp table if already exists
DROP TEMPORARY TABLE IF EXISTS temp_top_customers;

-- Create temporary table
CREATE TEMPORARY TABLE temp_top_customers AS

SELECT
    customer_id,
    first_name,
    last_name
FROM customer
LIMIT 5;

-- View data
SELECT * FROM temp_top_customers;


-- Example: Temporary Table with Film Data
DROP TEMPORARY TABLE IF EXISTS temp_action_movies;

CREATE TEMPORARY TABLE temp_action_movies AS

SELECT
    f.film_id,
    f.title,
    f.rental_rate
FROM film f
WHERE f.rating = 'PG';

-- Check contents
SELECT * FROM temp_action_movies;

-- Important Points About Temporary Tables
-- Feature										Explanation
-- Exists temporarily						Removed automatically
-- Visible only to your session				Other users cannot see it
-- Faster for repeated use					Avoids repeating queries
-- Useful for large logic					Makes queries simpler


-- -----------------------------------------------------------------------
-- VIEWS: A View is a saved SQL query. It behaves like a virtual table.
-- But: It does NOT store actual data, It stores only the query definition
-- Think of it like: “A shortcut for a complex query.”
-- -----------------------------------------------------------------------
-- Views help:
		-- Simplify complex joins
		-- Reuse queries
		-- Hide sensitive columns
		-- Make reporting easier
-- Basic Syntax :
-- CREATE VIEW view_name AS
-- SELECT ...


-- Example: Active Customers View
-- Remove old view
DROP VIEW IF EXISTS active_customers_view;

-- Create view
CREATE VIEW active_customers_view AS

SELECT
    customer_id,
    first_name,
    last_name,
    email
FROM customer
WHERE active = 1;

-- Use the view
SELECT * FROM active_customers_view;
-- Instead of writing:
-- SELECT customer_id, first_name... FROM customer WHERE active = 1;
-- again and again,we can simply do: SELECT * FROM active_customers_view;


-- Example : Join Multiple Tables Inside View
DROP VIEW IF EXISTS customer_payment_view;

CREATE VIEW customer_payment_view AS

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(p.amount) AS total_paid
FROM customer c

JOIN payment p
ON c.customer_id = p.customer_id

GROUP BY c.customer_id,
         c.first_name,
         c.last_name;

-- Use the view
SELECT * FROM customer_payment_view;
-- Without view: You must write joins every time.
-- With view: You simply query the saved view.

-- Important Notes About Views
-- Feature							Explanation
-- Virtual table				Stores query only
-- Reusable						Use again anytime
-- Simplifies joins				Cleaner queries
-- Security						Hide sensitive data
-- No duplicate storage			Saves space


-- -----------------------------------------------------------------------
-- STORED PROCEDURES:  A Stored Procedure is a saved block of SQL code.
-- You write it once and call it whenever needed.
-- Think of it like: “A reusable SQL program.”
-- -----------------------------------------------------------------------
-- They help:
		-- Reuse logic
		-- Reduce repeated code
		-- Improve organization
		-- Accept parameters like functions
-- Basic Structure 
-- DELIMITER $$
-- CREATE PROCEDURE procedure_name()
-- BEGIN
--     SQL statements
-- END $$
-- DELIMITER ;

-- Why DELIMITER: Normally MySQL ends commands using: ';'
-- But procedures contain many semicolons internally.So we temporarily change delimiter.


-- Example : Simple Procedure
DROP PROCEDURE IF EXISTS get_movies;

DELIMITER $$

CREATE PROCEDURE get_movies()
BEGIN

    SELECT
        film_id,
        title,
        rating
    FROM film
    LIMIT 5;

END $$

DELIMITER ;
# Call the Procedure
CALL get_movies();

-- Example : Procedure with INPUT Parameter
-- What is IN parameter: Value goes INTO procedure.
DROP PROCEDURE IF EXISTS get_customer;

DELIMITER $$

CREATE PROCEDURE get_customer(IN cust_id INT)
BEGIN

    SELECT
        customer_id,
        first_name,
        last_name
    FROM customer
    WHERE customer_id = cust_id;

END $$

DELIMITER ;
# Call it
CALL get_customer(10);


-- Example : OUTPUT Parameter : Procedure returns a value outside.
DROP PROCEDURE IF EXISTS total_movies;

DELIMITER $$

CREATE PROCEDURE total_movies(OUT total INT)
BEGIN

    SELECT COUNT(*)
    INTO total
    FROM film;

END $$

DELIMITER ;
# Call Procedure
CALL total_movies(@movie_count);
SELECT @movie_count;


-- Example : INOUT Parameter
-- INOUT means: Send value in, Procedure modifies it, Returns updated value
DROP PROCEDURE IF EXISTS increase_number;

DELIMITER $$

CREATE PROCEDURE increase_number(INOUT num INT)
BEGIN

    SET num = num + 100;

END $$

DELIMITER ;
# call it
SET @value = 50;
CALL increase_number(@value);
SELECT @value;


-- DYNAMIC SQL IN STORED PROCEDURES: SQL query is built during runtime.
-- Instead of fixed query: SELECT * FROM customer;
-- You create query as text/string and execute it.
-- Why use Dynamic SQL?
		-- Table name changes
		-- Conditions change
		-- Column names vary

-- Important Commands
-- | Command            | Purpose       |
-- | ------------------ | ------------- |
-- | PREPARE            | Prepares SQL  |
-- | EXECUTE            | Runs SQL      |
-- | DEALLOCATE PREPARE | Cleans memory |


-- Example : Basic Dynamic SQL
DROP PROCEDURE IF EXISTS dynamic_movies;

DELIMITER $$

CREATE PROCEDURE dynamic_movies()
BEGIN

    -- Store query inside variable
    SET @sql_query =
    'SELECT title, rental_rate FROM film LIMIT 5';

    -- Prepare query
    PREPARE stmt FROM @sql_query;

    -- Execute query
    EXECUTE stmt;

    -- Remove prepared statement
    DEALLOCATE PREPARE stmt;

END $$

DELIMITER ;
CALL dynamic_movies();


-- Example : Dynamic Table Name
DROP PROCEDURE IF EXISTS dynamic_table_fetch;

DELIMITER $$

CREATE PROCEDURE dynamic_table_fetch(IN table_name VARCHAR(50))
BEGIN

    SET @sql_query =
    CONCAT('SELECT * FROM ', table_name, ' LIMIT 5');

    PREPARE stmt FROM @sql_query;

    EXECUTE stmt;

    DEALLOCATE PREPARE stmt;

END $$

DELIMITER ;
# call it
CALL dynamic_table_fetch('customer');
CALL dynamic_table_fetch('film');


-- Summary
-- | Topic            | Meaning                    |
-- | ---------------- | -------------------------- |
-- | Temporary Table  | Temporary storage table    |
-- | View             | Saved query                |
-- | Stored Procedure | Reusable SQL program       |
-- | IN parameter     | Input value                |
-- | OUT parameter    | Return value               |
-- | INOUT parameter  | Both input and output      |
-- | Dynamic SQL      | Query built during runtime |





