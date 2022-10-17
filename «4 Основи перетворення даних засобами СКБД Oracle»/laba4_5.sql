select 
    count(*)
from car
GROUP by user_id
union ALL
select count(*) as Total
from car; 
