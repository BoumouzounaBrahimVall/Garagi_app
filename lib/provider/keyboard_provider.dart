import 'package:flutter/material.dart';

class KeyboardProvider with ChangeNotifier {
  bool keyboardOpen = false;

  bool get getKeyboardOpen => keyboardOpen;

  void setKeyboard() {
    keyboardOpen = !keyboardOpen;
    notifyListeners();
  }

  void handleKeyboardStatus(BuildContext context) {
    final newStatus = MediaQuery.of(context).viewInsets.bottom > 0;
    if (newStatus != keyboardOpen) {
      keyboardOpen = newStatus;
      notifyListeners();
    }
  }

  // void startKeyboardListener(BuildContext context) {
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     _handleKeyboardStatus();
  //     MediaQuery.of(context).addListener(_handleKeyboardStatus);
  //   });
  // }

  // void stopKeyboardListener(BuildContext context) {
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     MediaQuery.of(context).removeListener(_handleKeyboardStatus);
  //   });
  // }
}
