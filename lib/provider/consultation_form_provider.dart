import 'package:flutter/material.dart';
import 'package:garagi_app/domain/models/consultation_model.dart';

class ConsultationFormProvider extends ChangeNotifier {
  ConsultationModel _form = ConsultationModel();
  ConsultationModel get form => _form;
  void setForm(ConsultationModel form) {
    _form = form;
    notifyListeners();
  }

  void setVehicleId(String vehicleId) {
    _form.vehicleId = vehicleId;
    notifyListeners();
  }

  void setStationId(int stationId) {
    _form.stationId = stationId;
    notifyListeners();
  }

  /*
  this.killometrageConsulte = '',
      this.repairerFullName = '',
      this.stationId = '',
      this.category = '',
      this.price = '',
      this.services,
      this.problems
       */
  void setRepairerFullName(String repairerFullName) {
    _form.repairerFullName = repairerFullName;
    notifyListeners();
  }

  void setCategroy(String category) {
    _form.category = category;
    notifyListeners();
  }

  void setPrice(String price) {
    _form.price = price;
    notifyListeners();
  }
}
