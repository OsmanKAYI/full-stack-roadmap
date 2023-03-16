insert into chitter_user(user_id, username, encrypted_password, email, date_joined)
values(default, "firstuser", "d63dc919e2dc30d2", "fakemail@fakedomain.fake", "2019-02-00");

select * 
from chitter_user;



insert into chitter_user(username, encrypted_password)
values("seconduser", "9a834yva9fn3493yn");



insert into post (user_id, post_text)
values (1, "Hello World!"), (1, "Hello Solar System!");

select * from post;



