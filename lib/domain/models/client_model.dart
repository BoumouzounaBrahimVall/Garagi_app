import 'package:garagi_app/domain/models/compte_model.dart';

import '../methods/date_transform.dart';

class ClientModel {
  int? id;
  String? fullName;
  int? compteId;
  CompteModel? compte;
  String? dateCreated;
  ClientModel({this.id, this.fullName, this.compteId, this.compte});

  ClientModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    compteId = json['compteId'];
    dateCreated = formatDateToString(json['createdAt']);

    compte = CompteModel.fromJson(json['compte']);
  }
  @override
  String toString() {
    // TODO: implement toString
    return 'toJson: ${toJson()}  ';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();

    data['email'] = compte?.email;
    data['password'] = '12345678';
    data['role'] = 0;
    data['phoneNumber'] = compte?.phoneNumber;
    data['fullname'] = fullName;
    return data;
  }
}
