-- 
SELECT 
	P.product_name AS PRODUTO, 
    P.price AS PREÇO, 
    COUNT(DISTINCT S.order_id) as QTDE_VENDAS
from product AS P
left JOIN sales AS S 
	ON S.product_id = P.product_id
GROUP BY PRODUTO, PREÇO
ORDER BY PREÇO DESC
LIMIT 5


-- cidades com menores vendas
-- pra ficar com maiores vendas, colocar DESC no ORDER BY
SELECT 
	C.city AS CIDADE, 
    COUNT(DISTINCT S.order_id) AS QTDE_VENDAS
from customer AS C
left join sales as S 
	ON S.customer_id = C.customer_id
GROUP BY CIDADE
ORDER BY QTDE_VENDAS 
LIMIT 10



