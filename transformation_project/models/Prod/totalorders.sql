select 
count ("orderId") as totalnoofOrders
from {{ ref('stgOrders') }}