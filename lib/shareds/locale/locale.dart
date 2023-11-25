import 'package:flutter/material.dart';

class AppLocale {
  static List<Locale> supportedLocales = [
    const Locale('en', 'US'),
    const Locale('tr', 'TR')
  ];
  static Locale fallbackLocale = const Locale('en', 'US');

  static Map<String, String> localeNames = {"en": "English", "tr": "Türkçe"};
}
