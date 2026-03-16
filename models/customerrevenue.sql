SELECT
    o.customerid,
    c.customer_name,
    SUM(o.order_count) AS ordercount,
    SUM(o.revenue) AS revenue
FROM
    {{ ref('orders_fact') }} o
JOIN
    {{ ref('customers_stg') }} c ON o.customerid = c.customerid
GROUP BY
    o.customerid,
    c.customer_name