WITH monthly_sales AS (
    SELECT
        DATE_TRUNC('month', o."orderDate" ::date) AS month,
        SUM(od."unitPrice" * od."quantity") AS total_sales
    FROM
        {{ ref('stgOrders') }} AS o
	join
       {{ ref('stgOrderdetails') }} AS od 
	on o."orderId" = od."orderID"
    GROUP BY
        1
)
SELECT
    month,
    total_sales,
    LAG(total_sales) OVER (ORDER BY month) AS previous_month_sales,
    (total_sales - LAG(total_sales) OVER (ORDER BY month)) / LAG(total_sales) OVER (ORDER BY month) * 100 AS growth_rate
FROM
    monthly_sales
ORDER BY
    month