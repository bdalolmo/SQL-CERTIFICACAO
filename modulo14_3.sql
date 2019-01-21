create table hist_salario(
    employee_id number(10),
    hire_date date,
    salary number(10));
    
create table hist_salario_mng(
    employee_id number(10),
    manager_id number(10),
    salary number(10));
    
insert all 
into hist_salario      values(EMPID,HIREDATE,SAL) 
into hist_salario_mng  values(EMPID,MGR,SAL) 
SELECT employees.employee_id EMPID, employees.hire_date HIREDATE, employees.salary SAL,
employees.manager_id MGR
FROM employees
WHERE employees.employee_id >200;

SELECT * FROM hist_salario;

SELECT * FROM hist_salario_mng;

INSERT ALL
   WHEN SAL >10000 THEN
   INTO hist_salario
        values(EMPID,HIREDATE,SAL)
   when SAL > 200 then
   into hist_salario_mng
        values(EMPID,MGR,SAL)
    SELECT
      EMPLOYEE_ID EMPID,
      HIRE_DATE HIREDATE, 
      SALARY SAL,
      MANAGER_ID MGR
    FROM employees
    WHERE employees.employee_id >200;
    
DESC HIST_SALARIO;

CREATE table sal_especial(
    department_id     number(10),
    salary            number(10));
    

CREATE table hist_contrataco_07(
    department_id     number(10),
    hire_date         date));
    
CREATE table hist_contrataco(
    department_id     number(10),
    hire_date         date));

select * from sal_especial;

select * from hist_contrataco_07;

select * from hist_contrataco;

insert first
    when sal > 25000 then
    into sal_especial
    values (deptid, sal)
    when hiredate like ('%07%') then
    into hist_contrataco_07
    values(deptid,hiredate)
    else
      into hist_contrataco
      values(deptid,hiredate)
    select department_id deptid, 
           sum(salary) sal, 
           max(hire_date) hiredate 
    from employees
    GROUP BY
        department_id;
    
 create table info_vendas_geral(
    employee_id   number(10),
    semana_id number(10),
    vendas_seg number(10),
    vendas_ter number(10),
    vendas_qua number(10),
    vendas_qui number(10),
    vendas_sex number(10));
 
 drop table info_vendas_geral;
    
 insert into info_vendas_geral
 values(200,19,300,500,
        1000,30,5000);

select * FROM info_vendas_geral;

create table info_vendas
  (employee_id   number(10),
    semana_id    number(10),
    dia_id       number(2),
    vendas       number(10));

select * FROM info_vendas_geral;

select * FROM info_vendas;

insert all
  into info_vendas
    values (employee_id, semana_id,1, vendas_seg)
  into info_vendas
    values (employee_id, semana_id,2, vendas_ter)
  into info_vendas
    values (employee_id, semana_id,3, vendas_qua)
  into info_vendas
    values (employee_id, semana_id,4, vendas_qui)
  into info_vendas
    values (employee_id, semana_id,5, vendas_sex)
select employee_id, semana_id,vendas_seg, vendas_ter,
vendas_qua, vendas_qui, vendas_sex
from info_vendas_geral;
 

