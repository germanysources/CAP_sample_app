using { sap.capire.tours as my } from '../db/schema';
service ConfirmationService @(path: '/conf') @(requires:'authenticated-user') {

  entity PendingTours as select from my.PlannedTours {
    *
  } where confirmation.endDate is null;

}
