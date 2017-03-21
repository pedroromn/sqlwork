select 
  employee_id, last_name, first_name, department_name
from HR.EMPLOYEES
  join HR.DEPARTMENTS using(department_id) 
order by 
  employee_id, department_name
