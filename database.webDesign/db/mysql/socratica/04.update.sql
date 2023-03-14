insert into secret_user (user_id, first_name, last_name, code_name, country, organization, salary, knows_kung_fu)
values (1, "Jimmy", "Bond", "007", "UK", "MI6", 97200, "false"),
       (2, "George", "Smiley", "Beggarman", "UK", "MI6", 97200, "false"),
       (3, "Jason", "Bourne", "Delta One", "US", "CIA", 115000, "false"),
       (4, "Jack", "Ryan", "", "US", "CIA", 85000, "false"),
       (5, "Ethan", "Hunt", "Bravo Echo 1-1", "US", "IMF", 250000, "false"),
       (6, "Emma", "Peel", "Mrs. Peel", "UK", "MI6", 97200, "true"),
       (7, "Susan", "Hilton", "Agent 99", "US", "Control", 250000, "false"),
       (8, "Nick", "Fury", "Foxtrot", "US", "SHIELD", 250000, "false");
 
 select * from secret_user;



update secret_user
set first_name = "James"
where user_id = 1;

select * 
from secret_user
order by user_id;



update secret_user
set code_name = "Neo 2.0", salary = 115000
where first_name = "Jack" and last_name = "Ryan";

select * 
from secret_user
order by user_id;



update secret_user
set salary = 115000
where organization = "MI6";

select * 
from secret_user
order by user_id;



update secret_user
set knows_kung_fu = "true"
where user_id in (5,7,8);

select * 
from secret_user
order by user_id;



update secret_user
set salary = 1.1*salary;

select * 
from secret_user
order by user_id;

select sum(salary)
from secret_user;