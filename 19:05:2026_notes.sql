-- 19/05/2026, BASICS OF SQL
-- MySQL Server : a database system to store and manage data
-- MySQL workbench : its a tool/interface to interact with DB
-- user communicates with server using workbench

-- SQL : Structured Query Language
-- Schema : it is a way to org tables(in rows&cols) and objects inside dB, Ex: tables, views, functions, procedures

-- TYPES OF SQL COMMANDS
-- DDL - data defining lang: to define structure, Ex: CREATE, ALTER, DROP
-- DML - data modifying lang: to work with data, Ex: INSERT, UPDATE, DELETE
-- DQL - data querying lang:used to fetch data, EX: SELECT
-- DCL - data controlling lang: permissions, EX: GRANT, REVOKE
-- TCL - trxn controlling lang: to manage transactions,  EX: COMMIT, ROLLBACK, SAVEPOINT

-- =====================================================
-- 1. DDL COMMANDS
-- DDL = Data Definition Language
-- Used to create / change / delete database objects
-- Examples: CREATE, ALTER, DROP, TRUNCATE
-- =====================================================

-- Create a new database
CREATE DATABASE company_db;

-- Select the database to use
USE company_db;

-- Create a department table with simple simple columns only. 
CREATE TABLE departments (
	dept_id INT,
    dept_name VARCHAR(50)
);

-- create a employees table with simple columns only.
CREATE TABLE employees (
	emp_id INT,
    emp_name VARCHAR(100),
    salary DECIMAL(10,2),
    dept_id INT
);

-- Check the tables structure 
DESC departments;
DESC employees;

-- =====================================================
-- 2. DML COMMANDS
-- DML = Data Manipulation Language
-- Used to insert, update, delete data inside tables
-- Examples: INSERT, UPDATE, DELETE
-- =====================================================

-- Insert values into departments table
INSERT INTO departments(dept_id, dept_name)
VALUES (1, 'IT');
INSERT INTO departments(dept_id, dept_name)
VALUES (2, 'HR');
INSERT INTO departments(dept_id, dept_name)
VALUES (3, 'Finance');
INSERT INTO departments(dept_id, dept_name)
VALUES (4, 'Help Desk');

-- insert values into employees table
INSERT INTO employees (emp_id, emp_name, salary, dept_id)
VALUES (101, 'sara', 60000.00, 1);
INSERT INTO employees (emp_id, emp_name, salary, dept_id)
VALUES (102, 'abhi', 40000.18, 4);
INSERT INTO employees (emp_id, emp_name, salary, dept_id)
VALUES (103, 'max', 85000.00, 2);
INSERT INTO employees (emp_id, emp_name, salary, dept_id)
VALUES (104, 'Rio', 30000.00, 3);
INSERT INTO employees (emp_id, emp_name, salary, dept_id)
VALUES (105, 'Leo', 58000.00, 1);

-- to see the inserted values, use select command
SELECT * FROM departments;
SELECT * FROM employees;

-- update the salary of one employee
UPDATE employees
SET salary = 65000.00
WHERE emp_id = 101
# used limit to avoid the error Error Code: 1175: 
#You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column
LIMIT 1; 

-- Add a new column to employees table
ALTER TABLE employees
ADD Email VARCHAR(250);

UPDATE employees
SET Email = 'sara@exp.com'
WHERE emp_id = 101
lIMIT 1;

UPDATE employees
SET Email = 'abhi@exp.com'
WHERE emp_id = 102
lIMIT 1;

UPDATE employees
SET Email = 'max@exp.com'
WHERE emp_id = 103
lIMIT 1;

UPDATE employees
SET Email = 'rio@exp.com'
WHERE emp_id = 104
lIMIT 1;

UPDATE employees
SET Email = 'leo@exp.com'
WHERE emp_id = 105
lIMIT 1;

-- =====================================================
-- SELECT COMMAND :  used to read data
-- =====================================================

-- show all data from both the tables
SELECT * FROM departments;
SELECT * FROM employees;

-- show only selected columns from table
SELECT emp_name, salary FROM employees;

-- show selected columns from employees with a specific dept_id
SELECT emp_name, Email FROM employees
WHERE dept_id = 1;

-- Sort employees by salary from high to low
SELECT *
FROM employees
ORDER BY salary DESC;


-- Constraints: rules applied on table columns to ensure data accuracy and integrity. 
-- Ex: UNIQUE, NOT NULL, PRIMARY KEY, FORIEGN KEY, CHECK, DEFAULT
-- =====================================================
--  NOT NULL: Column cannot have null values
-- UNIQUE CONSTRAINTS : all values of this column must be unique
-- Use new table: persons
-- =====================================================

CREATE TABLE persons (
    person_id INT UNIQUE,
    person_name VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    age INT
);

INSERT INTO persons
VALUES (1, 'Ravi', 'ravi@example.com', 25);
INSERT INTO persons
VALUES (2, 'Sneha', 'sneha@example.com', 28);
-- this below command will not exec because person_name can't be NULL
INSERT INTO persons
VALUES (3, NULL, 'test@example.com', 30);
-- This will NOT execute because person_id must be unique
INSERT INTO persons
VALUES (2, 'Arjun', 'arjun@example.com', 32);

