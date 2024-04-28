
select * from employee /*funcionario ok*/


select Ssn, Essn from employee e, dependent d where (e.Ssn = d.Essn); /* o */


UPDATE employee
SET Super_ssn = '888665555'
WHERE Super_ssn IS NULL; /* ok */


select * from departament /* ok */

select * from works_on  /* ok */

/*
select 
e.Fname	
,e.Minit	
,e.Lname	
,e.Ssn	
,e.Bdate	
,e.Address	
,e.Sex	
,e.Salary	
,e.Super_ssn	
,e.Dno
,d.Dname 
##,dl.Dlocation 
#,p.Plocation 
#,concat(d.Dname) 
from employee e
left join departament d on e.Dno = d.Dnumber /* ok */
##inner join dept_locations dl on d.Dnumber  = dl.Dnumber 
##inner join project p on e.Dno = p.Dnum 



-- Criar a tabela temporária com a coluna Dname
CREATE TEMPORARY TABLE temp_employee AS
SELECT 
    e.Fname,
    e.Minit,
    e.Lname,
    e.Ssn,
    e.Bdate,
    e.Address,
    e.Sex,
    e.Salary,
    e.Super_ssn,
    e.Dno,
    d.Dname,
    case 
        when e.Address like '%Houston%'
        	then 'Houston' 
        when e.Address like '%Stafford%'
        	then 'Stafford'
        when e.Address like '%Bellaire%'
        	then 'Bellaire'
         when e.Address like '%Sugarland%'
        	then 'Sugarland'
         when e.Address like '%Humble%'
        	then 'Humble'
        when e.Address like '%Spring%'
        	then 'Spring'
        	else '-' 
        	end as Location    
FROM 
    employee e
LEFT JOIN 
    departament d ON e.Dno = d.Dnumber;

   
-- Selecionar dados da tabela temporária
CREATE TEMPORARY TABLE temp_employee_2 AS
SELECT 
    concat(Fname,' ',Lname) as Name,
--	Fname,
--  Minit,
--  Lname,
    Ssn,
    Bdate,
    Address,
    Sex,
    Salary,
    Super_ssn,
    Dno,
    concat(Dname,'-',Location) as Depart_Local, /*Neste caso fiz um concat ao invés de Mesclar no Power Query*/
    Dname,
    Location
    
FROM 
    temp_employee;

-- Descartar a tabela temporária quando não for mais necessária
DROP TEMPORARY TABLE IF EXISTS temp_employee;
DROP TEMPORARY TABLE IF EXISTS temp_employee_2;
DROP TEMPORARY TABLE IF EXISTS Manager;


CREATE TEMPORARY TABLE Manager AS
select Super_ssn, Name as Gerente
from temp_employee_2

CREATE TABLE employee_Desafio AS
select * from 
temp_employee_2

CREATE TABLE Manager_Desafio AS
select m.*,
t.ssn, t.Name as 'Colaborador'
from Manager m
left join temp_employee_2 t on m.super_ssn = t.super_ssn 














