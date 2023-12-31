import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../config/colors.dart';
import '../../screens/manager/gerer_voiture/details_voiture_screen.dart';

class ListTileWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final SvgPicture svgPicture;

  const ListTileWidget({
    required this.title,
    required this.subtitle,
    required this.svgPicture,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.colorWhite,
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 5.0,
        shadowColor: Color.fromARGB(255, 228, 230, 248),
        child: ListTile(
          contentPadding: EdgeInsets.all(10),
          leading: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.colorYellowLight,
            ),
            child: svgPicture,
          ),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(
              fontSize: 14,
              color: AppColors.colorGrayDark,
            ),
          ),
          trailing: Icon(Icons.more_vert),
          onTap: () {
             Navigator.push(context, MaterialPageRoute(builder:(context)=>DetailsVoitureScreen() ));
          },
        ),
      ),
    );
  }
}