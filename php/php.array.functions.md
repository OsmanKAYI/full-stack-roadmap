# PHP Array Functions

PHP, a versatile scripting language, excels in dynamic web development, thanks to its robust array manipulation. Arrays are core to PHP, offering flexible data handling.

Explore PHP’s array functions for tasks like deduplication, merging, and value extraction in this handy cheatsheet.

**1.  array_unique()**: Removes duplicate values from an array.

```php
$unique_array = array_unique($array);
```

**2. array_merge()**: Merges one or more arrays into one.

```php
$merged_array = array_merge($array1, $array2);
```

**3. array_push()**: Adds one or more elements to the end of an array.

```php
array_push($array, $element1, $element2);
```

**4. array_pop()**: Removes and returns the last element of an array.

```php
$last_element = array_pop($array);
```

**5. array_shift()**: Removes and returns the first element of an array.

```php
$first_element = array_shift($array);
```

**6. array_unshift()**: Adds one or more elements to the beginning of an array.

```php
array_unshift($array, $element1, $element2);
```

**7. array_slice()**: Extracts a slice of an array.

```php
$slice = array_slice($array, $start, $length);
```

**8. array_splice()**: Removes a portion of an array and replaces it with something else.

```php
array_splice($array, $start, $length, $replacement);
```

**9. array_keys()**: Returns all the keys or a subset of the keys of an array.

```php
$keys = array_keys($array);
```

**10. array_values()**: Returns all the values of an array.

```php
$values = array_values($array);
```

**11. array_flip()**: Exchanges all keys with their associated values in an array.

```php
$flipped_array = array_flip($array);
```

**12. array_search()**: Searches an array for a given value and returns the corresponding key if successful.

```php
$key = array_search($value, $array);
```

**13. array_map()**: Applies a callback function to each element of an array.

```php
$new_array = array_map($callback, $array);
```

**14. array_filter()**: Filters elements of an array using a callback function.

```php
$filtered_array = array_filter($array, $callback);
```

**15. array_reduce()**: Iteratively reduce the array to a single value using a callback function.

```php
$result = array_reduce($array, $callback);
```

**16. array_key_exists($key, $array):** Checks if a specific key exists in an array.

```php
$array = ['a' => 1, 'b' => 2, 'c' => 3];
$exists = array_key_exists('b', $array);
// Result: $exists is true
```

**17. array_values($array):** Returns all the values of an array, preserving keys.

```php
$array = ['a' => 1, 'b' => 2, 'c' => 3];
$values = array_values($array);
// Result: $values is [1, 2, 3]
```

**18. array_replace($array1, $array2, …):** Replaces elements from passed arrays into the first array.

```php
$array1 = ['a' => 1, 'b' => 2]; 
$array2 = ['b' => 3, 'c' => 4]; 
$replacedArray = array_replace($array1, $array2); 
// Result: $replacedArray is ['a' => 1, 'b' => 3, 'c' => 4]
```

**19. array_rand($array, $num = 1)**: Picks one or more random keys from an array.

```php
$array = ['a' => 1, 'b' => 2, 'c' => 3];
$randomKey = array_rand($array);
// Result: $randomKey could be 'a', 'b', or 'c'
```

**Conclusion:**

PHP array functions provide a diverse set of tools for manipulating arrays efficiently. From adding and removing elements to merging, searching, and filtering arrays, PHP offers functions for a wide range of tasks. Mastering these functions is essential for effective PHP development, enabling developers to write cleaner and more efficient code.

**Ref:** [Umar Farooque Khan - Medium](https://umarfarooquekhan.medium.com/mastering-php-array-functions-a-comprehensive-cheat-sheet-%EF%B8%8F-%EF%B8%8F-62e5c7e79ce0)
