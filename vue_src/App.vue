<template>
  <div class="center"><a v-on:click="showVehicleTypes()">Fahrzeugtypen</a></div>
  <div class="center"><a v-on:click="showVehicles()">Fahrzeuge</a></div>
  <div class="center"><a v-on:click="showPlannedTours()">Touren</a></div>
  <div class="center"><a v-on:click="showPendingTours()">Touren-Rückmeldung</a></div>
  <VehicleTypesOverview
    v-if="this.view === this.VIEWS.VEHICLE_TYPES"/>
  <VehiclesOverview
    v-if="this.view === this.VIEWS.VEHICLES"/>
  <PlannedTour
    v-if="this.view === this.VIEWS.PLANNED_TOURS"/>
  <PendingToursOverview
    v-if="this.view === this.VIEWS.PENDING_TOURS"/>
</template>
<script>
import VehicleTypesOverview from './components/VehicleTypesOverview.vue';
import VehiclesOverview from './components/VehiclesOverview.vue';
import PlannedTour from './components/PlannedTour.vue';
import PendingToursOverview from './components/PendingToursOverview.vue';

export default {
  name: 'App',
  components: {
    VehicleTypesOverview,
    VehiclesOverview,
    PlannedTour,
    PendingToursOverview
  },
  data: function() {
    return {
      view: 0,
      VIEWS: {
        VEHICLE_TYPES: 1,
	VEHICLES: 2,
	PLANNED_TOURS: 3,
        PENDING_TOURS: 4
      }
    };
  },
  methods: {
    showVehicleTypes: function() {
      this.view = this.VIEWS.VEHICLE_TYPES;
    },
    showVehicles: function() {
      this.view = this.VIEWS.VEHICLES;
    },
    showPlannedTours: function() {
      this.view = this.VIEWS.PLANNED_TOURS;
    },
    showPendingTours: function() {
      this.view = this.VIEWS.PENDING_TOURS;
    }
  }
}
</script>
