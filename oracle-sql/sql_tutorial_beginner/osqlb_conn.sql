-- libro : Oracle Sql A Beginner's Tutorial.pdf

--select * from product;
--select p_name, price from product;

-- updating the price

/*
UPDATE product
SET price = price - (price * 0.05);
*/

/*
UPDATE PRODUCT
SET price = price - (price * 0.05)
where p_code = 9;
*/

/*
delete from product
where p_name = 'Nut';
*/

--ROLLBACK;

/*
UPDATE product
SET price = NULL
where p_name = 'Nut';
*/

--select * from product where p_name = 'Nut';

--ROLLBACK;

--SET null NULL;

-------------------------------------------------------------------------------
-- Querying specifics rows

--select p_name, price from product where price = 15;

/*
select p_name, price from product 
where p_name != 'Nut';
*/

-- página 22: 


---------------------------------------------------------------------------
-- Compound conditions

/*
select * from product
where not(launch_dt >= '30-03-13' or price > 15
      and p_name != 'Nail');
*/

/*
select * from PRODUCT
where price BETWEEN 15 and 25;
*/

/*
select * from product
where price in (10, 15, 25);
*/

/*      
select * from product
where p_name like 'N_' or p_name like 'Sc%';
*/

/*
select * from product
where p_name like '%_%';
*/

/*
select * from product
where p_name like '%\_%' ESCAPE '\';
*/

/*
select * from product 
where price NOT BETWEEN 15 and 25;
*/

--set null NULL;

--select * from product where price IS NULL;
      
-----------------------------------------------------------------------------

-- Column Aliases 

/*
SELECT p_code, p_name as "PRODUCT NAME" 
from product;
*/

/*
select p_code,
'P_NAME: '
|| UPPER(p_name)          AS "PRODUCT NAME",
(price * 100)             AS "NORMALIZED PRICE",
TO_CHAR(launch_dt,'DD/MM/YYYY') AS "LAUNCH DATE"
from product;
*/

------------------------------------------------------------------------------

-- Limiting the Number of Rows

--select * from product where price > 10 and ROWNUM < 4;

--select distinct price from product order by price;

--select distinct price, launch_dt from product order by price;

/*
select MAX(price),
MIN(price),
SUM(price),
AVG(price),
COUNT(price),
COUNT(*)
from product;
*/

/*
SELECT p_code,
p_name,
CASE price
WHEN 10
THEN 'Cheap'
WHEN 15
THEN 'Medium'
WHEN 25
THEN 'Expensive'
ELSE 'Others'
END AS price_cat
FROM PRODUCT;
*/

/*
select p_code,
p_name,
CASE
  WHEN (price <= 10 AND p_name NOT LIKE 'Nut%')
  THEN 'Cheap'
  WHEN price BETWEEN 11 AND 25
  THEN 'Medium'
  WHEN price > 25 and TO_CHAR(launch_dt,'YYYYMMDD') > '20130329'
  THEN 'Expensive'
  WHEN price IS NULL
  THEN 'Not valid'
  ELSE 'Others'
END AS product_cat
FROM PRODUCT;
*/


--SELECT * FROM PRODUCT ORDER BY P_NAME;

-- pag: 41

--select * from product order by p_name desc;

--select * from product order by LAUNCH_DT, price;

-----------------------------------------------------------------------------

-- Storing output into a new table

/*
CREATE TABLE nut_product AS
SELECT * FROM product WHERE p_name LIKE '%Nut%';
*/

/*
CREATE TABLE non_nut(
p_code VARCHAR2(6),
p_name VARCHAR2(15),
price NUMBER(4,2),
launch_dt DATE,
PRIMARY KEY (p_code)
);
*/


/*
INSERT INTO non_nut
SELECT * FROM product WHERE p_name NOT LIKE '%Nut%';
*/

--select * from non_nut;
--SET null NULL;

/*
SELECT launch_dt,
MAX(price) MAX,
MIN(price) MIN,
SUM(price) SUM,
AVG(price) AVG,
COUNT(price) COUNT,
COUNT(*) AS "COUNT(*)"
FROM product
GROUP BY launch_dt
ORDER BY launch_dt;
*/

-- pag: 49
/*
SELECT price,
launch_dt,
MAX(price) MAX,
MIN(price) MIN,
SUM(price) SUM,
AVG(price) AVG,
COUNT(price) COUNT,
COUNT(*) "COUNT(*)"
FROM product
GROUP BY price,
launch_dt
HAVING COUNT(price) > 1
ORDER BY price, launch_dt;
*/

/*
select launch_dt,
max(price) max,
min(price) min,
sum(price) sum,
avg(price) avg,
count(price) count,
count(*) "count(*)"
from product
where p_name not like 'Super%'
group by launch_dt
having launch_dt > '29-03-2013'
order by launch_dt;
*/

