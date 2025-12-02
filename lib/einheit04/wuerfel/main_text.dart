import 'package:flutter/material.dart';
import 'dice_roller.dart';

class MainText extends StatelessWidget {

  const MainText({super.key});

 
  @override
  Widget build(BuildContext context) {
    return Center(
      child: DiceRoller(),
    );
  }


}
