-- List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT e.employee_number, e.last_name, e.first_name, e.gender, s.salary
FROM employees AS e 
JOIN salaries AS s 
ON s.employee_number = e.employee_number
ORDER BY 1;

-- List employees who were hired in 1986.

SELECT last_name, first_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name, 
-- and start and end employment dates.

SELECT dm.department_number, d.department_name, dm.employee_number, e.last_name, e.first_name
FROM dept_manager AS dm
JOIN departments AS d ON dm.department_number = d.department_number
JOIN employees AS e ON e.employee_number = dm.employee_number;

-- List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.

SELECT e.employee_number, e.last_name, e.first_name, d.department_name
FROM employees AS e
JOIN dept_emp AS de ON e.employee_number = de.employee_number
LEFT JOIN departments AS d ON d.department_number = de.department_number
ORDER BY 1;

-- List all employees whose first name is "Hercules" and last names begin with "B."

SELECT * FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- List all employees in the Sales department, 
-- including their employee number, last name, first name, and department name.

SELECT e.employee_number, e.last_name, e.first_name, d.department_name
FROM employees as e
JOIN dept_emp as dm ON e.employee_number = dm.employee_number
JOIN departments as d ON d.department_number = dm.department_number
WHERE d.department_name = 'Sales';

-- List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.

SELECT e.employee_number, e.last_name, e.first_name, d.department_name
FROM employees as e
JOIN dept_emp as dm ON e.employee_number = dm.employee_number
JOIN departments as d ON d.department_number = dm.department_number
WHERE d.department_name = 'Sales' OR d.department_name = 'Development';

-- In descending order, list the frequency count of employee last names
-- i.e., how many employees share each last name.

SELECT last_name, COUNT(last_name) AS "name_count"
FROM employees
GROUP BY last_name
ORDER BY 2 DESC;