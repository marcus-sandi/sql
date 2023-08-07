SELECT
    C.city,
    count(DISTINCT S.order_id) QTDE_VENDAS
FROM sales S
INNER JOIN 
	(SELECT * 
     FROM product
     WHERE category = 'Technology'
    ) P 
    on S.product_id = P.product_id
INNER JOIN
	(SELECT * 
     FROM customer
     where state = 'California'
     ) C
     on C.customer_id = S.customer_id
GROUP BY 
    C.city
ORDER BY QTDE_VENDAS DESC
LIMIT 3
	