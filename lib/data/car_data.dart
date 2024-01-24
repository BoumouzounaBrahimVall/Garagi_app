import '../domain/models/car_details_model.dart';
import '../domain/models/car_model.dart';

final List<CarModel> cars = [
  CarModel(
    carId: '2324AA12',
    carTitle: 'Toyota Hilux 2020',
  ),
  CarModel(
    carId: '2324AA13',
    carTitle: 'Toyota Hilux 2020',
    isDanger: true,
    message: "Besoin d’une vidange ",
  ),
  CarModel(
    carId: '2324AA14',
    carTitle: 'Toyota Hilux 2020',
    message: "vidange apres 100km",
  ),
  CarModel(
    carId: '2324AA15',
    carTitle: 'Toyota Hilux 2020',
  ),
  CarModel(
    carId: '2324AA16',
    carTitle: 'Toyota Hilux 2020',
  ),
  CarModel(
    carId: '2324AA17',
    carTitle: 'Toyota Hilux 2020',
  ),
  CarModel(
    carId: '2324AA18',
    carTitle: 'Toyota Hilux 2020',
  ),
  CarModel(
    carId: '2324AA19',
    carTitle: 'Toyota Hilux 2020',
  ),
  CarModel(
    carId: '2324AA110',
    carTitle: 'Toyota Hilux 2020',
  ),
  CarModel(
    carId: '2324AA111',
    carTitle: 'Toyota Hilux 2020',
  ),
];
List<Problem> problems = List<Problem>.generate(
    10,
    (index) => Problem(
          id: index,
          consultationId: 0,
          description: 'probleme $index',
        ));

List<Service> services = List<Service>.generate(
    10,
    (index) => Service(
          id: index,
          consultationId: 0,
          description: 'service $index',
        ));
List<String> categories = ["DIAGNOSTIC", "VIDANGE", "REPARATION"];
