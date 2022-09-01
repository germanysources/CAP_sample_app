<template>
  <form @submit.prevent="login">
    <div v-if="user">
      <div v-if="user.tenant">Tenant: {{ user.tenant }}</div>
      <div>User: {{ user.id }}</div>
      <div>Locale: {{ user.locale }}</div>
    </div>
    <div v-else>
      <input type="submit" value="Login">
    </div>
  </form>
  <h1>Fahrzeugtypen</h1>
  <div class="section">
    <h3>Fahzeugtyp erstellen</h3>
    <form class="flex" @submit.prevent="createVehicleType">
      <div><input v-model="vehicleType.text"></div>
      <div><input type="submit" value="Submit"></div>
    </form>
  </div>
  <div class="section">
    <h3>Liste Fahzeugtypen</h3>
    <VehicleType
      v-for="vehicleType in vehicleTypes"
      v-bind:vehicleType="vehicleType"
    />
  </div>
</template>
<script>
import VehicleType from './components/VehicleType.vue';

export default {
  data: function() {
    return {
      user: undefined,
      vehicleType: { text: '' },
      vehicleTypes: []
    }
  },
  created: async function() {
    await this.readVehicleTypes();
  },
  methods: {
    login: async function() {
      try {
        const response = await fetch('/user/login', {
          method: 'POST'
	});
	if (!response.ok)
          throw new Error(await response.text());

	this.user = await response.json();
      } catch(error) { console.error(error); }
    },
    readVehicleTypes: async function() {
      try {
        const response = await fetch('/tour/VehicleTypes');
	if (!response.ok)
	  throw new Error(await response.text());

	this.vehicleTypes = await response.json();
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
      } catch(error) {
        console.error(error);
      }
    }
  }
}
</script>
