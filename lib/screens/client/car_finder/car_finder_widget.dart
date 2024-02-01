import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:garagi_app/domain/models/car_details_model.dart';
import 'package:garagi_app/domain/models/user_model.dart';
import 'package:garagi_app/domain/services/client/cars/get_client_cars_details.dart';
import 'package:garagi_app/screens/client/car_finder/car_detail_screen.dart';
import 'package:garagi_app/widgets/screen_transitions_widget.dart';
import '../../../domain/models/car_model.dart';
import '../../../screens/client/car_finder/widgets/car_card_widget.dart';
import '../../../domain/methods/greeting_method.dart';

class CarFinderWidget extends StatefulWidget {
  const CarFinderWidget({super.key});

  @override
  State<CarFinderWidget> createState() => _CarFinderWidgetState();
}

class _CarFinderWidgetState extends State<CarFinderWidget> {
  ScrollController scrollController = ScrollController();
  List<CarModel> clientCars = [];
  List<CarDetailModel> cars = [];
  @override
  void initState() {
    getCars();
    super.initState();
  }

  void getCars() async {
    //  clientCars = await getClientCars();
    String clientId = (await User.getInstance())!.userId.toString();
    cars = await getClientCarsDetails(clientId);
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    //double height = MediaQuery.of(context).size.height;
    int columnCount = 2;
    /*24 is for notification bar on Android*/
    final double itemHeight = (width) / 2;
    final double itemWidth = width / 2;
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
      child: Column(
        children: [
          Text(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            '${greetingMethod()} Mr. Ahmed Salem 👋',
            style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: AnimationLimiter(
              child: GridView.count(
                controller: scrollController,
                childAspectRatio: (itemWidth / itemHeight),
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
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
                              child: CarCardWidget(
                                matricule: cars[index].matricule,
                                carId: cars[index].id.toString(),
                                carTitle: cars[index].model,
                                isDanger: cars[index].isDanger,
                                message: cars[index].message,
                                onTap: () {
                                  print(cars[index]);
                                  Navigator.of(context).push(
                                      SlideLeftRouteWidget(CarDetailScreen(
                                    model: cars[index],
                                    isDanger: cars[index].isDanger,
                                    message: cars[index].message,
                                  )));
                                },
                              )),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
