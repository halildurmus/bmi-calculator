import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';
import '../settings/settings.controller.dart';
import 'models/bmi.dart';
import 'models/bmi_view_model.dart';
import 'models/gender.dart';
import 'widgets/bmi_info.dart';
import 'widgets/bmi_result.dart';
import 'widgets/gender_toggle_button.dart';
import 'widgets/slider.dart';
import 'widgets/wave_painter.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key, required this.settingsController})
      : super(key: key);

  final SettingsController settingsController;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  Gender _selectedGender = Gender.male;
  int height = 170;
  int weight = 65;
  bool isBmiCalculated = false;
  late Bmi bmiResult;

  void _calculateBmi(BuildContext ctx, WidgetRef ref, int height, int weight) {
    final model = ref.read(bmiProvider.notifier);
    model.calculate(height: height, weight: weight);
  }

  void _resetBmi(BuildContext ctx, WidgetRef ref) {
    final model = ref.read(bmiProvider.notifier);
    model.reset();
  }

  PreferredSizeWidget _buildAppBar() {
    final SettingsController controller = widget.settingsController;
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;

    String getLanguageSvg() {
      if (controller.locale == kLocaleTurkish) {
        return kTurkishSvg;
      }

      return kEnglishSvg;
    }

    Widget _buildPopupMenuButton() {
      return PopupMenuButton<Locale>(
        icon: SvgPicture.asset(getLanguageSvg()),
        onSelected: (Locale locale) {
          if (controller.locale != locale) {
            controller.updateLocale(locale);
          }
        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<Locale>>[
          PopupMenuItem<Locale>(
            value: kLocaleEnglish,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SvgPicture.asset(kEnglishSvg, height: 20, width: 20),
                    const SizedBox(width: 8),
                    Text(AppLocalizations.of(context)!.english,
                        style: textTheme.bodyText2),
                  ],
                ),
                if (controller.locale == kLocaleEnglish)
                  Icon(Icons.check, color: theme.primaryColor)
              ],
            ),
          ),
          PopupMenuItem<Locale>(
            value: kLocaleTurkish,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SvgPicture.asset(kTurkishSvg, height: 20, width: 20),
                    const SizedBox(width: 8),
                    Text(AppLocalizations.of(context)!.turkish,
                        style: textTheme.bodyText2),
                  ],
                ),
                if (controller.locale == kLocaleTurkish)
                  Icon(Icons.check, color: theme.primaryColor)
              ],
            ),
          ),
        ],
      );
    }

    return AppBar(
      key: const ValueKey<String>('AppBar'),
      actions: <Widget>[_buildPopupMenuButton()],
      backgroundColor: Colors.white,
      title: Text(
        AppLocalizations.of(context)!.title,
        style: kAppBarTextStyle,
      ),
    );
  }

  Widget _buildGenderToggleButton({
    required String title,
    required Gender gender,
  }) {
    return GenderToggleButton(
      valueKey: ValueKey<String>('$gender'),
      onTap: !isBmiCalculated
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
      padding: const EdgeInsets.only(top: 16, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: _buildGenderToggleButton(
              title: AppLocalizations.of(context)!.male,
              gender: Gender.male,
            ),
          ),
          const SizedBox(width: 16),
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
      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    );
  }

  Text _buildHeightText() {
    return Text(
      AppLocalizations.of(context)!.height,
      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildHeightSlider() {
    return Padding(
      padding: const EdgeInsets.only(top: 40, bottom: 16),
      child: CustomSlider(
        min: 120,
        max: 220,
        measurementUnit: 'cm',
        value: height,
        onChanged: !isBmiCalculated
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
      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildWeightSlider() {
    return Padding(
      padding: const EdgeInsets.only(top: 40, bottom: 16),
      child: CustomSlider(
        min: 40,
        max: 120,
        measurementUnit: 'kg',
        value: weight,
        onChanged: !isBmiCalculated
            ? (double newValue) {
                setState(() {
                  weight = newValue.round();
                });
              }
            : null,
      ),
    );
  }

  Widget _buildActionButton() {
    return Padding(
      padding: EdgeInsets.only(right: MediaQuery.of(context).size.width / 12),
      child: DecoratedBox(
        decoration: kActionButtonDecoration,
        child: FloatingActionButton.large(
          onPressed: isBmiCalculated
              ? () => _resetBmi(context, ref)
              : () => _calculateBmi(context, ref, height, weight),
          backgroundColor: Colors.white,
          elevation: 0,
          child: Icon(
            isBmiCalculated ? Icons.refresh : Icons.trending_flat,
            color: Theme.of(context).primaryColor,
            size: 48,
          ),
        ),
      ),
    );
  }

  Widget _buildBottomContent() {
    return CustomPaint(
      painter: const WavePainter(),
      child: AnimatedCrossFade(
        duration: const Duration(milliseconds: 1000),
        firstChild: const BmiInfoWidget(),
        secondChild: isBmiCalculated
            ? BmiResultWidget(bmi: bmiResult)
            : const SizedBox(),
        crossFadeState: !isBmiCalculated
            ? CrossFadeState.showFirst
            : CrossFadeState.showSecond,
      ),
    );
  }

  Widget _buildBody() {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
   
    return Container(
      decoration: kMainContainerDecoration,
      height: deviceHeight < 650 ? 650 : deviceHeight,
      width: deviceWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: deviceWidth / 12),
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
          SizedBox(
            height: 250,
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                _buildBottomContent(),
                _buildActionButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;

    final state = ref.watch(bmiProvider);
    state.when(
      initial: () => isBmiCalculated = false,
      calculated: (bmi) {
        bmiResult = bmi;
        isBmiCalculated = true;
      },
    );

    return Scaffold(
      appBar: _buildAppBar(),
      body: deviceHeight < 650
          ? SingleChildScrollView(child: _buildBody())
          : _buildBody(),
    );
  }
}
