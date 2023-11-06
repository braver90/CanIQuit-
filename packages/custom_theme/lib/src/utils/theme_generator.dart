import 'package:custom_theme/src/models/app_base_theme.dart';
import 'package:flutter/material.dart';

class ThemeGenerator {
  final AppBaseTheme appTheme;

  ThemeGenerator({required this.appTheme});

  ThemeData generateLightTheme(Color targetColor) {
    final colorScheme = ColorScheme.fromSeed(
        seedColor: targetColor, brightness: Brightness.light);

    final TextTheme defaultTextTheme = ThemeData.light().textTheme;

    return ThemeData.light().copyWith(
      hoverColor: appTheme.hoverColor(colorScheme),
      splashColor: appTheme.splashColor(colorScheme),
      scaffoldBackgroundColor: appTheme.scaffoldBackgroundColor(colorScheme),
      canvasColor: appTheme.canvasColor(colorScheme),
      pageTransitionsTheme: appTheme.pageTransitionsTheme(colorScheme),
      colorScheme: colorScheme,
      appBarTheme: appTheme.appBarTheme(colorScheme),
      cardTheme: appTheme.cardTheme(colorScheme),
      switchTheme: appTheme.switchTheme(colorScheme),
      listTileTheme: appTheme.listTileTheme(colorScheme),
      bottomAppBarTheme: appTheme.bottomAppBarTheme(colorScheme),
      bottomNavigationBarTheme: appTheme.bottomNavigationBarTheme(colorScheme),
      navigationRailTheme: appTheme.navigationRailTheme(colorScheme),
      tabBarTheme: appTheme.tabBarTheme(colorScheme),
      drawerTheme: appTheme.drawerTheme(colorScheme),
      floatingActionButtonTheme:
          appTheme.floatingActionButtonTheme(colorScheme),
      dialogTheme: appTheme.dialogTheme(colorScheme),
      buttonTheme: appTheme.buttonTheme(colorScheme),
      elevatedButtonTheme: appTheme.elevatedButtonTheme(colorScheme),
      progressIndicatorTheme: appTheme.progressIndicatorTheme(colorScheme),
      textTheme: appTheme.textTheme(defaultTextTheme),
      useMaterial3: appTheme.useMaterial3,
    );
  }

  ThemeData generateDarkTheme(Color targetColor) {
    final colorScheme = ColorScheme.fromSeed(
        seedColor: targetColor, brightness: Brightness.dark);
    final TextTheme defaultTextTheme = ThemeData.dark().textTheme;

    return ThemeData.dark().copyWith(
      hoverColor: appTheme.hoverColor(colorScheme),
      splashColor: appTheme.splashColor(colorScheme),
      scaffoldBackgroundColor: appTheme.scaffoldBackgroundColor(colorScheme),
      canvasColor: appTheme.canvasColor(colorScheme),
      pageTransitionsTheme: appTheme.pageTransitionsTheme(colorScheme),
      colorScheme: colorScheme,
      appBarTheme: appTheme.appBarTheme(colorScheme),
      cardTheme: appTheme.cardTheme(colorScheme),
      switchTheme: appTheme.switchTheme(colorScheme),
      listTileTheme: appTheme.listTileTheme(colorScheme),
      bottomAppBarTheme: appTheme.bottomAppBarTheme(colorScheme),
      bottomNavigationBarTheme: appTheme.bottomNavigationBarTheme(colorScheme),
      navigationRailTheme: appTheme.navigationRailTheme(colorScheme),
      tabBarTheme: appTheme.tabBarTheme(colorScheme),
      drawerTheme: appTheme.drawerTheme(colorScheme),
      floatingActionButtonTheme:
          appTheme.floatingActionButtonTheme(colorScheme),
      dialogTheme: appTheme.dialogTheme(colorScheme),
      buttonTheme: appTheme.buttonTheme(colorScheme),
      elevatedButtonTheme: appTheme.elevatedButtonTheme(colorScheme),
      progressIndicatorTheme: appTheme.progressIndicatorTheme(colorScheme),
      textTheme: appTheme.textTheme(defaultTextTheme),
      useMaterial3: appTheme.useMaterial3,
    );
  }
}
