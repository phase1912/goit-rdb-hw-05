-- task 1
select 
	od.*, 
	(select o.customer_id from orders o where o.id = od.order_id) as customer_id 
from order_details od 

-- task 2
select * from order_details od 
where order_id in (select o.id  from orders o where  o.shipper_id = 3)

-- task 3
select 
	tmp.order_id , AVG(tmp.quantity) as avg_quantity
from (select * from order_details od where od.quantity > 10) as tmp
GROUP by tmp.order_id

-- task 4
WITH temp AS (
	select * from order_details od where od.quantity > 10
)
select temp.order_id , AVG(temp.quantity) as avg_quantity
from temp
GROUP by temp.order_id

-- task 5
drop function if exists divide_values;

create function divide_values(val1 float, val2 float)
returns float
deterministic
begin
	return val1 / val2;
end;

select 
    id, 
    order_id, 
    product_id, 
    quantity, 
    divide_values(quantity, 2) AS divided_quantity 
from 
    order_details;
