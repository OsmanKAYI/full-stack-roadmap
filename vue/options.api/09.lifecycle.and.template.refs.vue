<script>
export default {
  mounted() {
    this.$refs.p.textContent = 'mounted!'
  }
}
</script>

<template>
  <p ref="p">hello</p>
</template>
