create database companydb;
use companydb;
create table course(
course_id int primary key,
course_name varchar(100),
course_duration enum('3 months','4 months','5 months') 
);
insert into course values(1,'fullstack','5 months'), (2,'devops','3 months'),(3,'datascience','4 months'), (4,'dataanalyst','5 months');
alter table course add column location varchar(200);
delete from course where course_id>3;
truncate table course;



create table product(
product_id int,
product_name varchar(100),
price int,
category enum('dress','mobile','cosmetics')
);
insert into product values(1,'saree', 1500,'dress'), (2,'samsung',50000,'mobile'),(3,'kajal',200,'cosmetics');
select * from product where price>1000;

create table employee(
emp_id int primary key,
emp_name varchar(50),
age int,
salary int,
department enum('cse','eee','bme','ece')
);
insert into employee values(1,'shree',23,200500,'bme'),(2,'John',25,25000,'cse'),(3,'anu',28,29000,'eee');
set sql_safe_updates=0;
update employee set salary=35000 where emp_id=2; 
create table customer(
customer_id int primary key,
email varchar(50) unique 
);
insert into customer values(1,'shrelaksh03@gmail.com'),(2,'shrela@gmail.com'),(3,'shre@gmail.com');

alter table customer add column age int;
alter table customer add column price int after customer_id;
alter table customer add column name varchar(100) first;
rename table  employee to employees;
alter table customer rename column email to mail_id;
alter table customer modify column age tinyint;
alter table customer change column age ages  int;
-- tcl




