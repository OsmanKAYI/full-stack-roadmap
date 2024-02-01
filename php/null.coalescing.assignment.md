# Null Coalescing Operator (??) and Null Coalescing Assignment Operator (??=)

The **null coalescing operator (??)** is a shorthand operator in many programming languages, including PHP, JavaScript, and others. It provides a concise way to handle null or undefined values by returning the first operand that is not null or undefined.

The **null coalescing assignment operator (??=)** is a shorthand syntax in programming languages that allows you to assign a default value to a variable only if the variable is currently null or undefined. It's a combination of the nullish coalescing operator (??) and the assignment operator (=).

```php
//// Usage of the ?? operator instead of isset()

$var = $_GET['var'] ??= 2023; // CASE 1
// CASE 1
if (!isset($_GET['var'])) {
  $_GET['var'] = 2023;
  $var = 2023;
}

$var = $_GET['var'] ?? 2023; // CASE 2
// CASE 2
if (!isset($_GET['var'])) {
  $var = 2023;
}
```

**Explanation:**

- The code is using the null coalescing assignment operator (??=) to assign a default value (2023) to `$var` if `$_GET['var']` is not set.
- In CASE 1, if `$_GET['var']` is not set, it assigns 2023 to both `$_GET['var']` and `$var`.
- In CASE 2, if `$_GET['var']` is not set, it assigns 2023 only to `$var`.
- This is a concise way of checking if a variable is set and providing a default value if it's not.
