import 'package:flutter/material.dart';

class AppBaseTheme {
  bool useMaterial3 = true;

  Color hoverColor(ColorScheme colorScheme) {
    return colorScheme.brightness == Brightness.light
        ? ThemeData.light().hoverColor
        : ThemeData.dark().hoverColor;
  }

  Color scaffoldBackgroundColor(ColorScheme colorScheme) {
    return colorScheme.brightness == Brightness.light
        ? ThemeData.light().scaffoldBackgroundColor
        : ThemeData.dark().scaffoldBackgroundColor;
  }

  Color splashColor(ColorScheme colorScheme) {
    return colorScheme.brightness == Brightness.light
        ? ThemeData.light().splashColor
        : ThemeData.dark().splashColor;
  }

  Color canvasColor(ColorScheme colorScheme) {
    return colorScheme.brightness == Brightness.light
        ? ThemeData.light().canvasColor
        : ThemeData.dark().canvasColor;
  }

  PageTransitionsTheme pageTransitionsTheme(ColorScheme colorScheme) {
    return const PageTransitionsTheme();
  }

  CardTheme cardTheme(ColorScheme colorScheme) {
    return const CardTheme();
  }

  ListTileThemeData listTileTheme(ColorScheme colorScheme) {
    return const ListTileThemeData();
  }

  AppBarTheme appBarTheme(ColorScheme colorScheme) {
    return const AppBarTheme();
  }

  NavigationRailThemeData navigationRailTheme(ColorScheme colorScheme) {
    return const NavigationRailThemeData();
  }

  TabBarTheme tabBarTheme(ColorScheme colorScheme) {
    return const TabBarTheme();
  }

  BottomAppBarTheme bottomAppBarTheme(ColorScheme colorScheme) {
    return const BottomAppBarTheme();
  }

  BottomNavigationBarThemeData bottomNavigationBarTheme(
      ColorScheme colorScheme) {
    return const BottomNavigationBarThemeData();
  }

  FloatingActionButtonThemeData floatingActionButtonTheme(
      ColorScheme colorScheme) {
    return const FloatingActionButtonThemeData();
  }

  DrawerThemeData drawerTheme(ColorScheme colorScheme) {
    return const DrawerThemeData();
  }

  DialogTheme dialogTheme(ColorScheme colorScheme) {
    return const DialogTheme();
  }

  ButtonThemeData buttonTheme(ColorScheme colorScheme) {
    return const ButtonThemeData();
  }

  ElevatedButtonThemeData elevatedButtonTheme(ColorScheme colorScheme) {
    return const ElevatedButtonThemeData();
  }

  ProgressIndicatorThemeData progressIndicatorTheme(ColorScheme colorScheme) {
    return const ProgressIndicatorThemeData();
  }

  TextTheme textTheme(TextTheme textTheme) {
    return TextTheme(
        displayLarge: textTheme.displayLarge?.copyWith(fontSize: 10));
  }

  SwitchThemeData switchTheme(ColorScheme colorScheme) {
    return const SwitchThemeData();
  }
}
