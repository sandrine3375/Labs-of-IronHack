use examples;
CREATE TABLE users
(
    user_id INT(10),
    action VARCHAR(100),
    action_date date
    ); 
  
INSERT into users (user_id, action, action_date)
 VALUES
 (1, 'START', ' 2020-02-12'),
 (1, 'CANCEL', '2020-02-13'),
 (2, 'START', '2020-02-15'),
 (1, 'PUBLISH', '2020-02-18');
 
 Select * from users;
 
 -- first question
 
 SELECT
  user_id,
  ((COUNT(action))/ 
  ( SELECT COUNT(action) FROM users) ) AS publish_rate
FROM
users
where action = "publish"
GROUP BY user_id; 
 
 -- second question
  
SELECT *, ROW_NUMBER() OVER (PARTITION BY user_id order by action_date asc) rn
              FROM users; 
            
WITH table2 AS ( SELECT *, ROW_NUMBER() OVER (PARTITION BY user_id order by action_date asc) rn
              FROM users )
SELECT user_id,
       DATEDIFF(MAX(CASE 
       WHEN rn =3 THEN action_date
       WHEN rn =2 THEN action_date 
       WHEN rn =1 THEN action_date 
       END),
       MAX(CASE 
       WHEN rn=2 THEN action_date
       WHEN rn=1 THEN action_date
       END)
		) AS Duration 
FROM table2
GROUP BY user_id;
      
       
SELECT user_id,
       DATEDIFF(MAX(CASE WHEN rn = 3 THEN action_date END),
                MIN(CASE WHEN rn = 2 THEN action_date END)
               ) AS Duration 
FROM users AS t 
GROUP BY user_id;

-- question 3
CREATE TABLE table1
(
    author varchar(10),
    book_name VARCHAR(100)
    ); 
  
INSERT into table1 (author, book_name)
 VALUES
 ('LU', 'book1'),
 ('LU', 'book2'),
 ('LA', 'book3'),
 ('LA', 'book5');
 
CREATE TABLE table2
(
    sold int(10),
    book_name VARCHAR(100)
    ); 
  
INSERT into table2 (sold, book_name)
 VALUES
 (20, 'book1'),
 (30, 'book2'),
 (40, 'book3'),
 (50, 'book5');
 
 Select author, sum(sold) as total from table1
 Join table2
 on table1.book_name = table2.book_name
 group by author 
 order by total desc
 limit 3; 
 
 -- question 4
 CREATE TABLE employees
(
    department varchar(10),
    employee_id VARCHAR(100)
    ); 
  
INSERT into employees (department, employee_id)
 VALUES
 ('sale', 231),
 ('sale', 345),
 ('RH', 222),
 ('RH', 432)
 ;
 
 CREATE TABLE salaries
(
    salary int(10),
    employee_id VARCHAR(100)
    ); 
  
INSERT into salaries ( salary, employee_id)
 VALUES
  (400, 231),
 (700, 345),
 (453, 222),
 (321, 432);
 
 Select department, round((avg(salary)),1) as avg_salary from employees
 join salaries
 on employees.employee_id=salaries.employee_id
 group by department; 
 
 SELECT
	department, avg_salary
FROM
	(
 Select department, round((avg(salary)),1) as avg_salary from employees
 join salaries
 on employees.employee_id=salaries.employee_id
 group by department

	) table4
    where avg_salary < 500;