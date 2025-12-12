SELECT
  traffic_source,
  age_group,
  count(*) nb_of_users,
  ROUND( count(*) / SUM( count(*)) OVER (PARTITION BY traffic_source) * 100, 2) AS share_of_group,
  SUM( count(*)) OVER (PARTITION BY traffic_source) as total_traffic_source
FROM {{ref("int_customer_segment")}}
group by traffic_source, age_group
ORDER BY traffic_source, age_group