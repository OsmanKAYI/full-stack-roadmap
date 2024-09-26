# Vue 3 Script Setup Cheat Sheet

> Everything declared inside `script setup` is available in the template.

## Methods

```vue
<script setup>
function getParam(param) {
  return param;
}
</script>

<template>
  {{ getParam(1) }}
</template>
```

## Reactive Data Declaration

> Use [ref](https://vuejs.org/api/reactivity-core.html#ref) for primitives and [reactive](https://vuejs.org/api/reactivity-core.html#reactive) for complex types.

```vue
<script setup>
import { ref, reactive } from 'vue';

const enabled = ref(true);
const object = reactive({ variable: false });
</script>
```

## Component Declaration

```vue
<script setup>
import { defineAsyncComponent } from 'vue';
import TheComponent from './components/TheComponent.vue';

const AsyncComponent = defineAsyncComponent(() =>
  import('./components/AsyncComponent.vue')
);
</script>
```

## Computed Value

```vue
<script setup>
import { computed } from 'vue';

const count = 0;
const isEmpty = computed(() => {
  return count === 0;
});
</script>
```

## Watcher

```vue
<script setup>
import { watch, ref } from 'vue';

const counter = ref(0);
watch(counter, () => {
  console.log('Counter value changed');
});
</script>
```

## Lifecycle Hooks

```vue
<script setup>
import { onMounted } from 'vue';

console.log('Equivalent to created hook');
onMounted(() => {
  console.log('Mounted hook called');
});
</script>
```

## Define Emits

```vue
<script setup>
const emit = defineEmits(['event-name']);

function emitEvent() {
  emit('event-name');
}
</script>
```

## Define Props

```vue
<script setup>
const props = defineProps({
  elements: Array,
  counter: {
    type: Number,
    default: 0,
  },
});
</script>
```

![Vue 3 Script Setup Cheat Sheet](https://miro.medium.com/v2/resize:fit:700/1*37XVZ_Eez4ihx8rZH9NfMw.png)

[Download print-friendly PDF](https://drive.google.com/file/d/1UE47WlAm9Re76whHZAUqSRgUqQ-DiCfi/view)

**Ref:** [Fotis Adamakis - Medium](https://fadamakis.com/vue-3-script-setup-cheat-sheet-36572c042128)
