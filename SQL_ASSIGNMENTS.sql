-- QUERY 1
-- Display the last name concatenated with the job ID, separated by a comma and space, and name the column Employee and Title.
SELECT LAST_NAME
  || ', '
  || JOB_ID AS "EMPLOYEE AND TITLE"
FROM EMPLOYEES;
/
-- QUERY 2
-- Create a query to display all the data from the EMPLOYEES table. Separate each column by a comma. Name the column THE_OUTPUT.
SELECT EMPLOYEE_ID
  || ', '
  || FIRST_NAME
  || ', '
  || LAST_NAME
  || ', '
  || EMAIL
  || ', '
  || PHONE_NUMBER
  || ', '
  || HIRE_DATE
  || ', '
  || JOB_ID
  || ', '
  || SALARY
  || ', '
  || COMMISSION_PCT
  || ', '
  || MANAGER_ID
  || ', '
  || DEPARTMENT_ID AS "THE_OUTPUT"
FROM EMPLOYEES;
/
-- QUERY 3
-- Create a query to display the last name and salary for all employees whose salary is not in the range of 5,000 and 12,000.
SELECT LAST_NAME,
  SALARY
FROM EMPLOYEES
WHERE SALARY NOT BETWEEN 5000 AND 12000;
/
-- QUERY 4
-- Display the employee last name, job ID, and start date of employees hired between February 20, 1998, and May 1, 1998. Order the query in ascending order by start date.
SELECT LAST_NAME,
  JOB_ID,
  HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE BETWEEN TO_DATE('20-FEB-1998','DD-MON-YYYY') AND TO_DATE('01-MAY-1998','DD-MON-YYYY')
ORDER BY HIRE_DATE ASC;
/
-- QUERY 5
-- Display the last name and department number of all employees in departments 20 and 50 in alphabetical order by name.
SELECT LAST_NAME,
  DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN ( 20, 50 )
ORDER BY LAST_NAME;
/
-- QUERY 6
-- Display the last name and job title of all employees who do not have a manager.
SELECT E.LAST_NAME,
  J.JOB_TITLE
FROM EMPLOYEES E NATURAL
JOIN JOBS J
WHERE E.MANAGER_ID IS NULL;
/
-- QUERY 7
-- Display the last name, salary, and commission for all employees who earn commissions. Sort data in descending order of salary and commissions.
SELECT LAST_NAME,
  SALARY,
  COMMISSION_PCT
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL
ORDER BY SALARY DESC,
  COMMISSION_PCT DESC;
/
-- QUERY 8
-- For each employee, display the employee number, last_name, salary, and salary increased by 15% and expressed as a whole number. Label the column New Salary.
SELECT EMPLOYEE_ID,
  LAST_NAME,
  SALARY,
  ROUND(SALARY + (0.15 * SALARY) ) AS "NEW SALARY"
FROM EMPLOYEES;
/
-- QUERY 9
-- Modify your above query to add a column that subtracts the old salary from the new salary. Label the column Increase.
SELECT EMPLOYEE_ID,
  LAST_NAME,
  SALARY,
  ROUND(SALARY + (0.15 * SALARY) )          AS "NEW SALARY",
  ROUND(SALARY + (0.15 * SALARY) ) - SALARY AS INCREASE
FROM EMPLOYEES;
/
-- QUERY 10
-- Write a query that displays the employee’s last names with the first letter capitalized and all other letters lowercase and the length of the name for all employees whose name starts with J, A, or M. Give each column an appropriate label. Sort the results by the employees’ last names.
SELECT INITCAP(LAST_NAME) AS "LAST NAME",
  LENGTH(LAST_NAME)       AS "NAME LENGTH"
FROM EMPLOYEES
WHERE LAST_NAME LIKE 'J%'
OR LAST_NAME LIKE 'A%'
OR LAST_NAME LIKE 'M%';
/
-- QUERY 11
-- Create a unique listing of all jobs that are in department 80. Include the location of the department in the output.
SELECT UNIQUE J.JOB_TITLE,
  L.CITY
FROM JOBS J
JOIN EMPLOYEES E
ON J.JOB_ID = E.JOB_ID
JOIN DEPARTMENTS D
ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
JOIN LOCATIONS L
ON L.LOCATION_ID      = D.LOCATION_ID
WHERE E.DEPARTMENT_ID = 80;
/
-- QUERY 12
-- Display the employee last name and department name for all employees who have an “a” (lowercase) in their last names.
SELECT E.LAST_NAME ,
  D.DEPARTMENT_NAME
FROM EMPLOYEES E
JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE E.LAST_NAME LIKE '%A%';
/
-- QUERY 13
-- Write a query to display the last name, job, department number, and department name for all employees who work in Toronto.
SELECT E.LAST_NAME,
  J.JOB_TITLE,
  E.DEPARTMENT_ID,
  D.DEPARTMENT_NAME
FROM JOBS J
JOIN EMPLOYEES E
ON J.JOB_ID = E.JOB_ID
JOIN DEPARTMENTS D
ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
JOIN LOCATIONS L
ON L.LOCATION_ID  = D.LOCATION_ID
WHERE UPPER(CITY) = 'TORONTO';
/
-- QUERY 14
-- Create a query that displays employee last names, department numbers, and all the employees who work in the same department as a given employee. Give each column an appropriate label.
SELECT E.DEPARTMENT_ID DEPARTMENT,
  E.FIRST_NAME
  ||' '
  ||E.LAST_NAME "EMPLOYEE NAME",
  C.FIRST_NAME
  ||' '
  ||C.LAST_NAME "COLLEAGUE NAME"
