import 'package:flutter/material.dart';
import 'package:garagi_app/screens/login/login_screen.dart';
import 'package:garagi_app/screens/main/home/home_screen.dart';
import 'package:garagi_app/screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => const SplashScreen(), //HomeScreen(),
  '/home': (context) => const HomeScreen(), //HomeScreen(),
  '/login': (context) => const SigninScreen(),
};
