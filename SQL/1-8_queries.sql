select * from departments;
select * from dept_emp;
select * from dept_manager;
select * from employees;
select * from salaries;
select * from titles;

-- List the following details of each employee: employee number, last name, first name, gender, and salary.
select emp_no, last_name, first_name, gender, (
	select salary from salaries s where s.emp_no = e.emp_no
) from employees e;

-- List employees who were hired in 1986.
select emp_no, first_name, last_name
from employees
where hire_date between '1986-01-01' and '1986-12-31';

-- List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, 
-- last name, first name, and start and end employment dates.
select dm.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name, dm.from_date, dm.to_date
from dept_manager dm
join departments d
on dm.dept_no = d.dept_no
join employees e
on dm.emp_no = e.emp_no;

-- List the department of each employee with the following information: employee number, 
-- last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees e
join dept_emp de
on e.emp_no = de.emp_no
join departments d
on d.dept_no = de.dept_no
order by emp_no;

-- List all employees whose first name is "Hercules" and last names begin with "B."
select first_name, last_name
from employees
where first_name = 'Hercules' and last_name like 'B%';

-- List all employees in the Sales department, including their employee number, 
-- last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees e
join dept_emp de
on e.emp_no = de.emp_no
join departments d
on d.dept_no = de.dept_no
where d.dept_name = 'Sales'
order by emp_no;

-- List all employees in the Sales and Development departments, including their 
-- employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees e
join dept_emp de
on e.emp_no = de.emp_no
join departments d
on d.dept_no = de.dept_no
where d.dept_name = 'Sales' or d.dept_name = 'Development'
order by emp_no;

-- In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.
select last_name, count(last_name) as count_last_name
from employees
group by last_name
order by count_last_name desc;