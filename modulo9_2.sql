create table teste_timestamp2(
HORA_ATUAL TIMESTAMP(7));

select * from employees;

insert into teste_timestamp(hora_atual)
values(sysdate);

SELECT * FROM teste_timestamp;

create Table TABELA_INTERVALOS(
INTERVALO_ANO INTERVAL YEAR (3) TO MONTH,
INTERVALO_DIA INTERVAL DAY (3) TO SECOND);

INSERT INTO tabela_intervalos(intervalo_ano, intervalo_dia)
VALUES(INTERVAL '120' MONTH(3),
        INTERVAL '180' DAY(3));


SELECT TO_CHAR(SYSDATE+ INTERVALO_ANO,'DD-MON-RRRR'),
              SYSDATE+INTERVALO_DIA INTERVALO
              FROM tabela_intervalos;