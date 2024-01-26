import 'package:garagi_app/domain/methods/date_transform.dart';

enum ReservationState { pending, accepted, rejected, ended }

class ReservationModel {
  int? id;
  int? carId;
  int? stationId;
  String? reservationDateTime;
  String? time;
  String? date;
  ReservationState? status;
  String? carModel;
  String? stationName;
  ReservationModel({
    this.time,
    this.date,
    this.id,
    this.stationId,
    this.carId,
    this.reservationDateTime,
    this.status,
    this.stationName,
    this.carModel,
  });

  factory ReservationModel.fromJson(Map<String, dynamic> json) {
    return ReservationModel(
      date: formatDateToString(
          json["reservationDateTime"].toString().substring(0, 10)),
      time: json["reservationDateTime"].toString().substring(11, 16),
      id: json["id"],
      stationId: json["stationId"],
      carId: json["carId"],
      reservationDateTime: json["reservationDateTime"], //(),
      status: reservationTextToEnum(json["status"]),
      stationName: json["stationName"],
      carModel: json["carModel"],
    );
  }

  @override
  String toString() {
    return "id: $id, stationId: $stationId, carId: $carId,reservationDateTime: $reservationDateTime, status: $status, stationName: $stationName, carModel: $carModel";
  }

  static String reservationStateText(ReservationState state) {
    switch (state) {
      case ReservationState.accepted:
        return "ACCEPTED";
      case ReservationState.rejected:
        return "REJECTED";
      case ReservationState.pending:
        return "PENDING";
      default:
        return "ENDED";
    }
  }

  Map<String, dynamic> toJson() {
    return {
      "carId": carId,
      "stationId": stationId,
      "reservationDateTime": reservationDateTime
    };
  }

  static ReservationState reservationTextToEnum(String state) {
    switch (state) {
      case "ACCEPTED":
        return ReservationState.accepted;
      case "REJECTED":
        return ReservationState.rejected;
      case "PENDING":
        return ReservationState.pending;
      default:
        return ReservationState.ended;
    }
  }
}
