import 'package:flutter/material.dart';
import 'package:google_food/screens/time_picker_without_dialog.dart';

import 'food_preference_screen.dart';

class TimeScreen extends StatefulWidget {
  const TimeScreen({Key? key}) : super(key: key);

  @override
  State<TimeScreen> createState() => _TimeScreenState();
}

class _TimeScreenState extends State<TimeScreen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
              padding: EdgeInsets.all(20),
              // decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 60),
                  const Text(
                    "When do you want to grab a meal?",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(20),
                      child: TimePickerWithoutDialog()),
                  Row(
                    children: [
                      Checkbox(
                          activeColor: Colors.grey,
                          value: isChecked,
                          onChanged: (value) => setState(() {
                                isChecked = value!;
                              })),
                      const Text("This is when I usually eat",
                          style: TextStyle(color: Colors.black, fontSize: 16))
                    ],
                  ),
                  Expanded(
                    child: Container(
                        // color: Colors.grey,
                        ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        width: 100,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(width: 1, color: Colors.blue),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Prev',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ),
                      // const SizedBox(height: 30),
                      Container(
                        width: 100,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const FoodPreferenceScreen()));
                          },
                          child: const Text('Next'),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        ));
  }
}
