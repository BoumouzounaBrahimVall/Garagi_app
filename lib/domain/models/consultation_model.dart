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
  int? id;
  DateTime? date;
  int? carId;
  int? killometrageConsulte;
  String? repairerFullName;
  int? stationId;
  ConsultationType? category;
  double? price = 0;
  List<Service>? services;
  List<Problem>? problems;

  ConsultationModel({
    this.id,
    this.date,
    this.carId,
    this.killometrageConsulte,
    this.repairerFullName,
    this.stationId,
    this.category,
    this.price = 0,
    this.services,
    this.problems,
  }) {
    services = [];
    problems = [];
  }
  @override
  String toString() {
    return toJson().toString();
  }

  static ConsultationType getCategory(String category) {
    switch (category) {
      case "DIAGNOSTIC":
        return ConsultationType.diagnostic;
      case "VIDANGE":
        return ConsultationType.vidange;
      //REPARATION
      default:
        return ConsultationType.reparation;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      //  "id": id,
      //"date": DateTime.now().toIso8601String(),
      "carId": carId,
      "killometrageConsulte": 100,
      "repairerFullName": repairerFullName,
      "stationId": 1,
      "category": Consultation.getCategoryString(category!),
      "price": price,
      "services": services?.map((e) => e.toJson()).toList(),
      "problems": problems?.map((e) => e.toJson()).toList(),
    };
  }
}
