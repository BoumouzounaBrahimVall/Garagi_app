import 'package:flutter/material.dart';
import 'package:garagi_app/widgets/app_bar/secondary_appbar_widget.dart';

class GererClientScreen extends StatefulWidget {
  const GererClientScreen({
    super.key,
  });
  @override
  State<GererClientScreen> createState() => _GererClientScreenState();
}

class _GererClientScreenState extends State<GererClientScreen> {
  @override
  Widget build(BuildContext context) {
    return const Text("gerer client");
  }
}
