SELECT * FROM (SELECT * FROM EMPLOYEES ORDER BY EMPLOYEE_ID)
WHERE ROWNUM < 11