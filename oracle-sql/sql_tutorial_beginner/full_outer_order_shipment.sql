select o.*, s.*
from OSQLB_DB.C_ORDER o
full outer join OSQLB_DB.SHIPMENT s
on o.c_no = s.c_no
and o.p_code = s.p_code
