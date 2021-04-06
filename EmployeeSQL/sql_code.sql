CREATE TABLE departments (
    dept_no varchar(255)   PRIMARY KEY,
    dept_name varchar(255)   NOT NULL
);


CREATE TABLE dpt_emp (
    emp_no int   NOT NULL,
    dept_no varchar(255)   NOT NULL
);

CREATE TABLE dpt_manager (
    dept_no varchar(255)   NOT NULL,
    emp_no int  PRIMARY KEY
);

CREATE TABLE employees (
    emp_no int  PRIMARY KEY,
    emp_title_id varchar(255)   NOT NULL,
    birth_date date   NOT NULL,
    first_name varchar(255)   NOT NULL,
    last_name varchar(255)   NOT NULL,
    sex varchar(255)   NOT NULL,
    hire_data date   NOT NULL
);

CREATE TABLE salaries (
    emp_no int  PRIMARY KEY,
    salary int   NOT NULL
);

CREATE TABLE titles (
    title_id varchar(255)  PRIMARY KEY,
    title varchar(255)   NOT NULL
);


--List the following details of each employee: employee number, last name, first name, sex, and salary.
select employees.emp_no as Employee_number, employees.last_name, employees.first_name, employees.sex, salaries.salary
from employees
join salaries on employees.emp_no = salaries.emp_no ;

--List first name, last name, and hire date for employees who were hired in 1986.
select employees.first_name, employees.last_name, employees.hire_data
from employees
where hire_data between '1986-01-01' and '1986-12-31' ;


--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, 
--first name.

select dpt_manager.dept_no, dpt_manager.emp_no, employees.last_name, employees.first_name,
departments.dept_name
from dpt_manager
join employees on dpt_manager.emp_no = employees.emp_no
join departments on dpt_manager.dept_no = departments.dept_no;


-- List the department of each employee with the following information:
-- employee number, last name, first name, and department name.
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
join dpt_manager on employees.emp_no = dpt_manager.emp_no
join dpt_emp on employees.emp_no = dpt_emp.emp_no
join departments on departments.dept_no = dpt_manager.dept_no;

