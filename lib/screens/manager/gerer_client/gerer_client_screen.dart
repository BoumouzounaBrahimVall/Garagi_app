import 'package:flutter/material.dart';
import 'package:garagi_app/screens/manager/gerer_client/add_client_screen.dart';
import 'package:garagi_app/widgets/button_primary_widget.dart';

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
  UserModel user = UserModel(
      id: 1,
      name: 'John Doe',
      email: 'jhon@doe.com',
      dateCreation: '12/12/2021',
      phoneNumber: '1234567890');
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        SingleChildScrollView(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Gérer client",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 16),
              TextFormSearchWidget(
                icon: Icons.search,
                label: 'chercher client',
                placeholder: 'tapez un mot',
                validator: () => null,
                onChanged: (value) {},
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
                    itemBuilder: (context, index) =>
                        UserItemInfoWidget(user: user),
                    separatorBuilder: (context, index) => SizedBox(height: 16),
                    itemCount: 10),
              ),
              const SizedBox(height: 60),
            ],
          ),
        ),
        Positioned(
          bottom: 10,
          left: width * 0.025,
          child: ButtonPrimaryWidget(
              title: 'Ajouter Client',
              onPressed: () => {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AddClientScreen()))
                  }),
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
