select employee_id, last_name, first_name, department_id, salary
from HR.EMPLOYEES
where salary = any(select salary from HR.EMPLOYEES where department_id = 60) and department_id != 60;
