enum ConsultationType { vidange, diagnostic, reparation }

class ServiceModel {
  final String title;
  String? details;
  bool isProblem = false;
  ServiceModel(this.title, {isProblem, details});
}

class ConsultationModel {
  final int consultationId;
  final String stationName;
  final String price;
  final String date;
  final String mecanicianName;
  final ConsultationType type;
  final List<ServiceModel> services;
  List<ServiceModel>? problems;

  ConsultationModel(
      {required this.consultationId,
      required this.price,
      required this.date,
      required this.mecanicianName,
      required this.type,
      required this.services,
      required this.stationName,
      this.problems});
}
