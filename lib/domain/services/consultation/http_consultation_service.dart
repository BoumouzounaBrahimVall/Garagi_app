import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:garagi_app/domain/models/consultation_model.dart';
import 'package:garagi_app/domain/models/failure_success.dart';
import 'package:garagi_app/domain/services/consultation/consultation_service.dart';

import '../../../config/constants.dart';

class HttpConsultationService implements ConsultationService {
  String baseUrl = '${AppConstants.backendUrl}/consultations';
  final Dio _dio = Dio();

  @override
  Future<Either<Failure, Success>> saveConsultation(
      ConsultationModel form) async {
    // TODO: implement saveConsultation
    String url = '$baseUrl/create';
    try {
      final response = await _dio.post(url, data: form.toJson());
      final consultation = ConsultationModel.fromJson(response.data);
      debugPrint(consultation.toString());
      String message = '';
      if (response.statusCode == 200) {
        message = 'Consultation created successfully';
      } else {
        message = 'Consultation not created';
      }
      return Right(Success(message));
    } on DioException catch (e) {
      if (e.response != null) {
        return Left(Failure("Dio Exception "));
      } else {
        return Left(Failure('Une erreur est survenue'));
      }
    }
  }

  @override
  Future<Either<Failure, List<ConsultationModel>>> getConsultations() async {
    String url = '$baseUrl/all';
    try {
      final response = await _dio.get(baseUrl);
      List<ConsultationModel> consultations = [];
      response.data['data'].forEach((consultation) {
        consultations.add(ConsultationModel.fromJson(consultation));
      });
      return Right(consultations);
    } on DioException catch (e) {
      if (e.response != null) {
        return Left(Failure("Dio Exception "));
      } else {
        return Left(Failure('Une erreur est survenue'));
      }
    }
  }
}
