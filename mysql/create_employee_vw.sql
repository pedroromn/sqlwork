CREATE VIEW employee_vw AS
SELECT emp_id, fname, lname,
year(start_date) start_year
FROM employee;