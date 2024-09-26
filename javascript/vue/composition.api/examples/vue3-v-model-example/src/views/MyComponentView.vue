<template>
  <main>
    <h1>Welcome to MyComponentView</h1>
    <MyComponent v-model:items="items" v-model:stationFrom="stationFrom" v-model:stationTo="stationTo"
      v-model:user="user" />
    <b>Child items:</b> {{ items }} <br>
    <b>Child stationFrom:</b> {{ stationFrom }} <br>
    <b>Child stationTo:</b> {{ stationTo }} <br>
    <b>Child user:</b> {{ user }} <br>
  </main>
</template>

<script setup lang="ts">
import MyComponent from "@/components/myComponent.vue";
import { reactive, ref } from 'vue';

const items = [
  { 'id': '9', 'name': 'ANKARA AŞTİ', 'targets': [3, 25, 12, 19, 11] },
  { 'id': '2', 'name': 'İSTANBUL( AVRUPA )', 'targets': [6, 16, 20] },
  { 'id': '4', 'name': 'İSTANBUL( DUDULLU )', 'targets': [6, 16, 20] },
]

const stationFrom = ref('Ankara');
const stationTo = ref('Çankırı');

const user = reactive({
  name: 'Osman',
  surname: 'KAYI',
  username: 'osmankayi',
  password: '123456',
})
</script>