select prod.p_code, prod.p_name,
	ps.s_code,
	subst.p_name AS s_name
	from OSQLB_DB.PRODUCT prod
	inner join OSQLB_DB.PROD_SUBST ps
	on prod.p_code = ps.p_code
	inner join OSQLB_DB.PRODUCT subst
	on ps.s_code = subst.p_code
