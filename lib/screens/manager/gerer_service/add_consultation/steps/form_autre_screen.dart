import 'package:flutter/material.dart';
import 'package:garagi_app/data/car_data.dart';
import 'package:garagi_app/provider/consultation_form_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../widgets/drop_down_menu_widget.dart';
import '../../../../../widgets/form/text_form_with_label_widget.dart';
import '../../../../../widgets/step_infos_item.dart';

class FormAutreScreen extends StatefulWidget {
  const FormAutreScreen({Key? key}) : super(key: key);

  @override
  _FormAutreScreenState createState() => _FormAutreScreenState();
}

class _FormAutreScreenState extends State<FormAutreScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const StepInfosItem(stepNumber: '04', stepTitle: 'Autre Infos'),
          const SizedBox(height: 16),
          const SizedBox(height: 16),
          TextFormWithLabelWidget(
            label: 'Nom Reparrateur',
            placeholder: 'Nom Reparrateur',
            controller: TextEditingController(
                text: context
                    .watch<ConsultationFormProvider>()
                    .form
                    .repairerFullName),
            icon: Icons.person,
            onChanged: (value) {
              context
                  .read<ConsultationFormProvider>()
                  .setRepairerFullName(value);
            },
            validator: () => null,
          ),
          const SizedBox(height: 16),
          TextFormWithLabelWidget(
            label: 'Prix de service',
            placeholder: 'Prix de service',
            keyboardType: TextInputType.number,
            controller: TextEditingController(
                text: context
                    .watch<ConsultationFormProvider>()
                    .form
                    .price
                    .toString()),
            icon: Icons.money,
            onChanged: (value) {
              double price = double.parse(value);
              context.read<ConsultationFormProvider>().setPrice(price);
            },
            validator: () => null,
          ),
          const SizedBox(height: 16),
          Text(
            'Category',
            style: Theme.of(context).textTheme.bodyMedium!.merge(TextStyle(
                color: Color(0xff222222),
                fontWeight: FontWeight.w700,
                fontSize: 20)),
          ),
          SizedBox(height: 10),
          DropdownMenuWidget(
            list: categories,
            onSelectedValue: (value) {
              context.read<ConsultationFormProvider>().setGategory(value);
            },
          ),
        ],
      ),
    );
  }
}
