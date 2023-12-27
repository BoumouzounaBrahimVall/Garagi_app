import 'package:flutter/material.dart';
import 'package:garagi_app/widgets/app_bar/secondary_appbar_widget.dart';

class GererVoitureScreen extends StatefulWidget {
  const GererVoitureScreen({
    super.key,
  });
  @override
  State<GererVoitureScreen> createState() => _GererVoitureScreenState();
}

class _GererVoitureScreenState extends State<GererVoitureScreen> {
  @override
  Widget build(BuildContext context) {
    return const Text("gerer Voiture");
  }
}
