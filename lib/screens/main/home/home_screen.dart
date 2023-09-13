import 'package:flutter/material.dart';
import 'package:garagi_app/screens/main/car_finder/car_finder_widget.dart';
import 'package:garagi_app/widgets/app_bar/primary_appbar_widget.dart';
import 'package:garagi_app/widgets/model_bottom_sheet_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PrimaryAppBarWidget(
            onPressedMore: () {
              modalBottomSheetWidget(context,
                  initialChildSize: 0.8,
                  maxChildSize: 0.9,
                  minChildSize: 0.5,
                  child: const SizedBox(
                    height: 200,
                  ));
              //modalBottomSheetWidget
            },
            horizontalPadding: 8),
        body: const Padding(
          padding: EdgeInsets.fromLTRB(10.0, 20, 10.0, 0),
          child: CarFinderWidget(),
        ));
  }
}
