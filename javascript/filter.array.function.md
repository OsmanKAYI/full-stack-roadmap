# Javascript .filter() Array Function

In summary, we can start like this; the .filter() function will return us a list / array. So it will return a new array from within the array. .find(), on the other hand, only returns one element from the array. That's it, as simple as that.

## Difference Between .find() and .filter()

Let's start with a simple example to keep it in mind. If we are going to select only one element from the array, we use .find(). If we are going to return a list with more than one element, then we use .filter().

**NOTE:** If we cannot find a result from the array with find(), our result will be undefined.

## Array Functions: filter() Example

```js
const people = require("./people.json");

// 1-) Find people under the age of 40.
let under40 = people.filter((person) => person.age < 40);
console.log(under40);

// 2-) Find people with hazel eyes.
// --> Although there may be multiple people with hazel eyes, with "find" we only reached one person. The difference between filter and find will be revealed here.
let hazelEyes = people.filter((person) => person.eyeColor === "hazel");
console.log(hazelEyes);

// 3-) All males
let males = people.filter((person) => person.gender === "male");
console.log(males);

// 4-) All females
let females = people.filter((person) => person.gender === "female");
console.log(females);

// 5-) Residents of Istanbul
let istanbulResidents = people.filter((person) => person.city === "Istanbul");
console.log(istanbulResidents);

// 6-) People weighing less than 75 kg
let under75Kg = people.filter((person) => person.weight < 75);
console.log(under75Kg);
```

**Ref:** [Mustafa Çağrı Güven - Medium](https://mustafacagri.medium.com/javascript-filter-array-fonksiyonu-%C3%B6rne%C4%9Fi-kullan%C4%B1m%C4%B1-8674effbd796)
