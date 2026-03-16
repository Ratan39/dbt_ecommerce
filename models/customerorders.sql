{{  config(materialized = 'table')    }}
with customer_orders as (
    select
        c.customerid, concat(c.firstname, ' ', c.lastname) as customer_name, count(o.orderid) as no_of_orders
    from 
        l1_landing.customers c
    join    
        l1_landing.orders o
    on 
        c.customerid = o.customerid
    group by
        c.customerid, customer_name
    order by 
        no_of_orders desc)
select 
    customerid, customer_name, no_of_orders
from 
    customer_orders