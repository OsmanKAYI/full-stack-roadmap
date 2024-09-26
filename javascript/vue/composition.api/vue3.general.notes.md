# General Notes for Vue 3

## Creating a Vue Application

### App Configurations

```ts
app.component("TodoDeleteButton", TodoDeleteButton);
// This makes the TodoDeleteButton available for use anywhere in our app.
// https://vuejs.org/guide/essentials/application.html#app-configurations
```

## Template Syntax

### Dynamically Binding Multiple Attributes

```ts
const objectOfAttrs = {
  id: 'container',
  class: 'wrapper'
}

<div v-bind="objectOfAttrs"></div>
// or simply
<div :objectOfAttrs></div>
```

### Modifiers

```ts
<template>
  <form @submit.prevent="onSubmit">...</form>
</template>
```

## Reactivity Fundamentals

- When you use a ref in a template, and change the ref's value later, Vue automatically detects the change and updates the DOM accordingly. This is made possible with a dependency-tracking based reactivity system. When a component is rendered for the first time, Vue tracks every ref that was used during the render. Later on, when a ref is mutated, it will trigger a re-render for components that are tracking it.

- In standard JavaScript, there is no way to detect the access or mutation of plain variables. However, we can intercept the get and set operations of an object's properties using getter and setter methods.

- The .value property gives Vue the opportunity to detect when a ref has been accessed or mutated. Under the hood, Vue performs the tracking in its getter, and performs triggering in its setter.

### Declaring Reactive State (Ref)

```ts
<script setup>
  import {ref} from 'vue' const count = ref(0) function increment(){" "}
  {count.value++}
</script>

<template>
  <button @click="increment">
    {{ count }}
  </button>
</template>
```

### Deep Reactivity

```ts
import { ref } from "vue";

const obj = ref({
  nested: { count: 0 },
  arr: ["foo", "bar"],
});

function mutateDeeply() {
  // these will work as expected.
  obj.value.nested.count++;
  obj.value.arr.push("baz");
}
```

### Dom Update Timing

- When you mutate reactive state, the DOM is updated automatically. However, it should be noted that the DOM updates are not applied synchronously. Instead, Vue buffers them until the "next tick" in the update cycle to ensure that each component updates only once no matter how many state changes you have made.

```ts
import { nextTick } from "vue";

async function increment() {
  count.value++;
  await nextTick();
  // Now the DOM is updated
}
```

### Reactive

- Unlike a ref which wraps the inner value in a special object, reactive() makes an object itself reactive

```ts
import { reactive } from 'vue'

const state = reactive({ count: 0 })

<template>
  <button @click="state.count++">
    {{ state.count }}
  </button>
</template>
```

## Computed Properties

- A computed property automatically tracks its reactive dependencies.

```ts
<script setup>
import { reactive, computed } from 'vue'

const author = reactive({
  name: 'John Doe',
  books: [
    'Vue 2 - Advanced Guide',
    'Vue 3 - Basic Guide',
    'Vue 4 - The Mystery'
  ]
})

// a computed ref
const publishedBooksMessage = computed(() => {
  return author.books.length > 0 ? 'Yes' : 'No'
})
</script>

<template>
  <p>Has published books:</p>
  <span>{{ publishedBooksMessage }}</span>
</template>
```

- The computed() function expects to be passed a getter function, and the returned value is a computed ref. Similar to normal refs, you can access the computed result as publishedBooksMessage.value. Computed refs are also auto-unwrapped in templates so you can reference them without .value in template expressions.

- A computed property automatically tracks its reactive dependencies. Vue is aware that the computation of publishedBooksMessage depends on author.books, so it will update any bindings that depend on publishedBooksMessage when author.books changes.

- Computed properties are cached based on their reactive dependencies. A computed property will only re-evaluate when some of its reactive dependencies have changed. This means as long as author.books has not changed, multiple access to publishedBooksMessage will immediately return the previously computed result without having to run the getter function again.

- In cases where you do not want caching, use a method call instead.

- **Avoid mutating computed value**
  ​ - The returned value from a computed property is derived state. Think of it as a temporary snapshot - every time the source state changes, a new snapshot is created. It does not make sense to mutate a snapshot, so a computed return value should be treated as read-only and never be mutated - instead, update the source state it depends on to trigger new computations.

