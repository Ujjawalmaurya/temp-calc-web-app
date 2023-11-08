import 'package:flutter/material.dart';
import 'package:tempcalc/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Temperature Calculator webApp ',
      darkTheme: ThemeData(
        colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: Colors.greenAccent,
          onPrimary: Colors.orangeAccent,
          secondary: Colors.blueGrey,
          onSecondary: Colors.tealAccent,
          error: Colors.redAccent,
          onError: Colors.red,
          background: Colors.black54,
          onBackground: Colors.grey,
          surface: Colors.purpleAccent,
          onSurface: Colors.white,
        ),
        // useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
        // useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}
