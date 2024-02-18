SELECT
    ordd."orderID",
    pro."productId",
    pro."productName",
    cat."categoryName" AS productCategory,
    (ordd."unitPrice" * ordd."quantity") AS price,
    (ordd."discount") AS discount
FROM
    {{ ref("stgProducts") }} AS pro
LEFT JOIN
    {{ ref("stgOrderdetails") }} AS ordd
ON
    ordd."productID" = pro."productId"
LEFT JOIN
    {{ ref ("stgOrders") }} AS ord
ON
    ordd."orderID" = ord."orderId"
LEFT JOIN
    {{ ref ("stgCategories") }} AS cat
ON
    cat."categoryId" = pro."categoryId"
GROUP BY
    1, 2, 3, 4, 5, 6