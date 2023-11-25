part of 'settings_bloc.dart';

@immutable
abstract class SettingsEvent {}

class UpdateTheme extends SettingsEvent {
  final ThemeMode themeMode;
  UpdateTheme({required this.themeMode});
}
