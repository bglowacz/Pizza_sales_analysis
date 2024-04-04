with revenue as 
	(select date_format (o.date, "%M") as month, p.pizza_id, pt.category, od.order_id,  p.price*od.quantity as order_total_price  from pizzas p 
	join order_details od on p.pizza_id = od.pizza_id
	join orders o on o.order_id = od.order_id 
	join pizza_types pt on pt.pizza_type_id = p.pizza_type_id
	group by 1,2,3,4,5)
select round(sum(order_total_price),1) as total_revenue from revenue
