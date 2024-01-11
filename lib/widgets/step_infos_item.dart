import 'package:flutter/material.dart';
import 'package:garagi_app/config/colors.dart';

class StepInfosItem extends StatelessWidget {
  const StepInfosItem(
      {required this.stepNumber, required this.stepTitle, super.key});
  final String stepNumber;
  final String stepTitle;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          height: 80,
          decoration: BoxDecoration(
              color: AppColors.colorWhite,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black, width: 2)),
          child: Text(stepNumber,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .merge(const TextStyle(color: Colors.black))),
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Etape ',
                style: Theme.of(context).textTheme.bodyMedium!.merge(
                    TextStyle(color: AppColors.colorBlack.withOpacity(0.5)))),
            SizedBox(height: 4),
            Text(stepTitle, style: Theme.of(context).textTheme.headlineMedium),
          ],
        )
      ],
    );
  }
}
