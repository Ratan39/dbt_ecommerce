{{ config(materialized='table') }}


select
    orderid, orderdate, customerid, employeeid, storeid, status as statuscd,
    case 
        when Status = '01' then 'In Progress'
        when Status = '02' then 'Completed'
        when Status = '03' then 'Cancelled'
        Else Null
    end as statusdesc, 
    case 
        when storeid = 1000 then 'Online'
        else 'In-store'
    end as Order_channel, updated_at, current_timestamp as dbt_updated_at
from 
    {{   source('landing', 'orders')   }}

{% if is_incremental() %}
where updated_at >= (select max(dbt_updated_at) from {{ this }})
{% endif %}