--------------------------------------------------------------------------

-- JOINS
-- pag 54

/*
CREATE TABLE customer(
c_no VARCHAR2(6) NOT NULL,
c_name VARCHAR2(15)
);
ALTER TABLE customer ADD CONSTRAINT customer_pk PRIMARY KEY (c_no);
*/

--DROP TABLE customer;
/*
INSERT INTO customer (c_no, c_name)
VALUES (10, 'Standard Store');
INSERT INTO customer (c_no, c_name)
VALUES (20, 'Quality Store');
INSERT INTO customer (c_no, c_name)
VALUES (30, 'Head Office');
INSERT INTO customer (c_no, c_name)
VALUES (40, 'Super Agent');
*/

--SELECT * FROM CUSTOMER;

/*      
CREATE TABLE c_order(
c_no VARCHAR2(6) NOT NULL,
p_code VARCHAR2(6) NOT NULL,
qty NUMBER(8,2),
order_dt DATE 
);
ALTER TABLE c_order ADD CONSTRAINT c_order_customer_fk FOREIGN KEY (c_no)
REFERENCES customer (c_no);
ALTER TABLE c_order ADD CONSTRAINT c_order_product_fk FOREIGN KEY (p_code)
REFERENCES product (p_code);
*/

--DROP TABLE c_order;

/*
INSERT INTO c_order (c_no, p_code, qty, order_dt)
VALUES (10,1,100,'01-04-2013');
INSERT INTO c_order (c_no, p_code, qty, order_dt)
VALUES (10,2,100,'01-04-2013');
INSERT INTO c_order (c_no, p_code, qty, order_dt)
VALUES (20,1,200,'01-04-2013');
INSERT INTO c_order (c_no, p_code, qty, order_dt)
VALUES (30,3,300,'02-04-2013');
INSERT INTO c_order (c_no, p_code, qty, order_dt)
VALUES (40,4,400,'02-04-2013');
INSERT INTO c_order (c_no, p_code, qty, order_dt)
VALUES (40,5,400,'03-04-2013');
*/

--commit;

--SELECT * FROM c_order;

-------------------------------------------------------------------------------

-- A two table Join

/*
SELECT c_name,
p_code,
c_order.qty,
c_order.order_dt
FROM c_order JOIN customer
ON c_order.C_NO = customer.C_NO;
*/


/*
SELECT c_name,
p_code,
o.qty,
o.order_dt
FROM c_order o
JOIN customer c
ON o.c_no = c.c_no;
*/

-- pag 56

----------------------------------------------------------------------------

-- Using Table Aliases

/*
select c_name,
p_code,
o.qty,
o.order_dt
from c_order o
join customer c
on o.c_no = c.c_no;
*/

/*
select c_name,
p_name, 
o.qty,
o.order_dt
from c_order o
join customer c
on o.c_no = c.c_no
join product p
on o.p_code = p.p_code
where p_name not like 'Super%';
*/

----------------------------------------------------------------------------

-- A multiple columns join

--drop table shipment;

/*
create table shipment(
c_no VARCHAR2(6) not null,
p_code VARCHAR2(6) not null,
order_dt DATE not null,
ship_qty NUMBER(8,2),
ship_dt DATE
);

ALTER TABLE shipment ADD CONSTRAINT shipment_customer_fk FOREIGN KEY (c_no)
REFERENCES customer (c_no);
ALTER TABLE shipment ADD CONSTRAINT shipment_product_fk FOREIGN KEY (p_code)
REFERENCES product (p_code);
--ALTER TABLE shipment ADD CONSTRAINT shipment_c_order_fk FOREIGN KEY (order_dt)
--REFERENCES c_order (order_dt);
*/
/*
INSERT INTO shipment (c_no, p_code, order_dt, ship_qty, ship_dt)
VALUES (10,1,'01-04-13',50,'02-04-13');
INSERT INTO shipment (c_no, p_code, order_dt, ship_qty, ship_dt)
VALUES (10,2,'01-04-13',100,'02-04-13');
INSERT INTO shipment (c_no, p_code, order_dt, ship_qty, ship_dt)
VALUES (20,1,'01-04-13',100,'02-04-13');
INSERT INTO shipment (c_no, p_code, order_dt, ship_qty, ship_dt)
VALUES (30,3,'02-04-13',300,'03-04-13');
INSERT INTO shipment (c_no, p_code, order_dt, ship_qty, ship_dt)
VALUES (10,1,'01-04-13',50,'10-04-13');
*/

--select * from shipment;

/*
select o.c_no,
o.p_code,
o.order_dt,
ship_qty,
ship_dt,
qty
from shipment s
join c_order o
on s.c_no = o.c_no
and s.p_code = o.p_code
and s.order_dt = o.order_dt;
*/
