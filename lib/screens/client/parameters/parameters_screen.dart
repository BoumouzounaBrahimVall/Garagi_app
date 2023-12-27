import 'package:flutter/material.dart';
import 'package:garagi_app/widgets/app_bar/secondary_appbar_widget.dart';

class ParametersScreen extends StatefulWidget {
  const ParametersScreen({
    super.key,
  });
  @override
  State<ParametersScreen> createState() => _ParametersScreenState();
}

class _ParametersScreenState extends State<ParametersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SecondaryAppBarWidget(
          horizontalPadding: 10, title: 'Parameters', onPressedBack: null),
      body: Container(),
    );
  }
}
