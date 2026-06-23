create database joins_sql;
use joins_sql;

create table customers(
cust_name varchar(25),
cust_id int,
address varchar(50),
city varchar(25),
postalcode int,
country varchar(30),
primary key (cust_id)
);

create table order_info(
orderid int,
cust_id int,
emp_id int,
orderdate datetime,
shipperid int,
primary key(orderid)
);

insert into customers values('sanjana',1,'dmm','atp',515671,'india');
insert into customers values('alice',2,'dmm','atp',515671,'india');
insert into customers values('bob',3,'mpl','mpl',517325,'india');
insert into customers values('charlie',4,'btp','atp',514568,'usa');
insert into customers values('david',5,'arc','mnb',971358,'africa');
insert into customers values('eve',6,'kesavanagar','bng',512376,'uk');
insert into customers values('fred',7,'kgp','hyd',587623,'uk');
insert into customers values('geogre',8,'kyp','hongkong',432865,'japan');

select *from customers;

insert into order_info values(901,1,1,sysdate(),92801);
insert into order_info values(902,2,2,sysdate(),92802);
insert into order_info values(903,3,3,sysdate(),92803);
insert into order_info values(904,4,4,sysdate(),92804);
insert into order_info values(905,5,5,sysdate(),92805);
insert into order_info values(906,6,6,sysdate(),92806);
insert into order_info values(907,7,7,sysdate(),92807);

select *from order_info;

#left join
select c.cust_id,c.cust_name,c.country,o.orderid,o.orderdate
from customers c left join order_info o
on c.cust_id = o.cust_id;

#right join
select c.cust_id,c.cust_name,c.country,o.orderid,o.orderdate
from customers c right join order_info o
on c.cust_id = o.cust_id;

# using where
select c.cust_id,c.cust_name,c.country,o.orderid,o.orderdate
from customers c, order_info o where
c.cust_id = o.cust_id;

# left-outer join
select c.cust_id,c.cust_name,c.country,o.orderid,o.orderdate
from customers c left outer join order_info o
on c.cust_id = o.cust_id;

# right-outer join
select c.cust_id,c.cust_name,c.country,c.city,o.orderdate,o.orderid,o.shipperid
from customers c right outer join order_info o 
on c.cust_id=o.cust_id;

# inner join
select c.cust_id,c.cust_name,c.country,o.orderid,o.orderdate
from customers c inner join order_info o
on c.cust_id = o.cust_id;

# for getting both (full) join
select c.cust_id,c.cust_name,c.country,o.orderid,o.orderdate
from customers c left join order_info o
on c.cust_id = o.cust_id
union
select c.cust_id,c.cust_name,c.city,o.orderdate,o.orderid
from customers c right join order_info o
on c.cust_id = o.cust_id;

# cross join
select * 
from customers
cross join order_info;

