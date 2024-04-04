#  BY this query i extract information about the size of the pizza, followed by the word after the last occurrence of the character '_'
SELECT distinct REVERSE(SUBSTRING_INDEX(REVERSE(pizza_id), '_', 1)) AS size_data FROM order_details od
