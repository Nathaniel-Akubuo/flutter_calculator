import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Color kDarkBackgroundColor = Color(0xff22252D);
Color kLightBackgroundColor = Color(0xff292D36);
Color kTeal = Colors.tealAccent;
Color kRed = Colors.redAccent;
Color kTextColor = Colors.white;
Color kLightIconColor = Colors.grey;
Color kDarkIconColor = Colors.white;

ThemeData dark = ThemeData(
    accentColor: Colors.white,
    backgroundColor: Color(0xff22252D),
    primaryColor: Color(0xff292D36));

ThemeData light = ThemeData(
  accentColor: Colors.black,
  backgroundColor: Colors.white,
  primaryColor:  Color(0xffF9F9F9)
);

class Themes extends ChangeNotifier {
  SharedPreferences prefs;
  Icon kLightModeIcon = Icon(Icons.wb_sunny_outlined);
  Icon kDarkModeIcon = Icon(Icons.brightness_3_outlined);

  void toggleTheme() {
    if (kTextColor == Colors.white) {
      //above statement means the theme is dark
      kTextColor = Colors.black;
      kLightBackgroundColor = Color(0xffF9F9F9);
      kDarkBackgroundColor = Colors.white;
      kLightIconColor = Colors.black;
      kDarkIconColor = Colors.grey;
      //switch to light theme
    } else {
      //switch to dark theme
      kTextColor = Colors.white;
      kLightBackgroundColor = Color(0xff292D36);
      kDarkBackgroundColor = Color(0xff22252D);
      kLightIconColor = Colors.grey;
      kDarkIconColor = Colors.white;
    }
    notifyListeners();
  }
}
