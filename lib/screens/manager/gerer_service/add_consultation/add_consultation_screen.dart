import 'package:flutter/material.dart';
import 'package:garagi_app/provider/consultation_form_provider.dart';
import 'package:garagi_app/provider/consultation_service_provider.dart';
import 'package:garagi_app/screens/layout/secondary_layout_screen.dart';
import 'package:garagi_app/screens/manager/gerer_service/add_consultation/steps/form_autre_screen.dart';
import 'package:garagi_app/screens/manager/gerer_service/add_consultation/steps/form_problem_screen.dart';
import 'package:garagi_app/screens/manager/gerer_service/add_consultation/steps/form_service_screen_new.dart';
import 'package:garagi_app/screens/manager/gerer_service/add_consultation/steps/form_voiture_screen.dart';
import 'package:provider/provider.dart';

import '../../../../widgets/button_primary_widget.dart';

class AddConsultationScreen extends StatefulWidget {
  const AddConsultationScreen({Key? key}) : super(key: key);

  @override
  _AddConsultationScreenState createState() => _AddConsultationScreenState();
}

class _AddConsultationScreenState extends State<AddConsultationScreen> {
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
        appBarTitle: 'Ajouter une Consultation',
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
                      FormVoitureScreen(),
                      FormServiceScreenNew(),
                      FormProblemScreen(),
                      FormAutreScreen(),
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
                  title: _currentPage == 3 ? 'Enregistrer' : 'Suivant',
                  onPressed: () async => {
                        if (_currentPage != 3)
                          {nextPage()}
                        else
                          {
                            debugPrint(
                                'Consultation ${context.read<ConsultationFormProvider>().form.toString()}'),
                            await context
                                .read<ConsultationServiceProvider>()
                                .saveConsultation(context
                                    .read<ConsultationFormProvider>()
                                    .form),
                            Navigator.of(context).pop(),
                            /* context
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
