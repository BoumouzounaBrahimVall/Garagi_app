class CarDetailModel {
  int id;
  int? ownerId;
  int kilometrageActuel;
  DateTime createdAt;
  String matricule;
  String model;
  String? marque;
  bool isDanger;
  String message;
  List<Consultation> consultations;

  CarDetailModel({
    required this.id,
    this.ownerId,
    required this.kilometrageActuel,
    required this.createdAt,
    required this.matricule,
    required this.model,
    this.marque,
    this.isDanger = false,
    this.message = "",
    required this.consultations,
  });
  @override
  String toString() {
    String result =
        "id: $id, ownerId: $ownerId,kilometrageActuel: $kilometrageActuel, createdAt: $createdAt,matricule: $matricule, model: $model, marque: $marque, consultations: $consultations";
    return result;
  }

  factory CarDetailModel.fromJson(Map<String, dynamic> json) {
    return CarDetailModel(
      id: json['id'],
      ownerId: json['ownerId'],
      kilometrageActuel: json['KilometrageActuel'],
      createdAt: DateTime.parse(json['createdAt']),
      matricule: json['matricule'],
      model: json['model'],
      marque: json['marque'],
      message: json["KilometrageActuel"]?.toInt() > 100
          ? ""
          : (json["KilometrageActuel"]?.toInt() > 0
              ? "Vidange apres 100km"
              : "Besion d'une Vidange"),
      isDanger: json["KilometrageActuel"]?.toInt() < 10 ? true : false,
      consultations: List<Consultation>.from(
          json['consultations'].map((x) => Consultation.fromJson(x))),
      //  reservations: List<dynamic>.from(json['reservations']),
    );
  }
}

enum ConsultationType { vidange, diagnostic, reparation }

class Consultation {
  int id;
  DateTime date;
  int? carId;
  int? killometrageConsulte;
  String? repairerFullName;
  int stationId;
  ConsultationType category;
  double price;
  List<Service> services;
  List<Problem> problems;

  Consultation({
    required this.id,
    required this.date,
    required this.carId,
    this.killometrageConsulte,
    this.repairerFullName,
    required this.stationId,
    required this.category,
    required this.price,
    required this.services,
    required this.problems,
  });
  @override
  String toString() {
    String result =
        "id: $id, date: $date, carId: $carId, killometrageConsult: $killometrageConsulte, ";
    result =
        "$result+ repairerFullName: $repairerFullName, station: $stationId, category: $category, price: $price";
    result = "$result+ services: $services, problems: $problems";
    return result;
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

  factory Consultation.fromJson(Map<String, dynamic> json) {
    return Consultation(
      id: json['id'],
      date: DateTime.parse(json['date']),
      carId: json['carId'],
      killometrageConsulte: json['killometrageConsulte'],
      repairerFullName: json['repairerFullName'],
      stationId: json['stationId'],
      category: getCategory(json['category']),
      price: json['price'].toDouble(),
      services:
          List<Service>.from(json['services'].map((x) => Service.fromJson(x))),
      problems:
          List<Problem>.from(json['problems'].map((x) => Problem.fromJson(x))),
    );
  }
}

class Service {
  int id;
  String? title;
  String description;
  int consultationId;

  Service({
    required this.id,
    this.title = "",
    required this.description,
    required this.consultationId,
  });

  @override
  String toString() {
    String result = "id: $id, title: $title, description: $description";
    return result;
  }

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      consultationId: json['consultationId'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
    };
  }
}

class Problem {
  int id;
  String? title;
  String description;
  int consultationId;

  Problem({
    required this.id,
    this.title = "",
    required this.description,
    required this.consultationId,
  });

  @override
  String toString() {
    String result = "id: $id, title: $title, description: $description";
    return result;
  }

  factory Problem.fromJson(Map<String, dynamic> json) {
    return Problem(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      consultationId: json['consultationId'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
    };
  }
}
