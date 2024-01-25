import 'package:flutter/material.dart';
import 'package:garagi_app/screens/manager/gerer_service/add_consultation/add_consultation_screen.dart';
import 'package:garagi_app/widgets/consultation_item_info_widget.dart';
import 'package:provider/provider.dart';

import '../../../provider/consultation_service_provider.dart';
import '../../../widgets/button_primary_widget.dart';
import '../../../widgets/form/text_form_search_widget.dart';

class GererConsultationScreen extends StatefulWidget {
  const GererConsultationScreen({
    super.key,
  });
  @override
  State<GererConsultationScreen> createState() =>
      _GererConsultationScreenState();
}

class _GererConsultationScreenState extends State<GererConsultationScreen> {
  bool showCreateButton = true;
  FocusNode focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    context.read<ConsultationServiceProvider>().getConsultations();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    //  double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        SingleChildScrollView(
          padding: const EdgeInsets.all(8),
          child: Consumer<ConsultationServiceProvider>(
              builder: (context, consultationService, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Gérer consultation",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 16),
                TextFormSearchStyled(
                  icon: Icons.search,
                  label: 'chercher consultation',
                  placeholder: 'tapez un mot',
                  validator: () => null,
                  focusNode: focusNode,
                  action: () {
                    setState(() {
                      showCreateButton = false;
                    });
                  },
                  onTapOutside: () {
                    setState(() {
                      showCreateButton = true;
                    });
                  },
                  onChanged: (value) {
                    debugPrint(value);
                    // context.read<ClientServiceProvider>().filterClients(value);

                    //filterCars
                  },
                ),
                const SizedBox(height: 32),
                Text(
                  "Liste consultations",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: height * 0.6,
                  child: ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) =>
                          ConsultationItemInfoWidget(
                              consultation:
                                  consultationService.consultations[index]),
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 16),
                      itemCount: consultationService.consultations.length),
                ),
                const SizedBox(height: 50),
              ],
            );
          }),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Visibility(
            visible: showCreateButton,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: ButtonPrimaryWidget(
                  title: 'Ajouter Consultation',
                  onPressed: () => {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                const AddConsultationScreen()))
                      }),
            ),
          ),
        )
      ],
    );
  }
}
