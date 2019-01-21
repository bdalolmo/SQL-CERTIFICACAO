select * from user_objects;

select * from dictionary;

select * from user_objects
where object_type = 'TABLE';

select * from user_objects_ae;

select * from user_cons_columns;
  
select * from user_tab_columns;

SELECT * FROM user_constraints;

----------------
desc USER_TABLES;

SELECT * FROM user_tables;

SELECT * FROM user_tab_columns;

SELECT* FROM employees2;

SELECT * FROM dep90;

DESC USER_CONS_COLUMNS WHERE TABLE_NAME EMPLOYEES;

---------------------------------------------------------
--- USER VIEW  USER SEQUENCIES
----------------------------------------------------

SELECT * FROM user_views;


SELECT * FROM user_view;

SELECT * FROM user_sequences;

SELECT *  FROM jobs;

--synonyms

select * FROM user_synonyms;

DESC user_synonyms;

COMMENT ON TABLE EMPLOYEES IS
'Informa��es sobre a tabela'; 

COMMENT ON COLUMN EMPLOYEES.EMPLOYEE_ID IS
'Informa��es sobre a tabela'; 


SELECT * FROM all_tab_comments
WHERE table_name = 'EMPLOYEES';

SELECT * FROM all_col_comments
WHERE table_name = 'EMPLOYEES'
AND column_name = 'EMPLOYEE_ID';





/*Crie uma consulta que exiba o nome das colunas, os tipos de dados, o tamanho dos dados e se eles podem ser nulos da tabela JOBS
*/

SELECT column_name, data_type, data_length, nullable 
FROM user_tab_columns
WHERE table_name = 'JOBS';



/*
Agora fa�a uma consulta que exiba o nome da coluna, nome da constraint, o tipo da constraint(nome descritivo, 
use o DECODE com o descritivo passado na aula para exibir essa informa��o) a condi��o de pesquisa e o seu STATUS.
Para fazer esse exerc�cio fa�a um JOIN das tabelas USER_CONSTRAINTS e USER_CONS_COLUMNS
*/
SELECT * FROM user_constraints;

SELECT * FROM user_cons_columns;

SELECT col.column_name, con.constraint_name, 
DECODE (con.constraint_type,'C','VERIFICACAO',
                            'P','CHAVE PRIMARIA',
                            'U','EXCLUSIVA',
                            'R','REFERENCIAL',
                            'V','OPCAO DE VERIFICACAO',
                            'O','LEITURA')"TIPO",
con.search_condition, con.status
FROM user_cons_columns col
inner join user_constraints con
on col.table_name=con.table_name;

/*Crie uma consulta para exibir as informa��es sobre suas seq��ncias: nome, valor m�ximo, tamanho do incremento e �ltimo n�mero
*/

SELECT sequence_name, max_value, increment_by, last_number
FROM user_sequences;

/*Adicione um coment�rio a coluna department_id da tabela departments, este coment�rio deve ser a tradu��o do coment�rio atual. 
Ap�s fazer isso exiba este coment�rio.
*/

COMMENT ON TABLE DEPARTMENTS IS
'Tabela de departamentos mostra detalhes dos departamentos onde os funcionarios trabalham. cont�m 27 linhas, se refere a localiza��o, empregados, historico do trabalho.';


SELECT * FROM all_tab_comments
WHERE table_name = 'DEPARTMENTS';

---------MODULO 12
GRANT UPDATE(department_id,department_name)
on departments
to BRENO
WITH GRANT OPTION;

GRANT SELECT
on EMPLOYEES
to BRENO
WITH GRANT OPTION;

GRANT SELECT
on EMPLOYEES
to BRENO
WITH GRANT OPTION;

GRANT DELETE
on JOBS
to BRENO
WITH GRANT OPTION;

CREATE ROLE EXERCICIO_2;

GRANT CREATE SESSION, CREATE TABLE, CREATE PROCEDURE
ON EXERCICIO_3;

REVOKE SELECT
ON EMPLOYEES
FROM BRENO;

REVOKE UPDATE
ON DEPARTMENTS
FROM BRENO;

REVOKE DELETE
ON JOBS
FROM BRENO;

REVOKE CREATE SESSION,
CREATE TABLE, 
CREATE PROCEDURE
FROM BRENO;


SELECT a.grantee,a.table_name,a.privilege, null as nome_coluna
  FROM user_tab_privs_made a
  where a.grantee = 'BRENO'
  UNION ALL
  SELECT b.grantee,b.table_name,b.privilege, b.column_name
  FROM user_col_privs_made b
  where b.grantee = 'BRENO';
  
SELECT * FROM USER_OBJETOS;

--dicionaRIO DADOS

SELECT * FROM role_sys_privs;

SELECT * FROM user_tab_privs_made;

SELECT * FROM user_col_privs_made; --depqr

SELECT * FROM user_tab_privs_recd;

SELECT * FROM user_sys_privs;

SELECT * FROM user_col_privs_recd;

SELECT * FROM user_role_privs;