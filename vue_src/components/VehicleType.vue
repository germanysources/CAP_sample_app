<template>
  <div class="flex">
    <input v-model="vehicleType.text" :disabled="editableModeActive">
    <a v-on:click="changeState()">
      <i :class="['fas', 'fa-fw', editableModeActive ? 'fa-glasses' : 'fa-pencil-alt']"></i>
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
      const response = await fetch('/updateVehicleType', {
        method: 'POST',
	headers: {
          'Content-Type': 'application/json'
	},
	body: JSON.stringify(this.vehicleType)
      });
      if (!response.ok) {
        console.error(await response.text());
	return;
      }
      this.editableModeActive = false;
    }
  }
}
</script>
