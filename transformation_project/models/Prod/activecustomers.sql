select
o."customerId",
        date_trunc('month', o."orderDate"::date) as order_month,
        count(distinct o."customerId") as active_customers
    from
        {{ ref('stgOrders') }} AS O
    group by
        2,1