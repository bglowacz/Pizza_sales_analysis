INSERT INTO `select pizza_id, amount_of_pizzas from (select pizza_id, count(pizza_id) as amount_of_pizzas from order_details od 
group by 1
order by 2 asc) aa
group by 1
order by 2 desc
limit 5` (pizza_id,amount_of_pizzas) VALUES
	 ('big_meat_s',1811),
	 ('thai_ckn_l',1365),
	 ('five_cheese_l',1359),
	 ('four_cheese_l',1273),
	 ('classic_dlx_m',1159);
