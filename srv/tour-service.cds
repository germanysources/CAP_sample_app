using { sap.capire.tours as my } from '../db/schema';
service DispositionService @(path: '/tour') @(requires:'authenticated-user') {

  entity VehicleTypes as projection on my.VehicleTypes;
  entity Vehicles as projection on my.Vehicles;
  entity PlannedTours as projection on my.PlannedTours;
  entity TransportedGoods as select from my.TransportedGoods {
    tour,
    sum( weightInKg ) as totalWeight: Decimal(10, 2)
  } group by tour;

  action createVehicleType(text: String) returns {};
  action updateVehicleType(ID: UUID, text: String) returns {};
  action deleteVehicleType(ID: UUID) returns {};
  action createVehicle(ID: String, type_ID: UUID) returns {};
  action updateVehicle(ID: String, type_ID: UUID) returns {};
  action deleteVehicle(ID: String) returns {};

}
