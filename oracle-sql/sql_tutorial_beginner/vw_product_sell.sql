CREATE VIEW OSQLB_DB.vw_product_sell (p_no, p_name, sell_price
) AS
SELECT p_code, p_name,(price+margin) FROM OSQLB_DB.PRODUCT
