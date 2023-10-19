<script>
export default {
  data() {
    return {
      text: ''
    }
  }
}
</script>

<template>
  <input v-model="text" placeholder="Type here">
  <p>{{ text }}</p>
</template>



######################################################################
######################################################################
######################################################################

<script type="module">
import { createApp } from 'vue'

createApp({
  data() {
    return {
      nameSurname: ''
    }
  },

}).mount('#app')
</script>


<template>
  <div id="app">

    <input v-model="nameSurname" placeholder="write your name">
    <p>Name Input: <b>{{ nameSurname }}</b></p>
    <p>Name Input: <b>{{ nameSurname }}</b></p>
    <p>Name Input: <b>{{ nameSurname }}</b></p>
    <p>Name Input: <b>{{ nameSurname }}</b></p>
    <p>Name Input: <b>{{ nameSurname }}</b></p>


    <button @click="nameSurname = ''">CLEAR</button>

  </div>
</template>



######################################################################
######################################################################
######################################################################

<script>
  function clear() {
    document.getElementById('name').value = ""
    document.getElementById('result1').innerHTML = ""
    document.getElementById('result2').innerHTML = ""
    document.getElementById('result3').innerHTML = ""
    document.getElementById('result4').innerHTML = ""
  }

  function change() {
  	document.getElementById('result1').innerHTML = document.getElementById('name').value  
    document.getElementById('result2').innerHTML = document.getElementById('name').value  
    document.getElementById('result3').innerHTML = document.getElementById('name').value  
    document.getElementById('result4').innerHTML = document.getElementById('name').value  
  }
</script>

<div id="app">
  
  <input id='name' value="" onKeyUp="change()" placeholder="write your name">

  <p>Name Input: <b id='result1'></b></p>
  <p>Name Input: <b id='result2'></b></p>
  <p>Name Input: <b id='result3'></b></p>
  <p>Name Input: <b id='result4'></b></p>

  <a href='#' Onclick='clear()'>CLEAR</a>

</div>
