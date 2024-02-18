SELECT 
O."orderId",
O."shipCity"
from
{{ ref('stgOrders') }} AS O
GROUP BY
2,1