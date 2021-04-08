-- CREATE TABLE Departments (
--     dept_no varchar(255)   NOT NULL,
--     dept_name varchar(255)   NOT NULL,
--     CONSTRAINT pk_Departments PRIMARY KEY (
--         dept_no
--      )
-- );

-- CREATE TABLE Dpt_emp (
--     emp_no int   NOT NULL,
--     dept_no varchar(255)   NOT NULL,
--     CONSTRAINT pk_Dpt_emp PRIMARY KEY (
--         emp_no,dept_no
--      )
-- );

-- CREATE TABLE Dpt_manager (
--     dept_no varchar(255)   NOT NULL,
--     emp_no int   NOT NULL,
--     CONSTRAINT pk_Dpt_manager PRIMARY KEY (
--         dept_no,emp_no
--      )
-- );

-- CREATE TABLE Employees (
--     emp_no int   NOT NULL,
--     emp_title_id varchar(255)   NOT NULL,
--     birth_date date   NOT NULL,
--     first_name varchar(255)   NOT NULL,
--     last_name varchar(255)   NOT NULL,
--     sex varchar(255)   NOT NULL,
--     hire_data date   NOT NULL,
--     CONSTRAINT pk_Employees PRIMARY KEY (
--         emp_no
--      )
-- );

-- CREATE TABLE Salaries (
--     emp_no int   NOT NULL,
--     salary int   NOT NULL
-- );

-- CREATE TABLE Titles (
--     title_id varchar(255)   NOT NULL,
--     title varchar(255)   NOT NULL,
--     CONSTRAINT pk_Titles PRIMARY KEY (
--         title_id
--      )
-- );

-- ALTER TABLE Dpt_emp ADD CONSTRAINT "fk_Dpt_emp_emp_no" FOREIGN KEY("emp_no")
-- REFERENCES Employees ("emp_no");

-- ALTER TABLE Dpt_emp ADD CONSTRAINT "fk_Dpt_emp_dept_no" FOREIGN KEY("dept_no")
-- REFERENCES Departments ("dept_no");

-- ALTER TABLE Dpt_manager ADD CONSTRAINT "fk_Dpt_manager_dept_no" FOREIGN KEY("dept_no")
-- REFERENCES Departments ("dept_no");

-- ALTER TABLE Dpt_manager ADD CONSTRAINT "fk_Dpt_manager_emp_no" FOREIGN KEY("emp_no")
-- REFERENCES Employees ("emp_no");

-- ALTER TABLE Employees ADD CONSTRAINT "fk_Employees_emp_title_id" FOREIGN KEY("emp_title_id")
-- REFERENCES Titles ("title_id");

-- ALTER TABLE Salaries ADD CONSTRAINT "fk_Salaries_emp_no" FOREIGN KEY("emp_no")
-- REFERENCES Employees ("emp_no");


-- Question 1: List the following details of each employee: employee number, last name, first name,
-- sex, and salary.
select employees.emp_no as Employee_number, employees.last_name, employees.first_name, employees.sex, salaries.salary
from employees
join salaries on employees.emp_no = salaries.emp_no ;

--OR
select employees.emp_no as Employee_number, employees.last_name, employees.first_name,
employees.sex
from employees where employees.emp_no in (
	select salaries.emp_no from salaries ) ;



-- Question 2:List first name, last name, and hire date for employees who were hired in 1986.
select employees.first_name, employees.last_name, employees.hire_data
from employees
where hire_data between '1986-01-01' and '1986-12-31' ;


-- Question 3:List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, 
--first name.

select dpt_manager.dept_no, dpt_manager.emp_no, employees.last_name, employees.first_name,
departments.dept_name
from dpt_manager
join employees on dpt_manager.emp_no = employees.emp_no
join departments on dpt_manager.dept_no = departments.dept_no;


-- Question 4:List the department of each employee with the following information:
-- employee number, last name, first name, and department name.
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
join dpt_manager on employees.emp_no = dpt_manager.emp_no
join dpt_emp on employees.emp_no = dpt_emp.emp_no
join departments on departments.dept_no = dpt_manager.dept_no;


-- Question 5: List first name, last name, and sex for employees whose first name
--is "Hercules" and last names begin with "B."
select first_name, last_name, sex
from employees
where first_name = 'Hercules' and last_name like 'B%' ;


-- Question 6 : List all employees in the Sales department, including their
--employee number, last name, first name, and department name.
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
join dpt_emp on employees.emp_no = dpt_emp.emp_no
join departments on dpt_emp.dept_no = departments.dept_no ;
--where departments.dept_name = 'Sales department' ;


Select * from employees where emp_no in (57444,13616,240129,427958) ;

Select * from employees where emp_no = 57444 or emp_no = 13616 or emp_no = 240129 or emp_no = 427958;





