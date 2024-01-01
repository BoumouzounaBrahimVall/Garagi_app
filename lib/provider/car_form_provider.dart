import 'package:flutter/material.dart';

import '../domain/models/form_car_model.dart';

class CarFormProvider extends ChangeNotifier {
  FormCarModel _formCarModel = FormCarModel();

  FormCarModel get getFormCarModel => _formCarModel;

  void setMarque(String marque) {
    _formCarModel.marque = marque;
    notifyListeners();
  }

  String get getMarque => _formCarModel.marque ?? '';

  void setModele(String modele) {
    _formCarModel.modele = modele;
    notifyListeners();
  }

  String get getModele => _formCarModel.modele ?? '';

  void setAnnee(String annee) {
    _formCarModel.annee = annee;
    notifyListeners();
  }

  String get getAnnee => _formCarModel.annee ?? '';

  void setImmatriculation(String immatriculation) {
    _formCarModel.immatriculation = immatriculation;
    notifyListeners();
  }

  String get getImmatriculation => _formCarModel.immatriculation ?? '';

  void setFormCarModel(FormCarModel formCarModel) {
    _formCarModel = formCarModel;
    notifyListeners();
  }

  String get getClientId => _formCarModel.clientId ?? '';

  void setClientId(String clientId) {
    _formCarModel.clientId = clientId;
    notifyListeners();
  }

  void clear() {
    _formCarModel.clear();
    notifyListeners();
  }
}
