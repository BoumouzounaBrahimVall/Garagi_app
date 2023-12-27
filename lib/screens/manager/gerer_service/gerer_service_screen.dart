import 'package:flutter/material.dart';
import 'package:garagi_app/widgets/app_bar/secondary_appbar_widget.dart';

class GererServiceScreen extends StatefulWidget {
  const GererServiceScreen({
    super.key,
  });
  @override
  State<GererServiceScreen> createState() => _GererServiceScreenState();
}

class _GererServiceScreenState extends State<GererServiceScreen> {
  @override
  Widget build(BuildContext context) {
    return const Text("gerer Service");
  }
}
