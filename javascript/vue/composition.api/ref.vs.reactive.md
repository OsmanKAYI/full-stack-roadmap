# Ref vs Reactive - Vue 3 Reactive Data Declaration

**TL;DR:**

- In Vue 3's Composition API, declaring reactive data requires using `ref` for primitive types and top-level properties, and `reactive` for objects and arrays.
- There's an experimental reactivity transform to simplify code.
- Non-reactive data can be declared directly.
- `readonly` prevents mutations.

Declaring Reactive Data while working with the Options API was straightforward. Everything inside the `data` option was automatically made reactive and was available in the template. The only caveat was to make `data` a function and prevent sharing state across all component instances.

With Composition API things are not that simple. State declaration has to be done explicitly, using the two available utility functions (`ref` and `reactive`), and there are multiple quirks that you need to be aware of in the beginning.

## Reactive

Let's start with the easy one, Reactive. It accepts an Object or Array and makes it reactive using a JavaScript proxy.

```js
import { reactive } from "vue";

const state = reactive({ count: 0 });
```

State variable will behave exactly as a normal Object would.

```js
<script setup>
import { reactive } from 'vue'

const state = reactive({ count: 0 })

function increment() {
  state.count++
}
</script>
```

```html
<template>
  <button @click="increment">{{ state.count }}</button>
</template>
```

The same applies to objects with multiple levels. Everything would be deeply reactive.

That’s easy! But there is a catch. This only works with Complex types (Objects and Arrays) and Collection types (Maps and Sets). For primitive types like string, number, or boolean, we need a different approach.

## Ref

To overcome this limitation we need to use the `ref` utility. The declaration is similar to reactive.

```js
import { ref } from "vue";

const count = ref(0);
```

`Ref` takes a value and returns a reactive object. The value is available inside the object under the `.value` property.

```js
const count = ref(0);

console.log(count); // { value: 0 }
console.log(count.value); // 0

count.value++;
console.log(count.value); // 1
```

Thankfully refs are unwrapped while used in the template and the `.value` is not needed.

```js
<script setup>
  import {ref} from 'vue' const count = ref(0) function increment(){" "}
  {count.value++}
</script>
```

```html
<template>
  <button @click="increment">{{ count }} // no .value needed</button>
</template>
```

But be careful! Unwrapping only works on top-level properties. The following snippet will produce `[object Object]`

```js
// DON'T DO THIS
<script setup>
import { ref } from 'vue'

const object = { foo: ref(1) }
</script>
```

```html
<template> {{ object.foo + 1 }} // [object Object] </template>
```

To fix this we need to make `foo` a top-level property.

```js
<script setup>
import { ref } from 'vue'

const object = { foo: ref(1) }
const { foo } = object
</script>
```

```html
<template> {{ foo + 1 }} // This works as expected </template>
```

Be aware that for Arrays and Collection types `.value` needs to be used as well.

```js
const books = reactive([ref("Book title")]);

console.log(books[0].value); // need .value here

const map = reactive(new Map([["count", ref(0)]]));

console.log(map.get("count").value); // need .value here
```

### The future

The mental overhead to add the `.value` in some places creates confusion and often feels quite dirty. Thankfully there is an experimental solution that leverages compile time transforms to fix this. Reactivity transform is an opt-in built step that adds this suffix automatically and makes the code look much cleaner.

```js
// Reactivity Transform
<script setup>
  let count = $ref(0) console.log(count) function increment() {count++}
</script>
```

```html
<template>
  <button @click="increment">{{ count }}</button>
</template>
```

It is not really recommended to use it yet. It is not finalized and the API might change in the future, but it is certainly a step in the right direction.

### Non-Reactive Data

Declaring non-reactive data the old way was not straightforward. Often everything was declared inside `data` which created unnecessary watchers and a small (negligible) performance degradation.

```js
<script setup>const path = `path/to/image`;</script>
```

```html
<template>
  <img :src="path" />
</template>
```

### Readonly

Preventing mutations to the state can be done with the `readonly` utility. It takes an object (reactive or plain) or a ref and returns an immutable proxy to it.

```js
const state = reactive({ count: 0 });

const copy = readonly(state);

state.count++; // Works fine

copy.count++; // Fails with a warning
```

### Conclusion

Many years after the Vue 3 announcement and some basic things, like data declaration, feel unnatural and immature. Reactivity transform looks promising but it's not ready yet. Sooner or later everything will be stable and a joy to work with. Composition API is definitely better and a much cleaner approach. Reading and getting your hands dirty is the best way to prepare and adopt the new ways of working. Have fun!

**Ref:** [fadamakis.com](https://fadamakis.com/vue-3-reactive-data-declaration-d17edc0a92e3)
