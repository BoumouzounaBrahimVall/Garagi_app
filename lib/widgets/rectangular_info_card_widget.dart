import 'package:flutter/material.dart';
import '../../config/colors.dart';

class RectangularInfoCardWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget svgPicture;
  final Function? onTap;
  const RectangularInfoCardWidget(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.svgPicture,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
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
      child: ListTile(
        contentPadding: const EdgeInsets.all(5),
        leading: Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.colorYellowLight,
          ),
          child: svgPicture,
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
            fontSize: 16,
            color: AppColors.colorGrayDark,
          ),
        ),
        trailing: const Icon(Icons.more_vert),
        onTap: () {
          if (onTap != null) {
            onTap!();
          }
        },
      ),
    );
  }
}
