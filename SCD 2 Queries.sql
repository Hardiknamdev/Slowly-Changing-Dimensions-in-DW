use my_db_hardik1

---Creating stage table where transactional data arrives--
create table product_stage(
	Product_id   int,
	Product_name varchar(50),
	Price        decimal(10,2)
);


--- Creating DW table where historical data is stored --
create table product_dim(
	Product_key  int identity(1,1),
 	Product_id   int,
	Product_name varchar(50),
	Price        decimal(10,2),
	start_date   date,
	end_date     date
);



delete from product_stage
delete from product_dim;


--- inserting data into product_state table ---
insert into product_stage values (1,'iphone 13',40000),(2,'iphone 14',70000)
insert into product_stage values (1,'iphone 13',30000),(3,'iphone 15',90000)
insert into product_stage values (1,'iphone 13',25000)



delete from product_stage
delete from product_dim;


--- date varialbe ---
declare @today date = '2025-01-25'


---updating the records in dim table as per the changes in stage table to maintain history---
update product_dim 
set end_date = DATEADD(day,-1,@today)
from product_stage 
where product_stage.Product_id = product_dim.Product_id
and end_date = '9999-12-31'


--- date varialbe ---
declare @today date = '2025-01-25'

--- inserting data into product_dim table ---
insert into product_dim 
	select Product_id, Product_name, Price, @today, '9999-12-31'
	from product_stage
	---where Product_id not in (select Product_id from product_dim)



select * from product_stage
select * from product_dim


