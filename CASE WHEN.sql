SELECT 
CASE 
	WHEN UPPER(category) = 'OFFICE SUPPLIES' THEN category
    WHEn  UPPER(category) = 'FURNITURE' THEN category
    ELSE 'Others'
    END as TIPO_CATEGORIA,
    SUM (CASE WHEN UPPER(product_name) LIKE '%GRAY%' THEN 1 ELSE 0 END) as VALIDA_CINZA
FROM product
GROUP BY
CASE 
	WHEN UPPER(category) = 'OFFICE SUPPLIES' THEN category
    WHEn  UPPER(category) = 'FURNITURE' THEN category
    ELSE 'Others'
    END