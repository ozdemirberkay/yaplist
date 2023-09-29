import 'package:flutter/material.dart';
import 'package:yaplist/shareds/constants/constants.dart';
import 'package:yaplist/shareds/theme/appcolors.dart';

class ThemeUtils {
  static TextTheme get lightTextTheme {
    return TextTheme(
      titleLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: AppColors.kBlackColor,
      ),
      bodySmall: TextStyle(
        fontSize: 17.0,
        color: AppColors.greyColor,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: TextStyle(
        fontSize: 17.0,
        color: AppColors.greyColor,
      ),
      labelMedium: TextStyle(
        fontSize: 17.0,
        color: AppColors.kWhiteColor,
      ),
    );
  }

  static TextTheme get darkTextTheme {
    return TextTheme(
      titleLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: AppColors.kWhiteColor,
      ),
      bodySmall: TextStyle(
        fontSize: 17.0,
        color: AppColors.greyColor,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: TextStyle(
        fontSize: 17.0,
        color: AppColors.greyColor,
      ),
      labelMedium: TextStyle(
        fontSize: 17.0,
        color: AppColors.kBlackColor,
      ),
    );
  }

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
