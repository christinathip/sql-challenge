-- Data Analysis --

-- List the following details of each employee: employee number, last name, first name, gender, and salary. --
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM salaries AS s
INNER JOIN employees AS e 
ON e.emp_no = s.emp_no;

-- List employees who were hired in 1986. --
SELECT * FROM employees
WHERE hire_date LIKE '1986%';

-- List the manager of each department with the following information: --
-- department number, department name, the manager's employee number, last name, first name, and start and end employment dates. --
SELECT d.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name, m.from_date, m.to_date
FROM departments AS d
INNER JOIN dept_manager AS m 
ON m.dept_no = d.dept_no
JOIN employees AS e 
ON e.emp_no = m.emp_no;

-- List the department of each employee with the following information: --
-- employee number, last name, first name, and department name. --
SELECT e.emp_no, e.last_name, e.first_name, dp.dept_name
FROM employees AS e
INNER JOIN dept_emp AS d 
ON e.emp_no = d.emp_no
INNER JOIN departments AS dp 
ON dp.dept_no = d.dept_no;

-- List all employees whose first name is "Hercules" and last names begin with "B." --
SELECT first_name, last_name
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- List all employees in the Sales department, including their employee number, last name, first name, and department name. --
SELECT e.emp_no, e.last_name, e.first_name, dp.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de 
ON e.emp_no = de.emp_no
INNER JOIN departments AS dp 
ON dp.dept_no = de.dept_no
WHERE dp.dept_name LIKE 'Sales';

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name. --
SELECT e.emp_no, e.last_name, e.first_name, dp.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de 
ON e.emp_no = de.emp_no
INNER JOIN departments AS dp 
ON dp.dept_no = de.dept_no
WHERE dp.dept_name LIKE 'Development'
OR dp.dept_name LIKE 'Sales';

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name. --
SELECT last_name, COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;
