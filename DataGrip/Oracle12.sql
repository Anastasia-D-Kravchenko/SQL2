select AVG(sal) from emp;
select MIN(sal) from emp where job = 'CLERK';
select count(*) from emp where deptno = 20;
select job, AVG(sal) from emp group by job;
select job, AVG(sal) from emp where job != 'MANAGER' group by job;
select deptno, job, AVG(sal) from emp group by deptno, job;
select job, MAX(sal) from emp group by job;
select deptno, AVG(sal) 
from emp 
group by deptno 
having count(*) >= 3;
select job, AVG(sal)
from emp 
group by job 
having AVG(sal) > 3000;
select job, AVG(sal), 
       AVG(sal + NVL(comm, 0) * 12)
from emp group by job;
select deptno from emp group by deptno having count(*) >= 3;
select count(distinct empno), count(*) from emp;
select e1.ename, e2.ename, e2.sal 
from emp e1 
join emp e2 on e1.empno = e2.mgr
where e1.job = 'MANAGER' 
order by e2.sal;
select count(*)
from emp e 
join dept d on e.deptno = d.deptno 
where d.location = 'DALLAS';
select s.grade, MAX(e.sal) 
from emp e
join salgrade s on e.sal between s.losal and s.hisal
group by s.grade;
select sal, count(*) 
from emp 
group by sal 
having count(*) > 1;
select AVG(e.sal) 
from emp e
join salgrade s on e.sal between s.losal and s.hisal
where s.grade = 2;
select e1.ename, count(e2.empno)
from emp e1 
left join emp e2 on e1.empno = e2.mgr 
group by e1.ename;
select SUM(e.sal) 
from emp e
join salgrade s on e.sal between s.losal and s.hisal
where s.grade = 1;
