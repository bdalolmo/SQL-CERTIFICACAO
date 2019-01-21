alter table teste_01 
add constraint pk_tb_teste
PRIMARY KEY(teste_numero);

select * FROM teste_01;

desc teste_01;

alter table teste_01
drop constraint pk_tb_teste;

alter TABLE teste_01
modify teste_numero PRIMARY KEY;


COMMIT



SELECT * FROM user_constraints
WHERE table_name = 'teste_01';


