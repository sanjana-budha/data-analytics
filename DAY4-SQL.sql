use introd_sql;
show tables;
select * from ecommerce_transactions;

# date & time functions
select datediff(sysdate(),Transaction_date) from ecommerce_transactions;
select date_format("2017-06-15","%m");
select date_format("2017-06-15","%y");
select date_format("2017-06-15","%d");
select day(sysdate());
select quarter(sysdate());
select quarter("2017-07-12");
select adddate(sysdate(), INTERVAL 10 DAY);
select adddate(sysdate(), INTERVAL 10 year);




# nested queries
create table data_new(
emp_name varchar(50),
salary int
);
insert into data_new values('sahil',45000);
insert into data_new values('alice',25000);
insert into data_new values('bob',35000);
insert into data_new values('charlie',55000);
insert into data_new values('david',50000);
select * from data_new;

# print salaries that are greater than avg(salary)
select * from data_new where salary > (select avg(salary) from data_new);
select avg(salary) from data_new;

# print salary greater than a spcific person
select salary from data_new where emp_name='alice';
select * from data_new where salary > (select salary from data_new where emp_name='bob');

# print 1nd highest salary
select * from data_new where salary = (select max(salary) from data_new);

# print 2nd highest salary
select max(salary) from data_new where salary < (select max(salary) from data_new);


# VIEWS
use introd_sql;
show tables;
select * from ecommerce_transactions;

create view children as select Product_Category from ecommerce_transactions where Product_Category = 'Sports';
select * from children;
create view childrens as select Product_Category,Purchase_Amount from ecommerce_transactions where Product_Category = 'Sports';
select * from childrens;
create view child as select *  from ecommerce_transactions where Product_Category = 'Sports';
select * from child;
 # only sports category in the producat_category will be displayed from the entire product_category column.

create view data1 as select salary,emp_name from data_new where salary > '35000';
select * from data1;
