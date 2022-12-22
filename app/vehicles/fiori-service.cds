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
			{Value: ID},
			{Value: type_ID}
		]
	}
});
