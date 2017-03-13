select c_name, p_name, o.qty, o.order_dt
from OSQLB_DB.C_ORDER o
join OSQLB_DB.CUSTOMER c
on o.c_no = c.c_no
join OSQLB_DB.PRODUCT p
on o.p_code = p.p_code;
