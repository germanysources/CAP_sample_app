using {DispositionService} from '../../srv/tour-service';

annotate DispositionService.Vehicles with @odata.draft.enabled;

annotate DispositionService.Vehicles with @(UI: {
	Facets: [
		{
			$Type: 'UI.ReferenceFacet',
			Label: '{i18n>Details}',
			Target: '@UI.FieldGroup#Details'
		}
	],
	FieldGroup #Details: {
		Data: [
			{
				Value: ID,
				Label: '{i18n>VehicleID}'
			},
			{
				Value: type_ID,
				Label: '{i18n>VehicleType_ID}'
			}
		]
	}
});
