import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calculator/widgets/number_buttons.dart';
import 'package:provider/provider.dart';
import 'util/theme_colors.dart';
import 'util/calculator.dart';

// ignore: must_be_immutable
class CalculatorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Themes(),
      child: Consumer<Themes>(
        builder: (context, themes, child){
          var themes = Provider.of<Themes>(context, listen: false);
          return SafeArea(
            child: Scaffold(
              backgroundColor: kBackgroundColor,
              body: Padding(
                padding: EdgeInsets.all(8.0),
                child: Consumer<Calculator>(
                  builder: (context, calculator, child) {
                    var calculator = Provider.of<Calculator>(context, listen: false);
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: Container(
                            height: 200,
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  (calculator.result == null)
                                      ? '0'
                                      : '${calculator.result}',
                                  style: TextStyle(fontSize: 70, color: kTextColor),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        (calculator.firstNumber == null)
                                            ? '0'
                                            : '${calculator.firstNumber}',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            fontSize: 20, color: kNeonColor),
                                      ),
                                      Text(
                                        (calculator.operator == null)
                                            ? ''
                                            : '${calculator.operator}',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            fontSize: 20, color: kNeonColor),
                                      ),
                                      Text(
                                        (calculator.secondNumber == null)
                                            ? ''
                                            : '${calculator.secondNumber}',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            fontSize: 20, color: kNeonColor),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CalculatorButton(
                              number: 'AC',
                              textColor: kNeonColor,
                              buttonColor: kBackgroundColor,
                              onTap: () => calculator.clear(),
                            ),
                            CalculatorButton(
                              number: '+/-',
                              textColor: kTextColor,
                              buttonColor: kBackgroundColor,
                              onTap: () => calculator.numberPressed('+/-'),
                            ),
                            CalculatorButton(
                              number: '%',
                              textColor: kTextColor,
                              buttonColor: kBackgroundColor,
                            ),
                            CalculatorButton(
                              number: '÷',
                              textColor: Colors.black,
                              buttonColor: kGreyColor,
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
                              buttonColor: kBackgroundColor,
                              onTap: () => calculator.numberPressed('7'),
                            ),
                            CalculatorButton(
                              number: '8',
                              textColor: kTextColor,
                              buttonColor: kBackgroundColor,
                              onTap: () => calculator.numberPressed('8'),
                            ),
                            CalculatorButton(
                              number: '9',
                              textColor: kTextColor,
                              buttonColor: kBackgroundColor,
                              onTap: () => calculator.numberPressed('9'),
                            ),
                            CalculatorButton(
                                number: '×',
                                textColor: Colors.black,
                                buttonColor: kGreyColor,
                                onTap: () => calculator.operatorPressed('×')),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CalculatorButton(
                              number: '4',
                              textColor: kTextColor,
                              buttonColor: kBackgroundColor,
                              onTap: () => calculator.numberPressed('4'),
                            ),
                            CalculatorButton(
                                number: '5',
                                textColor: kTextColor,
                                buttonColor: kBackgroundColor,
                                onTap: () => calculator.numberPressed('5')),
                            CalculatorButton(
                                number: '6',
                                textColor: kTextColor,
                                buttonColor: kBackgroundColor,
                                onTap: () => calculator.numberPressed('6')),
                            CalculatorButton(
                                number: '-',
                                textColor: Colors.black,
                                buttonColor: kGreyColor,
                                onTap: () => calculator.operatorPressed('-')),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CalculatorButton(
                                number: '1',
                                textColor: kTextColor,
                                buttonColor: kBackgroundColor,
                                onTap: () => calculator.numberPressed('1')),
                            CalculatorButton(
                                number: '2',
                                textColor: kTextColor,
                                buttonColor: kBackgroundColor,
                                onTap: () => calculator.numberPressed('2')),
                            CalculatorButton(
                                number: '3',
                                textColor: kTextColor,
                                buttonColor: kBackgroundColor,
                                onTap: () => calculator.numberPressed('3')),
                            CalculatorButton(
                              number: '+',
                              textColor: Colors.black,
                              buttonColor: kGreyColor,
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
                                buttonColor: kBackgroundColor,
                                onTap: () => calculator.numberPressed('0')),
                            CalculatorButton(
                              number: '.',
                              textColor: kTextColor,
                              buttonColor: kBackgroundColor,
                              onTap: () => calculator.numberPressed('.'),
                            ),
                            IconButton(
                              icon: themes.themeIcon,
                              iconSize: 50,
                              onPressed: () {
                                themes.toggleTheme();
                              },
                            ),
                            CalculatorButton(
                              number: '=',
                              textColor: Colors.white,
                              buttonColor: kNeonColor,
                              onTap: () {
                                calculator.calculate();
                              },
                            ),
                          ],
                        )
                      ],
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
