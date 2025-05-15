select emp.*, dept.*
from emp, dept
where emp.deptno = dept.deptno;
select emp.*, dept.*
from emp
join dept on emp.deptno = dept.deptno;
select emp.ename, dept.dname
from emp
join dept on emp.deptno = dept.deptno
order by emp.ename;
select emp.empno, emp.ename, dept.dname
from emp
join dept on emp.deptno = dept.deptno;
select emp.ename, emp.job, dept.dname
from emp
join dept on emp.deptno = dept.deptno
where emp.sal > 1500;
select emp.ename, emp.job, emp.sal, salgrade.grade from emp 
join salgrade on emp.sal between salgrade.losal and salgrade.hisal;
select * from emp join salgrade on emp.sal between salgrade.losal and salgrade.hisal where salgrade.grade = 3;
select * from emp join dept on emp.deptno = dept.deptno where dept.LOC = 'DALLAS';
select emp.ename, dept.dname, salgrade.grade from emp 
join dept on emp.deptno = dept.deptno
join salgrade on emp.sal between salgrade.losal and salgrade.hisal;
select emp.empno, emp.ename, dept.dname from emp 
right join dept on emp.deptno = dept.deptno;
select emp.empno, emp.ename, dept.dname from emp 
left join dept on emp.deptno = dept.deptno;
select emp.ename, emp.deptno from emp where deptno in (20, 30);
select distinct emp.job from emp where deptno in (10, 30);
select distinct emp.job from emp where deptno = 10 or deptno = 30;
select distinct emp.job from emp where deptno = 10 and job not in (select distinct job from emp where deptno = 30);
select e1.ename, e1.sal from emp e1 
where e1.sal < (select e1.sal from emp e2 where e1.MGR = e2.empno);
select e1.ename, e2.ename from emp e1 
left join emp e2 on e1.MGR = e2.empno order by e2.ename;
