select DEPARTMENT_ID, avg(salary)
from hr.employees
group by department_id
