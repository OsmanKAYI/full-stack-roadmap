# Vue Render Optimization with `v-once` and `v-memo`

Front-end frameworks, such as Vue and React, have become popular due to JavaScript's lack of reactivity.

Let's explore the differences between reactive and non-reactive data in Vue.

```js
<script setup>
  import { ref } from 'vue'

  const a = ref(0)
  const b = 0
</script>
```

```html
<template>
  <div class="container">
    <div>
      <span>A (Reactive): {{ a }}</span>
      <button @click="a++">Increase A</button>
    </div>
    <div>
      <span>B (Non-Reactive): {{ b }}</span>
      <button @click="b++">Increase B</button>
    </div>
  </div>
</template>
```

In Vue 3, reactivity is achieved by wrapping data within a proxy. This ensures that UI updates automatically when the data changes.

However, if a reactive variable is not expected to change or its changes don't need to be reflected in the UI, `v-once` or `v-memo` can be used to avoid unnecessary updates.

### `v-once`

Use `v-once` to render elements only once, preventing further updates.

It can be applied to individual elements, elements with children, components, or elements rendered via `v-for` directive.

```html
<!-- Single element -->
<span v-once>This will never change: {{ msg }}</span>

<!-- Element with children -->
<div v-once>
  <h1>Comment</h1>
  <p>{{ msg }}</p>
</div>

<!-- Component -->
<MyComponent v-once :comment="msg" />

<!-- `v-for` directive -->
<ul>
  <li v-for="i in list" v-once>{{ i }}</li>
</ul>
```

Changes to both `msg` and `list` will not affect the UI.

### `v-memo`

Introduced in Vue 3.2, `v-memo` works similarly to `v-once`.

With `v-memo`, updates depend on specific data changes defined in an array. UI updates occur only when values within this array change.

```html
<template>
  <div v-memo="[valueA, valueB]">
    <!-- Content updates only if valueA or valueB change -->
  </div>
</template>
```

Choosing the correct dependencies is crucial. An incorrect array can lead to skipped updates when they shouldn't be. A `v-memo` with no dependencies functions like `v-once`, rendering the element or component only once.

`v-memo` is particularly useful for performance-critical scenarios, such as rendering large lists with `v-for` (e.g., lists with more than 1000 items).

Consider the following code snippet:

```html
<template>
  <div v-for="item in list" :key="item.id" v-memo="[item.id === selected]">
    <p>ID: {{ item.id }} - selected: {{ item.id === selected }}</p>
    <!-- More child nodes -->
  </div>
</template>
```

Here, `v-memo` optimizes rendering by updating an item only if its selection status changes, reducing unnecessary diffing for items whose state hasn’t changed.

### Conclusion

In summary, `v-once` and `v-memo` are used to optimize Vue templates for efficiency and responsiveness. `v-once` is ideal for one-time render situations, while `v-memo` provides the precision to update only what's necessary. Both optimizations can significantly improve the performance of data-intensive applications when used appropriately.

This markdown version paraphrases the provided text, summarizing the concepts of `v-once` and `v-memo` in Vue render optimization.

**Ref:** [Fotis Adamakis - Medium](https://fadamakis.com/vue-render-optimization-with-v-once-and-v-memo-28f39bc0e66a)