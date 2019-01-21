/*Exercício 01 Crie as seguintes tabelas:
1º func_ricos( employee_id number(10), salary NUMBER(10,2)),
2º ger_hist(employee_id(10), salary number(10,2), manager_id number(10)) 
3º salario (employee_id number(10), hire_date date, salary number(10,2));
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


select * from "3ºsalario"

/*
Exercício 02
Agora crie uma consulta que faça o seguinte:
1º Recuper o id do funcionário, data de admissão, salário e o id somente dos gerentes dos funcionários que possuem gerente;
2º Quando o funcionário receber mais de 15.000 ele deve ser incluído na tabela func_ricos;
3º Insira os dados do funcionários que foram admitidos entre os anos de 2002 e 2005 na tabela salario;
4º O restante dos funcionários devem ser inseridos na tabela ger_hist.
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

---correção com insert first

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
1º Tabela vendas semanais vendas_sem (employee_id number(10), semana_id number(10), vendas_seg number(10), 
vendas_ter number(10), vendas_qua number(10), vendas_qui number(10), vendas_sex number(10));
2º Insira uma linha aleatória que na tabela vendas_sem;
3º Cria a tabela vendas (employee_id number(10), semana_id number(10), qtd_venda number(10), dia_sem number(1));
4º Insira os dados com o insert pivot da tabela vendas_sem na tabela vendas.
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


/*Exercício 04
1º Cria a tabela employee_4 com os dados idênticos à tabela employees, com todos os funcionários que ganham menos de 6000; 
2º Faça uma consulta que caso o employee_id da tabela employees seja igual ao employee_id da tabela employees_4, os dados do
empregado devem ser atualizado, em caso contrário o funcionário deve ser inserido na tabela employee_4;
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

/* Exercício 05
1º Atualize o salário do funcionário 100 para 25000;
2º Mostre todas as alterações nesse campo desse funcionário e quando eles começaram a ser válidas e quando elas deixaram de ser válidas.
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


