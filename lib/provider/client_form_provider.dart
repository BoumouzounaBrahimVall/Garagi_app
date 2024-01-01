import 'package:flutter/material.dart';
import 'package:garagi_app/domain/models/form_client_model.dart';

class ClientFormProvider extends ChangeNotifier {
  FormClientModel _formClientModel = FormClientModel();

  FormClientModel get getFormClientModel => _formClientModel;
  void setNom(String nom) {
    _formClientModel.nom = nom;
    notifyListeners();
  }

  String get getNom => _formClientModel.nom ?? '';

  String get getPrenom => _formClientModel.prenom ?? '';

  String get getEmail => _formClientModel.email ?? '';

  String get getPhone => _formClientModel.phone ?? '';

  void setPrenom(String prenom) {
    _formClientModel.prenom = prenom;
    notifyListeners();
  }

  void setEmail(String email) {
    _formClientModel.email = email;
    notifyListeners();
  }

  void setPhone(String phone) {
    _formClientModel.phone = phone;
    notifyListeners();
  }

  void setFormClientModel(FormClientModel formClientModel) {
    _formClientModel = formClientModel;
    notifyListeners();
  }
}
