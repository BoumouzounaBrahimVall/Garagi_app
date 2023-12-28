import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:garagi_app/widgets/app_bar/secondary_appbar_widget.dart';

import '../../../config/colors.dart';

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
    return  Scaffold(
      backgroundColor: AppColors.colorGray,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                 hintText: 'search',
                contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        width: 1,
                      )
                    ),
              ),
              
            ),
          ),
          Text(
            'Liste Voitures',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
            ),
          ),
          Expanded(
            child: ListView(
              
              padding: const EdgeInsets.all(8),
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                         color: AppColors.colorWhite),
                  child: ListTile(   
                    contentPadding: EdgeInsets.all(10),    
                    leading: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.colorYellowLight),
                    child: SvgPicture.asset(
                      'assets/svg/car.svg',
                      color: AppColors.colorYellow,
                    ),
                    ),
                    title: Text('Audi RS3',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),),
                    subtitle: Text('2456AA12',
                    style: TextStyle(
                        fontSize: 14,
                        color: AppColors.colorGrayDark,
                        
                    ),),
                    trailing: Icon(Icons.more_horiz),
                  ),
                  
                ),
                  Container(
                  margin: EdgeInsets.all(10),
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                         color: AppColors.colorWhite),
                  child: ListTile(   
                    contentPadding: EdgeInsets.all(10),    
                    leading: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.colorYellowLight),
                    child: SvgPicture.asset(
                      'assets/svg/car.svg',
                      color: AppColors.colorYellow,
                    ),
                    ),
                    title: const Text('Audi RS3',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),),
                    subtitle: const Text('2456AA12',
                    style: TextStyle(
                        fontSize: 14,
                        color: AppColors.colorGrayDark,
                        
                    ),),
                    trailing: Icon(Icons.more_horiz),
                  ),
                  
                ),
                
              ],
            ),
          )
        ],
      ),
    );
  }
}
