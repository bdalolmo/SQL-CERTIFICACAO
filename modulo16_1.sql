-- time_zone   como DBA

select sessiontimezone  from dual;

ALTER SESSION SET time_zone = 'America/New_yourk';



-- aula 03 timestamp

select hire_date from employees;

alter table employees
modify hire_date TIMESTAMP;

-- fuso horario


select extract(year from sysdate)from dual;

select last_name, hire_date, 
extract(month from hire_date) mes
From employees
where manager_id=100;


SELECT TZ_OFFSET('Brazil/East') 
from dual;


SELECT TZ_OFFSET('US/Eastern') 
from dual;

select * FROM v$timezone_names
WHERE tzname like 'Brazil%';

select FROM_TZ(TIMESTAMP '2016-01-18 05:00:00','Australia/North') 
FROM dual;  --local_zone

--exerciio modulo 16

/* Exerc�cio 01 - Altere a sess�o para definir NLS_DATE_FORMAT como DD-MON-YYYY HH24:MI:SS
*/

SELECT current_date FROM dual;

alter session 
SET NLS_DATE_FORMAT = 'DD-MON-YYYY HH24:MI:SS';

/* Exerc�cio 02 - Crie consultas para exibir os deslocamentos (TZ_OFFSET) para os seguintes fusos hor�rios:
Africa/Accra e America/Argentina/Cordoba
*/

SELECT TZ_OFFSET('Africa/Accra') as "Africa/Accra", 
TZ_OFFSET('America/Argentina/Cordoba') as "Argentina/Cordoba"
from dual;

SELECT TZ_OFFSET('America/Argentina/Cordoba') 
from dual;


/* Exerc�cio 03 - Exiba CURRENT_DATE, CURRENT_TIMESTAMP e LOCALTIMESTAMP para esta sess�o.
Ap�s isso altere o fuso hor�rio para America/Argentina/Cordoba, fa�a a consulta novamente.
*/

select current_date,'-' ,CURRENT_timestamp, '-' 
,localtimestamp
from dual;

alter session set time_zone = 'America/Argentina/Cordoba'; 

-- Exerc�cio 04 - Crie uma consulta para exibir DBTIMEZONE e SESSIONTIMEZONE.

select DBTIMEZONE, SESSIONTIMEZONE
FROM DUAL;


/* Exerc�cio 05 - Crie uma consulta que retorne o first_name, o hire_date e uma terceira coluna com o ano
em que o funcion�rio foi admitido na empresa da tabela EMPLOYEES em rela��o aos funcion�rios que trabalham no departamento 30.*/


SELECT * from job_history;

SELECT a.first_name, a.hire_date , j.start_date
FROM employees a inner join job_history j
on (a.employee_id = j.employee_id)
and a.department_id = 30;

--corre��o

select first_name, hire_date, 
extract(year from hire_date) 
from employees
where department_id = 30;
