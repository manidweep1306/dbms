/*SQL Queries

SCHEMA:*/

create table dept(deptno number(2), dname  varchar2(20), loc  varchar2(15), constraint pk_dept primary key (deptno));
 
create table emp(empno  number(4), ename varchar2(10), job varchar2(9), mgr number(4), hiredate date, sal number(7,2), comm number(7,2), deptno number(2), constraint pk_emp primary key (empno), constraint fk_deptno foreign key (deptno) references dept (deptno));
 
insert into dept values(10, 'ACCOUNTING', 'NEW YORK');
insert into dept values(20, 'RESEARCH', 'DALLAS');
insert into dept values(30, 'SALES', 'CHICAGO');
insert into dept values(40, 'OPERATIONS', 'BOSTON');

insert into emp values(7839, 'KING', 'PRESIDENT', null, to_date('17-11-1981','dd-mm-yyyy'), 5000, null, 10);
insert into emp values(7698, 'BLAKE', 'MANAGER', 7839, to_date('1-5-1981','dd-mm-yyyy'), 2850, null, 30);
insert into emp values(7782, 'CLARK', 'MANAGER', 7839, to_date('9-6-1981','dd-mm-yyyy'), 2450, null, 10);
insert into emp values(7566, 'JONES', 'MANAGER', 7839, to_date('2-4-1981','dd-mm-yyyy'),  2975, null, 20);
insert into emp values(7788, 'SCOTT', 'ANALYST', 7566, to_date('13-7-1987','dd-mm-yyyy'), 3000, null, 20);
insert into emp values(7902, 'FORD', 'ANALYST', 7566, to_date('3-12-1981','dd-mm-yyyy'),  3000, null, 20);
insert into emp values(7369, 'SMITH', 'CLERK', 7902, to_date('17-12-1980','dd-mm-yyyy'), 800, null, 20);
insert into emp values(7499, 'ALLEN', 'SALESMAN', 7698, to_date('20-2-1981','dd-mm-yyyy'),1600, 300, 30);
insert into emp values(7521, 'WARD', 'SALESMAN', 7698, to_date('22-2-1981','dd-mm-yyyy'), 1250, 500, 30);
insert into emp values(7654, 'MARTIN', 'SALESMAN', 7698, to_date('28-9-1981','dd-mm-yyyy'), 1250, 1400, 30);
insert into emp values(7844, 'TURNER', 'SALESMAN', 7698, to_date('8-9-1981','dd-mm-yyyy'), 1500, null, 30);
insert into emp values(7876, 'ADAMS', 'CLERK', 7788, to_date('13-7-1987', 'dd-mm-yyyy'), 1100, null, 20);
insert into emp values(7900, 'JAMES', 'CLERK', 7698, to_date('3-12-1981','dd-mm-yyyy'), 950, null, 30);
insert into emp values(7934, 'MILLER', 'CLERK', 7782, to_date('23-1-1982','dd-mm-yyyy'),1300, null, 10);


--Write SQL Queries for the following:

--1) Display all the records in emp table.
select *  
From emp;

/*output:

	EMPNO	ENAME	JOB		MGR	HIREDATE	SAL	COMM	DEPTNO
	7839	KING	PRESIDENT	 - 	17-NOV-81	5000	 - 	10
	7698	BLAKE	MANAGER		7839	01-MAY-81	2850	 - 	30
	7782	CLARK	MANAGER		7839	09-JUN-81	2450	 - 	10
	7566	JONES	MANAGER		7839	02-APR-81	2975	 - 	20
	7788	SCOTT	ANALYST		7566	13-JUL-87	3000	 - 	20
	7902	FORD	ANALYST		7566	03-DEC-81	3000	 - 	20
	7369	SMITH	CLERK		7902	17-DEC-80	800	 - 	20
	7499	ALLEN	SALESMAN	7698	20-FEB-81	1600	300	30
	7521	WARD	SALESMAN	7698	22-FEB-81	1250	500	30
	7654	MARTIN	SALESMAN	7698	28-SEP-81	1250	1400	30
	7844	TURNER	SALESMAN	7698	08-SEP-81	1500	 - 	30
	7876	ADAMS	CLERK		7788	13-JUL-87	1100	 - 	20
	7900	JAMES	CLERK		7698	03-DEC-81	950	 - 	30
	7934	MILLER	CLERK		7782	23-JAN-82	1300	 - 	10
*/	
--2) Display all the records in emp table where employee belongs to deptno 10.
select *  
From emp 
Where deptno = 10;

