# Session

PHP sessions are a way to store and retrieve data for a particular user across multiple page requests. When a user visits a website, a unique session ID is assigned to them, and this session ID is stored as a cookie on their browser or passed through the URL.

The session ID allows the server to associate the user's subsequent requests with their specific session data. This session data is stored on the server, typically in files or a database, and is accessible throughout the user's browsing session.

Sessions are commonly used to store user-specific information, such as login credentials, shopping cart items, or preferences. The session data can be accessed and modified using the `$_SESSION` superglobal array in PHP.

Here's a basic example of how to use PHP sessions:

1. Start a session using the `session_start()` function at the beginning of your PHP script.

```php
session_start();
```

2. Store data in the session by assigning values to `$_SESSION` array keys.

```php
$_SESSION['username'] = 'osmankayi';
$_SESSION['cart'] = ['item1', 'item2', 'item3'];
```

3. Retrieve session data on subsequent pages by accessing the `$_SESSION` array.

```php
echo $_SESSION['username'];  // Output: osmankayi
print_r($_SESSION['cart']);  // Output: Array ( [0] => item1 [1] => item2 [2] => item3 )
```

4. Destroy the session and clear session data using `session_destroy()` when the user logs out or the session is no longer needed.

```php
session_destroy();
```

Sessions provide a way to maintain stateful behavior in PHP applications, allowing you to keep track of user-specific information throughout their interaction with your website.

## Php Session Example

Below, you can find all necessary files for php session. Download them one by one and get the result.

- [Homepage](./examples/session/index.php)
- [Session Start](./examples/session/sessionStart.php)
- [Success Message](./examples/session/success.html)
- [List Sessions](./examples/session/listSession.php)
