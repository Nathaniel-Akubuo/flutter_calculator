import 'package:flutter/material.dart';
import 'package:flutter_calculator/util/calculator.dart';
import 'package:flutter_calculator/util/themes.dart';
import 'package:provider/provider.dart';

import 'number_buttons.dart';

class ButtonLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Consumer<Calculator>(builder: (context, calculator, child) {
      var calculator = Provider.of<Calculator>(context, listen: true);
      return Container(
        height: mediaQuery.height * 0.6,
        decoration: BoxDecoration(
            color: kLightBackgroundColor,
            borderRadius: BorderRadius.horizontal(
                right: Radius.circular(25), left: Radius.circular(25))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(
                  number: 'AC',
                  textColor: kTeal,
                  buttonColor: kLightBackgroundColor,
                  onTap: () => calculator.clearAll(),
                ),
                CalculatorButton(
                    number: '+/-',
                    textColor: kTeal,
                    buttonColor: kLightBackgroundColor,
                    onTap: () {}),
                CalculatorButton(
                  number: 'C',
                  textColor: kTeal,
                  buttonColor: kLightBackgroundColor,
                  onTap: () => calculator.clear(),
                ),
                CalculatorButton(
                  number: '÷',
                  textColor: kRed,
                  buttonColor: kLightBackgroundColor,
                  onTap: () => calculator.operatorPressed('÷'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(
                  number: '7',
                  textColor: kTextColor,
                  buttonColor: kLightBackgroundColor,
                  onTap: () => calculator.numberPressed('7'),
                ),
                CalculatorButton(
                  number: '8',
                  textColor: kTextColor,
                  buttonColor: kLightBackgroundColor,
                  onTap: () => calculator.numberPressed('8'),
                ),
                CalculatorButton(
                  number: '9',
                  textColor: kTextColor,
                  buttonColor: kLightBackgroundColor,
                  onTap: () => calculator.numberPressed('9'),
                ),
                CalculatorButton(
                    number: '×',
                    textColor: kRed,
                    buttonColor: kLightBackgroundColor,
                    onTap: () => calculator.operatorPressed('×')),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(
                  number: '4',
                  textColor: kTextColor,
                  buttonColor: kLightBackgroundColor,
                  onTap: () => calculator.numberPressed('4'),
                ),
                CalculatorButton(
                    number: '5',
                    textColor: kTextColor,
                    buttonColor: kLightBackgroundColor,
                    onTap: () => calculator.numberPressed('5')),
                CalculatorButton(
                    number: '6',
                    textColor: kTextColor,
                    buttonColor: kLightBackgroundColor,
                    onTap: () => calculator.numberPressed('6')),
                CalculatorButton(
                    number: '-',
                    textColor: kRed,
                    buttonColor: kLightBackgroundColor,
                    onTap: () => calculator.operatorPressed('-')),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(
                    number: '1',
                    textColor: kTextColor,
                    buttonColor: kLightBackgroundColor,
                    onTap: () => calculator.numberPressed('1')),
                CalculatorButton(
                    number: '2',
                    textColor: kTextColor,
                    buttonColor: kLightBackgroundColor,
                    onTap: () => calculator.numberPressed('2')),
                CalculatorButton(
                    number: '3',
                    textColor: kTextColor,
                    buttonColor: kLightBackgroundColor,
                    onTap: () => calculator.numberPressed('3')),
                CalculatorButton(
                  number: '+',
                  textColor: kRed,
                  buttonColor: kLightBackgroundColor,
                  onTap: () => calculator.operatorPressed('+'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(
                    number: '0',
                    textColor: kTextColor,
                    buttonColor: kLightBackgroundColor,
                    onTap: () => calculator.numberPressed('0')),
                CalculatorButton(
                  number: '.',
                  textColor: kTextColor,
                  buttonColor: kLightBackgroundColor,
                  onTap: () => calculator.numberPressed('.'),
                ),
                CalculatorButton(
                  number: '',
                  buttonColor: kLightBackgroundColor,
                ),
                CalculatorButton(
                  number: '=',
                  textColor: kRed,
                  buttonColor: kLightBackgroundColor,
                  onTap: () {
                    calculator.calculate();
                  },
                ),
              ],
            )
          ],
        ),
      );
    });
  }
}
