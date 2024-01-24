import 'package:flutter/material.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';
import 'package:garagi_app/config/colors.dart';
import 'package:garagi_app/widgets/app_bar/secondary_appbar_widget.dart';
import 'package:garagi_app/widgets/button_secondary_widget.dart';

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({
    super.key,
  });
  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  dateTimePickerWidget(BuildContext context) {
    return DatePicker.showDatePicker(
      context,
      dateFormat: 'dd MMMM yyyy HH:mm',
      initialDateTime: DateTime.now(),
      minDateTime: DateTime.now(),
      maxDateTime: DateTime(3000),
      onMonthChangeStartWithFirstDate: true,
      onConfirm: (dateTime, List<int> index) {
        DateTime selectdate = dateTime;
        print(selectdate
            .copyWith(isUtc: true)
            .toIso8601String()); //2024-01-24T12:30:45.000Z
      },
    );
  }

  List<ReservationState> reservations = [
    ReservationState.accepted,
    ReservationState.rejected,
    ReservationState.pending,
    ReservationState.ended,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const SecondaryAppBarWidget(
            horizontalPadding: 10, title: 'Reservation', onPressedBack: null),
        body: ListView.builder(
          itemCount: reservations.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.fromLTRB(20, 8, 20, 8),
              decoration: BoxDecoration(
                color: AppColors.colorWhite,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: AppColors.colorBlack.withOpacity(0.1),
                    blurRadius: 4.0,
                    spreadRadius: 1.0,
                    offset: const Offset(0.0, 0.0),
                  ),
                ],
              ),
              child: ListTile(
                  title: Text("Cameri"),
                  subtitle: Text("2023-23-23"),
                  trailing: reservationStateWidget(reservations[index])),
            );
          },
        ));
  }

  Widget reservationStateWidget(ReservationState state) {
    return Container(
      width: 95,
      height: 40,
      alignment: Alignment.center,
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: reservationStateColor(state),
      ),
      child: Text(
        reservationStateText(state),
        style: Theme.of(context).textTheme.bodyMedium!.merge(
              const TextStyle(
                  color: Color(0xff222222),
                  fontWeight: FontWeight.w700,
                  fontSize: 16),
            ),
      ),
    );
  }

  Color reservationStateColor(ReservationState state) {
    switch (state) {
      case ReservationState.accepted:
        return AppColors.colorGreenLight;
      case ReservationState.rejected:
        return AppColors.colorRedLight;
      case ReservationState.pending:
        return AppColors.colorYellowLight;
      default:
        return AppColors.colorGray;
    }
  }

  String reservationStateText(ReservationState state) {
    switch (state) {
      case ReservationState.accepted:
        return "ACCEPTED";
      case ReservationState.rejected:
        return "REJECTED";
      case ReservationState.pending:
        return "PENDING ";
      default:
        return " ENDED ";
    }
  }
}

enum ReservationState { pending, accepted, rejected, ended }
/**
 Container(
        child: ElevatedButton(
          onPressed: () {
            dateTimePickerWidget(context);
          },
          child: const Text('Pick Date-Time'),
        ),
      ),
 */