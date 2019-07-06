import 'package:flutter/material.dart';
import 'calc-button-scientific.dart';
import 'calculator_scientific.dart';
import 'calc-row-scienitific.dart';

class CalculatorButtonsScientific extends StatelessWidget {

  CalculatorButtonsScientific({@required this.onTapScientific});

  final CalculatorButtonTapScientificCallback onTapScientific;
  final calculatorButtonScientificRows = [
    ['A', 'B', CalculationsScientific.PERCENT],
    [
      CalculationsScientific.SINUS,
      CalculationsScientific.COSINE,
      CalculationsScientific.TANGENT
    ],
    [
      CalculationsScientific.NATURAL_LOF,
      CalculationsScientific.LOG,
      CalculationsScientific.FACTORIAL
    ],
    [
      CalculationsScientific.PI,
      CalculationsScientific.EXHIBITOR,
      CalculationsScientific.EXPONENTIATION
    ],
    [
      CalculationsScientific.LEFT_BRACKET,
      CalculationsScientific.RIGHT_BRACKET,
      CalculationsScientific.EXTRACTING_ROOT
    ]
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
          calculatorButtonScientificRows.map((calculatorScientificRowButtons) {
        return CalculatorScientificRow(
          buttons: calculatorScientificRowButtons,
          onTapScientific: onTapScientific,
        );
      }).toList(),
    );
  }
}
