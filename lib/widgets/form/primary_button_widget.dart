import 'package:flutter/material.dart';
import '../../../config/constants.dart';

import '../../../config/colors.dart';

class PrimaryButtonWidget extends StatelessWidget {
  PrimaryButtonWidget(
      {super.key,
      required this.buttonLabel,
      required this.onPressed,
      this.buttonColor});

  final String buttonLabel;
  final void Function()? onPressed;
  Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        alignment: Alignment.center,
        splashFactory: NoSplash.splashFactory,
        elevation: MaterialStateProperty.all(
          0,
        ),
        backgroundColor: MaterialStateProperty.all(
          buttonColor ?? AppColors.colorYellow,
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(
            vertical: 18,
          ),
        ),
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            color: Colors.black,
          ),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppConstants.buttonRadiusValue,
            ),
          ),
        ),
        shadowColor: MaterialStateProperty.all(
          Colors.transparent,
        ),
      ),
      onPressed: onPressed,
      child: Text(
        buttonLabel,
        style: const TextStyle(
          fontFamily: AppConstants.primaryTypeFace,
          color: AppColors.colorWhite,
          fontWeight: FontWeight.w700,
          fontSize: 20,
        ),
      ),
    );
  }
}
