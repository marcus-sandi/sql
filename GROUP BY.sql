SELECT 
  category as CATEGORIA,
  COUNT(*) AS TOTAL_LINHAS,
  COUNT(DISTINCT product_id) AS TOTAL_PRODUTOS,
  AVG(price) as MEDIA_VALOR,
  MAX(price) AS MAIOR_VALOR,
  MIN(price) as MENOR_VALOR
FROM product AS P
GROUP BY category;

SELECT category, 
	sub_category,
	SUM(price) AS VALOR_TOTAL,
    AVG(price) AS PRECO_MEDIO
FROM product 
WHERE price BETWEEN 10 AND 1000
GROUP BY 
	sub_category,
    category
ORDER BY 4
LIMIT 8;
