SELECT
	cus."contactTitle",
	COUNT(ord."orderId") AS totalOrder,
	SUM(ordd."unitPrice" * ordd."quantity") AS Revenue
FROM
	{{ ref("stgCustomers") }} AS cus
LEFT JOIN
	{{ ref("stgOrders") }}AS ord
ON
	ord."customerId" = cus."customerId"
LEFT JOIN
	{{ref("stgOrderdetails")}} as ordd
ON
	Ord."orderId" = ordd."orderID"
	GROUP BY
	1
ORDER BY
	2 DESC