using {DispositionService} from '../../srv/tour-service';

annotate DispositionService.PlannedTours with @odata.draft.enabled;

annotate DispositionService.PlannedTours with @(UI: {
	Facets: [
		{
			$Type: 'UI.ReferenceFacet',
			Label: '{i18n>Details}',
			Target: '@UI.FieldGroup#Details'
		},
		{
			$Type: 'UI.ReferenceFacet',
			Label: '{i18n>StartAddress}',
			Target: '@UI.FieldGroup#StartAddress'
		},
		{
			$Type: 'UI.ReferenceFacet',
			Label: '{i18n>EndAddress}',
			Target: '@UI.FieldGroup#EndAddress'
		},
		{
			$Type: 'UI.ReferenceFacet',
			Label: '{i18n>TransportedGoods}',
			Target: 'transportedGoods/@UI.LineItem'
		}
	],
	FieldGroup #Details: {
		Data: [
			{
				Value: vehicle_ID,
				Label: '{i18n>Vehicle_ID}'
			},
			{
				Value: startDate,
				Label: '{i18n>StartDate}'
			},
			{
				Value: endDate,
				Label: '{i18n>EndDate}'
			}
		]
	},
	FieldGroup #StartAddress: {
		Data: [
			{
				Value: startAddress_addressLine,
				Label: '{i18n>AddressLine}'
			},
			{
				Value: startAddress_street,
				Label: '{i18n>Street}'
			},
			{
				Value: startAddress_streetNumber,
				Label: '{i18n>StreetNumber}'
			},
			{
				Value: startAddress_city,
				Label: '{i18n>City}'
			},
			{
				Value: startAddress_zip,
				Label: '{i18n>Zip}'
			},
			{
				Value: startAddress_country,
				Label: '{i18n>Country}'
			}
		]
	},
	FieldGroup #EndAddress: {
		Data: [
			{
				Value: targetAddress_addressLine,
				Label: '{i18n>AddressLine}'
			},
			{
				Value: targetAddress_street,
				Label: '{i18n>Street}'
			},
			{
				Value: targetAddress_streetNumber,
				Label: '{i18n>StreetNumber}'
			},
			{
				Value: targetAddress_city,
				Label: '{i18n>City}'
                        },
			{
				Value: targetAddress_zip,
				Label: '{i18n>Zip}'
			},
			{
				Value: targetAddress_country,
				Label: '{i18n>Country}'
			}
		]
	}
}) {

};

annotate DispositionService.TransportedGoods with @(
	UI: {
		LineItem: [
			{
				Value: material,
				Label: '{i18n>Material}'
			},
			{
				Value: quantity,
				Label: '{i18n>Quantity}'
			},
			{
				Value: unitOfMeasure,
				Label: '{i18n>UnitOfMeasure}'
			}
		],
		Identification: [
			{Value: material},
			{Value: quantity},
			{Value: unitOfMeasure}
		],
		Facets: [
			{
				$Type: 'UI.ReferenceFacet',
				Label: '{i18n>TransportedGoods}',
				Target: '@UI.Identification'
			}
		]
	}
) {

};
