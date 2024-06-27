<template>
  <div>
    <b>Child items:</b> {{ items }}<br />
    <b>Child stationFrom:</b> {{ stationFrom }}<br />
    <b>Child stationTo:</b> {{ stationTo }}<br />
    <b>Child user:</b> {{ user }}<br />

    <hr>

    <p> <b>stationFrom Input:</b> <input v-model="stationFrom" label="From" filled /> </p>
    <p> <b>stationTo Input:</b> <input v-model="stationTo" label="To" filled /> </p>
    <p> <b>user.name Input:</b> <input v-model="user.name" label="Name" filled /> </p>
    <p> <b>user.surname Input:</b> <input v-model="user.surname" label="Surname" filled /> </p>
    <p> <b>user.username Input:</b> <input v-model="user.username" label="Username" filled /> </p>
    <p> <b>user.password Input:</b> <input v-model="user.password" label="Password" filled /> </p>

    <hr>
  </div>
</template>

<script setup lang="ts">
import { defineModel } from 'vue';

const items = defineModel('items', { type: Array, default: '' })
const stationFrom = defineModel('stationFrom', { type: String, default: '' })
const stationTo = defineModel('stationTo', { type: String, default: '' })
const user = defineModel('user', { type: Object, default: '' })
</script>
