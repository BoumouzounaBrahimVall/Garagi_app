import 'package:flutter/material.dart';

import '../l10n/l10n.dart';

class LocaleProvider extends ChangeNotifier {
  Locale? locale;

  Locale? get getLocale => locale;

  void setLocale(Locale locale) {
    if (!L10n.allLocales.contains(locale)) return;
    locale = locale;
    notifyListeners();
  }

  void clearLocale() {
    locale = null;
    notifyListeners();
  }
}
