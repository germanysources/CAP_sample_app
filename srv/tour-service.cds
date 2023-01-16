using { sap.capire.tours as my } from '../db/schema';
service DispositionService @(path: '/tour') @(requires:'authenticated-user') {

  entity VehicleTypes as projection on my.VehicleTypes;
  entity Vehicles as projection on my.Vehicles;
  entity TransportedGoods as projection on my.TransportedGoods;
  entity PlannedTours as projection on my.PlannedTours;

  @(restrict: [{ to: 'Dispatcher' }])
  action createVehicleType(text: String) returns {};
  @(restrict: [{ to: 'Dispatcher' }])
  action updateVehicleType(ID: UUID, text: String) returns {};
  @(restrict: [{ to: 'Dispatcher' }])
  action deleteVehicleType(ID: UUID) returns {};
  @(restrict: [{ to: 'Dispatcher' }])
  action createVehicle(ID: String, type_ID: UUID) returns {};
  @(restrict: [{ to: 'Dispatcher' }])
  action updateVehicle(ID: String, type_ID: UUID) returns {};
  @(restrict: [{ to: 'Dispatcher' }])
  action deleteVehicle(ID: String) returns {};
  @(restrict: [{ to: 'Dispatcher' }, { to: 'Driver' }])
  action createTourConfirmation(startDate: DateTime, kmStart: Decimal(10, 0), endDate: DateTime, kmEnd: Decimal(10, 0), tour_ID: UUID) returns {};
}
