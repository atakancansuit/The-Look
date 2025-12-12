SELECT 
FORMAT_DATE('%Y-%m', DATE(created_at)) AS year_month,
round(SUM(profit),2) as total_profit

 FROM  {{ref("int_orders_products")}} where status = "Complete"
 group by year_month order by year_month desc