<template>
  <tr>
    <td>{{ transportedGood.material }}</td>
    <td>{{ new Intl.NumberFormat().format(transportedGood.quantity) }}</td>
    <td>{{ transportedGood.unitOfMeasure }}</td>
  </tr>
</template>

<script>
export default {
  name: 'TransportedGood',
  props: {
   transportedGood: Object
  }
}
</script>
