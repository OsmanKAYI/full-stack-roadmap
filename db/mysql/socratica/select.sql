select * 
from earthquake;

select count(*) 
from earthquake;

select magnitude, place, occurred_on 
from earthquake;

select *
from earthquake
where occurred_on >= "2010-01-01";

select *
from earthquake
where occurred_on >= "2010-01-01" and occurred_on <= "2010-12-31";

select *
from earthquake
where occurred_on >= "2010-01-01" and occurred_on <= "2010-12-31"
order by magnitude;

select *
from earthquake
where occurred_on >= "2010-01-01" and occurred_on <= "2010-12-31"
order by magnitude desc;

select *
from earthquake
where occurred_on >= "2010-01-01" and occurred_on <= "2010-12-31"
order by magnitude desc
limit 1;

select min(occurred_on), max(occurred_on)
from earthquake;

select min(magnitude), max(magnitude)
from earthquake;

select cause
from earthquake;

select distinct cause
from earthquake;

select count(*)
from earthquake
where cause = "earthquake";

select count(*)
from earthquake
where cause = "nuclear explosion";

select count(*)
from earthquake
where cause = "explosion";

select *
from earthquake
where cause = "explosion";

select place, magnitude, occurred_on
from earthquake
where cause = "nuclear explosion"
order by occurred_on desc
limit 1;

select place, magnitude, occurred_on
from earthquake
order by magnitude desc
limit 10;

select count(*)
from earthquake
where place like "%Honshu%Japan%" and occurred_on between "2011-03-11" and "2011-03-18"