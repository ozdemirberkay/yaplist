import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:yaplist/shareds/constants/routes.dart';
import 'package:yaplist/shareds/locale/locale.dart';

class LanguageChangerButton extends StatefulWidget {
  const LanguageChangerButton({super.key});

  @override
  State<LanguageChangerButton> createState() => _LanguageChangerButtonState();
}

class _LanguageChangerButtonState extends State<LanguageChangerButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(tr("language")),
        const SizedBox(height: 5),
        getLocales()
      ],
    );
  }

  Widget getLocales() {
    return Column(
        children: AppLocale.supportedLocales
            .map((e) => localeRadioButton(locale: e))
            .toList());
  }

  Widget localeRadioButton({required Locale locale}) {
    return RadioGroup(
      groupValue: locale,
      onChanged: (value) {
        context.setLocale(locale);
        Navigator.of(context)
            .pushNamedAndRemoveUntil(Routes.initialScreen, (route) => false);
      },
      child: RadioListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(AppLocale.localeNames[locale.languageCode]!),
        value: context.locale,
      ),
    );
  }
}
