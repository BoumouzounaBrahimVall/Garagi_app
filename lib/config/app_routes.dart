import 'package:flutter/material.dart';
import 'package:garagi_app/screens/manager/home/manager_home_screen.dart';
import 'package:garagi_app/screens/splash/splash_screen.dart';
import '../screens/login/login_screen.dart';
import '../screens/client/home/client_home_screen.dart';
//import '../screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) =>
      const SplashScreen(), //HomeScreen(),SplashScreen(),ClientHomeScreen
  '/manager': (context) => const ManagerHomeScreen(), //HomeScreen(),
  '/client': (context) => const ClientHomeScreen(), //HomeScreen(),
  '/login': (context) => const SigninScreen(),
};
