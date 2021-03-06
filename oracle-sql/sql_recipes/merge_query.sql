merge into hr.countries c
using
	(select country_id, country_name
	 from hr.countries) nc
on (c.country_id = nc.country_id)
when matched then
update set c.country_name = nc.country_name
when not matched then
insert (c.country_id, c.country_name)
	values (nc.country_id, nc.country_name);
