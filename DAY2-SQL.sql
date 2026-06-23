create database new_SQL;
use new_SQL;
# DDL QUERIES
create table emp(
emp_id INT not null,
manager_name varchar(50),
division int,
primary key(emp_id)
);

create table emp1(
first_name varchar(25),
last_name varchar(25),
title varchar(25),
age int,
salary int
);
desc emp1;

alter table 
emp1 
add gender 
varchar(10);
alter table emp1 add random varchar(1);

alter table 
emp1 
drop column 
random;
alter table emp1 
drop column gender;

# DQL QUERIES

create table em_info(
first_name varchar(50),
last_name varchar(50),
id int,
age int not null,
city varchar(20),
state varchar(25),
primary key (id)
);
desc em_info;

insert into em_info values('sanju','budha',58,19,'dmm','ap');
insert into em_info values('reethu','veera',59,19,'tpt','mp');
insert into em_info values('harika','nama',64,20,'mpl','ap');
insert into em_info values('krishna','kumar',60,21,'gan','up');
insert into em_info values('himasri','sree',62,21,'ong','assam');
insert into em_info values('yeshwin','budha',63,20,'chirala','up');
insert into em_info values(null,null,66,25,null,'ap');
select * from em_info;

select first_name, last_name from em_info;

select first_name as firstName, last_name as LastName from em_info;

select first_name as firstname, last_name as lastname,city from em_info where id = 60;

select count(id) from em_info;

select count(*) from em_info;

select first_name, last_name, city, state from em_info where first_name like 'k%';
select first_name, last_name, city, state from em_info where first_name like '%a';
select first_name, last_name, city, state from em_info where last_name like '%a%';
select * from em_info where first_name like '_anju';

select * from em_info where age>20;
select first_name,last_name,age,city from em_info where age<=20;
select * from em_info where age>15 and age<=20;
select *from em_info where age<=20 and city='mpl';

#DML QUERIES
create table new(
first_name varchar(30),
last_name varchar(25),
age int,
designation varchar(50),
salary float
);

insert into new values('jonie','weber',20,'secretary',30000);
insert into new values('bob','williams',22,'programmer_II',33500);
insert into new values('dirk','smith',21,'programmer',30000);
insert into new values('alice','joe',25,'secretary',30000);
insert into new values('john','smith',27,'programmer-III',50000);
insert into new values('johny','rolls',29,'programmer',33500);
insert into new values('christian','ronaldo',24,'programmer-II',33500);

select * from new;

SET SQL_SAFE_UPDATES=0;
# jonie weber just got married to bob williams. she requested that her last name be updated to weber-williams.
update new set last_name='weber-williams' where first_name='jonie';

# dirk-smith's birthday is today, add 1 to his age.
update new set age=age+1 where first_name='dirk';

# all secretaries are now called "administrative assistant". update all titles accordingly. 
update new set designation='administrative_assistant' where designation='secretary';

# everyone that's making under 30000 are to receive a 3500 a year raise.
update new set salary=salary+3500 where salary<=30000;

# everyone that's making over 33500 are to receive a 4500 a year raise.
update new set salary=salary+4500 where salary>=33500;

# all programmer-II titles are now promoted to programmer-III
update new set designation='programmer-III'  where designation='programmer-II';
update new set designation='programmer-III'  where designation='programmer_II';

# all programmer titles are now promoted to programmer-II
update new set designation='programmer-II'  where designation='programmer';

