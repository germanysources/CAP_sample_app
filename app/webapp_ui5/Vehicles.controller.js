sap.ui.define([
  "sap/ui/core/mvc/Controller",
  "./model"
], function(Controller, models) {
  "use strict";

  return Controller.extend("tour.Vehicles", {
    onInit: function onSave(){
      var model = models.createODataModel();
      this.getView().setModel(model);
    },
    onSave: function(){
      var model = this.getView().getModel();
      var context = model.bindList("/Vehicles", undefined, undefined, undefined, { $$updateGroupId: "AddTemplate1" }).create({
        ID: this.getView().byId('ID').getValue(),
	type_ID: this.getView().byId('type').getSelectedKey()
      });
      context.created()
       .then(() => {
	 console.log('success');
	 model.refresh();
       })
       .catch(error => {
	 console.error('Failed to create entity of type Vehicles');
	 console.error(error);
       });
      model.submitBatch("AddTemplate1");
    }
  });
});

