import 'package:flutter/material.dart';
import 'package:garagi_app/provider/client_form_provider.dart';
import 'package:provider/provider.dart';

import '../../../domain/models/form_client_model.dart';
import '../../../provider/client_service_provider.dart';
import '../../../widgets/button_primary_widget.dart';
import '../../../widgets/form/text_form_with_label_widget.dart';
import '../../layout/secondary_layout_screen.dart';

class AddClientScreen extends StatefulWidget {
  const AddClientScreen({super.key});

  @override
  _AddClientScreenState createState() => _AddClientScreenState();
}

class _AddClientScreenState extends State<AddClientScreen> {
  @override
  Widget build(BuildContext context) {
    //double height = MediaQuery.of(context).size.height;
    String messageStatus = context.watch<ClientServiceProvider>().messageStatus;
    double width = MediaQuery.of(context).size.width;
    return SecondaryLayoutScreen(
        appBarTitle: "Ajouter un client",
        body: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Saisi Infos client",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icons/user-avatat-icon.png',
                        fit: BoxFit.cover,
                        width: 100,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  TextFormWithLabelWidget(
                    label: 'Nom',
                    placeholder: 'Nom',
                    controller: TextEditingController(
                        text: context
                            .watch<ClientFormProvider>()
                            .getFormClientModel
                            .nom),
                    icon: Icons.person,
                    onChanged: (value) {
                      context.read<ClientFormProvider>().setNom(value);
                    },
                    validator: () => null,
                  ),
                  const SizedBox(height: 16),
                  TextFormWithLabelWidget(
                    label: 'Prenom',
                    placeholder: 'Prenom',
                    icon: Icons.person,
                    validator: () => null,
                    controller: TextEditingController(
                        text: context
                            .watch<ClientFormProvider>()
                            .getFormClientModel
                            .prenom),
                    onChanged: (value) {
                      context.read<ClientFormProvider>().setPrenom(value);
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormWithLabelWidget(
                    label: 'Email',
                    placeholder: 'Email',
                    icon: Icons.mail,
                    validator: () => null,
                    controller: TextEditingController(
                        text: context
                            .watch<ClientFormProvider>()
                            .getFormClientModel
                            .email),
                    onChanged: (value) {
                      context.read<ClientFormProvider>().setEmail(value);
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormWithLabelWidget(
                      label: 'Telephone',
                      placeholder: '06 xx xx xx xx',
                      icon: Icons.call,
                      validator: () => null,
                      controller: TextEditingController(
                          text: context
                              .watch<ClientFormProvider>()
                              .getFormClientModel
                              .phone),
                      onChanged: (value) {
                        context.read<ClientFormProvider>().setPhone(value);
                      }),
                  const SizedBox(height: 100),
                ],
              ),
            ),
            Positioned(
              bottom: 10,
              left: width * 0.05,
              child: ButtonPrimaryWidget(
                  title: 'Enregistrer',
                  onPressed: () {
                    FormClientModel form =
                        context.read<ClientFormProvider>().getFormClientModel;

                    context.read<ClientServiceProvider>().createClient(form);
                    context
                        .read<ClientFormProvider>()
                        .setFormClientModel(FormClientModel());
                    debugPrint('Client ${form.toJson()}');
                  }),
            )
          ],
        ));
  }
}
