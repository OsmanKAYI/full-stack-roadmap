# JavaScript Tips

JavaScript is a scripting language that enables you to create dynamically updating content, control multimedia, animate images, and more.

### "Go back" button

Use `history.back()` to create a "Go Back" button:

```html
<button onclick="history.back()">Go back</button>
```

### Numbers separators

Improve readability for numbers using underscores as separators:

```js
const largeNumber = 1_000_000_000;
console.log(largeNumber); // 1000000000
```

### Run event listener only once

Use the `once` option to add an event listener that runs only once:

```js
element.addEventListener('click', () => console.log('I run only once'), { once: true });
```

### Console.log variables wrapping

Wrap console.log() arguments with curly brackets to see variable names:

```js
const myNumber = 123;
console.log({ myNumber }); // myNumber: 123
```

### Get min/max value from an array

Use Math.min() or Math.max() with the spread operator to find the minimum or maximum value in an array:

```js
const numbers = [6, 8, 1, 3, 9];
console.log(Math.max(...numbers)); // 9
console.log(Math.min(...numbers)); // 1
```

### Check if Caps Lock is on

Detect if Caps Lock is on using `KeyboardEvent.getModifierState()`:

```js
const passwordInput = document.getElementById('password');
passwordInput.addEventListener('keyup', function (event) {
  if (event.getModifierState('CapsLock')) {
    // CapsLock is on.
  }
});
```

### Copy to clipboard

Use the Clipboard API to create the "Copy to clipboard" functionality:

```js
function copyToClipboard(text) {
  navigator.clipboard.writeText(text);
}
```

### Get mouse position

Get the current mouse position using MouseEvent clientX and clientY properties:

```js
document.addEventListener('mousemove', (e) => {
  console.log(`Mouse X: ${e.clientX}, Mouse Y: ${e.clientY}`);
});
```

### Shorten an array

Set the length property to shorten an array:

```js
const numbers = [1, 2, 3, 4, 5];
numbers.length = 3;
console.log(numbers); // [1, 2, 3]
```

### Short-circuits conditionals

Use short-circuiting to execute a function only if a condition is true:

```js
// If you have to execute a function only if the condition is true:
if (condition) {
    doSomething();
}

// You can use short-circuiting:
condition && doSomething();
```

### Show specific console.table() columns

Use the optional "columns" parameter to select a subset of columns to display in console.table():

```js
console.table([person1, person2, person3], ['age']);
```

### Remove duplicate elements from an array

Remove duplicate elements from an array using the Set data structure:

```js
const numbers = [2, 3, 4, 4, 2];
console.log([...new Set(numbers)]); // [2, 3, 4]
```

### Convert a string to number

Convert a string to a number using the unary plus (+) operator:

```js
const str = '404';
console.log(+str); // 404
```

### Convert a number to string

Convert a number to a string by concatenating it with an empty string:

```js
const myNumber = 403;
console.log(myNumber + ''); // '403'
```

### Remove all falsy values from an array

Use the `filter()` method with the `Boolean` constructor to remove all falsy values from an array:

```js
const myArray = [1, undefined, NaN, 2, null, '@denicmarko', true, 3, false];
console.log(myArray.filter(Boolean)); // [1, 2, "@denicmarko", true, 3]
```

### DRY

Don't repeat yourself. Use includes() method to check if a value exists in an array:

```js
const myTech = 'JavaScript';
const techs = ['HTML', 'CSS', 'JavaScript'];

if (techs.includes(myTech)) {
    // do something 
}
```

### Sum an array

Calculate the sum of all elements in an array using the `reduce()` method:

```js
const myArray = [10, 20, 30, 40];
const reducer = (total, currentValue) => total + currentValue;
console.log(myArray.reduce(reducer)); // 100
```

### Console.log() styling

Style console.log() output using CSS format specifier:

```js
console.log('%c Success', 'color: green; font-weight: 1.5em;');
```

### Element's dataset

Access element's custom data attributes using the dataset property:

```html
<div id="user" data-name="John Doe" data-age="29" data-something="Some Data">John Doe</div>

<script>
  const user = document.getElementById('user');
  console.log(user.dataset);
</script>
```

**Ref:** [markodenic.com](https://markodenic.com/javascript-tips/)