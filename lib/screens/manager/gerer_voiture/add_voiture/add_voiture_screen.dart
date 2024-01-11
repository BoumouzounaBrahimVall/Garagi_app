import 'package:flutter/material.dart';
import 'package:garagi_app/provider/car_form_provider.dart';
import 'package:provider/provider.dart';

import '../../../../widgets/button_primary_widget.dart';
import '../../../layout/secondary_layout_screen.dart';
import 'steps/step_form_client .dart';
import 'steps/step_form_voiture.dart';

class AddVoitureScreen extends StatefulWidget {
  const AddVoitureScreen({Key? key}) : super(key: key);

  @override
  _AddVoitureScreenState createState() => _AddVoitureScreenState();
}

class _AddVoitureScreenState extends State<AddVoitureScreen> {
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
        appBarTitle: "Ajouter une voiture",
        body: Stack(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    height: height,
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (value) {
                        setState(() {
                          _currentPage = value;
                        });
                      },
                      children: [
                        StepFormVoiture(),
                        StepFormClient(),
                      ],
                    ),
                  ),
                  SizedBox(height: 100),
                ],
              ),
            ),
            Positioned(
              bottom: 10,
              left: width * 0.05,
              child: ButtonPrimaryWidget(
                  title: _currentPage == 1 ? 'Enregistrer' : 'Suivant',
                  onPressed: () => {
                        if (_currentPage == 0)
                          {nextPage()}
                        else
                          {
                            debugPrint(
                                'Voiture ${context.read<CarFormProvider>().getFormCarModel.toString()}')
                          }
                      }),
            )
          ],
        ));
  }
}
