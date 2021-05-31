import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calculator/util/calculator.dart';
import 'package:flutter_calculator/util/themes.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';


class ResultLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final formatter = new NumberFormat("#,###.###");

    return Consumer<Calculator>(
        builder: (context, calculator, child) {
          var calculator =
          Provider.of<Calculator>(context, listen: true);
          return Padding(
            padding: EdgeInsets.only(right: 18),
            child: Container(
              height: 200,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          (calculator.firstNumber == null)
                              ? '0'
                              : '${calculator.firstNumber}',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: 20, color: kTextColor, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          (calculator.operator == null)
                              ? ''
                              : '${calculator.operator}',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: 20, color: kRed, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          (calculator.secondNumber == null)
                              ? ''
                              : '${calculator.secondNumber}',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: 20, color: kTextColor, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    (calculator.result == null)
                        ? '0'
                        : '${formatter.format(calculator.result)}',
                    style:
                    TextStyle(fontSize: 50, color: kTextColor, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
