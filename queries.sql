--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
select emp_id, last_name, first_name, sex, (select salary from salary where salary.emp_id = employee.emp_id)
from employee;

--2. List first name, last name, and hire date for employees who were hired in 1986.
select first_name, last_name, hire_date 
from employee
where right(hire_date, 4) = '1986';

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
select dp.dept_id, dp.dept_name, em.emp_id, em.first_name, em.last_name
from dept_manager as dm
inner join department as dp on dp.dept_id=dm.dept_id
inner join employee as em on dm.emp_id = em.emp_id; 

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
create view employee_dept as
select d.dept_id, d.dept_name, em.emp_id, em.first_name, em.last_name
from department as d
inner join dept_emp as de on de.dept_id=d.dept_id
inner join employee as em on de.emp_id = em.emp_id; 


--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select first_name, last_name, sex
from employee
where (first_name like 'Hercules') and (left(last_name,1)='B');

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
select *
from employee_dept
where dept_name = 'Sales'; 

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select *
from employee_dept
where (dept_name = 'Sales') or (dept_name = 'Development'); 

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS "surname_frequency"
FROM employee
group by last_name
ORDER BY "surname_frequency" DESC;
