<template>
  <div class="flex">
    <input v-model="vehicleType.text" v-if="!editableModeActive" disabled>
    <input v-model="vehicleType.text" v-if="editableModeActive">
    <a class="icon" v-on:click="changeState()">
      <i :class="['fas', 'fa-fw', editableModeActive ? 'fa-glasses' : 'fa-pencil-alt']"></i>
    </a>
    <a class="icon" v-on:click="deleteVehicleType()">
      <i :class="['fas', 'fa-fw', 'fa-trash-alt']"></i>
    </a>
  </div>
</template>

<script>
export default {
  name: 'VehicleType',
  props: {
    vehicleType: Object
  },
  data: function() {
    return {
      editableModeActive: false
    }
  },
  methods: {
    changeState: async function() {
      if (!this.editableModeActive) {
        this.editableModeActive = true;
        return;
      }
      try {
      	const response = await fetch('/tour/updateVehicleType', {
          method: 'POST',
	  headers: {
            'Content-Type': 'application/json'
	  },
	  // request body can only contain ID and text as defined on service definition
	  body: JSON.stringify({ID: this.vehicleType.ID, text: this.vehicleType.text})
        });
        if (!response.ok) {
          throw new Error(await response.text());
	  return;
        }
        this.editableModeActive = false;
      } catch(error) {
        console.error(error);
      }
    },
    deleteVehicleType: async function() {
      try {
        const response = await fetch('/tour/deleteVehicleType', {
          method: 'POST',
	  headers: {
            'Content-Type': 'application/json'
	  },
	  body: JSON.stringify({ID: this.vehicleType.ID})
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
