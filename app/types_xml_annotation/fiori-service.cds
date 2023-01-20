using {DispositionService} from '../../srv/tour-service';

annotate DispositionService.VehicleTypes with @odata.draft.enabled;

annotate DispositionService.VehicleTypes with @(UI: {
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
				Label: '{i18n>ID}'
			},
			{
				Value: text,
				Label: '{i18n>Text}'
			}
		]
	}
});
