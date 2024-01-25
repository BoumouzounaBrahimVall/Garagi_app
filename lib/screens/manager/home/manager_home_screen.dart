import 'package:flutter/material.dart';
import 'package:garagi_app/screens/manager/dashboard/dashboard_screen.dart';
import '../gerer_service/gerer_consultation_screen.dart';
import '/screens/manager/gerer_client/gerer_client_screen.dart';
import '/screens/manager/gerer_voiture/gerer_voiture_screen.dart';
import '/widgets/app_bar/secondary_appbar_widget.dart';
import '/config/colors.dart';

import '/widgets/model_bottom_sheet_widget.dart';

class ManagerHomeScreen extends StatefulWidget {
  const ManagerHomeScreen({super.key});

  @override
  State<ManagerHomeScreen> createState() => _ManagerHomeScreenState();
}

class _ManagerHomeScreenState extends State<ManagerHomeScreen> {
  final List<Widget> _screens = [
    const DashboardScreen(),
    const GererClientScreen(),
    const GererConsultationScreen(),
    const GererVoitureScreen(),
  ];
  Color iconColor = AppColors.colorGray;
  Color selectedIconColor = AppColors.colorYellow;
  int _currentIndex = 0;
  late var scaffoldKey;

  @override
  void initState() {
    scaffoldKey = GlobalKey<ScaffoldState>();

    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: scaffoldKey,
      drawerScrimColor: Colors.black38,
      appBar: SecondaryAppBarWidget(
          leftIcon: Container(
            width: 52,
            height: 52,
            decoration: const ShapeDecoration(
              color: AppColors.colorYellowLight,
              shape: CircleBorder(),
            ),
            child: const Icon(
              Icons.list_rounded,
              color: AppColors.colorYellow,
              size: 40,
            ),
          ),
          onPressedBack: () {
            scaffoldKey.currentState?.openDrawer();
          },
          onPressedMore: () {
            modalBottomSheetWidget(context,
                initialChildSize: 0.8,
                maxChildSize: 0.9,
                minChildSize: 0.5,
                child: SizedBox(
                  height: 200,
                  width: width,
                ));
            //modalBottomSheetWidget
          },
          horizontalPadding: 8),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 20, 10.0, 0),
        child: _screens[_currentIndex],
      ),
      drawer: Drawer(
        width: width * 0.9,
        elevation: 2,
        backgroundColor: AppColors.colorBlack,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.22, 0.98),
              end: Alignment(-0.22, -0.98),
              colors: [Color.fromRGBO(254, 200, 20, 1), AppColors.colorOrange],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: height * 0.8,
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  // Important: Remove any padding from the ListView.
                  padding: const EdgeInsets.only(top: 80, left: 24, right: 24),
                  children: [
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColors.colorWhite,
                          radius: 50,
                          child: Icon(
                            Icons.person,
                            size: 70,
                            color: AppColors.colorYellow,
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          "Hamza El Idrissi",
                          style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: AppColors.colorWhite),
                        ),
                        Text(
                          "Manager",
                          style: TextStyle(
                            fontSize: 18.0,
                            color: AppColors.colorWhite,
                          ),
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                      ],
                    ),
                    myListTile(0, "Dashboard", Icons.dashboard_rounded),
                    myListTile(1, "Gerer Clients", Icons.person),
                    myListTile(
                        2, "Gerer Consultation", Icons.home_repair_service),
                    myListTile(3, "Gerer Voitures", Icons.car_repair_rounded),
                    myListTile(3, "À propos de Garaggi", Icons.info_outline),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, bottom: 40),
                child: ListTile(
                  horizontalTitleGap: 0,
                  minVerticalPadding: 2,
                  dense: true,
                  trailing: const Icon(
                    Icons.exit_to_app_rounded,
                    size: 24,
                    color: AppColors.colorWhite,
                  ),
                  title: const Text(
                    "Déconnexion",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.colorWhite),
                  ),
                  contentPadding: EdgeInsets.zero,
                  selectedColor: AppColors.colorYellow,
                  onTap: () {
                    // Update the state of the app
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget myListTile(int index, String title, IconData icon) {
    return Column(
      children: [
        ListTile(
          horizontalTitleGap: 0,
          minVerticalPadding: 2,
          dense: true,
          leading: Icon(
            icon,
            size: 24,
            color: AppColors.colorWhite,
          ),
          title: Text(
            title,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.colorWhite),
          ),
          contentPadding: EdgeInsets.zero,
          selected: _currentIndex == index,
          selectedColor: AppColors.colorYellow,
          onTap: () {
            // Update the state of the app
            _onItemTapped(index);
            // Then close the drawer
            Navigator.pop(context);
          },
        ),
        const Divider(color: AppColors.colorWhite),
      ],
    );
  }
}
