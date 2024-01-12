import 'package:garagi_app/domain/models/compte_model.dart';

class ClientModel {
  int? id;
  String? fullName;
  int? compteId;
  CompteModel? compte;
  ClientModel({this.id, this.fullName, this.compteId, this.compte});

  ClientModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    compteId = json['compteId'];
    compte = CompteModel.fromJson(json['compte']);
  }
  @override
  String toString() {
    // TODO: implement toString
    return 'id: $id, fullName: $fullName, compteId: $compteId, compte:' +
        compte.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['fullName'] = this.fullName;
    data['compteId'] = this.compteId;
    data['compte'] = this.compte?.toJson();
    return data;
  }
}
