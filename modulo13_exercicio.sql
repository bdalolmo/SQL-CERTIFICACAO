/* exercicio 1 - Crie uma tabela chamada employees_2 que ter os dados da tabela employees, com a mesma estrutura, 
porém só terá as colunas first_name, last_name, department_id e hire_date, para essa nova tabela 
as suas colunas devem ter os seguintes nomes: nome, sobrenome, departamento e admissao.
*/

create table employees_2 as
select first_name as nome, last_name as sobrenome, department_id as departamento, hire_date as admissao
from employees;



select * FROM employees_2;


/*Altere a tabela employees_2 adicione a coluna comissao, que deve ser um número de 10, esta coluna não pode receber valores nulos e deve ter uma constraint
que garanta que ela não vai receber valores menores que 0. Essa constraint deve ter o nome ck_comissao
*/

alter table employees_2
add comissao number(10);

delete from employees_2;

alter table employees_2
add comissao number(10) NOT NULL
CONSTRAINT ck_comissao CHECK (comissao>10);

alter table employees_2
drop column comissao;

--correcao
alter table employees_2
add comissao number(10);

update employees_2 set
comissao=1;

alter table employees_2
modify comissao number(10) not null; -- p colocar not null - veremos inserir como normal, atualizar a coluna e depois colocar not null

alter table employees_2
add CONSTRAINT ck_comissao CHECK (comissao>0);

-- Elimine a tabela employees_2, depois restaure a tabela.

drop TABLE employees_2;

select * from RECYCLEBIN;

FLASHBACK TABLE employees_2 to before DROP;

select * FROM employees_2;

--Adicione uma referencia de chave estrangeira, tabela employees_2 no campo departamento com a tabela departments.

alter table employees_2
ADD CONSTRAINT fk_employ FOREIGN KEY(DEPARTAMENTO)
REFERENCES departments(department_id);

SELECT * FROM departments

desc employees_2;

--Crie um índice no campo admissao tabela employees_2
CREATE INDEX admissao_idx
  on employees_2(admissao);

--Elimine a tabela employees_2 de uma forma que ela não poderá ser restaurada.

drop TABLE employees purge