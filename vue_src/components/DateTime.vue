<template>
  <div>
    <input v-model="sdate" :required="required" type="date">
    <input v-model="stime" :required="required" type="time">
  </div>
</template>

<script>
export default {
  name: 'DateTime',
  props: {
    date: Date
  },
  data: function() {
    return {
      sdate: this.date instanceof Date ? this.date.toISOString().split('T')[0] : '',
      stime: this.date instanceof Date ? this.date.toISOString().split('T')[1].split('.')[0] : ''
    }
  },
  watch: {
    sdate: function(newValue, oldValue) {
      this.$emit("changed", new Date(`${newValue}T${this.stime}`));
    },
    stime: function(newValue, oldValue) {
      this.$emit("changed", new Date(`${this.sdate}T${newValue}`));
    }
  }
}
</script>
