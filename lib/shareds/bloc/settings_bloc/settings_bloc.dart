import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:yaplist/models/settings.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends HydratedBloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsInitial(settings: Settings())) {
    on<UpdateTheme>(onUpdateTheme);
  }

  void onUpdateTheme(UpdateTheme event, Emitter<SettingsState> emit) {
    Settings settings = state.settings;
    settings.themeMode = event.themeMode;
    emit(
      SettingsChanged(settings: settings),
    );
  }

  @override
  SettingsState? fromJson(Map<String, dynamic> json) {
    final dynamic settingJson = json['settings'];
    return SettingsChanged(
        settings:
            settingJson != null ? Settings.fromJson(settingJson) : Settings());
  }

  @override
  Map<String, dynamic>? toJson(SettingsState state) {
    return {"settings": state.settings.toJson()};
  }
}
