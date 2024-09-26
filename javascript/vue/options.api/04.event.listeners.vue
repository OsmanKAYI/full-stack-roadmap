<script>
export default {
  data() {
    return {
      count: 0
    }
  },
  methods: {
    increment() {
      this.count++
    }
  }
}
</script>

<template>
  <button @click="increment">count is: {{ count }}</button>
</template>



######################################################################
######################################################################
######################################################################

<script type="module">
import { createApp } from 'vue'

createApp({
  data() {
    return {
      count: 100,
      isim: 'Osman'
    }
  },
  methods: {
      INCREMENT(val=0){
      var count = 45
      this.count = this.count + count + val
        }
  }

}).mount('#app')
  
</script>


<template>
  <div id="app">

    <!-- make this button work -->
    <button @click="INCREMENT(10)">count is: {{ count }}</button>
    <h1> {{ count }} </h1>
    <h2> {{ count }} </h2>

  </div>
</template>
