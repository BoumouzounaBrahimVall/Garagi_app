import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:garagi_app/screens/manager/gerer_voiture/details_voiture_screen.dart';
import 'package:garagi_app/widgets/screen_transitions_widget.dart';

import '../../../config/colors.dart';
import '../../../widgets/rectangular_info_card_widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({
    super.key,
  });
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.colorWhite,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'search',
                contentPadding: EdgeInsets.all(10),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      width: 1,
                    )),
              ),
            ),
          ),
          const Text(
            'Liste Voitures',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
            ),
          ),
          Expanded(
              child: ListView(
            padding: const EdgeInsets.all(4),
            children: List.generate(
                6,
                (index) => RectangularInfoCardWidget(
                      onTap: () {
                        Navigator.of(context).push(
                            SlideLeftRouteWidget(const DetailsVoitureScreen()));
                      },
                      title: 'Audi RS${index + 1}',
                      subtitle: '2456AA${index + 1}',
                      svgPicture: SvgPicture.asset(
                        'assets/svg/car.svg',
                        color: AppColors.colorYellow,
                      ),
                    )),
          ))
        ],
      ),
    );
  }
}
