import 'package:flutter/material.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 100),
              Container(
                width: double.infinity,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black) // non-emoji characters
                    ,
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Welcome to Google Food',
                          style: TextStyle(color: Colors.black)),
                      TextSpan(
                        text: '🍕', // emoji characters
                        style: TextStyle(
                          fontFamily: 'EmojiOne',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 130),
              Container(
                  width: double.infinity,
                  child: Image.asset("assets/food-service.gif"))
            ],
          ),
        ),
      ),
    );
  }
}
