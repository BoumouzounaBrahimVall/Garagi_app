import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../config/colors.dart';
import '../../../config/consultations_fake_data.dart';
import '../../../domain/methods/transform_number.dart';
import '../../../domain/models/car_model.dart';
import '../../../domain/models/choice_model.dart';
import '../../../domain/models/consultation_model.dart';
import '../../../domain/services/client/cars/get_client_car_details.dart';
import '../../../screens/client/car_finder/consultation/consultation_screen.dart';
import '../../../screens/client/car_finder/consultation/consultation_card_widget.dart';
import '../../../widgets/app_bar/secondary_appbar_widget.dart';
import '../../../widgets/screen_transitions_widget.dart';

class CarDetailScreen extends StatefulWidget {
  const CarDetailScreen({super.key, required this.matricule});
  final String matricule;
  @override
  State<CarDetailScreen> createState() => _CarDetailScreenState();
}

class _CarDetailScreenState extends State<CarDetailScreen> {
  List<ChoiceModel> categories = [
    ChoiceModel(name: "Tous", index: 0, isSelected: true),
    ChoiceModel(name: "Vidanges", index: 1, isSelected: false),
    ChoiceModel(name: "Diagnostics", index: 2, isSelected: false),
    ChoiceModel(name: "Reperations", index: 3, isSelected: false),
  ];
  List<ConsultationModel> filteredConsultations = [];
  CarModel? carDetails;

  @override
  void initState() {
    super.initState();
    filteredConsultations = consultationFakeData;
  }

  void getCarDetails() async {
    carDetails = await getClientCarDetails("1234AA12");
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.colorWhite,
      appBar: SecondaryAppBarWidget(
        horizontalPadding: 10,
        title: 'Details Voiture',
        onPressedBack: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: SizedBox(
          height: height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // notification banner
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(bottom: 12),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  color: AppColors.colorRed,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: AppColors.colorBlack.withOpacity(0.1),
                      blurRadius: 4.0,
                      spreadRadius: 1.0,
                      offset: const Offset(0.0, 0.0),
                    ),
                  ],
                ),
                child: const Text(
                  "Besoin d'une vidange ", //'vidange apres 100km',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 16,
                      color: AppColors.colorWhite,
                      fontWeight: FontWeight.w600),
                ),
              ),
              // car details card
              carDetailWidget(width),
              const Text(
                "Historique",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
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
                                filteredConsultations = consultationFakeData;
                              } else {
                                // indexs 1 to 3 are for all categories and needs -1 to be equal to enum indexs
                                filteredConsultations = consultationFakeData
                                    .map((e) => e)
                                    .where((elem) =>
                                        elem.type.index == choice.index - 1)
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
                                padding:
                                    const EdgeInsets.fromLTRB(16, 8, 16, 8),
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
                      ).toList()
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    ...filteredConsultations
                        .map((e) => ConsultationCardWidget(
                              type: e.type,
                              doneAt: e.date,
                              price: e.price,
                              stationName: e.stationName,
                              consultationId: e.consultationId,
                              showMoreAction: () {
                                Navigator.of(context).push(SlideLeftRouteWidget(
                                    ConsultationScreen(model: e)));
                              },
                            ))
                        .toList(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget carDetailWidget(double width) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 12),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        color: AppColors.colorWhite,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: AppColors.colorBlack.withOpacity(0.1),
            blurRadius: 4.0,
            spreadRadius: 1.0,
            offset: const Offset(0.0, 0.0),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.colorYellowLight),
                child: SvgPicture.asset(
                  'assets/svg/car.svg',
                  color: AppColors.colorYellow,
                  width: 50,
                  height: 60,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Toyota Hilux 2020",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "1234AA12",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.location_on,
                      size: 24.0,
                      color: AppColors.colorWhite,
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => AppColors.colorYellow)),
                    label: const Text(
                      'Location',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.colorWhite,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            width: width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                statsContainer(value: formatNumber(10), title: "Vidanges"),
                statsContainer(
                    value: formatNumber(9909990), title: "KM restant"),
                statsContainer(value: formatNumber(560000), title: "depances"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget statsContainer({required String value, required String title}) {
    return Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.fromLTRB(8, 20, 8, 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.colorGray.withOpacity(0.6)),
        child: Column(
          children: [
            Text(
              value,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            )
          ],
        ));
  }
}
