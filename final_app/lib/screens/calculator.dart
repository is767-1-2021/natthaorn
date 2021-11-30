import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import 'history.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String result = '0';
  String equation = '0';
  String operand = '';
  double equationFontSize = 20.0;
  double resultFontSize = 40.0;

  buttonPress(String buttonText) async {
    setState(() {
      if (buttonText == 'CE') {
        equation = '0';
        result = '0';
        equationFontSize = 20.0;
        resultFontSize = 40.0;
      } else if (buttonText == 'C') {
        equation = "0";
        result = "0";
        equationFontSize = 20.0;
        resultFontSize = 40.0;
      } else if (buttonText == '⌫') {
        equationFontSize = 20.0;
        resultFontSize = 40.0;
        equation = equation.substring(0, equation.length - 1);
        if (equation == '') {
          equation = '0';
        }
      } else if (buttonText == '=') {
        equationFontSize = 20.0;
        resultFontSize = 40.0;
        operand = equation;
        operand = operand.replaceAll('×', '*');
        operand = operand.replaceAll('÷', '/');
        operand = operand.replaceAll('+/-', '-');
        operand = operand.replaceAll('%', '/100');
        operand = operand.replaceAll('1/x', '^-1');
        operand = operand.replaceAll('X^2', '^2');
        operand = operand.replaceAll('√', '^(1/2)');

        try {
          Parser p = Parser();
          Expression exp = p.parse(operand);
          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = "Error";
        }
      } else {
        equationFontSize = 20.0;
        resultFontSize = 48.0;
        if (equation == '0') {
          equation = buttonText;
        } else {
          equation = equation + buttonText;
        }
      }
    });

    if (operand.isNotEmpty) {
      if (buttonText == '=') {
        await FirebaseFirestore.instance.collection('history').doc().set({
          'operand': operand,
          'result': result,
          'createdAt': DateTime.now()
        });
      }
    }
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: OutlinedButton(
        style: ButtonStyle(
            backgroundColor: buttonText == '='
                ? MaterialStateProperty.all<Color>(Colors.blue.shade800)
                : buttonText == '1' ||
                        buttonText == '2' ||
                        buttonText == '3' ||
                        buttonText == '4' ||
                        buttonText == '5' ||
                        buttonText == '6' ||
                        buttonText == '7' ||
                        buttonText == '8' ||
                        buttonText == '9' ||
                        buttonText == '0' ||
                        buttonText == '+/-' ||
                        buttonText == '.'
                    ? MaterialStateProperty.all<Color>(Colors.black54)
                    : MaterialStateProperty.all<Color>(
                        Colors.blueGrey.shade800),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(24))),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        onPressed: () => buttonPress(buttonText),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: Text('Calculator', style: TextStyle(fontSize: 25)),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => History()));
              },
              icon: Icon(Icons.history))
        ],
      ),
      body: Container(
        color: Colors.blueGrey[900],
        child: Column(
          children: [
            Container(
              /*equation*/
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Text(
                equation,
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Container(
              /*result*/
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Text(
                result,
                style: TextStyle(
                    fontSize: 48.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Expanded(
              child: Divider(color: Colors.grey),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.03,
                  child: Table(
                    border: TableBorder.all(
                        color: Colors.blueGrey.shade900, width: 1),
                    children: [],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 1,
                  child: Table(
                    border: TableBorder.all(color: Colors.white54, width: 1.0),
                    children: [
                      TableRow(children: [
                        buildButton('%'),
                        buildButton('CE'),
                        buildButton('C'),
                        buildButton('⌫')
                      ]),
                      TableRow(
                        children: [
                          buildButton('1/x'),
                          buildButton('x^2'),
                          buildButton('√'),
                          buildButton('÷')
                        ],
                      ),
                      TableRow(
                        children: [
                          buildButton('7'),
                          buildButton('8'),
                          buildButton('9'),
                          buildButton('×')
                        ],
                      ),
                      TableRow(
                        children: [
                          buildButton('4'),
                          buildButton('5'),
                          buildButton('6'),
                          buildButton('-')
                        ],
                      ),
                      TableRow(
                        children: [
                          buildButton('1'),
                          buildButton('2'),
                          buildButton('3'),
                          buildButton('+')
                        ],
                      ),
                      TableRow(
                        children: [
                          buildButton('+/-'),
                          buildButton('0'),
                          buildButton('.'),
                          buildButton('=')
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
