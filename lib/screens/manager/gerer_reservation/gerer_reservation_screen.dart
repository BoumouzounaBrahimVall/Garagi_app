import 'package:flutter/material.dart';
import 'package:garagi_app/provider/reservation_model_provider.dart';
import 'package:provider/provider.dart';

import '../../../config/colors.dart';
import '../../../widgets/reservation_item_edit_widget.dart';

class GererReservationScreen extends StatefulWidget {
  const GererReservationScreen({super.key});

  @override
  State<GererReservationScreen> createState() => _GererReservationScreenState();
}

class _GererReservationScreenState extends State<GererReservationScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ReservationModelProvider>().fetchReservations();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(8),
      child: Consumer<ReservationModelProvider>(
          builder: (context, reservationModel, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Gérer reservation",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20, left: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  spacing: 10.0, //
                  children: <Widget>[
                    ...reservationModel.categories.map(
                      (choice) {
                        return GestureDetector(
                          onTap: () {
                            if (choice.index == 0) {
                              // index 0 is for all categories
                              reservationModel.setFiltredReservations(
                                  reservationModel.reservations);
                            } else {
                              // indexs 1 to 3 are for all categories and needs -1 to be equal to enum indexs
                              reservationModel.setFiltredReservations(
                                  reservationModel.reservations
                                      .map((e) => e)
                                      .where((elem) =>
                                          elem.status!.index ==
                                          choice.index - 1)
                                      .toList());
                            }
                            setState(() {
                              for (var element in reservationModel.categories) {
                                element.isSelected = false;
                              }
                              choice.isSelected = true;
                            });
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                color: choice.isSelected
                                    ? AppColors.colorYellow
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                    color: AppColors.colorYellow, width: 2),
                              ),
                              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                              child: Text(
                                choice.name,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: choice.isSelected
                                        ? Colors.white
                                        : Colors.black),
                              )),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
            /*TextFormSearchStyled(
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
                ),*/
            const SizedBox(height: 32),
            Text(
              "Liste reservation",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: height * 0.6,
              child: ListView.separated(
                  itemBuilder: (context, index) => ReservationItemEditWidget(
                      reservation: reservationModel.filtredReservations[index]),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16),
                  itemCount: reservationModel.filtredReservations.length),
            ),
            const SizedBox(height: 60),
          ],
        );
      }),
    );
  }
}
