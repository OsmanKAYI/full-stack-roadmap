# Vue 3 Reference Component

**TL;DR:** Consistent code style is crucial in Vue 3 projects. Document a Single File Component as a reference to maintain standardization. The Composition API is recommended for new projects due to its modular approach, but Options API remains a viable, easy-to-learn choice.

Consistent code style is key to maintaining code quality and facilitating collaboration. Without standardization, codebases can become unmanageable. This issue has become more pronounced in the Vue ecosystem with Vue 3's introduction and the [variety of ways to write a component](https://fadamakis.com/the-5-ways-to-define-a-component-in-vue-3-aeb01ac6f39f).

An effective solution is to document a Single File Component as a reference and share it with all team members, ensuring a unified approach and improving codebase coherence.

## Picking a Syntax

Choosing the right syntax for a framework significantly affects the development experience. Aligning closely with the official documentation offers seamless integration with third-party libraries, better support for future upgrades, and ease for new team members.

In Vue, two syntaxes stand out: Options API and Composition API.

## Options API

The Options API is popular and easy to learn.

```vue
<script>
import TheComponent from './components/TheComponent.vue'
import componentMixin from './mixins/componentMixin.js'

export default {
  name: 'OptionsAPI',
  components: {
    TheComponent,
    AsyncComponent: () => import('./components/AsyncComponent.vue'),
  },
  mixins: [componentMixin],
  props: {
    elements: {
      type: Array,
    },
    counter: {
      type: Number,
      default: 0,
    },
  },
  data() {
    return {
      object: {
        variable: true,
      },
    }
  },
  computed: {
    isEmpty() {
      return this.counter === 0
    },
  },
  watch: {
    counter() {
      console.log('Counter value changed')
    },
  },
  created() {
    console.log('Created hook called')
  },
  mounted() {
    console.log('Mounted hook called')
  },
  methods: {
    getParam(param) {
      return param
    },
    emitEvent() {
      this.$emit('event-name')
    },
  },
}
</script>

<template>
  <div class="wrapper">
    <TheComponent />
    <AsyncComponent v-if="object.variable" />
    <div
      class="static-class-name"
      :class="{ 'dynamic-class-name': object.variable }"
    >
      Dynamic attributes example
    </div>
    <button @click="emitEvent">Emit event</button>
  </div>
</template>

<style lang="scss" scoped>
.wrapper {
  font-size: 20px;
}
</style>
```

## Composition API

The Composition API, introduced in Vue 3, is gaining popularity. For newcomers, focusing on this syntax is beneficial.

```vue
<script setup>
import { ref, reactive, defineAsyncComponent, computed, watch, onMounted } from "vue";
import useComposable from "./composables/useComposable.js";
import TheComponent from "./components/TheComponent.vue";

const AsyncComponent = defineAsyncComponent(() =>
  import("./components/AsyncComponent.vue")
);

console.log("Equivalent to created hook");

onMounted(() => {
  console.log("Mounted hook called");
});

const enabled = ref(true);
const object = reactive({ variable: false });

const props = defineProps({
  elements: Array,
  counter: {
    type: Number,
    default: 0,
  },
});

const { data, method } = useComposable();

const isEmpty = computed(() => {
  return props.counter === 0;
});

watch(props.counter, () => {
  console.log("Counter value changed");
});

const emit = defineEmits(["event-name"]);

function emitEvent() {
  emit("event-name");
}

function getParam(param) {
  return param;
}
</script>

<template>
  <div class="wrapper">
    <TheComponent />
    <AsyncComponent v-if="object.variable" />
    <div
      class="static-class-name"
      :class="{ 'dynamic-class-name': object.variable }"
    >
      Dynamic attributes example
    </div>
    <button @click="emitEvent">Emit event</button>
  </div>
</template>

<style scoped>
.wrapper {
  font-size: 20px;
}
</style>
```

## Conclusion

Choosing between the Options API and Composition API depends on personal preference and project needs. However, for new projects, the Composition API is recommended due to its modularity and flexibility.

Regardless of the choice, the main takeaway is to establish and document a consistent code style using a Single File Component as a reference. This practice ensures an easier-to-maintain codebase and better collaboration among team members.

**Ref:** [Fotis Adamakis - Medium](https://fadamakis.com/vue-3-reference-component-cf6f18252ec9)
