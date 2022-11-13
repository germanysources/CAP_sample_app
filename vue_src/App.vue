<template>
  <div class="center"><a v-on:click="showVehicleTypes()">Fahrzeugtypen</a></div>
  <div class="center"><a v-on:click="showVehicles">Fahrzeuge</a></div>
  <VehicleTypesOverview
    v-if="this.view === this.VIEWS.VEHICLE_TYPES"/>
  <VehiclesOverview
    v-if="this.view === this.VIEWS.VEHICLES"/>
</template>
<script>
import VehicleTypesOverview from './components/VehicleTypesOverview.vue';
import VehiclesOverview from './components/VehiclesOverview.vue';

export default {
  name: 'App',
  components: {
    VehicleTypesOverview,
    VehiclesOverview
  },
  data: function() {
    return {
      view: 0,
      VIEWS: {
        VEHICLE_TYPES: 1,
	VEHICLES: 2
      }
    };
  },
  methods: {
    showVehicleTypes: function() {
      this.view = this.VIEWS.VEHICLE_TYPES;
    },
    showVehicles: function() {
      this.view = this.VIEWS.VEHICLES;
    }
  }
}
</script>
