import 'package:flutter/material.dart';

class Settings {
  ThemeMode themeMode;

  Settings({this.themeMode = ThemeMode.system});

  Map<String, dynamic> toJson() {
    return {
      'themeMode': ThemeModeConverter._themeModeToString(themeMode),
    };
  }

  factory Settings.fromJson(Map<String, dynamic> json) {
    return Settings(
      themeMode: ThemeModeConverter._stringToThemeMode(json['themeMode']),
    );
  }
}

class ThemeModeConverter {
  static String _themeModeToString(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return 'light';
      case ThemeMode.dark:
        return 'dark';
      case ThemeMode.system:
        return 'system';
    }
  }

  static ThemeMode _stringToThemeMode(String mode) {
    switch (mode) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      case 'system':
        return ThemeMode.system;
      default:
        return ThemeMode.system;
    }
  }
}
