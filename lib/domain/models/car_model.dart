class CarModel {
  final String carId;
  final String carTitle;
  String message;
  bool isDanger;

  CarModel({
    required this.carId,
    required this.carTitle,
    this.isDanger = false,
    this.message = '',
  });
}
