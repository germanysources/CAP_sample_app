<template>
  <h3>Transportierte Güter</h3>
  <div class="section">
    <form @submit.prevent="addTransportedGood">
      <div>
        <table>
          <tr>
            <th>Material</th>
	    <th>Menge</th>
	    <th>Mengeneinheit</th>
	    <th></th>
	  </tr>
	  <TransportedGood
	    v-for="(good, index) in goods"
	    :index="index"
	    :transportedGood="good"
	    @changed="changeTransportedGood($event)"
	    @deleted="deleteTransportedGood($event)"
	  />
          <tr>
            <td><input v-model="newGood.material" required></td>
            <td><input v-model="newGood.quantity" step="0.01" required></td>
	    <td><input v-model="newGood.unitOfMeasure" required></td>
          </tr>
        </table>
      </div>
      <div class="center">
        <input type="submit" value="Hinzufügen">
      </div>
    </form>
  </div>
</template>

<script>
import TransportedGood from './TransportedGood.vue';

export default {
  name: 'TransportedGoodsOverview',
  components: {
    TransportedGood
  },
  props: {
    transportedGoods: Object
  },
  data: function() {
    return {
      newGood: {},
      goods: [...this.transportedGoods]
    }
  },
  methods: {
    readTransportedGoods: async function() {
      try {
        const response = await fetch(`/tour/TransportedGoods?$filter=${encodeURIComponent('tour_ID eq ')}${encodeURIComponent(tourId)}`);
	if (!response.ok)
	  throw new Error(await response.text());

	this.transportedGoods = (await response.json()).value;
      } catch(error) { console.error(error); }
    },
    addTransportedGood: function() {
      this.goods = [...this.goods, this.newGood];
      this.newGood = {};
      this.$emit("changed", this.goods);
    },
    changeTransportedGood: function(goodWrapper) {
      this.goods[goodWrapper.i] = goodWrapper.good;
    },
    deleteTransportedGood: function(goodWrapper) {
      this.goods[goodWrapper.i] = null;
      this.goods = this.goods.filter(good => good != null);
    }
  }
}
</script>
