--update OSQLB_DB.PRODUCT set s_code = 5 where p_code = 3;

select
  prod.p_code, prod.p_name, subst.p_code subst_code, subst.p_name subst_name
from OSQLB_DB.PRODUCT prod
  left outer join OSQLB_DB.PRODUCT subst on
    prod.s_code = subst.p_code
--where subst.p_code is not null
order by prod.p_code;
