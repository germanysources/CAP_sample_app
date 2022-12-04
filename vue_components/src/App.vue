<template>
  <div>
    <div>
      <ProgrammingLanguage
        v-bind:nameAndLevel="nameAndLevel"
	@nameChoosen="nameChoosen($event)"
	@levelChoosen="levelChoosen($event)"/>
    </div>
    <div
      v-for="event in events">{{ event }}</div>
  </div>
</template>
<script>
import ProgrammingLanguage from './components/ProgrammingLanguage.vue';

export default {
  name: 'App',
  components: {
    ProgrammingLanguage
  },
  data: function() {
    return {
      events: [],
      nameAndLevel: {name: 'ABAP', level: 'Profi'}
    };
  },
  methods: {
    nameChoosen: function(name) {
      this.events.push(`Programmiersprache ${name} gewählt`);
    },
    levelChoosen: function(level) {
      this.events.push(`Level ${level} gewählt`);
    }
  }
}
</script>
