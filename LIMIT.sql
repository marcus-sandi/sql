SELECT * 
FROM product
where category != 'Technology' AND
	price <= 1000
ORDER BY price DESC
LIMIT 10;