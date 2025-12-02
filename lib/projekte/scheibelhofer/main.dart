import 'package:flutter/material.dart';
import 'app_state.dart';
import "sollwert_screen.dart";
import "input_screen.dart";  
import "statistik_screen.dart";
import "home_screen.dart";

//Flutter startet hier die App und zeigt das MyApp Widget an
void main() {             
  runApp(MyApp());
}

//MyApp ist das Haupt-Widget der App
class MyApp extends StatefulWidget {      // StatefulWidget, da sich app_state.dart laufend ändert
  const MyApp({super.key});               // Konstruktor

  @override
  State<MyApp> createState() => _MyAppState();   //State erstellen //Ohne diese Zeile hätte das StatefulWidget keinen Zustand („State“) und könnte sich nicht ändern.
}

//State-Klasse für MyApp // Hier wird der eigentliche Zustand der App verwaltet //Globaler Speicher, den sich alle Screens teilen
class _MyAppState extends State<MyApp> {
  final AppState appState = AppState();

  @override
  Widget build(BuildContext context) {    // build-Methode baut die UI der App zusammen
    return MaterialApp(                   // MaterialApp ist das Grundgerüst einer Flutter-App
      title: "Statistik App",             // Titel der App
      initialRoute: "/home",              // Start-Screen der App //In dem Fall der home_screen.dart
      routes: {
        "/home": (context) => HomeScreen(appState: appState),         //Übersicht Screen
        "/soll": (context) => SollwertScreen(appState: appState),     //Sollwert Screen
        "/input": (context) => InputScreen(appState: appState),       //Input Screen 
        "/stats": (context) => StatistikScreen(appState: appState),   //Statistik Screen
      },
    );
  }
}
