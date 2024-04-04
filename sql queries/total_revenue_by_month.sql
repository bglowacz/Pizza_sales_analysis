with 
	order_prices as (select date_format(o.date, "%M") as month, p.pizza_id, od.quantity, p.price, p.price*od.quantity as order_total_price  from pizzas p 
	join order_details od on p.pizza_id = od.pizza_id
	join orders o on o.order_id = od.order_id 
	group by 1,2,3,4),
	month_and_revenue as (select month, sum(order_total_price) as total_revenue from order_prices group by 1)
select month, total_revenue from month_and_revenue
