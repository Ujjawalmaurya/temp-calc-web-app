import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tempcalc/calculation.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

enum TemperatureType { fahrenheit, celsius, kelvin }

class _HomeState extends State<Home> {
  TemperatureType tempType = TemperatureType.fahrenheit;
  double temperature = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: SizedBox(
          width: 650,
          height: 700,
          child: Card(
            surfaceTintColor: Colors.deepOrange,
            // shadowColor: Colors.deepPurpleAccent,
            shadowColor: Theme.of(context).colorScheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
              side: BorderSide(color: Theme.of(context).colorScheme.primary, width: 2),
            ),
            elevation: 25,

            margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 35),
                    child: Text(
                      'Temperature Converter',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ),
                  SegmentedButton(
                    style: const ButtonStyle(
                      // elevation: MaterialStatePropertyAll(1),
                      // foregroundColor: MaterialStatePropertyAll(Colors.grey),
                      iconSize: MaterialStatePropertyAll(30),
                      padding: MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 22, horizontal: 2)),
                    ),
                    // selectedIcon: const Icon(Icons.check_circle_outline_rounded),
                    showSelectedIcon: false,
                    segments: const <ButtonSegment<TemperatureType>>[
                      ButtonSegment<TemperatureType>(
                        value: TemperatureType.fahrenheit,
                        label: Text('Fahrenheit'),
                        icon: Icon(Icons.flaky_rounded),
                      ),
                      ButtonSegment<TemperatureType>(
                        value: TemperatureType.celsius,
                        label: Text('Degree Celsius '),
                        icon: Icon(Icons.currency_lira_sharp),
                      ),
                      ButtonSegment<TemperatureType>(
                        value: TemperatureType.kelvin,
                        label: Text('Kelvin'),
                        icon: Icon(Icons.soup_kitchen_sharp),
                      ),
                    ],
                    selected: <TemperatureType>{tempType},
                    onSelectionChanged: (val) => setState(() {
                      tempType = val.first;
                      log(tempType.toString());
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: TextFormField(
                      maxLength: 8,
                      style: const TextStyle(fontSize: 20),
                      autofocus: true,
                      onChanged: (value) {
                        if (value.trim() != '') {
                          setState(() {
                            temperature = double.parse(value);
                          });
                        } else {
                          setState(() {
                            temperature = 00.0;
                          });
                        }
                      },
                      inputFormatters: const [],
                      decoration: InputDecoration(
                        suffixText: tempType == TemperatureType.celsius
                            ? "(°C)"
                            : (tempType == TemperatureType.fahrenheit)
                                ? "(°F)"
                                : "(K)",

                        contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(width: 1.5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        prefixIcon: const Icon(Icons.keyboard_alt_sharp),
                        hintText: "Value",
                        alignLabelWithHint: true,

                        label: Text(
                            "Temperature ${tempType == TemperatureType.celsius ? "in Celsius" : (tempType == TemperatureType.fahrenheit) ? "in Fahrenheit" : "in Kelvin"}"),
                        // suffixIcon: const Icon(Icons.terminal_outlined),
                      ),
                    ),
                  ),
                  Text(
                    // Convert.convertFromF(temperature),
                    tempType == TemperatureType.celsius
                        ? Conversion.fromCelsius(temperature)
                        : (tempType == TemperatureType.fahrenheit)
                            ? Conversion.fromFahrenheit(temperature)
                            : Conversion.fromKelvin(temperature),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
