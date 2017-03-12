select department_id, job_id, min(salary), round(avg(salary),3) avg_salary, max(salary), count(*)
from hr.employees
group by department_id, job_id
having count(*) > 1;
