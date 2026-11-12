-- aggregate functio => min, max, sum, avg,count, group by, order by
-- it takes multitple rows and produce summary result
use abccompancy;
select min(staff_salary) from staff_table; -- we can only chose the selected column  
select max(staff_salary) from staff_table;
select avg(staff_salary) from staff_table;

select sum(staff_salary) as total from staff_table;
select count(staff_name) as names from staff_table;
select count(*) as names from staff_table;
-- group by
-- select max(staff_salary), staff_role from staff_table 
-- group by staff_role having (staff_salary)>53000   order by staff_role desc ;
-- select max(staff_salary), staff_role from staff_table  where id in(1,2,3,4,5);
select max(staff_salary), staff_role from staff_table 
 group by staff_role having max(staff_salary)>40000 order by staff_role asc;
 
 -- windows function => partition, order by, rank, dense_rank, row, 
 -- overcome column functions  in the aggregate 
 select *,min(staff_salary) over(order by staff_name) from staff_table;
 select * , max(staff_salary) over(partition by staff_role order by staff_name desc) as maxsalary from staff_table;

select *,count(*) over(partition by staff_role) as Counts from staff_table;
select *, sum(staff_salary) over(partition by staff_role) as sumsalary from staff_table;
select *, avg(staff_salary) over(partition by staff_role) as avgsalary from staff_table;
select *, avg(staff_salary) over(order by staff_name asc) as average from staff_table;
select staff_name,staff_role, max(staff_salary) over(order by staff_role) as max_salary from staff_table;

-- rank, dense-rank
select *, rank() over(order by staff_salary desc) as ranks from staff_table;

select *, dense_rank() over(order by staff_salary asc) as ranks from staff_table;

select *, row_number() over(order by staff_doj) as 'row' from staff_table;

-- ntitle, lead, lag,

select *, ntile(6) over(partition by staff_role) from staff_table; 

select *, ntile(2) over(partition by staff_role) as 2parts from  staff_table;

select *, lag(staff_salary) over(order by staff_salary desc) as lagdata from staff_table;

select *, lead(staff_salary) over(order by staff_salary desc) as lagdata from staff_table;

-- distinct=> remove duplicate during select

select distinct(staff_role) from staff_table;
-- like=>alter

select * from staff_table where staff_name like 'a%n%d';
select * from staff_table where staff_salary like '50%';
select min(staff_salary), staff_role from staff_table 
group by staff_role having  min(staff_salary)>1000 order by staff_role asc limit 5 offset 1; 
select * from staff_table order by staff_salary desc	 limit 5 ; 
select staff_role, count(*) from staff_table group by staff_role having count(staff_name)<5 order by staff_role asc ;
-- employees eaarnig more than avg salary using subquery
select staff_salary from staff_table where staff_salary>(select avg(staff_salary) from staff_table);
select avg(staff_salary) from staff_table;
select max(staff_salary) from staff_table  where staff_salary<(select max(staff_salary) from staff_table);

	select *, rank() over(partition by staff_role  order by staff_salary desc ) from staff_table;







