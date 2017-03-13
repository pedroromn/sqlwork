select c.c_no, c.p_code, c.order_dt, ship_qty, ship_dt, qty
from OSQLB_DB.SHIPMENT s
join OSQLB_DB.C_ORDER c
on s.c_no = c.c_no
and s.p_code = c.p_code
and s.order_dt = c.order_dt
