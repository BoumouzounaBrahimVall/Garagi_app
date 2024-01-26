import 'package:flutter/material.dart';
import 'package:garagi_app/domain/models/client_model.dart';
import 'package:garagi_app/domain/models/form_car_model.dart';
import 'package:garagi_app/domain/services/cars/cars_service.dart';
import 'package:garagi_app/domain/services/cars/http_cars_service.dart';
import 'package:garagi_app/domain/services/client/client_service.dart';
import 'package:garagi_app/domain/services/client/http_client_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../domain/models/car_model.dart';

class CarServiceProvider extends ChangeNotifier {
  final CarsService _carsService = HttpCarsService();
  final ClientService _clientsService = HttpClientService();
  bool isLoading = false;
  String messageStatus = '';

  List<CarModel> _cars = [];
  List<ClientModel> _clients = [];
  List<CarModel> get cars => _cars;

  List<ClientModel> get clients => _clients;

  Future<void> fetchVehicles() async {
    final prefs = await SharedPreferences.getInstance();
    // get id of authentidated user from shared preferences
    final result = await _carsService.getVehicles();
    result.fold((l) => messageStatus = l.message, (r) => _cars = r);

    notifyListeners();
  }

  Future<List<CarModel>> fetchClientVehicles(int clientId) async {
    var result = await _carsService.getVehicleByOwnerId(clientId);
    List<CarModel> myCars = [];
    result.fold((l) => messageStatus = l.message, (r) => myCars = r);
    return myCars;
  }

  Future<void> saveCar(FormCarModel car) async {
    final result = await _carsService.createVehicle(car);
    result.fold(
        (l) => messageStatus = l.message, (r) => messageStatus = r.message);
    notifyListeners();
  }

  Future<void> filterCars(String substring) async {
    final result = await _carsService.getVehiclesBySubString(substring);
    result.fold((l) => messageStatus = l.message, (r) => _cars = r);
    notifyListeners();
  }

  Future<void> fetchClients() async {
    final result = await _clientsService.getClientList();
    result.fold((l) => messageStatus = l.message, (r) => _clients = r);
    isLoading = false;
    debugPrint('loading ' + isLoading.toString());
    notifyListeners();
  }

  Future<void> getFakeClients() async {
    isLoading = true;
    Future.delayed(Duration(seconds: 5)).then((value) {
      _clients = [
        ClientModel(fullName: 'Brhim Vall Bmz', id: 2),
        ClientModel(fullName: 'Hamza EL Idrissi', id: 6),
      ];
      isLoading = false;
      debugPrint('loading ' + isLoading.toString());
      notifyListeners();
    });
  }

  Future<void> getFakeCars() async {
    isLoading = true;
    // timer of 10 seconds
    Future.delayed(Duration(seconds: 10)).then((value) {
      _cars = [
        CarModel(
          carId: 1.toString(),
          carTitle: 'Corolla XC',
          matricule: '1234DJFV',
          dateCreation: '2021-05-12',
        ),
        CarModel(
          carId: 2.toString(),
          carTitle: 'Audi RS3',
          matricule: 'CSSKNCS784',
          dateCreation: '2023-05-12',
        ),
        CarModel(
          carId: 3.toString(),
          carTitle: 'BMW X5',
          matricule: 'CSSKNCS784',
          dateCreation: '2023-05-12',
        ),
        CarModel(
          carId: 4.toString(),
          carTitle: 'Mercedes Benz',
          matricule: 'CSSKNCS784',
          dateCreation: '2023-05-12',
        ),
        CarModel(
          carId: 5.toString(),
          carTitle: 'Toyota',
          matricule: 'CSSKNCS784',
          dateCreation: '2023-05-12',
        ),
        CarModel(
          carId: 6.toString(),
          carTitle: 'Corolla XC',
          matricule: '1234DJFV',
          dateCreation: '2021-05-12',
        ),
        CarModel(
          carId: 7.toString(),
          carTitle: 'Audi RS3',
          matricule: 'CSSKNCS784',
          dateCreation: '2023-05-12',
        ),
        CarModel(
          carId: 8.toString(),
          carTitle: 'BMW X5',
          matricule: 'CSSKNCS784',
          dateCreation: '2023-05-12',
        ),
      ];
    });
    isLoading = false;

    notifyListeners();
  }

  Future<void> deleteCar(String matricule, int clientId) async {
    final result = await _carsService.deleteVehicle(matricule, clientId);
    result.fold(
        (l) => messageStatus = l.message, (r) => messageStatus = r.message);
    notifyListeners();
  }

  Future<void> updateCar(FormCarModel car) async {
    final result = await _carsService.updateVehicle(car);
    result.fold(
        (l) => messageStatus = l.message, (r) => messageStatus = r.message);
    notifyListeners();
  }
}
