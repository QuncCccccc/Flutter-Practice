import 'package:flutter/material.dart';

import 'dash.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
              padding: EdgeInsets.all(20),
              // decoration: const BoxDecoration(color: Colors.white),
              child: Flex(
                mainAxisAlignment: MainAxisAlignment.center,
                direction: Axis.vertical,
                children: const [
                  SizedBox(height: 60),
                  Flexible(
                      flex: 1,
                      child: Text("Finding your tasty food now...",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black))),
                  Flexible(
                      flex: 3,
                      child: Dash(
                        dancing: true,
                      )),
                ],
              )),
        ));
  }
}
