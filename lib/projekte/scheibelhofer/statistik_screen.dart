import 'package:flutter/material.dart';
import "app_state.dart";  

class StatistikScreen extends StatefulWidget {                  //StatefulWidget, da sich app_state.dart ändert, wenn der User Werte einträgt oder zurücksetzt
  final AppState appState;                                      //Hier bekommt die Instanzvariable appState den "globalen Speicher"-AppState zugewiesen
  const StatistikScreen({super.key, required this.appState});   //Konstruktor

  
  @override
  _StatistikScreenState createState() => _StatistikScreenState();   //Erstellt den State für dieses StatefulWidget //Ohne diese Zeile hätte das StatefulWidget keinen Zustand („State“) und könnte sich nicht ändern.
}

class _StatistikScreenState extends State<StatistikScreen> {        //State-Klasse für StatistikScreen anlegen // Hier wird der eigentliche Zustand des StatistikScreens verwaltet
  @override
void initState() {                                                  //Initialisierung des States  
  super.initState();                                                //Aufruf der initState-Methode der Superklasse
  widget.appState.addListener(_onAppStateChanged);                  //Hinzufügen eines Listeners, der auf Änderungen im AppState hört   
}

void _onAppStateChanged() {                                         //Methode, die aufgerufen wird, wenn sich der AppState ändert
  setState(() {});                                                  //Wenn sich der AppState ändert, wird die UI neu aufgebaut, um die aktuellen Werte anzuzeigen
}

@override
void dispose() {                                                    //Aufräumen des States                        
  widget.appState.removeListener(_onAppStateChanged);               //Entfernen des Listeners, wenn der Screen nicht mehr benötigt wird    
  super.dispose();                                                  //Aufruf der dispose-Methode der Superklasse
}
  
  
  @override
  Widget build(BuildContext context) {                          //Überschreiben der build-Methode, die sich in der Main.dart befindet   
    return Scaffold(                                            //Scaffold ist das Grundgerüst eines Screens
      appBar: AppBar(title: Text("Statistik")),                 //AppBar ist die obere Leiste des Screens            
      body: Padding(                                            //Body ist der Hauptbereich des Screens        
        padding: EdgeInsets.all(20),                            //Padding fügt einen Abstand von 20 Pixeln um den Body hinzu               
        child: Column(                                          //Column ordnet die child-Widgets untereinander an      
          crossAxisAlignment: CrossAxisAlignment.start,         //Richtet die Kinder-Widgets der Column am Anfang (links) aus  
          children: [                                           //Liste der Widgets, die in der Column angezeigt werden
            _buildRow("Schritte", widget.appState.sollSteps, widget.appState.istSteps),         
            _buildRow("Schlaf (h)", widget.appState.sollSleep, widget.appState.istSleep),
            _buildRow("Wasser (L)", widget.appState.sollWater, widget.appState.istWater),
            _buildRow("Kalorien", widget.appState.sollCalories, widget.appState.istCalories),     //Hier wird der aktuelle Zustand aus dem AppState ausgelesen.  //Wie genau, siehe Methode _buildRow unten
          
          SizedBox(height: 30),                                  //SizedBox fügt einen Abstand von 30 Pixeln ein                    

          Center(                                               //Center zentriert das Kind-Widget horizontal                    
            child: ElevatedButton(                              //ElevatedButton ist ein Button mit erhöhter Optik             
              onPressed: () {                                   //Beim Drücken des Buttons "Alles zurücksetzen" wird folgendes ausgeführt         
                widget.appState.reset();                               //Aufruf der reset-Methode aus app_state.dart, die alle Werte zurücksetzt   
                
                ScaffoldMessenger.of(context).showSnackBar(       //Anzeigen einer SnackBar als Bestätigung, dass alle Werte zurückgesetzt wurden
                  SnackBar(content: Text("Alle Werte wurden zurückgesetzt")),   //Text, der in der SnackBar angezeigt wird
                );
              },
              child: Text("Alles zurücksetzen"),
            ),
          ),

          
          ],
          
        ),
      ),
    );
  }

  Widget _buildRow(String label, int soll, int ist) {         //Methode zum Erstellen einer Zeile mit Label-Name, Soll- und Ist-Wert
    int diff = soll - ist;                                    //Berechnung der Differenz zwischen Soll- und Ist-Wert                   
    return Padding(                                           //Padding fügt einen Abstand um die Zeile hinzu
      padding: EdgeInsets.only(bottom: 20),                     //Abstand von 20 Pixeln unten     
      child: Column(                                          //Column ordnet die child-Widgets untereinander an                
        crossAxisAlignment: CrossAxisAlignment.start,         //Richtet die Kinder-Widgets der Column am Anfang (links) aus 
        children: [                                           //Liste der Widgets, die in der Column angezeigt werden            
          Text(label, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),       //Text-Widget mit dem Label-Namen, Schriftgröße 18 und fetter Schrift
          Text("Soll: $soll"),                                //Text-Widget mit dem Soll-Wert           
          Text("Ist:  $ist"),                                 //Text-Widget mit dem Ist-Wert  
          Text("Offen: $diff"),                               //Text-Widget mit der Differenz zwischen Soll- und Ist-Wert 
        ],
      ),
    );
  }
}
