import 'package:flutter/material.dart';
import 'my_container.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final List<Color> colors = [
    Colors.yellowAccent,
    Colors.redAccent,
    Colors.blueAccent.shade400,
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Dice Roller')),
        body: MainContainer(colors),
      ),
    );
  }
}
