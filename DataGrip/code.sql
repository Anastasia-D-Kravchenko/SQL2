-- Find all departments, employee names and employee numbers of their supervisors
SELECT e.deptno, e.ename AS employee_name, e.empno AS employee_number, s.ename AS supervisor_name, s.empno AS supervisor_number
FROM EMP e
         LEFT JOIN EMP s ON e.mgr = s.empno;

-- Print all values from all columns from table EMP
SELECT *
FROM EMP;

-- Calculate annual salary for each employee
SELECT ename, sal * 12 AS annual_salary
FROM EMP;

-- Display employee name and his annual salary assuming a raise of 250
SELECT ename, (sal + 250) * 12 AS annual_salary_with_raise
FROM EMP;

-- Display employee name and his annual salary. Change header of column to Annual
SELECT ename, sal * 12 AS Annual
FROM EMP;

-- Display employee name and his annual salary. Change header of column to Annual Salary
SELECT ename, sal * 12 AS "Annual Salary"
FROM EMP;

-- Display employee number and name as one column. Change its header to Hired
SELECT empno || ' - ' || ename AS Hired
FROM EMP;

-- Display information about each employee in one column in form:
-- "Employee with number [EMPNO] works in department [DEPTNO] and earns [SAL] per month"
-- Change header of column to Information about Employee
SELECT 'Employee with number ' || empno || ' works in department ' || deptno || ' and earns ' || sal || ' per month' AS "Information about Employee"
FROM EMP;

-- For each employee, display its name and annual earnings including commission
SELECT ename, (sal * 12) + COALESCE(comm, 0) AS annual_earnings_with_commission
FROM EMP;

-- Display all department numbers from table EMP
SELECT deptno
FROM EMP;

-- Display all department numbers from table EMP without repetition
SELECT DISTINCT deptno
FROM EMP;

-- Display all mutually different combinations of deptno and job from table EMP
SELECT DISTINCT deptno, job
FROM EMP;

-- Display all information from table EMP. Sort results ascending according to the value of column ename
SELECT *
FROM EMP
ORDER BY ename ASC;

-- Display all information from table EMP. Sort results descendig according to the hiredate
SELECT *
FROM EMP
ORDER BY hiredate DESC;

-- Display all information from table EMP. Sort results according to values in columns: deptno (ascending) and sal (descending)
SELECT *
FROM EMP
ORDER BY deptno ASC, sal DESC;
