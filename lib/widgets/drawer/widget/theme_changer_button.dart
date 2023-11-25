import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaplist/shareds/bloc/settings_bloc/settings_bloc.dart';
import 'package:yaplist/utilities/state_operations/settings_manager.dart';

class ThemeChangerButton extends StatelessWidget {
  const ThemeChangerButton({super.key});

  @override
  Widget build(BuildContext context) {
    List<(ThemeMode, String)> themeModes = <(ThemeMode, String)>[
      (ThemeMode.system, tr("system")),
      (ThemeMode.dark, tr("dark")),
      (ThemeMode.light, tr("light")),
    ];
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        ThemeMode actual = state.settings.themeMode;

        List<bool> selectedTheme =
            themeModes.map((e) => e.$1 == actual).toList();
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(tr("theme")),
            const SizedBox(height: 5),
            ToggleButtons(
                onPressed: (int index) {
                  SettingsManager.updateTheme(
                      themeMode: themeModes[index].$1, context: context);
                },
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                constraints: const BoxConstraints(
                  minHeight: 40.0,
                  minWidth: 75.0,
                ),
                isSelected: selectedTheme,
                children: themeModes.map((e) => Text(e.$2)).toList()),
          ],
        );
      },
    );
  }
}
