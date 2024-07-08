import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'button.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {


  var userInput = '';
  var answer = '';


  @override
  Widget build(BuildContext context) {

    print('rebuild');
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(20),
                        alignment: Alignment.centerRight,
                        child: Text(
                          userInput,
                          style: const TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(15),
                        alignment: Alignment.centerRight,
                        child: Text(
                          answer,
                          style: const TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ]),
              ),
            ),

            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        MyButton(title: 'AC',onPress: () {
                          setState(() {
                            userInput = '';
                            answer = '0';
                          });
                          },
                          color: const Color(0xff616161),
                        ),
                        MyButton(title: '+/-',onPress: () {

                        },
                          color: const Color(0xff616161),
                        ),
                        MyButton(title: '%',onPress: () {
                          setState(() {
                            userInput += '%';
                          });
                        },
                          color: const Color(0xff616161),
                        ),
                        MyButton(title: '/',onPress: () {
                          setState(() {
                            userInput += '/';
                          });
                        }, color: const Color(0xff005DB2),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        MyButton(title: '7',onPress: () {
                          setState(() {
                            userInput += '7';
                          });
                        },),
                        MyButton(title: '8',onPress: () {
                          setState(() {
                            userInput += '8';
                          });
                        },),
                        MyButton(title: '0',onPress: () {
                          setState(() {
                            userInput += '0';
                          });
                        },),
                        MyButton(title: 'x',onPress: () {
                          setState(() {
                            userInput += 'x';
                          });
                        }, color: const Color(0xff005DB2),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        MyButton(title: '4',onPress: () {
                          setState(() {
                            userInput += '4';
                          });
                        },),
                        MyButton(title: '5',onPress: () {
                          setState(() {
                            userInput += '5';
                          });
                        },),
                        MyButton(title: '6',onPress: () {
                          setState(() {
                            userInput += '6';
                          });
                        },),
                        MyButton(title: '-',onPress: () {
                          setState(() {
                            userInput += '-';
                          });
                        }, color: const Color(0xff005DB2),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        MyButton(title: '1', onPress: () {
                          setState(() {
                            userInput += '1';
                          });
                        },
                        ),
                        MyButton(title: '2',onPress: () {
                          setState(() {
                            userInput += '2';
                          });
                        },),
                        MyButton(title: '3',onPress: () {
                          setState(() {
                            userInput += '3';
                          });
                        },),
                        MyButton(title: '+', onPress: () {
                          setState(() {
                            userInput += '+';
                          });
                        },color: const Color(0xff005DB2),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        MyButton(title: '0',onPress: () {
                          setState(() {
                            userInput += '0';
                          });
                        },),
                        MyButton(title: '.',onPress: () {
                          setState(() {
                            userInput += '.';
                          });
                        },),
                        MyButton(title: 'DEL',onPress: () {
                          setState(() {
                            userInput =
                                userInput.substring(0, userInput.length - 1);
                          });
                        },),
                        MyButton(title: '=', onPress: () {
                          equalPressed();
                          setState(() {

                          });
                        },color: const Color(0xff005DB2),),
                      ],
                    ),
                  ),

                ],
              ),
            ),


          ],
        ),
      ),
    );
  }


  void equalPressed() {

    String finaluserinput = userInput;
    finaluserinput = userInput.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finaluserinput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answer = eval.toString();
  }


}
