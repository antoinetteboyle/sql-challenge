-- postgresql queries

-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees As e
JOIN salaries AS s ON
s.emp_no=e.emp_no;


-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE RIGHT(hire_date, 4) ='1986';


-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM departments As d
JOIN dept_manager AS dm ON
d.dept_no = dm.dept_no
JOIN employees As e ON
dm.emp_no=e.emp_no;




-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees As e
JOIN dept_manager As dm ON 
e.emp_no = dm.emp_no
JOIN departments As d ON
d.dept_no = dm.dept_no;


-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT e.first_name, e.last_name, e.sex
FROM employees As e
WHERE e.first_name = 'Hercules' and e.last_name LIKE 'B%';


-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees As e, departments As d
WHERE d.dept_name = 'Sales' AND e.emp_no IN
(
SELECT  de.emp_no
FROM dept_emp As de
WHERE de.dept_no IN
(
SELECT d.dept_no
FROM departments As d
WHERE d.dept_name = 'Sales'
));

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees As e, departments As d
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development' AND e.emp_no IN
(
SELECT  de.emp_no
FROM dept_emp As de
WHERE de.dept_no IN
(
SELECT d.dept_no
FROM departments As d
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development'
));


-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT e.last_name, COUNT(e.last_name) AS "Count of Last name"
FROM employees As e
GROUP BY e.last_name
ORDER BY  e.last_name DESC;
