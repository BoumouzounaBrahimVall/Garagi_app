import 'package:flutter/material.dart';
import 'package:garagi_app/config/colors.dart';
import 'package:garagi_app/domain/models/car_model.dart';
import 'package:garagi_app/domain/models/user_model.dart';

import '../screens/manager/gerer_client/gerer_client_screen.dart';
import 'button_secondary_widget.dart';

class CarItemInfoWidget extends StatelessWidget {
  const CarItemInfoWidget({required this.car, Key? key}) : super(key: key);
  final CarModel car;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(8),
      width: width * 0.95,
      decoration: BoxDecoration(
        color: AppColors.colorWhite,
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 189, 189, 189).withOpacity(0.1),
            spreadRadius: 4,
            blurRadius: 2,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
        //border: OutlineInputBorder(),
        border: Border.all(
          color: Color(0xffECECEC), // Color of the border
          width: 1, // Width of the border
        ),

        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset('assets/icons/car-icon.png'),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    car.carTitle ?? '',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: 4),
                  Text(
                    car.matricule ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .merge(TextStyle(color: AppColors.colorGrayDark)),
                  )
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PopupMenuButton(
                  icon: Icon(Icons.more_horiz,
                      size: 18, color: AppColors.colorBlack.withOpacity(0.5)),

                  // add icon, by default "3 dot" icon
                  // icon: Icon(Icons.book)
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem<int>(
                        value: 0,
                        child: Text("My Account"),
                      ),
                      PopupMenuItem<int>(
                        value: 1,
                        child: Text("Settings"),
                      ),
                      PopupMenuItem<int>(
                        value: 2,
                        child: Text("Logout"),
                      ),
                    ];
                  },
                  onSelected: (value) {
                    if (value == 0) {
                      print("My account menu is selected.");
                    } else if (value == 1) {
                      print("Settings menu is selected.");
                    } else if (value == 2) {
                      print("Logout menu is selected.");
                    }
                  }),
              Row(
                children: [
                  Icon(
                    Icons.access_time_rounded,
                    color: AppColors.colorBlack.withOpacity(0.5),
                    size: 14,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    car.dateCreation ?? '',
                    style: Theme.of(context).textTheme.bodySmall!.merge(
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w100)),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
