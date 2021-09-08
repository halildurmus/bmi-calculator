import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../app_localizations.dart';
import '../constants.dart';
import '../models/bmi.dart';
import '../models/gender.dart';
import '../settings/locales.dart' as locales;
import '../settings/settings_controller.dart';
import '../widgets/curve_painter.dart';
import '../widgets/gender_toggle_button.dart';
import '../widgets/slider.dart';
import 'bmi_info.dart';
import 'bmi_result.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.settingsController})
      : super(key: key);

  final SettingsController settingsController;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Gender _selectedGender = Gender.male;
  int height = 170;
  int weight = 65;

  // Controls content to be displayed depending on the user's actions.
  bool showResult = false;

  PreferredSizeWidget _buildAppBar() {
    final SettingsController controller = widget.settingsController;
    final TextTheme textTheme = Theme.of(context).textTheme;

    Widget _buildPopupMenuButton() {
      return PopupMenuButton<Locale>(
        icon: SvgPicture.asset(
            'assets/icons/${controller.locale.toLanguageTag()}.svg'),
        onSelected: (Locale result) {
          if (result == locales.en_US) {
            controller.updateLocale(locales.en_US);
          } else if (result == locales.tr_TR) {
            controller.updateLocale(locales.tr_TR);
          }
        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<Locale>>[
          PopupMenuItem<Locale>(
            value: locales.en_US,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SvgPicture.asset('assets/icons/en-US.svg',
                        height: 20, width: 20),
                    const SizedBox(width: 8),
                    Text(AppLocalizations.of(context)!.english,
                        style: textTheme.bodyText2),
                  ],
                ),
                if (controller.locale == locales.en_US)
                  const Icon(Icons.check, color: kPrimaryColor)
              ],
            ),
          ),
          PopupMenuItem<Locale>(
            value: locales.tr_TR,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SvgPicture.asset('assets/icons/tr-TR.svg',
                        height: 20, width: 20),
                    const SizedBox(width: 8),
                    Text(AppLocalizations.of(context)!.turkish,
                        style: textTheme.bodyText2),
                  ],
                ),
                if (controller.locale == locales.tr_TR)
                  const Icon(Icons.check, color: kPrimaryColor)
              ],
            ),
          ),
        ],
      );
    }

    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: DecoratedBox(
        decoration: kAppBarDecoration,
        child: AppBar(
          key: const ValueKey<String>('AppBar'),
          backgroundColor: Colors.white,
          actions: <Widget>[
            _buildPopupMenuButton(),
          ],
          title: Text(
            AppLocalizations.of(context)!.title,
            style: kAppBarTextStyle,
          ),
        ),
      ),
    );
  }

  Widget _buildGenderToggleButton({
    required String title,
    required Gender gender,
  }) {
    return GenderToggleButton(
      valueKey: ValueKey<String>('$gender'),
      onTap: !showResult
          ? () {
              setState(() {
                _selectedGender = gender;
              });
            }
          : null,
      gender: gender,
      selectedGender: _selectedGender,
      text: title,
    );
  }

  Widget _buildGenderButtons() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16.0,
        bottom: 16.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: _buildGenderToggleButton(
              title: AppLocalizations.of(context)!.male,
              gender: Gender.male,
            ),
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: _buildGenderToggleButton(
              title: AppLocalizations.of(context)!.female,
              gender: Gender.female,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGenderText() {
    return Text(
      AppLocalizations.of(context)!.gender,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Text _buildHeightText() {
    return Text(
      AppLocalizations.of(context)!.height,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildHeightSlider() {
    return Padding(
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
    );
  }

  Text _buildWeightText() {
    return Text(
      AppLocalizations.of(context)!.weight,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildWeightSlider() {
    return Padding(
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
    );
  }

  Widget _buildCurves() {
    final double deviceHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: <Widget>[
        SizedBox(
          height: .25 * deviceHeight,
          width: double.infinity,
          child: const CustomPaint(
            painter: CurvePainter(color: Color(0xFFEE7583), pathNo: 3),
          ),
        ),
        SizedBox(
          height: .3 * deviceHeight,
          width: double.infinity,
          child: const CustomPaint(
            painter: CurvePainter(color: Color(0xFFF6ABB2), pathNo: 2),
          ),
        ),
        SizedBox(
          height: .35 * deviceHeight,
          width: double.infinity,
          child: const CustomPaint(
            painter: CurvePainter(color: Colors.white, pathNo: 1),
          ),
        ),
      ],
    );
  }

  Widget _buildCircleButton() {
    return Padding(
      padding: EdgeInsets.only(right: MediaQuery.of(context).size.width / 12.0),
      child: DecoratedBox(
        decoration: kCircleButtonDecoration,
        child: TextButton(
          onPressed: () {
            setState(() {
              showResult = !showResult;
            });
          },
          style: kCircleButtonStyle,
          child: Icon(
            !showResult ? Icons.trending_flat : Icons.refresh,
            size: 48.0,
          ),
        ),
      ),
    );
  }

  Widget _buildBottomStackContent() {
    late BMI _bmiResult;
    if (showResult) {
      _bmiResult = BMI(height: height, weight: weight);
    }

    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 1000),
      firstChild: const BmiInfoWidget(),
      secondChild: showResult
          ? BmiResultWidget(bmiResult: _bmiResult)
          : const SizedBox(),
      crossFadeState:
          !showResult ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    );
  }

  Widget _buildBody() {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: kMainContainerDecoration,
      height: deviceHeight < 632 ? 632 : double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: deviceWidth / 12.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 20),
                  _buildGenderText(),
                  _buildGenderButtons(),
                  _buildHeightText(),
                  _buildHeightSlider(),
                  _buildWeightText(),
                  _buildWeightSlider(),
                ],
              ),
            ),
          ),
          Stack(
            alignment: Alignment.topRight,
            children: <Widget>[
              _buildCurves(),
              _buildBottomStackContent(),
              _buildCircleButton(),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: _buildAppBar(),
      body: deviceHeight < 632
          ? SingleChildScrollView(child: _buildBody())
          : _buildBody(),
    );
  }
}
