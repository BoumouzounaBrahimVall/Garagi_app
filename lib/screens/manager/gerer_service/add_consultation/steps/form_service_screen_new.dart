import 'package:flutter/material.dart';
import 'package:garagi_app/data/car_data.dart';

import '../../../../../domain/models/car_details_model.dart';
import '../../../../../provider/consultation_form_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../widgets/step_infos_item.dart';

class FormServiceScreenNew extends StatefulWidget {
  const FormServiceScreenNew({Key? key}) : super(key: key);

  @override
  _FormServiceScreenNewState createState() => _FormServiceScreenNewState();
}

class _FormServiceScreenNewState extends State<FormServiceScreenNew> {
  // List<Service> realSelectedServices = [];

  bool containsService(int id, List<Service> realSelectedServices) {
    if (realSelectedServices.where((element) => element.id == id).isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Service> realSelectedServices =
        context.watch<ConsultationFormProvider>().form.services ?? [];
    double height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Column(children: [
        const StepInfosItem(stepNumber: '03', stepTitle: 'Choisir Services'),
        const SizedBox(height: 16),
        Text(
          'Veuillez selectionnez depuis la liste des service decouvert',
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .merge(const TextStyle(color: Color(0xff3E3E3E))),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: height * 0.7,
          child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemCount: services.length,
              itemBuilder: (context, index) {
                return Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: CheckboxListTile(
                      checkColor: Colors.white,
                      activeColor: const Color(0xffEE9321),
                      checkboxShape: const CircleBorder(
                          side:
                              BorderSide(color: Color(0xffEE9321), width: 20)),
                      title: Text(
                        services[index].description,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      value: containsService(
                              services[index].id, realSelectedServices)
                          ? true
                          : false,
                      onChanged: (value) {
                        setState(() {
                          if (value!) {
                            debugPrint(value.toString());
                            context
                                .read<ConsultationFormProvider>()
                                .addService(services[index].id);

                            setState(() {
                              realSelectedServices.add(services[index]);
                              // print(realSelectedHobbies);
                            });
                            // ignore: avoid_print
                            print('addr');
                          } else {
                            context
                                .read<ConsultationFormProvider>()
                                .removeService(services[index].id);

                            setState(() {
                              realSelectedServices.remove(services[index]);
                            });
                            // ignore: avoid_print
                            print('remove');
                          }
                        });
                      },
                    ));
              }),
        ),
        const SizedBox(
          height: 200,
        )
      ]),
    );
  }
}
