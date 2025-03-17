use my_db_hardik


---Creating stage table where transactional data arrives--

create table product_stage(
	Product_id   int,
	Product_name varchar(50),
	Price        decimal(10,2)
);


--- Creating DW table where historical data is stored --

create table product_dim(
	Product_id   int,
	Product_name varchar(50),
	Price        decimal(10,2),
	last_update  date   
);


--- inserting data into product_state table ---

insert into product_stage values (1,'iphone 13',40000),(2,'iphone 14',70000)
insert into product_stage values (1,'iphone 13',30000),(3,'iphone 15',90000)
insert into product_stage values (2,'iphone 14',50000),(4,'iphone 16',95000)

delete from product_stage
delete from product_dim;


--- date varialbe ---
declare @today date = '2025-01-25'

--- inserting data into product_dim table ---
insert into product_dim 
	select Product_id, Product_name, Price, @today
	from product_stage
	where Product_id not in (select Product_id from product_dim)




--- date varialbe ---
declare @today date = '2025-01-25'

---updating the records in dim table as per the changes in stage table---
update product_dim 
set price = product_stage.Price, last_update = @today
from product_stage 
where product_stage.Product_id = product_dim.Product_id



select * from product_stage
select * from product_dim
