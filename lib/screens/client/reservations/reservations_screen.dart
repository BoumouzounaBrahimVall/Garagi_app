import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:garagi_app/config/colors.dart';
import 'package:garagi_app/domain/models/choice_model.dart';
import 'package:garagi_app/domain/models/reservation_model.dart';
import 'package:garagi_app/domain/services/client/reservations/get_client_reservations.dart';
import 'package:garagi_app/screens/client/reservations/add_reservation/add_reservation_screen.dart';
import 'package:garagi_app/widgets/button_primary_widget.dart';

class ReservationScreen extends StatefulWidget {
  ReservationScreen({
    super.key,
  });
  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  List<ReservationModel> reservations = [];
  List<ReservationModel> filtredReservations = [];

  @override
  void initState() {
    super.initState();
    getReservations();
  }

  void getReservations() async {
    reservations = await getClientReservations("2");
    filtredReservations = reservations;
    setState(() {});
  }

  List<ChoiceModel> categories = [
    ChoiceModel(name: "Tous", index: 0, isSelected: true),
    ChoiceModel(name: "Pending", index: 1, isSelected: false),
    ChoiceModel(name: "Accepted", index: 2, isSelected: false),
    ChoiceModel(name: "Rejected", index: 3, isSelected: false),
    ChoiceModel(name: "ended", index: 3, isSelected: false),
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        floatingActionButton: Container(
          margin: EdgeInsets.only(
            bottom: width / 4,
            left: 80,
            right: 50,
          ),
          child: ButtonPrimaryWidget(
              title: 'Effectuer une Reservation',
              onPressed: () => {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AddReservationScreen()))
                  }),
        ),
        body: Column(
          children: [
            const Text(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              'Your reservations',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20, left: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  spacing: 10.0, //
                  children: <Widget>[
                    ...categories.map(
                      (choice) {
                        return GestureDetector(
                          onTap: () {
                            if (choice.index == 0) {
                              // index 0 is for all categories
                              filtredReservations = reservations;
                            } else {
                              // indexs 1 to 3 are for all categories and needs -1 to be equal to enum indexs

                              filtredReservations = reservations
                                  .map((e) => e)
                                  .where((elem) =>
                                      elem.status!.index == choice.index - 1)
                                  .toList();
                            }
                            setState(() {
                              for (var element in categories) {
                                element.isSelected = false;
                              }
                              choice.isSelected = true;
                            });
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                color: choice.isSelected
                                    ? AppColors.colorYellow
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                    color: AppColors.colorYellow, width: 2),
                              ),
                              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                              child: Text(
                                choice.name,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: choice.isSelected
                                        ? Colors.white
                                        : Colors.black),
                              )),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height - 370,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    if (filtredReservations.isNotEmpty) ...[
                      ...filtredReservations.map(
                        (e) => Container(
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
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text.rich(
                                    TextSpan(
                                        text: 'Le ',
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                        children: <InlineSpan>[
                                          TextSpan(
                                            text: e.date!,
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const TextSpan(
                                            text: " a ",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          TextSpan(
                                            text: e.time!,
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ]),
                                  ),
                                ],
                              ),
                              subtitle: Text.rich(TextSpan(
                                  text: 'Vehicle: ',
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                  children: <InlineSpan>[
                                    TextSpan(
                                      text: e.carModel,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ])),
                              trailing: reservationStateWidget(e.status!)),
                        ),
                      ),
                      const SizedBox(
                        height: 160,
                      )
                    ] else
                      SvgPicture.asset(
                        "assets/svg/empty_avatar.svg",
                        width: 150,
                      )
                  ],
                ),
              ),
            ),
          ],
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
}

/**
 
 */
