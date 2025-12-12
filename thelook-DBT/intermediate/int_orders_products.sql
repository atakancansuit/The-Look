SELECT
  o.id,
  o.order_id,
  o.user_id,
  o.product_id,
  p.name,
  p.category,
  round(o.sale_price,2) as sale_price,
  round(p.cost,2) as cost,
  round(o.sale_price-p.cost,2) AS profit,
  o.status,
  DATE(o.created_at) AS created_at,
  DATE(o.shipped_at) AS shipped_at,
  DATE(delivered_at) AS delivered_at,
  DATE(returned_at) AS returned_at,
FROM
  {{ref("stg_order_items")}} o
left join {{ref("stg_products")}} p
on o.product_id=p.id