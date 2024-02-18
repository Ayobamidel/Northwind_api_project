SELECT 
ord."orderDate",
COUNT (ord."orderId") AS totalnooforders,
SUM (ordd."unitPrice" * ordd."quantity") AS Revenue
FROM
{{ ref('stgOrders') }} AS ord
LEFT JOIN
{{ ref('stgOrderdetails') }} AS ordd
ON
ord."orderId"=ordd."orderID"
GROUP BY
1