import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:garagi_app/domain/methods/greeting_method.dart';
import 'package:garagi_app/domain/methods/transform_number.dart';
import '../../../config/colors.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({
    super.key,
  });
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  ScrollController scrollController = ScrollController();
  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  List<int> stats = [1235, 23454554, 775676, 12];
  List<String> statNames = [
    "Consultations",
    "Clients",
    "Vehicles",
    "Reservations"
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    //double height = MediaQuery.of(context).size.height;
    int columnCount = 2;
    /*24 is for notification bar on Android*/
    final double itemHeight = (width) / 2;
    final double itemWidth = width / 2;
    return Scaffold(
      backgroundColor: AppColors.colorWhite,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: width / 40,
              left: width / 30,
              right: width / 30,
            ),
            child: Text(
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              '${greetingMethod()} Mr. Ahmed Salem 👋',
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: width / 20,
              left: width / 30,
              right: width / 30,
            ),
            child: const Text(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              'Here are some statistics',
              style: TextStyle(
                  fontSize: 20,
                  color: AppColors.colorBlack,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic),
            ),
          ),
          const SizedBox(
            height: 20,
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
                  stats.length,
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
                            child: Container(
                              margin: EdgeInsets.only(
                                left: width / 60,
                                right: width / 60,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.colorWhite,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(15),
                                ),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color:
                                        AppColors.colorBlack.withOpacity(0.1),
                                    blurRadius: 4.0,
                                    spreadRadius: 1.0,
                                    offset: const Offset(0.0, 0.0),
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    formatNumber(stats[index]),
                                    style: const TextStyle(
                                        fontSize: 52,
                                        color: AppColors.colorYellow,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(statNames[index]),
                                ],
                              ),
                            ),
                          ),
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
