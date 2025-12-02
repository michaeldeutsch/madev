import 'package:flutter/material.dart';
import "app_state.dart";

class HomeScreen extends StatelessWidget {        //StatelessWidget, da sich dieser Screen nicht ändert
  final AppState appState;                        //Hier bekommt die Variable appState den "globalen Speicher"-AppState zugewiesen
  const HomeScreen({super.key, required this.appState});    //Konstruktor

  @override       //Überschreiben der build-Methode, die sich in der Main.dart befindet
  Widget build(BuildContext context) {      
    return Scaffold(                                                      //Scaffold ist das Grundgerüst eines Screens  
      appBar: AppBar(title: Text("DailyTracker")),                       //AppBar ist die obere Leiste des Screens
      body: Center(                                                       //Body ist der Hauptbereich des Screens 
        child: Column(                                                    //Column ordnet die child-Widgets untereinander an  
          mainAxisAlignment: MainAxisAlignment.center,                    //Zentriert die Widgets vertikal   
          
          children: [                                                     //Liste der Widgets, die in der Column angezeigt werden 
            Text("Let’s track your day", style: TextStyle(fontSize: 24)),          //Text-Widget mit dem Text "Willkommen!" und Schriftgröße 24
            SizedBox(height: 30),                                         //SizedBox fügt einen Abstand von 30 Pixeln ein 
            ElevatedButton(                                               //ElevatedButton ist ein Button mit erhöhter Optik 
              onPressed: () => Navigator.pushNamed(context, "/soll"),     //Beim Drücken des Buttons wird zur Route "/soll" navigiert
              child: Text("Soll-Werte festlegen"),                        //Text, der auf dem Button angezeigt wird
            ),
            SizedBox(height: 20),                                         //SizedBox fügt einen Abstand von 20 Pixeln ein    
            ElevatedButton(                                               //Wieder ein ElevatedButton
              onPressed: () => Navigator.pushNamed(context, "/input"),    //Beim Drücken des Buttons wird zur Route "/input" navigiert
              child: Text("Werte eintragen"),                             //Text, der auf dem "IST-Button" angezeigt wird 
            ),
            SizedBox(height: 20),                                         //SizedBox fügt einen Abstand von 20 Pixeln ein    
            ElevatedButton(                                               //Wieder ein ElevatedButton  
              onPressed: () => Navigator.pushNamed(context, "/stats"),    //Beim Drücken des Buttons wird zur Route "/stats" navigiert
              child: Text("Statistik ansehen"),                           //Text, der auf dem "Statistik-Button" angezeigt wird 
            ),
          ],
        ),
      ),
    );
  }
}
