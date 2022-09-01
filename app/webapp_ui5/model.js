sap.ui.define([
  "sap/ui/model/json/JSONModel",
  "sap/ui/model/odata/v4/ODataModel",
  "sap/ui/Device"
], function(JSONModel, ODataModel, Device) {
  "use strict";

  return {

    createDeviceModel: function() {
      var oModel = new JSONModel(Device);
      oModel.setDefaultBindingMode("OneWay");
      return oModel;
    },
    createODataModel: function() {
      var oModel = new ODataModel({serviceUrl: "/tour/", synchronizationMode: 'None'});
      oModel.setDefaultBindingMode("TwoWay");
      return oModel;
    }

  };
});

