select employee_id, manager_id FROM employees 
where employee_id in (104,105);

-- retonar os funcionarios cujo gerentes dos funcionarios 104 e 105 coincide com 
--outros funcionarios sem mostrar os mesmos(104 e 105)
select employee_id, manager_id , department_id
FROM employees 
where (manager_id, department_id) in (select manager_id, department_id
                                      from employees
                                      where employee_id in(104,105))
and employee_id not in (104,105);


select employee_id, manager_id , department_id
FROM employees 
where manager_id in 
     (select manager_id   
      from employees
      where employee_id in(104,105))
      and department_id in
      (select manager_id   
       from employees
       where employee_id in(104,105))
and employee_id not in (104,105);


-- TODOS FUNCIONARIOS DO DEPARTAMETNTO IT
select * FROM employees
where department_id =
      (SELECT department_id from departments
        where department_name ='IT');


-- retonar todos funcionarios que recebem mais que a media salarial do departamento
--compara departmento id do interno com externo
-- verifica linha por linha..
select * 
FROM employees emp
where salary >
      (SELECT avg(salary) 
      from employees
      where department_id = emp.department_id);

-- exists

select * FROM employees emp   -- todos funcionarios que também sao gerentes
where exists (SELECT 1 from employees
              where manager_id = emp.department_id);

select * FROM departments d -- todos departamentos que nao tem funcionarios
where not EXISTS (select 1
                  from employees
                  where department_id = d.department_id);
                  



-- with

with
dept_custo AS ( 
  SELECT d.department_name , sum(e.salary) AS dept_total
  FROM employees e , departments d
  where e.department_id = d.department_id
  GROUP BY d.department_name),
avg_custo AS (
  SELECT SUM(dept_total)/count(*) as dept_avg
    from dept_custo)
  select *
  from dept_custo
  where dept_total >
(select dept_avg
  from avg_custo)
  order by department_name;  -- departamentos que recebem maior que a media de todos eles
  
  ------------------------------------------------------------------------------
  --exerciiosss
  ------------------------------------------------------------------------------
  
  /* 01 - Exiba o nome, o id do departamento e o salário de qualquer funcionário cujo salário e departamentocomissão coincidam com o salário
  e o departamento de qualquer funcionário que esteja na localização ID 1700*/
  
  select e.first_name, e.department_id, e.salary 
  FROM employees e
  where (e.salary, e.commission_pct)
  in (select e.salary, e.commission_pct
  from employees e inner join departments d
  on (e.department_id = d.department_id)
  JOIN locations l
  on l.location_id = d.location_id
  and l.location_id=1700);
  
  --correção
  select e.first_name, e.department_id, e.salary 
  FROM employees e
  where (e.salary, e.department_id)
  in (select b.salary, b.department_id 
      from employees b
      where b.department_id in
        (select department_id 
        from departments
        where location_id = 1700));
  
  
  
  /* 02 - Crie uma consulta para exibir os funcionários que recebem um salário mais alto do que o salário dos programadores 
  (JOB_ID = 'IT_PROG'). Classifique os resultados dos salários do maior para o menor.*/
  
  select * 
  from employees emp
  where emp.salary > (select max(e.salary)
                      from employees e
                      where job_id = 'IT_PROG');
  
   
    /* 03- Mostre todos os funcionários que não são gerentes usando o operador NOT EXISTS. */
  
  select * from employees e
  where not exists (select 1 
                    from employees 
                    where manager_id=e.manager_id);


  /* 04 - Crie uma consulta para exibir os nomes dos funcionários que têm um ou mais colegas de trabalho nos respectivos
  departamentos com datas de admissão posteriores, mas com salários mais altos. */

select emp.first_name, j.start_date
FROM employees emp 
  join job_history j
  on(emp.department_id= j.department_id)
  where j.start_date =
      (SELECT max(j.start_date)
        from employees e
        join job_history jo
        on(e.department_id= jo.department_id)
        where emp.salary> e.salary);


--correção 
select first_name
from employees a
where exists ( SELECT 1 
          from employees b
          where a.department_id = b.department_id and
          a.salary < b.salary and
                a.hire_date < b.hire_date);


select * from job_history;
     
     
 
  /*Crie uma consulta para exibir os nomes dos departamentos cujo custo total de salário está acima de 1/8 
  do custo total de salário de toda a empresa. Use a cláusula WITH para criar esta consulta. Nomeie a consulta SOMA_SAL  */
  
with  
soma_sal AS ( 
  SELECT d.department_name , 
  sum(e.salary) AS dept_total
  FROM employees e , departments d
  where e.department_id = d.department_id
  GROUP BY d.department_name)
  select department_name, dept_total 
  from soma_sal
  where dept_total > (
  select sum(dept_total)*1/8 
  from soma_sal)
  order by department_name;  
  
with
soma_sal AS ( 
  SELECT d.department_name , 
  sum(e.salary) AS dept_total
  FROM employees e , departments d
  where e.department_id = d.department_id
  GROUP BY d.department_name),
total_sal AS 
    (
  SELECT SUM(dept_total)*1/8 as custo_total
    from total_sal)
 (select *
  from soma_sal
  where dept_total) >
(select custo_total
  from total_sal)
  order by department_name;  -- departamentos que recebem maior que a media de todos eles
  
  












