import 'package:flutter/material.dart';
import '../../../config/colors.dart';
import '../../../screens/client/parameters/parameters_screen.dart';
import '../../../screens/client/reservations/reservations_screen.dart';
import '../../../screens/client/stations/stations_screen.dart';
import '../../../screens/client/car_finder/car_finder_widget.dart';
import '../../../widgets/app_bar/primary_appbar_widget.dart';
import '../../../widgets/model_bottom_sheet_widget.dart';

class ClientHomeScreen extends StatefulWidget {
  const ClientHomeScreen({super.key});

  @override
  State<ClientHomeScreen> createState() => _ClientHomeScreenState();
}

class _ClientHomeScreenState extends State<ClientHomeScreen> {
  final List<Widget> _screens = [
    const CarFinderWidget(),
    const StationsScreen(),
    const ReservationScreen(),
    const ParametersScreen(),
  ];
  Color iconColor = AppColors.colorGray;
  Color selectedIconColor = AppColors.colorYellow;
  int _currentIndex = 0;
  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _currentIndex != 1
          ? PrimaryAppBarWidget(
              onPressedMore: () {
                modalBottomSheetWidget(context,
                    initialChildSize: 0.8,
                    maxChildSize: 0.9,
                    minChildSize: 0.5,
                    child: const SizedBox(
                      height: 200,
                    ));
                //modalBottomSheetWidget
              },
              horizontalPadding: 8)
          : null,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: _screens[_currentIndex],
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.fromLTRB(42, 0, 10, 24),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 1),
            )
          ],
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
                  _currentIndex == 0 ? selectedIconColor : Colors.transparent,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: selectedIconColor
                      .withOpacity(_currentIndex == 0 ? 0.6 : 0),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 1),
                )
              ],
            ),
            child: IconButton(
              iconSize: 32,
              icon: Icon(
                Icons.home_rounded,
                color: _currentIndex == 0 ? Colors.white : iconColor,
              ),
              onPressed: () {
                _onTabTapped(0);
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
                  _currentIndex == 1 ? selectedIconColor : Colors.transparent,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: selectedIconColor
                      .withOpacity(_currentIndex == 1 ? 0.6 : 0),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 1),
                )
              ],
            ),
            child: IconButton(
              iconSize: 32,
              icon: Icon(
                Icons.map_rounded,
                color: _currentIndex == 1 ? Colors.white : iconColor,
              ),
              onPressed: () {
                _onTabTapped(1);
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
                  _currentIndex == 2 ? selectedIconColor : Colors.transparent,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: selectedIconColor
                      .withOpacity(_currentIndex == 2 ? 0.6 : 0),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 1),
                )
              ],
            ),
            child: IconButton(
              iconSize: 32,
              icon: Icon(
                Icons.newspaper_rounded,
                color: _currentIndex == 2 ? Colors.white : iconColor,
              ),
              onPressed: () {
                _onTabTapped(2);
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
                  _currentIndex == 3 ? selectedIconColor : Colors.transparent,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: selectedIconColor
                      .withOpacity(_currentIndex == 3 ? 0.6 : 0),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 1),
                )
              ],
            ),
            child: IconButton(
              iconSize: 32,
              icon: Icon(
                Icons.settings,
                color: _currentIndex == 3 ? Colors.white : iconColor,
              ),
              onPressed: () {
                _onTabTapped(3);
              },
            ),
          ),
        ]),
      ),
    );
  }
}
