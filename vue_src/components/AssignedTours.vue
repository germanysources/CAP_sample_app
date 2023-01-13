<template>

</template>

<script>
export default {
  methods: {
    readAssignedAndPendingTours: async function() {
      try {
        const response = await fetch(`/tour/TourConfirmations`);
	if (!response.ok)
	  
      } catch(error) {

      }
    }
  }
};
</script>