SELECT * FROM persons;

-- =====================================================
-- CHECK: used to restrict invalid values
-- DEFAULT: gives automatic value if no value is provided
-- =====================================================

DROP TABLE IF EXISTS persons;


CREATE TABLE persons (
    person_id INT,
    person_name VARCHAR(50) NOT NULL,
	-- If country is not provided, default value becomes India
    country VARCHAR(50) DEFAULT 'India',
    -- age must be 18 or above
    age INT CHECK (age >= 18)
);

-- country is not given, so DEFAULT value 'India' is used
INSERT INTO persons (person_id, person_name, age)
VALUES (1, 'Ravi', 25);
INSERT INTO persons
VALUES (2, 'Sneha', 'USA', 30);
-- country automatically becomes India
INSERT INTO persons (person_id, person_name, age)
VALUES (3, 'Arjun', 40);
-- The below will not exec, age must be >= 18 because of CHECK constraint
INSERT INTO persons
VALUES (4, 'Kiran', 'India', 15);
-- The below will not be exec, person_name cannot be NULL because of NOT NULL
INSERT INTO persons
VALUES (5, NULL, 'India', 28);
-- view data
SELECT * FROM persons;

-- =====================================================
-- PRIMARY KEY: uniquely identifies each row in the table
-- FOREIGN KEY: links one table to the other
-- Use new table: orders
-- parent(Referenced Table) - with PK
-- chicld(referencing Table) - with FK
-- =====================================================

-- Drop old persons table and recreate with primary key
DROP TABLE persons;

CREATE TABLE persons (
#PRIMARY KEY already means UNIQUE + NOT NULL, So UNIQUE on person_id is extra, but added here for learning.
    person_id INT PRIMARY KEY UNIQUE,  
    person_name VARCHAR(50) NOT NULL,
    email VARCHAR(100)
);

-- orders table depends on persons table (Child table)
-- person_id in orders refers to person_id in persons
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_name VARCHAR(50),
    person_id INT,

    FOREIGN KEY (person_id) REFERENCES persons(person_id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
);

-- Insert data into parent(persons) table
INSERT INTO persons
VALUES (1, 'Ravi', 'ravi@example.com');
INSERT INTO persons
VALUES (2, 'Sneha', 'sneha@example.com');
INSERT INTO persons
VALUES (3, 'Arjun', 'arjun@example.com');
-- The below will NOT execute because person_id must be unique
INSERT INTO persons
VALUES (1, 'Duplicate Ravi', 'duplicate@example.com');

-- Insert data into child(orders) table
INSERT INTO orders
VALUES (101, 'Laptop', 1);
INSERT INTO orders
VALUES (102, 'Phone', 2);
INSERT INTO orders
VALUES (103, 'Tablet', 1);
INSERT INTO orders
VALUES (104, 'Monitor', 3);
-- The below will NOT execute because person_id 5 does not exist in persons table
INSERT INTO orders
VALUES (105, 'Keyboard', 5);
-- The below will NOT execute because order_id must be unique
INSERT INTO orders
VALUES (101, 'Mouse', 2);

-- View Data
SELECT * FROM persons;
SELECT * FROM orders;

-- Ravi (person_id = 1) has orders
SELECT * FROM orders WHERE person_id = 1;

-- =====================================================
-- RESTRICT : You CANNOT delete parent if child exists
-- =====================================================

-- Try deleting Ravi, this will not work because child table has details with the same person_id.
DELETE FROM persons
WHERE person_id = 1;

-- for that, we have to delete ravi's details from orders table first and then delete from persons table.
DELETE FROM orders
WHERE person_id = 1;
-- Now delete parent
DELETE FROM persons
WHERE person_id = 1;

SELECT * FROM persons; # ravi's info is deleted. 

-- =====================================================
-- CASCADE : If parent changes → child automatically updates
-- =====================================================

-- Before update
SELECT * FROM persons;
SELECT * FROM orders;

-- sneha's person_id changes from 2 -> 10, orders table automatically gets updated. 
UPDATE persons
SET person_id = 10
WHERE person_id = 2;

SELECT * FROM orders; # we can see that sneha's id changed to 10 even in orders table. 

-- =====================================================
-- DELETE, TRUNCATE, DROP 
-- using the employees table
-- =====================================================

-- Delete: Removes selected rows from the table, can use WHERE, deletes row by row, 
-- can be rolledback, table structure remains
DELETE FROM employees
WHERE emp_id = 102
LIMIT 1;

-- TRUNCATE removes all rows quickly, no WHERE clause, very fast, no rollback, resets identity, Table structure remains
TRUNCATE TABLE employees;

-- DROP removes the full table, removes table (structure, data, constraints), no rollback, table no longer exist.
DROP TABLE employees;

-- This will NOT execute because employees table is already dropped
SELECT * FROM employees;


-- =====================================================
-- OTHER INFO FROM CLASS
-- Information Schema: Meta data - data about data : describes structure, properties, info about the actual data
-- we use multiple tables to ensure normalization and maintain granularity.
-- =====================================================
















    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
