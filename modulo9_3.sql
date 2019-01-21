CREATE TABLE teste_dept (
ID NUMBER(10),
nome varchar2(10));

drop table teste_dept;


CREATE TABLE teste_aula03( 
              PK_COL NUMBER(10) CONSTRAINT pk_teste PRIMARY KEY,
              employee_id NUMBER(10), 
              NOT_NULL NUMBER(10) NOT NULL,
              COL_UNIQUE DATE,
              COL_CHECK NUMBER(10,2),
              CONSTRAINT unique_01 UNIQUE(COL_UNIQUE),
              CONSTRAINT fk_teste01 FOREIGN KEY(employee_id)
              REFERENCES employees(employee_id) on delete cascade,
              CONSTRAINT check_col01 CHECK (COL_CHECK>10));
              
              
INSERT INTO teste_aula03 VALUES(1,100,10,null,30);

INSERT INTO teste_aula03 VALUES(2,100,3,null,30);

INSERT INTO teste_aula03 VALUES(3,100,3,null,30);

SELECT * FROM employees;

SELECT * FROM teste_aula03;
              
----------------------------------------------------------------------------------------
--01
/*
Crie a tabela EMPLOYEES2 com base na estrutura da tabela EMPLOYEES. 
Inclua somente as colunas EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY e DEPARTMENT_ID. 
Nomeie as colunas da nova tabela como ID, FIRST_NAME, LAST_NAME, SALARY e DEPT_ID, respectivamente.
*/

create table EMPLOYEES2 AS( 
select EMPLOYEE_ID AS ID, first_name, last_name, salary, department_id AS DEPT_ID
from EMPLOYEES);


SELECT * FROM employees2;

--02
/*Crie a tabela teste_dept com duas colunas com os nomes ID e NOME, a coluna ID vai ser a chave primária da tabela, 
ela também deve ser do tipo NUMBER com o tamanho de 10, já a coluna NOME vai ser um VARCHAR2 com um valor default usando 
a função USER e o seu tamanho vai ser de 50.
*/

CREATE TABLE teste_dept (
ID NUMBER(10) constraint pk_id primary key,
nome varchar2(50) default user);

update

select * from teste_dept;
---------------------------------------------------------------
desc teste_dept;

--03
--- Altere a coluna NOME para NOT NULL
alter table teste_dept
modify NOME VARCHAR2(50) not null;


--04--Renomei a coluna NOME para NOME_USUARIO

ALTER TABLE teste_dept
renAme column NOME TO NOME_USUARIO;

DROP  teste_dept
where 

--05
--Cria a coluna DATA_USUARIO como do tipo TIMESTAMP, esta coluna não pode ser nula.

ALTER TABLE teste_dept
add DATA_USUARIO TIMESTAMP NOT NULL;


ALTER TABLE teste_dept
modify DATA_USUARIO TIMESTAMP not null;

DESC dep;
--06
  --Elimine a coluna DATA_USUARIO
  
alter table teste_dept
drop column DATA_USUARIO;
  
  
  
  --07
  --Altere o nome da tabela teste_dept para dep
  
  ALTER TABLE teste_dept
  rename to dep;


--08
--Elimine a tabela dep.

drop table dep;


