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
}
