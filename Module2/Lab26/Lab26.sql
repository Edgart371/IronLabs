USE employees_mod;

select * from t_salaries;
select * from t_employees;

#Create Procedure for average salary
DELIMITER $$ 
CREATE PROCEDURE average() 
BEGIN 
SELECT AVG(salary)
from t_salaries
limit 1000; 
END$$ 
Delimiter ;
CALL average();

#Procedure called ‘emp_info’ that uses as parameters the first and the last name 
#of an individual, and returns their employee number.

DELIMITER $$
CREATE PROCEDURE emp_info(first_names text,last_names text)
BEGIN
SELECT emp_no
FROM t_employees
WHERE first_name = first_names and last_name = last_names;
END$$
DELIMITER ;

#Call procedure
CALL emp_info('Adamantios','Portugali');
CALL average();

#Create a function called ‘emp_info’ that takes 
#for parameters the first and last name of an employee, 
#and returns the salary from the newest contract of that employee.

DELIMITER $$
CREATE PROCEDURE emp_info1(first_names text, last_names text)
BEGIN
DECLARE v_max_from_date DATE;
SELECT salary, from_date, to_date
FROM t_salaries
JOIN t_employees
ON t_salaries.emp_no = t_employees.emp_no
WHERE first_name = first_names and last_name = last_names
ORDER BY from_date DESC
LIMIT 1;
END$$
DELIMITER ;

CALL emp_info1('Adamantios','Portugali');

#Create a trigger that checks if the hire date of an employee is higher than the current date. 
#If true, set this date to be the current date. Format the output appropriately (YY-MM-DD)

DROP TRIGGER hiredayempose
DELIMITER $$
CREATE TRIGGER hiredayempose
BEFORE UPDATE ON t_employees
FOR EACH ROW
BEGIN
	IF NEW.hire_date > CURDATE() THEN
		SET NEW.hire_date = date_format(CURDATE(), '%Y-%M-%D');
	END IF;
END $$
DELIMITER ;
        
INSERT INTO t_employees VALUES (1001105,'1953-11-07','Mary','Sluis','F','2022-09-22');
SELECT * FROM t_employees
WHERE last_name='Sluis';

#Create ‘i_hire_date’ and Drop the ‘i_hire_date’ index.
CREATE INDEX i_hire_date ON t_employees (hire_date);

DROP INDEX i_hire_date ON t_employees;

#Select all records from the ‘salaries’ table of people whose salary is higher than $89,000 per annum.
#Then, create an index on the ‘salary’ column of that table, and check if it has sped up the search of the same SELECT statement.

SELECT * 
FROM t_salaries
WHERE salary>89000;

CREATE INDEX indexe ON t_salaries (salary);

#DROP INDEX indexe ON t_salaries;

#Use Case statement and obtain a result set containing the employee number, first name, and last name of all employees 
#with a number higher than 109990. Create a fourth column in the query, indicating whether this employee is also a manager, 
#according to the data provided in the dept_manager table, or a regular employee.
ALTER TABLE t_employees
DROP COLUMN manageryesornot;

ALTER TABLE t_employees 
DROP COLUMN manager;

SELECT t_employees.emp_no,t_employees.first_name,t_employees.last_name,
CASE
    WHEN t_dept_manager.emp_no=t_employees.emp_no THEN "Manager"
    ELSE "employee"
END AS manager
FROM t_employees
INNER JOIN t_dept_manager
ON t_dept_manager.emp_no=t_employees.emp_no
WHERE t_employees.emp_no>'109990';

#Extract a dataset containing the following information about the managers: employee number, first name, and last name. 
#Add two columns at the end – one showing the difference between the maximum and minimum salary of that employee, and another 
#one saying whether this salary raise was higher than $30,000 or NOT.

SELECT t_dept_manager.emp_no, first_name, last_name, (max(salary) - min(salary)),
CASE WHEN (max(salary) - min(salary)) > 30000 THEN 'GOOD'
WHEN (max(salary) - min(salary)) < 30000 THEN 'NOTGOOD'
END AS 'Salary_raise'
FROM t_dept_manager
JOIN t_employees
ON t_dept_manager.emp_no = t_employees.emp_no
JOIN t_salaries
ON t_employees.emp_no = t_salaries.emp_no
GROUP BY t_salaries.emp_no;

#Extract the employee number, first name, and last name of the first 100 employees, and add a fourth column, 
#called “current_employee” saying “Is still employed” if the employee is still working in the company, 
#or “Not an employee anymore” if they aren’t. Hint: You’ll need to use data from both the ‘employees’ and 
#the ‘dept_emp’ table to solve this exercise.

SELECT t_employees.emp_no, first_name, last_name,
CASE WHEN t_dept_emp.to_date > sysdate() THEN "Is still employed"
WHEN t_dept_manager.to_date > sysdate() THEN "Is still employed"
ELSE"Not an wmployee anymore"
END AS Employed
FROM t_employees
JOIN t_dept_manager
ON t_employees.emp_no = t_dept_manager.emp_no
JOIN t_dept_emp
ON t_employees.emp_no = t_dept_emp.emp_no

LIMIT 100;
