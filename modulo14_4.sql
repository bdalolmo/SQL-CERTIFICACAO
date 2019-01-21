create table empl3
as (select * from employees
    where department_id in (20,30,40));
    
select count(1) from empl3;

select * FROM empl3;

select * FROM employees;

MERGE into empl3 c
using employees e
ON (C.employee_id = e.employee_id)
when matched then 
UPDATE set
      c.first_name = e.first_name,
      c.last_name = e.last_name,
      c.email = e.email, 
      c.phone_number = e.phone_number,
      c.hire_date = e.hire_date, 
      c.job_id = e.job_id,  
      c.salary = e.salary, 
      c.commission_pct = e.commission_pct,  
      c.manager_id = e.manager_id, 
      c.department_id = e.department_id
when NOT MATCHED THEN 
insert values (e.employee_id, e.first_name, e.last_name, e.email, e.phone_number, e.hire_date, e.job_id,  
       e.salary, e.commission_pct, e.manager_id, e.department_id);
