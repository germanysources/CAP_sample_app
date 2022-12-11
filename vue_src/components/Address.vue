<template>
  <table>
    <tr>
      <td>Name</td>
      <td><input v-model="address.addressLine1" required></td>
    </tr>
    <tr>
      <td>Straße und Hausnr.</td>
      <td><input v-model="address.street"></td>
      <td><input v-model="address.streetNumber"></td>
    </tr>
    <tr>
      <td>Land, Postleitzahl und Ort</td>
      <td><input v-model="address.country" required></td>
      <td><input v-model="address.zip" required></td>
      <td><input v-model="address.city" required></td>
    </tr>
  </table>
</template>

<script>
export default {
  name: 'Address',
  props: {
   address: Object
  }
}
</script>
