import 'package:flutter/material.dart';
import 'package:yaplist/shareds/theme/appcolors.dart';

class ThemeUtils {
  static ElevatedButtonThemeData get lightElevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        side: BorderSide(color: AppColors.primaryColorLight),
      ),
    );
  }

  static ElevatedButtonThemeData get darkElevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        side: BorderSide(color: AppColors.primaryColorDark),
      ),
    );
  }

  static InputDecorationTheme get inputDecorationTheme {
    return const InputDecorationTheme(
      border: OutlineInputBorder(),
      filled: true,
      alignLabelWithHint: true,
    );
  }
}
