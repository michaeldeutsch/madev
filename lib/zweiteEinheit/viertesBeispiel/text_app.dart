import 'package:flutter/material.dart';

class TextApp extends StatefulWidget {
  const TextApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TextAppState();
  }
}

class _TextAppState extends State<TextApp> {
  TextEditingController _controller = TextEditingController();
  String data = "noch leer";

  void changeText() {
    setState(() {
      data = data + _controller.text;
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Änderne Text",
      home: Scaffold(
        appBar: AppBar(title: Text("Es werden sich Dinge ändern")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                data,
                style: TextStyle(fontSize: 20),
              ), // wo die Daten dynamischen
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    labelText: "Name",
                    hintText: "Bitte Namen eingeben",
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(onPressed: changeText, child: Text("Übertragen")),
            ],
          ),
        ),
      ),
    );
  }
}
