-- List the following details of each employee: employee number, last name, first name, sex and salary
SELECT employees.emp_no, 
		employees.last_name, 
		employees.first_name, 
		employees.sex, 
		salaries.salary 
		FROM employees
LEFT JOIN salaries ON employees.emp_no = salaries.emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986
SELECT first_name, 
		last_name, 
		hire_date 
		FROM employees
WHERE hire_date >= '1986-01-01' AND hire_date < '1987-01-01';

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name
SELECT department_manager.dept_no, 
		departments.dept_name, 
		department_manager.emp_no, 
		employees.last_name, 
		employees.first_name
		FROM department_manager
LEFT JOIN departments ON departments.dept_no = department_manager.dept_no
LEFT JOIN employees ON employees.emp_no = department_manager.emp_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name
SELECT employees.emp_no, 
		employees.last_name, 
		employees.first_name, 
		departments.dept_name
		FROM employees
LEFT JOIN department_employees ON department_employees.emp_no = employees.emp_no
LEFT JOIN departments ON departments.dept_no = department_employees.dept_no;


--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex FROM employees
WHERE first_name='Hercules' AND last_name LIKE 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name
SELECT department_employees.emp_no,
		employees.last_name,
		employees.first_name,
		departments.dept_name
		FROM department_employees
LEFT JOIN employees ON employees.emp_no = department_employees.emp_no
LEFT JOIN departments on departments.dept_no = department_employees.dept_no
WHERE dept_name = 'Sales';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT department_employees.emp_no,
		employees.last_name,
		employees.first_name,
		departments.dept_name
		FROM department_employees
LEFT JOIN employees ON employees.emp_no = department_employees.emp_no
LEFT JOIN departments on departments.dept_no = department_employees.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development'

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name
--Count source: https://www.w3schools.com/sql/sql_count_avg_sum.asp
SELECT last_name, COUNT(last_name) FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;
