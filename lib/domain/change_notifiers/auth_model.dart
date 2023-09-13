import 'package:flutter/foundation.dart';
import '../../config/constants.dart';
import '../models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthModel with ChangeNotifier, DiagnosticableTreeMixin {
  String _accessToken = "";
  late User authenticatedUser;
  bool _userLoggedIn = false;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  String get accessToken => _accessToken;
  bool get userLoggedIn => _userLoggedIn;

  void setAccessToken(accessToken) async {
    // Update access token
    _accessToken = accessToken;
    if (_accessToken.isNotEmpty) setUserLoggedIn(true);

    // Persist access token
    final SharedPreferences prefs = await _prefs;
    prefs.setString(
      AppConstants().backendTokenKey,
      accessToken,
    );
    notifyListeners();
  }

  @protected
  void setUserLoggedIn(userLoggedIn) async {
    // Update user loggedIn
    _userLoggedIn = userLoggedIn;

    // Persist user loggedIn
    final SharedPreferences prefs = await _prefs;
    prefs.setString(
      'userLoggedIn',
      userLoggedIn,
    );
    notifyListeners();
  }

  // Makes `AccessToken` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      StringProperty(
        'accessToken',
        accessToken,
      ),
    );
  }
}

/**
 
class AuthModel with ChangeNotifier, DiagnosticableTreeMixin {
  String _accessToken = "";
  final Map<String, String> _refreshTokens = {
    "google": "",
    "linkedin": "",
    "facebook": ""
  };
  late User authenticatedUser;
  bool _userLoggedIn = false;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  String get accessToken => _accessToken;
  Map get refreshTokens => _refreshTokens;
  bool get userLoggedIn => _userLoggedIn;

  void setAccessToken(accessToken) async {
    // Update access token
    _accessToken = accessToken;
    if (_accessToken.isNotEmpty) setUserLoggedIn(true);

    // Persist access token
    final SharedPreferences prefs = await _prefs;
    prefs.setString(
      AppConstants().backendTokenKey,
      accessToken,
    );
    notifyListeners();
  }

  void setRefreshToken(platform, refreshToken) async {
    // Update platform access token
    if (_refreshTokens.keys.toList().contains(platform)) {
      _refreshTokens[platform] = refreshToken;
    }

    // Persist platform access token
    final SharedPreferences prefs = await _prefs;
    prefs.setString(
      AppConstants().refreshTokenKey,
      accessToken,
    );
    notifyListeners();
  }

  @protected
  void setUserLoggedIn(userLoggedIn) async {
    // Update user loggedIn
    _userLoggedIn = userLoggedIn;

    // Persist user loggedIn
    final SharedPreferences prefs = await _prefs;
    prefs.setString(
      'userLoggedIn',
      userLoggedIn,
    );
    notifyListeners();
  }

  // Makes `AccessToken` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      StringProperty(
        'accessToken',
        accessToken,
      ),
    );
  }
}


 */