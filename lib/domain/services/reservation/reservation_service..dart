import 'package:garagi_app/domain/models/reservation_model.dart';

abstract class ReservationService {
  Future<List<ReservationModel>> getReservations();
  Future<ReservationModel> updateReservation(ReservationModel reservation);
}
