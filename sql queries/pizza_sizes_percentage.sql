# Based on query about extracting information about sizes of a pizzas i execute query to find what is percentage of every size of a pizza
with pizza_size as
	(select case when REVERSE(SUBSTRING_INDEX(REVERSE(pizza_id), '_', 1)) = "s" then "small" 
	when REVERSE(SUBSTRING_INDEX(REVERSE(pizza_id), '_', 1)) = "m" then "medium"
	when REVERSE(SUBSTRING_INDEX(REVERSE(pizza_id), '_', 1)) = "l" then "large"
	when REVERSE(SUBSTRING_INDEX(REVERSE(pizza_id), '_', 1)) = "xl" then "xl"
	when REVERSE(SUBSTRING_INDEX(REVERSE(pizza_id), '_', 1)) = "xxl" then "xxl"
	end as size, 
	sum(quantity) as amount_of_pizza from order_details od 
	group by size),
	total_quantity as (select sum(quantity) as total_amount_of_pizzas from order_details od)
select size, round(amount_of_pizza/total_amount_of_pizzas,3)*100 as percentage from pizza_size, total_quantity
group by 1, 2

