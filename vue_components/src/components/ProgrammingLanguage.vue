<template>
  <div>
    <div>Programmiersprache</div>
    <div>
      <select v-model="nameAndLevel.name" v-on:change="nameChoosen($event)">
        <option
          v-for="language in availableLanguages"
	  :value="language">{{ language }}</option>
      </select>
    </div>
    <div>Level</div>
    <div>
      <select v-model="nameAndLevel.level" v-on:change="levelChoosen($event)">
        <option
          v-for="level in availableLevels"
	  :value="level">{{ level }}</option>
      </select>
    </div>
  </div>
</template>
<script>
export default {
  name: 'ProgrammingLanguage',
  props: {
   nameAndLevel: Object
  },
  data: function() {
    return {
      availableLanguages: [],
      availableLevels: []
    };
  },
  created: function() {
    this.availableLanguages = this.getAvailableLanguages();
    this.availableLevels = this.getAvailableLevels();
  },
  methods: {
    getAvailableLanguages: function() {
      return [
        'ABAP',
	'Basic',
	'C',
	'Cobol',
	'C++',
	'C\#',
	'D',
	'Erlang',
	'F\#'
      ];
    },
    getAvailableLevels: function() {
      return [
        'Anfänger',
        'Fortgeschritten',
	'Profi'
      ];
    },
    nameChoosen: function(event) {
      this.$emit("nameChoosen", event.target.value);
    },
    levelChoosen: function(event) {
      this.$emit("levelChoosen", event.target.value);
    }
  }
}
</script>
