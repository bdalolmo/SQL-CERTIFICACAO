/*Exerc�cio 01 Crie as seguintes tabelas:
1� func_ricos( employee_id number(10), salary NUMBER(10,2)),
2� ger_hist(employee_id(10), salary number(10,2), manager_id number(10)) 
3� salario (employee_id number(10), hire_date date, salary number(10,2));
*/

create table func_ricos (
employee_id number(10),
salary number(10,2));

create table ger_hist (
employee_id number(10),
salary number(10,2),
manager_id number(10));

create table salario(
employee_id number(10),
hire_date date,
salary number(10,2));


select * from "3�salario"

/*
Exerc�cio 02
Agora crie uma consulta que fa�a o seguinte:
1� Recuper o id do funcion�rio, data de admiss�o, sal�rio e o id somente dos gerentes dos funcion�rios que possuem gerente;
2� Quando o funcion�rio receber mais de 15.000 ele deve ser inclu�do na tabela func_ricos;
3� Insira os dados do funcion�rios que foram admitidos entre os anos de 2002 e 2005 na tabela salario;
4� O restante dos funcion�rios devem ser inseridos na tabela ger_hist.
Lembrando que deve-se usar apenas uma query para isso.
*/
select employee_id , hire_date, salary, manager_id 
from employees
WHERE manager_id IS NOT NULL ;


create table ger_hist (
employee_id number(10),
salary number(10,2),
manager_id number(10));

select * from employees;

INSERT ALL
  WHEN SALARY > 15000 THEN
  INTO FUNC_RICOS
  VALUES(EMPLOYEE_ID, SALARY)
  WHEN HIRE_DATE > '01/01/02' and HIRE_DATE < '31/12/05' THEN
  INTO SALARIO
  VALUES (EMPLOYEE_ID,HIRE_DATE,SALARY)
  ELSE 
  INTO GER_HIST
  VALUES(EMPLOYEE_ID,SALARY,MANAGER_ID)
  select employee_id , hire_date, salary, manager_id 
  from employees
  WHERE manager_id IS NOT NULL ;

---corre��o com insert first

INSERT FIRST 
    WHEN salary > 15000 THEN
      INTO func_ricos
      VALUES (employee_id, salary)
     WHEN TO_CHAR(hire_date,'RR')
      BETWEEN ('02') and ('05') then
        into salario
      values (EMPLOYEE_ID, hire_date, SALARY)
      ELSE
      INTO GER_HIST
      VALUES(EMPLOYEE_ID,SALARY,MANAGER_ID)
  select employee_id , hire_date, salary, manager_id 
  from employees
  WHERE manager_id IS NOT NULL ;



/* 03
Crie as tabelas vendas com a seguinte estrutura:
1� Tabela vendas semanais vendas_sem (employee_id number(10), semana_id number(10), vendas_seg number(10), 
vendas_ter number(10), vendas_qua number(10), vendas_qui number(10), vendas_sex number(10));
2� Insira uma linha aleat�ria que na tabela vendas_sem;
3� Cria a tabela vendas (employee_id number(10), semana_id number(10), qtd_venda number(10), dia_sem number(1));
4� Insira os dados com o insert pivot da tabela vendas_sem na tabela vendas.
*/

CREATE TABLE VENDA_SEM(
employee_id number(10), 
semana_id number(10), 
vendas_seg number(10), 
vendas_ter number(10), 
vendas_qua number(10), 
vendas_qui number(10), 
vendas_sex number(10));

INSERT INTO venda_sem VALUES (100,20,546,234,500,780,450);

create table vendas(
employee_id number(10), 
semana_id number(10), 
qtd_venda number(10), 
dia_sem number(1));

desc vendas;

desc venda_sem;

insert all
  into vendas
    values (employee_id, semana_id, vendas_seg,1)
    into vendas
    values (employee_id,semana_id, vendas_ter,2)
    into vendas
    values (employee_id, semana_id, vendas_qua,3)
    into vendas
    values (employee_id, semana_id, vendas_qui,4)
    into vendas
    values (employee_id, semana_id, vendas_sex,5)
 select employee_id, semana_id, vendas_seg, vendas_ter, vendas_qua, vendas_qui, vendas_sex 
 from venda_sem;
    
    
    
    select * FROM vendas;
    
    select * FROM venda_sem;


/*Exerc�cio 04
1� Cria a tabela employee_4 com os dados id�nticos � tabela employees, com todos os funcion�rios que ganham menos de 6000; 
2� Fa�a uma consulta que caso o employee_id da tabela employees seja igual ao employee_id da tabela employees_4, os dados do
empregado devem ser atualizado, em caso contr�rio o funcion�rio deve ser inserido na tabela employee_4;
*/
create table employee_4 as
select * from employees
where salary<6000;

select * FROM employee_4;

MERGE INTO employee_4 a
using employees b
on (a.employee_id = b.employee_id)
WHEN MATCHED THEN
UPDATE SET
      a.first_name = b.first_name,
      a.last_name = b.last_name,
      a.email = b.email, 
      a.phone_number = b.phone_number,
      a.hire_date = b.hire_date, 
      a.job_id = b.job_id,  
      a.salary = b.salary, 
      a.commission_pct = b.commission_pct,  
      a.manager_id = b.manager_id, 
      a.department_id = b.department_id
when not matched then
insert values (b.employee_id, b.first_name, b.last_name, b.email, b.phone_number, b.hire_date, b.job_id,  
       b.salary, b.commission_pct, b.manager_id, b.department_id); 

/* Exerc�cio 05
1� Atualize o sal�rio do funcion�rio 100 para 25000;
2� Mostre todas as altera��es nesse campo desse funcion�rio e quando eles come�aram a ser v�lidas e quando elas deixaram de ser v�lidas.
*/

update employee_4
      set salary = 25000
      where employee_id=100;

select salary, 
        versions_starttime, 
        versions_endtime
from employee_4
versions between
scn minvalue and maxvalue
where employee_id=100;


