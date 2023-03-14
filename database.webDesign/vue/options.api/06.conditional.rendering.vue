<script>
export default {
  data() {
    return {
      awesome: true
    }
  },
  methods: {
    toggle() {
      this.awesome = !this.awesome
    }
  }
}
</script>

<template>
  <button @click="toggle">toggle</button>
  <h1 v-if="awesome">Vue is awesome!</h1>
  <h1 v-else>Oh no 😢</h1>
</template>



######################################################################
######################################################################
######################################################################

<script type="module">
import { createApp } from 'vue'

createApp({
  data() {
    return {
      grade: 77,
      gradeNew: 100
    }
  },
  methods: {
    toggle() {
      // ...
    }
  }
}).mount('#app')
</script>


<template>
  <div id="app">

    <h1 v-if="grade >= 45">Pass</h1>
    <h1 v-if="grade < 45">Failed...</h1>
    <button @click='gradeNew = !gradeNew'>
      Register
    </button>

    <div v-if="gradeNew">
      <h1>Fill the form to register:</h1>
      NAME: <input type='text' name='name'>
      email: <input type='text' name='mail'>
    </div>

  </div>
</template>
