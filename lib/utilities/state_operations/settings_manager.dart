import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaplist/shareds/bloc/settings_bloc/settings_bloc.dart';

class SettingsManager {
  static void updateTheme({
    required BuildContext context,
    required ThemeMode themeMode,
  }) {
    BlocProvider.of<SettingsBloc>(context)
        .add(UpdateTheme(themeMode: themeMode));
  }
}
