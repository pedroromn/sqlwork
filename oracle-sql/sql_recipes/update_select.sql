update HR.EMPLOYEES
set (job_id, phone_number, salary)
= (select 'ST_MAN', '650.124.9876', salary * 1.5 from dual)
where employee_id = 131;
