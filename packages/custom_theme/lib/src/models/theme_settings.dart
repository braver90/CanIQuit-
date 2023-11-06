import 'package:flutter/material.dart';

class ThemeSettings {
  ThemeSettings(
      {required this.seedColor,
      required this.themeMode,
      this.customScheme,
      this.schemeToOverwrite});

  final Color seedColor;
  final ThemeMode themeMode;
  final ColorScheme? customScheme;
  final ColorScheme? schemeToOverwrite;
}
