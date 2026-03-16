select
    orderid, orderdate, customerid, employeeid, storeid, status as statuscd,
    case 
        when Status = '01' then 'In Progress'
        when Status = '02' then 'Completed'
        when Status = '03' then 'Cancelled'
        Else Null
    end as statusdesc, updated_at
from 
    l1_landing.orders
