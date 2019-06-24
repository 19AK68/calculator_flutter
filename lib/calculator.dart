import 'package:flutter_calc/number-format.dart';

class Calculations {
  static const ADDITION = '+';
  static const DIVISION = '/';
  static const SUBTRACTION = '-';
  static const MULTIPLICATION = '*';
  static const CLEAR = 'C';
  static const POINT = '.';
  static const EQUAL = '=';

  static const OPERATION =[
    Calculations.ADDITION,
    Calculations.DIVISION,
    Calculations.MULTIPLICATION,
    Calculations.SUBTRACTION,

  ];

  static double add(double a, double b) => a + b;
  static double subtract(double a, double b) => a - b;
  static double divide(double a, double b) => a / b;
  static double multiply(double a, double b) => a  * b;
}

class Calculator {
  static String parseString(String text) {
    List<String> numbersToAdd;
    double a, b, result;
    if (text.contains(Calculations.ADDITION)) {
      numbersToAdd = text.split(Calculations.ADDITION);
      a = double.parse(numbersToAdd[0]);
      b = double.parse(numbersToAdd[1]);

      result = Calculations.add(a, b);
    } else if (text.contains(Calculations.MULTIPLICATION)) {
      numbersToAdd = text.split(Calculations.MULTIPLICATION);
      a = double.parse(numbersToAdd[0]);
      b = double.parse(numbersToAdd[1]);

      result = Calculations.multiply(a, b);
    } else if (text.contains(Calculations.DIVISION)) {
      numbersToAdd = text.split(Calculations.DIVISION);
      a = double.parse(numbersToAdd[0]);
      b = double.parse(numbersToAdd[1]);

      result = Calculations.divide(a, b);
    } else if (text.contains(Calculations.SUBTRACTION)) {
      numbersToAdd = text.split(Calculations.SUBTRACTION);
      a = double.parse(numbersToAdd[0]);
      b = double.parse(numbersToAdd[1]);

      result = Calculations.subtract(a, b);
    } else {
      return text;
    }

    return NumberFormatter.format(result.toString());
  }


  static String addPoint(String calculatorString) {
    if (calculatorString.isEmpty) {
      return calculatorString = '0${Calculations.POINT}';
    }

    RegExp exp = new RegExp(r"\d\.");
    Iterable<Match> matches = exp.allMatches(calculatorString);
    int maxMatches = Calculator.includesOperation(calculatorString) ? 2 : 1;

    return matches.length == maxMatches
        ? calculatorString
        : calculatorString += Calculations.POINT;
  }

  static bool includesOperation(String calculatorString) {
    for (var operation in Calculations.OPERATION) {
      if (calculatorString.contains(operation)) {
        return true;
      }
    }

    return false;
  }

}