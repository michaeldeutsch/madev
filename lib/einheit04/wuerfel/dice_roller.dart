import 'dart:math' show Random;
import 'package:flutter/material.dart';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var activeDiceImage = 'assets/images/dice-images/dice-5.png';

  final randoom = Random();
  
  double summe = 5.0;
  int anzahl = 1;
  double durchschnitt = 5.0;

  void rollDice() {
    var diceRoll = randoom.nextInt(7) + 1;

    setState(() {
      activeDiceImage = 'assets/images/dice-images/dice-$diceRoll.png';
      summe = summe + diceRoll;
      anzahl = anzahl + 1;
      durchschnitt = summe / anzahl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          (durchschnitt).toStringAsFixed(2),
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        Image.asset(activeDiceImage, width: 200, height: 200),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            padding: EdgeInsets.all(25.0),
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            textStyle: TextStyle(fontSize: 18),
          ),
          child: Text("Press Me"),
        ),
      ],
    );
  }
}
