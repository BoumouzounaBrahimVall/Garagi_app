import 'package:flutter/material.dart';
import 'package:garagi_app/provider/car_form_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../widgets/form/text_form_with_label_widget.dart';
import '../../../../../widgets/step_infos_item.dart';

class StepFormClient extends StatefulWidget {
  const StepFormClient({Key? key}) : super(key: key);

  @override
  _StepFormVoitureState createState() => _StepFormVoitureState();
}

class _StepFormVoitureState extends State<StepFormClient> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StepInfosItem(stepNumber: '02', stepTitle: 'Saisi Infos Client'),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/car-icon.png',
              fit: BoxFit.cover,
              width: 100,
            ),
          ],
        ),
        const SizedBox(height: 16),
        TextFormWithLabelWidget(
          label: 'Selectionner Client',
          placeholder: 'Tapez Client',
          controller: TextEditingController(
              text: context.watch<CarFormProvider>().getFormCarModel.ownerId),
          onChanged: (value) {
            context.read<CarFormProvider>().setClientId(value);
          },
          validator: () => null,
        ),
      ],
    );
  }
}
