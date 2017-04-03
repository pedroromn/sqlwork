select p_code, p_name, 'FIRST QUERY' query from OSQLB_DB.PRODUCT p
where p_name like '%Nut%'
UNION ALL
--UNION
select p.p_code, p.p_name, 'SECOND QUERY' query from OSQLB_DB.C_ORDER o
inner join OSQLB_DB.PRODUCT p
on o.p_code = p.p_code
order by p_code
