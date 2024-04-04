with 
	total_revenue_table as (select case when date_format (o.date, "%M") = 'January' or date_format (o.date, "%M") = 'February' or date_format (o.date, "%M") = 'March' then "1st quarter"
	when date_format (o.date, "%M") = 'April' or date_format (o.date, "%M") = 'May' or date_format (o.date, "%M") = 'June' then "2nd quarter"
	when date_format (o.date, "%M") = 'July' or date_format (o.date, "%M") = 'August' or date_format (o.date, "%M") = 'September' then "3rd quarter"
	when date_format (o.date, "%M") = 'October' or date_format (o.date, "%M") = 'November' or date_format (o.date, "%M") = 'December' then "4th quarter"
	end as month, 
	p.pizza_id, pt.category, od.order_id,  p.price*od.quantity as order_total_price  from pizzas p 
	join order_details od on p.pizza_id = od.pizza_id
	join orders o on o.order_id = od.order_id 
	join pizza_types pt on pt.pizza_type_id = p.pizza_type_id
	group by 1,2,3,4,5)
select month, round(sum(order_total_price),1) as total_revenue from total_revenue_table group by 1
