import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'loc_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
            padding: EdgeInsets.all(20),
            // decoration: const BoxDecoration(color: Colors.white),
            child: Column(children: <Widget>[
              SizedBox(height: 60),
              Container(
                padding: EdgeInsets.only(left: 10),
                width: double.infinity,
                child: const Text("About",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: const Text(
                    "Google Food is a convenient way to search for food or a cafe on campus given criteria like food restrictions, allergies, meal time preference, how much time you have between meetings, the weather, and preference for cuisine. Google Food will automatically identify time in your calendar and schedule meals for you based on all of your preferences and where your last and next meetings are.",
                    style: TextStyle(
                        // your text
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.black)),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Row(
                  children: <Widget>[
                    // Theme(
                    //     data: Theme.of(context).copyWith(
                    //       unselectedWidgetColor: Colors.grey,
                    //     ),
                    Checkbox(
                        checkColor: Colors.white, // color of tick Mark
                        activeColor: Colors.grey,
                        value: isChecked,
                        onChanged: (value) =>
                            (setState(() => isChecked = value!))),
                    const Expanded(
                      child: Text(
                          "Sync with Google Calendar for easy scheduling",
                          style: TextStyle(color: Colors.black, fontSize: 16)),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                    // color: Colors.grey,
                    ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                child: RichText(
                  text: TextSpan(
                      style: const TextStyle(
                          color: Colors.blue,
                          decorationColor: Colors.blue,
                          decoration: TextDecoration.underline),
                      text: "Data Policy",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          var url =
                              "https://policies.google.com/privacy?hl=en-US";
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        }),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LocationScreen()),
                    );
                  },
                  child: const Text('Find Food!'),
                ),
              )
            ])),
      ),
    );
  }
}
