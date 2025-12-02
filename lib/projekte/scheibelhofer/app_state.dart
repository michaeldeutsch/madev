import 'package:flutter/material.dart';

//AppState ist der zentrale Speicher der App und ChangeNotifier erlaubt es den Screens, informiert zu werden, wenn sich Daten ändern. 
class AppState extends ChangeNotifier {             
  // Sollwerte
  int sollSteps = 0;
  int sollSleep = 0;
  int sollWater = 0;
  int sollCalories = 0;

  // Istwerte
  int istSteps = 0;
  int istSleep = 0;
  int istWater = 0;
  int istCalories = 0;

  // Methoden zum Setzen der Sollwerte
  void setSollwerte(int steps, int sleep, int water, int calories) {
    sollSteps = steps;
    sollSleep = sleep;
    sollWater = water;
    sollCalories = calories;
    notifyListeners();
  }

  // Istwerte addieren
  void addIstwerte(int steps, int sleep, int water, int calories) {
    istSteps += steps;
    istSleep += sleep;
    istWater += water;
    istCalories += calories;
    notifyListeners();
  }

  // Methode zum Zurücksetzen aller Werte
  void reset() {
  sollSteps = 0;
  sollSleep = 0;
  sollWater = 0;
  sollCalories = 0;

  istSteps = 0;
  istSleep = 0;
  istWater = 0;
  istCalories = 0;

  notifyListeners();
}

}
