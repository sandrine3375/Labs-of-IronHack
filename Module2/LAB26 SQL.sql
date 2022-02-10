USE employees_mod;

DELIMITER $$
CREATE PROCEDURE avg_salary()
BEGIN
SELECT AVG(salary), COUNT(*) FROM t_salaries;
END $$
DELIMITER ;

Call avg_salary ();

DELIMITER $$
CREATE FUNCTION emp_info(p_first_name varchar(255), p_last_name varchar(255))  RETURNS decimal(10,2) 
DETERMINISTIC
BEGIN
	DECLARE v_max_from_date date;
	DECLARE v_salary decimal(10,2);
SELECT
  MAX(from_date) INTO v_max_from_date 
  FROM t_employees e
	JOIN t_salaries s ON e.emp_no = s.emp_no
  WHERE e.first_name = p_first_name
    AND e.last_name = p_last_name;
    
 SELECT s.salary INTO v_salary 
 FROM   t_employees e
    JOIN  t_salaries s ON e.emp_no = s.emp_no
WHERE   e.first_name = p_first_name
    AND e.last_name = p_last_name
    AND s.from_date = v_max_from_date;
    RETURN v_salary;
END$$ 
DELIMITER ;


select emp_info ('Mary', 'Sluis');  


DELIMITER $$
CREATE TRIGGER before_employee_update 
    BEFORE UPDATE ON t_employees
   FOR EACH ROW 
   BEGIN
          IF NEW.hire_date > sysdate() THEN
			SET NEW.hire_date = sysdate();
			END IF;
END $$
DELIMITER ;

CREATE INDEX i_hire_date ON t_employees(hire_date);
DROP INDEX i_hire_date on t_employees ; 

select * from t_salaries
where salary > 87000;

CREATE INDEX i_salary ON t_salaries(salary);

select t_employees.emp_no, first_name, last_name,
CASE
    WHEN t_dept_manager.emp_no = t_employees.emp_no 
    THEN "Manager"
    ELSE "regular employee"
end AS DD
    from t_employees
     join  t_dept_manager on t_dept_manager.emp_no = t_employees.emp_no
where t_employees.emp_no > 109990; 

select t_employees.emp_no, first_name, last_name,
CASE
    WHEN t_dept_manager.emp_no = t_employees.emp_no  
    THEN MAX(salary)-MIN(salary)
end AS diff, 
CASE
    WHEN t_dept_manager.emp_no = t_employees.emp_no 
    AND t_salaries.salary > 30000 
    THEN "YES"
    ELSE "NO"
end AS SUPA30000
 
     from t_employees
     join  t_dept_manager on t_dept_manager.emp_no = t_employees.emp_no
     join  t_salaries on t_salaries.emp_no = t_employees.emp_no
     group by t_salaries.emp_no;
; 

select t_employees.emp_no, first_name, last_name,
CASE
    WHEN t_dept_emp.to_date > sysdate() 
    THEN "Is still employed "
    ELSE "Not an employee anymore"
end AS current_employee
 
     from t_employees
	join  t_dept_emp on t_dept_emp.emp_no = t_employees.emp_no
	limit 100;
     
Extract the employee number, first name, and last name of the first 100 employees, 
and add a fourth column, called “current_employee” saying “Is still employed” 
if the employee is still working in the company, or “Not an employee anymore” if they aren’t. 
Hint: 
You’ll need to use data from both the ‘employees’ and the ‘dept_emp’ table to solve this exercise.

