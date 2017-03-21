select o.*, ship_dt
from OSQLB_DB.C_ORDER o
left outer join OSQLB_DB.SHIPMENT s
on s.c_no = o.c_no
--where ship_dt is null
