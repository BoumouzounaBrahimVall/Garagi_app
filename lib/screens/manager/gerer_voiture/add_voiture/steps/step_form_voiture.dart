import 'package:flutter/material.dart';
import 'package:garagi_app/provider/car_form_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../widgets/form/text_form_with_label_widget.dart';
import '../../../../../widgets/step_infos_item.dart';

class StepFormVoiture extends StatefulWidget {
  const StepFormVoiture({Key? key}) : super(key: key);

  @override
  _StepFormVoitureState createState() => _StepFormVoitureState();
}

class _StepFormVoitureState extends State<StepFormVoiture> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StepInfosItem(stepNumber: '01', stepTitle: 'Saisi Infos voiture'),
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
          label: 'Marque',
          placeholder: 'Tapez Marque',
          controller: TextEditingController(
              text: context.watch<CarFormProvider>().getFormCarModel.marque),
          onChanged: (value) {
            context.read<CarFormProvider>().setMarque(value);
          },
          validator: () => null,
        ),
        const SizedBox(height: 16),
        TextFormWithLabelWidget(
          label: 'Modele',
          placeholder: 'Tapez Modele',
          controller: TextEditingController(
              text: context.watch<CarFormProvider>().getFormCarModel.modele),
          onChanged: (value) {
            context.read<CarFormProvider>().setModele(value);
          },
          validator: () => null,
        ),
        const SizedBox(height: 16),
        TextFormWithLabelWidget(
          label: 'Immatriculation',
          placeholder: 'Tapez Immatriculation',
          controller: TextEditingController(
              text: context
                  .watch<CarFormProvider>()
                  .getFormCarModel
                  .immatriculation),
          onChanged: (value) {
            context.read<CarFormProvider>().setImmatriculation(value);
          },
          validator: () => null,
        ),
        const SizedBox(height: 16),
        TextFormWithLabelWidget(
          label: 'Anneé',
          placeholder: 'Tapez Anneé',
          controller: TextEditingController(
              text: context.watch<CarFormProvider>().getFormCarModel.annee),
          onChanged: (value) {
            context.read<CarFormProvider>().setAnnee(value);
          },
          validator: () => null,
        )
      ],
    );
  }
}
