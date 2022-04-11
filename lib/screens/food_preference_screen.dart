import 'package:flutter/material.dart';
import 'package:google_food/screens/result_screen.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class FoodPreferenceScreen extends StatefulWidget {
  const FoodPreferenceScreen({Key? key}) : super(key: key);

  @override
  State<FoodPreferenceScreen> createState() => _FoodPreferenceScreenState();
}

class _FoodPreferenceScreenState extends State<FoodPreferenceScreen> {
  bool isChecked = false;
  String preferenceDropdownValue = "Select dietary preference";
  String allergenDropdownValue = "Enter any allergens";

  List<DropdownMenuItem<String>> dropdownItemsFormatter(List<String> items) {
    return items
        .map((value) =>
            (DropdownMenuItem<String>(value: value, child: Text(value))))
        .toList();
  }

  List<String> preferences = <String>[
    "Select dietary preference",
    "Standard",
    "Pescetarian",
    "Vegetarian",
    "Lacto-vegetarian",
    "Vegan"
  ];

  List<String> likedFoods = <String>[
    "Thai",
    "Indian",
    "Mexican",
    "Italian",
    "Chicken Wings",
    "Sandwich",
    "Hot Pot",
    "Salad",
    "Steak",
    "Dumpling",
    "Porridge",
    "BBQ"
  ];

  List<String> dislikedFoods = <String>[
    "None",
    "Cilantro",
    "Blue cheese",
    "Liver",
    "Olives",
    "Mushrooms",
    "Hot Pot",
    "Durian",
    "Green pepper",
    "Ginger",
    "Pickles",
  ];

  List<String> allergies = <String>[
    "Enter any allergens",
    "None",
    "Crustacean Shellfish*",
    "Egg",
    "Fish*",
    "Milk",
    "Peanuts",
    "Sesame Seeds",
    "Soybeans",
    "Sulfites*",
    "Tree Nuts*",
    "Wheat",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 60),
                  const Text(
                    "Enter your food preference",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        constraints:
                            BoxConstraints(minHeight: 58, maxHeight: 58),
                        // constraints: BoxConstraints(minHeight: 35, maxHeight: 35),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        // contentPadding: EdgeInsets.fromLTRB(0, 5.5, 0, 0),
                        labelText: 'Dietary Preferences',
                        labelStyle:
                            TextStyle(color: Color.fromRGBO(57, 62, 70, 1)),
                      ),
                      dropdownColor: Colors.white,
                      value: preferenceDropdownValue,
                      icon: const Icon(Icons.arrow_drop_down),
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                      onChanged: (String? newValue) {
                        setState(() {
                          preferenceDropdownValue = newValue!;
                        });
                      },
                      items: dropdownItemsFormatter(preferences),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: MultiSelectDialogField(
                      searchable: true,
                      backgroundColor: Colors.white,
                      items: likedFoods
                          .map((value) =>
                              (MultiSelectItem<String>(value, value)))
                          .toList(),
                      title: const Text("Foods You Enjoy"),
                      selectedColor: Colors.blue,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                      buttonIcon: const Icon(
                        Icons.sentiment_very_satisfied,
                        color: Colors.blue,
                      ),
                      buttonText: const Text(
                        "Enter favorite foods, cuisines, \nor ingredients",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      onConfirm: (results) {
                        //_selectedAnimals = results;
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: MultiSelectDialogField(
                      searchable: true,
                      backgroundColor: Colors.white,
                      items: dislikedFoods
                          .map((value) =>
                              (MultiSelectItem<String>(value, value)))
                          .toList(),
                      selectedColor: Colors.red,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                      buttonIcon: const Icon(
                        Icons.sentiment_dissatisfied_outlined,
                        color: Colors.red,
                      ),
                      buttonText: const Text(
                        "Enter disliked foods",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      onConfirm: (results) {
                        //_selectedAnimals = results;
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: DropdownButtonFormField(
                        decoration: InputDecoration(
                            constraints:
                                BoxConstraints(minHeight: 58, maxHeight: 58),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            // contentPadding: EdgeInsets.fromLTRB(0, 5.5, 0, 0),
                            labelText: 'Foods Allergies',
                            labelStyle: TextStyle(
                                color: Color.fromRGBO(57, 62, 70, 1))),
                        dropdownColor: Colors.white,
                        icon: const Icon(Icons.arrow_drop_down),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 16),
                        value: allergenDropdownValue,
                        items: dropdownItemsFormatter(allergies),
                        onChanged: (String? newValue) => setState(() {
                              allergenDropdownValue = newValue!;
                            })),
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
                          child: Text(
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
                                    builder: (context) => const Result()));
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
