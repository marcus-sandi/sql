SELECT product_name, price 
FROM product 
ORDER BY price desc 
limit 5;

SELECT * from product;

SELECT *
FROM product 
WHERE price < 10 or LOWER(category) = 'technology'
ORDER BY price DESC
limit 15;

SELECT *
FROM product 
WHERE 
	(price > 10 OR LOWER(sub_category) = 'acessories') 
and
	LOWER(category) = 'technology'
ORDER BY price DESC
limit 15;