/*output:
	EMPNO	ENAME	JOB		MGR	HIREDATE	SAL	COMM	DEPTNO
	7839	KING	PRESIDENT	 - 	17-NOV-81	5000	 - 	10
	7782	CLARK	MANAGER		7839	09-JUN-81	2450	 - 	10
	7934	MILLER	CLERK		7782	23-JAN-82	1300	 - 	10
*/

--3) Display all the records in emp table where employee does not belong to deptno 30.
select *  
From emp 
Where deptno <> 30

/*otput:
	EMPNO	ENAME	JOB		MGR	HIREDATE	SAL	COMM	DEPTNO
	7839	KING	PRESIDENT	 - 	17-NOV-81	5000	 - 	10
	7782	CLARK	MANAGER		7839	09-JUN-81	2450	 - 	10
	7566	JONES	MANAGER		7839	02-APR-81	2975	 - 	20
	7788	SCOTT	ANALYST		7566	13-JUL-87	3000	 - 	20
	7902	FORD	ANALYST		7566	03-DEC-81	3000	 - 	20
	7369	SMITH	CLERK		7902	17-DEC-80	800	 - 	20
	7876	ADAMS	CLERK		7788	13-JUL-87	1100	 - 	20
	7934	MILLER	CLERK		7782	23-JAN-82	1300	 - 	10
*/
	
--4) Display total number of records in Emp table.
select count(*) 
From emp;

/*output:
	COUNT(*)
	14
*/

--5) Display emp table with salary descending order.
select * 
From emp 
order by sal desc
/*output:
	EMPNO	ENAME	JOB		MGR	HIREDATE	SAL	COMM	DEPTNO
	7839	KING	PRESIDENT	 - 	17-NOV-81	5000	 - 	10
	7788	SCOTT	ANALYST		7566	13-JUL-87	3000	 - 	20
	7902	FORD	ANALYST		7566	03-DEC-81	3000	 - 	20
	7566	JONES	MANAGER		7839	02-APR-81	2975	 - 	20
	7698	BLAKE	MANAGER		7839	01-MAY-81	2850	 - 	30
	7782	CLARK	MANAGER		7839	09-JUN-81	2450	 - 	10
	7499	ALLEN	SALESMAN	7698	20-FEB-81	1600	300	30
	7844	TURNER	SALESMAN	7698	08-SEP-81	1500	 - 	30
	7934	MILLER	CLERK		7782	23-JAN-82	1300	 - 	10
	7654	MARTIN	SALESMAN	7698	28-SEP-81	1250	1400	30
	7521	WARD	SALESMAN	7698	22-FEB-81	1250	500	30
	7876	ADAMS	CLERK		7788	13-JUL-87	1100	 - 	20
	7900	JAMES	CLERK		7698	03-DEC-81	950	 - 	30
	7369	SMITH	CLERK		7902	17-DEC-80	800	 - 	20
*/
	
--6) Display first five records in employee table.
select *
from emp
where rownum < 6;

   --or 

select *
from emp
fetch first 5 rows only;

/*output:
	EMPNO	ENAME	JOB		MGR	HIREDATE	SAL	COMM	DEPTNO
	7839	KING	PRESIDENT	 - 	17-NOV-81	5000	 - 	10
	7698	BLAKE	MANAGER		7839	01-MAY-81	2850	 - 	30
	7782	CLARK	MANAGER		7839	09-JUN-81	2450	 - 	10
	7566	JONES	MANAGER		7839	02-APR-81	2975	 - 	20
	7788	SCOTT	ANALYST		7566	13-JUL-87	3000	 - 	20
*/

