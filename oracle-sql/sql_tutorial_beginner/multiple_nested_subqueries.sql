select customer.* from OSQLB_DB.CUSTOMER
where c_no in
(
	select c_no from OSQLB_DB.C_ORDER
	where p_code in
	(
		select p_code from OSQLB_DB.PRODUCT where p_name not like '%Nut%'
	)
)
