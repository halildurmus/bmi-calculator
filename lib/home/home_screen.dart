import 'package:bmicalculator/my_localizations.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:bmicalculator/constants.dart';
import 'package:bmicalculator/home/bmi_info.dart';
import 'package:bmicalculator/home/bmi_result.dart';
import 'package:bmicalculator/home/curve_painter.dart';
import 'package:bmicalculator/home/gender_toggle_button.dart';
import 'package:bmicalculator/home/slider.dart';
import 'package:bmicalculator/models/gender.dart';
import 'package:bmicalculator/utils/bmi_calculator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Gender _selectedGender = Gender.Male;
  int height = 170;
  int weight = 65;
  // Used displaying appropriate content depending on the user's actions.
  bool showResult = false;

  Widget _buildGenderToggleButtons({String title, Gender gender}) {
    return GenderToggleButton(
      valueKey: ValueKey<String>('$gender'),
      bgColor: _selectedGender == gender
          ? kActiveButtonBgColor
          : kInactiveButtonBgColor,
      icon: gender == Gender.Male
          ? FontAwesomeIcons.mars
          : FontAwesomeIcons.venus,
      onTap: !showResult
          ? () {
              setState(() {
                _selectedGender = gender;
              });
            }
          : null,
      text: title,
      textColor: _selectedGender == gender
          ? kActiveButtonTextColor
          : kInactiveButtonTextColor,
    );
  }

  Widget _buildBottomStackContent() {
    BmiCalculator _bmiResult;
    if (showResult) {
      _bmiResult = BmiCalculator(height: height, weight: weight);
    }

    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 1000),
      firstChild: BmiInfoWidget(),
      secondChild: showResult
          ? BmiResultWidget(bmiResult: _bmiResult)
          : const SizedBox(),
      crossFadeState:
          !showResult ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildBodyWidget() {
      return Container(
        decoration: kMainContainerDecoration,
        height: MediaQuery.of(context).size.height < 632.0
            ? 632.0
            : double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 12.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20.0,
                      ),
                      child: Text(
                        MyLocalizations.of(context).gender,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 16.0,
                        bottom: 16.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: _buildGenderToggleButtons(
                              title: MyLocalizations.of(context).male,
                              gender: Gender.Male,
                            ),
                          ),
                          const SizedBox(width: 16.0),
                          Expanded(
                            child: _buildGenderToggleButtons(
                              title: MyLocalizations.of(context).female,
                              gender: Gender.Female,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        MyLocalizations.of(context).height,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 40.0,
                        bottom: 16.0,
                      ),
                      child: CustomSlider(
                        min: 120.0,
                        max: 220.0,
                        measurementUnit: 'cm',
                        value: height,
                        onChanged: !showResult
                            ? (double newValue) {
                                setState(() {
                                  height = newValue.round();
                                });
                              }
                            : null,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        MyLocalizations.of(context).weight,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 40.0,
                        bottom: 16.0,
                      ),
                      child: CustomSlider(
                        min: 40.0,
                        max: 120.0,
                        measurementUnit: 'kg',
                        value: weight,
                        onChanged: !showResult
                            ? (double newValue) {
                                setState(() {
                                  weight = newValue.round();
                                });
                              }
                            : null,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Stack(
              alignment: Alignment.topRight,
              children: <Widget>[
                Container(
                  height: 190.0,
                  width: double.infinity,
                  child: const CustomPaint(
                    painter: CurvePainter(color: Color(0xFFEE7583), pathNo: 3),
                  ),
                ),
                Container(
                  height: 220.0,
                  width: double.infinity,
                  child: const CustomPaint(
                    painter: CurvePainter(color: Color(0xFFF6ABB2), pathNo: 2),
                  ),
                ),
                Container(
                  height: 260.0,
                  width: double.infinity,
                  child: const CustomPaint(
                    painter: CurvePainter(color: Colors.white, pathNo: 1),
                  ),
                ),
                _buildBottomStackContent(),
                Padding(
                  padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width / 12.0,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: kPrimaryColor.withOpacity(.4),
                          blurRadius: 6.0,
                          offset: const Offset(0.0, 2.0),
                        ),
                      ],
                    ),
                    child: FlatButton(
                      color: Colors.white,
                      onPressed: () {
                        setState(() {
                          showResult = !showResult;
                        });
                      },
                      padding: const EdgeInsets.all(24.0),
                      shape: const CircleBorder(),
                      textColor: kPrimaryColor,
                      child: Icon(
                        !showResult ? Icons.trending_flat : Icons.refresh,
                        size: 48.0,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: kPrimaryColor.withOpacity(.4),
                blurRadius: 6.0,
                offset: const Offset(.0, 2.0),
              ),
            ],
          ),
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            key: const ValueKey<String>('AppBar'),
            title: Text(
              MyLocalizations.of(context).title,
              style: kAppBarTextStyle,
            ),
          ),
        ),
      ),
      body: MediaQuery.of(context).size.height < 632.0
          ? SingleChildScrollView(child: _buildBodyWidget())
          : _buildBodyWidget(),
    );
  }
}
