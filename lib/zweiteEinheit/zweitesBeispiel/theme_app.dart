import 'package:flutter/material.dart';

class ThemeApp extends StatefulWidget {
  const ThemeApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ThemeAppState();
  }

  // State<ThemeApp> createState() => _ThemAppState();
}

class _ThemeAppState extends State<ThemeApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "THemen Example",
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.system,

      home: Scaffold(
        appBar: AppBar(title: Text("Theme Tutorial"),),
        body: Center(
            
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("data"),
                  SizedBox(height: 20,),
                  Text("asdf"),
                ],
              ),
        ),
      )



    );
  }
}
