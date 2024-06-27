<script setup lang="ts">
import { useGlobalStore } from '@/stores/global'
const global = useGlobalStore()
</script>

<template>
  <main>
    <h1>Welcome to PiniaView</h1>
    <button @click="global.count++">Artır</button>
    <h3>global.counter adedi:</h3>
    {{ global.count }}
  </main>
</template>
