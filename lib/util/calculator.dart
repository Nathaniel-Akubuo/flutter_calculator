import 'package:flutter/foundation.dart';

class Calculator extends ChangeNotifier {
  int firstOperand;
  String operator;
  int secondOperand;
  int result;

  void numberPressed(int number) {
    if (firstOperand == null) {
      firstOperand = number;
      notifyListeners();
      return;
    }
    if (operator == null) {
      firstOperand = int.parse('$firstOperand$number');
      notifyListeners();
      return;
    }
    if (secondOperand == null) {
      secondOperand = number;
      notifyListeners();
      return;
    }
    secondOperand = int.parse('$secondOperand$number');
    notifyListeners();
  }

  void operatorPressed(String operator) {
    if (firstOperand == null) {
      firstOperand = 0;
    }
    this.operator = operator;
    notifyListeners();
  }

  void clear() {
    result = null;
    firstOperand = null;
    secondOperand = null;
    operator = null;
    notifyListeners();
  }

  void calculate() {
    switch (operator) {
      case '+':
        result = firstOperand + secondOperand;
        break;
      case '-':
        result = firstOperand - secondOperand;
        break;
      case '×':
        result = firstOperand * secondOperand;
        break;
      case '÷':
        if (secondOperand == 0) {
          return;
        }
        result = firstOperand ~/ secondOperand;
        break;
    }
    notifyListeners();
  }
}
