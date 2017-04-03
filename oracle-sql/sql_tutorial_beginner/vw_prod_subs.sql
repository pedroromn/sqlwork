CREATE VIEW prod_subs_v AS
SELECT prod.p_code,
  prod.p_name,
  subst.p_code subst_p_code,
  subst.p_name subst_name
FROM OSQLB_DB.PRODUCT prod
LEFT OUTER JOIN OSQLB_DB.PRODUCT subst
ON prod.s_code = subst.p_code
ORDER BY prod.p_code;