--7) Display all the records in emp table order by ascending deptno, descending salary.
select * 
From emp 
order by deptno ,sal desc

/*output:
	EMPNO	ENAME	JOB		MGR	HIREDATE	SAL	COMM	DEPTNO
	7839	KING	PRESIDENT	 - 	17-NOV-81	5000	 - 	10
	7782	CLARK	MANAGER		7839	09-JUN-81	2450	 - 	10
	7934	MILLER	CLERK		7782	23-JAN-82	1300	 - 	10
	7788	SCOTT	ANALYST		7566	13-JUL-87	3000	 - 	20
	7902	FORD	ANALYST		7566	03-DEC-81	3000	 - 	20
	7566	JONES	MANAGER		7839	02-APR-81	2975	 - 	20
	7876	ADAMS	CLERK		7788	13-JUL-87	1100	 - 	20
	7369	SMITH	CLERK		7902	17-DEC-80	800	 - 	20
	7698	BLAKE	MANAGER		7839	01-MAY-81	2850	 - 	30
	7499	ALLEN	SALESMAN	7698	20-FEB-81	1600	300	30
	7844	TURNER	SALESMAN	7698	08-SEP-81	1500	 - 	30
	7521	WARD	SALESMAN	7698	22-FEB-81	1250	500	30
	7654	MARTIN	SALESMAN	7698	28-SEP-81	1250	1400	30
	7900	JAMES	CLERK		7698	03-DEC-81	950	 - 	30
*/
	
--8) Display all employees those who were joined in year 1981.
select * 
From emp 
where hiredate between '01-Jan-1981' and '01-Jan-1982'

/*output:
	EMPNO	ENAME	JOB		MGR	HIREDATE	SAL	COMM	DEPTNO
	7839	KING	PRESIDENT	 - 	17-NOV-81	5000	 - 	10
	7698	BLAKE	MANAGER		7839	01-MAY-81	2850	 - 	30
	7782	CLARK	MANAGER		7839	09-JUN-81	2450	 - 	10
	7566	JONES	MANAGER		7839	02-APR-81	2975	 - 	20
	7902	FORD	ANALYST		7566	03-DEC-81	3000	 - 	20
	7499	ALLEN	SALESMAN	7698	20-FEB-81	1600	300	30
	7521	WARD	SALESMAN	7698	22-FEB-81	1250	500	30
	7654	MARTIN	SALESMAN	7698	28-SEP-81	1250	1400	30
	7844	TURNER	SALESMAN	7698	08-SEP-81	1500	 - 	30
	7900	JAMES	CLERK		7698	03-DEC-81	950	 - 	30
*/
--9) Display employee information who don’

--10) Display the records in emp table where MGR in 7698 or 7566 and salary above 1500
select * 
from emp 
WHERE MGR = 7698 or mgr = 7566 AND SAL > 1500

/*output:
	EMPNO	ENAME	JOB		MGR	HIREDATE	SAL	COMM	DEPTNO
	7788	SCOTT	ANALYST		7566	13-JUL-87	3000	 - 	20
	7902	FORD	ANALYST		7566	03-DEC-81	3000	 - 	20
	7499	ALLEN	SALESMAN	7698	20-FEB-81	1600	300	30
	7521	WARD	SALESMAN	7698	22-FEB-81	1250	500	30
	7654	MARTIN	SALESMAN	7698	28-SEP-81	1250	1400	30
	7844	TURNER	SALESMAN	7698	08-SEP-81	1500	 - 	30
	7900	JAMES	CLERK		7698	03-DEC-81	950	 - 	30
*/
	
--11) Display all employees where their salary is less then the Ford’s salary?
select ename
from emp
where sal < (select sal 
    		    from emp
    		    where ename = 'FORD');