## CLASS AND STYLE BINDINGS

### Binding To Computed Property

```ts
const isActive = ref(true)
const error = ref(null)

const classObject = computed(() => ({
  active: isActive.value && !error.value,
  'text-danger': error.value && error.value.type === 'fatal'
}))

<template>
<div :class="classObject"></div>
</template>
```

### Binding To Arrays

```ts
<template>
  <div :class="[{ active: isActive }, errorClass]"></div>
</template>
```

### Binding With Components

- If your component has multiple root elements, you would need to define which element will receive this class. You can do this using the $attrs component property:
- The below codes show how to use $attrs in a component to get the attributes of the parent component.

```html
<template>
  <!-- MyComponent template using $attrs -->
  <p :class="$attrs.class">Hi!</p>
  <span>This is a child component</span>
</template>
```

```ts
// parent component
<MyComponent class="baz" />
```

### Multiple Values

```html
<template>
  <div :style="{ display: ['-webkit-box', '-ms-flexbox', 'flex'] }"></div>
</template>
```

- This will only render the last value in the array which the browser supports. In this example, it will render display: flex for browsers that support the unprefixed version of flexbox.

## Conditional Rendering

### v-if vs. v-show

- v-if is "real" conditional rendering because it ensures that event listeners and child components inside the conditional block are properly destroyed and re-created during toggles.
- v-if is also lazy: if the condition is false on initial render, it will not do anything - the conditional block won't be rendered until the condition becomes true for the first time.
- In comparison, v-show is much simpler - the element is always rendered regardless of initial condition, with CSS-based toggling.
- Generally speaking, v-if has higher toggle costs while v-show has higher initial render costs. So prefer v-show if you need to toggle something very often, and prefer v-if if the condition is unlikely to change at runtime.

## List Rendering

### v-for

- Inside the v-for scope, template expressions have access to all parent scope properties. In addition, v-for also supports an optional second alias for the index of the current item:

```ts
const parentMessage = ref('Parent')
const items = ref([{ message: 'Foo' }, { message: 'Bar' }])

<template>
<li v-for="(item, index) in items">
  {{ parentMessage }} - {{ index }} - {{ item.message }}
</li>
</template>

// Parent - 0 - Foo
// Parent - 1 - Bar
```

- You can also use `of` as the delimiter instead of `in`, so that it is closer to JavaScript's syntax for iterators:

```ts
<template>
  <div v-for="item of items"></div>
</template>
```

### v-for with v-if

- When they exist on the same node, v-if has a higher priority than v-for. That means the v-if condition will not have access to variables from the scope of the v-for:

```html
<!--
This will throw an error because property "todo"
is not defined on instance.
-->
<li v-for="todo in todos" v-if="!todo.isComplete">{{ todo.name }}</li>
```

- This can be fixed by moving v-for to a wrapping <template> tag (which is also more explicit):
  template

```html
<template v-for="todo in todos">
  <li v-if="!todo.isComplete">{{ todo.name }}</li>
</template>
```

### Maintaining State with `key`

- Vue.js will use the key attribute to determine if a list item needs to be re-rendered or not. If the key changes, Vue will re-render the list item.
- When using `<template v-for>`, the key should be placed on the `<template>` container:

```ts
<template v-for="todo in todos" :key="todo.name">
  <li>{{ todo.name }}</li>
</template>
```

- The key binding expects primitive values - i.e. strings and numbers. Do not use objects as v-for keys.

### `v-for` with a Component

