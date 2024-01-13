import 'package:flutter/material.dart';
import 'package:garagi_app/screens/manager/home/manager_home_screen.dart';
import '../screens/login/login_screen.dart';
import '../screens/client/home/client_home_screen.dart';
//import '../screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) =>
      const ClientHomeScreen(), //HomeScreen(),SplashScreen(),ClientHomeScreen
  '/home': (context) => const ManagerHomeScreen(), //HomeScreen(),
  '/login': (context) => const SigninScreen(),
};
