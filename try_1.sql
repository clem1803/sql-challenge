-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE `Departments` (
    `dept_no` varchar(255)  NOT NULL ,
    `dept_name` varchar(255)  NOT NULL ,
    PRIMARY KEY (
        `dept_no`
    )
);

CREATE TABLE `Dpt_emp` (
    `emp_no` int  NOT NULL ,
    `dept_no` varchar(255)  NOT NULL 
);

CREATE TABLE `Dpt_manager` (
    `dept_no` varchar(255)  NOT NULL ,
    `emp_no` int  NOT NULL ,
    PRIMARY KEY (
        `emp_no`
    )
);

CREATE TABLE `Employees` (
    `emp_no` int  NOT NULL ,
    `emp_title_id` varchar(255)  NOT NULL ,
    `birth_date` date  NOT NULL ,
    `first_name` varchar(255)  NOT NULL ,
    `last_name` varchar(255)  NOT NULL ,
    `sex` varchar(255)  NOT NULL ,
    `hire_data` date  NOT NULL ,
    PRIMARY KEY (
        `emp_no`
    )
);

CREATE TABLE `Salaries` (
    `emp_no` int  NOT NULL ,
    `salary` int  NOT NULL ,
    PRIMARY KEY (
        `emp_no`
    )
);

CREATE TABLE `Titles` (
    `title_id` varchar(255)  NOT NULL ,
    `title` varchar(255)  NOT NULL ,
    PRIMARY KEY (
        `title_id`
    )
);

ALTER TABLE `Dpt_emp` ADD CONSTRAINT `fk_Dpt_emp_emp_no` FOREIGN KEY(`emp_no`)
REFERENCES `Employees` (`emp_no`);

ALTER TABLE `Dpt_emp` ADD CONSTRAINT `fk_Dpt_emp_dept_no` FOREIGN KEY(`dept_no`)
REFERENCES `Departments` (`dept_no`);

ALTER TABLE `Dpt_manager` ADD CONSTRAINT `fk_Dpt_manager_dept_no` FOREIGN KEY(`dept_no`)
REFERENCES `Departments` (`dept_no`);

ALTER TABLE `Dpt_manager` ADD CONSTRAINT `fk_Dpt_manager_emp_no` FOREIGN KEY(`emp_no`)
REFERENCES `Employees` (`emp_no`);

ALTER TABLE `Employees` ADD CONSTRAINT `fk_Employees_emp_no` FOREIGN KEY(`emp_no`)
REFERENCES `Salaries` (`emp_no`);

ALTER TABLE `Employees` ADD CONSTRAINT `fk_Employees_emp_title_id` FOREIGN KEY(`emp_title_id`)
REFERENCES `Titles` (`title_id`);

