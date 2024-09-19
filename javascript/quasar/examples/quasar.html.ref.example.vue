<template>
  <q-card-section
    v-for="(item, index) in items"
    :key="index"
    class="q-pa-none q-pt-xs q-ma-none"
  >
    <q-btn
      :label="'tcNoRefs ' + (index + 1)"
      color="primary"
      @click="focusItem(index)"
    />
    <q-input
      v-model="items[index]"
      class="col-6 q-pa-none q-px-xs q-pb-lg my-input"
      :ref="(el) => myItems[index] = el"
      label-color="grey-6"
      filled
    >
    </q-input>
    <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Perspiciatis impedit libero rem iste quos odit.
      Pariatur
      tempore quod fuga deserunt, inventore maiores ratione cumque quasi earum veritatis, omnis doloribus. Architecto.
    </p>
  </q-card-section>
</template>

<script setup lang="ts">
import { ref, ComponentPublicInstance } from 'vue';

const items = ref([1, 2, 3])

// Function to focus on target element
const myItems = ref<(HTMLElement | null | Element | ComponentPublicInstance)[]>([]);
const focusItem = (index: number) => {
  const targetElement = myItems.value[index] as HTMLElement; // TypeScript type check for HTMLElement
  targetElement.focus();
};
</script>
