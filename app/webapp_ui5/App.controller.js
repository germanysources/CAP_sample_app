sap.ui.define([
  "sap/ui/core/mvc/Controller",
  "./model"
], function(Controller, models) {
  "use strict";

  return Controller.extend("tour.App", {
    onInit: function onSave(){
      var model = models.createODataModel();
      this.getView().setModel(model);
    },
    onSave: function(){
      var model = this.getView().getModel();
      var context = model.bindList("/VehicleTypes", undefined, undefined, undefined, { $$updateGroupId: "AddTemplate" }).create({
        text: this.getView().byId('text').getValue(),
      });
      context.created()
       .then(() => console.log('success'))
       .catch(() => console.error('Failed to create entity of type VehicleTypes'));
      model.submitBatch("AddTemplate");
    }
  });
});

