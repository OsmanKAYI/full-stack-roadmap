import psycopg2
import time

# Number of rows to add in each batch
n = 10000

# Generate single INSERT INTO query
single_query = """INSERT INTO post (user_id, post_text)
	VALUES (1, 'All work and no play makes Jack a dull boy.');"""

# Generate one BIG query
big_query = "INSERT INTO post (user_id, post_text) VALUES"
for i in range(n):
	big_query += "(1, 'All work and no play makes Jack a dull boy.'),"
big_query = big_query.strip(',') + ';'		# Replace trailing ',' with ';'

# Connect to database & create cursor
password = open('password.txt', 'r').read()
con = psycopg2.connect("dbname=socratica user=postgres passwod={0}".format(password))
cur = conn.cursor()

# Time the 'n' individual queries
start_time = time.time()
for i in range(n):
	cur.execute(single_query)
conn.commit()
stop_time = time.time()
print("{0} individual queries took {1} seconds.".format(n, stop_time - start_time))

# Time the BIG query
start_time = time.time()
cur.execute(big_query)
conn.commit()
stop_time = time.time()
print("The query with {0} rows took {1} seconds.".format(n, stop_time - start_time))

# Close both cursor and connection to database
cur.close()
conn.close()