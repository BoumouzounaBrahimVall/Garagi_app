import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../config/app_routes.dart';
import '../config/colors.dart';
import '../config/constants.dart';
import '../l10n/l10n.dart';
import '../provider/keyboard_provider.dart';
import '../provider/local_provider.dart';
import '../domain/change_notifiers/auth_model.dart';

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
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => LocaleProvider(),
        builder: (context, child) {
          final provider = Provider.of<LocaleProvider>(context);
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) => KeyboardProvider(),
              ),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                fontFamily: AppConstants.primaryTypeFace,
                splashColor: AppColors.colorBlueLight1,
                highlightColor: Colors.transparent,
                scaffoldBackgroundColor: AppColors.colorWhite,
              ),
              initialRoute: '/',
              routes: appRoutes,
              locale: provider.locale,
              supportedLocales: L10n.allLocales,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
            ),
          );
        },
      );
}
