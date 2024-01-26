# Javascript Dom, String, Array Metodları

## String Methods

```js
var text =
  "Let's provide examples of string methods using this string expression.";
```

- **text.toUpperCase():** Converts the characters of the text expression to uppercase.
- **text.toLowerCase():** Converts the characters of the text expression to lowercase.
- **text.concat('text1', 'text2'):** Used to concatenate one or more string expressions.
- **text.trim():** Removes leading and trailing spaces from the character string.
- **text.replace("expression", "text"):** Used to replace string information. We replaced "expression" with "text".
- **text.charAt(0):** Returns the character at the specified index. In this example, it returns the character at index 0, which is 'B'.
- **text.charCodeAt(0):** Returns the Unicode value of the character at the specified index. The Unicode value for 'B' is 66.
- **text.startsWith("Let"):** Checks if it starts with the specified expression. It is a Boolean expression. Here, the result will be true. The second parameter can be provided to specify from which index to check.
- **text.endsWith("wrong"):** The endsWith() method checks if the text ends with this expression. It is a Boolean expression. Here, the result will be false. The second parameter can be provided to specify from which index to check.
- **text.includes("string"):** Checks if it contains this value. Returns true.

**Searching within the text**

- **text.indexOf("string"):** Used to search for a string expression within the text. Returns the index of the first occurrence of the searched expression. If not found, it returns -1. In this example, the result will be 3.
- **text.lastIndexOf("string"):** Works the same as indexOf() but returns the index of the last occurrence. If not found, it returns -1. In this example, the result will be 27.
- **text.search("string"):** Functions the same as indexOf(). Search() allows searching with regular expressions.

**String manipulation**

- **text.slice(3,25):** Takes the expression within the specified start and end indexes. If the end value is not provided, it takes until the end. The result will be "string expression using" in this case. Negative values can be used, counting from the end.
- **text.substring(3,25):** Similar to Slice. However, substring does not accept negative values.
- **text.substr(3,25):** A string slicing method. The second parameter specifies how long the expression should be. The result will be "string expression using st".
- **text.split(" "):** Splits the expression at the specified character, creating an array. In this example, it splits at spaces.

## Array Methods

```js
let arr = [1, 2, 3, 4, 5, 6];
```

- **arr.push(7):** Adds an element to the end of the array. **_Result: [1, 2, 3, 4, 5, 6, 7]_**
- **arr.pop():** Removes the last element from the array. **_Result: [1, 2, 3, 4, 5]_**
- **arr.unshift(0):** Adds an element to the beginning of the array. **_Result: [0, 1, 2, 3, 4, 5, 6]_**
- **arr.shift():** Removes the first element from the array. **_Result: [1, 2, 3, 4, 5, 6]_**
- **arr.reverse():** Reverses the order of the array. **_Result: [6, 5, 4, 3, 2, 1]_**
- **arr.map(value => value < 5):** Creates a new array with elements that satisfy the given condition. The condition can be specified in the function. **_Result: [1, 2, 3, 4]_**
- **arr.forEach(function(element)):** Performs the specified action for each element in the array.
- **arr.find(value => value === 5):** Selects only one element in the array.
- **arr.filter(value => value < 5):** Filters multiple elements in the array based on a condition.
- **arr.sort():** Sorts the array elements in ascending or descending order.
- **arr.some(value => value < 5):** Creates a new array with elements that satisfy the given condition. **_Result: [1, 2, 3, 4]_**
- **arr.every(value => value < 5):** Returns true if all elements in the array satisfy the given condition, otherwise returns false.
- **arr.includes(5):** Checks if the specified value is present in the array. It's a Boolean expression. For the value 5, it returns true.

## DOM Manipulation Methods

<small>(HTML information access and manipulation methods for DOM manipulation)</small>

```html
<p id="zeze" class="medium">
  Methods used for accessing and managing HTML information
</p>
```

- **document.querySelector('.medium') || document.querySelector('#zeze'):** Use this method to query with either class or id by adding "." or "#" at the beginning.
- **document.querySelectorAll('.medium'):** Similar to querySelector but returns all matches. Returns a NodeList.
- **document.getElementById('zeze'):** Access elements by id.
- **document.getElementsByClassName('medium'):** Access elements by class.
- **document.getElementsByTagName('p'):** Access elements by tag name.
- **document.forms["frm1"]:** Returns all elements of the form with id 'frm1'.
- **document.forms:** Lists information for all forms on the page.
- **document.head:** Retrieves the head tag.
- **document.body:** Retrieves the body tag.
- **document.title:** Retrieves the title tag.
- **document.images:** Lists information for all image tags on the page.
- **document.URL:** Retrieves the URL of the page.
- **document.links:** Retrieves the title tags.
- **document.domain:** Retrieves the domain of the page.
- **document.all:** Lists all elements on the page.
- **document.all.length:** Returns the number of all elements on the page.

**Ref:** [zeze-36ze - medium.com](https://zeze-36ze.medium.com/javascript-dom-string-array-metodlar%C4%B1-5b59310b419e)
