import 'package:flutter/material.dart';
import 'package:flutter_calc/buttons-calc.dart';
import 'package:flutter_calc/calculator.dart';
import 'package:flutter_calc/display-numbers.dart';
import 'package:flutter_calc/history.dart';
import 'package:flutter_calc/scientific/buttons-calc-scientific.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isNewEquation = true;
  List<double> values = [];
  List<String> operations = [];
  List<String> calculations = [];
  String calculatorString = '';



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.history),
            onPressed: () {
              _navigateAndDisplayHistory(context);
            },
          )
        ],
      ),
      body: PageView(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Container(
                    constraints: BoxConstraints(
                        minWidth: calculatorString.length.toDouble()),
                    child: NumberDisplay(value: calculatorString)),
                IntrinsicHeight(
                    child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: CalculatorButtons(onTap: _onPressed),
                      ),
                      flex: 15,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blueAccent.withOpacity(0.5),
                          border: Border.all(
                            color: Color.fromRGBO(0, 0, 0, 0.1),
                            width: 0.5,
                          ),
                        ),
                      ),
                      flex: 1,
                    ),
                  ],
                ))
              ],
            ),
          ),
          Container(

              child: Column(
            children: <Widget>[
              Container(
                  constraints: BoxConstraints(
                      minWidth: calculatorString.length.toDouble()),
                  child: NumberDisplay(value: calculatorString)),
              IntrinsicHeight(

                child: Row(

                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(

                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[100].withOpacity(0.0),
                          border: Border.all(
                            color: Color.fromRGBO(0, 0, 0, 0.1),
                            width: 0.5,
                          ),
                        ),

                        // child: CalculatorButtons(onTap: _onPressed),
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      child: Container(
                        child: CalculatorButtonsScientific(
                            onTapScientific: _onPressed),
                      ),
                      // Container(
//                        height: 390.0,
//                        child: Center(child: Text("Page 2")),
//                        color: Colors.blueAccent.withOpacity(0.5),
//                      ),
                      flex: 3,
                    )
                  ],
                ),
              )
            ],
          ))
        ],
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  _navigateAndDisplayHistory(BuildContext context) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => History(operations: calculations)));

    if (result != null) {
      setState(() {
        isNewEquation = false;
        calculatorString = Calculator.parseString(result);
      });
    }
  }

  void _onPressed({String buttonText}) {
    // Standard mathematical operations
    if (Calculations.OPERATION.contains(buttonText)) {
      return setState(() {
        operations.add(buttonText);
        calculatorString += " $buttonText ";
      });
    }

    // On CLEAR press
    if (buttonText == Calculations.CLEAR) {
      return setState(() {
        operations.add(Calculations.CLEAR);
        calculatorString = "";
      });
    }

    // On Equals press
    if (buttonText == Calculations.EQUAL) {
      String newCalculatorString = Calculator.parseString(calculatorString);

      return setState(() {
        if (newCalculatorString != calculatorString) {
          // only add evaluated strings to calculations array
          calculations.add(calculatorString);
        }

        operations.add(Calculations.EQUAL);
        calculatorString = newCalculatorString;
        isNewEquation = false;
      });
    }

    if (buttonText == Calculations.POINT) {
      return setState(() {
        calculatorString = Calculator.addPoint(calculatorString);
      });
    }

    setState(() {
      if (!isNewEquation &&
          operations.length > 0 &&
          operations.last == Calculations.EQUAL) {
        calculatorString = buttonText;
        isNewEquation = true;
      } else {
        calculatorString += buttonText;
      }
    });
  }
}
//
//class CustomRowAndColums extends StatelessWidget{
//
//
////  @override
////  Widget build(BuildContext context) {
////        return Padding(
////          padding: const EdgeInsets.only(top:10.0),
////          child: IntrinsicHeight(
////            child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children:[
////              Expanded(
////                child: Column(children: [
////                  Container(
////                    child:  NumberDisplay(value: calculatorString),
////
////                  )
////                ],),
////              ),
////              Expanded(child: Container(
////                child:   CalculatorButtons(onTap: _onPressed),
////
////              ),)
////            ]
////
////
////            ),
////          ),
////        );
////  }
////
////}
