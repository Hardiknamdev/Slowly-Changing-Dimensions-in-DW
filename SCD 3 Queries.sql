use my_db_hardik2


---Creating stage table where transactional data arrives--

create table product_stage(
	Product_id   int,
	Product_name varchar(50),
	Current_Price decimal(10,2),
	Previous_Price decimal(10,2)
);


--- Creating DW table where limited historical data is stored --

create table product_dim(
	Product_id   int,
	Product_name varchar(50),
	Current_Price decimal(10,2),
	Previous_Price decimal(10,2),
	last_update  date   
);


--- inserting data into product_state table ---

insert into product_stage values (1,'iphone 13',40000, null)
insert into product_stage values (1,'iphone 13',30000,40000),(2,'iphone 14',60000, null)
insert into product_stage values (1,'iphone 13',25000,30000),(2,'iphone 14',50000, 60000),(3,'iphone 15',70000, null) 

delete from product_stage
delete from product_dim;


--- date varialbe ---
declare @today date = '2025-03-04'

--- inserting data into product_dim table ---
insert into product_dim 
	select Product_id, Product_name, Current_Price,Previous_Price,@today
	from product_stage
	where Product_id not in (select Product_id from product_dim)




--- date varialbe ---
declare @today date = '2025-03-04'

---updating the records in dim table as per the changes in stage table---
update product_dim 
set Current_Price = product_stage.Current_Price, Previous_Price = product_stage.Previous_Price, last_update = @today
from product_stage 
where product_stage.Product_id = product_dim.Product_id



select * from product_stage
select * from product_dim

