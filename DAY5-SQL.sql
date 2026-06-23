create database fun;
use fun;
show tables;
create table players(
player_id int,
player_name varchar(30),
country varchar(30),
goals int
);

insert into players values(1,'Ronaldo','Portugal',100);
insert into players values(2,'Messi','Argentina',90);
insert into players values(3,'Neymar','Brazil',80);
insert into players values(4,'Sunil','India',110);
insert into players values(5,'Jagadish','USA',10);
insert into players values(6,'peddi','GlobalStar',150);

select * from players;

select * from players where goals > 100;

delimiter && 
create procedure top_players() 
begin 
select player_name,country,goals from players where goals > 100;
end&&
delimiter ;

call top_players();

# stored procedure types --> IN & OUT
select player_name,country,goals from players order by goals desc limit 1;
# top 3 players
delimiter && 
create procedure top_player_sort_by_goals(IN num INT)
begin
select player_name,country,goals from players order by goals desc limit 3;
end&&
delimiter ;
call top_player_sort_by_goals(3);
# for top 1 player
delimiter && 
create procedure top_player_sort_by_goals(IN num INT)
begin
select player_name,country,goals from players order by goals desc limit 1;
end&&
delimiter ;
call top_player_sort_by_goals(1);

# create procedure for update
SET SQL_SAFE_UPDATES=0;
update players set goals = 200 where player_name = 'Ronaldo';
delimiter //
create procedure update_players(IN num int, IN player varchar(30))
begin
update players set goals = num where player_name = player;
end //
delimiter ;
call update_players(300,'Ronaldo');
select * from players;

# total_count of player based on country
delimiter //
create procedure player_count_country(IN var varchar(25), OUT total_player int)
begin
select count(*) from players where country = var into total_player;
end//
delimiter ;
call  player_count_country('India',@total_count);
select @total_count as player_count_country;


use introd_sql;
show tables;
select * from ecommerce_transactions;

create table ProductCategorycountry1 as
select sum(age), Product_Category from ecommerce_transactions group by Product_Category;

select * from ProductCategorycountry1;

select a.Product_Category,a.*,sum(age)
over (partition by a.Product_Category) as
total_age from ecommerce_transactions a;

select a.age,a.*,sum(Purchase_Amount)
over (partition by a.age) as
total_Purchase_Amount from ecommerce_transactions a;

select row_number() over (order by Purchase_Amount)
as row_num , Product_Category,Purchase_Amount from ecommerce_transactions 
order by Purchase_Amount;

select row_number() over (order by Product_Category)
as row_num,Product_Category from ecommerce_transactions
order by Product_Category;

CREATE table demo (var_a int);
insert into demo values(101),(102),(103),(103),(104),(105),(106),(106);
select * from demo;

select var_a,
rank() over (order by var_a) as tese_ranks
from demo;

use introd_sql;
show tables;
select * from housing;

select households from housing
where total_rooms = (select max(total_rooms) from housing);

select households from housing order by
total_rooms desc limit 1;

select *,first_value(housing_median_age) over
(order by total_rooms desc) as
highest from housing;

# ttriggers using players table
DELIMITER //

CREATE TRIGGER check_goals
BEFORE INSERT
ON players
FOR EACH ROW
BEGIN

   IF NEW.goals < 0 THEN
      SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT='Goals cannot be negative';
   END IF;

END//

DELIMITER ;
insert into players values(7,'name','goa',-50);