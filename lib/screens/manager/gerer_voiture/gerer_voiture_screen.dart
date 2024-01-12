import 'package:flutter/material.dart';
import 'package:garagi_app/domain/models/car_model.dart';
import 'package:garagi_app/provider/car_service_provider.dart';
import 'package:garagi_app/widgets/car_item_info_widget.dart';
import 'package:provider/provider.dart';

import '../../../widgets/button_primary_widget.dart';
import '../../../widgets/form/text_form_search_widget.dart';
import 'add_voiture/add_voiture_screen.dart';

class GererVoitureScreen extends StatefulWidget {
  const GererVoitureScreen({
    super.key,
  });
  @override
  State<GererVoitureScreen> createState() => _GererVoitureScreenState();
}

class _GererVoitureScreenState extends State<GererVoitureScreen> {
  final CarModel car = CarModel(
      carId: '1',
      matricule: '2456AA12',
      carTitle: 'Audi Rs1',
      dateCreation: '12/12/2021');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<CarServiceProvider>(context, listen: false)
        .fetchCarsByManager();
  }

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
                "Gérer voiture",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 16),
              TextFormSearchWidget(
                icon: Icons.search,
                label: 'chercher voiture',
                placeholder: 'tapez un mot',
                validator: () => null,
                onChanged: (value) {},
              ),
              const SizedBox(height: 32),
              Text(
                "Liste voiture",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: height * 0.6,
                child: ListView.separated(
                    itemBuilder: (context, index) =>
                        CarItemInfoWidget(car: car),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16),
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
              title: 'Ajouter Voiture',
              onPressed: () => {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AddVoitureScreen()))
                  }),
        )
      ],
    );
  }
}
