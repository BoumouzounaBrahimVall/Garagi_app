import 'package:flutter/material.dart';
import 'package:garagi_app/provider/client_service_provider.dart';
import 'package:garagi_app/screens/manager/gerer_client/add_client_screen.dart';
import 'package:garagi_app/widgets/button_primary_widget.dart';
import 'package:provider/provider.dart';

import '../../../widgets/form/text_form_search_widget.dart';
import '../../../widgets/user_item_info_widget.dart';

class GererClientScreen extends StatefulWidget {
  const GererClientScreen({
    super.key,
  });
  @override
  State<GererClientScreen> createState() => _GererClientScreenState();
}

class _GererClientScreenState extends State<GererClientScreen> {
  bool showCreateButton = true;
  @override
  void initState() {
    super.initState();
    context.read<ClientServiceProvider>().fetchClients();
  }

  FocusNode focusNode = FocusNode();

  /* UserModel user = UserModel(
      id: 1,
      name: 'John Doe',
      email: 'jhon@doe.com',
      dateCreation: '12/12/2021',
      phoneNumber: '1234567890');*/
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    // double keyboard = MediaQuery.of(context).viewInsets.bottom;

    return Stack(
      children: [
        SingleChildScrollView(
          padding: const EdgeInsets.all(8),
          child: Consumer<ClientServiceProvider>(
              builder: (context, clientService, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Gérer client",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 16),
                TextFormSearchStyled(
                  icon: Icons.search,
                  label: 'chercher client',
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
                    context.read<ClientServiceProvider>().filterClients(value);

                    //filterCars
                  },
                ),
                const SizedBox(height: 32),
                Text(
                  "Liste clients",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: height * 0.6,
                  child: ListView.separated(
                      itemBuilder: (context, index) => UserItemInfoWidget(
                          user: clientService.clients[index]),
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 16),
                      itemCount: clientService.clients.length),
                ),
                const SizedBox(height: 200),
              ],
            );
          }),
        ),
        Positioned(
          bottom: height * 0.05,
          left: 0,
          right: 0,
          child: Visibility(
            visible: showCreateButton,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: ButtonPrimaryWidget(
                  title: 'Ajouter Client',
                  onPressed: () => {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const AddClientScreen()))
                      }),
            ),
          ),
        )
      ],
    );
  }
}

class UserModel {
  UserModel(
      {this.id, this.name, this.email, this.dateCreation, this.phoneNumber});
  final int? id;
  final String? name;
  final String? email;
  final String? dateCreation;
  final String? phoneNumber;
}
