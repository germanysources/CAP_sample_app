const cds = require('@sap/cds');

/* Name must be identical to service name in CDS-service-definition */
class DispositionService extends cds.ApplicationService {
  init(){
    const {VehicleTypes} = this.entities('sap.capire.tours');
    this.on('createVehicleType', async req => {
     
      await INSERT.into(VehicleTypes, [req.data]);
      return req.reply({});
    });
    this.on('updateVehicleType', async req => {
      await UPDATE(VehicleTypes, {ID: req.data.ID}).with(req.data);
      return req.reply({});
    });
    return super.init();
  }
}

module.exports = {DispositionService}
