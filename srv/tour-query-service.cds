using { sap.capire.tours as my } from '../db/schema';

service QueryService @(path: '/tour-query') @(requires: 'authenticated-user') {

  entity Tours as select from my.TransportedGoods {
    tour.vehicle,
    material,
    unitOfMeasure,
    sum( quantity ) as quantity: Decimal(10, 2)
  } group by tour.vehicle, material, unitOfMeasure;

}
