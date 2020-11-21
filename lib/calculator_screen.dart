import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calculator/widgets/number_buttons.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  Color backgroundColor = Color(0xff2E2C39);
  Color neonColor = Color(0xff7D5DFE);
  int firstOperand;
  String operator;
  int secondOperand;
  int result;

  void numberPressed(int number) {
    setState(() {
      if (firstOperand == null) {
        firstOperand = number;
        return;
      }
      if (firstOperand == null) {
        firstOperand = number;
        return;
      }
      if (operator == null) {
        firstOperand = int.parse('$firstOperand$number');
        return;
      }
      if (secondOperand == null) {
        secondOperand = number;
        return;
      }
      secondOperand = int.parse('$secondOperand$number');
    });
  }

  void operatorPressed(String operator) {
    setState(() {
      if (firstOperand == null) {
        firstOperand = 0;
      }
      this.operator = operator;
    });
  }

  void clear() {
    setState(() {
      result = null;
      firstOperand = null;
      secondOperand = null;
      operator = null;
    });
  }

  void calculate() {
    setState(() {
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
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: Expanded(
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          result == null ? '0' : '$result',
                          style: TextStyle(fontSize: 70, color: Colors.white),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                (firstOperand == null) ? '0' : '$firstOperand',
                                textAlign: TextAlign.right,
                                style: TextStyle(fontSize: 20, color: neonColor),
                              ),
                              Text(
                                (operator == null) ? '' : '$operator',
                                textAlign: TextAlign.right,
                                style: TextStyle(fontSize: 20, color: neonColor),
                              ),
                              Text(
                                (secondOperand == null) ? '' : '$secondOperand',
                                textAlign: TextAlign.right,
                                style: TextStyle(fontSize: 20, color: neonColor),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 11),
                    child: CalculatorButton(
                      number: 'AC',
                      textColor: neonColor,
                      buttonColor: Colors.grey,
                      onTap: () => clear(),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(
                    number: '7',
                    textColor: Colors.white,
                    buttonColor: backgroundColor,
                    onTap: () => numberPressed(7),
                  ),
                  CalculatorButton(
                    number: '8',
                    textColor: Colors.white,
                    buttonColor: backgroundColor,
                    onTap: () => numberPressed(8),
                  ),
                  CalculatorButton(
                    number: '9',
                    textColor: Colors.white,
                    buttonColor: backgroundColor,
                    onTap: () => numberPressed(9),
                  ),
                  CalculatorButton(
                      number: '×',
                      textColor: Colors.black,
                      buttonColor: Colors.grey,
                      onTap: () => operatorPressed('×')),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(
                    number: '4',
                    textColor: Colors.white,
                    buttonColor: backgroundColor,
                    onTap: () => numberPressed(4),
                  ),
                  CalculatorButton(
                      number: '5',
                      textColor: Colors.white,
                      buttonColor: backgroundColor,
                      onTap: () => numberPressed(5)),
                  CalculatorButton(
                      number: '6',
                      textColor: Colors.white,
                      buttonColor: backgroundColor,
                      onTap: () => numberPressed(6)),
                  CalculatorButton(
                      number: '-',
                      textColor: Colors.black,
                      buttonColor: Colors.grey,
                      onTap: () => operatorPressed('-')),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(
                      number: '1',
                      textColor: Colors.white,
                      buttonColor: backgroundColor,
                      onTap: () => numberPressed(1)),
                  CalculatorButton(
                      number: '2',
                      textColor: Colors.white,
                      buttonColor: backgroundColor,
                      onTap: () => numberPressed(2)),
                  CalculatorButton(
                      number: '3',
                      textColor: Colors.white,
                      buttonColor: backgroundColor,
                      onTap: () => numberPressed(3)),
                  CalculatorButton(
                    number: '+',
                    textColor: Colors.black,
                    buttonColor: Colors.grey,
                    onTap: () => operatorPressed('+'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(
                      number: '0',
                      textColor: Colors.white,
                      buttonColor: backgroundColor,
                      onTap: () => numberPressed(0)),
                  CalculatorButton(
                    number: '.',
                    textColor: Colors.white,
                    buttonColor: backgroundColor,
                  ),
                  CalculatorButton(
                    number: '=',
                    textColor: Colors.white,
                    buttonColor: neonColor,
                    onTap: () {
                      calculate();
                      print(result);
                    },
                  ),
                  CalculatorButton(
                    number: '÷',
                    textColor: Colors.black,
                    buttonColor: Colors.grey,
                    onTap: () => operatorPressed('÷'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
