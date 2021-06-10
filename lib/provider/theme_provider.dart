import 'package:flutter/material.dart';
import 'package:shopping/services/local/catch_data.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDark = false;

  void lightTheme({bool themeMode}) {
    if (themeMode != null) {
      isDark = themeMode;
      notifyListeners();
    } else {
      isDark = !isDark;
      CatchHelper.sharedPreferences
          .setBool('isDark', isDark)
          .then((value) => notifyListeners());
    }
  }

  void darkTheme({bool themeMode}) {
    if (themeMode != null) {
      isDark = themeMode;
      notifyListeners();
    } else {
      isDark = true;
      CatchHelper.sharedPreferences
          .setBool('isDark', isDark)
          .then((value) => notifyListeners());
    }
  }
}
