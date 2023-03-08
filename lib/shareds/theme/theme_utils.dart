import 'package:flutter/material.dart';
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
        color: AppColors.optiyolGrey,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: TextStyle(
        fontSize: 17.0,
        color: AppColors.optiyolGrey,
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
        color: AppColors.optiyolGrey,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: TextStyle(
        fontSize: 17.0,
        color: AppColors.optiyolGrey,
      ),
      labelMedium: TextStyle(
        fontSize: 17.0,
        color: AppColors.kBlackColor,
      ),
    );
  }
}
