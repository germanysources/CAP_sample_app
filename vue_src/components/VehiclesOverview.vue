<template>
  <h1>Fahrzeuge</h1>
  <div class="section">
    <h3>Fahrzeug erstellen</h3>
    <div class="error" v-if="error">
      <i class="fa-solid fa-circle-exclamation"></i>
      <span>{{ error.message }}</span>
    </div>
    <form class="flex" @submit.prevent="createVehicle">
      <div>
        <input v-model="vehicle.ID" required>
      </div>
      <div>
        <select v-model="vehicle.type_ID" required>
          <option
            v-for="vehicleType in vehicleTypes"
            :value="vehicleType.ID">{{ vehicleType.text }}</option>
        </select>
      </div>
      <div><input type="submit" value="Sichern"></div>
    </form>
  </div>
  <div class="section">
    <h3>Liste Fahrzeuge</h3>
    <table>
      <tr><th>Kennzeichen</th><th>Fahrzeugtyp</th><th></th></tr>
      <Vehicle
        v-for="vehicle in vehicles"
        v-bind:vehicle="vehicle"
	@updated="readVehicles()"
        @deleted="readVehicles()"
      />
    </table>
  </div>
</template>
<script>
import Vehicle from './Vehicle.vue';

export default {
  name: 'VehiclesOverview',
  components: {
    Vehicle
  },
  data: function() {
    return {
      error: null,
      vehicle: {},
      vehicles: [],
      vehicleTypes: []
    }
  },
  created: async function() {
    await this.readVehicleTypes();
    await this.readVehicles();
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
    readVehicles: async function() {
      try {
        const response = await fetch('/tour/Vehicles?$expand=type');
	if (!response.ok)
	  throw new Error(await response.text());

	this.vehicles = (await response.json()).value;
      } catch(error) { console.error(error); }
    },
    createVehicle: async function() {
      try {
        const response = await fetch('/tour/createVehicle', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json'
          },
          body: JSON.stringify(this.vehicle)
	});
	if (!response.ok)
          throw (await response.json()).error;

        await this.readVehicles();
      } catch(error) {
        this.error = error;
      }
    }
  }
}
</script>
