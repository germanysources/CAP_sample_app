const cds = require('@sap/cds');

/* Name must be identical to service name in CDS-service-definition */
class DispositionService extends cds.ApplicationService {
  init(){
    const {VehicleTypes, Vehicles, TourConfirmations} = this.entities('sap.capire.tours');
    this.on('createVehicleType', async req => {
     
      await INSERT.into(VehicleTypes, [req.data]);
      return req.reply({});
    });
    this.on('updateVehicleType', async req => {
      await UPDATE(VehicleTypes, {ID: req.data.ID}).with(req.data);
      return req.reply({});
    });
    this.on('deleteVehicleType', async req => {
      await DELETE(VehicleTypes, {ID: req.data.ID});
    });
    this.on('createVehicle', async req => {
      await INSERT.into(Vehicles, [req.data]);
      return req.reply({});
    });
    this.on('updateVehicle', async req => {
      await UPDATE(Vehicles, {ID: req.data.ID}).with(req.data);
    });
    this.on('deleteVehicle', async req => {
      await DELETE(Vehicles, {ID: req.data.ID});
    });
    this.on('createTourConfirmation', async req => {
      await INSERT.into(TourConfirmations, [req.data]);
      return req.reply({});
    });
    this.on('updateTourConfirmation', async req => {
      await UPDATE(TourConfirmations, {ID: req.data.ID}).with(req.data);
    });
    return super.init();
  }
}

module.exports = {DispositionService}
