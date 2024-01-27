import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:garagi_app/config/constants.dart';
import 'package:garagi_app/domain/models/reservation_model.dart';

Future<List<ReservationModel>> getClientReservations(String clientId) async {
  final dio = Dio();
  Response response;
  try {
    response =
        await dio.get('${AppConstants.backendUrl}/reservations/get/$clientId');
    if (response.statusCode == 200) {
      /* List<ReservationModel> reservations = (response.data as List<dynamic>)
          .map((jsonData) => ReservationModel.fromJson(jsonData))
          .toList();*/

      List<ReservationModel> reservations = [];
      response.data.forEach((reservation) {
        reservations.add(ReservationModel.fromJson(reservation));
      });

      debugPrint('$reservations[0]');
      debugPrint('$reservations[1]');
      return reservations;
    } else {
      print('Request failed with status code: ${response.statusCode}');
      return [];
    }
  } catch (error) {
    print('Error: $error');
    return [];
  }
}