/*output:
	EMPNO	ENAME	JOB		MGR	HIREDATE	SAL	COMM	DEPTNO
	7698	BLAKE	MANAGER		7839	01-MAY-81	2850	 - 	30
	7782	CLARK	MANAGER		7839	09-JUN-81	2450	 - 	10
	7566	JONES	MANAGER		7839	02-APR-81	2975	 - 	20
	7369	SMITH	CLERK		7902	17-DEC-80	800	 - 	20
	7499	ALLEN	SALESMAN	7698	20-FEB-81	1600	300	30
	7521	WARD	SALESMAN	7698	22-FEB-81	1250	500	30
	7654	MARTIN	SALESMAN	7698	28-SEP-81	1250	1400	30
	7844	TURNER	SALESMAN	7698	08-SEP-81	1500	 - 	30
	7876	ADAMS	CLERK		7788	13-JUL-87	1100	 - 	20
	7900	JAMES	CLERK		7698	03-DEC-81	950	 - 	30
	7934	MILLER	CLERK		7782	23-JAN-82	1300	 - 	10

	ENAME
	BLAKE
	CLARK
	JONES
	SMITH
	ALLEN
	WARD
	MARTIN
	TURNER
	ADAMS
	JAMES
	MILLER

	*/

--12) Display all the records in EMP table along with the rowed.
select rownum SNo,emp.*
from emp;

/*output:
	ROWNUM	EMPNO	ENAME	JOB		MGR	HIREDATE	SAL	COMM	DEPTNO
	1	7839	KING	PRESIDENT	 - 	17-NOV-81	5000	 - 	10
	2	7698	BLAKE	MANAGER		7839	01-MAY-81	2850	 - 	30
	3	7782	CLARK	MANAGER		7839	09-JUN-81	2450	 - 	10
	4	7566	JONES	MANAGER		7839	02-APR-81	2975	 - 	20
	5	7788	SCOTT	ANALYST		7566	13-JUL-87	3000	 - 	20
	6	7902	FORD	ANALYST		7566	03-DEC-81	3000	 - 	20
	7	7369	SMITH	CLERK		7902	17-DEC-80	800	 - 	20
	8	7499	ALLEN	SALESMAN	7698	20-FEB-81	1600	300	30
	9	7521	WARD	SALESMAN	7698	22-FEB-81	1250	500	30
	10	7654	MARTIN	SALESMAN	7698	28-SEP-81	1250	1400	30
	11	7844	TURNER	SALESMAN	7698	08-SEP-81	1500	 - 	30
	12	7876	ADAMS	CLERK		7788	13-JUL-87	1100	 - 	20
	13	7900	JAMES	CLERK		7698	03-DEC-81	950	 - 	30
	14	7934	MILLER	CLERK		7782	23-JAN-82	1300	 - 	10
	*/

--13) Write a query to display current date.

--14) Display distinct job from emp table.
select distinct job
from emp;

/*output:
	JOB
	ANALYST
	CLERK
	SALESMAN
	MANAGER
	PRESIDENT
*/

--15) Write a query that displays the employee’s names with the first letter capitalized and all other letters lowercase for all employees whose name starts with J, A, or M.
select upper(substr(ename,1,1)) || lower(substr(ename,2)) as name
from emp
where ename like 'J%' or ename like 'A%' or ename like 'M%';
		--or
SELECT initcap(ename)  
FROM EMP 
WHERE ENAME LIKE 'A%' OR ENAME LIKE 'J%' OR ENAME LIKE 'M%'

/*ouput:
	UPPER(SUBSTR(ENAME,1,1))||LOWER(SUBSTR(ENAME,2,11))
	Jones
	Allen
	Martin
	Adams
	James
	Miller
*/
	
--16) Write a query to display the employee name, department name of all employees who earn a commission.
select ename, dname
from emp e,dept d
where e.deptno = d.deptno and comm is not null;
/*output:
	ENAME	DNAME
	ALLEN	SALES
	WARD	SALES
	MARTIN	SALES
*/

--17) Display the empno, ename, sal, and salary increased by 15%.
select empno,ename,sal, sal * 1.15 as incriment
from emp;

