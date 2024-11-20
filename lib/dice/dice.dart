import 'dart:math';
import 'package:flutter/material.dart';

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void randomDiceNumber() {
    leftDiceNumber = Random().nextInt(6) + 1;
    rightDiceNumber = Random().nextInt(6) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Dicee'),
      ),
      body: Center(
        child: Row(
          children: <Widget>[
            Expanded(
              child: TextButton(
                onPressed: () {
                  setState(() {
                    randomDiceNumber();
                  });
                },
                child: Image.asset('assets/images/dice$leftDiceNumber.png'),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () {
                  setState(() {
                    randomDiceNumber();
                  });
                },
                child: Image.asset('assets/images/dice$rightDiceNumber.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
