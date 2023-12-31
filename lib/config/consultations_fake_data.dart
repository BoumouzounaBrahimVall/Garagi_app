import 'package:garagi_app/domain/models/consultation_model.dart';

var consultationFakeData = [
  ConsultationModel(
    consultationId: 1,
    price: "500 DH",
    date: "30-12-2023",
    mecanicianName: "AHMED SALEM",
    type: ConsultationType.diagnostic,
    services: [
      ServiceModel("KILOMETRAGE", details: '145 000 KM'),
      ServiceModel("HUILE MOTEUR", details: 'ZABALETA OIL'),
      ServiceModel("CHANGEMENT FILTRE A HUILE")
    ],
    stationName: "Ahmed Station",
  ),
  ConsultationModel(
      consultationId: 2,
      price: "1500 DH",
      date: "26-12-2023",
      mecanicianName: "AHMED SALEM",
      type: ConsultationType.vidange,
      services: [
        ServiceModel("KILOMETRAGE", details: '145 000 KM'),
        ServiceModel("HUILE MOTEUR", details: 'ZABALETA OIL'),
        ServiceModel("CHANGEMENT FILTRE A HUILE")
      ],
      stationName: "Ahmed Station",
      problems: [
        ServiceModel("BOITE VITESSE", isProblem: true),
      ]),
  ConsultationModel(
    consultationId: 3,
    price: "11 500 DH",
    date: "12-12-2023",
    mecanicianName: "AHMED SALEM",
    type: ConsultationType.reparation,
    services: [
      ServiceModel('Boite a vitesse'),
      ServiceModel("CHANGEMENT FILTRE A HUILE")
    ],
    stationName: "Ahmed Station",
  ),
];