FROM EMPLOYEES E
JOIN EMPLOYEES C
ON (E.DEPARTMENT_ID  = C.DEPARTMENT_ID)
WHERE E.EMPLOYEE_ID <> C.EMPLOYEE_ID
ORDER BY E.DEPARTMENT_ID,
  E.FIRST_NAME,
  C.FIRST_NAME ;
/
-- QUERY 15
-- Display the names and hire dates for all employees who were hired before their managers, along with their manager’s names and hire dates. Label the columns Employee, Emp Hired, Manager, and Mgr Hired, respectively.
SELECT E.FIRST_NAME
  ||' '
  ||E.LAST_NAME AS "EMPLOYEE",
  E.HIRE_DATE   AS "EMP HIRED",
  M.FIRST_NAME
  ||' '
  ||M.LAST_NAME AS "MANAGER" ,
  M.HIRE_DATE   AS "MGR HIRED"
FROM EMPLOYEES E
JOIN EMPLOYEES M
ON E.MANAGER_ID   = M.EMPLOYEE_ID
WHERE E.HIRE_DATE < M.HIRE_DATE;
/
-- QUERY 16
-- Display the highest, lowest, sum, and average salary of all employees. Label the columns Maximum, Minimum, Sum, and Average, respectively. Round your results to the nearest whole number
SELECT ROUND(MAX(SALARY)) AS MAXIMUM,
  ROUND(MIN(SALARY))      AS MINIMUM,
  ROUND(SUM(SALARY))      AS SUM,
  ROUND(AVG(SALARY))      AS AVERAGE
FROM EMPLOYEES;
/
-- QUERY 17
-- Determine the number of managers without listing them. Label the column Number of Managers.
SELECT COUNT(DISTINCT(MANAGER_ID)) FROM EMPLOYEES;
/
-- QUERY 18
-- Create a query that will display the total number of employees and, of that total, the number of employees hired in 1995, 1996, 1997, and 1998. Create appropriate column headings.
SELECT COUNT(*),
  EXTRACT(YEAR FROM HIRE_DATE)
FROM EMPLOYEES
GROUP BY EXTRACT(YEAR FROM HIRE_DATE)
HAVING EXTRACT(YEAR FROM HIRE_DATE) IN (1195,1996,1997,1998);
/
-- QUERY 19
-- Create a matrix query to display the job, the salary for that job based on department number, and the total salary for that job, for departments 20, 50, 80, and 90, giving each column an appropriate heading.
SELECT J.JOB_TITLE AS JOB,
  SUM(SALARY) "JOB SALARY",
  SUM(DECODE (DEPARTMENT_ID, 20, SALARY)) "DEPT 20 SAL",
  SUM(DECODE (DEPARTMENT_ID, 50, SALARY)) "DEPT 50 SAL",
  SUM(DECODE (DEPARTMENT_ID, 80, SALARY)) "DEPT 80 SAL",
  SUM(DECODE (DEPARTMENT_ID, 90, SALARY)) "DEPT 90 SAL"
FROM EMPLOYEES E
JOIN JOBS J
ON J.JOB_ID = E.JOB_ID
GROUP BY J.JOB_TITLE;
/
-- QUERY 20
-- Write a query that displays the employee numbers and last names of all employees who work in a department with any employee whose last name contains a “u”.
SELECT EMPLOYEE_ID,
  LAST_NAME
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN
  (SELECT DEPARTMENT_ID FROM EMPLOYEES WHERE LAST_NAME LIKE '%U%'
  )
ORDER BY EMPLOYEE_ID;
/
-- QUERY 21
-- Write a query to display the last name, department number, and salary of any employee whose department number and salary both match the department number and salary of any employee who earns a commission.
SELECT LAST_NAME,
  DEPARTMENT_ID,
  SALARY
FROM EMPLOYEES
WHERE (SALARY, DEPARTMENT_ID) IN
  (SELECT SALARY,
    DEPARTMENT_ID
  FROM EMPLOYEES
  WHERE COMMISSION_PCT IS NOT NULL
  );
/
-- QUERY 22
-- Create a query to display the last name, hire date, and salary for all employees who have the same salary and commission as Kochhar.
SELECT LAST_NAME,
  HIRE_DATE,
  SALARY
FROM EMPLOYEES
WHERE (SALARY , NVL(COMMISSION_PCT,0)) IN
  (SELECT SALARY ,
    NVL(COMMISSION_PCT,0)
  FROM EMPLOYEES
  WHERE UPPER(LAST_NAME) = 'KOCHHAR'
  )
AND UPPER(LAST_NAME) != 'KOCHHAR';
/
-- QUERY 23
-- Write a query to find all employees who earn more than the average salary in their departments. Display last name, salary, department ID, and the average salary for the department. Sort by average salary. Use aliases for the columns retrieved by the query as shown in the sample output.
SELECT E.LAST_NAME "EMP NAME",
  E.SALARY "SALARY",
  E.DEPARTMENT_ID "DEPARTMENT ID",
  ROUND(AVG(A.SALARY),1) "DEPARTMENT AVERAGE SAL"
FROM EMPLOYEES E
JOIN EMPLOYEES A
ON E.DEPARTMENT_ID = A.DEPARTMENT_ID
WHERE E.SALARY     >
  (SELECT AVG(SALARY) FROM EMPLOYEES WHERE DEPARTMENT_ID = E.DEPARTMENT_ID
  )
GROUP BY E.LAST_NAME,
  E.SALARY,
  E.DEPARTMENT_ID
ORDER BY AVG(A.SALARY);
/