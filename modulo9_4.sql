------ DEFAULT

create table teste_default(id_number number(10),
                            dt_inserido date DEFAULT sysdate);
                            
select * FROM teste_default;

INSERT INTO teste_default (id_number)
VALUES (10);


CREATE TABLE DEP90 AS
SELECT employee_id, first_name, hire_date, salary * 12 AS "SALARIO" 
FROM EMPLOYEES
WHERE department_id=90;


SELECT * FROM employees;

SELECT * FROM dep90;

SELECT * FROM teste_default;
------alter table

ALTER TABLE teste_default add
NM_USUARIO VARCHAR2(10);

UPDATE teste_default
set nm_usuario =(user); -- setado o schema USER p coluna 

alter table teste_default 
MODIFY nm_usuario varchar2(20) not NULL; -- modify

describe teste_default;

alter TABLE teste_default
rename column nm_usuario to nm_usuario2; 

alter TABLE teste_default
rename  to teste_default2; -- renomear tabela

SELECT * FROM teste_default2;

alter table teste_default2
drop column nm_usuario2; -- dropar uma coluna

drop table teste_default2;

-- exercicio