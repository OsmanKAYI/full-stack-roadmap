select *
from confidential;

select martian_id, first_name, last_name, base_id, super_id
from confidential;



create view martian_public as
select martian_id, first_name, last_name, base_id, super_id
from confidential;

select * 
from martian_public;

select salary, dna_id
from martian_public;		--Unknown column 'salary' in 'field list sice we have not made it public.' 



select martian_id, first_name, last_name, "Martian" as status
from martian_public;

select martian_id, first_name, last_name, "Martian" as status
from martian_public
union
select visitor_id, first_name, last_name, "Visitor" as status
from visitor;



select concat("m", martian_id) as id, first_name, last_name, "Martian" as status
from martian_public
union
select concat("v", visitor_id) as id, first_name, last_name, "Visitor" as status
from visitor;



create view people_on_mars as 
select concat("m", martian_id) as id, first_name, last_name, "Martian" as status
from martian_public
union
select concat("v", visitor_id) as id, first_name, last_name, "Visitor" as status
from visitor;

select *
from people_on_mars
order by last_name;



select b.base_id, s.supply_id, s.name
from base as b
cross join supply as s;



select b.base_id, s.supply_id, s.name,
       (select quantity 
        from inventory
        where base_id = b.base_id and supply_id = s.supply_id) 
from base as b
cross join supply as s;



select b.base_id, s.supply_id, s.name,
       coalesce(
       (select quantity 
        from inventory
        where base_id = b.base_id and supply_id = s.supply_id), 0) 
from base as b
cross join supply as s;



select b.base_id, s.supply_id, s.name,
       coalesce(
       (select quantity 
        from inventory
        where base_id = b.base_id and supply_id = s.supply_id), 0) as quantity 
from base as b
cross join supply as s;



create view base_storage as
select b.base_id, s.supply_id, s.name,
       coalesce(
       (select quantity 
        from inventory
        where base_id = b.base_id and supply_id = s.supply_id), 0) as quantity 
from base as b
cross join supply as s;

select * 
from base_storage;


**Ref:** https://www.youtube.com/watch?v=8jU8SrAPn9c