import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_food/screens/time_screen.dart';

import '../Services/get_location_data.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  bool isChecked = false;
  String _defaultLocation = "";

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    LocationData currLocation = LocationData();

    await currLocation.getCurrentLocation();
    List<Placemark> city = await placemarkFromCoordinates(
        currLocation.latitude, currLocation.longitude);
    print(city[0].locality);
    String locality = city[0].locality.toString();
    setState(() {
      _defaultLocation = locality;
    });

    print(_defaultLocation);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
              padding: EdgeInsets.all(20),
              // decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 60),
                  Container(
                    width: double.infinity,
                    child: const Text("Where are you located?",
                        style: TextStyle(
                            fontSize: 29,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Color.fromRGBO(238, 238, 238, 1),
                        filled: true,
                        // border: const OutlineInputBorder(),
                        hintText:
                            'Enter office or city, e.g. ${_defaultLocation == "" ? "..." : _defaultLocation}',
                        hintStyle: const TextStyle(
                            color: Color.fromRGBO(146, 154, 171, 1)),
                      ),
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Checkbox(
                            activeColor: Colors.grey,
                            value: isChecked,
                            onChanged: (value) => setState(() {
                                  isChecked = value!;
                                })),
                        const Text(
                          "This is where I usually work.",
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                        // color: Colors.grey,
                        ),
                  ),
                  Container(
                    width: double.infinity,
                    child: Row(
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
                        Container(
                          width: 100,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const TimeScreen()));
                            },
                            child: const Text('Next'),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )),
        ));
  }
}
