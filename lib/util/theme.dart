import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

Color kBackgroundColor = Color(0xff2E2C39);
Color kNeonColor = Color(0xff7D5DFE);
Color kTextColor = Colors.white;
Color kGreyColor = Color(0xffBFBFC1);
Color kToggleButtonColor = Color(0xffBFBFC1);

class Themes extends ChangeNotifier {
  var themeIcon = Icon(Icons.brightness_medium, color: kToggleButtonColor);

  void toggleTheme() {
    if (kTextColor == Colors.white) {
      //above statement means the theme is dark
      kTextColor = Colors.black;
      kBackgroundColor = Colors.white;
      kGreyColor = Color(0xffEFEFEF);
      themeIcon = Icon(Icons.brightness_3, color: Colors.black);
      kToggleButtonColor = Colors.black;
      notifyListeners();
      //switch to light theme
    } else {
      //switch to dark theme
      kTextColor = Colors.white;
      kBackgroundColor = Color(0xff2E2C39);
      kGreyColor = Color(0xffBFBFC1);
      themeIcon = Icon(Icons.brightness_medium, color: kGreyColor);
      kToggleButtonColor = kGreyColor;
      notifyListeners();
    }
  }
}
