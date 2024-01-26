import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:garagi_app/domain/models/car_model.dart';
import 'package:garagi_app/domain/services/cars/http_cars_service.dart';
import 'package:garagi_app/provider/reservation_from_provider.dart';
import 'package:garagi_app/screens/client/car_finder/widgets/car_card_widget.dart';

import '../../../../../provider/car_service_provider.dart';
import '../../../../../provider/consultation_form_provider.dart';
import '../../../../../widgets/form/text_form_search_widget.dart';
import '../../../../../widgets/step_infos_item.dart';
import 'package:provider/provider.dart';

class FormReservationVoitureScreen extends StatefulWidget {
  const FormReservationVoitureScreen({Key? key}) : super(key: key);

  @override
  _FormReservationVoitureScreenState createState() =>
      _FormReservationVoitureScreenState();
}

class _FormReservationVoitureScreenState
    extends State<FormReservationVoitureScreen> {
  ScrollController scrollController = ScrollController();
  String selectedCar = "";
  List<CarModel> cars = [];

  @override
  void initState() {
    super.initState();
    getCars();
  }

  Future<void> getCars() async {
    HttpCarsService carsService = HttpCarsService();
    var result = await carsService.getVehicleByOwnerId(2);
    result.fold((l) => "", (r) => cars = r);
    setState(() {});
    return;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    int columnCount = 2;

    /*24 is for notification bar on Android*/
    final double itemHeight = (width) / 2;
    final double itemWidth = width / 2;
    return SingleChildScrollView(
      child: Column(
        children: [
          const StepInfosItem(stepNumber: '01', stepTitle: 'Choisir Voiture'),
          const SizedBox(height: 16),
          TextFormSearchStyled(
            icon: Icons.search,
            label: 'chercher voiture',
            placeholder: 'tapez un mot',
            validator: () => null,
            onChanged: (value) {
              debugPrint(value);
              context.read<CarServiceProvider>().filterCars(value);
              //filterCars
            },
          ),
          const SizedBox(height: 32),
          SizedBox(
            height: height,
            child: AnimationLimiter(
              child: GridView.count(
                controller: scrollController,
                childAspectRatio: (itemWidth / itemHeight),
                physics: NeverScrollableScrollPhysics(),
                // physics: const BouncingScrollPhysics(    parent: AlwaysScrollableScrollPhysics(), ),
                padding: EdgeInsets.only(
                  //  top: width / 60,
                  bottom: width / 5,
                  left: width / 60,
                  right: width / 60,
                ),
                crossAxisCount: columnCount,
                children: List.generate(
                  cars.length,
                  (int index) {
                    return AnimationConfiguration.staggeredGrid(
                      position: index,
                      duration: const Duration(
                        milliseconds: 500,
                      ),
                      columnCount: columnCount,
                      child: ScaleAnimation(
                        duration: const Duration(
                          milliseconds: 900,
                        ),
                        curve: Curves.fastLinearToSlowEaseIn,
                        child: FadeInAnimation(
                            child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                          child: Stack(
                            children: [
                              CarCardWidget(
                                matricule: cars[index].matricule,
                                carId: cars[index].carId.toString(),
                                carTitle: cars[index].carTitle,
                                onTap: () {
                                  debugPrint(cars[index].carId);
                                  if (selectedCar == cars[index].carId) {
                                    setState(() {
                                      selectedCar = "";
                                    });
                                  } else {
                                    setState(() {
                                      selectedCar =
                                          cars[index].carId.toString();
                                      context
                                          .read<ReservationFormProvider>()
                                          .setCarId(
                                              int.parse(cars[index].carId));
                                    });
                                  }
                                  debugPrint(selectedCar);
                                },
                              ),
                              Positioned(
                                right: 16,
                                top: 16,
                                child: selectedCar == cars[index].carId
                                    ? Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        child: const Icon(
                                          Icons.check,
                                          color: Colors.white,
                                        ),
                                      )
                                    : const SizedBox(),
                              )
                            ],
                            // cars[index].carId==selectedCar ?
                          ),
                        )),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 150)
        ],
      ),
    );

    ;
  }
}
