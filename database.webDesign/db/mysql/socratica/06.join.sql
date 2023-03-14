select *  
from martian                       "left table"  
inner join base                    "right table"  
on martian.base_id = base.base_id;

select first_name, last_name, base_name  
from martian  
inner join base  
on martian.base_id = base.base_id;



select column1, column2, ...  
from martian  
________ join base                 "inner-left-right-full"   
on martian.base_id = base.base_id;  
where condition(s)  
order by value  

 

select martian.martian_id, base.base_id, base.base_name  
from martian  
inner join base  
on martian.base_id = base.base_id;  

select m.martian_id, b.base_id, b.base_name  
from martian as m  
inner join base as b  
on m.base_id = b.base_id;  

select m.martian_id, b.base_id, b.base_name  
from martian as m  
left join base as b  
on m.base_id = b.base_id;  

select m.martian_id, b.base_id, b.base_name  
from martian as m  
right join base as b  
on m.base_id = b.base_id;

**Ref:** https://www.youtube.com/watch?v=9yeOJ0ZMUYw&list=PLi01XoE8jYojRqM4qGBF1U90Ee1Ecb5tt&index=10