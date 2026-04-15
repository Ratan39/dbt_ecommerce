select 
    o.storeid, sum(f.revenue) as actual_sales, sum(s.salestarget) as target_sales
from 
    {{  ref('orders_stg')    }} o
join 
    {{  ref('orders_fact')  }} f
on 
    o.orderid = f.orderid
join
    {{  ref('salestarget')  }} s
on 
    o.storeid = s.storeid
group by 
    1