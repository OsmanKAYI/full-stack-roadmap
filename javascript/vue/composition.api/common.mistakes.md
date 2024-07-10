# 10 Mistakes to Avoid When Starting with Vue 3

**TL;DR:**

- Use `reactive` for Object, Array, Map, Set
- Use `ref` for String, Number, Boolean
- Using reactive for a primitive (string, number, boolean) will result in a warning, and the value will not be made reactive.
- Using ref for declaring an Array will internally call reactive instead.
- Ref takes a value and returns a reactive object. The value is available inside the object under the `.value` property.
- Another thing to keep in mind is that neither `defineEmits` nor `defineProps` (used to declare props) need to be imported. They are **automatically available** when using `script setup`.
- Since Vue 3, async components need to be explicitly defined with thedefineAsyncComponent helper.

Vue 3 has been stable for quite some time now. Many codebases are using it in production, and everyone else will have to migrate eventually. I had the opportunity to work with it and kept track of my mistakes, which you probably want to avoid.

## 1. Using the Reactive Helper for Declaring Primitives

Data declaration used to be straightforward, but now multiple helpers are available. The general rule now is:

- Use `reactive` for Object, Array, Map, Set
- Use `ref` for String, Number, Boolean

Using `reactive` for a primitive will result in a warning, and the value will not be made reactive.

```javascript
/* DOES NOT WORK AS EXPECTED */
<script setup>import {reactive} from "vue"; const count = reactive(0);</script>
```

## 2. Destructuring a Reactive value

Let’s imagine you have a reactive object with a counter and a button to increase it.

```html
<template>
  Counter: {{ state.count }}
  <button @click="add">Increase</button>
</template>
```

```javascript
<script>
import { reactive } from "vue";
export default {
  setup() {
    const state = reactive({ count: 0 });

    function add() {
      state.count++;
    }

    return {
      state,
      add,
    };
  },
};
</script>
```

Pretty straightforward and works as expected, but you might get tempted to leverage JavaScript destructuring and do the following.

```html
/* DOES NOT WORK AS EXPECTED */
<template>
  <div>Counter: {{ count }}</div>
  <button @click="add">Increase</button>
</template>
```

```javascript
<script>
import { reactive } from "vue";
export default {
  setup() {
    const state = reactive({ count: 0 });

    function add() {
      state.count++;
    }

    return {
      ...state,
      add,
    };
  },
};
</script>
```

Code looks the same and, based on our previous experience, should work, but in fact, Vue’s reactivity tracking works over property access. This means we can’t assign or destructure a reactive object because the reactivity connection to the first reference is lost. This is one of the limitations of using the reactive helper.

## 3. Getting Confused with `.value`

On a similar note, one of the quirks of using ref can be hard to get used to.

Ref takes a value and returns a reactive object. The value is available inside the object under the `.value` property.

```javascript
const count = ref(0);

console.log(count); // { value: 0 }
console.log(count.value); // 0

count.value++;
console.log(count.value); // 1
```

But refs are unwrapped while used in the template, and the `.value` is not needed.

```javascript
<script setup>
import { ref } from 'vue';

const count = ref(0);

function increment() {
  count.value++;
}
</script>
```

```html
<template>
  <button @click="increment">
    {{ count }}
    <!-- no .value needed -->
  </button>
</template>
```

But be careful! Unwrapping only works on top-level properties. The following snippet will produce `[object Object]`.

```javascript
// DON'T DO THIS
<script setup>
import { ref } from 'vue';

const object = { foo: ref(1) };
</script>
```

```html
<template>
  {{ object.foo + 1 }}
  <!-- [object Object] -->
</template>
```

Using `.value` correctly requires time. Although I occasionally forgot about it, I first found myself using it more frequently than needed.

## 4. Emitted Events

Since the initial release of Vue, a child component can communicate with the parent using emits. You only needed to add a custom listener to listen for an event.

```javascript
this.$emit("my-event");
```

```html
<my-component @my-event="doSomething" />
```

Now emits need to be declared using the defineEmits macro.

```javascript
<script setup>const emit = defineEmits(['my-event']); emit('my-event');</script>
```

Another thing to keep in mind is that neither `defineEmits` nor `defineProps` (used to declare props) need to be imported. They are automatically available when using script setup.

```javascript
<script setup>
const props = defineProps({
  foo: String
});

const emit = defineEmits(['change', 'delete']);
// setup code
</script>
```

Lastly, because the events now have to be declared, the usage of the `.native` modifier is not needed, and it's, in fact, been removed.

## 5. Declaring Additional Options

There are a few properties of the Options API method that are not supported from the script setup:

- name
- inheritAttrs
- Custom options needed by plugins or libraries

The solution is to have 2 different scripts in the same component as defined in the script setup RFC.

```javascript
<script>
  export default {
    name: 'CustomName',
    inheritAttrs: false,
    customOptions: {}
  }
</script>
```

```javascript
<script setup>// script setup logic</script>
```

## 6. Using Reactivity Transform

Reactivity Transform was one experimental but controversial feature of Vue 3 that was aiming to simplify the way of declaring a component. The idea was to leverage compile-time transforms to automatically unwrap a ref and make `.value` obsolete. But it is now dropped and will be removed in Vue 3.3. It will be still available as a package, but since it's not part of the Vue core, it's better not to invest time in it.

## 7. Defining Async Components

Async components were formerly declared by enclosing them in a function.

```javascript
const asyncModal = () => import("./Modal.vue");
```

Since Vue 3, async components need to be explicitly defined with the `defineAsyncComponent` helper.

```javascript
import { defineAsyncComponent } from "vue";

const asyncModal = defineAsyncComponent(() => import("./Modal.vue"));
```

## 8. Using Unnecessary Wrappers in Templates

A single root element for the component template was required in Vue 2, which sometimes introduced unnecessary wrappers.

```html
<!-- Layout.vue -->
<template>
  <div>
    <header>...</header>
    <main>...</main>
    <footer>...</footer>
  </div>
</template>
```

This is no longer the case, as multiple root elements are now supported. 🥳

```html
<!-- Layout.vue -->
<template>
  <header>...</header>
  <main v-bind="$attrs">...</main>
  <footer>...</footer>
</template>
```

## 9. Using the Wrong Lifecycle Event

All of the component lifecycle events got renamed, either by adding the `on` prefix or by changing name completely. You can check all the changes in the following graphic.

![Lifecycle Events](https://miro.medium.com/v2/resize:fit:720/format:webp/1*qzhEL7PQiNpu9dVExQI5QA.png)

## 10. Skipping the Documentation

Lastly, the [official documentation](https://vuejs.org/guide/introduction.html) has been revamped to reflect the new APIs and include many valuable notes, guides, and best practices. Even if you are a seasoned Vue 2 engineer, you will definitely learn something new by reading it.

## Conclusion

Every framework has a learning curve, and Vue 3’s is unquestionably steeper than Vue 2's. The composition API is much cleaner and feels natural after you get the hang of it.

> **Making mistakes is a lot better than not doing anything.**

**Ref:** [fadamakis.com](https://fadamakis.com/10-mistakes-to-avoid-when-starting-with-vue-3-1d1ced8552ae)
