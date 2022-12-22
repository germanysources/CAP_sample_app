using { sap.capire.tours as my } from '../db/schema';

annotate my.VehicleTypes with @(
	Common.SemanticKey : [ID],
	UI : {
		Identification : [{Value : text}],
		SelectionFields : [ID, text],
		LineItem : [
			{Value : ID},
			{Value: text}
		]
	}
) {
	ID @Common: {
		SemanticObject : 'VehicleTypes',
		Text: text,
		TextArrangment: #TextOnly,
	};
};

annotate my.Vehicles with @(
	Common.SemanticKey : [ID],
	UI : {
		Identification : [{Value : ID}],
		SelectionFields : [ID, type_ID],
		LineItem : [
			{Value : ID},
			{Value: type.text}
		]
	}
) {
	ID @Common: {
		SemanticObject : 'Vehicles',
		Text: ID,
		TextArrangment: #TextOnly,
	};
	type @ValueList.entity: 'VehicleTypes';
};

annotate my.Vehicles with {
	type @title: '{i18n>VehicleType}' @Common: {
		Text: type.text,
		TextArrangement: #TextOnly
	}
}
