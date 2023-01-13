using { managed, sap, Country } from '@sap/cds/common';
namespace sap.capire.tours;

entity VehicleTypes @(restrict: [
  { grant: 'READ' },
  { grant: 'WRITE', to: 'Dispatcher' }
]) : managed {
  key ID : UUID;
  text : localized String(100);
}

entity Vehicles @(restrict: [
  { grant: 'READ' },
  { grant: 'WRITE', to: 'Dispatcher' }
]) : managed {
  @mandatory
  key ID : String(20);
  @mandatory
  type: Association to VehicleTypes;
}

type Address {
  addressLine: String(100);
  street: String(100);
  streetNumber: String(10);
  city: String(100);
  zip: String(10);
  country: Country;
}

entity PlannedTours @(restrict: [
  { grant: 'READ' },
  { grant: 'WRITE', to: 'Dispatcher' }
]) : managed {
  key ID : UUID;
  @mandatory
  vehicle: Association to Vehicles;
  @mandatory
  startDate: DateTime;
  @mandatory
  startAddress: Address;
  @mandatory
  endDate: DateTime;
  @mandatory
  targetAddress: Address;
  transportedGoods: Composition of many TransportedGoods on transportedGoods.tour = $self;
}

entity TransportedGoods @(restrict: [
  { grant: 'READ' },
  { write: 'WRITE', to: 'Dispatcher' }
]) : managed {
  key ID: UUID;
  tour: Association to PlannedTours;
  material: String(100);
  quantity: Decimal(10,2);
  unitOfMeasure: String(3);
}
