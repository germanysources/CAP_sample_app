<template>
  <h2>Tour erstellen</h2>
  <div class="section">
    <ErrorMessage
      v-if="error"
      :errorMessage="error.message"
    />
    <form @submit.prevent="createTour">
      <div class="flex">
        <div>Fahrzeug</div>
	<div>
          <select v-model="tour.vehicle_ID" required>
            <option
	      v-for="vehicle in vehicles"
	      :value="vehicle.ID">{{ vehicle.ID }} ({{ vehicle.type.text }})</option>
	  </select>
	</div>
      </div>
      <div class="flex">
        <div>Abholdatum und -uhrzeit</div>
	<DateTime
	  :date="tour.startDate"
	  @changed="updateDate($event)"/>
      </div>
      <h3>Abholaddresse</h3>
      <Address
        :address="startAddress"
      />
      <h3>Empfängeraddresse</h3>
      <Address
        :address="endAddress"
      />
      <TransportedGoodsOverview
        :transportedGoods="tour.transportedGoods"
        @changed="updateTransportedGoods($event)"
      />
      <div>
        <input type="submit" value="Sichern">
      </div>
    </form>
  </div>
</template>

<script>
import Address from './Address.vue';
import DateTime from './DateTime.vue';
import ErrorMessage from './ErrorMessage.vue';
import TransportedGoodsOverview from './TransportedGoodsOverview.vue';

export default {
  name: 'PlannedTour',
  /*props: {
    tourId: String
  },*/
  components: {
    Address,
    DateTime,
    ErrorMessage,
    TransportedGoodsOverview
  },
  data: function() {
    return {
      error: null,
      endAddress: {},
      startAddress: {},
      tour: {
        startDate: new Date(),
	transportedGoods: []
      },
      vehicles: []
    };
  },
  created: async function() {
    await this.readVehicles();
  },
  methods: {
    createTour: async function() {
      try {
        const response = await fetch('/tour/PlannedTours', {
	  method: 'POST',
          headers: {
            'Content-Type': 'application/json'
	  },
	  body: JSON.stringify({
	    ...this.tour,
	    startAddress_addressLine: this.startAddress.addressLine,
	    startAddress_street: this.startAddress.street,
	    startAddress_streetNumber: this.startAddress.streetNumber,
	    startAddress_zip: this.startAddress.zip,
	    startAddress_city: this.startAddress.city,
	    startAddress_country: this.startAddress.country,
	    targetAddress_addressLine: this.endAddress.addressLine,
	    targetAddress_street: this.endAddress.street,
	    targetAddress_streetNumber: this.endAddress.streetNumber,
	    targetAddress_zip: this.endAddress.zip,
	    targetAddress_city: this.endAddress.city,
	    targetAddress_country: this.endAddress.country
	  })
	});
	if (!response.ok)
	  throw new Error((await response.json()).error.message);

      } catch(error) { this.error = error; }
    },
    readVehicles: async function() {
      try {
        const response = await fetch('/tour/Vehicles?$expand=type');
        if (!response.ok)
          throw new Error((await response.json()).error.message);

        this.vehicles = (await response.json()).value;
      } catch(error) { this.error = error; }
    },
    updateDate: function(date) {
      this.tour.startDate = date;
    },
    updateTransportedGoods: function(transportedGoods) {
      this.tour.transportedGoods = transportedGoods;
    },
  }
}
</script>
