import 'package:flutter/material.dart';
import 'package:google_food/screens/intro_screen.dart';
import 'package:google_food/screens/launch_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      // home: const IntroScreen(),
      home: const StartScreen(),
    );
  }
}

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  bool isLaunching = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 4500), () {
      setState(() {
        isLaunching = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLaunching ? LaunchScreen() : IntroScreen();
  }
}
