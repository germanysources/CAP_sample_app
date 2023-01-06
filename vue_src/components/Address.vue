<template>
  <table>
    <tr>
      <td>Name</td>
      <td><input v-model="address.addressLine" required></td>
    </tr>
    <tr>
      <td>Straße und Hausnr.</td>
      <td><input v-model="address.street"></td>
      <td><input v-model="address.streetNumber"></td>
    </tr>
    <tr>
      <td>Land, Postleitzahl und Ort</td>
      <td>
	<select v-model="address.country" required>
          <option
            v-for="country in countries"
            :value="country.code">{{ country.name }}</option>
	</select>
      </td>
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
  },
  data: function() {
    return {
      countries: []
    }
  },
  created: async function() {
    await this.readCountries();
  },
  methods: {
    readCountries: async function() {
      try{
        const response = await fetch('/tour/Countries');
	if (!response.ok)
          throw new Error();

        this.countries = (await response.json()).value;
      } catch(error) {
        this.$emit("error", error.message);
      }
    }
  }
}
</script>