/*output:
	EMPNO	ENAME	SAL	INCRIMENT
	7839	KING	5000	5750
	7698	BLAKE	2850	3277.5
	7782	CLARK	2450	2817.5
	7566	JONES	2975	3421.25
	7788	SCOTT	3000	3450
	7902	FORD	3000	3450
	7369	SMITH	800	920
	7499	ALLEN	1600	1840
	7521	WARD	1250	1437.5
	7654	MARTIN	1250	1437.5
	7844	TURNER	1500	1725
	7876	ADAMS	1100	1265
	7900	JAMES	950	1092.5
	7934	MILLER	1300	1495
*/

--18) Display employee names and corresponding manager names
select emp.ename employee, mng.ename manager
from emp , emp mng
where emp.mgr = mng.empno;

/*output:
      EMPLOYEE	MANAGER
	BLAKE	KING
	CLARK	KING
	JONES	KING
	ALLEN	BLAKE
	WARD	BLAKE
	MARTIN	BLAKE
	TURNER	BLAKE
	JAMES	BLAKE
	MILLER	CLARK
	SCOTT	JONES
	FORD	JONES
	ADAMS	SCOTT
	SMITH	FORD
*/
	
--19) Display all the departments where employee salary greater than average salary of that department.
SELECT DISTINCT DNAME
FROM DEPT NATURAL JOIN EMP
WHERE SAL > ANY(SELECT AVG(SAL)
    		FROM EMP
    		GROUP BY DNAME);

/*output:
	DNAME
	ACCOUNTING
	SALES
	ACCOUNTING
	RESEARCH
	RESEARCH
	RESEARCH
	*/

--20) Display employees where length of ename is 5
select ename
from emp
where length(ename) = 5;

/*output:
	ENAME
	BLAKE
	CLARK
	JONES
	SCOTT
	SMITH
	ALLEN
	ADAMS
	JAMES
*/

--21) Display all employees where ename start with J and ends with S
select ename
from emp
where upper(ename) like 'J%S';

/*output:
	ENAME
	JONES
	JAMES
*/

--22) Display all employees where employee does not belong to 10,20,40
select *
from emp
where deptno<>10 and deptno<>20 and deptno<>40;

/*output:
	ENAME
	BLAKE
	ALLEN
	WARD
	MARTIN
	TURNER
	JAMES

*/

--23) Display all employees where jobs does not belong to PRESIDENT and MANAGER.
select *
from emp
where job not in ('PRESIDENT', 'MANAGER');

/*output:
	ENAME
	SCOTT
	FORD
	SMITH
	ALLEN
	WARD
	MARTIN
	TURNER
	ADAMS
	JAMES
	MILLER
*/

--24) Display the maximum salary in the emp table
select MAX(SAL) as max
from emp;

/*output:
	MAX(SAL)
	5000
*/

--25) Display average salary for job SALESMAN
select avg(SAL) as avearge
from emp
where job = 'SALESMAN';

/*output:
	AVG(SAL)
 	1400
*/

--26) Display all ename where first character could be anything, but second character should be L.
SELECT ENAME
FROM EMP
WHERE ENAME like '_L%';

/*output:
	ENAME
	BLAKE
	CLARK
	ALLEN
*/

--27) Display nth highest and nth lowest salary in emp table.


--28) Display all the departments where department has 3 employees.
select dname
from emp natural join dept
group by dname
having count(empno) = 3;

/*output:
	DNAME
	ACCOUNTING
*/

--29) Display sum of salary for each department.
select dept.dname, COALESCE(sum(emp.sal),0) "TOTAL SALARY"
from emp right join dept
    on dept.deptno = emp.deptno
group by dept.dname;

/*output:
	DNAME	     TOTAL SALARY
	RESEARCH	10875
	SALES		9400
	ACCOUNTING	8750
	OPERATIONS	0
*/

--30) Display all department with Minimum salary and maximum salary?

select dname, min(sal) as minimum, max(sal) as maximum
from dept natural join emp
group by dname;

/*output:
	DNAME		MINIMUM		MAXIMUM
	RESEARCH	800		3000
	SALES	950	2850
	ACCOUNTING	1300		5000
*/

