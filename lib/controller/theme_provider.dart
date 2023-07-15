
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  SharedPreferences pref;

  ThemeProvider({required this.pref});

  bool isDark = false;

  final String gtTheme = 'is_Dark';

  bool get getTheme {
    if(pref.getBool(gtTheme) ?? false) {
    } else {
      pref.setBool(gtTheme, isDark);
    }
    return isDark;
  }

  void changeTheme() {
    isDark = !isDark;
    pref.setBool(gtTheme, isDark);
    notifyListeners();
  }


}