import 'package:flutter/material.dart';
import 'package:garagi_app/screens/layout/secondary_layout_screen.dart';
import 'package:provider/provider.dart';

import '../../../provider/consultation_service_provider.dart';
import '../../../widgets/button_primary_widget.dart';
import '../../../widgets/form/text_form_search_widget.dart';

class GererServiceScreen extends StatefulWidget {
  const GererServiceScreen({
    super.key,
  });
  @override
  State<GererServiceScreen> createState() => _GererServiceScreenState();
}

class _GererServiceScreenState extends State<GererServiceScreen> {
  bool showCreateButton = true;
  FocusNode focusNode = FocusNode();
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ConsultationServiceProvider>().getConsultations();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        SingleChildScrollView(
          padding: const EdgeInsets.all(8),
          child: Consumer<ConsultationServiceProvider>(
              builder: (context, clientService, child) {
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
                /* SizedBox(
                  height: height * 0.6,
                  child: ListView.separated(
                      itemBuilder: (context, index) => UserItemInfoWidget(
                          user: clientService.clients[index]),
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 16),
                      itemCount: clientService.clients.length),
                ),*/
                const SizedBox(height: 60),
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
                  title: 'Ajouter Client',
                  onPressed: () => {
                        /*  Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const AddClientScreen()))
                      */
                      }),
            ),
          ),
        )
      ],
    );
  }
}
