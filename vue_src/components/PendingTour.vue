<template>
  <tr>
    <td>{{ tour.vehicle_ID }}</td>
    <td>{{ tour.startDate.toLocaleString() }}</td>
    <td>
      <div>{{ tour.startAddress_addressLine }}</div>
      <div>{{ tour.startAddress_street }} {{ tour.startAddress_streetNumber }}</div>
      <div>{{ tour.startAddress_country }} {{ tour.startAddress_zip }} {{ tour.startAddress_city }}</div>
    </td>
    <td>{{ tour.endDate.toLocaleString() }}</td>
    <td>
      <div>{{ tour.targetAddress_addressLine }}</div>
      <div>{{ tour.targetAddress_street }} {{ tour.targetAddress_streetNumber }}</div>
      <div>{{ tour.targetAddress_country }} {{ tour.targetAddress_zip }} {{ tour.targetAddress_city }}</div>
    </td>
    <td>
      <button v-on:click="confirm()">Rückmelden</button>
    </td>
  </tr>
</template>

<script>
export default {
  name: 'PendingTour',
  props: {
    tour: Object
  },
  methods: {
    confirm: function() {
      this.$emit("confirm", this.tour);
    }
  }
};
</script>
