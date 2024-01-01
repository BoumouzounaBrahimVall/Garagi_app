import 'package:flutter/material.dart';
import 'package:garagi_app/config/colors.dart';

class ButtonPrimaryWidget extends StatelessWidget {
  ButtonPrimaryWidget(
      {Key? key, this.widthp, required this.title, required this.onPressed})
      : super(key: key);
  final String title;
  Function onPressed;
  double? widthp;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(20.0), // Adjust the radius as needed
            ),
          ),
          minimumSize: MaterialStatePropertyAll(
              Size(widthp != null ? width : width * 0.9, 52)),
          maximumSize: MaterialStatePropertyAll(
              Size(widthp != null ? width : width * 0.9, 52)),
          backgroundColor: MaterialStatePropertyAll(AppColors.colorOrange),
          foregroundColor: MaterialStatePropertyAll(Colors.white),
        ),
        onPressed: () => {debugPrint("clicked"), onPressed()},
        child: Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall!.merge(TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600)),
        ));
  }
}
