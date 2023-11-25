part of 'settings_bloc.dart';

@immutable
sealed class SettingsState {
  final Settings settings;
  const SettingsState({required this.settings});
}

final class SettingsInitial extends SettingsState {
  const SettingsInitial({required super.settings});
}

final class SettingsChanged extends SettingsState {
  const SettingsChanged({required super.settings});
}
