-- Data Engineering --

-- Use the information you have to create a table schema for each of the six CSV files. --
-- Remember to specify data types, primary keys, foreign keys, and other constraints. --
-- Import each CSV file into the corresponding SQL table. --

-- Drop Tables if Existing
DROP TABLE IF EXISTS Departments;
DROP TABLE IF EXISTS Dept_emp;
DROP TABLE IF EXISTS Dept_manager;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Salaries;
DROP TABLE IF EXISTS Titles;
CREATE TABLE "Departments" (
    "dept_no" VARCHAR(4)   NOT NULL PRIMARY KEY,
    "dept_name" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
    "dept_no"
    )       
);

CREATE TABLE "Dept_emp" (
    "emp_no" VARCHAR    NOT NULL,
    "dept_no" VARCHAR(4)    NOT NULL,
    "from_date" DATE    NOT NULL,
    "to_date" DATE  NOT NULL,
);

CREATE TABLE "Dept_manager" (
    "dept_no" VARCHAR(4)    NOT NULL,
    "emp_no" INT   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL
);

CREATE TABLE "Employees" (
    "emp_no" INT   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR(30)   NOT NULL,
    "last_name" VARCHAR(30)   NOT NULL,
    "gender" VARCHAR(1)   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Salaries" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL
);

CREATE TABLE "Titles" (
    "emp_no" INT   NOT NULL,
    "title" VARCHAR(30)   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL
);

ALTER TABLE "Dept_emp" ADD CONSTRAINT "fk_Dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Dept_emp" ADD CONSTRAINT "fk_Dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Dept_manager" ADD CONSTRAINT "fk_Dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Dept_manager" ADD CONSTRAINT "fk_Dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Titles" ADD CONSTRAINT "fk_Titles_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

-- Query * FROM Each Table Checking Data
SELECT * FROM Departments;
SELECT * FROM Dept_emp;
SELECT * FROM Dept_manager;
SELECT * FROM Employees;
SELECT * FROM Salaries;
SELECT * FROM Titles;