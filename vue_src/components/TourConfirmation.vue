<template>
  <ErrorMessage
    v-if="error"
    :errorMessage="error.message"
  />
  <form @submit.prevent="save">
    <table>
      <tr>
        <td>Startdatum und -uhrzeit (IST)</td>
        <td>
          <DateTime
             :date="confirmation.startDate"
             @changed="updateStartDate($event)"/>
        </td>
      </tr>
      <tr>
        <td>km-Stand Start</td>
        <td><input v-model="confirmation.kmStart" type="number" inputmode="numeric"></td>
      </tr>
      <tr>
        <td>Enddatum und -uhrzeit (IST)</td>
        <td>
          <DateTime
             :date="confirmation.endDate"
             @changed="updateEndDate($event)"/>
        </td>
      </tr>
      <tr>
        <td>km-Stand Ende</td>
        <td><input v-model="confirmation.kmEnd" type="number" inputmode="numeric"></td>
      </tr>
    </table>
    <input type="submit" value="Sichern">
  </form>
</template>

<script>
import DateTime from './DateTime.vue';
import ErrorMessage from './ErrorMessage.vue';

export default {
  name: 'TourConfirmation',
  components: {
    DateTime,
    ErrorMessage
  },
  props: {
    tour: Object
  },
  data: function () {
    return {
      confirmation: {
        startDate: null,
        endDate: null,
        kmStart: 0,
        kmEnd: 0,
        tour_ID: this.tour.ID
      },
      error: null
    };
  },
  created: async function() {
    await this.readConfirmation();
  },
  methods: {
    readConfirmation: async function() {
      try {
        const filter = `tour_ID eq ${this.tour.ID}`;
        const response = await fetch(`/conf/TourConfirmations?$filter=${encodeURIComponent(filter)}`);
        if (!response.ok)
          throw new Error((await response.json()).error.message);

        const confirmations = (await response.json()).value;
        if (Array.isArray(confirmations) && confirmations.length > 0)
          this.confirmation = confirmations[0];
      } catch(error) {
        this.error = error;
      } 
    },
    save: async function() {
      if (this.confirmation.ID)
        await this.updateConfirmation();
      else
        await this.createConfirmation();
    },
    createConfirmation: async function() {
      try {
        // use action as direct inserted entity is not active, when `@odata.draft.enabled = true`
        const response = await fetch('/tour/createTourConfirmation', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json'
          },
          body: JSON.stringify(this.confirmation)
        });
        if (!response.ok)
          throw new Error((await response.json()).error.message);

        this.$emit("saved");
      } catch(error) {
        this.error = error;
      }
    },
    updateConfirmation: async function() {
      try {
        const response = await fetch('/tour/updateTourConfirmation', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json'
          },
          body: JSON.stringify({
	    ID: this.confirmation.ID,
	    startDate: this.confirmation.startDate,
	    kmStart: this.confirmation.kmStart,
	    endDate: this.confirmation.endDate,
	    kmEnd: this.confirmation.kmEnd
	  })
        });
        if (!response.ok)
          throw new Error((await response.json()).error.message);

        this.$emit("saved");
      } catch(error) {
        this.error = error;
      }
    },
    updateStartDate: function(date) {
      this.confirmation.startDate = date;
    },
    updateEndDate: function(date) {
      this.confirmation.endDate = date;
    },
  }
};
</script>
