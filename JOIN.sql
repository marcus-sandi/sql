SELECT
	S.*,
    CA.city
FROM sales AS S
INNER JOIN CAMPAIGN AS CA
	ON CA.customer_id = S.customer_id
WHERE S.order_date LIKE '2022-04%'
