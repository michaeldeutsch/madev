import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget{
  
  const SecondScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Second Screen")),
        body: Center(
          child: Column(
            children: [
              Text("Bin auf der zweiten Seite"),
              ElevatedButton(onPressed: (){
                    Navigator.pop(context);

              }, child: Text("Zurück zur Home-Seite")),
              BackButton(onPressed: () {

              }),
              ElevatedButton(onPressed: (){
                Navigator.pushNamed(context, "/final");
              }, child: Text("Zur Final-Seite"))
            ],
          ),
        ),





    );
  }


  
} 