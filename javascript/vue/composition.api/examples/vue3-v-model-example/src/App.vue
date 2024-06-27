<script setup lang="ts">
import { RouterLink, RouterView } from "vue-router";
</script>

<template>
  <header>
    <nav>
      <RouterLink to="/" style="margin-right: 15px">My Component</RouterLink>
    </nav>
  </header>

  <RouterView />
</template>

<style scoped></style>
