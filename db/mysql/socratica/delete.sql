select count(*)
from song;

select min(year_released), max(year_released)
from song;

select distinct year_released
from song
order by year_released;

select count(*)
from song
where year_released = 0;

select *
from song
where year_released = 0
limit 10;

delete from song
where year_released = 0;

select count(*)
from song;

select distinct year_released
from song
order by year_released;



select min(tempo), max(tempo)
from song;

select count(*)
from song
where tempo = 0;

select *
from song
where tempo = 0;

delete from song
where tempo = 0;

select min(tempo), max(tempo)
from song;

select count(*)
from song;



select min(duration), max(duration)
from song;



select min(loudness), max(loudness)
from song;

select count(*)
from song
where loudness >0;

select *
from song
where loudness >0;

delete
from song
where loudness >0;			/* Loudness should be smaller than zero. */

select min(loudness), max(loudness)
from song;



select year_released, avg(tempo)
from song
group by year_released
order by year_released;

select year_released, round(avg(tempo))
from song
group by year_released
order by year_released;