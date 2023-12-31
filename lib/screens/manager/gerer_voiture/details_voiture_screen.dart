import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:garagi_app/widgets/app_bar/primary_appbar_widget.dart';

import '../../../config/colors.dart';
import '../../../widgets/listTile/listiTle_widget.dart';

class DetailsVoitureScreen extends StatefulWidget {
  const DetailsVoitureScreen({
    super.key,
  });
  @override
  State<DetailsVoitureScreen> createState() => _DetailsVoitureScreenState();
}

class _DetailsVoitureScreenState extends State<DetailsVoitureScreen> {
  @override
  Widget build(BuildContext context) {
      double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return  Scaffold(
      appBar: const PrimaryAppBarWidget(horizontalPadding: 20),
      backgroundColor: AppColors.colorWhite,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                 hintText: 'search',
                contentPadding: const EdgeInsets.all(10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        width: 1,
                      )
                    ),
              ),
              
            ),
          ),
          const Text(
            'Liste Services',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
            ),
          ),
          Expanded(
                  child:ListView(
                      padding: const EdgeInsets.all(4),
                      children: List.generate(6, (index) => ListTileWidget(
                        title: 'Changement Filtre${index + 1}',
                        subtitle: '2456AA${index + 1}',
                        svgPicture: SvgPicture.asset(
                          'assets/svg/car.svg',
                          color: AppColors.colorYellow,
                        ),
                      )),
      )
          )
        ],
      ),
    );
  }
}
