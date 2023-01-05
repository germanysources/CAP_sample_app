using { sap.capire.tours as my } from '../db/schema';
service DispositionService @(path: '/tour') @(requires:'authenticated-user') {

  entity VehicleTypes as projection on my.VehicleTypes;
  entity Vehicles as projection on my.Vehicles;
  entity TransportedGoods as projection on my.TransportedGoods;
  entity PlannedTours as projection on my.PlannedTours;

  action createVehicleType(text: String) returns {};
  action updateVehicleType(ID: UUID, text: String) returns {};
  action deleteVehicleType(ID: UUID) returns {};
  action createVehicle(ID: String, type_ID: UUID) returns {};
  action updateVehicle(ID: String, type_ID: UUID) returns {};
  action deleteVehicle(ID: String) returns {};
}
