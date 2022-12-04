<template>
  <div class="flex">
    <div>Name</div>
    <div><input v-model="address.addressLine1" required></div>
  </div>
  <div class="flex">
    <div>Straße und Hausnr.</div>
    <div><input v-model="address.street"></div>
    <div><input v-model="address.streetNumber"></div>
  </div>
  <div class="flex">
    <div>Land, Postleitzahl und Ort</div>
    <div><input v-model="address.country" required></div>
    <div><input v-model="address.zip" required></div>
    <div><input v-model="address.city" required></div>
  </div>
</template>

<script>
export default {
  name: 'Address',
  props: {
   address: Object
  }
}
</script>
