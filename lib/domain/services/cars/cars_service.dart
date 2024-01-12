import 'package:dartz/dartz.dart';
import 'package:garagi_app/domain/models/car_model.dart';
import 'package:garagi_app/domain/models/failure_success.dart';
import 'package:garagi_app/domain/models/form_car_model.dart';

abstract class CarsService {
  Future<Either<Failure, Success>> createVehicle(FormCarModel car);
  Future<Either<Failure, Success>> updateVehicle(FormCarModel car);
  Future<Either<Failure, Success>> deleteVehicle(
      String matricule, int clientId);
  Future<Either<Failure, CarModel>> getVehicleById(String matricule);
  Future<Either<Failure, List<CarModel>>> getVehicleByOwnerId(int ownerId);
  Future<Either<Failure, List<CarModel>>> getVehicles();
}
