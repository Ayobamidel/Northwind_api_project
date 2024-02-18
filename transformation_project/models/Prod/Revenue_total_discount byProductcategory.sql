SELECT 
C."categoryName" AS Productcategory,
SUM(Ordd."unitPrice" * Ordd."quantity") AS Revenue,
SUM(Ordd."discount") AS Total_discount_amount
FROM
{{ ref('stgCategories') }} AS C
LEFT JOIN 
{{ ref('stgProducts') }} as P
ON 
P."categoryId" = C."categoryId"
LEFT JOIN 
{{ ref('stgOrderdetails') }} AS Ordd
ON
Ordd."productID"= P."productId"
GROUP BY
1
ORDER BY 
2 DESC
