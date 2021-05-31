import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_calculator/util/themes.dart';
import 'package:provider/provider.dart';
import 'home_screen.dart';
import 'util/calculator.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: kDarkBackgroundColor, // status bar color
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Calculator(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
