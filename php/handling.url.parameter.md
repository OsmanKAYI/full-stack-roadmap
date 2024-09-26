# Handling URL Parameters in PHP

Handling URL parameters in PHP are useful for handling incoming parameters from the `$_GET` superglobal in PHP.

**Long Version**

```php
// Check the 'id' parameter from $_GET
if (isset($_GET['id'])) {
    // If it exists, convert its value to an integer and assign it to the $id variable
    $id = intval($_GET['id']);
} else {
    // If the 'id' parameter is not present or its value is not a valid integer, set $id to 0
    $id = 0;
}

// Check the 'filter_year' parameter from $_GET
if (isset($_GET['filter_year'])) {
    // If it exists, convert its value to an integer and assign it to the $year variable
    $year = intval($_GET['filter_year']);
} else {
    // If the 'filter_year' parameter is not present or its value is not a valid integer, set $year to the current year
    $year = date('Y');
}
```

**Short Version**

```php
// Check if the 'id' parameter is present in the $_GET array
// If yes, convert its value to an integer and assign it to the $id variable; otherwise, set $id to 0
$id  = (isset($_GET['id'])) ? intval($_GET['id']) : 0;

// Check if the 'filter_year' parameter is present in the $_GET array
// If yes, convert its value to an integer and assign it to the $year variable; otherwise, set $year to the current year
$year = (isset($_GET['filter_year'])) ? intval($_GET['filter_year']) : date('Y');
```

**Shorter Version**

```php
// Check and convert the 'id' parameter from $_GET to an integer, or set it to 0 if it doesn't exist
$id = intval($_GET['id'] ?? 0);

// Check and convert the 'filter_year' parameter from $_GET to an integer, or set it to the current year if it doesn't exist
$yil = intval($_GET['filter_year'] ?? date('Y'));
```

These code snippets handle incoming parameters from the `$_GET` superglobal in PHP. They convert the values to integers and provide default values (0 for 'id' and the current year for 'filter_year') if the parameters are not present or have invalid values. The short version uses the null coalescing operator (??) for conciseness.
