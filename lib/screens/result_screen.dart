import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

import 'loading_screen.dart';

class Result extends StatefulWidget {
  const Result({Key? key}) : super(key: key);

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 3000), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading ? LoadingScreen() : ResultScreen();
  }
}

// enum ResultLocationMTV { kitchensync, fishfood }

enum ResultLocationNYC { anagrams, domain, five, cultured }
// enum ResultLocationSEA { bluebill, troll }

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  ResultLocationNYC? selectedLocation = ResultLocationNYC.anagrams;
  // ResultLocationSEA? selectedLocation = ResultLocationSEA.bluebill;
  final ConfettiController _controllerCenter = ConfettiController(
    duration: const Duration(seconds: 1),
  );

  /// A custom Path to paint stars.
  Path drawStar(Size size) {
    // Method to convert degree to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }

  @override
  Widget build(BuildContext context) {
    // List<String> locationAtMTV = ["KitchenSync", "Fishfood"];
    List<String> locationAtNYC = [
      "Anagrams",
      "Domain",
      "5 Borough Bistro",
      "Cultured"
    ];
    // List<String> locationAtSEA = ["Bluebill & Mallard", "Troll Cafe"];

    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 60),
                  const Text("Your Matches",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  Container(
                    padding: EdgeInsets.all(20),
                    width: double.infinity,
                    child: Column(children: [
                      for (int i = 0; i < locationAtNYC.length; i++)
                        RadioListTile<ResultLocationNYC>(
                          title: Text(locationAtNYC[i],
                              style: TextStyle(color: Colors.black)),
                          value: ResultLocationNYC.values[i],
                          groupValue: selectedLocation,
                          onChanged: (ResultLocationNYC? value) {
                            setState(() {
                              selectedLocation = value;
                            });
                          },
                          activeColor: Colors.blue,
                        ),
                      // RadioListTile<ResultLocationMTV>(
                      //   title: const Text('KitchenSync',
                      //       style: TextStyle(color: Colors.black)),
                      //   value: ResultLocationMTV.kitchensync,
                      //   groupValue: selectedLocation,
                      //   onChanged: (ResultLocationMTV? value) {
                      //     setState(() {
                      //       selectedLocation = value;
                      //     });
                      //   },
                      //   activeColor: Colors.blue,
                      // ),
                      // RadioListTile<ResultLocationMTV>(
                      //   title: const Text('Fishfood',
                      //       style: TextStyle(color: Colors.black)),
                      //   value: ResultLocationMTV.fishfood,
                      //   groupValue: selectedLocation,
                      //   onChanged: (ResultLocationMTV? value) {
                      //     setState(() {
                      //       selectedLocation = value;
                      //     });
                      //   },
                      //   activeColor: Colors.blue,
                      // ),
                    ]),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: ConfettiWidget(
                      confettiController: _controllerCenter,
                      blastDirectionality: BlastDirectionality
                          .explosive, // don't specify a direction, blast randomly
                      shouldLoop:
                          true, // start again as soon as the animation is finished
                      colors: const [
                        Colors.red,
                        Colors.blue,
                        Colors.yellow,
                        Colors.green
                      ], // manually specify the colors to be used
                      createParticlePath:
                          drawStar, // define a custom shape/path.
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          _controllerCenter.play();
                        },
                        child: Text('Schedule!'),
                      )),
                ],
              )),
        ));
  }
}
