<script setup>
// REF: https://github.com/loonywizard/js-confetti
import JSConfetti from 'js-confetti'

const confetti = new JSConfetti()

function showConfetti() {
  confetti.addConfetti({
    confettiNumber: 50,
    emojiSize: 20,
    emojis: ['A']
  })
}

showConfetti()
</script>

<template>
  <h1 @click="showConfetti">🎉 Congratulations!</h1>
</template>

<style>
h1 {
  text-align: center;
  cursor: pointer;
  margin-top: 3em;
}
</style>