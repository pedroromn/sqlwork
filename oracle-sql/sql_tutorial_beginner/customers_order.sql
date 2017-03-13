SELECT c.c_name, o.p_code, o.qty, o.order_dt
FROM  OSQLB_DB.C_ORDER o
JOIN OSQLB_DB.CUSTOMER c
ON o.C_NO = c.C_NO; -- customers que han hecho ordenes de pedido.
