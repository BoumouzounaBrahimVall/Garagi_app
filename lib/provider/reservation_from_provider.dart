import 'package:flutter/material.dart';
import 'package:garagi_app/domain/models/reservation_model.dart';

class ReservationFormProvider extends ChangeNotifier {
  ReservationModel _form = ReservationModel();
  ReservationModel get form => _form;
  void setForm(ReservationModel form) {
    _form = form;
    notifyListeners();
  }

  void setCarId(int vehicleId) {
    _form.carId = vehicleId;
    notifyListeners();
  }

  void setStationId(int stationId) {
    _form.stationId = stationId;
    notifyListeners();
  }

  void setReservationDateTime(String reservationDateTime) {
    _form.reservationDateTime = reservationDateTime;
    notifyListeners();
  }
}
