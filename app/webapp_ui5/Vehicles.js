sap.ui.define(["sap/ui/core/mvc/XMLView"], function (XMLView) {
	"use strict";
	XMLView.create({ viewName: "tour.Vehicles" }).then(function (oView) {
		oView.placeAt("content");
	});
});

