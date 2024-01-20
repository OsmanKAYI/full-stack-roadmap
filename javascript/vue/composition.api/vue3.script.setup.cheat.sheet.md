# Vue 3 Script Setup Cheat Sheet

- Everything that you declared inside script setup will be available in the template

<div style="text-align: center;">
  <img src="https://miro.medium.com/v2/resize:fit:4800/format:webp/1*37XVZ_Eez4ihx8rZH9NfMw.png">
</div>

### Methods

```js
<script setup>
function getParam(param) {
  return param;
}
</script>

<template>
  {{ getParam(1) }}
</template>
```

### Reactive Data Declaration

- Use `ref` for primitives and `reactive` for complex types

```js
import { ref, reactive } from "vue";
const enabled = ref(true);
const object = reactive({ variable: false });
```

### Component Declaration

```js
import { defineAsyncComponent } from "vue";
import TheComponent from "./components/TheComponent.vue";
const AsyncComponent = defineAsyncComponent(() =>
  import("./components/AsyncComponent.vue")
);
```

### Computed Value

```js
import { computed } from "vue";
const count = 0;
const isEmpty = computed(() => {
  return count === 0;
});
```

### Watcher

```js
import { watch, ref } from "vue";
const counter = ref(0);
watch(counter, () => {
  console.log("Counter value changed");
});
```

### Lifecycle Hooks

```js
import { onMounted } from "vue";
console.log("Equivalent to created hook");
onMounted(() => {
  console.log("Mounted hook called");
});
```

### Define Emits

```js
const emit = defineEmits(["event-name"]);
function emitEvent() {
  emit("event-name");
}
```

### Define Props

```js
defineProps({
  elements: Array,
  counter: {
    type: Number,
    default: 0,
  },
});
```

**Ref:** [fadamakis.com](https://fadamakis.com/vue-3-script-setup-cheat-sheet-36572c042128)
