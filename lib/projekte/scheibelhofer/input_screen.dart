import 'package:flutter/material.dart';
import "app_state.dart";

class InputScreen extends StatefulWidget {                      //StatefulWidget, da sich dieser Screen ändert, wenn der Nutzer Werte eingibt
  final AppState appState;                                       //Hier bekommt die Instanzvariable appState den "globalen Speicher"-AppState zugewiesen
  const InputScreen({super.key, required this.appState});         //Konstruktor

  @override
  State<InputScreen> createState() => _InputScreenState();      //Erstellt den State für dieses StatefulWidget //Ohne diese Zeile hätte das StatefulWidget keinen Zustand („State“) und könnte sich nicht ändern.
}

class _InputScreenState extends State<InputScreen> {            //State-Klasse für InputScreen anlegen // Hier wird der eigentliche Zustand des InputScreens verwaltet
  final stepsController = TextEditingController();
  final sleepController = TextEditingController();
  final waterController = TextEditingController();
  final caloriesController = TextEditingController();           //für jedes Textfeld gibt es einen Controller, um die Eingaben auszulesen

  @override
  Widget build(BuildContext context) {                          //Überschreiben der build-Methode, die sich in der Main.dart befindet
    return Scaffold(                                            //Scaffold ist das Grundgerüst eines Screens                             
      appBar: AppBar(title: Text("Werte eintragen")),           //AppBar ist die obere Leiste des Screens   
      body: Center(                                             //Body ist der Hauptbereich des Screens                       
        child: SingleChildScrollView(                           //SingleChildScrollView ermöglicht das Scrollen, falls der Inhalt größer als der Bildschirm ist        
          child: Column(                                        //Column ordnet die child-Widgets untereinander an                    
            children: [                                         //Liste der Widgets, die in der Column angezeigt werden
              _buildTextField("Schritte", stepsController),
              _buildTextField("Schlaf (h)", sleepController),
              _buildTextField("Wasser (L)", waterController),
              _buildTextField("Kalorien", caloriesController),  //Jedes Textfeld wird mit seinem eigenen Namen erstellt (erstellt durch die Methode _buildTextField, siehe unten) und bekommt seinen Controller, der durch die Methode verlangt wird
              SizedBox(height: 20),                             //SizedBox fügt einen Abstand von 20 Pixeln ein                  
              ElevatedButton(
                onPressed: () {                                 //Beim Drücken des Buttons "Hinzufügen" wird folgendes ausgeführt
                  widget.appState.addIstwerte(                  //die vom User eingetragenen Ist-Werte werden dem AppState hinzugefügt //Hier wird addiert statt gesetzt, da ja die Ist-Werte laufend ergänzt werden
                    int.tryParse(stepsController.text) ?? 0,
                    int.tryParse(sleepController.text) ?? 0,
                    int.tryParse(waterController.text) ?? 0,
                    int.tryParse(caloriesController.text) ?? 0,   //Eingegebene Werte werden in Integer umgewandelt (da ja in einem Textfeld ein Text eingegeben wird: "300") und in Variable istCalories gespeichert  //Falls Eingabe ungültig, wird 0 gesetzt
                  );
                  Navigator.pop(context);                         //Nach dem Hinzufügen wird zum vorherigen Screen zurückgekehrt, also gleich zum HomeScreen wieder   
                },
                child: Text("Hinzufügen"),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {     //Methode zum Erstellen eines Textfelds mit Label-Name und Controller
    return Padding(                                                            //Padding fügt einen Abstand um das Textfeld hinzu
      padding: EdgeInsets.all(12),                                             //Abstand von 12 Pixeln  
      child: SizedBox(                                                         //SizedBox legt die Größe des Textfelds fest                       
        width: 250,                                                            //Breite des Textfelds auf 250 Pixel festgelegt 
        child: TextField(                                                      //TextField ist das eigentliche Eingabefeld
          controller: controller,                                             //Controller wird dem TextField zugewiesen, um die Eingabe auszulesen
          keyboardType: TextInputType.number,                                  //Tastaturtyp auf Nummern festgelegt, da ja nur Zahlen eingegeben werden sollen                    
          decoration: InputDecoration(labelText: label),                      //Damit man dem Textfeld den Label-Text (zb Schritte, Schlaf (h) usw) hinzufügen kann, der den Zweck des Felds beschreibt   
        ),
      ),
    );
  }
}
