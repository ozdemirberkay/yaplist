import 'package:flutter/material.dart';
import 'package:yaplist/shareds/constants/constants.dart';
import 'package:yaplist/shareds/theme/appcolors.dart';
import 'package:yaplist/shareds/theme/theme_utils.dart';

class YaplistTheme {
  static ThemeData get light {
    return ThemeData(
      useMaterial3: Constants.useMaterial3,
      primaryColor: AppColors.primaryColorLight,
      colorScheme: ColorScheme.light(
        secondary: AppColors.primaryColorLight,
        primary: AppColors.primaryColorLight,
      ),
      elevatedButtonTheme: ThemeUtils.lightElevatedButtonTheme,
      inputDecorationTheme: ThemeUtils.inputDecorationTheme,
    );
  }

  static ThemeData get dark {
    return ThemeData(
      useMaterial3: Constants.useMaterial3,
      primaryColor: AppColors.primaryColorDark,
      colorScheme: ColorScheme.dark(
        secondary: AppColors.primaryColorDark,
        primary: AppColors.primaryColorDark,
      ),
      elevatedButtonTheme: ThemeUtils.darkElevatedButtonTheme,
      inputDecorationTheme: ThemeUtils.inputDecorationTheme,
    );
  }
}
