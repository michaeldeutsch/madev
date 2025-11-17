import 'package:flutter/material.dart';
import 'screens/final_screen.dart';
import 'screens/home_screen.dart';
import 'screens/second_screen.dart';


class MyApp extends StatelessWidget{
  
  const MyApp({super.key});
  
  @override
  Widget build(Object context) {
    return MaterialApp(
      title: "Navigation",
      initialRoute: "/home",

      routes: {
        "/home": (context) => HomeScreen(),
        "/second": (context) => SecondScreen(),
        "/final": (context) => FinalScreen(),

      },
    );
  }

  

}