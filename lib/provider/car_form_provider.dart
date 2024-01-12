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
    _formCarModel.matricule = immatriculation;
    notifyListeners();
  }

  String get getImmatriculation => _formCarModel.matricule ?? '';

  void setFormCarModel(FormCarModel formCarModel) {
    _formCarModel = formCarModel;
    notifyListeners();
  }

  String get getClientId => _formCarModel.ownerId ?? '';

  void setClientId(String clientId) {
    _formCarModel.ownerId = clientId;
    notifyListeners();
  }

  void setKilometrage(int kilometrage) {
    _formCarModel.kilometrage = kilometrage;
    notifyListeners();
  }

  int get getKilometrage => _formCarModel.kilometrage ?? 0;

  void clear() {
    _formCarModel.clear();
    notifyListeners();
  }
}
