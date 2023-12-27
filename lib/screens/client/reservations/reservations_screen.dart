import 'package:flutter/material.dart';
import 'package:garagi_app/widgets/app_bar/secondary_appbar_widget.dart';

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({
    super.key,
  });
  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SecondaryAppBarWidget(
          horizontalPadding: 10, title: 'Reservation', onPressedBack: null),
      body: Container(),
    );
  }
}
