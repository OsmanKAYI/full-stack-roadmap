# Refactor Your Vue Application By Using Setup Scripts

## What is Script Setup?

`<script setup>` is a compile-time syntactic sugar for using **Composition API** inside Single-File Components (**SFCs**). It is the recommended syntax for using both SFCs and Composition API. To use it, add `setup` as an attribute of the `script` tag. Note that it is only available for SFC components and cannot be used with the `src` attribute for external `.js` or `.ts` files. It provides a leaner code base and better runtime performance. Let's explore its implementation by refactoring a simple component using the **Option API** into a setup script component with **Composition APIs**.

## Implementation

Here's a standard Vue component using the Option API:

```html
<template>
  <input v-model="name" />
  <button @click="incrementAge()">Increment Age</button>
  <h1>{{ computedVariable }}</h1>
</template>

<script>
export default {
  data() {
    return {
      name: "Hossein",
      age: 26,
    };
  },
  computed: {
    computedVariable() {
      return `My name is ${this.name} and I'm ${this.age} years old`;
    },
  },
  methods: {
    incrementAge() {
      this.age += 1;
    },
  },
};
</script>
```

Refactor this component in multiple steps:

### Refactor Step 1: Using Composition API

```html
<template>
  <input v-model="user.name" />
  <button @click="incrementAge()">Increment Age</button>
  <h1>{{ computedVariable }}</h1>
</template>

<script>
import { computed, reactive } from "vue";

export default {
  setup() {
    const user = reactive({ name: "Hossein", age: 26 });

    function incrementAge() {
      user.age++;
    }

    const computedVariable = computed(() => `My name is ${user.name} and I'm ${user.age} years old`);

    return {
      computedVariable,
      incrementAge,
      user
    };
  },
};
</script>
```

### Refactor Step 2: Using defineComponent

```html
<template>
  <input v-model="user.name" />
  <button @click="incrementAge()">Increment Age</button>
  <h1>{{ computedVariable }}</h1>
</template>

<script lang="ts">
import { defineComponent, computed, reactive, type Computed, type Reactive } from "vue";

interface User {
  name: string;
  age: number;
}

interface ComponentOutput {
  computedVariable: Computed<string>;
  incrementAge: () => void;
  user: Reactive<User>;
}

export default defineComponent({
  setup(): ComponentOutput {
    const user = reactive<User>({ name: "Hossein", age: 26 });

    function incrementAge(): void {
      user.age++;
    }

    const computedVariable = computed<string>(() => `My name is ${user.name} and I'm ${user.age} years old`);

    return {
      computedVariable,
      incrementAge,
      user
    };
  },
});
</script>
```

### Refactor Step 3: Using Script Setup

```html
<template>
  <input v-model="user.name" />
  <button @click="incrementAge()">Increment Age</button>
  <h1>{{ computedVariable }}</h1>
</template>

<script setup lang="ts">
import { computed, reactive } from "vue";

interface User {
  name: string;
  age: number;
}

const user = reactive<User>({ name: "Hossein", age: 26 });

function incrementAge(): void {
  user.age++;
}

const computedVariable = computed<string>(() => `My name is ${user.name} and I'm ${user.age} years old`);
</script>
```

## Conclusion

Using the **script setup** is extremely useful, easy to read, and leads to much leaner code. It's recommended for regular use in Vue applications.

**Ref:** [Hossein Mousavi - Medium](https://itnext.io/refactor-your-vue-application-by-using-setup-scripts-f4d68853d75e)
