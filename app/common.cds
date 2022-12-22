using { sap.capire.tours as my } from '../db/schema';

annotate my.VehicleTypes with @(
	Common.SemanticKey : [ID],
	UI : {
		Identification : [{Value : ID}],
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
