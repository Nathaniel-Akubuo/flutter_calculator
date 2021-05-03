import 'package:flutter/foundation.dart';

class Calculator extends ChangeNotifier {
  String firstNumber;
  String operator;
  String secondNumber;
  String result;

  void numberPressed(String number) {
    if (firstNumber == null) {
      firstNumber = number;
      notifyListeners();
      return;
    }
    if (operator == null) {
      firstNumber = firstNumber + number;
      notifyListeners();
      return;
    }
    if (secondNumber == null) {
      secondNumber = number;
      notifyListeners();
      return;
    }
    secondNumber = secondNumber + number;
    notifyListeners();
  }

  void operatorPressed(String operator) {
    if (firstNumber == null) {
      firstNumber = '0';
    }
    this.operator = operator;
    notifyListeners();
  }

  void clear() {
    result = null;
    firstNumber = null;
    secondNumber = null;
    operator = null;
    notifyListeners();
  }

  void calculate() {
    switch (operator) {
      case '+':
        result =
            (double.parse(firstNumber) + double.parse(secondNumber)).toString();
        break;
      case '-':
        result =
            (double.parse(firstNumber) - double.parse(secondNumber)).toString();
        break;
      case '×':
        result =
            (double.parse(firstNumber) * double.parse(secondNumber)).toString();
        break;
      case '÷':
        if (secondNumber == '0') {
          return;
        }
        result =
            (double.parse(firstNumber) / double.parse(secondNumber)).toString();
        break;
    }
    notifyListeners();
  }
}
