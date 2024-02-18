SELECT
	cus."contactName" as customername,
	count(ord."orderId") as NoOfOrders
from
	{{ ref("stgCustomers") }} as cus
left join
	{{ ref("stgOrders") }} as ord
on ord."customerId" = cus."customerId"
GROUP by 1
ORDER by 2 desc
LIMIT 10