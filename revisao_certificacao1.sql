--revisao
  select department_id, job_id, Sum(salary)
  from employees
  group by department_id, job_id
  order by sum(salary);
  
  select department_id, MAX(salary) 
  from employees
  group by department_id
  HAVING MAX(salary)>1000;
  
    select * from employess;
  
select* from locations;

select department_id, AVG(salary) 
  from employees
  group by department_id
  HAVING MAX(salary)>1000;

select department_id, MAX(salary) 
  from employees
  group by department_id
  HAVING MAX(salary)>1000;
select department_id, AVG(salary) 
  from employees
  group by department_id
  HAVING MAX(salary)>1000;
  
  
  -- JOINS
  --NATURAL JOIN - NOME TIPO DE DADOS IGUAIS
  COMPARA DUAS COLUNAS E RETORNA INFORMACOES QUE TEM OS DADOS IGUAIS
  
  SELECT d.department_id,d.department_name nome, l.city cidade 
  FROM locations l 
  NATURAL join departments d
  on ( d.location_id = l.location_id;
  
    SELECT d.department_id,d.department_name nome, l.city cidade 
    FROM locations l 
    NATURAL join departments d
  
  --using  tabelas com nomes iguais.. mas usar 1 ou 2 tabelas
  -- nao usar natural join com using
  --equijoin legal usa apelidos
  -- fAZER UM JOIN COM ON e semelhando JOIN usando using
  
  
  
  select  e.last_name funcionario,  d.last_name gerente
  from employees e 
  join employees d 
  on(e.manager_id= d.employee_id);
  
  select * from locations;
  
  select * from departments;
  
  
  select e.employee_id, city, d.department_name 
  from  employees e 
  join departments d
  on (e.employee_id= d.department_id)
  join locations l
  on (d.location_id= l.location_id);
  
  
  se