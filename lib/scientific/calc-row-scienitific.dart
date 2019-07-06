import 'package:flutter/material.dart';
import 'calc-button-scientific.dart';

class CalculatorScientificRow extends StatelessWidget{
  CalculatorScientificRow({@required this.buttons, @required this.onTapScientific });

  final List<String> buttons;
  final CalculatorButtonTapScientificCallback onTapScientific;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: rowButtons(),

      mainAxisAlignment: MainAxisAlignment.spaceAround,
      // crossAxisAlignment: CrossAxisAlignment.baseline,
    );
  }

  List<Widget> rowButtons() {
    List<Widget> rowButtons = [];

    buttons.forEach((String buttonText) {
      rowButtons.add(
        CalculatorButtonScientific(
          text: buttonText,
          onTapScientific: onTapScientific,
        ),
      );
    });

    return rowButtons;
  }

}