import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'calculator_screen.dart';
import 'util/calculator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Calculator(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CalculatorScreen(),
      ),
    );
  }
}
