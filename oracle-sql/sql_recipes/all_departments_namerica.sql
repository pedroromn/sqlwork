-- You want to find all departments with offices in North America for reporting
SELECT DEPARTMENT_NAME
FROM HR.DEPARTMENTS
WHERE
  LOCATION_ID IN 
    (SELECT LOCATION_ID
     FROM HR.LOCATIONS
     WHERE
       COUNTRY_ID = 'US' OR
       COUNTRY_ID = 'CA') 
