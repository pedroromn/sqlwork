select department_id, round(avg(salary),3) avg_salary
from HR.EMPLOYEES
group by department_id
order by department_id
