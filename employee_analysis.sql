CREATE TYPE sex AS ENUM('M', 'F');

CREATE TABLE employees (emp_no INT PRIMARY KEY,
birth_date DATE, first_name VARCHAR (14),
last_name VARCHAR (16), gender sex, hire_date DATE);
SELECT * FROM employees

CREATE TABLE dept_manager (dept_no VARCHAR (4),
emp_no INT, from_date DATE, to_date DATE);
SELECT * FROM dept_manager;

CREATE TABLE departments( dept_no VARCHAR (4) PRIMARY KEY, dept_name VARCHAR (40));
SELECT * FROM departments;

CREATE TABLE dept_employee(emp_no INT, dept_no VARCHAR (4),
from_date DATE, to_date DATE);
SELECT * FROM dept_employee;

CREATE TABLE salaries(emp_no INT, salary INT, from_date DATE, 
to_date DATE);
SELECT * FROM salaries

CREATE TABLE titles(emp_no INT, title  VARCHAR (50), 
from_date DATE, to_date DATE);
SELECT * FROM titles

SELECT * FROM employees
SELECT * FROM dept_manager;
SELECT * FROM departments;
SELECT * FROM dept_employee;
SELECT * FROM salaries;
SELECT * FROM titles;

---EX.1: RETRIEVE THE FIRST AND LAST NAME OF ALL EMPLOYEES
SELECT first_name, last_name FROM employees;

--EX.2 FIND THE DEPARTMENT NUMBER AND NAMES OF ALL EMPLOYEES
SELECT e.first_name, e.last_name, dm.dept_no, d.dept_name FROM employees as e
JOIN dept_employee as dm
ON e.emp_no = dm.emp_no
JOIN departments AS d 
ON  d.dept_no = dm.dept_no;

--EX. 3: GET THE TOTAL NUMBER OF EMPLOYEE
SELECT COUNT(emp_no) AS number_of_employee FROM employees;

--EX.4: FIND THE AVERAGE SALARY OF ALL EMPLOYEE
SELECT SUM(salary) AS total_salary, 
AVG(salary) AS average_salary FROM salaries;

-- EX.5: RETRIEVE THE BIRTH DATE ANND HIRE DATE OF EMPLOYEE WITH NO 10003
SELECT emp_no, birth_date, hire_date FROM employees 
WHERE emp_no = 10003;

--EX.6: FIND THE TITLES OF ALL EMPLOYEES
SELECT e.first_name, e.last_name, t.title FROM employees AS e
JOIN titles AS t ON
e.emp_no = t.emp_no; 

--EX.7: GET THE TOTAL NUMBER OF DEPARTMENTS
SELECT COUNT (dept_no) AS total_department FROM departments;

--EX.8:RETRIEVE THE DEPT. NO AND NAME WHERE EMPLOYEE WITH EMP_NO 10004 WORKS
SELECT de.emp_no, de.dept_no, d.dept_name FROM dept_employee AS de 
JOIN departments AS d ON
d.dept_no = de.dept_no
WHERE de.emp_no = 10004;

--EX. 9:FIND THE GENDER OF EMPLOYEE WITH NUMBER 10007
SELECT emp_no, gender FROM employees 
WHERE emp_no = 10007;

--EX 10: RETRIEVE THE NAMES OF ALL MANAGER ALONG WITH THEIR DEPARTMENT
SELECT e.first_name, e.last_name, dm.dept_no, d.dept_name FROM employees AS e
JOIN dept_manager AS dm ON
e.emp_no = dm.emp_no
JOIN departments AS d ON
dm.dept_no = d.dept_no;

--EX 11: FIND THE DEPARTMENT WITH HIGHEST NUMBER OF EMPLOYEE
SELECT COUNT(de.emp_no), de.dept_no, d.dept_name FROM dept_employee AS de 
JOIN departments AS d ON
d.dept_no = de.dept_no
GROUP BY de.dept_no, d.dept_name
ORDER BY COUNT(de.emp_no) LIMIT 1;

/*EX.12: RETRIEVE THE EMPLOYEE NUMBER, FIRST NAME, LAST NAME AND TITLE OF EMPLOYEES WHOSE HIRE DATE 
IS BETWEEN '2005-01-01' AND '2006-01-01'*/
SELECT e.emp_no, e.first_name, e.last_name, t.title FROM employees AS e
JOIN titles AS t ON 
e.emp_no = t.emp_no 
WHERE e.hire_date BETWEEN '2005-01-01' AND '2006-01-01';

/*EX.13:RETRIEVE THE EMPLOYEE NUMBER, FIRST NAME, LAST NAME AND SALARY OF EMPLOYEES HIRED
BEFORE 2005*/
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name, s.salary
FROM employees as e
JOIN dept_employee as dm
ON e.emp_no = dm.emp_no
JOIN departments AS d 
ON  d.dept_no = dm.dept_no
JOIN salaries AS s ON
e.emp_no = s.emp_no
WHERE EXTRACT(YEAR from hire_date) < 2005;

/*EX.14: RETRIEVE THE EMPLOYEE NUMBER, FIRST NAME, LAST NAME AND DEPARTMENT NAME OF EMPLOYEES
WHO ARE CURRENTLY WORKING IN THE FINANCE DEPARTMENT*/
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name FROM employees AS e
JOIN dept_employee AS de
ON e.emp_no = de.emp_no
JOIN departments AS d ON
d.dept_no = de.dept_no
WHERE dept_name = 'Finance';

--EX.15:GET THE TOTAL NUMBER OF EMPLOYEES WHO HAVE HELD THE TITLE "SENIOR MANAGER"
SELECT COUNT(emp_no) AS senior_managers FROM titles
WHERE title = 'Senior Manager';