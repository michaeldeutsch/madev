import "package:flutter/material.dart";

class AndernApp extends StatefulWidget {
  const AndernApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AndernApp();
  }
}

class _AndernApp extends State<AndernApp> {
  String msg = "Standard";

  void changeText() {
    setState(() {
      msg = "Wurde verändert";
    });

    print("es wurde doch geklickt");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Ändern App",
      home: Scaffold(
        appBar: AppBar(title: Text("data")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(msg, style: TextStyle(fontSize: 33)),
              Text("statischer Text"),
              SizedBox(height: 20),
              ElevatedButton(onPressed: changeText, child: Text("Klick mich")),
            ],
          ),
        ),
      ),
    );
  }
}
