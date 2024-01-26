import 'package:flutter/material.dart';
import 'package:garagi_app/config/colors.dart';
import 'package:garagi_app/provider/car_form_provider.dart';
import 'package:garagi_app/provider/car_service_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../widgets/drop_down_menu_widget.dart';
import '../../../../../widgets/step_infos_item.dart';

class StepFormClient extends StatefulWidget {
  const StepFormClient({Key? key}) : super(key: key);

  @override
  _StepFormVoitureState createState() => _StepFormVoitureState();
}

class _StepFormVoitureState extends State<StepFormClient> {
  void _onSelectedValue(String value) {
    List<String> values = value.split(' ');
    context.read<CarFormProvider>().setClientId(values[0]);
  }

  @override
  void initState() {
    super.initState();
    context.read<CarServiceProvider>().getFakeClients();
  }

  @override
  Widget build(BuildContext context) {
    bool isLoading = context.watch<CarServiceProvider>().isLoading;
    return !isLoading
        ? Column(
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selectionner Client',
                    style: Theme.of(context).textTheme.bodyMedium!.merge(
                        const TextStyle(
                            color: Color(0xff222222),
                            fontWeight: FontWeight.w700,
                            fontSize: 20)),
                  ),
                  const SizedBox(height: 16),
                  DropdownMenuWidget(
                    list: context.watch<CarServiceProvider>().clients.map((e) {
                      return '${e.id} ${e.fullName!}';
                    }).toList(),
                    onSelectedValue: _onSelectedValue,
                  ),
                ],
              )
            ],
          )
        : const Center(
            child: CircularProgressIndicator(color: AppColors.colorOrange));
  }
}
