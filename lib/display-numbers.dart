import 'package:flutter/material.dart';

class NumberDisplay extends StatelessWidget {
  NumberDisplay({this.value: ''});

  final String value;



  @override
  Widget build(BuildContext context) {
    return
         Padding(
          padding: EdgeInsets.all(40.0),


              child: Row( mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(value,
                    textAlign:TextAlign.right,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),)
                ],

              ),



    );




  }

}


//return Padding(
//padding: EdgeInsets.only(
//left: 10.0,
//top: 40.0,
//right: 10.0,
//bottom: 40.0,
//),
//child: SingleChildScrollView(
//scrollDirection: Axis.horizontal,
//
//
//child: Row(
//
//// mainAxisAlignment: MainAxisAlignment.end,
//children: <Widget>[
//
//Text(
//value,
//
//style: TextStyle(fontSize: sizefont, fontWeight: FontWeight.bold),
//),
//
//],
//
//mainAxisAlignment: MainAxisAlignment.end,
//
//)
//));
//}
//
//lv() {
//  if(value.length>28){
//    sizefont = 20;
//
//  }
//}