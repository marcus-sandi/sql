SELECT
	C.state ESTADO,
    count(DISTINCT s.order_id) QTDE
FROM sales S
left JOIN customer C
	on C.customer_id = S.customer_id
GROUP BY C.state
HAVING QTDE BETWEEN 30 AND 100