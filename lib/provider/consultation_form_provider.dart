import 'package:flutter/material.dart';
import 'package:garagi_app/data/car_data.dart';
import 'package:garagi_app/domain/models/consultation_model.dart';

import '../domain/models/car_details_model.dart';

class ConsultationFormProvider extends ChangeNotifier {
  ConsultationModel _form = ConsultationModel();
  ConsultationModel get form => _form;
  void setForm(ConsultationModel form) {
    _form = form;
    notifyListeners();
  }

  void setCarId(int vehicleId) {
    _form.carId = vehicleId;
    notifyListeners();
  }

  void setRepairerFullName(String repairerFullName) {
    _form.repairerFullName = repairerFullName;
    notifyListeners();
  }

  addProblem(int id) {
    debugPrint("add problem $id");
    if (_form.problems!.where((element) => element.id == id).isEmpty) {
      Problem? problem = problems.where((element) => element.id == id).first;
      debugPrint(" problem $problem");
      _form.problems!.add(problem);
      notifyListeners();
    }
  }

  removeProblem(int id) {
    debugPrint("remove problem $id");
    Problem? problem = problems.where((element) => element.id == id).first;
    _form.problems!.remove(problem);
    notifyListeners();
  }

  addService(int id) {
    if (_form.services!.where((element) => element.id == id).isEmpty) {
      Service? service = services.where((element) => element.id == id).first;
      _form.services!.add(service);
      notifyListeners();
    }
  }

  removeService(int id) {
    Service? service = services.where((element) => element.id == id).first;

    _form.services!.remove(service);
    notifyListeners();
  }

  void setGategory(String category) {
    _form.category = ConsultationModel.getCategory(category);
    notifyListeners();
  }

  void setPrice(double price) {
    _form.price = price;
    notifyListeners();
  }
}
