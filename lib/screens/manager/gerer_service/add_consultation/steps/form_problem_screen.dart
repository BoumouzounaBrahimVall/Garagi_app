import 'package:flutter/material.dart';
import 'package:garagi_app/data/car_data.dart';

import '../../../../../domain/models/car_details_model.dart';
import '../../../../../provider/consultation_form_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../widgets/step_infos_item.dart';

class FormProblemScreen extends StatefulWidget {
  const FormProblemScreen({Key? key}) : super(key: key);

  @override
  _FormProblemScreenState createState() => _FormProblemScreenState();
}

class _FormProblemScreenState extends State<FormProblemScreen> {
  // [];

  bool containsProblem(int id, List<Problem> realSelectedProblems) {
    if (realSelectedProblems.where((element) => element.id == id).isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    List<Problem> realSelectedProblems =
        context.watch<ConsultationFormProvider>().form.problems ?? [];
    return SingleChildScrollView(
      child: Column(children: [
        const StepInfosItem(stepNumber: '02', stepTitle: 'Choisir Problems'),
        const SizedBox(height: 16),
        Text(
          'Veuillez selectionnez depuis la liste des problem decouvert',
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
              itemCount: problems.length,
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
                        problems[index].description,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      value: containsProblem(
                              problems[index].id, realSelectedProblems)
                          ? true
                          : false,
                      onChanged: (value) {
                        setState(() {
                          if (value!) {
                            debugPrint(value.toString());
                            context
                                .read<ConsultationFormProvider>()
                                .addProblem(problems[index].id);

                            setState(() {
                              realSelectedProblems.add(problems[index]);
                              // print(realSelectedHobbies);
                            });
                            // ignore: avoid_print
                            print('addr');
                          } else {
                            context
                                .read<ConsultationFormProvider>()
                                .removeProblem(problems[index].id);

                            setState(() {
                              realSelectedProblems.remove(problems[index]);
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
