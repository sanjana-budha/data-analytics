use introd_sql;
show tables;
select * from housing;

# aggregate functions
select total_rooms, count(*) from housing
group by total_rooms;
select total_bedrooms, count(*) from housing
group by total_bedrooms;
select total_rooms,total_bedrooms, count(*) from housing
group by total_rooms,total_bedrooms;
select total_rooms from housing;
select sum(total_rooms) from housing;
select min(total_rooms) from housing;
select round(avg(total_rooms),2) from housing;
select max(total_rooms) from housing;

#string functions

use new_sql;
show tables;
select * from em_info;

select concat(first_name,last_name)
from em_info;
select trim(concat(first_name,last_name))
from em_info;
select substr("SQL TUTORIAL",5,8) AS extractstring;
select substr("Budha Sanju",7,6) AS extractstring;
select first_name, upper (first_name) from em_info;
select first_name, lower (first_name) from em_info;
select character_length("hello world") as ch;
select character_length(first_name) from em_info;
select mid("hello world",2,3);
select mid(first_name,2,3) from em_info;