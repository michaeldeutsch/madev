# Mobile Applikationsentwicklung – Zweite Einheit  
**Fachhochschule des BFI Wien**  
Studiengang: Projektmanagement und IT  
Lehrveranstaltung: Mobile Applikationsentwicklung  
Dozent: Michael Deutsch  
Semester: WS25  

---

## 📘 Lehrveranstaltungsbeschreibung

Diese Lehrveranstaltung vermittelt die theoretischen und praktischen Grundlagen der Entwicklung mobiler Applikationen.  
Im Fokus stehen **plattformübergreifende Frameworks**, Architekturprinzipien, UI-Konzepte sowie Best Practices in der App-Entwicklung.  
Ziel ist es, Studierende in die Lage zu versetzen, **mobile Anwendungen eigenständig zu konzipieren, zu gestalten und zu implementieren**.

Die zweite Einheit konzentriert sich auf den Einstieg in **Flutter** – Googles modernes Framework für plattformübergreifende App-Entwicklung mit einer einheitlichen Codebasis für Android, iOS, Web und Desktop.

---

## 🧭 Themenübersicht der zweiten Einheit

| Nr. | Thema | Inhalt / Lernziel |
|:--:|:--|:--|
| 1 | **Flutter – Basis-Konzepte** | Verständnis der Flutter-Architektur, Entwicklungsumgebung (SDK, Hot Reload), Unterschiede zu nativen Frameworks. |
| 2 | **Widget Tree – Struktur und Bedeutung** | Einführung in das zentrale Konzept der Widget-Hierarchie; Erklärung von Stateless und Stateful Widgets. |
| 3 | **MaterialApp – Einstieg in das Designsystem** | Aufbau einer typischen Flutter-App mit `MaterialApp`, Nutzung von Themes, Routing und Scaffold. |
| 4 | **Praxisbeispiele & Layoutübungen** | Umsetzung kleiner Projekte zur Festigung der theoretischen Inhalte; Analyse des Widget-Baums und Anwendung von Material-Komponenten. |

---

## 🧩 Inhalt des Repositorys

Die herunterladbare ZIP-Datei (`zweiteEinheit.zip`) enthält vier Beispielprojekte, die Schritt für Schritt die wichtigsten Flutter-Grundlagen demonstrieren:

### 🔹 Beispiel 1: *Flutter Basics*
**Theorie:**  
Einführung in das Flutter SDK, Projektstruktur (`lib`, `pubspec.yaml`, `main.dart`) und die Rolle der `runApp()`-Funktion.  
**Praxis:**  
Ein einfaches „Hello Flutter“-Projekt mit Ausgabe eines Text-Widgets auf dem Bildschirm.

---

### 🔹 Beispiel 2: *Widget Tree Exploration*
**Theorie:**  
Jede Flutter-App besteht aus einer Baumstruktur von Widgets. Widgets sind die kleinsten Bausteine der Benutzeroberfläche und können in sich wiederum andere Widgets enthalten.  
**Praxis:**  
Visualisierung des Widget-Baums; Kombination mehrerer Layout-Widgets (`Column`, `Row`, `Container`, `Center`) zur Gestaltung einer strukturierten Oberfläche.

---

### 🔹 Beispiel 3: *MaterialApp in Action*
**Theorie:**  
Die `MaterialApp`-Klasse bildet das Fundament für jede Flutter-App nach Material Design. Sie ermöglicht Routing, thematische Gestaltung und zentrale Steuerung der App-Struktur.  
**Praxis:**  
Erstellung einer Anwendung mit `MaterialApp`, Nutzung von `Scaffold`, `AppBar`, `FloatingActionButton` und Navigation zwischen Views.

---

### 🔹 Beispiel 4: *Stateful Interactions*
**Theorie:**  
Unterschied zwischen **Stateless** und **Stateful Widgets**. Zustandsverwaltung ist ein zentrales Thema in Flutter-Apps.  
**Praxis:**  
Implementierung eines einfachen Zählers oder Interaktions-Widgets mit `setState()` und dynamischer Aktualisierung der UI.

---

## 🧠 Theoretischer Hintergrund

- **Framework-Struktur:** Flutter basiert auf der Programmiersprache **Dart**, welche sowohl deklarative als auch objektorientierte Programmierung unterstützt.  
- **Declarative UI:** Oberflächen werden beschrieben, nicht imperativ erstellt. Änderungen im Zustand (State) führen automatisch zu einer Neurenderung.  
- **Hot Reload:** Ermöglicht sofortige Vorschau von Änderungen ohne Neustart der App.  
- **Material Design:** Einheitliches, modernes Designsystem von Google zur Gestaltung intuitiver, ästhetischer Benutzeroberflächen.  

---

## 📅 Chronologie der Lehrveranstaltung (Kurzüberblick)

| Einheit | Schwerpunkt | Inhalte |
|:--:|:--|:--|
| 1 | Installation, Cross-Development-Ansatz, Flutter 
| 2 | **Grundlagen Flutter** | *Diese Einheit* – Aufbau, Widget Tree, MaterialApp | Virtualisierung aufgrund Installationsproblematik 
| 3 | Interaktion & State | Stateful Widgets, Event Handling, Navigation | Routing
| 4 | Daten & Persistenz | ...| 


---

## 🧑‍💻 Lizenz & Nutzung

Dieses Repository dient ausschließlich **zu Lehr- und Übungszwecken** im Rahmen der Lehrveranstaltung *Mobile Applikationsentwicklung* an der Fachhochschule des BFI Wien.  
Die enthaltenen Beispiele dürfen zu Studienzwecken frei verändert und erweitert werden.

---
