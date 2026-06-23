create database Introd_SQL;
use Introd_SQL;
create Table Students(
Student_id INT,
student_name VARCHAR(50),
student_age INT,
Gender VARCHAR(1),
department VARCHAR(75)
);
desc Students;
INSERT INTO Students values(1,'Sanju',19,'F','CSE');
insert into Students values(2,'Alice',20,'F','ECE');
insert into Students values(3,'Bob',20,'M','CSE');
select *from Students;
Alter Table Students modify Student_id INT not null;
Alter Table Students ADD primary key (Student_id);
insert into students values(null,'charlie',19,'F','ECE');

create table dept(
Student_id INT,
dept_id INT PRIMARY KEY,
dept_name varchar(26),
foreign key (Student_id) references Students(Student_id)
);
