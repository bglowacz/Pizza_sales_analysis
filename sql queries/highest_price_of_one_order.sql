with 
	avg_order_price as (select p.pizza_id, pt.category, od.order_id,  p.price*od.quantity as order_price  from pizzas p 
	join order_details od on p.pizza_id = od.pizza_id
	join orders o on o.order_id = od.order_id 
	join pizza_types pt on pt.pizza_type_id = p.pizza_type_id
	group by 1,2,3,4)
select round(max(order_price),2) as highest_price_of_one_order from avg_order_price
