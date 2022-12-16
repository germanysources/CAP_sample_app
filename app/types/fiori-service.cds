using {DispositionService} from '../../srv/tour-service.cds';

annotate DispositionService.VehicleType with @(UI: {
	SelectionFields: {
		text
	},
	LineItem: [
		{
			Value: ID,
			Label: '{i18n>ID}'
		},
		{
			Value: text,
			Label: '{i18n>Text}'
		}
	]
});
