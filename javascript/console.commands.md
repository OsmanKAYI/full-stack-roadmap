# JavaScript Console Commands You Should Know

1. `console.log()` - **The Basics**
  - Prints a message to the console
```js
let name = "Osman";
console.log(name); 
// Osman
```
2. `console.error()` - **Highlighting Errors**
  - Displays an error message in the console
```js
console.error("Something went wrong");
// Displays the error message with a red icon
```

3. `console.warn()` - **Highlighting Warnings**
  - Displays a warning message in the console
```js
console.warn("Something is not right");
// Displays the warning message with a yellow icon
```

4. `console.info()` - **Highlighting Informations**
  - Displays an informational message in the console
```js
console.info("Here's some useful information");
// Displays the informational message with a blue icon
```

5. `console.table()` - **Tabular Data Display**
  - Displays an array in a table format
```js
let users = [
  {name: Osman, age: 25},
  {name: Ali, age: 30}
];
console.table(users);
// Displays the users in a table format
```

6. `console.group()` and `console.group.end()` - **Organizing **Logs
  - Groups related logging statements together
```js
console.group("User Details");
console.log("Name: Osman");
console.log("Age: 25");
console.groupEnd();
console.group("Purchase Details");
console.log("Product: Laptop");
console.log("Price: $1000");
console.groupEnd();
```

7. `console.assert()` - **Conditional Logging**
  - Logs a message if the provided assertion is false
```js
let age = 15;
console.assert(age >= 18, "User is not an adult!");
// This will log an error message since age is less than 18
```

8. `console.clear()` - **Cleaning Up**
  - Clears the console
```js
console.clear();
// This will clear all previous logs in the console
```