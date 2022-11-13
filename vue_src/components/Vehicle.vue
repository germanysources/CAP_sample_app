<template>
  <tr>
    <td>{{ vehicle.ID }}</td>
    <td>
      <select v-model="vehicle.type_ID" v-if="editableModeActive">
        <option
          v-for="vehicleType in vehicleTypes"
	  :value="vehicleType.ID">{{ vehicleType.text }}</option>
      </select>
      <div v-if="!editableModeActive">{{ vehicle.type.text }}</div>
    </td>
    <td>
      <a class="icon" v-on:click="changeState()">
        <i :class="['fas', 'fa-fw', editableModeActive ? 'fa-glasses' : 'fa-pencil-alt']"></i>
      </a>
    </td>
    <td>
      <a class="icon" v-on:click="deleteVehicle()">
        <i :class="['fas', 'fa-fw', 'fa-trash-alt']"></i>
      </a>
    </td>
  </tr>
</template>

<script>
export default {
  name: 'Vehicle',
  props: {
    vehicle: Object
  },
  data: function() {
    return {
      editableModeActive: false,
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
      } catch(error) {
        console.error(error);
      }
    },
    changeState: async function() {
      if (!this.editableModeActive) {
        this.editableModeActive = true;
        return;
      }
      try {
      	const response = await fetch('/tour/updateVehicle', {
          method: 'POST',
	  headers: {
            'Content-Type': 'application/json'
	  },
	  // request body can only contain ID and text as defined on service definition
	  body: JSON.stringify({ID: this.vehicle.ID, type_ID: this.vehicle.type_ID})
        });
        if (!response.ok) {
          throw new Error(await response.text());
        }
        this.editableModeActive = false;
	this.$emit("deleted", this.vehicleType);
      } catch(error) {
        console.error(error);
      }
    },
    deleteVehicle: async function() {
      try {
        const response = await fetch('/tour/deleteVehicle', {
          method: 'POST',
	  headers: {
            'Content-Type': 'application/json'
	  },
	  body: JSON.stringify({ID: this.vehicle.ID})
        });
        if (!response.ok) {
          throw new Error(await response.text());
        }
        this.$emit("deleted", this.vehicleType);
      } catch(error) {
        console.error(error);
      }
    }
  }
}
</script>
