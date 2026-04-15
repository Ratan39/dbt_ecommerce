SELECT
    O.storeid
    SUM(f.revenue) AS total_revenue
FROM
    {{ ref('orders_stg') }} o
JOIN
    {{ ref('orders_fact') }} f 
ON 
    o.orderid = f.orderid
GROUP BY 1