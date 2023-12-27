import 'package:flutter/material.dart';
import 'package:garagi_app/widgets/app_bar/secondary_appbar_widget.dart';

class StationsScreen extends StatefulWidget {
  const StationsScreen({
    super.key,
  });
  @override
  State<StationsScreen> createState() => _StationsScreenState();
}

class _StationsScreenState extends State<StationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SecondaryAppBarWidget(
          horizontalPadding: 10, title: 'Stations', onPressedBack: null),
      body: Container(),
    );
  }
}
