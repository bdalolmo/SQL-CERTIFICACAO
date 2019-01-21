grant SELECT,UPDATE(department_name, location_id),INSERT
ON departments
TO HR_2
WITH GRANT OPTION;


--dicionaRIO DADOS

SELECT * FROM role_sys_privs;

SELECT * FROM user_tab_privs_made;

SELECT * FROM user_col_privs_made;

SELECT * FROM user_tab_privs_recd;

SELECT * FROM user_sys_privs;

SELECT * FROM user_tab_privs_recd;

SELECT * FROM user_col_privs_recd;

SELECT * FROM user_sys_privs;

SELECT * FROM user_role_privs;


REVOKE SELECT, INSERT
ON DEPARTMENTS
FROM hr_2;


SELECT * FROM user_tab_privs_made;   

------exercicio 
/* Crie um usuário com o seu nome, este usuário deve ter as permissões de se conectar, 
criar tabelas e functions.*/

create user BRENO  
identified by 123456;

GRANT create session, create table, create procedure 
TO BRENO;

/* Para o usuário que foi criado no Exercício 01, de à ele as permissões de de alterar as colunas department_id e
department_name da tabela departments, select na tabela employees e delete na tabela jobs. Sendo que este usuário
poderá conceder esta permissão à outros usuários. */

GRANT UPDATE(department_id,department_name)
on departments
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

/*Coloque todas as permissões de sistema que foram dadas ao usuário criado em uma ROLE, após isso retire as permissões
de sistema desse usuário e atribua a ROLE para ele. */
CREATE ROLE EXERCICIO_3;

CREATE ROLE EXERCICIO_2;

GRANT CREATE SESSION,
CREATE TABLE, 
CREATE PROCEDURE
TO EXERCICIO_3;

REVOKE SELECT
ON EMPLOYEES
FROM BRENO;

REVOKE UPDATE
ON DEPARTMENTS
FROM BRENO;

REVOKE DELETE
ON JOBS
FROM BRENO;

GRANT EXERCICIO_3
TO BRENO;

-- correcao
REVOKE CREATE SESSION,
CREATE TABLE, 
CREATE PROCEDURE
FROM BRENO;
/*Mostre no dicionário de dados com apenas uma query (Será necessário usar o UNION ALL) todas as permissões
de objeto que este usuário novo possuí  */
  
  SELECT * FROM USER_ROLE_PRIVS;  
    
  SELECT * FROM USER_ROLE_PRIVS;
  
  WHERE OWNER BRENO;
  
  
  SELECT a.grantee,a.table_name,a.privilege, null as nome_coluna
  FROM user_tab_privs_made a
  where a.grantee = 'BRENO'
  UNION ALL
  SELECT b.grantee,b.table_name,b.privilege, b.column_name
  FROM user_col_privs_made b
  where b.grantee = 'BRENO';
