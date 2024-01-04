import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:garagi_app/config/colors.dart';

class SecondaryLayoutScreen extends StatefulWidget {
  SecondaryLayoutScreen({required this.appBarTitle, required this.body});
  final String appBarTitle;
  final Widget body;
  @override
  _SecondaryLayoutScreenState createState() => _SecondaryLayoutScreenState();
}

class _SecondaryLayoutScreenState extends State<SecondaryLayoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              GestureDetector(
                onTap: () => {
                  if (Navigator.canPop(context)) {Navigator.pop(context)}
                },
                child: SvgPicture.asset(
                  'assets/icons/back-btn-icon.svg',
                  width: 40,
                  height: 40,
                ),
              ),
              const SizedBox(
                width: 40,
              ),
              Text(
                widget.appBarTitle,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .merge(const TextStyle(color: AppColors.colorBrown)),
              ),
            ],
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: AppColors.colorGrayLight,
          child: widget.body,
        ));
  }
}
