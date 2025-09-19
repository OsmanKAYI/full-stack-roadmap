# VueJS Unit Testing: What It Is and How to Write It

## TLDR

Unit tests validate small parts of code (e.g., functions or methods) to ensure correct behavior. A basic `Counter App` example demonstrates how to write unit tests in VueJS using the `vitest` framework. These tests help maintain code quality by identifying issues early.

---

![VueJS Unit Test](https://miro.medium.com/v2/resize:fit:700/1*uJC5F9ZNIncC6CT2mLLmIA.png)

## What is a Unit Test?

Unit testing, also known as "birim testi", involves writing automated tests for specific units of code, typically functions or methods. It ensures that each part of the code functions as expected.

In practice, unit tests isolate software components and test them individually. External dependencies or effects are minimized, focusing on the isolated part of the code. This leads to cleaner, more reliable, and maintainable code.

## How to Write a Unit Test?

Here’s an example of a **Counter App**. Start by creating a `components` folder inside `src`, then add a `counter` folder. In this folder, create a file named `Counter.vue` to house the HTML elements.

```vue
<script setup>
import useCounter from './useCounter';
const { count, increment, decrement } = useCounter();
</script>

<template>
  <h1>Counter</h1>
  <h2 class="count">{{ count }}</h2>
  <section class="actions">
    <button @click="increment">+</button>
    <button @click="decrement">-</button>
  </section>
</template>

<style scoped>
.actions {
  display: flex;
  gap: 1rem;
  justify-content: center;
}
</style>
```

Now, in the same folder, create a `useCounter.js` file containing the counter's functionality:

```js
import { ref } from 'vue';

const useCounter = () => {
  const count = ref(0);

  const increment = () => count.value++;
  const decrement = () => count.value--;

  return {
    count,
    increment,
    decrement
  };
};

export default useCounter;
```

This clean setup separates logic from the UI, making it easier to manage HTML, CSS, or functionality issues by focusing on specific files.

## Setting up the Test Framework

To write unit tests, install the necessary dependency, `vitest` ([https://vitest.dev](https://vitest.dev/)):

```bash
npm install -D vitest
```

Next, create a `counter.test.js` file inside the `counter` folder to test the counter functionality:

```js
import { expect, test } from 'vitest';
import useCounter from './useCounter';
const { count, increment, decrement } = useCounter();

test('counter', () => {
  expect(count.value).toBe(0);

  increment();
  expect(count.value).toBe(1);

  decrement();
  expect(count.value).toBe(0);
});
```

Now, any changes made to the component will be checked against this `.test.js` file. If the structure is compromised, errors will appear in the terminal.

To run these tests, add the following script to the `package.json` file:

```json
"scripts": {
  "test": "vitest"
}
```

Use `npm run test` to execute the tests.

![Run Test](https://miro.medium.com/v2/resize:fit:310/1*tCdGn12ZJ3QNCqF87K0Znw.png)

## Testing the Test

Take a look at the following expression:

```js
expect(count.value).toBe(0);
```

This checks if `count` is initially `0`. If it is, the test passes. Next, the `increment()` function is called to increase the count by 1, followed by another check:

```js
expect(count.value).toBe(1);
```

This ensures that after incrementing, the value of `count` is `1`.

## The Role of Unit Testing

By writing tests for all functions, or even writing tests before the function itself, certain coding standards are enforced. This prevents developers (or even the future self) from unintentionally introducing structural problems.

Unit testing acts as a "constitution" for the project, defining the boundaries and ensuring that developers follow the code quality rules. To maximize its benefits, tests should run during the **pipeline** process, and deployment should be blocked if any tests fail, ensuring a robust codebase.

**GitHub**: [https://github.com/gayret/unit-test-on-vuejs](https://github.com/gayret/unit-test-on-vuejs)

**Ref:** [Safa Gayret - Medium](https://safa.medium.com/vuejste-unit-test-nedir-nas%C4%B1l-yaz%C4%B1l%C4%B1r-a2a9ea931b32)
