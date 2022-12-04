<template>
  <div class="flex error" v-if="!closed">
    <div><i class="fa-solid fa-fw fa-xmark"></i></div>
    <div>{{ errorMessage }}</div>
    <div><button v-on:click="close()">OK</button></div>
  </div>
</template>

<script>
export default {
  name: 'ErrorMessage',
  props: {
   errorMessage: String
  },
  data: function() {
    return {
      closed: false
    }
  },
  methods: {
    close: function() {
      this.closed = true;
    }
  }
}
</script>
