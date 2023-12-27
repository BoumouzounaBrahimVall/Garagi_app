import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:garagi_app/data/car_data.dart';
import '/screens/client/car_finder/widgets/car_card_widget.dart';

class CarFinderWidget extends StatefulWidget {
  const CarFinderWidget({super.key});

  @override
  State<CarFinderWidget> createState() => _CarFinderWidgetState();
}

class _CarFinderWidgetState extends State<CarFinderWidget> {
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    int columnCount = 2;
    /*24 is for notification bar on Android*/
    final double itemHeight = (width) / 2;
    final double itemWidth = width / 2;
    return Column(
      children: [
        const Text(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          'Bonjour Mr. Ahmed Salem 👋',
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
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
                              carId: cars[index].carId,
                              carTitle: cars[index].carTitle,
                              isDanger: cars[index].isDanger,
                              message: cars[index].message,
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
    );
  }
}

/**
 
AnimationLimiter(
                            child: GridView.count(
                              controller: scrollController,
                              childAspectRatio: (itemWidth / itemHeight),
                              physics: const BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics(),
                              ),
                              padding: EdgeInsets.only(
                                top: width / 60,
                                bottom: width / 5,
                                left: width / 60,
                                right: width / 60,
                              ),
                              crossAxisCount: columnCount,
                              children: List.generate(
                                mainChampList.length,
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
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 0, 0, 8),
                                          child: ChampCardWidget(
                                              champId: mainChampList[index].id,
                                              backgroundImageUrl:
                                                  mainChampList[index]
                                                      .backgroundImageUrl,
                                              avatarImage: mainChampList[index]
                                                  .avatarImage,
                                              name: mainChampList[index].name,
                                              city: mainChampList[index].city,
                                              birthDate: mainChampList[index]
                                                  .birthDate,
                                              champSports: mainChampList[index]
                                                  .champSports),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                  

 */


/**
 
 Column(
      children: [
        const Text(
          'Bonjour Mr. Ahmed Salem 👋',
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: AnimationLimiter(
            child: ListView.builder(
              controller: scrollController,
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              padding: EdgeInsets.only(
                top: width / 30,
                bottom: width / 5,
                left: width / 30,
                right: width / 30,
              ),
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return AnimationConfiguration.staggeredList(
                  position: index,
                  delay: const Duration(
                    milliseconds: 100,
                  ),
                  child: const SlideAnimation(
                    duration: Duration(
                      milliseconds: 2500,
                    ),
                    curve: Curves.fastLinearToSlowEaseIn,
                    horizontalOffset: 30,
                    verticalOffset: 300.0,
                    child: FadeInAnimation(
                        duration: Duration(
                          milliseconds: 3000,
                        ),
                        curve: Curves.fastLinearToSlowEaseIn,
                        child: CarCardWidget()),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
 */