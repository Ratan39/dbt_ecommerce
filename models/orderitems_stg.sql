select
    orderitemid, orderid, productid, quantity, unitprice, quantity * unitprice as total_price, updated_at
from 
    l1_landing.orderitems