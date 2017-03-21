select employee_id, last_name, first_name,/*-e.department_id emp_dep,*/ d.department_id, department_name
from HR.EMPLOYEES e
--inner join HR.DEPARTMENTS d
--natural join HR.DEPARTMENTS
--left outer join HR.DEPARTMENTS using(department_id)
--left outer join HR.DEPARTMENTS d
--right outer join HR.DEPARTMENTS d
full outer join HR.DEPARTMENTS d
on e.department_id = d.department_id
--where e.department_id is null
