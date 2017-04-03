select * from OSQLB_DB.PRODUCT
where price = ANY
							(select MAX(price)
							from OSQLB_DB.PRODUCT p
							inner join OSQLB_DB.C_ORDER o
							on o.p_code = p.p_code
							group by p.launch_dt
							);