- You can directly use v-for on a component, like any normal element (don't forget to provide a key):
  template

```html
<MyComponent v-for="item in items" :key="item.id" />
```

- However, this won't automatically pass any data to the component, because components have isolated scopes of their own. In order to pass the iterated data into the component, we should also use props:
  template

```html
<MyComponent
  v-for="(item, index) in items"
  :item="item"
  :index="index"
  :key="item.id"
/>
```

### Array Change Detection

#### Mutation Methods

- Vue is able to detect when a reactive array's mutation methods are called and trigger necessary updates. These mutation methods are:

  - `push()`
  - `pop()`
  - `shift()`
  - `unshift()`
  - `splice()`
  - `sort()`
  - `reverse()`

- Be careful with reverse() and sort() in a computed property! These two methods will mutate the original array, which should be avoided in computed getters. Create a copy of the original array before calling these methods:
  diff

```ts
- return numbers.reverse()
+ return [...numbers].reverse()
```

## Event Handling

### Inline Handlers

```ts
const count = ref(0)

<template>
  <button @click="count++">Add 1</button>
  <p>Count is: {{ count }}</p>
</template>
```

### Method vs. Inline Detection

- The template compiler detects method handlers by checking whether the v-on value string is a valid JavaScript identifier or property access path. For example, foo, foo.bar and foo['bar'] are treated as method handlers, while foo() and count++ are treated as inline handlers.

### Event Modifiers

- `.stop`
- `.prevent`
- `.self`
- `.capture`
- `.once`
- `.passive`

```html
<!-- the click event's propagation will be stopped -->
<a @click.stop="doThis"></a>

<!-- the submit event will no longer reload the page -->
<form @submit.prevent="onSubmit"></form>

<!-- modifiers can be chained -->
<a @click.stop.prevent="doThat"></a>

<!-- just the modifier -->
<form @submit.prevent></form>

<!-- only trigger handler if event.target is the element itself -->
<!-- i.e. not from a child element -->
<div @click.self="doThat">...</div>
```

### Key Modifiers

- When listening for keyboard events, we often need to check for specific keys. Vue allows adding key modifiers for v-on or @ when listening for key events:
  template

```html
<!-- only call `submit` when the `key` is `Enter` -->
<input @keyup.enter="submit" />
```

#### Key Aliases

- Vue provides aliases for the most commonly used keys:
  - `.enter`
  - `.tab`
  - `.delete (captures both "Delete" and "Backspace" keys)`
  - `.esc`
  - `.space`
  - `.up`
  - `.down`
  - `.left`
  - `.right`

#### System Modifier Keys

- You can use the following modifiers to trigger mouse or keyboard event listeners only when the corresponding modifier key is pressed:
  - `.ctrl`
  - `.alt`
  - `.shift`
  - `.meta`

### Mouse Button Modifiers

​- These modifiers restrict the handler to events triggered by a specific mouse button.

- `.left`
- `.right`
- `.middle`

## Form Input Bindings

### Basic Usage

#### Checkbox

```ts
<script setup>
import { ref } from 'vue'

const checkedNames = ref([])
</script>

<template>
  <div>Checked names: {{ checkedNames }}</div>

  <input type="checkbox" id="jack" value="Jack" v-model="checkedNames" />
  <label for="jack">Jack</label>

  <input type="checkbox" id="john" value="John" v-model="checkedNames" />
  <label for="john">John</label>

  <input type="checkbox" id="mike" value="Mike" v-model="checkedNames" />
  <label for="mike">Mike</label>
</template>
```

- In this case, the checkedNames array will always contain the values from the currently checked boxes.

#### Radio

```ts
<script setup>
import { ref } from 'vue'

const picked = ref('One')
</script>

<template>
  <div>Picked: {{ picked }}</div>

	<input type="radio" id="one" value="One" v-model="picked" />
	<label for="one">One</label>

	<input type="radio" id="two" value="Two" v-model="picked" />
  <label for="two">Two</label>
</template>
```

#### Select

**Single Select**

```ts
<script setup>
import { ref } from 'vue'

const selected = ref('')
</script>

<template>
  <span> Selected: {{ selected }}</span>

  <select v-model="selected">
    <option disabled value="">Please select one</option>
    <option>A</option>
    <option>B</option>
    <option>C</option>
  </select>
</template>
```

**Multiple Select**

```ts
<script setup>
import { ref } from 'vue'

const selected = ref([])
</script>

<template>
  <div>Selected: {{ selected }}</div>

  <select v-model="selected" multiple>
    <option>A</option>
    <option>B</option>
    <option>C</option>
  </select>
</template>

<style>
select[multiple] {
  width: 100px;
}
</style>
```

### Modifiers

**.lazy**

- By default, v-model syncs the input with the data after each input event (with the exception of IME composition as stated above). You can add the lazy modifier to instead sync after change events:
  template

```html
<!-- synced after "change" instead of "input" -->
<input v-model.lazy="msg" />
```

**.number**

- If you want user input to be automatically typecast as a number, you can add the number modifier to your v-model managed inputs:
  template

```html
<input v-model.number="age" />
```

- If the value cannot be parsed with `parseFloat()`, then the original value is used instead.
- The number modifier is applied automatically if the input has type="number".

**.trim**

- ​If you want whitespace from user input to be trimmed automatically, you can add the trim modifier to your v-model-managed inputs:
  template

```html
<input v-model.trim="msg" />
```

## Lifecycle Hooks

- Beautiful diagram of vue lifecycle hooks shown below which most commonly used being `onMounted`, `onUpdated`, and `onUnmounted`.

## Watchers

- With Composition API, we can use the watch function to trigger a callback whenever a piece of reactive state changes:

```ts
<script setup>
import { ref, watch } from 'vue'

const question = ref('')
const answer = ref('Questions usually contain a question mark. ;-)')
const loading = ref(false)

// watch works directly on a ref
watch(question, async (newQuestion, oldQuestion) => {
  if (newQuestion.includes('?')) {
    loading.value = true
    answer.value = 'Thinking...'
    try {
      const res = await fetch('https://yesno.wtf/api')
      answer.value = (await res.json()).answer
    } catch (error) {
      answer.value = 'Error! Could not reach the API. ' + error
    } finally {
      loading.value = false
    }
  }
})
</script>

<template>
  <p>
    Ask a yes/no question:
    <input v-model="question" :disabled="loading" />
  </p>
  <p>{{ answer }}</p>
</template>
```

### Deep Watchers

- You can force the second case into a deep watcher by explicitly using the deep option:
  js

```ts
watch(
  () => state.someObject,
  (newValue, oldValue) => {
    // Note: `newValue` will be equal to `oldValue` here
    // *unless* state.someObject has been replaced
  },
  { deep: true }
);
```

**_Use with Caution:_** Deep watch requires traversing all nested properties in the watched object, and can be expensive when used on large data structures. Use it only when necessary and beware of the performance implications.

### Eager Watchers

- `watch` is lazy by default: the callback won't be called until the watched source has changed. But in some cases we may want the same callback logic to be run eagerly - for example, we may want to fetch some initial data, and then re-fetch the data whenever relevant state changes.
- We can force a watcher's callback to be executed immediately by passing the `immediate: true` option:
  js

```ts
watch(
  source,
  (newValue, oldValue) => {
    // executed immediately, then again when `source` changes
  },
  { immediate: true }
);
```

### watchEffect()

- It is common for the watcher callback to use exactly the same reactive state as the source. For example, consider the following code, which uses a watcher to load a remote resource whenever the `todoId` ref changes:

```ts
const todoId = ref(1);
const data = ref(null);

watch(
  todoId,
  async () => {
    const response = await fetch(
      `https://jsonplaceholder.typicode.com/todos/${todoId.value}`
    );
    data.value = await response.json();
  },
  { immediate: true }
);
```

- This can be simplified with watchEffect(). watchEffect() allows us to track the callback's reactive dependencies automatically. The watcher above can be rewritten as:

```ts
watchEffect(async () => {
  const response = await fetch(
    `https://jsonplaceholder.typicode.com/todos/${todoId.value}`
  );
  data.value = await response.json();
});
```

### watch vs. watchEffect

- `watch` and `watchEffect` both allow us to reactively perform side effects. Their main difference is the way they track their reactive dependencies:
  - `watch` only tracks the explicitly watched source. It won't track anything accessed inside the callback. In addition, the callback only triggers when the source has actually changed. watch separates dependency tracking from the side effect, giving us more precise control over when the callback should fire.
  - `watchEffect`, on the other hand, combines dependency tracking and side effect into one phase. It automatically tracks every reactive property accessed during its synchronous execution. This is more convenient and typically results in terser code, but makes its reactive dependencies less explicit.

### Stopping a Watcher

- To manually stop a watcher, use the returned handle function. This works for both watch and watchEffect:

```ts
const unwatch = watchEffect(() => {});

// ...later, when no longer needed
unwatch();
```

- Note that there should be very few cases where you need to create watchers asynchronously, and synchronous creation should be preferred whenever possible. If you need to wait for some async data, you can make your watch logic conditional instead:

```ts
// data to be loaded asynchronously
const data = ref(null);

watchEffect(() => {
  if (data.value) {
    // do something when data is loaded
  }
});
```
