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

/* Exercício 01 - Altere a sessão para definir NLS_DATE_FORMAT como DD-MON-YYYY HH24:MI:SS
*/

SELECT current_date FROM dual;

alter session 
SET NLS_DATE_FORMAT = 'DD-MON-YYYY HH24:MI:SS';

/* Exercício 02 - Crie consultas para exibir os deslocamentos (TZ_OFFSET) para os seguintes fusos horários:
Africa/Accra e America/Argentina/Cordoba
*/

SELECT TZ_OFFSET('Africa/Accra') as "Africa/Accra", 
TZ_OFFSET('America/Argentina/Cordoba') as "Argentina/Cordoba"
from dual;

SELECT TZ_OFFSET('America/Argentina/Cordoba') 
from dual;


/* Exercício 03 - Exiba CURRENT_DATE, CURRENT_TIMESTAMP e LOCALTIMESTAMP para esta sessão.
Após isso altere o fuso horário para America/Argentina/Cordoba, faça a consulta novamente.
*/

select current_date,'-' ,CURRENT_timestamp, '-' 
,localtimestamp
from dual;

alter session set time_zone = 'America/Argentina/Cordoba'; 

-- Exercício 04 - Crie uma consulta para exibir DBTIMEZONE e SESSIONTIMEZONE.

select DBTIMEZONE, SESSIONTIMEZONE
FROM DUAL;


/* Exercício 05 - Crie uma consulta que retorne o first_name, o hire_date e uma terceira coluna com o ano
em que o funcionário foi admitido na empresa da tabela EMPLOYEES em relação aos funcionários que trabalham no departamento 30.*/


SELECT * from job_history;

SELECT a.first_name, a.hire_date , j.start_date
FROM employees a inner join job_history j
on (a.employee_id = j.employee_id)
and a.department_id = 30;

--correção

select first_name, hire_date, 
extract(year from hire_date) 
from employees
where department_id = 30;
