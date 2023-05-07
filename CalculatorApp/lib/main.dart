// Basic Calculator App through Flutter
/* Name: Aman Ajay Challirwar
   Task 1: Calculator App(having basic functions like +,-,*,/)
 */
// import 'dart:html';

import 'package:basic_calculator/colors.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CalculatorApp(),
  ));
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  // variables
  double firstNum = 0.0;
  double secondName = 0.0;
  var input = '';
  var output = '';
  var operation = '';
  var hideInput = false;
  var outputSize = 52.0;
  
  onButtonClick(value) {

    if (value == "AC") {
      input = '';
      output = '';
      hideInput = false;
      /* Note that on clicking "AC" tab, it will not display new inputs and
      operators which you will click on the screen but it will calculate the
      input's output and will display on the screen
       */
    }

    else if (value == "<") {

      if (input.isNotEmpty) {
        input = input.substring(0,input.length-1);
      }
    }

    else if (value == "=") {

      if (input.isNotEmpty) {
        var userInput = input;
        userInput = input.replaceAll("x", "*");
        Parser p = Parser();
        Expression expression = p.parse(userInput);
        ContextModel cm = ContextModel();
        var finalValue = expression.evaluate(EvaluationType.REAL, cm);
        output = finalValue.toString();
        if (output.endsWith("0")) {
          output = output.substring(0,output.length-2);
        }
        input = output;
        hideInput = true;

      }
    }

    else {
      input += value;
    }

    setState(() {


    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.black,
      body: Column(
        children: [
          // input output area
          Expanded(
              child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                       Text(
                        hideInput ? '' : input,
                        style: TextStyle(
                          fontSize: 48,
                          color: Colors.white,
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      Text(
                        output,
                        style: TextStyle(
                          fontSize: outputSize,
                          color: Colors.white.withOpacity(0.7),
                        ),
                      ),

                      SizedBox(
                        height: 30,
                      )

                    ],
                  ))),
          // buttons area

          Row(
            children: [
              button(text: "AC", tColor: Colors.green),
              button(text: "<", tColor: Colors.green),
              button(text: "", buttonBgColor: Colors.transparent),
              button(text: "/", tColor: Colors.green)],
          ),

          Row(
            children: [
              button(text: "7"),
              button(text: "8"),
              button(text: "9"),
              button(text: "x", tColor: Colors.green)],
          ),

          Row(
            children: [
              button(text: "4"),
              button(text: "5"),
              button(text: "6"),
              button(text: "-", tColor: Colors.green)],
          ),

          Row(
            children: [
              button(text: "1"),
              button(text: "2"),
              button(text: "3"),
              button(text: "+", tColor: Colors.green)],
          ),

          Row(
            children: [
              button(text: "%"),
              button(text: "0"),
              button(text: "."),
              button(text: "=", buttonBgColor: Colors.green)],
          ),


        ],

      ),
    );
  }

  Widget button({
    text, tColor = Colors.white, buttonBgColor = buttonColor
  }) {
    return Expanded(
        child:
        Container(
            margin: EdgeInsets.all(8.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(22),
                    backgroundColor: buttonBgColor),
                onPressed: () => onButtonClick(text), child: Text(text, style: TextStyle(
              fontSize: 18,
              color: tColor,
              fontWeight: FontWeight.bold,
            ),))));
  }
}
