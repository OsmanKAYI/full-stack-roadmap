# Get Data From Database as a JSON Object

```BASH
SELECT JSON_ARRAYAGG(JSON_OBJECT("user_id", user_id, "user_name", user_name)) FROM ref_users;

SELECT JSON_OBJECT('name', user_name, 'phone', user_phone) FROM ref_users;
```

- These statements represent queries used in SQL (Structured Query Language). The first query uses the `JSON_ARRAYAGG` function to return the `user_id` and `user_name` columns from the table named `ref_users` as a JSON array. The second query uses the `JSON_OBJECT` function to return the `user_name` and `user_phone` columns from the same table as JSON objects.

- These queries can be used in many different scenarios. For example, you can use this type of query in a web application when you want to return user information in JSON format. The JSON format is a data exchange format that can easily transport and process data, so it is widely used, especially when exchanging data through APIs in web applications.

- These queries can be useful when you want to retrieve user information from a database in JSON format. For example, you can call a web service to return this JSON data and use it on the client side.
