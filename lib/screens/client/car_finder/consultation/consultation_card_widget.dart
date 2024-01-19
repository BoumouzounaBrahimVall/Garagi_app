import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:garagi_app/config/colors.dart';
import 'package:garagi_app/domain/models/car_details_model.dart';
import 'package:garagi_app/screens/client/car_finder/consultation/methods/consultation_methods.dart';

class ConsultationCardWidget extends StatelessWidget {
  final ConsultationType type;
  final int consultationId;
  final String doneAt;
  final String price;
  final String stationName;
  final Function()? showMoreAction;
  const ConsultationCardWidget({
    super.key,
    required this.type,
    required this.doneAt,
    required this.price,
    required this.stationName,
    required this.consultationId,
    this.showMoreAction,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          color: AppColors.colorWhite,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: AppColors.colorBlack.withOpacity(0.1),
              blurRadius: 4.0,
              spreadRadius: 1.0,
              offset: const Offset(0.0, 0.0),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  consultationSvgPath(type),
                  color: AppColors.colorGray,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  //location icon and title
                  Row(
                    children: [
                      const Icon(
                        Icons.place,
                        size: 12,
                        color: AppColors.colorGrayDark,
                      ),
                      Text(
                        stationName, //"Garaj Ahmed"
                        style: const TextStyle(
                            fontSize: 12, color: AppColors.colorGrayDark),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: width / 3,
                    child: Text(
                      consultationTitle(type),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    "$price MAD",
                    style: const TextStyle(
                        color: AppColors.colorGrayDark,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                ]),
              ],
            ),
            SizedBox(
              height: 77,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.watch_later_outlined,
                        size: 12,
                        color: AppColors.colorGrayDark,
                      ),
                      Text(
                        doneAt.split(" ")[0], //"21-12-2022"
                        style: const TextStyle(
                            fontSize: 12, color: AppColors.colorGrayDark),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      showMoreAction!();
                    },
                    child: SizedBox(
                      width: width / 4,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Voir plus',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: AppColors.colorYellow,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Icon(
                            Icons.chevron_right_rounded,
                            size: 24.0,
                            color: AppColors.colorYellow,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
