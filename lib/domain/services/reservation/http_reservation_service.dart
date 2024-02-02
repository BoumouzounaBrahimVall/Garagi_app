import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:garagi_app/domain/models/reservation_model.dart';

import '../../../config/constants.dart';
import 'reservation_service..dart';

class HttpReservationService implements ReservationService {
  final Dio dio = Dio();
  final url = '${AppConstants.backendUrl}/reservations';
  @override
  Future<List<ReservationModel>> getReservations() async {
    try {
      String urlEnpoint = '$url/get-all';
      final response = await dio.get(urlEnpoint);
      List<ReservationModel> reservations = [];
      response.data.forEach((reservation) {
        reservations.add(ReservationModel.fromJson(reservation));
      });
      return reservations.reversed.toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<ReservationModel> updateReservation(
      ReservationModel reservation) async {
    try {
      String urlEnpoint = '$url/update';
      final response =
          await dio.put(urlEnpoint, data: reservation.updateStatetoJson());
      ReservationModel reservationResp =
          ReservationModel.fromJson(response.data);
      return reservationResp;
    } catch (e) {
      return ReservationModel();
    }
  }
}
