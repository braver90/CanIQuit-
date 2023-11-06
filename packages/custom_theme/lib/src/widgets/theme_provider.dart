import 'package:custom_theme/src/models/app_base_theme.dart';
import 'package:custom_theme/src/models/theme_settings.dart';
import 'package:custom_theme/src/utils/theme_generator.dart';
import 'package:flutter/material.dart';

class ThemeSettingsChanged extends Notification {
  ThemeSettingsChanged({required this.settings});
  final ThemeSettings settings;
}

class ThemeProvider extends InheritedWidget {
  final AppBaseTheme? appTheme;
  ThemeProvider(
      {Key? key,
      required this.settings,
      required this.lightDynamic,
      required this.darkDynamic,
      required Widget child,
      this.appTheme})
      : super(key: key, child: child) {
    themeGenerator = ThemeGenerator(appTheme: appTheme ?? AppBaseTheme());
  }

  final ValueNotifier<ThemeSettings> settings;
  final ColorScheme? lightDynamic;
  final ColorScheme? darkDynamic;
  late final ThemeGenerator themeGenerator;

  get darkTheme => themeGenerator.generateDarkTheme(settings.value.seedColor);
  get lightTheme => themeGenerator.generateLightTheme(settings.value.seedColor);
  get themeMode => settings.value.themeMode;

  static ThemeProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeProvider>()!;
  }

  @override
  bool updateShouldNotify(covariant ThemeProvider oldWidget) {
    return oldWidget.settings != settings;
  }
}
