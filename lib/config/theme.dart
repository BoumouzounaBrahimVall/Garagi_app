import 'package:flutter/material.dart';

import 'colors.dart';
import 'constants.dart';

var themeData = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  fontFamily: AppConstants.primaryTypeFace,
  splashColor: AppColors.colorBlueLight1,
  highlightColor: Colors.transparent,
  scaffoldBackgroundColor: AppColors.colorWhite,
  primaryColor: const Color(0xFF0B0909),
  primarySwatch: Colors.grey,
  iconTheme: IconThemeData(
    color: Color(0xFFFFFFFF),
  ),
  hintColor: const Color(0xFFD6D6D6),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      fontFamily: AppConstants.primaryTypeFace,
      color: Color(0xFF0B0909),
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    displayMedium: TextStyle(
      fontFamily: AppConstants.primaryTypeFace,
      color: Color.fromARGB(255, 8, 8, 8),
      fontSize: 16,
    ),
    titleMedium: TextStyle(
      fontFamily: AppConstants.primaryTypeFace,
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w400,
    ),
    headlineSmall: const TextStyle(
        fontFamily: AppConstants.primaryTypeFace,
        color: AppColors.colorBlack,
        fontSize: 24,
        fontWeight: FontWeight.bold),
    titleSmall: TextStyle(
      fontFamily: AppConstants.primaryTypeFace,
      color: Color(0xFF777777),
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    headlineMedium: TextStyle(
      fontFamily: AppConstants.primaryTypeFace,
      color: Color(0xff222222),
      fontSize: 32,
      fontWeight: FontWeight.bold,
    ),
    displayLarge: TextStyle(
      fontFamily: AppConstants.primaryTypeFace,
      color: Color.fromARGB(255, 17, 17, 17),
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
    bodySmall: TextStyle(
      fontFamily: AppConstants.primaryTypeFace,
      color: Color.fromARGB(255, 19, 19, 19),
      fontSize: 14,
      fontWeight: FontWeight.w100,
      height: 1.5,
    ),
    labelSmall: TextStyle(
        fontFamily: AppConstants.primaryTypeFace,
        color: Color.fromARGB(255, 255, 255, 255),
        fontSize: 14,
        fontWeight: FontWeight.w200,
        height: 1.5),
    displaySmall: TextStyle(
      fontFamily: AppConstants.primaryTypeFace,
      color: Colors.grey,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 1.5,
    ),
    labelMedium: TextStyle(
      color: Color(0xFFD6D6D6),
      fontSize: 16,
    ),
  ),
);
