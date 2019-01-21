--no quin join
-- left outer join

select * from employees;

select * from departments;

select e.last_name, d.department_id, d.department_name
from employees e left OUTER JOIN departments d
on(e.department_id= d.department_id);

select e.last_name, d.department_id, d.department_name
from employees e RIGHT OUTER JOIN departments d
on(e.department_id= d.department_id);

select e.last_name, d.department_id, d.department_name
from employees e full OUTER JOIN departments d
on(e.department_id= d.department_id);


SELECT * from employees;

select * from job_history;
---------UNION E UNION ALL

SELECT employee_id, job_id 
FROM employees
UNION
SELECT employee_id, job_id
FROM job_history;


SELECT employee_id, job_id 
FROM employees
UNION ALL
SELECT employee_id, job_id
FROM job_history
ORDER BY employee_id;  -- FUNCIONARIO 200 RETORNA 3 LINHAS

--intersect  retorna campos em comum nas duas consultas

SELECT employee_id, job_id 
FROM employees
intersect
SELECT employee_id, job_id
FROM job_history


--minus retorna todos resultados menos no intersect ...resultados que nao consta na job_history

SELECT employee_id, job_id 
FROM employees
minus
SELECT employee_id, job_id
FROM job_history

--operador de conjunto  diretrizes gerais

--exemplo caractere de substituição
SELECT department_id, 0 location , hire_date 
FROM employees
UNION
SELECT department_id, location_id , to_date(null)
FROM departments;


SELECT 'SQL' AS "Meu Sonho" , 3 a_dummy from dual
UNION 
SELECT 'Eu gostaria de ensinar' , 1 a_dummy from dual
UNION 
SELECT 'para todo mundo' , 2 a_dummy from dual
ORDER BY a_dummy;