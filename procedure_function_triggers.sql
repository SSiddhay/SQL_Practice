use pra;
show  tables;
select * from employee;
CREATE TABLE employee (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    dept VARCHAR(50),
    salary INT,
    doj DATE
);
INSERT INTO employee (id, name, dept, salary, doj) VALUES
(1, 'Mac', 'HR', 45000, '2022-09-08'),
(2, 'Harry', 'IT', 65000, '2021-07-13'),
(3, 'Shree', 'Production', 45000, '2020-01-10'),
(4, 'Nitin', 'HR', 55000, '2018-09-06'),
(5, 'Hari', 'IT', 85000, '2019-07-13'),
(6, 'Shrikant', 'HR', 25000, '2023-08-10'),
(7, 'Nishikant', 'Production', 35000, '2018-09-16'),
(8, 'Nisha', 'Support', 45000, '2019-09-13'),
(9, 'seema', 'IT', 50000, '2022-08-11'),
(10, 'Ramesh', 'IT', 44000, '2018-09-26'),
(11, 'shashank', 'Support', 68000, '2019-01-13'),
(12, 'suresh', 'IT', 34000, '2022-07-11');

select * from employee where id=10;
select * from employee where id=1;

# create a procedure

delimiter //
create procedure abc()
begin
select * from employee;
select * from employee where id =12;
end//
delimiter ;
call abc();

call abc();

delimiter //
drop procedure abc;
create procedure fgg()
begin
select * from employee where id between 8 and 12;
end//

delimiter ;
call fgg();

DELIMITER //
CREATE PROCEDURE cde()
BEGIN
    SELECT * FROM employee WHERE id = 12;
END //

DELIMITER ;
call cde();


drop procedure abc;
delimiter //
create procedure abc (in x int, in y int)
begin
declare z int;
set z=x+y;
select z as result;
end// 
delimiter ;
call abc(10,20);
call abc(30,45);

delimiter //
create procedure d()
begin
	drop procedure abc;
end //
delimiter ;

drop procedure abc;

DELIMITER //
create procedure ac(in eid int)
begin
select * from employee where id=eid ;
end//
delimiter ;
call abc(8);
call abc(12);

delimiter //
create procedure abc(in vdept varchar(50))
begin
	select * from employee where dept=vdept;
end //
delimiter ;

call abc('hr');

delimiter //
create procedure abc(in x int, in y int)
begin 
declare z int;
set z=x/y;
select z as result;
end//
delimiter ;
call abc(50,5);
drop procedure abc;

drop procedure abc;
delimiter //
create procedure abc(in x int,in y int,out z int)
begin
	set z=x+y;
end //
delimiter ;
call abc(50,450,@z);
select @z as result;
    
delimiter //
create procedure abc(in x int,in y int,out z int)
begin 
	set z=x/y;
end //
delimiter ;
call abc(20,5,@z);
select @z as result;

drop procedure abc;

delimiter //
create procedure abc(in x int,in y int,out z int)
begin
	set z=x*y;
end //
delimiter ;
call abc(45,7,@z);
select @z ;

delimiter //
create procedure abc(in x int,in y int,out z int)
begin
	set z=x*y;
end //
delimiter ;
call abc(20,5,@z);
select @z as final;

delimiter //
create procedure abc (in x int ,inout y int)
begin
	set y=x+y;
end //
delimiter ;
set @y=30;
select @y;
call abc(50,@y);

drop procedure abc;

delimiter //
create procedure abc(in x int,inout y int)
begin
	set y=x*y;
end//
set @y=7;
select @y;
call abc(12,@y);
select @y;


delimiter //
create procedure abc(in x int,inout y int)
begin
	set y=x+y;
end //
delimiter ;
set @y=10;
select @y;
call abc(20,@y);

# if else condition in procedure
delimiter //
create procedure grade(in x int)
begin
declare temp float;
select salary into temp from employee where id =x;
if temp>=45000 then
select 'Platinum Employee'as grade;
else
select 'gold Employee ' as grade;
end if;
end //
delimiter ;
call grade(11);
call grade(8);

drop procedure grade;

delimiter //
 create procedure emp_grade(IN x int)
 BEGIN
DECLARE temp float;
 select salary INTO temp from employee where id=x;
 IF temp>=50000 THEN
 select 'platinum employee' as Grade;
ELSE
 select 'Gold employee' as Grade;
 END IF;
 END //
delimiter ;
call emp_grade(11);
call emp_grade(8);

drop procedure grade;
delimiter //
create procedure grade(in x int)
begin
	declare temp float;
    select salary into temp from employee where id=x;
    if temp>=50000 then
		select 'platinum employee' as grade;
	elseif temp>=40000 and temp<=50000 then
		select 'gold employee' as grade;
	else
		select 'silver employee' as grade;
end if;
end //
delimiter ;
call grade(8);
call grade(11);
call grade(10);

# loops with procedure
delimiter //
create procedure sid(in x int)
begin
	declare i int;
    set i=1;
    while i<=x do
		select i;
        set i=i+1;
	end while;
end //
delimiter ;
call sid(10);
drop procedure abc;
delimiter //
create procedure abc(in x int)
begin
	declare temp float;
	select salary into temp from employee where id=x;
    if temp>=50000 then
		select 'primium client' as class;
    elseif temp>=40000 and temp<50000 then
		select 'gold client' as class;
    else 
		select 'silver client' as class;
	end if;
    end //
    delimiter ;
call abc(8);
call abc(2);
call abc(12); 
    
delimiter //
create procedure abc(in x int)
begin
declare i int;
set i=1;
while i<=x do
	select i;
    set i=i+1;
    end while;
end //
delimiter ;
call abc(5);

delimiter //
create procedure loops()
begin
declare i int;
declare temp float;
set i=1;
while i<=12 do
select salary into temp from employee where id=i;
if temp>=50000 then
select 'platinium member ' as grade;
elseif temp>=40000 and temp<50000 then
select 'gold members ' as grade;
else
select 'silver member ' as grade;
end if;
set i=i+1;
end while;
end //
delimiter ;
call loops();

drop procedure loops;

delimiter //
create procedure rloop(in x int)
begin
declare i int;
set i=1;
repeat
select i as number;
set i=i+1;
until i>x
end repeat;
end //
delimiter ;
call rloop(7);

select sum(salary) as 'salary of total employee' from employee ;

drop procedure rloop;

delimiter //
create function grade(x float)
returns varchar(50)
begin
declare res varchar(50);
if x>=50000 then
	set res='platinium';
elseif x>=40000 and x<50000 then
	set res='gold' ;
else
	set res='silver';
end if;
return (res);
end//
delimiter ;
select name,dept,salary,grade(salary) as grade from employee;

delimiter //
create procedure ab()
begin
declare i int;
set i=1;
myloop:loop
if i>=5 then
leave myloop;
end if;
select i;
set i=i+1;
end loop;
end //
delimiter ;
call ab();