import 'package:custom_theme/src/models/primary_color_scheme.dart';
import 'package:flutter/material.dart';

class DynamicColor {
  final Color seed;
  late final PrimaryColorScheme lightThemeColor;
  late final PrimaryColorScheme darkThemeColor;

  DynamicColor({required this.seed}) {
    ColorScheme lightScheme =
        ColorScheme.fromSeed(seedColor: seed, brightness: Brightness.light);
    ColorScheme darkScheme =
        ColorScheme.fromSeed(seedColor: seed, brightness: Brightness.dark);

    lightThemeColor = PrimaryColorScheme(
        primary: lightScheme.primary,
        onPrimary: lightScheme.onPrimary,
        primaryContainer: lightScheme.primaryContainer,
        onPrimaryContainer: lightScheme.onPrimaryContainer);

    darkThemeColor = PrimaryColorScheme(
        primary: darkScheme.primary,
        onPrimary: darkScheme.onPrimary,
        primaryContainer: darkScheme.primaryContainer,
        onPrimaryContainer: darkScheme.onPrimaryContainer);
  }

  Color getByTheme(Brightness brightness) {
    if (brightness == Brightness.light) {
      return lightThemeColor.primary;
    } else {
      return darkThemeColor.primary;
    }
  }

  Color getByContext(BuildContext context) {
    Brightness brightness = Theme.of(context).brightness;
    return getByTheme(brightness);
  }
}
