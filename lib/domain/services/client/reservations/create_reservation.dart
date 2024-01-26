import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:garagi_app/config/constants.dart';
import 'package:garagi_app/domain/models/reservation_model.dart';

Future<void> createReservation(ReservationModel reservation) async {
  final Dio dio = Dio();
  String baseUrl = '${AppConstants.backendUrl}/reservations/create';
  try {
    // final response =
    await dio.post(
      baseUrl,
      data: reservation.toJson(),
    );

    return;
  } on DioException catch (e) {
    debugPrint(e.toString());
    return;
  }
}
