select distinct s.il as "City", s.ilce as "Town", sum(kayitli) as "Total Number", b.bolgeid as "Region" 
from sonuc s, bolge b
where s.bolgeid = b.bolgeid
group by il
having sum(kayitli) > 100000 
order by 3 desc
-- limit 10

delete from sonuc where ilce is NULL

select distinct s.il as "City", sum(kayitli) as "Total Number", b.bolgeid as "Region" 
from sonuc s, bolge b
where s.bolgeid = b.bolgeid
group by s.il
having sum(kayitli) > 100000 
order by 2 desc
limit 81
