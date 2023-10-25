
-- Tables schema 
CREATE table if not exists titles(
    title_id varchar(10) PRIMARY KEY NOT NULL,
    title char(20) NOT NULL
);

CREATE table if not exists  employees(
    emp_no int PRIMARY KEY NOT NULL,
    emp_title_id varchar(10) NOT NULL,
    birth_date date NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL,
    sex sex NOT NULL,
    hire_date date NOT NULL
);

CREATE table if not exists  salaries(
    emp_no int PRIMARY KEY NOT NULL,
    salary int NOT NULL
);

CREATE TABLE if not exists departments (
    dept_no VARCHAR(20) PRIMARY KEY NOT NULL,
    dept_name CHAR(25) NOT NULL
);

CREATE table if not exists dept_emp(
    emp_no int NOT NULL,
    dept_no varchar(20) NOT NULL
);

CREATE table if not exists dept_manager( 
    dept_no varchar(20) NOT NULL,
    emp_no int NOT NULL
);


-- Foreign keys
ALTER TABLE employees 
ADD CONSTRAINT fk_emp_title 
FOREIGN KEY (emp_title_id) REFERENCES titles(title_id);

ALTER TABLE salaries 
ADD CONSTRAINT fk_emp_salary 
FOREIGN KEY (emp_no) REFERENCES employees(emp_no);

ALTER TABLE dept_emp 
ADD CONSTRAINT fk_dept_emp_emp_no 
FOREIGN KEY (emp_no) REFERENCES employees(emp_no);

ALTER TABLE dept_emp 
ADD CONSTRAINT fk_dept_emp_dept_no 
FOREIGN KEY (dept_no) REFERENCES departments(dept_no);

ALTER TABLE dept_manager 
ADD CONSTRAINT fk_dept_manager_emp_no 
FOREIGN KEY (emp_no) REFERENCES employees(emp_no);

ALTER TABLE dept_manager 
ADD CONSTRAINT fk_dept_manager_dept_no 
FOREIGN KEY (dept_no) REFERENCES departments(dept_no);

-- fillout tables with the data
COPY titles
FROM 'Data/titles.csv' DELIMITER ',' CSV HEADER;

COPY departments(dept_no, dept_name) 
FROM 'Data/departments.csv' DELIMITER ',' CSV HEADER;

COPY employees
FROM 'Data/employees.csv' DELIMITER ',' CSV HEADER;

COPY salaries
FROM 'Data/salaries.csv' DELIMITER ',' CSV HEADER;


COPY dept_manager
FROM 'Data/dept_manager.csv' DELIMITER ',' CSV HEADER;

COPY dept_emp
FROM 'Data/dept_emp.csv' DELIMITER ',' CSV HEADER;

-- data analysis
select e.emp_no, e.first_name, e.last_name, e.sex, s.salary
from employees as e
left join salaries as s on (e.emp_no = s.emp_no);

select e.emp_no, e.first_name, e.last_name, e.hire_date 
from employees as e
where hire_date between '1986-01-01' and '1986-12-31';

select 
  d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
from dept_manager dm
left join departments d on (d.dept_no = dm.dept_no)
left join employees e on (e.emp_no = dm.emp_no);

select 
 de.dept_no, de.emp_no, e.first_name, e.last_name, d.dept_name
from dept_emp de
left join departments d on (d.dept_no = de.dept_no)
left join employees e on (e.emp_no = de.emp_no);

select 
  e.first_name, e.last_name, e.sex
from employees e
where 
  e.first_name = 'Hercules'
  and e.last_name like 'B%';

select 
  e.emp_no, e.first_name, e.last_name
from dept_emp de
left join departments d on (d.dept_no = de.dept_no)
left join employees e on (e.emp_no = de.emp_no)
where d.dept_name = 'Sales';

select 
  e.emp_no, e.first_name, e.last_name, d.dept_name
from dept_emp de
left join departments d on (d.dept_no = de.dept_no)
left join employees e on (e.emp_no = de.emp_no)
where d.dept_name IN ('Sales', 'Development');

select 
  e.last_name, count(e.last_name) as frequency 
from employees e
group by (e.last_name) 
order by frequency desc;



