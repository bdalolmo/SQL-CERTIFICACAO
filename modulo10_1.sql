-- view

CREATE OR REPLACE VIEW
    vw_programdores (ID,NOME,SALARIO_ANUAL) AS
    SELECT employee_id, first_name, salary*12 
    from employees
    where job_id='IT_PROG';nknjnnjnknjnkkn  n 
    
select * FROM employees;

SELECT * FROM vw_programdores;

-- VIEWS COMPLEXAS

CREATE VIEW SAL_CARGOS
(nome,sal_maior,sal_menor,sal_media)as
select b.job_title, MAX(a.salary),MIN(a.salary),AVG(a.salary)
from employees a
INNER JOIN jobs b
ON b.job_id=a.job_id
GROUP BY b.job_title;

select * from jobs;

SELECT * FROM sal_cargos;

create or REPLACE VIEW vw_dep50
AS SELECT* FROM employees
WHERE department_id=50
WITH CHECK OPTION CONSTRAINT ck_dp50;

select * FROM vw_dep50;

update vw_dep50
set salary = salary+10
where department_id=120;


create view vw_dep20
(id,nome,cargo)as
select employee_id, first_name, job_id 
from employees
where department_id=20
WITH READ ONLY;

DELETE VW_DEP20
WHERE ID=202; 

---------------------------
-- indices
---------------------------

create index nome_empregado
ON EMPLOYEES (FIRST_NAME);

DROP index nome_empregado;

select * FROM employees;

-----------------------------
-- sequence
-----------------------------

SELECT* FROM teste_01;

DESC teste_01;

CREATE TABLE TESTE_01(
TESTE_NUMERO NUMBER,
TESTE_CHAR VARCHAR2(30));

CREATE SEQUENCE sq_teste01
INCREMENT BY 15
START WITH 36
MAXVALUE 9999999999
NOCACHE
NOCYCLE;

INSERT INTO TcreateESTE_01(teste_numero,teste_char)
values(sq_teste01.NEXTVAL,'Breno');

DESC TESTE_01;


SELECT* FROM teste_01;

SELECT sq_depart.CURRVAL FROM DUAL;


DROP SEQUENCE sq_teste01;


--sinônimos
create synonym teste_tabela
for teste_01;

select * from teste_tabela;

drop synonym teste_tabela;
