# Vue 3: Composition Pattern, Composition API, and Composables

In Vue 3, the terms Composition, Composition API, and Composables are interconnected yet denote distinct concepts. Gaining clarity on their differences can enhance your understanding.

## Composition Pattern

Composition is an architectural pattern that simplifies code reuse between components. Instead of relying on inheritance, the approach involves creating a new file (component or composable) that both components import and utilize.

Traditionally, inheritance has been the default choice, but it can lead to complex structures, unnecessary code, and confusion about functionality usage. In Vue 2, mixins were employed for code reusability, but they relied on behind-the-scenes inheritance.

```js
import Component, { mixins } from "vue-class-component";
import { Hello, World } from "./mixins";

@Component
export class HelloWorld extends mixins(Hello, World) {
  created() {
    console.log(this.hello + " " + this.world + "!"); // -> Hello World!
  }
}
```

Vue 3 was introduced to move away from mixins and inheritance, promoting a cleaner and more manageable Composition pattern.

## Composition API

The Composition API, part of Vue 3, comprises utility functions supporting the Composition pattern. It encompasses three main APIs:

- **Reactivity API:** Includes functions like `ref()` and `reactive()` for creating reactive state, computed state, and watchers.
- **Lifecycle Hooks:** Offers hooks like `onMounted()` and `onUnmounted()` to programmatically interact with component lifecycles.
- **Dependency Injection:** Involves `provide()` and `inject()` for leveraging Vue’s dependency injection system alongside Reactivity APIs.

Explicitly importing required functions maintains component dependencies clarity.

## Composables

Composables are essentially reusable stateful functions, serving as instances of the Composition pattern. They are practical functions used for sharing reactive state and logic across components.

As an example, consider the logic abstraction of a counter in a composable:

```js
// composables/useCounter.js

import { ref } from "vue";

export default function () {
  const counter = ref(0);

  function increase() {
    counter.value++;
  }

  return {
    counter,
    increase,
  };
}
```

State must be declared with `ref` for reactivity, and the composable needs to return its public API.

This composable can be cleanly imported and used in a component:

```js
// components/Counter.vue
<script setup>
import useCounter from "./useCounter.js";
const { counter, increase } = useCounter();
</script>

<template>
  <p>Counter: {{ counter }}</p>
  <button @click="increase">Increase</button>
</template>
```

In summary, the Composition pattern is the methodology, the Composition API equips with tools for implementing the pattern in Vue, and Composables are instances encapsulating state and reusable logic.

**Ref:** [fadamakis.com](https://fadamakis.com/the-difference-between-composition-composition-api-and-composables-in-vue-3-aa92511101fc)
