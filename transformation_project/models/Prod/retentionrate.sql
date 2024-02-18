WITH retention AS
(SELECT
    "customerId",
    COUNT (DISTINCT "customerId") AS noOfpatronage,
     CAST("orderDate" as DATE) AS Orderdate
FROM
    {{ ref("stgOrders") }}
GROUP BY
    1,3)
SELECT
    "customerId",
    COUNT(retention."noofpatronage") AS noOfpatronage,
    MIN(retention."orderdate") AS firstOrderdate,
    MAX(retention."orderdate") AS lastOrderdate
FROM
    retention
GROUP BY
    1
HAVING
    COUNT(retention."noofpatronage") > 1