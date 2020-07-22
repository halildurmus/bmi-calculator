import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter/material.dart';

import 'package:bmicalculator/gender_toggle_button.dart';
import 'package:bmicalculator/models/gender.dart';
import 'package:bmicalculator/slider.dart';
import 'package:bmicalculator/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: 'BMI Calculator'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Gender _selectedGender = Gender.Male;
  int height = 170;
  int weight = 65;

  Widget _buildGenderToggleButtons({String title, Gender gender}) {
    return GenderToggleButton(
      bgColor: _selectedGender == gender
          ? kActiveButtonBgColor
          : kInactiveButtonBgColor,
      icon: gender == Gender.Male
          ? FontAwesomeIcons.mars
          : FontAwesomeIcons.venus,
      onTap: () {
        setState(() {
          _selectedGender = gender;
        });
      },
      text: title,
      textColor: _selectedGender == gender
          ? kActiveButtonTextColor
          : kInactiveButtonTextColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Color(0xFFCA4F5D),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        decoration: kContainerDecoration,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 15.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 15.0,
                      ),
                      child: Text(
                        'GENDER',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 16,
                        bottom: 16.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: _buildGenderToggleButtons(
                                title: 'Male', gender: Gender.Male),
                          ),
                          const SizedBox(width: 16.0),
                          Expanded(
                            child: _buildGenderToggleButtons(
                                title: 'Female', gender: Gender.Female),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    const Text(
                      'HEIGHT',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 40,
                        bottom: 16.0,
                      ),
                      child: CustomSlider(
                        min: 120,
                        max: 220,
                        value: height,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    const Text(
                      'WEIGHT',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 40,
                        bottom: 16.0,
                      ),
                      child: CustomSlider(
                        min: 40,
                        max: 120,
                        value: weight,
                        onChanged: (double newValue) {
                          setState(() {
                            weight = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
