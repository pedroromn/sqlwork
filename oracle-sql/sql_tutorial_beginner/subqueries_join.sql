select customer.* from OSQLB_DB.CUSTOMER
where c_no in
(
	select c_no from OSQLB_DB.C_ORDER o
	join OSQLB_DB.PRODUCT p
	on o.p_code = p.p_code
	where p.p_name not like '%Nut%'
	and customer.c_no = o.c_no
)
