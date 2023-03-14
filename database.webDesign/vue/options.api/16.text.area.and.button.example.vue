<script setup>
import { ref } from 'vue'

const name = ref('')

</script>


<template>
  <input v-model="name">

  <h1>Name: {{ name }}</h1>

  <button @click="name = ''">DELETE</button>
</template>
