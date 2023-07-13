/*VISITOR REPORT*/

select v.first_name, v.last_name, m.first_name, m.last_name
from visitor as v
inner join martian as m
on v.host_id = m.martian_id;

select v.first_name, v.last_name, m.first_name, m.last_name
from visitor as v
left join martian as m
on v.host_id = m.martian_id;

select v.first_name as visitor_fn, v.last_name as visitor_ln, 
m.first_name as martian_fn, m.last_name as martian_ln
from visitor as v
left join martian as m
on v.host_id = m.martian_id;


/*SUPER REPORT*/

select *
from martian as m
inner join martian as s
on m.super_id = s.martian_id
order by m.martian_id;

select *
from martian as m
left join martian as s
on m.super_id = s.martian_id
order by m.martian_id;

select m.first_name as fn, m.last_name as ln,
s.first_name as super_fn, s.last_name as super_ln
from martian as m
left join martian as s
on m.super_id = s.martian_id
order by m.martian_id;


/*INVENTORY REPORT*/

select *
from (select * from inventory where base_id =1) as i
right join supply as s
on i.supply_id = s.supply_id
order by s.supply_id;

select s.supply_id, i.quantity, s.name, s.description
from (select * from inventory where base_id =1) as i
right join supply as s
on i.supply_id = s.supply_id
order by s.supply_id;


/*HOST REPORT*/

select *
from visitor as v
left join martian as m
on v.host_id = m.martian_id
where m.martian_id is null or v.visitor_id is null
union
select *
from visitor as v
right join martian as m
on v.host_id = m.martian_id
where m.martian_id is null or v.visitor_id is null;

select v.first_name as visitor_fn, v.last_name as visitor_ln, 
m.first_name as martian_fn, m.last_name as martian_ln
from visitor as v
left join martian as m
on v.host_id = m.martian_id
where m.martian_id is null or v.visitor_id is null
union
select v.first_name as visitor_fn, v.last_name as visitor_ln, 
m.first_name as martian_fn, m.last_name as martian_ln
from visitor as v
right join martian as m
on v.host_id = m.martian_id
where m.martian_id is null or v.visitor_id is null;


**Ref:** https://www.youtube.com/watch?v=Jh_pvk48jHA&list=PLi01XoE8jYojRqM4qGBF1U90Ee1Ecb5tt&index=11