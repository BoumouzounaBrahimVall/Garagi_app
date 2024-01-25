import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:garagi_app/config/constants.dart';
import 'package:garagi_app/domain/models/client_model.dart';
import 'package:garagi_app/domain/models/failure_success.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/form_client_model.dart';
import 'client_service.dart';

class HttpClientService implements ClientService {
  final Dio _dio = Dio();

  @override
  Future<Either<Failure, Success>> createClient(FormClientModel client) async {
    String baseUrl = '${AppConstants.backendUrl}/clients/create';
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      debugPrint(client.toString());
      // final response =
      await _dio.post(
        baseUrl,
        data: client.toJson(),
        options: Options(headers: {
          'authorization': 'Bearer $token',
        }),
      );

      return Right(Success("Client created successfully"));
    } on DioException catch (e) {
      debugPrint(e.toString());
      return Left(Failure("Client not created"));
    }
  }

  @override
  Future<Either<Failure, Success>> deleteClient(String email) async {
    String baseUrl = '${AppConstants.backendUrl}/clients/delete/$email';

    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      debugPrint(email);
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
  Future<Either<Failure, ClientModel>> getClientDetails(String email) async {
    String baseUrl = '${AppConstants.backendUrl}/clients/get/$email';
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      debugPrint(email);
      final response = await _dio.get(
        baseUrl,
        options: Options(headers: {
          'authorization': 'Bearer $token',
        }),
      );
      ClientModel client = ClientModel.fromJson(response.data['data']);
      return Right(client);
    } on DioException catch (e) {
      debugPrint(e.toString());
      return Left(Failure(e.response?.data['message']));
    }
  }

  @override
  Future<Either<Failure, List<ClientModel>>> getClientList() async {
    String baseUrl = '${AppConstants.backendUrl}/clients/getAll';
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final response = await _dio.get(
        baseUrl,
        options: Options(headers: {
          'authorization': 'Bearer $token',
        }),
      );
      List<ClientModel> clients = [];
      for (var item in response.data) {
        clients.add(ClientModel.fromJson(item));
      }
      return Right(clients);
    } on DioException catch (e) {
      debugPrint(e.toString());
      return Left(Failure(e.response?.data['message']));
    }
  }

  @override
  Future<Either<Failure, List<ClientModel>>> getClientListBySubString(
      String substring) async {
    String baseUrl = '${AppConstants.backendUrl}/clients/substring/$substring';
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final response = await _dio.get(
        baseUrl,
        options: Options(headers: {
          'authorization': 'Bearer $token',
        }),
      );
      List<ClientModel> clients = [];
      for (var item in response.data) {
        clients.add(ClientModel.fromJson(item));
      }
      return Right(clients);
    } on DioException catch (e) {
      debugPrint(e.toString());
      return Left(Failure(e.response?.data['message']));
    }
  }

  @override
  Future<Either<Failure, Success>> updateClient(ClientModel client) async {
    String baseUrl = '${AppConstants.backendUrl}/clients/update/';
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      debugPrint(client.toString());
      final response = await _dio.put(
        baseUrl,
        data: client.toJson(),
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
}
