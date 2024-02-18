SELECT
	cus."contactName" as customername,
	sum(ordd."unitPrice"* ordd."quantity") as Revenue
from
	{{ ref('stgCustomers') }} as cus
left join
	{{ ref( 'stgOrders') }} as ord
on 
ord."customerId" = cus."customerId"
join 
{{ ref('stgOrderdetails') }} as ordd
on 
ord."orderId" = ordd."orderID"
GROUP by 1
ORDER by 2 desc
Limit 10