select d.department_name
from (select department_id, department_name from hr.departments where location_id != 1700) d;
