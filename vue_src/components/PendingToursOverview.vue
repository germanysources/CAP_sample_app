<template>
  <table v-if="view === VIEWS.TOUR">
    <tr>
      <th>Fahrzeug</th>
      <th>Abholdatum und -uhrzeit (geplant)</th>
      <th>Abholadresse</th>
      <th>Endedatum und -uhrzeit (geplant)</th>
      <th>Empfängeraddresse</th>
    </tr>
    <PendingTour
      v-for="(tour, index) in tours"
      :key="index"
      :tour="tour"
      @confirm="confirmTour($event)"
    />
  </table>
  <TourConfirmation
    :tour="tour"
    v-if="view === VIEWS.CONFIRMATION"
    @saved="resetView()"
  />
</template>

<script>
import ErrorMessage from './ErrorMessage.vue';
import PendingTour from './PendingTour.vue';
import TourConfirmation from './TourConfirmation.vue';

export default {
  name: 'PendingToursOverview',
  components: {
    ErrorMessage,
    PendingTour,
    TourConfirmation
  },
  data: function() {
    const VIEWS = {
      TOUR: 1,
      CONFIRMATION: 2
    };
    return {
      tours: [],
      tour: null,
      view: VIEWS.TOUR,
      VIEWS,
      error: null
    };
  },
  created: async function() {
    await this.readPendingTours();
  },
  methods: {
    readPendingTours: async function() {
      try {
        const response = await fetch('/conf/PendingTours');
        if (!response.ok)
          throw new Error((await response.json()).error.message);

        this.tours = (await response.json()).value;
        console.log(this.tours);
      } catch(error) {
        this.error = error;
      }
    },
    confirmTour: function(tour) {
      this.tour = tour;
      this.view = this.VIEWS.CONFIRMATION;
    },
    resetView: function() {
      this.view = this.VIEWS.TOUR;
    }
  }
};
</script>
