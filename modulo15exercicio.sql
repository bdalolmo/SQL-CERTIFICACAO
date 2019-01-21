/*Exerc�cio 01 - Crie uma consulta para exibir as seguintes informa��es sobre os 
funcion�rios cujo ID de gerente � menor que 101:
� ID do gerente
� ID do cargo e sal�rio total para cada ID de cargo para funcion�rios
  que est�o subordinados ao mesmo gerente
� Sal�rio total desses gerentes
� Sal�rio total desses gerentes, independentemente dos IDs dos cargos
*/

select manager_id,employee_id, sum(salary)
from employees 
where manager_id<101
group by rollup (manager_id,employee_id);


--corre��o

select manager_id, job_id, sum(salary)
from employees 
where manager_id<101
group by rollup (manager_id, job_id);



/*02 -Com base no exerc�cio anterior use a fun��o GROUPING
para determinar se os valores NULL nas colunas correspondentes 
�s express�es GROUP BY s�o causados pela opera��o ROLLUP*/

select manager_id, job_id, sum(salary),
grouping (manager_id) ger,
grouping (job_id) func
from employees 
where manager_id<101
group by rollup (manager_id,job_id);

/*Exerc�cio 03 - Agora voc� deve seguir as especifica��es do 
exerc�cio 01, por�m deve-se adicionar que tamb�m deve retornar 
o sal�rio total dos cargos independentemente dos gerentes. */

select manager_id, job_id, sum(salary)
from employees 
WHERE manager_id<101
group by cube (manager_id, job_id);

/*Exerc�cio 04 - Usando GROUPING SETS, crie uma consulta para exibir
os seguintes agrupamentos:
� department_id, manager_id, job_id
� department_id, job_id
� manager_id, job_id */

SELECT department_id , manager_id, job_id, sum(salary)
from employees
group by grouping sets
((department_id,manager_id,job_id),
(department_id,job_id),
(manager_id,job_id));

