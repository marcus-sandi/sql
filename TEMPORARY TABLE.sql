CREATE TEMPORARY TABLE P AS
	SELECT * 
     FROM product
     WHERE category = 'Technology';
 
CREATE TEMPORARY TABLE C AS
	SELECT * 
     FROM customer
     where state = 'California';
 
SELECT
    C.city,
    count(DISTINCT S.order_id) QTDE_VENDAS
FROM sales S
INNER JOIN P on S.product_id = P.product_id
INNER JOIN C on C.customer_id = S.customer_id
GROUP BY C.city
ORDER BY QTDE_VENDAS DESC
LIMIT 3
     
SELECT 
	category,
	product_name PRODUTO,
    C.state ESTADO,
    COUNT(DISTINCT order_id) QTDE_VENDIDA
from sales S
  inner join C on C.customer_id = S.customer_id
  inner join product ON product.product_id = S.product_id
GROUP BY product_name,  C.state, category
ORDER BY QTDE_VENDIDA DESC
LIMIT 10