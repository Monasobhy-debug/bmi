import 'package:bmi/calculator_brain.dart';
import 'package:bmi/componant/ReusableCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi/componant/icon__content.dart';
import 'package:bmi/componant/botton_bottom.dart';
import 'package:bmi/constant.dart';
import 'result_page.dart';

enum Gender { male, female }

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String selectedUnit = 'Kg';

  DropdownButton<String> weightList() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String unit in weightUnit) {
      var newItem = DropdownMenuItem(
        child: Text(unit, style: TextStyle(fontSize: 15, color: black)),
        value: unit,
      );
      dropdownItems.add(newItem);
    }
    return DropdownButton<String>(
      underline: Container(color: Colors.transparent),
      icon: Icon(
        Icons.keyboard_arrow_down,
        color: Colors.black,
      ),
      dropdownColor: Colors.white,
      value: selectedUnit,
      items: dropdownItems,
      itemHeight: 60.0,
      isDense: false,
      onChanged: (value) {
        setState(() {
          selectedUnit = value;
        });
      },
    );
  }

  String selectedHeightUnit = 'Cm';

  DropdownButton<String> heightList() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String unit in heightUnit) {
      var newItem = DropdownMenuItem(
        child: Text(unit, style: TextStyle(fontSize: 15, color: black)),
        value: unit,
      );
      dropdownItems.add(newItem);
    }
    return DropdownButton<String>(
      underline: Container(color: Colors.transparent),
      icon: Icon(
        Icons.keyboard_arrow_down,
        color: Colors.black,
      ),
      dropdownColor: Colors.white,
      value: selectedHeightUnit,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selectedHeightUnit = value;
        });
      },
    );
  }

  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;
  Color colour = black;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.menu,
              color: grey,
            ),
            Icon(Icons.notifications_none, color: grey)
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 25.0, right: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'BMI Calculator',
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text('Gender', style: KTextStyle),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconContent(
                    onTap: () {
                      setState(() {});
                      selectedGender = Gender.male;
                    },
                    icon: FontAwesomeIcons.male,
                    text: 'Male',
                    color: (selectedGender == Gender.male ? green : black),
                    border: Border.all(
                        color: (selectedGender == Gender.male ? green : black),
                        width: 1),
                  ),
                  IconContent(
                    onTap: () {
                      setState(() {});
                      selectedGender = Gender.female;
                    },
                    icon: FontAwesomeIcons.female,
                    text: 'Female',
                    color: (selectedGender == Gender.female ? green : black),
                    border: Border.all(
                        color:
                            (selectedGender == Gender.female ? green : black),
                        width: 1),
                  )
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Text('weight', style: KTextStyle),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ReusableCard(
                    text: weight.toString(),
                    width: 200.0,
                    onPress2: () {
                      setState(() {
                        weight++;
                      });
                    },
                    onPress1: () {
                      setState(() {
                        weight--;
                      });
                    },
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    width: 90.0,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.white),
                    child: weightList(),
                  ),
                ],
              ),
              Text('Height', style: KTextStyle),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ReusableCard(
                    text: height.toString(),
                    width: 200.0,
                    onPress2: () {
                      setState(() {
                        height++;
                      });
                    },
                    onPress1: () {
                      setState(() {
                        height--;
                      });
                    },
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    width: 90.0,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.white),
                    child: heightList(),
                  )
                ],
              ),
              Text('Age', style: KTextStyle),
              ReusableCard(
                text: age.toString(),
                onPress2: () {
                  setState(() {
                    age++;
                  });
                },
                onPress1: () {
                  setState(() {
                    age--;
                  });
                },
              ),
              BottomButton(
                textButton: 'CALCULATE',
                onTap: () {
                  CalculatorBrain calc =
                      CalculatorBrain(height: height, weight: weight);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultPage(
                        bimResult: calc.calculateBMI(),
                        interpretation: calc.getInterpretation(),
                        resultText: calc.getResult(),
                        heightUnit: selectedHeightUnit,
                        weightUnit: selectedUnit,
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
