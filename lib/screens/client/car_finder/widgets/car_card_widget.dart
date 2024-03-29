import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:garagi_app/widgets/scrolling_text_widget.dart';
import '../../../../config/colors.dart';

class CarCardWidget extends StatefulWidget {
  const CarCardWidget(
      {super.key,
      required this.carId,
      required this.carTitle,
      this.isDanger = false,
      this.message = '',
      required this.matricule,
      required this.onTap});
  final String carId;
  final String carTitle;
  final String message;
  final bool isDanger;
  final String matricule;
  final Function onTap;
  @override
  State<CarCardWidget> createState() => _CarCardWidgetState();
}

class _CarCardWidgetState extends State<CarCardWidget> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        widget.onTap();
      },
      child: Container(
        margin: EdgeInsets.only(
          left: width / 60,
          right: width / 60,
        ),
        decoration: BoxDecoration(
          color: AppColors.colorWhite,
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: AppColors.colorBlack.withOpacity(0.1),
              blurRadius: 4.0,
              spreadRadius: 1.0,
              offset: const Offset(0.0, 0.0),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // for notifications
            Container(
                width: width / 2,
                height: 25,
                padding: const EdgeInsets.only(left: 6, right: 6),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadiusDirectional.only(
                      topEnd: Radius.circular(15),
                      topStart: Radius.circular(15),
                    ),
                    color: widget.message.isEmpty
                        ? Colors.transparent
                        : widget.isDanger
                            ? AppColors.colorRed
                            : AppColors.colorYellow),
                child: ScrollingTextWidget(
                  text: widget.message,
                  textStyle: const TextStyle(
                      color: AppColors.colorWhite, fontWeight: FontWeight.w600),
                )),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.colorYellowLight),
              child: SvgPicture.asset(
                'assets/svg/car.svg',
                color: AppColors.colorYellow,
                width: 50,
              ),
            ),
            Column(
              children: [
                Text(
                  widget.carTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.matricule,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 5,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
