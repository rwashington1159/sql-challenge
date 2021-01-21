
CREATE TABLE department
(
	dept_no VARCHAR(30),
	name VARCHAR(30)
);

SELECT * FROM department;

CREATE TABLE dept_emp
( 
	emp_no INT,
	dept_no VARCHAR
);

SELECT * FROM dept_emp;


CREATE TABLE dept_manager
(
	dept_no VARCHAR,
	emp_no INT
);

SELECT * FROM dept_manager;

CREATE TABLE employees
(
	emp_no INT,
	emp_title_id VARCHAR,
	birth_date VARCHAR,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR,
	hire_date VARCHAR
);

SELECT * FROM employees;

CREATE TABLE salaries
(
	emp_no INT,
	salary INT
);

SELECT * FROM salaries;

CREATE TABLE titles
(
	title_id VARCHAR,
	title VARCHAR
);

SELECT * FROM titles;

#1. List of employees by : employee number, last name, first name, sex, and salary
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees, salaries
WHERE employees.emp_no = salaries.emp_no; 

#2. List of first name, last name, and hire date of employees hired in 1986.
SELECT first_name, last_name, hire_date 
FROM employees
WHERE date_part('1986', (SELECT current_timestamp));

#3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT employees.last_name, employees.first_name, dept_manager.dept_no, .dept_name
FROM dept_manager, employees
WHERE employees.emp_no = manager.emp_no;

#4 Employee number, last name, first name, and department name
SELECT employees.emp_no, employees.last_name, employees.first_name, dept_emp.emp_no, departments.dept_no
FROM employees, dept_emp, departments
WHERE employees.emp_no = dept_emp.emp_no; 

#5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' and last_name LIKE '%b';

#6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

#7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

#8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, count(*)
FROM employees
GROUP BY last_name;

