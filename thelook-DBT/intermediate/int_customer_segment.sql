SELECT 
id, 
first_name,
last_name, 
gender,
age,
   case
     when age >= 65 then "5.old"
     when age between 45 and 65 then "4.middle_aged"
     when age between 30 and 45 then "3.adult"
     when age between 18 and 30 then "2.young"
     else "1.infant"
   end as age_group,
traffic_source
FROM {{ref("stg_users")}}