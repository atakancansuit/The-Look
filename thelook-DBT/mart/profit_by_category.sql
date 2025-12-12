SELECT 
category,
round(SUM(profit),2) as total_profit

 FROM  {{ref("int_orders_products")}} where status = "Complete"
 group by category order by total_profit desc