SELECT * FROM employees;

SELECT * FROM 

CREATE TABLE REPRESENTANTES(
  ID NUMBER,
  NOME VARCHAR2(50),
  SALARIO NUMBER,
  COMISSÃO NUMBER);
  
  ALTER TABLE REPRESENTANTES
  RENAME TO representantes_venda;
  
  desc representantes_venda;
  
  insert into 
    (select id, nome, salario, comissão 
      from representantes_venda)
      values (100, 'Breno',10000, 0.5);
  
  select * from representantes_venda;
  
  select a.last_name, a.salary, a.department_id, b.salavg 
    from employees a,(select department_id, AVG(salary) salavg 
                      from employees
                      group by department_id) b
    where a.department_id= b.department_id
    and a.salary > b.salavg;
    
    
    update representantes_venda
    set id = (select employee_id 
              FROM employees
              where employee_id=103),
        comissão =(select commission_pct 
              from employees
              where employee_id= 122)
where nome = 'Breno';

DELETE from representantes_venda
        where id in (select employee_id 
                      from employees 
                      where first_name
                      like '%Alexander%');

select employee_id 
from employees 
where first_name
like '%Alexander%'

rollback;

-------------
--with check option e default
---------------


insert into 
      (select id, nome, salario, comissão 
          from representantes_venda
          where salario = 50)
        with check option
 values(100, 'Breno',10000,0.5);
 
 
 alter table representantes_venda
 modify salario NUMBER(10) DEFAULT (500);
 
 DELETE FROM representantes_venda;

INSERT INTO representantes_venda
(id, nome, salario, comissão)
VALUES(200,'TESTE_DEFAULT',DEFAULT,NULL);
                      
SELECT * FROM representantes_venda;