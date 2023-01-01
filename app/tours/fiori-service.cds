using {DispositionService} from '../../srv/tour-service';

annotate DispositionService.PlannedTours with @(UI: {
	Facets: [
		{
			$Type: 'UI.ReferenceFacet',
			Label: '{i18n>Details}',
			Target: '@UI.FieldGroup#Details'
		}
	],
	FieldGroup #Details: {
		Data: [
			{Value: vehicle_ID},
			{Value: startDate},
			{Value: startAddress_addressLine},
			{Value: startAddress_street},
			{Value: startAddress_streetNumber},
			{Value: startAddress_city},
			{Value: startAddress_zip},
			{Value: startAddress_country}
		]
	}
});
