# Mutation in Vuejs Composition API

`Mutable` refers to the ability to directly modify the state of a reactive object, while `immutable` refers to creating a new object when changes are needed.

- **Mutable:**

  - With mutable operations, you directly modify the existing state or object.
  - In Vue 3, when you use the Composition API and create a reactive state using ref or reactive, you can mutate the state directly by modifying the properties of the object or the value property in the case of ref.

  ```js
  const count = ref(0);
  count.value++; // Mutable operation
  ```

- **Immutable:**

  - With immutable operations, you create a new state or object when changes are needed, leaving the original state unchanged.
  - Vue encourages an immutable approach to ensure that reactivity works as expected.

  ```js
  const count = ref(0);
  const newCount = count.value + 1; // Immutable operation
  ```

In Vue.js, when you follow an immutable approach, you create a new state or object when updating the state, triggering the reactivity system to recognize the change and update the UI accordingly. This helps in better tracking and managing state changes within the framework.

It's important to note that Vue.js provides the reactivity system to automatically detect changes in the state, and following an immutable pattern ensures that these changes are detected correctly. However, mutable operations can sometimes lead to unexpected behavior or issues with reactivity. Using the Composition API along with the principles of immutability helps in writing more predictable and maintainable Vue.js applications.

Some examples listed below are try to define what is mutable and what is immutable.

```js
// IMMUTABLE
const message1 = ref("HELLO FROM MESSAGE 1");
const message2 = ref("HELLO FROM MESSAGE 2");
console.log(message1.value); // HELLO FROM MESSAGE 1
console.log(message2.value); // HELLO FROM MESSAGE 2
message1.value = message2.value;
console.log(message1.value); // HELLO FROM MESSAGE 2
console.log(message2.value); // HELLO FROM MESSAGE 2
message2.value = "HELLO FROM MESSAGE 3";
console.log(message1.value); // HELLO FROM MESSAGE 2
console.log(message2.value); // HELLO FROM MESSAGE 3
```

```js
// IMMUTABLE
let message3 = "HELLO FROM MESSAGE 1";
let message4 = "HELLO FROM MESSAGE 2";
console.log(message3); // HELLO FROM MESSAGE 1
console.log(message4); // HELLO FROM MESSAGE 2
message3 = message4;
console.log(message3); // HELLO FROM MESSAGE 2
console.log(message4); // HELLO FROM MESSAGE 2
message4 = "HELLO FROM MESSAGE 3";
console.log(message3); // HELLO FROM MESSAGE 2
console.log(message4); // HELLO FROM MESSAGE 3
```

```js
// MUTABLE
let message5 = reactive({ text: "HELLO FROM MESSAGE 1" });
let message6 = reactive({ text: "HELLO FROM MESSAGE 2" });
console.log(message5); // HELLO FROM MESSAGE 1
console.log(message6); // HELLO FROM MESSAGE 2
message5 = message6;
console.log(message5); // HELLO FROM MESSAGE 2
console.log(message6); // HELLO FROM MESSAGE 2
message6.text = "HELLO FROM MESSAGE 3";
console.log(message5); // HELLO FROM MESSAGE 3
console.log(message6); // HELLO FROM MESSAGE 3
message5.text = "HELLO FROM MESSAGE 4";
console.log(message5); // HELLO FROM MESSAGE 4
console.log(message6); // HELLO FROM MESSAGE 4
```

```js
// IMMUTABLE
let message7 = reactive({ text: "HELLO FROM MESSAGE 1" });
let message8 = reactive({ text: "HELLO FROM MESSAGE 2" });
console.log(message7); // HELLO FROM MESSAGE 1
console.log(message8); // HELLO FROM MESSAGE 2
message7.text = message8.text;
console.log(message7); // HELLO FROM MESSAGE 2
console.log(message8); // HELLO FROM MESSAGE 2
message8.text = "HELLO FROM MESSAGE 3";
console.log(message7); // HELLO FROM MESSAGE 2
console.log(message8); // HELLO FROM MESSAGE 3
message7.text = "HELLO FROM MESSAGE 4";
console.log(message7); // HELLO FROM MESSAGE 4
console.log(message8); // HELLO FROM MESSAGE 3
```
