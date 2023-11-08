import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Temperature Calculator webApp ',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   title: const Text('widget.title'),
      // ),
      body: Center(
        child: SizedBox(
          width: 600,
          height: 600,
          child: Card(
            margin: EdgeInsets.symmetric(vertical: 50, horizontal: 50),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const TextField(
                    decoration: InputDecoration(
                        hintText: "Enter Values",
                        alignLabelWithHint: true,
                        suffixIcon: Icon(Icons.terminal_outlined)),
                  ),
                  // TextField(),
                  // ElevatedButton.icon(
                  //   onPressed: () {},
                  //   icon: const Icon(Icons.private_connectivity_sharp),
                  //   label: const Text("Convert"),
                  // )
                  Text("5847*C", style: Theme.of(context).textTheme.displayMedium)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
