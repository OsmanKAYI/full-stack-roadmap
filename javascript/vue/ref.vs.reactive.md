# Ref vs. Reactive - Pick one, Kill the Other

**TLDR**: Balancing `ref` and `reactive` in Vue's Composition API can be complex. Choosing one over the other could simplify development, with a leaning towards `ref` for future adoption.

Reactive data declaration is arguably the most complex part of the Composition API. Choosing between `ref` and `reactive` and handling each differently is necessary because `reactive` seamlessly works with complex types, while `ref` wraps the variable in a new object and requires `.value` to access the value.

Adding to the confusion, when using `ref` in templates, the values are automatically unwrapped, and `.value` can be omitted. However, this unwrapping [only applies to the top-level properties](https://vuejs.org/guide/essentials/reactivity-fundamentals.html#caveat-when-unwrapping-in-templates).

> Read more about [why both `ref` and `reactive` are needed](https://fadamakis.com/vue-3-why-both-ref-and-reactive-are-needed-344bb5da2593).

Another issue with `reactive` is that [reactivity is lost after a reassignment](https://vuejs.org/guide/essentials/reactivity-fundamentals.html#limitations-of-reactive).

```vue
<script setup>
import { ref, reactive } from "vue";

let response = reactive();
let loading = ref(false);

async function fetchData() {
  loading.value = true;
  response = await apiCall(); // this assignment breaks reactivity
  loading.value = false;
}

fetchData();
</script>
```

Predicting which will be widely adopted long-term is challenging, but which is the best?

## The Case for Reactive

Using `reactive` can follow the Options API paradigm by utilizing an object to hold all state.

```vue
<script setup>
import { reactive } from "vue";

const state = reactive({
  response: [],
  loading: false
});

async function fetchData() {
  state.loading = true;
  state.response = await apiCall();
  state.loading = false;
}

fetchData();
</script>
```

This approach may seem acceptable in a simplified example, but in complex real-world components, one of the most important benefits of the Composition API is lost: grouping related functionality together.

![Composition API](https://miro.medium.com/v2/resize:fit:700/0*s0wOcZKKDDKxytOr.png)

Combining this advantage with code abstraction through composables can significantly simplify components and make them more comprehensible. Grouping unrelated variables together is not a wise choice.

## The Case for Ref

Using `ref` for all purposes, with the important note that complex types require the use of the `.value` suffix to read or update a variable’s content, can also be effective.

```vue
<script setup>
import { ref } from "vue";

const response = ref([]);
const loading = ref(false);

async function fetchData() {
  loading.value = true;
  response.value = await apiCall();
  loading.value = false;
}

fetchData();
</script>
```

Adopting a single method for declaring data can significantly reduce mental overhead. While forgetting to use `.value` is sometimes unavoidable, Volar is always there to remind us.

Using `ref` is actually the recommended way to declare reactive state in the official Vue documentation.

![Ref in Vue](https://miro.medium.com/v2/resize:fit:700/1*LFijyJVpyCMtZqrJC7JC3g.png)

[Reactivity Fundamentals](https://vuejs.org/guide/essentials/reactivity-fundamentals.html)

## Conclusion

Predicting the future is never easy, but having one approach for handling variables could reduce the mental overhead, allowing more focus on delivering actual business value. Of course, the potential for some yet-to-exist experimental feature to offer better ergonomics and replace both always exists. An example of this was the [reactivity transform](https://vuejs.org/guide/extras/reactivity-transform), which ultimately led to more confusion than clarity and was therefore dropped.

The future is unpredictable, but if placing a bet, the money would be on `ref` being the only way of declaring reactive state in the near future.

**Ref:** [Fotis Adamakis - Medium](https://fadamakis.com/ref-vs-reactive-pick-one-kill-the-other-95089f942327)
