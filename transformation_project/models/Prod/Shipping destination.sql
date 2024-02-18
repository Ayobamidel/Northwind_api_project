SELECT
	COUNT(ship."shipperId") AS noOfshippings,
	ord."shipCountry"
FROM
	{{ ref('stgOrders') }} AS ord
JOIN
	{{ ref('stgShippers') }} AS ship
ON
	ord."shipVia" = ship."shipperId"
GROUP BY
	2
ORDER BY
	1 DESC	