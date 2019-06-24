import 'package:flutter/material.dart';

class NumberDisplay extends StatelessWidget {
  NumberDisplay({this.value: ''});

  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
          left: 10.0,
          top:40.0,
          right:10.0,
          bottom: 40.0,

        ),

        child: Row(
          children: <Widget>[
            Text(
              value,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.end,
        ));
  }
}
