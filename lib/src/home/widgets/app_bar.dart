import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants.dart';
import '../../l10n/localization_util.dart';
import '../../settings/settings.controller.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key, required this.settingsController})
      : super(key: key);

  final SettingsController settingsController;

  void onLanguageSelected(Locale? locale) {
    if (settingsController.locale != locale) {
      settingsController.updateLocale(locale);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return AppBar(
      key: const ValueKey<String>('AppBar'),
      actions: [
        PopupMenuButton<Locale>(
          icon: SvgPicture.asset(
            LocalizationUtil.getAssetName(settingsController.locale),
          ),
          tooltip: l(context).changeLanguage,
          onSelected: onLanguageSelected,
          itemBuilder: (context) => <PopupMenuEntry<Locale>>[
            PopupMenuItem<Locale>(
              value: localeEnglish,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(assetEnglish, height: 20, width: 20),
                      const SizedBox(width: 8),
                      Text(
                        l(context).english,
                        style: textTheme.bodyText2,
                      ),
                    ],
                  ),
                  if (settingsController.locale == localeEnglish)
                    Icon(Icons.check, color: theme.primaryColor),
                ],
              ),
            ),
            PopupMenuItem<Locale>(
              value: localeTurkish,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(assetTurkish, height: 20, width: 20),
                      const SizedBox(width: 8),
                      Text(
                        l(context).turkish,
                        style: textTheme.bodyText2,
                      ),
                    ],
                  ),
                  if (settingsController.locale == localeTurkish)
                    Icon(Icons.check, color: theme.primaryColor),
                ],
              ),
            ),
          ],
        ),
      ],
      backgroundColor: Colors.white,
      title: Text(l(context).title, style: appBarTextStyle),
    );
  }
}