--31) Display all ename, empno, dname, loc from emp, dept table.

select ename, empno, dname, loc 
from emp natural join dept;

/*output:
	ENAME	EMPNO	DNAME		LOC
	KING	7839	ACCOUNTING	NEW YORK
	BLAKE	7698	SALES		CHICAGO
	CLARK	7782	ACCOUNTING	NEW YORK
	JONES	7566	RESEARCH	DALLAS
	SCOTT	7788	RESEARCH	DALLAS
	FORD	7902	RESEARCH	DALLAS
	SMITH	7369	RESEARCH	DALLAS
	ALLEN	7499	SALES		CHICAGO
	WARD	7521	SALES		CHICAGO
	MARTIN	7654	SALES		CHICAGO
	TURNER	7844	SALES		CHICAGO
	ADAMS	7876	RESEARCH	DALLAS
	JAMES	7900	SALES		CHICAGO
	MILLER	7934	ACCOUNTING	NEW YORK
*/

--32) Display all the departments where department does not have any employees
select dname 
from dept 
where deptno in (select deptno from dept 
				minus
				select deptno from emp)

/*output:	
	  DNAME
	OPERATIONS
*/

--33) Display all the departments where department does have atleast one employee
select dname 
from dept 
where deptno in (select distinct deptno from emp);

/*output:
	DNAME
	ACCOUNTING
	SALES
	RESEARCH
*/

--34) Display all employees those who are not managers.
select ename
from emp
where empno not in (select distinct mgr
				from emp
    where mgr is not null);

/*output:
	ENAME
	ADAMS
	WARD
	ALLEN
	JAMES
	SMITH
	MILLER
	MARTIN
	TURNER
*/

--35) Display ename, deptno from emp table with format of {ename} belongs to {deptno}
SELECT ename || ' belongs to ' || deptno as works
FROM emp;

/*output:
		WORKS
	KING belongs to 10
	BLAKE belongs to 30
	CLARK belongs to 10
	JONES belongs to 20
	SCOTT belongs to 20
	FORD belongs to 20
	SMITH belongs to 20
	ALLEN belongs to 30
	WARD belongs to 30
	MARTIN belongs to 30
	TURNER belongs to 30
	ADAMS belongs to 20
	JAMES belongs to 30
	MILLER belongs to 10
*/

--36) Display all the records in emp table. The ename should be lower case. The job first character should be upper case and rest of the character in job field should be lower case.
select ename,initcap(job) as job
from emp;

/*output:
	ENAME	JOB
	KING	President
	BLAKE	Manager
	CLARK	Manager
	JONES	Manager
	SCOTT	Analyst
	FORD	Analyst
	SMITH	Clerk
	ALLEN	Salesman
	WARD	Salesman
	MARTIN	Salesman
	TURNER	Salesman
	ADAMS	Clerk
	JAMES	Clerk
	MILLER	Clerk
*/

--37) Create table emp1 and copy the emp table for deptno 10 while creating the table
create table emp1 as 
select * from emp;

/*output:
	Table created.
*/

--38) Create table emp2 with same structure of emp table. Do not copy the data
create table emp2 as 
select * from emp
    where 1 = 0;

/*output:
	Table created.
*/

--39) Display all the records for deptno which belongs to employee name JAMES.
select *
from emp
where deptno = (select deptno 
    from emp
    where ename = 'JAMES');

/*output:
	EMPNO	ENAME	JOB		MGR	HIREDATE	SAL	COMM	DEPTNO
	7698	BLAKE	MANAGER		7839	01-MAY-81	2850	 - 	30
	7499	ALLEN	SALESMAN	7698	20-FEB-81	1600	300	30
	7521	WARD	SALESMAN	7698	22-FEB-81	1250	500	30
	7654	MARTIN	SALESMAN	7698	28-SEP-81	1250	1400	30
	7844	TURNER	SALESMAN	7698	08-SEP-81	1500	 - 	30
	7900	JAMES	CLERK		7698	03-DEC-81	950	 - 	30
*/

