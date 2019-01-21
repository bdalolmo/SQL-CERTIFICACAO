/*Exercício 01 - Crie uma consulta para exibir as seguintes informações sobre os 
funcionários cujo ID de gerente é menor que 101:
– ID do gerente
– ID do cargo e salário total para cada ID de cargo para funcionários
  que estão subordinados ao mesmo gerente
– Salário total desses gerentes
– Salário total desses gerentes, independentemente dos IDs dos cargos
*/

select manager_id,employee_id, sum(salary)
from employees 
where manager_id<101
group by rollup (manager_id,employee_id);


--correção

select manager_id, job_id, sum(salary)
from employees 
where manager_id<101
group by rollup (manager_id, job_id);



/*02 -Com base no exercício anterior use a função GROUPING
para determinar se os valores NULL nas colunas correspondentes 
às expressões GROUP BY são causados pela operação ROLLUP*/

select manager_id, job_id, sum(salary),
grouping (manager_id) ger,
grouping (job_id) func
from employees 
where manager_id<101
group by rollup (manager_id,job_id);

/*Exercício 03 - Agora você deve seguir as especificações do 
exercício 01, porém deve-se adicionar que também deve retornar 
o salário total dos cargos independentemente dos gerentes. */

select manager_id, job_id, sum(salary)
from employees 
WHERE manager_id<101
group by cube (manager_id, job_id);

/*Exercício 04 - Usando GROUPING SETS, crie uma consulta para exibir
os seguintes agrupamentos:
– department_id, manager_id, job_id
– department_id, job_id
– manager_id, job_id */

SELECT department_id , manager_id, job_id, sum(salary)
from employees
group by grouping sets
((department_id,manager_id,job_id),
(department_id,job_id),
(manager_id,job_id));

