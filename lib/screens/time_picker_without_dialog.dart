import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TimePickerWithoutDialog extends StatefulWidget {
  const TimePickerWithoutDialog({Key? key}) : super(key: key);

  @override
  State<TimePickerWithoutDialog> createState() =>
      _TimePickerWithoutDialogState();
}

class _TimePickerWithoutDialogState extends State<TimePickerWithoutDialog> {
  int value = 0;
  List<bool> _isSelected = [false, true];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(bottom: 10), child: const Text("Today @")),
        Flex(
          direction: Axis.horizontal,
          children: [
            Flexible(
                flex: 2,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 35),
                        decoration: InputDecoration(
                            fillColor: Color.fromRGBO(238, 238, 238, 1),
                            filled: true,
                            // contentPadding: EdgeInsets.symmetric(vertical: 40.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintText: '12',
                            hintStyle: TextStyle(
                                fontSize: 35,
                                color: Color.fromRGBO(146, 154, 171, 1))),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          LimitRangeTextInputFormatter(1, 12),
                          FilteringTextInputFormatter.digitsOnly
                        ], // Only numbers can be entered,
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 8),
                          child: Text(
                            "Hour",
                            style: TextStyle(fontSize: 11),
                          ))
                    ])),
            Container(
                padding: EdgeInsets.only(bottom: 25),
                margin: EdgeInsets.symmetric(horizontal: 5),
                child: Text(":",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(57, 62, 70, 0.8)))),
            Flexible(
                flex: 2,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextField(
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 35),
                        decoration: InputDecoration(
                            fillColor: Color.fromRGBO(238, 238, 238, 1),
                            filled: true,
                            // contentPadding: EdgeInsets.symmetric(vertical: 40.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintText: '00',
                            hintStyle: TextStyle(
                                fontSize: 35,
                                color: Color.fromRGBO(146, 154, 171, 1))),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          LimitRangeTextInputFormatter(0, 59),
                          FilteringTextInputFormatter.digitsOnly
                        ], // Only numbers can be entered,
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 8),
                          child: Text(
                            "Minute",
                            style: TextStyle(fontSize: 11),
                          ))
                    ])),
            SizedBox(width: 10),
            Flexible(
              flex: 1,
              child: Container(
                padding: EdgeInsets.only(bottom: 20),
                child: ToggleButtons(
                  borderRadius: BorderRadius.circular(10),
                  direction: Axis.vertical,
                  // verticalDirection: VerticalDirection.down,
                  isSelected: _isSelected,
                  onPressed: (int index) {
                    setState(() {
                      for (int i = 0; i < _isSelected.length; i++) {
                        if (i == index) {
                          _isSelected[i] = true;
                        } else {
                          _isSelected[i] = false;
                        }
                      }
                    });
                  },
                  constraints: BoxConstraints(
                      maxHeight: 40, minHeight: 40, minWidth: 50, maxWidth: 60),
                  children: <Widget>[
                    Container(
                      child: Text(
                        "AM",
                      ),
                    ),
                    Container(child: Text("PM"))
                  ],
                ),
              ),
            )
          ],
        ),

        // Row(
        //   children: <Widget>[
        //     TextField(
        //         decoration: InputDecoration(
        //       border: OutlineInputBorder(),
        //       hintText: 'Enter a search term',
        //     ))
        //   ],
        // )
      ],
    );
  }
}

class LimitRangeTextInputFormatter extends TextInputFormatter {
  LimitRangeTextInputFormatter(this.min, this.max) : assert(min < max);

  final int min;
  final int max;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var value = int.parse(newValue.text);
    if (value < min) {
      return TextEditingValue(text: min.toString());
    } else if (value > max) {
      return TextEditingValue(text: max.toString());
    }
    return newValue;
  }
}
