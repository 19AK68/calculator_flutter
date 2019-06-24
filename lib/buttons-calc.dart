import 'package:flutter/material.dart';
import 'calculator.dart';
import 'calc-button.dart';
import 'calc-row.dart';

class CalculatorButtons extends StatelessWidget {
  CalculatorButtons({@required this.onTap});

  final CalculatorButtonTapCallback onTap;
  final calculatorButtonRows = [
    ['7', '8', '9', Calculations.DIVISION],
    ['4', '5', '6', Calculations.MULTIPLICATION],
    ['1', '2', '3', Calculations.SUBTRACTION],
    [Calculations.POINT, '0', '00', Calculations.ADDITION],
    [Calculations.CLEAR, Calculations.EQUAL]
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
        children: calculatorButtonRows.map((calculatorRowButtons) {
          return CalculatorRow(
            buttons: calculatorRowButtons,
            onTap: onTap,
          );
        }).toList()
    );
  }
}