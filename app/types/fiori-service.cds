using {DispositionService} from '../../srv/tour-service.cds';

annotate DispositionService.VehicleType with @(UI: {
	HeaderInfo: {
		TypeName: 'Vehicle Type',
		TypeNamePlural: 'Vehicle Types',
		Description: {Value : lifetime}
	},
	Facets : [
		{
			$Type : 'UI.ReferenceFacet',
			Label : '{i18n>Details}',
			Target : '@UI.FieldGroup#Details'
		}
	],
	FieldGroup #Details : {Data : [
		{Value : text}
	]}
});

annotate DispositionService.VehicleType with { ID @Core.Computed; }
