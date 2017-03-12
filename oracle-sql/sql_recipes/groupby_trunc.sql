select department_id, job_id, min(salary) min_salary,
max(salary) max_salary, trunc(avg(salary),3) avg_salary
from hr.employees
group by department_id, job_id
order by department_id, max_salary desc;
