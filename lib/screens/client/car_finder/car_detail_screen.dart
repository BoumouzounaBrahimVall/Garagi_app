import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:garagi_app/config/colors.dart';
import 'package:garagi_app/widgets/app_bar/secondary_appbar_widget.dart';

class CarDetailScreen extends StatefulWidget {
  const CarDetailScreen({super.key, required this.carId});
  final String carId;
  @override
  State<CarDetailScreen> createState() => _CarDetailScreenState();
}

class _CarDetailScreenState extends State<CarDetailScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.colorGray,
      appBar: SecondaryAppBarWidget(
        horizontalPadding: 10,
        title: 'Details Voiture',
        onPressedBack: () {
          Navigator.pop(context);
        },
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.all(12),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: AppColors.colorRed),
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
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.all(12),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: AppColors.colorWhite),
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
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: const EdgeInsets.all(20),
                        margin: const EdgeInsets.fromLTRB(8, 30, 8, 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.colorGray),
                        child: Column(
                          children: const [
                            Text(
                              "10",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            Text("Vidanges")
                          ],
                        )),
                    Container(
                        padding: const EdgeInsets.all(20),
                        margin: const EdgeInsets.fromLTRB(8, 30, 8, 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.colorGray),
                        child: Column(
                          children: const [
                            Text(
                              "10",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            Text("Vidanges")
                          ],
                        )),
                    Container(
                        padding: const EdgeInsets.all(20),
                        margin: const EdgeInsets.fromLTRB(8, 30, 8, 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.colorGray),
                        child: Column(
                          children: const [
                            Text(
                              "10",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            Text("Vidanges")
                          ],
                        )),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