--40) Display all the records in emp table where salary should be less than or equal to ADAMS salary.
select *
from emp
where sal <= (select sal 
    from emp
    where ename = 'ADAMS');

/*output:
	EMPNO	ENAME	JOB	MGR	HIREDATE	SAL	COMM	DEPTNO
	7369	SMITH	CLERK	7902	17-DEC-80	800	 - 	20
	7876	ADAMS	CLERK	7788	13-JUL-87	1100	 - 	20
	7900	JAMES	CLERK	7698	03-DEC-81	950	 - 	30
*/

--41) Display all subordinate those who are working under BLAKE.
select * from emp
where mgr = (select empno from emp where ename ='BLAKE');
/*output:
	EMPNO	ENAME	JOB		MGR	HIREDATE	SAL	COMM	DEPTNO
	7499	ALLEN	SALESMAN	7698	20-FEB-81	1600	300	30
	7521	WARD	SALESMAN	7698	22-FEB-81	1250	500	30
	7654	MARTIN	SALESMAN	7698	28-SEP-81	1250	1400	30
	7844	TURNER	SALESMAN	7698	08-SEP-81	1500	 - 	30
	7900	JAMES	CLERK	7	698	03-DEC-81	950	 - 	30
*/

--42) Display who is making highest commission.
select *
from emp
where comm =(select MAX(comm)
    		from emp);

/*output:
	EMPNO	ENAME	JOB		MGR	HIREDATE	SAL	COMM	DEPTNO
	7654	MARTIN	SALESMAN	7698	28-SEP-81	1250	1400	30
*/

--43) Display ename, sal, grade, dname, loc for each employee.


--44) Display all employee whose location is DALLAS.
select *
from emp natural join dept
where loc = 'DALLAS';

/*output:
	DEPTNO	EMPNO	ENAME	 JOB	MGR	HIREDATE	SAL	COMM	 DNAME		LOC
	20	7566	JONES	MANAGER	7839	02-APR-81	2975	 - 	RESEARCH	DALLAS
	20	7788	SCOTT	ANALYST	7566	13-JUL-87	3000	 - 	RESEARCH	DALLAS
	20	7902	FORD	ANALYST	7566	03-DEC-81	3000	 - 	RESEARCH	DALLAS
	20	7369	SMITH	CLERK	7902	17-DEC-80	800	 - 	RESEARCH	DALLAS
	20	7876	ADAMS	CLERK	7788	13-JUL-87	1100	 - 	RESEARCH	DALLAS
*/

--45) Delete emp records for detpno 10 and 20.

--46) Delete all employees those are not getting any commission.
delete 
from emp 
where comm is null

/*output:
11 row(s) deleted.
*/
	
--47) Delete the employees where employee salary is greater than average salary of his/her department.
delete from emp
where sal > (select avg(sal) 
    		from emp);

/*output:
1 row(s) deleted.
*/

--48) Rename the employee name JONES to ANDY
update emp
set ename = 'ANDY'
where ename = 'JONES';

/*output:
0 row(s) updated.
*/

--49) Increase the salary 5% for employee those who are earning commission less then 1000
update emp set sal = sal + sal * 0.05
where comm < 1000;

/*output:
1 row(s) updated.
*/

--50) Increase 100$ for employee who is making more then averge salary of his department.
UPDATE emp
SET sal = sal + 100
WHERE sal > (
    SELECT AVG(sal)
    FROM emp e
    WHERE e.deptno = emp.deptno
    GROUP BY deptno);

/*output:
1 row(s) updated.
*/

--51) Increase 1% salary for employee who is making lowest salary in dept 10
update emp set sal = sal*1.01
    where sal in (select min(sal) 
    			from emp 
    			where deptno = 10);

/*output:
0 row(s) updated.
*/

--52) Increase commission 10$ for employees those who are located in NEW YORK.
update emp set sal = sal + 10
where deptno in (select deptno
    from dept where loc = 'NEW YORK');

/*output:
0 row(s) updated.
*/
