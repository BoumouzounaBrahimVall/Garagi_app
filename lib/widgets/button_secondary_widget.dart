import 'package:flutter/material.dart';

import '../config/colors.dart';

class ButtonSecondaryWidget extends StatelessWidget {
  const ButtonSecondaryWidget(
      {super.key,
      this.widthp,
      this.icon,
      required this.title,
      required this.onPressed});
  final String title;
  final Function onPressed;
  final double? widthp;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ElevatedButton.icon(
        icon: Icon(
          icon,
          color: AppColors.colorOrange,
        ),
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(20.0), // Adjust the radius as needed
            ),
          ),
          minimumSize:
              MaterialStatePropertyAll(Size(widthp ?? width * 0.9, 48)),
          maximumSize:
              MaterialStatePropertyAll(Size(widthp ?? width * 0.9, 48)),
          backgroundColor: MaterialStatePropertyAll(AppColors.colorOrangeLight),
          foregroundColor:
              const MaterialStatePropertyAll(AppColors.colorOrange),
        ),
        onPressed: () => {debugPrint("clicked"), onPressed()},
        label: Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall!.merge(TextStyle(
              color: AppColors.colorOrange,
              fontSize: 16,
              fontWeight: FontWeight.w600)),
        ));
  }
}
