SELECT 
    SUM("stgOrderdetails"."unitPrice" * "stgOrderdetails"."quantity") AS total_revenue
FROM 
{{ ref("stgOrderdetails") }}
