create view person as 
select concat("f", f.id) as id, female_name as "first_name", last_name, "Female" as gender
from female_names f, last_names l
union
select concat("m", m.id) as id, male_name as "first_name", last_name, "Male" as gender
from male_names m, last_names l;

select count(*)
from person;

select count (*)
from person
where last_name = "Smith";

select count (*)
from person
where first_name = "Emma";

select count (*)
from person
where birthday between "1980-05-01" and "1980-05-31";

select count (*)
from person
where first_name = "Michael";

select count (*)
from person
where last_name in ("Hawkins", "Snow");

select count (*)
from person
where birthday = "1995-04-01";



create index person_first_name_idx
on person (first_name);

select count (*)
from person
where first_name = "Emma";		 /* It speeds up. Thanks to the index. */

select count (*)
from person
where last_name = "Smith";       /* It does not speed up. */

select count (*)
from person
where birthday = "1995-04-01";   /* It does not speed up. */

select count (*)
from person
where first_name = "Julie"
    and last_name = "Andrews";   /* It speeds up. Thanks to the index. */

select count (*)
from person
where last_name = "Andrews"
    and birthday = "1992-06-12"; /* It does not speed up. */

select count (*)
from person
where birthday = "1992-06-12"
    and first_name = "Mia";      /* It speeds up. Thanks to the index. */



create index person_first_name_last_name_idx
on person (last_name, first_name);				/* The order is matter. */

select count (*)
from person
where last_name = "Williams"
    and first_name = "John";     /* It speeds up. Thanks to the index. */

select count (*)
from person
where last_name = "Andrews"
    and first_name = "Julie";    /* It speeds up. Thanks to the index. */


**Ref:** https://www.youtube.com/watch?v=fsG1XaZEa78