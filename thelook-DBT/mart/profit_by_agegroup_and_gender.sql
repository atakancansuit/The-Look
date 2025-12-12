with user_and_order as (
select
o.id,
order_id,
user_id,
u.age_group,
u.gender,
o.status,
profit from  {{ref("int_orders_products")}} as o
left join {{ref("int_customer_segment")}} as u on o.user_id = u.id
where status = "Complete"
)

SELECT 
age_group,
gender,
round(SUM(profit),2) as total_profit

 FROM user_and_order 
 group by age_group,gender order by age_group desc