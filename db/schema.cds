using { managed, sap } from '@sap/cds/common';
namespace sap.capire.tours;

entity VehicleTypes : managed {
  key ID : UUID;
  text : localized String(100);
}

entity Vehicles : managed {
  @mandatory
  key ID : String(20);
  @mandatory
  type: Association to VehicleTypes;
}

type Address {
  formatted: String(200);
  addressLine: String(100);
  street: String(100);
  streetNumber: String(10);
  city: String(100);
  zip: String(10);
  country: String(2);
}

entity PlannedTours : managed {
  key ID : UUID;
  vehicle: Association to Vehicles;
  startDate: DateTime;
  startAddress: Address;
  endDate: DateTime;
  targetAddress: Address;
  transportedGoods: Association to many TransportedGoods on transportedGoods.tour = $self;
}

entity TransportedGoods : managed {
  key ID: UUID;
  tour: Association to PlannedTours;
  material: String(100);
  quantity: Decimal(10,2);
  unitOfMeasure: String(3);
}
