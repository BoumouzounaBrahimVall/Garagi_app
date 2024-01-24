import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:garagi_app/domain/models/car_model.dart';
import 'package:garagi_app/domain/models/failure_success.dart';
import 'package:garagi_app/domain/models/form_car_model.dart';
import 'package:garagi_app/domain/services/cars/cars_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../config/constants.dart';

class HttpCarsService implements CarsService {
  final Dio _dio = Dio();
  @override
  Future<Either<Failure, Success>> createVehicle(FormCarModel car) async {
    String baseUrl = '${AppConstants.backendUrl}/cars/create';
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      debugPrint(car.toString());
      final response = await _dio.post(
        baseUrl,
        data: car.toJson(),
        options: Options(headers: {
          'authorization': 'Bearer $token',
        }),
      );

      return Right(Success("request successfully proccessed"));
    } on DioException catch (e) {
      debugPrint(e.toString());
      return Left(Failure("request failed"));
    }
  }

  @override
  Future<Either<Failure, Success>> deleteVehicle(
      String matricule, int clientId) async {
    String baseUrl =
        '${AppConstants.backendUrl}/cars/delete/$matricule/$clientId';
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      debugPrint(matricule);
      final response = await _dio.delete(
        baseUrl,
        options: Options(headers: {
          'authorization': 'Bearer $token',
        }),
      );

      return Right(Success(response.data['message']));
    } on DioException catch (e) {
      debugPrint(e.toString());
      return Left(Failure(e.response?.data['message']));
    }
  }

  @override
  Future<Either<Failure, CarModel>> getVehicleById(String matricule) async {
    String baseUrl = '${AppConstants.backendUrl}/cars/matricule/$matricule';
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      debugPrint(matricule);
      final response = await _dio.get(
        baseUrl,
        options: Options(headers: {
          'authorization': 'Bearer $token',
        }),
      );
      CarModel car = CarModel.fromJson(response.data['data']);
      return Right(car);
    } on DioException catch (e) {
      debugPrint(e.toString());
      return Left(Failure(e.response?.data['message']));
    }
  }

  @override
  Future<Either<Failure, Success>> updateVehicle(FormCarModel car) async {
    String baseUrl = '${AppConstants.backendUrl}/cars/update';
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      debugPrint(car.toString());
      final response = await _dio.put(
        baseUrl,
        data: car.toJson(),
        options: Options(headers: {
          'authorization': 'Bearer $token',
        }),
      );
      return Right(Success(response.data['message']));
    } on DioException catch (e) {
      debugPrint(e.toString());
      return Left(Failure(e.response?.data['message']));
    }
  }

  @override
  Future<Either<Failure, List<CarModel>>> getVehicleByOwnerId(
      int ownerId) async {
    String baseUrl = '${AppConstants.backendUrl}/cars/$ownerId';
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      debugPrint(ownerId.toString());
      final response = await _dio.get(
        baseUrl,
        options: Options(headers: {
          'authorization': 'Bearer $token',
        }),
      );
      List<CarModel> cars = [];
      for (var car in response.data['data']) {
        cars.add(CarModel.fromJson(car));
      }
      return Right(cars);
    } on DioException catch (e) {
      debugPrint(e.toString());
      return Left(Failure(e.response?.data['message']));
    }
  }

  @override
  Future<Either<Failure, List<CarModel>>> getVehicles() async {
    String baseUrl = '${AppConstants.backendUrl}/cars/';
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final response = await _dio.get(
        baseUrl,
        options: Options(headers: {
          'authorization': 'Bearer $token',
        }),
      );
      List<CarModel> cars = [];
      for (var car in response.data) {
        cars.add(CarModel.fromJson(car));
      }
      return Right(cars);
    } on DioException catch (e) {
      debugPrint(e.toString());
      return Left(Failure(e.response?.data['message']));
    }
  }

  @override
  Future<Either<Failure, List<CarModel>>> getVehiclesBySubString(
      String substring) async {
    String baseUrl = '${AppConstants.backendUrl}/cars/substring/$substring';
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final response = await _dio.get(
        baseUrl,
        options: Options(headers: {
          'authorization': 'Bearer $token',
        }),
      );
      List<CarModel> cars = [];
      for (var car in response.data) {
        cars.add(CarModel.fromJson(car));
      }
      return Right(cars);
    } on DioException catch (e) {
      debugPrint(e.toString());
      return Left(Failure("request failed"));
    }
  }
}
