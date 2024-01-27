import 'package:flutter/material.dart';
import 'package:garagi_app/domain/services/reservation/http_reservation_service.dart';

import '../domain/models/choice_model.dart';
import '../domain/models/reservation_model.dart';
import '../domain/services/client/reservations/get_client_reservations.dart';

class ReservationModelProvider extends ChangeNotifier {
  List<ReservationModel> _reservations = [];
  List<ReservationModel> get reservations => _reservations;
  List<ReservationModel> _filtredReservations = [];
  List<ReservationModel> get filtredReservations => _filtredReservations;
  final HttpReservationService _reservationService = HttpReservationService();
  bool isLoading = false;
  List<ChoiceModel> categories = [
    ChoiceModel(name: "Tous", index: 0, isSelected: true),
    ChoiceModel(name: "Pending", index: 1, isSelected: false),
    ChoiceModel(name: "Accepted", index: 2, isSelected: false),
    ChoiceModel(name: "Rejected", index: 3, isSelected: false),
    ChoiceModel(name: "ended", index: 3, isSelected: false),
  ];
  Future<void> fetchReservations() async {
    isLoading =
        true; /*
    List<ReservationModel> reservations =
        await _reservationService.getReservations();*/
    List<ReservationModel> reservations = await getClientReservations("2");
    _reservations = reservations;
    _filtredReservations = reservations;
    isLoading = false;
    notifyListeners();
  }

  setFiltredReservations(List<ReservationModel> reservations) {
    _filtredReservations = reservations;
    notifyListeners();
  }

  Future<void> acceptReservation(ReservationModel reservation) async {
    reservation.status = ReservationState.accepted;
    ReservationModel reservationUpdated =
        await _reservationService.updateReservation(reservation);

    fetchReservations();
    notifyListeners();

    //updateReservation(reservationUpdated);
  }

  Future<void> rejectReservation(ReservationModel reservation) async {
    reservation.status = ReservationState.rejected;
    ReservationModel reservationUpdated =
        await _reservationService.updateReservation(reservation);
    //updateReservation(reservationUpdated);
    fetchReservations();
    notifyListeners();
  }

  void setReservations(List<ReservationModel> reservations) {
    _reservations = reservations;
    notifyListeners();
  }
/*
  void updateReservation(ReservationModel reservation) {
    _reservationService.updateReservation(reservation);
    notifyListeners();
  }*/
}
