import '../methods/date_transform.dart';

class CarModel {
  final String carId;
  final String carTitle;
  String message;
  String matricule;
  String dateCreation;
  bool isDanger;

  CarModel({
    required this.carId,
    required this.carTitle,
    this.isDanger = false,
    this.message = '',
    this.dateCreation = '',
    this.matricule = '',
  });
  factory CarModel.fromJson(Map<String, dynamic> json) => CarModel(
      carId: json["id"].toString(),
      carTitle: json["model"].toString(),
      matricule: json["matricule"].toString(),
      dateCreation: formatDateToString(json["createdAt"].toString()),
      message: json["KilometrageActuel"]?.toInt() > 100
          ? ""
          : json["KilometrageActuel"]?.toInt() > 0
              ? "Reste 100km"
              : "Besion d'une Vidange",
      isDanger: json["KilometrageActuel"]?.toInt() < 10 ? true : false);

  @override
  String toString() {
    return "id: $carId model: $carTitle matricule: $matricule";
  }
}
