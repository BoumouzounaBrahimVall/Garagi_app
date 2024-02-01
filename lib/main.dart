import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:garagi_app/domain/services/auth/auth_token_service.dart';
//import 'package:flutter_localizations/flutter_localizations.dart';
//import 'package:flutter_gen/gen_l10n/app_localizations.dart';
//import 'package:garagi_app/domain/services/client/cars/get_client_cars_details.dart';
import 'package:garagi_app/provider/client_form_provider.dart';
import 'package:garagi_app/provider/reservation_from_provider.dart';
import 'package:provider/provider.dart';

import '../config/app_routes.dart';
//import '../l10n/l10n.dart';
//import '../provider/local_provider.dart';
import '../domain/change_notifiers/auth_model.dart';
import 'config/theme.dart';
import 'provider/car_form_provider.dart';
import 'provider/car_service_provider.dart';
import 'provider/client_service_provider.dart';
import 'provider/consultation_form_provider.dart';
import 'provider/consultation_service_provider.dart';
import 'provider/reservation_model_provider.dart';

//    _____                           _____    _
//   / ____|                         / ____|  |_|
//   | |  __    __ _   _ __    __ _  | |  __   _
//   | | |_ |  / _` | | '__|  / _` | | | |_ | | |
//   | |__| | | (_| | | |    | (_| | | |__| | | |
//    \_____|  \__,_| |_|     \__,_|  \_____| |_|

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthModel()),
        ChangeNotifierProvider(
          create: (_) => ClientFormProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CarFormProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CarServiceProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ClientServiceProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ConsultationServiceProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ConsultationFormProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ReservationFormProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ReservationModelProvider(),
        )
      ],
      child: const MyApp(),
    ),
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //   statusBarColor: Colors.black12,
  //   statusBarIconBrightness: Brightness.dark,
  // ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      initialRoute: '/',
      routes: appRoutes,
      /* locale: provider.locale,
              supportedLocales: L10n.allLocales,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],*/
    );
  }
}
