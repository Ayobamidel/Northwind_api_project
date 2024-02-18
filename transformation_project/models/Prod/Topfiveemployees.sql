SELECT
	CONCAT(emp."firstName", ' ', emp."lastName") AS fullName,
	COUNT(ord."orderId") AS totalOrder,
	SUM(ordd."quantity" * ordd."unitPrice") AS revenue
FROM
	{{ref('stgOrderdetails') }} AS ordd
LEFT JOIN
	{{ ref('stgOrders') }} AS ord
ON
	ordd."orderID" = ord."orderId"
LEFT JOIN
	{{ ref('stgEmployees') }} AS emp
ON
	ord."employeeId" = emp."employeeId"
GROUP BY
	1
ORDER BY
	2 DESC
