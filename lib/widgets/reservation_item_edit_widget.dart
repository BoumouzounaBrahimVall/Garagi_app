import 'package:flutter/material.dart';
import 'package:garagi_app/provider/reservation_model_provider.dart';
import 'package:provider/provider.dart';

import '../config/colors.dart';
import '../domain/models/reservation_model.dart';

class ReservationItemEditWidget extends StatelessWidget {
  ReservationItemEditWidget({required this.reservation, super.key});
  final ReservationModel reservation;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/icons/reservation-icon.png',
              height: 60,
              width: 60,
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                        text: 'Le ',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                        children: <InlineSpan>[
                          TextSpan(
                            text: reservation.date!,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const TextSpan(
                            text: " a ",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                          TextSpan(
                            text: reservation.time!,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )
                        ]),
                  ),
                ],
              ),
              Text.rich(TextSpan(
                  text: 'Vehicle: ',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w400),
                  children: <InlineSpan>[
                    TextSpan(
                      text: reservation.carModel,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    )
                  ])),
            ]),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                reservation.status == ReservationState.pending
                    ? PopupMenuButton(
                        icon: Icon(Icons.more_horiz,
                            size: 18,
                            color: AppColors.colorBlack.withOpacity(0.5)),

                        // add icon, by default "3 dot" icon
                        // icon: Icon(Icons.book)
                        itemBuilder: (context) {
                          return const [
                            PopupMenuItem<int>(
                              value: 0,
                              child: Text("Accept"),
                            ),
                            PopupMenuItem<int>(
                              value: 1,
                              child: Text("Refuse"),
                            ),
                          ];
                        },
                        onSelected: (value) {
                          if (value == 0) {
                            debugPrint("Accept is selected.");
                            context
                                .read<ReservationModelProvider>()
                                .acceptReservation(reservation);
                          } else if (value == 1) {
                            debugPrint("Refuse menu is selected.");
                            context
                                .read<ReservationModelProvider>()
                                .rejectReservation(reservation);
                          }
                        })
                    : const SizedBox(),
                reservationStateWidget(reservation.status!, context),
              ],
            ),
          ],
        ));
  }
}

Widget reservationStateWidget(ReservationState state, BuildContext context) {
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
      ReservationModel.reservationStateText(state),
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
