import 'package:flutter/material.dart';
import 'package:yaplist/shareds/constants/constants.dart';
import 'package:yaplist/shareds/theme/appcolors.dart';
import 'package:yaplist/shareds/theme/theme_utils.dart';

class YaplistTheme {
  static ThemeData get light {
    return ThemeData(
      useMaterial3: Constants.useMaterial3,
      primaryColor: AppColors.primaryColor,
      // textTheme: ThemeUtils.lightTextTheme,
      // scaffoldBackgroundColor: AppColors.kWhiteColor,
      // primarySwatch: AppColors.primarySwatchOptiyolBlue,
      colorScheme: ColorScheme.light(
        secondary: AppColors.primaryColor,
        primary: AppColors.primaryColor,
      ),
      // elevatedButtonTheme: ThemeUtils.elevatedButtonTheme,
      // // bottomSheetTheme: ThemeUtils.bottomSheetTheme,
      inputDecorationTheme: ThemeUtils.inputDecorationTheme,
    );
  }

  static ThemeData get dark {
    return ThemeData(
      useMaterial3: Constants.useMaterial3,
      // primaryColor: AppColors.primaryColor,
      // textTheme: ThemeUtils.darkTextTheme,
      // scaffoldBackgroundColor: AppColors.kBlackColor,
      // primarySwatch: AppColors.primarySwatchOptiyolBlue,
      // colorScheme: ColorScheme.dark(
      //   secondary: AppColors.primaryColor,
      //   primary: AppColors.primaryColor,
      // ),
      // elevatedButtonTheme: ThemeUtils.elevatedButtonTheme,
      // // bottomSheetTheme: ThemeUtils.bottomSheetTheme,
      inputDecorationTheme: ThemeUtils.inputDecorationTheme,
    );
  }
}
