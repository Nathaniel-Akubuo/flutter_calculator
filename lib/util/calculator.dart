import 'package:flutter/foundation.dart';

class Calculator extends ChangeNotifier {
  String firstNumber;
  String operator;
  String secondNumber;
  double result;

  void numberPressed(String number) {
    if (firstNumber == null) {
      if (number == '.') {
        firstNumber = '0.';
        notifyListeners();
        return;
      } else {
        firstNumber = number;
        notifyListeners();
        return;
      }
    }

    if (operator == null) {
      if (firstNumber.contains('.')&&number.contains('.')) {
        return;
      } else {
        firstNumber = firstNumber + number;
        notifyListeners();
        return;
      }
    }

    if (secondNumber == null|| secondNumber =='') {
      if (number == '.') {
        secondNumber = '0.';
        notifyListeners();
        return;
      } else {
        secondNumber = number;
        notifyListeners();
        return;
      }
    } else {
      if (secondNumber.contains('.')&&number.contains('.')) {
        return;
      }
      secondNumber = secondNumber + number;
      notifyListeners();
    }
  }

  void operatorPressed(String operator) {
    if (firstNumber == null) {
      if (operator == '-') {
        firstNumber = operator;
        notifyListeners();
      } else {
        firstNumber = '0';
        notifyListeners();
      }
    } else {
      this.operator = operator;
      notifyListeners();
    }
  }

  void clearAll() {
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
            double.parse(firstNumber) + double.parse(secondNumber);
        break;
      case '-':
        result =
            double.parse(firstNumber) - double.parse(secondNumber);
        break;
      case '×':
        result =
            double.parse(firstNumber) * double.parse(secondNumber);
        break;
      case '÷':
        if (secondNumber == '0') {
          return;
        }
        result =
            double.parse(firstNumber) / double.parse(secondNumber);
        break;
    }
    notifyListeners();
  }

  void clear() {
    if (operator == null) {
      firstNumber = firstNumber.substring(0, firstNumber.length - 1);
      notifyListeners();
    } else {
      secondNumber = secondNumber.substring(0, secondNumber.length - 1);
      notifyListeners();
    }
  }
}
