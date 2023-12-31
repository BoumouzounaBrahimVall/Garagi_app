import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:garagi_app/config/colors.dart';
import 'package:garagi_app/domain/models/choice_model.dart';
import 'package:garagi_app/widgets/app_bar/secondary_appbar_widget.dart';

class CarDetailScreen extends StatefulWidget {
  const CarDetailScreen({super.key, required this.carId});
  final String carId;
  @override
  State<CarDetailScreen> createState() => _CarDetailScreenState();
}

class _CarDetailScreenState extends State<CarDetailScreen> {
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
            Text(title)
          ],
        ));
  }

  List<ChoiceModel> categories = [
    ChoiceModel(name: "Tous", index: 0, isSelected: true),
    ChoiceModel(name: "Vidanges", index: 1, isSelected: false),
    ChoiceModel(name: "Diagnostics", index: 2, isSelected: false),
    ChoiceModel(name: "Reperations", index: 3, isSelected: false),
  ];
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
              Container(
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
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              "1234AA12",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            ElevatedButton.icon(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.location_on,
                                size: 24.0,
                              ),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateColor.resolveWith(
                                          (states) => AppColors.colorYellow)),
                              label: const Text(
                                'Location',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        statsContainer(value: "10", title: "Vidanges"),
                        statsContainer(value: "100", title: "KM restant"),
                        statsContainer(value: "700", title: "depances"),
                      ],
                    ),
                  ],
                ),
              ),
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
                    consultationCard(width),
                    consultationCard(width),
                    consultationCard(width),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget consultationCard(double width) {
    return Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.only(bottom: 16),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  'assets/svg/diagnostic_svg.svg',
                  color: AppColors.colorGray,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  //location icon and title
                  Row(
                    children: const [
                      Icon(
                        Icons.place,
                        size: 12,
                        color: AppColors.colorGrayDark,
                      ),
                      Text(
                        "Garaj Ahmed",
                        style: TextStyle(
                            fontSize: 12, color: AppColors.colorGrayDark),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: width / 2.5,
                    child: const Text(
                      "Diagnistiques",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Text(
                    "500 DH",
                    style: TextStyle(
                        color: AppColors.colorGrayDark,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                ]),
              ],
            ),
            SizedBox(
              height: 77,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: const [
                      Icon(
                        Icons.watch_later_outlined,
                        size: 12,
                        color: AppColors.colorGrayDark,
                      ),
                      Text(
                        "21-12-2022",
                        style: TextStyle(
                            fontSize: 12, color: AppColors.colorGrayDark),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text(
                          'Voir plus',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: AppColors.colorYellow,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Icon(
                          Icons.chevron_right_rounded,
                          size: 24.0,
                          color: AppColors.colorYellow,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
