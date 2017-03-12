select department_id, job_id, round(avg(salary),3) avg_salary, sum(salary)
from hr.employees
where department_id is not null
group by rollup (department_id, job_id);
--group by department_id, job_id
