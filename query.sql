create table dept(deptno number(2), dname varchar2(20), loc varchar2(15), 
constraint pk_dept primary key (deptno));
create table emp(empno number(4), ename varchar2(10), job varchar2(9), mgr number(4),
hiredate date,
sal number(7,2), comm number(7,2), deptno number(2), constraint pk_emp primary key
(empno),
constraint fk_deptno foreign key (deptno) references dept (deptno));
insert into dept values(10, 'ACCOUNTING', 'NEW YORK');
insert into dept values(20, 'RESEARCH', 'DALLAS');
insert into dept values(30, 'SALES', 'CHICAGO');
insert into dept values(40, 'OPERATIONS', 'BOSTON');
insert into emp values(7839, 'KING', 'PRESIDENT', null, to_date('17-11-1981','dd-mm-
yyyy'), 5000, null, 10);
insert into emp values(7698, 'BLAKE', 'MANAGER', 7839, to_date('1-5-1981','dd-mm-yyyy'),
2850, null, 30);
insert into emp values(7782, 'CLARK', 'MANAGER', 7839, to_date('9-6-1981','dd-mm-yyyy'),
2450, null, 10);
insert into emp values(7566, 'JONES', 'MANAGER', 7839, to_date('2-4-1981','dd-mm-yyyy'), 
2975, null, 20);
insert into emp values(7788, 'SCOTT', 'ANALYST', 7566, to_date('13-7-1987','dd-mm-yyyy'),
3000, null, 20);
insert into emp values(7902, 'FORD', 'ANALYST', 7566, to_date('3-12-1981','dd-mm-yyyy'), 
3000, null, 20);
insert into emp values(7369, 'SMITH', 'CLERK', 7902, to_date('17-12-1980','dd-mm-yyyy'),
800, null, 20);
insert into emp values(7499, 'ALLEN', 'SALESMAN', 7698, to_date('20-2-1981','dd-mm-
yyyy'),1600, 300, 30);
insert into emp values(7521, 'WARD', 'SALESMAN', 7698, to_date('22-2-1981','dd-mm-yyyy'),
1250, 500, 30);
insert into emp values(7654, 'MARTIN', 'SALESMAN', 7698, to_date('28-9-1981','dd-mm-
yyyy'), 1250, 1400, 30);
insert into emp values(7844, 'TURNER', 'SALESMAN', 7698, to_date('8-9-1981','dd-mm-yyyy'),
1500, null, 30);
insert into emp values(7876, 'ADAMS', 'CLERK', 7788, to_date('13-7-1987', 'dd-mm-yyyy'),
1100, null, 20);
insert into emp values(7900, 'JAMES', 'CLERK', 7698, to_date('3-12-1981','dd-mm-yyyy'),
950, null, 30);
insert into emp values(7934, 'MILLER', 'CLERK', 7782, to_date('23-1-1982','dd-mm-
yyyy'),1300, null, 10);

select * from dept;
select * from emp ;
--1st query
select * from emp where deptno=10;
select * from emp where deptno<>30;
select count(*) from emp;
select * from emp order by sal desc;
select * from emp where rownum<6;
select * from emp order by deptno,sal desc;
select * from emp where EXTRACT(YEAR FROM hiredate)=1981;
select * from emp where mgr is null;
select * from emp where mgr in (7698,7566) and sal>1500;
select * from emp where sal<(select sal from emp where ename='FORD');
select rowid,emp.* from emp;
select CURRENT_DATE,sysdate from dual;
select initcap(ename) from emp where ename like 'J_%' or ename like 'A_%' or ename like 'M_%';
select ename,dname from emp,dept where comm is not null and emp.deptno=dept.deptno;
select empno,ename,sal,sal+(sal*0.15) as Increased_Sal_by15PERC from emp;
select e1.ename ,e2.ename from emp e1 join emp e2 on e1.mgr=e2.empno;
select dname,ename,e1.sal as emp_sal,avg_sal from emp e1 natural join dept natural join(select deptno,avg(sal) as avg_sal from emp group by deptno) e2 where e1.sal>e2.avg_Sal;
select ename from emp where length(ename)=5;
select ename from emp where ename like 'J%S';
select * from emp where deptno not in(10,20,40);
select * from emp where job not in('PRESIDENT','MANAGER');
--start from 23rd question 
SELECT MAX(SAL) FROM EMP;
select avg(sal) from emp group by job having job='SALESMAN';
SELECT AVG(sal) from emp where job='SALESMAN';
SELECT max(sal) HIGHEST,MIN(sal) LOWEST from emp; 
select dname from dept where deptno in (select deptno from emp group by deptno having count(*)=3 );
select deptno,dname,sum(sal) from emp natural join dept group by deptno,dname order by deptno;
select ename from emp where ename like '_L%';
select ename,empno,dname,loc from emp natural join dept;
select dname from dept where deptno not in (select distinct deptno from emp);
select dname from dept where deptno in (select distinct deptno from emp);
select ename from emp where job <>'MANAGER';
SELECT ename || ' belongs to '|| deptno formatted_output from emp;
select lower(ename) ename,initcap(job) job from emp;
create table emp1 as (select * from emp where deptno = 10);
select * from emp1;
create table emp2 as (select * from emp where 1=2);
select * from emp2;
desc emp2;
select * from emp natural join dept where dname in (select dname from emp natural join dept where ename='JAMES');
select * from emp where sal <= ANY (select sal from emp where ename='ADAMS');
SELECT * FROM EMP WHERE mgr IN (select empno from emp where ename='BLAKE');
SELECT * FROM EMP WHERE COMM = ( SELECT MAX(COMM) FROM EMP);
SELECT ENAME,SAL,DNAME,LOC FROM EMP NATURAL JOIN DEPT;
SELECT * FROM EMP NATURAL JOIN DEPT WHERE LOC='DALLAS';
DELETE FROM EMP WHERE DEPTNO IN (10,20);
SELECT * FROM EMP;
DELETE FROM EMP WHERE COMM IS NULL;
SELECT * FROM EMP;
update emp set ename='ANDY' where ename='JONES';
SELECT * FROM EMP;
update emp set sal=sal+(sal*0.05) where comm<1000;
SELECT * FROM EMP;
update emp set sal=sal+100 where sal>(select avg(sal) from emp where deptno=emp.deptno);
SELECT * FROM EMP;
update emp set sal=sal+(sal*0.01) where sal=(select min(sal) from emp where deptno=10);
SELECT * FROM EMP;
update emp set comm=comm+10 where deptno in(select deptno from dept where loc='NEW YORK');
SELECT * FROM EMP;
delete from emp where sal>(select avg(sal) from emp where deptno=emp.deptno);
SELECT * FROM EMP;
50sql.sql
Displaying 50sql.sql.
