import 'package:flutter/material.dart';
import 'package:garagi_app/domain/services/client/reservations/create_reservation.dart';
import 'package:garagi_app/provider/reservation_from_provider.dart';
import 'package:garagi_app/screens/client/reservations/add_reservation/steps/form_date_and_station_screen.dart';
import 'package:garagi_app/screens/client/reservations/add_reservation/steps/form_reservation_voiture_screen.dart';
import 'package:garagi_app/screens/layout/secondary_layout_screen.dart';
import 'package:garagi_app/widgets/button_primary_widget.dart';
import 'package:provider/provider.dart';

class AddReservationScreen extends StatefulWidget {
  const AddReservationScreen({super.key});

  @override
  State<AddReservationScreen> createState() => _AddReservationScreenState();
}

class _AddReservationScreenState extends State<AddReservationScreen> {
  PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  void nextPage() {
    _pageController.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SecondaryLayoutScreen(
        appBarTitle: 'Effectuer une Reservation',
        body: Stack(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(children: [
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: height,
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (value) {
                      setState(() {
                        _currentPage = value;
                      });
                    },
                    children: const [
                      FormReservationVoitureScreen(),
                      FormDateAndStationScreen(),
                    ],
                  ),
                ),
                const SizedBox(height: 100),
              ]),
            ),
            Positioned(
              bottom: 10,
              left: width * 0.05,
              child: ButtonPrimaryWidget(
                  title: _currentPage == 1 ? 'Enregistrer' : 'Suivant',
                  onPressed: () async => {
                        if (_currentPage != 1)
                          {nextPage()}
                        else
                          {
                            debugPrint(
                                'Reservation ${context.read<ReservationFormProvider>().form.toString()}'),
                            await createReservation(
                                context.read<ReservationFormProvider>().form),
                            Navigator.of(context).pop(),
                            //
                            /*
                            await context
                                .read<ConsultationServiceProvider>()
                                .saveConsultation(context
                                    .read<ConsultationFormProvider>()
                                    .form),
                             context
                                .read<>()
                                .saveCar(context
                                    .read<CarFormProvider>()
                                    .getFormCarModel)
                                .then((value) => Navigator.of(context).pop()),*/
                          }
                      }),
            )
          ],
        ));
  }
}
