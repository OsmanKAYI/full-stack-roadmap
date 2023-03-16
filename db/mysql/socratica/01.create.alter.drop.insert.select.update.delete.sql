CREATE DATABASE social_network;
CREATE TABLE users (
		user_id int,
		first_name VARCHAR (100),
		last_name VARCHAR (100),
		email VARCHAR (250)
	);

ALTER TABLE users ADD encrypted_password VARCHAR (1000);
ALTER TABLE users DROP COLUMN email;

DROP TABLE users;
DROP DATABASE social_network;



INSERT INTO movies (movie_id, title, description, price) 
VALUES (1, "Gattaca", "Movie or documentary?", 4.99);

SELECT * FROM movies;



SELECT title FROM movies;

INSERT INTO movies (title, price) 
VALUES ("Star Wars", 8.99);

INSERT INTO movies (title, price) 
VALUES ("Logan\'s Run", 3.99);

INSERT INTO movies (title, price) 
VALUES ("Solaris", 2.99);

INSERT INTO movies (title, price) 
VALUES ("Jaws", 5.25);

INSERT INTO movies (title, price) 
VALUES ("Silent Running", 3.00);

SELECT title, price 
FROM movies 
ORDER BY price DESC;

UPDATE movies 
SET price = 0.99 
WHERE title = "Jaws";

SELECT title, price 
FROM movies 
ORDER BY price;

DELETE FROM movies 
WHERE title = "Star Wars";

SELECT title, price 
FROM movies 
ORDER BY price;

**Ref:** https://www.youtube.com/watch?v=OfM5lC-7R4Y&list=PLi01XoE8jYojRqM4qGBF1U90Ee1Ecb5tt&index=2