import 'package:flutter/material.dart';

class NumberDisplay extends StatelessWidget {
  NumberDisplay({this.value: ''});

  final String value;
  double sizefont = 30.00;




  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
          left: 10.0,
          top: 40.0,
          right: 10.0,
          bottom: 40.0,
        ),
        child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,


            child: Row(

              // mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[

                Text(
                  value,

                  style: TextStyle(fontSize: sizefont, fontWeight: FontWeight.bold),
                ),

          ],

              mainAxisAlignment: MainAxisAlignment.end,

            )
        ));
  }

  lv() {
    if(value.length>28){
      sizefont = 20;

    }
  }
}
