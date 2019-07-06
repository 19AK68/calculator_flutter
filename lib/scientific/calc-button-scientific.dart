import 'package:flutter/material.dart';

typedef void CalculatorButtonTapScientificCallback({String buttonText});

class CalculatorButtonScientific extends  StatelessWidget {
  CalculatorButtonScientific({this.text, @required this.onTapScientific});

  final String text;
  final CalculatorButtonTapScientificCallback onTapScientific;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(

            decoration: BoxDecoration(
              color: Colors.blueGrey.withOpacity(0.1) ,

              border: Border.all(
                color: Color.fromRGBO(0, 0, 0, 0.1),
                width: 0.5,
              ),
            ),
            child: FlatButton(
              onPressed: () => onTapScientific (buttonText: text),
              child: Text(
                text,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              padding: EdgeInsets.all(28),
              highlightColor: Colors.blueGrey[100],
              splashColor: Colors.blueAccent[100],
            )));
  }
}