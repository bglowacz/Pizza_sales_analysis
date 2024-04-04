select 
	pizza_id, amount_of_pizzas from 
	(select pizza_id, count(pizza_id) as amount_of_pizzas from order_details od 
	group by 1
	order by 2 asc) od2
group by 1
order by 2 desc
limit 5
