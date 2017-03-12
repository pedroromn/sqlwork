select employee_id, first_name, last_name, hire_date, salary from hr.EMPLOYEES
where EMPLOYEES.SALARY > 5000
--order by EMPLOYEES.LAST_NAME, EMPLOYEES.FIRST_NAME;
order by salary desc;
