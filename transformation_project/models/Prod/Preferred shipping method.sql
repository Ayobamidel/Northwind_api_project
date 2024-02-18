SELECT 
sh."companyName" AS Shipping_method,
COUNT (od."orderId") AS total_no_of_orders,
od."shipVia" AS ShipPingID
FROM
{{ ref('stgOrders') }} AS od
LEFT JOIN 
{{ ref('stgShippers') }} as sh
ON
od."shipVia"= sh."shipperId"
GROUP BY 1,3
ORDER BY 2 DESC