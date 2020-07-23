import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter/material.dart';

import 'package:bmicalculator/gender_toggle_button.dart';
import 'package:bmicalculator/models/gender.dart';
import 'package:bmicalculator/slider.dart';
import 'package:bmicalculator/constants.dart';
import 'package:bmicalculator/utils/bmi_calculator.dart';

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
  bool showResult = false;

  Widget _buildGenderToggleButtons({String title, Gender gender}) {
    return GenderToggleButton(
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
    if (!showResult) {
      return Padding(
        padding: const EdgeInsets.only(top: 155.0, bottom: 32.0),
        child: Center(
          child: Column(
            children: <Text>[
              Text(
                'Body mass index, or BMI, is used to determine whether\n you are in a healthy weight range for your height.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black54.withOpacity(0.4),
                  fontSize: 14.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Text(
                "\n* This calculator shouldn't be used for pregnant women or children.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 11.5,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      final BmiCalculator _bmiResult =
          BmiCalculator(height: height, weight: weight);

      return Padding(
        padding: const EdgeInsets.only(
          top: 135.0,
          bottom: 0.0,
          left: 24,
          right: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'YOUR BMI',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.55),
                    fontSize: 13.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Row(
                  children: const <Widget>[
                    Text(
                      'The BMI Tables',
                      style: TextStyle(
                        color: Color(0xFFCA4F5D),
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 4.0),
                      child: Icon(
                        Icons.trending_flat,
                        color: Color(0xFFCA4F5D),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              textBaseline: TextBaseline.alphabetic,
              children: <Widget>[
                Text(
                  _bmiResult.getDecimal,
                  style: const TextStyle(
                    color: Color(0xFFCA4F5D),
                    fontSize: 48.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    _bmiResult.getDigit,
                    style: const TextStyle(
                      color: Color(0xFFCA4F5D),
                      fontSize: 28.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: Center(
                child: Text(
                  _bmiResult.getInterpretation,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: _bmiResult.getInterpretationColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
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
            fontSize: 22.0,
            fontWeight: FontWeight.w900,
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
                        top: 20.0,
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
                              title: 'Male',
                              gender: Gender.Male,
                            ),
                          ),
                          const SizedBox(width: 16.0),
                          Expanded(
                            child: _buildGenderToggleButtons(
                              title: 'Female',
                              gender: Gender.Female,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
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
                    const SizedBox(height: 10.0),
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
                    right: MediaQuery.of(context).size.width / 15.0,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: const Color(0xFFCA4F5D).withOpacity(0.4),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: RaisedButton(
                      splashColor: const Color(0xFFCA4F5D),
                      //highlightColor: const Color(0xFFCA4F5D),
                      color: Colors.white,
                      elevation: 0.0,
                      onPressed: () {
                        setState(() {
                          showResult = !showResult;
                        });
                      },
                      padding: const EdgeInsets.all(24.0),
                      shape: const CircleBorder(),
                      child: Icon(
                        !showResult ? Icons.trending_flat : Icons.refresh,
                        color: const Color(0xFFCA4F5D),
                        size: 48.0,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  const CurvePainter({@required this.color, @required this.pathNo});

  final Color color;
  final int pathNo;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint();
    paint.color = color;
    paint.style = PaintingStyle.fill;

    final Path path1 = Path();
    path1.moveTo(0, size.height * .35);
    path1.cubicTo(size.width * .25, size.height * .7, size.width * .75, 10,
        size.width, size.height * .33);
    path1.lineTo(size.width, size.height);
    path1.lineTo(0, size.height);

    final Path path2 = Path();
    path2.moveTo(0, size.height * .35);
    path2.cubicTo(size.width * .25, size.height * .75, size.width * .95, -15,
        size.width, size.height * .5);
    path2.lineTo(size.width, size.height);
    path2.lineTo(0, size.height);

    final Path path3 = Path();
    path3.moveTo(0, size.height * .35);
    path3.cubicTo(size.width * .25, size.height * .85, size.width * .75, -10,
        size.width, size.height * .25);
    path3.lineTo(size.width, size.height);
    path3.lineTo(0, size.height);

    switch (pathNo) {
      case 1:
        canvas.drawPath(path1, paint);
        break;
      case 2:
        canvas.drawPath(path2, paint);
        break;
      case 3:
        canvas.drawPath(path3, paint);
        break;
      default:
        canvas.drawPath(path1, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
