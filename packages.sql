create or replace package hema_438 as
procedure addition(a in number, b in number,  c out number) ;
procedure subtraction(a in number, b in number,c out number);
end hema_438;

create or replace package body hema_438 as
procedure addition(a in number, b in number,  c out number) is
begin 
c:=a+b;
dbms_output.put_line('The sum of given two numbers is ' || c);
end addition;
procedure subtraction(a in number, b in number, c out number) is
begin
c:=a-b;
dbms_output.put_line('The difference between given two numbers is ' || c);
end subtraction;
end hema_438;

set serveroutput on;
declare
n1 number:=&num1;
n2 number:=&num2;
a number;
s number;
begin
hema_438.addition(n1,n2,a);
hema_438.subtraction(n1,n2,s);
end;

create or replace package sri_438 as
procedure insert_emp(eno in emp1.empno%type, n in emp1.ename%type, s in emp1.sal%type);
procedure delete_emp(j in emp1.job%type);
function deno(n in emp1.empno%type, d out emp1.deptno%type) return emp1.deptno%type;
function d_name(dno in dept.deptno%type, dn out dept.dname%type) return dept.dname%type;
end sri_438;

create or replace package body sri_438 as
procedure insert_emp(eno in emp1.empno%type, n in emp1.ename%type, s in emp1.sal%type) as
begin
insert into emp1(empno,ename,sal) values(eno,n,s);
end insert_emp;
procedure delete_emp(j in emp1.job%type) as
begin
delete from emp1 where job like 'abc';
end delete_emp;
function deno(n in emp1.empno%type, d out emp1.deptno%type) return emp1.deptno%type as
begin
select deptno into d from emp1 where empno=n;
return d;
end deno;
function d_name(dno in dept.deptno%type, dn out dept.dname%type) return dept.dname%type as
begin
select dname into dn from dept where deptno=dno;
return dn;
end d_name;
end sri_438;
 
declare 
emp_no emp1.empno%type:=&num;
emp_name emp1.ename%type:='&name';
emp_sal emp1.sal%type:=&sal;
emp_job emp1.job%type:='&job';
dept_no dept.deptno%type:=&dno;
de_no dept.deptno%type;
dept_name dept.dname%type;
my_num emp1.empno%type:=&number;
begin
sri_438.insert_emp(emp_no,emp_name,emp_sal);
sri_438.delete_emp(emp_job);
dbms_output.put_line(sri_438.deno(my_num,de_no));
dbms_output.put_line(sri_438.d_name(dept_no,dept_name));
end;
