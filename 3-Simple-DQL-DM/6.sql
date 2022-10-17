select count(*) from car;
select sum(price) from spr;

select count(*) as KIA  from car where Make='Kia';
select count(*) as Nissan from car where Make='Nissan';
 
select sum(price) from spr where price<1000;