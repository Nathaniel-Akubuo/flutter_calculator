import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CalculatorButton extends StatelessWidget {
  final Color buttonColor;
  final String number;
  final Color textColor;
  final Function onTap;

  CalculatorButton({this.buttonColor, this.number, this.textColor, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          height: 65,
          width: 65,
          child: Center(
            child: Text(
              number,
              style: TextStyle(
                  fontSize: 25, fontWeight: FontWeight.bold, color: textColor),
            ),
          ),
          decoration: BoxDecoration(color: buttonColor, shape: BoxShape.circle),
        ),
      ),
    );
  }
}
