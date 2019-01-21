SELECT last_name 
FROM EMPLOYEES
WHERE REGEXP_LIKE (first_name,'^Ste(v|ph)en$');

-- ^ inicio da seten�a  
-- | indica o OU
-- $ final da seten�a


select street_address , 
REGEXP_INSTR(street_address, '[^[:alpha:]]')
from locations
WHERE REGEXP_INSTR(street_address, '[^[:alpha:]]')>1;

select last_name, instr(last_name,'a'),instr(salary,6), salary FROM employees;

[ --> inicia a express�o
^ -->  indica NOT
[:alpha:] --> indica a classe de caracteres alfa   alfabeticos
] --> finaliza a express�o,

select REGEXP_SUBSTR(street_address, ' [^ ]+ '), 
street_address
from locations;

--Regras
[ --> inicia a express�o
^ --> indica not
  --> indica espa�o
] --> indica fim da expressao
+ --> indica 1 ou mais
 --> indica espa�o
 
 
 select REGEXP_REPLACE(country_name, '(.)','\1 '),  --crio grupo com qualuquer caracter(.) pego caracter anterior '\1' e adiciono espa�o 
        country_name
 from countries;
 
() --> grupo
. --> Qualquer caracter
\1 --> Um caracter da express�o anterior
 --> espa�o
 
 
 
 --exercicios
 
 /*Exerc�cio 01 - Crie uma consulta para pesquisar, na tabela EMPLOYEES, todos os funcion�rios cujos
nomes come�am com "Ne" ou "Na". */

select first_name, last_name
from employees
where  REGEXP_LIKE(first_name, '(Na|Ne)') ;


--corre��o
select first_name, last_name
from employees
where  REGEXP_LIKE(first_name, '^N(e|a).') ;



'^Ste(v|ph)en$'
-- ^ inicio da seten�a  
-- | indica o OU
-- $ final da seten�a


/* Crie uma consulta que remova, na exibi��o, os espa�os da coluna
STREET_ADDRESS da tabela LOCATIONS e adiciona uma v�rgula no lugar. */

select street_address, REGEXP_REPLACE(street_address,' ',',')
FROM locations;
 


/* Crie uma consulta que, na exibi��o, substitua "St" por "Street" na coluna STREET_ADDRESS
da tabela LOCATIONS. Tenha cuidado para n�o afetar as linhas que j� inclu�rem "Street".
Exiba apenas as linhas que forem afetadas. */

select street_address, REGEXP_REPLACE(street_address,'St%','Street')
FROM locations
where REGEXP_LIKE(street_address,'St');



