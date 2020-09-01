-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE Departments (
    dept_no varchar(200)   NOT NULL,
    dept_name varchar(200)   NOT NULL,
    CONSTRAINT pk_Departments PRIMARY KEY (
        dept_no
     )
);

CREATE TABLE Titles (
    title_id varchar(200)   NOT NULL,
    title varchar(200)   NOT NULL,
    CONSTRAINT pk_Titles PRIMARY KEY (
        title_id
     )
);

CREATE TABLE Employees (
    emp_no int   NOT NULL,
    title_id varchar(200)   NOT NULL,
    birth_date date   NOT NULL,
    first_name varchar(200)   NOT NULL,
    last_name varchar(200)   NOT NULL,
    sex varchar(200)   NOT NULL,
    hire_date date   NOT NULL,
    CONSTRAINT pk_Employees PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE Department_Employees (
    emp_no int   NOT NULL,
    dept_no varchar(200)   NOT NULL
);

CREATE TABLE Department_Manager (
    dept_no varchar(200)   NOT NULL,
    emp_no int   NOT NULL
);

CREATE TABLE Salaries (
    emp_no int   NOT NULL,
    salary int   NOT NULL
);

ALTER TABLE Employees ADD CONSTRAINT fk_Employees_title_id FOREIGN KEY(title_id)
REFERENCES Titles (title_id);

ALTER TABLE Department_Employees ADD CONSTRAINT fk_Department_Employees_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Department_Employees ADD CONSTRAINT fk_Department_Employees_dept_no FOREIGN KEY(dept_no)
REFERENCES Departments (dept_no);

ALTER TABLE Department_Manager ADD CONSTRAINT fk_Department_Manager_dept_no FOREIGN KEY(dept_no)
REFERENCES Departments (dept_no);

ALTER TABLE Department_Manager ADD CONSTRAINT fk_Department_Manager_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Salaries ADD CONSTRAINT fk_Salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

