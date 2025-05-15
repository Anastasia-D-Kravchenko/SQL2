-- 1. Find all employees with salary equal to lowest salary in company
SELECT * FROM EMP WHERE SAL = (SELECT MIN(SAL) FROM EMP);

-- 2. Find all employees that have the same job as BLAKE
SELECT * FROM EMP WHERE JOB = (SELECT JOB FROM EMP WHERE ENAME = 'BLAKE');

-- 3. Find all employees with salary equal to lowest salary in each department
SELECT * FROM EMP E1 WHERE SAL = (SELECT MIN(SAL) FROM EMP E2 WHERE E1.DEPTNO = E2.DEPTNO);

-- 4. Find employees with salary equal to lowest salary in departments they work in
SELECT * FROM EMP E1 WHERE SAL = (SELECT MIN(SAL) FROM EMP E2 WHERE E1.DEPTNO = E2.DEPTNO);

-- 5. Using ANY, find employees with salary greater than lowest salary in department 30
SELECT * FROM EMP WHERE SAL > ANY (SELECT SAL FROM EMP WHERE DEPTNO = 30);

-- 6. Using ALL, find employees with salary greater than every salary in department 30
SELECT * FROM EMP WHERE SAL > ALL (SELECT SAL FROM EMP WHERE DEPTNO = 30);

-- 7. Find employees with salary greater than lowest salary in department 30 (without ANY)
SELECT * FROM EMP WHERE SAL > (SELECT MIN(SAL) FROM EMP WHERE DEPTNO = 30);

-- 8. Find employees with salary greater than every salary in department 30 (without ALL)
SELECT * FROM EMP WHERE SAL > (SELECT MAX(SAL) FROM EMP WHERE DEPTNO = 30);

-- 9. Find departments with average salary greater than average salary of department 30
SELECT DEPTNO FROM EMP GROUP BY DEPTNO HAVING AVG(SAL) > (SELECT AVG(SAL) FROM EMP WHERE DEPTNO = 30);

-- 10. Find job with highest average salary
SELECT JOB FROM EMP GROUP BY JOB ORDER BY AVG(SAL) DESC FETCH FIRST 1 ROWS ONLY;

-- 11. Find employees with salary lower than highest salary in SALES (department)
SELECT * FROM EMP WHERE SAL < (SELECT MAX(SAL) FROM EMP WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE DNAME = 'SALES'));

-- 12. Find employees with salary equal to lowest salary in their departments (correlated subquery)
SELECT * FROM EMP E1 WHERE SAL = (SELECT MIN(SAL) FROM EMP E2 WHERE E1.DEPTNO = E2.DEPTNO);

-- 13. Using EXISTS, find employees who have subordinates (correlated subquery)
SELECT * FROM EMP E1 WHERE EXISTS (SELECT 1 FROM EMP E2 WHERE E1.EMPNO = E2.MGR);

-- 14. Find employees whose department does not appear in DEPT table
SELECT * FROM EMP WHERE DEPTNO NOT IN (SELECT DEPTNO FROM DEPT);

-- 15. For each department find recently hired employees. Sort by hire date
SELECT * FROM EMP E1 WHERE HIREDATE = (SELECT MAX(HIREDATE) FROM EMP E2 WHERE E1.DEPTNO = E2.DEPTNO) ORDER BY HIREDATE;

-- 16. Find departments with no employees (using SUBQUERY) (correlated subquery)
SELECT DEPTNO FROM DEPT WHERE NOT EXISTS (SELECT 1 FROM EMP WHERE EMP.DEPTNO = DEPT.DEPTNO);

-- 17. Write a query that returns the percentage share of the number of employees in each department
SELECT DEPTNO, COUNT(*) * 100.0 / (SELECT COUNT(*) FROM EMP) AS percentage_share FROM EMP GROUP BY DEPTNO;
