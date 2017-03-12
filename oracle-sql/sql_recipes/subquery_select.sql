select first_name,
last_name
,(select first_name
from hr.employees m
where m.employee_id = e.manager_id) as manager_first_name
,(select last_name
from hr.employees m
where m.employee_id = e.manager_id) as manager_last_name
from hr.employees e
where manager_id is not null
order by last_name, first_name;

