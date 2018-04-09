-- QUERY 1
SELECT
    last_name
    || ', '
    || job_id AS "Employee And Title"
FROM
    employees;
/
-- QUERY 2

SELECT
    employee_id
    || ', '
    || first_name
    || ', '
    || last_name
    || ', '
    || email
    || ', '
    || phone_number
    || ', '
    || hire_date
    || ', '
    || job_id
    || ', '
    || salary
    || ', '
    || commission_pct
    || ', '
    || manager_id
    || ', '
    || department_id AS "THE_OUTPUT"
FROM
    employees;
/
-- QUERY 3

SELECT
    last_name,
    salary
FROM
    employees
WHERE
    salary NOT BETWEEN 5000 AND 12000;
/
-- QUERY 4

SELECT
    last_name,
    job_id,
    hire_date
FROM
    employees
WHERE
    hire_date BETWEEN TO_DATE('20-FEB-1998','DD-MON-YYYY') AND TO_DATE('01-MAY-1998','DD-MON-YYYY')
ORDER BY
    hire_date ASC;
/
-- QUERY 5

SELECT
    last_name,
    department_id
FROM
    employees
WHERE
    department_id IN (
        20,
        50
    )
ORDER BY
    last_name;
/
-- QUERY 6

SELECT
    e.last_name,
    j.job_title
FROM
    employees e
    NATURAL JOIN jobs j
WHERE
    e.manager_id IS NULL;
/
-- QUERY 7

SELECT
    last_name,
    salary,
    commission_pct
FROM
    employees
WHERE
    commission_pct IS NOT NULL
ORDER BY
    salary DESC,
    commission_pct DESC;
/
-- QUERY 8

SELECT
    employee_id,
    last_name,
    salary,
    round(salary + (0.15 * salary) ) AS "NEW SALARY"
FROM
    employees;
/
-- QUERY 9

SELECT
    employee_id,
    last_name,
    salary,
    round(salary + (0.15 * salary) ) AS "NEW SALARY",
    round(salary + (0.15 * salary) ) - salary AS increase
FROM
    employees;
/
-- QUERY 10

SELECT
    initcap(last_name) AS "Last Name",
    length(last_name) AS "Name Length"
FROM
    employees
WHERE
    last_name LIKE 'J%'
    OR   last_name LIKE 'A%'
    OR   last_name LIKE 'M%';
/
-- QUERY 11

SELECT UNIQUE
    j.job_title,
    l.city
FROM
    jobs j
    JOIN employees e ON j.job_id = e.job_id
    JOIN departments d ON d.department_id = e.department_id
    JOIN locations l ON l.location_id = d.location_id
WHERE
    e.department_id = 80;

-- QUERY 12

SELECT E.LAST_NAME , D.DEPARTMENT_NAME FROM EMPLOYEES E JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID WHERE E.LAST_NAME LIKE '%a%';

-- QUERY 13

SELECT E.LAST_NAME, J.JOB_TITLE, E.DEPARTMENT_ID, D.DEPARTMENT_NAME 
FROM jobs j
    JOIN employees e ON j.job_id = e.job_id
    JOIN departments d ON d.department_id = e.department_id
    JOIN locations l ON l.location_id = d.location_id WHERE
UPPER(CITY) = 'TORONTO';

-- QUERY 14

