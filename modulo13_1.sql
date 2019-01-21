select * FROM employees2;

alter table employees2
add breno varchar2(100) null;

alter table employees2
modify breno char(11);

desc employees2;

update employees2 
set breno =10; 


alter table employees2
drop column breno;

select dept_id, breno from employees2;

alter table employees2
set unused column breno;

alter table employees2
drop unused columns;
