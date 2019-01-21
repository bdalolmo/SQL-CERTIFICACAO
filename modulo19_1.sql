SELECT last_name 
FROM EMPLOYEES
WHERE REGEXP_LIKE (first_name,'^Ste(v|ph)en$');

-- ^ inicio da setença  
-- | indica o OU
-- $ final da setença


select street_address , 
REGEXP_INSTR(street_address, '[^[:alpha:]]')
from locations
WHERE REGEXP_INSTR(street_address, '[^[:alpha:]]')>1;

select last_name, instr(last_name,'a'),instr(salary,6), salary FROM employees;

[ --> inicia a expressão
^ -->  indica NOT
[:alpha:] --> indica a classe de caracteres alfa   alfabeticos
] --> finaliza a expressão,

select REGEXP_SUBSTR(street_address, ' [^ ]+ '), 
street_address
from locations;

--Regras
[ --> inicia a expressão
^ --> indica not
  --> indica espaço
] --> indica fim da expressao
+ --> indica 1 ou mais
 --> indica espaço
 
 
 select REGEXP_REPLACE(country_name, '(.)','\1 '),  --crio grupo com qualuquer caracter(.) pego caracter anterior '\1' e adiciono espaço 
        country_name
 from countries;
 
() --> grupo
. --> Qualquer caracter
\1 --> Um caracter da expressão anterior
 --> espaço
 
 
 
 --exercicios
 
 /*Exercício 01 - Crie uma consulta para pesquisar, na tabela EMPLOYEES, todos os funcionários cujos
nomes começam com "Ne" ou "Na". */

select first_name, last_name
from employees
where  REGEXP_LIKE(first_name, '(Na|Ne)') ;


--correção
select first_name, last_name
from employees
where  REGEXP_LIKE(first_name, '^N(e|a).') ;



'^Ste(v|ph)en$'
-- ^ inicio da setença  
-- | indica o OU
-- $ final da setença


/* Crie uma consulta que remova, na exibição, os espaços da coluna
STREET_ADDRESS da tabela LOCATIONS e adiciona uma vírgula no lugar. */

select street_address, REGEXP_REPLACE(street_address,' ',',')
FROM locations;
 


/* Crie uma consulta que, na exibição, substitua "St" por "Street" na coluna STREET_ADDRESS
da tabela LOCATIONS. Tenha cuidado para não afetar as linhas que já incluírem "Street".
Exiba apenas as linhas que forem afetadas. */

select street_address, REGEXP_REPLACE(street_address,'St%','Street')
FROM locations
where REGEXP_LIKE(street_address,'St');



