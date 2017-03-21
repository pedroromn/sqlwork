-- Encontrar todos los empleados cuyo salario es 20% menos del salario promedio, excepentuando
-- los empleados del departamento ejecutivo.
select employee_id, last_name, first_name, salary
from HR.EMPLOYEES
where salary < 0.8 * (select avg(salary)from HR.EMPLOYEES where department_id != 90)
