import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:yaplist/shareds/constants/routes.dart';
import 'package:yaplist/shareds/locale/locale.dart';

class LanguageChangerButton extends StatelessWidget {
  const LanguageChangerButton({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Locale> locales = AppLocale.supportedLocales;
    final Locale current = context.locale;
    final List<bool> selected = locales.map((e) => e == current).toList();

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(tr("language")),
        const SizedBox(height: 5),
        ToggleButtons(
          onPressed: (int index) {
            context.setLocale(locales[index]);
            Navigator.of(context).pushNamedAndRemoveUntil(
                Routes.initialScreen, (route) => false);
          },
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          constraints: const BoxConstraints(
            minHeight: 40.0,
            minWidth: 75.0,
          ),
          isSelected: selected,
          children: locales
              .map((e) => Text(AppLocale.localeNames[e.languageCode]!))
              .toList(),
        ),
      ],
    );
  }
}
