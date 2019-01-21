select department_id, job_id, sum(salary) 
FROM employees
where department_id<40 
group by ROLLUP(department_id, job_id);

select department_id, job_id, sum(salary) 
FROM employees
where department_id<40 
group by cube(department_id, job_id);

-- grouping
select department_id DEPTID, job_id JOB, sum(salary),
grouping (department_id) GRP_DEPT,
grouping (job_id) GRP_JOB
FROM employees
where department_id<40 
group by rollup(department_id, job_id);

-- GROUPING SETS
select department_id, job_id, manager_id, avg(salary) 
FROM employees
where department_id<30
group by grouping sets
((department_id, job_id),(job_id, manager_id));

-- colunas compostas
select department_id, job_id, manager_id, sum(salary) 
FROM employees
where department_id<30
group by rollup
(department_id,(job_id, manager_id));

-- sem colunas compostas - sem parenteses
select department_id, job_id, manager_id, sum(salary) 
FROM employees
where department_id<30
group by rollup
(department_id,job_id, manager_id);

--Agrupamentos concatenados
SELECT department_id, job_id, manager_id,
employee_id,sum(salary)
from employees
where department_id<20
group by grouping sets(department_id,job_id),
         grouping sets(employee_id,manager_id);

SELECT department_id, job_id, manager_id,
employee_id,sum(salary)
from employees
where department_id<20
group by grouping sets(department_id,
                       job_id,
                       employee_id,
                       manager_id);
                       
                       
SELECT department_id, 
        job_id, 
        manager_id,
        sum(salary)
from employees
where department_id<60
group by department_id,
rollup (job_id,manager_id);








