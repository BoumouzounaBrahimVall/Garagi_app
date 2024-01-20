/*vehicle?.id,
    killometrageConsulte,
    repairerFullName,
    stationId,
    category,
    price,
    services,
    problems*/
/*
{
  "matricule": "1234AA12",    
  "killometrageConsulte" :123345.0,
  "repairerFullName": "Ahmed Salem", 
  "stationId": 1,  
  "category": "DIAGNOSTIC",      
  "price": 500,
  "services": [
	{
		"title": "KILOMETRAGE",     
		"description":"145 000 KM"
	},
	{
		"title": "HUILE MOTEUR",     
		"description":"ZABALETA OIL"
	}
	      ],
  "problems": [
	{
		"description":"BOITE VITESSE"
	},
	{
		"title": "SELECTEUR",     
		"description":"INACTIVE"
	}
	      ]

}
*/
import 'dart:developer';

import 'package:garagi_app/domain/models/car_details_model.dart';

class ConsultationModel {
  ConsultationModel(
      {this.id = '',
      this.vehicleId = '',
      this.killometrageConsulte = '',
      this.repairerFullName = '',
      this.stationId = 1,
      this.category = '',
      this.price = '',
      this.services,
      this.problems});
  String? id;
  String? vehicleId;
  String? killometrageConsulte;
  String? repairerFullName;
  int? stationId;
  String? category;
  String? price;
  List<Service>? services;
  List<Problem>? problems;

  bool isValidated() {
    return killometrageConsulte != '' &&
        repairerFullName != '' &&
        stationId != '' &&
        category != '' &&
        price != '' &&
        services!.isNotEmpty &&
        problems!.isNotEmpty;
  }

  factory ConsultationModel.fromJson(Map<String, dynamic> json) {
    List<Service> services = [];
    List<Problem> problems = [];
    json['services'].forEach((element) {
      services.add(Service.fromJson(element));
    });
    json['problems'].forEach((element) {
      problems.add(Problem.fromJson(element));
    });
    return ConsultationModel(
      id: json['id'],
      vehicleId: json['vehicleId'],
      killometrageConsulte: json['killometrageConsulte'],
      repairerFullName: json['repairerFullName'],
      stationId: json['stationId'],
      category: json['category'],
      price: json['price'],
      services: services,
      problems: problems,
    );
  }
  void addProblem(Problem problem) {
    problems!.add(problem);
  }

  void addService(Service service) {
    services!.add(service);
  }

  void clear() {
    id = '';
    vehicleId = '';
    killometrageConsulte = '';
    repairerFullName = '';
    stationId = 1;
    category = '';
    price = '';
    services = [];
    problems = [];
  }

  @override
  String toString() =>
      'ConsultationModel(id: $id, vehicleId: $vehicleId, killometrageConsulte: $killometrageConsulte, repairerFullName: $repairerFullName, stationId: $stationId, category: $category, price: $price, services: $services, problems: $problems)';
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'vehicleId': vehicleId,
      'killometrageConsulte': killometrageConsulte,
      'repairerFullName': repairerFullName,
      'stationId': stationId,
      'category': category,
      'price': price,
      'services': services,
      'problems': problems,
    };
  }
}
