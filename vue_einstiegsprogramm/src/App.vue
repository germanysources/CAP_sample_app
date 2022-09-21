<template>
  <div>Bitte geben Sie Ihren Namen ein:</div>
  <div><input v-model="name"></div>
  <div v-if="name">Hallo {{ name }}</div>
</template>

<script>
export default {
  name: 'App',
  data: function() {
    return {
      name: ''
    }
  }
}
</script>
