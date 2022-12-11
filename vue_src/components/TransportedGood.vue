<template>
  <tr v-if="!editableModeActive">
    <td>{{ good.material }}</td>
    <td>{{ new Intl.NumberFormat().format(good.quantity) }}</td>
    <td>{{ good.unitOfMeasure }}</td>
    <td>
      <a class="icon" v-on:click="changeState()">
        <i class="fas fa-fw fa-pencil-alt"></i>
      </a>
    </td>
    <td>
      <a class="icon" v-on:click="deleteTransportedGood()">
        <i class="fas fa-fw fa-trash-alt"></i>
      </a>
    </td>
  </tr>
  <tr v-if="editableModeActive">
    <td><input v-model="good.material"></td>
    <td><input v-model="good.quantity" type="number"></td>
    <td><input v-model="good.unitOfMeasure"></td>
    <td>
      <a class="icon" v-on:click="changeState()">
        <i class="fas fa-fw fa-glasses"></i>
      </a>
    </td>
    <td>
      <a class="icon" v-on:click="deleteTransportedGood()">
        <i class="fas fa-fw fa-trash-alt"></i>
      </a>
    </td>
  </tr>
</template>

<script>
export default {
  name: 'TransportedGood',
  props: {
   transportedGood: Object,
   index: Number
  },
  data: function() {
    return {
      editableModeActive: false,
      good: {...this.transportedGood}
    };
  },
  methods: {
    changeState: function() {
      if (!this.editableModeActive) {
        this.editableModeActive = true;
        return;
      }

      this.$emit("changed", {good: this.good, i: this.index});
      this.editableModeActive = false;
    },
    deleteTransportedGood: function() {
      this.$emit("deleted", {good: this.good, i: this.index});
    }
  }
}
</script>
