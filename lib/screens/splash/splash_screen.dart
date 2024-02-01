import 'dart:async';
//import 'dart:ffi';

import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:garagi_app/domain/models/user_model.dart';
import '../../config/colors.dart';
import '../../config/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<bool> _isLoggedIn() async {
    bool signedIn = await User.getInstance() != null;
    false; // = await GoogleAuthService.instance.initAuth(context);
    return signedIn;
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.top],
    );

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final signedIn = await _isLoggedIn();
      // user is signed in
      if (signedIn) {
        // user is client
        if (User.instance!.role == UserRole.client) {
          Timer(const Duration(seconds: 2), () async {
            Navigator.pushReplacementNamed(context, '/client');
          });
        } else {
          // user is manager
          Timer(const Duration(seconds: 2), () async {
            Navigator.pushReplacementNamed(context, '/manager');
          });
        }
      } else {
        if (!mounted) return;
        Timer(const Duration(seconds: 2), () async {
          Navigator.pushReplacementNamed(context, '/login');
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Declarations
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.colorYellow,
      body: Container(
        alignment: Alignment.center,
        child: Entry(
          scale: 0,
          delay: const Duration(
            milliseconds: 300,
          ),
          duration: const Duration(
            milliseconds: 700,
          ),
          curve: Curves.decelerate,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(
                AppConstants.logoNoTitle,
                fit: BoxFit.cover,
                width: width - 20,
                alignment: Alignment.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
