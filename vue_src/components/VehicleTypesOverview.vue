<template>
  <h1>Fahrzeugtypen</h1>
  <div class="section">
    <h3>Fahzeugtyp erstellen</h3>
    <form class="flex" @submit.prevent="createVehicleType">
      <div><input v-model="vehicleType.text" required></div>
      <div><input type="submit" value="Sichern"></div>
    </form>
  </div>
  <div class="section">
    <h3>Liste Fahrzeugtypen</h3>
    <VehicleType
      v-for="vehicleType in vehicleTypes"
      v-bind:vehicleType="vehicleType"
      @deleted="readVehicleTypes()"
    />
  </div>
</template>
<script>
import VehicleType from './VehicleType.vue';

export default {
  name: 'VehicleTypesOverview',
  components: {
    VehicleType
  },
  data: function() {
    return {
      vehicleType: { text: '' },
      vehicleTypes: []
    }
  },
  created: async function() {
    await this.readVehicleTypes();
  },
  methods: {
    readVehicleTypes: async function() {
      try {
        const response = await fetch('/tour/VehicleTypes');
	if (!response.ok)
	  throw new Error(await response.text());

	this.vehicleTypes = (await response.json()).value;
      } catch(error) { console.error(error); }
    },
    createVehicleType: async function() {
      try {
        const response = await fetch('/tour/createVehicleType', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json'
          },
          body: JSON.stringify(this.vehicleType)
	});
	if (!response.ok)
	  throw new Error(await response.json());

	await this.readVehicleTypes();
      } catch(error) {
        console.error(error);
      }
    }
  }
}
</script>
