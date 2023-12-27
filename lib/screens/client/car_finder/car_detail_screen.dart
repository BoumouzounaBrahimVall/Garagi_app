import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: SecondaryAppBarWidget(
        horizontalPadding: 10,
        title: 'Details Voiture',
        onPressedBack: () {
          Navigator.pop(context);
        },
      ),
      body: Container(),
    );
  }
}
