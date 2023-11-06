import 'package:custom_theme/custom_theme.dart';
import 'package:flutter/material.dart';

class AppTheme extends AppBaseTheme {
  static Color seedColor = const Color.fromARGB(255, 235, 94, 94);

  @override
  AppBarTheme appBarTheme(ColorScheme colorScheme) {
    return AppBarTheme(
        backgroundColor: colorScheme.primaryContainer,
        iconTheme: IconThemeData(color: colorScheme.onPrimaryContainer));
  }

  @override
  CardTheme cardTheme(ColorScheme colorScheme) {
    return CardTheme(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.antiAlias,
    );
  }

  @override
  ListTileThemeData listTileTheme(ColorScheme colorScheme) {
    return ListTileThemeData(
        textColor: colorScheme.primary,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: colorScheme.primary, width: 2)),
        tileColor: colorScheme.primaryContainer,
        iconColor: colorScheme.primary);
  }

  @override
  NavigationRailThemeData navigationRailTheme(ColorScheme colorScheme) {
    return NavigationRailThemeData(
        backgroundColor: Colors.transparent,
        selectedIconTheme: IconThemeData(color: colorScheme.primary),
        unselectedIconTheme: IconThemeData(color: colorScheme.onBackground));
  }

  @override
  TabBarTheme tabBarTheme(ColorScheme colorScheme) {
    return TabBarTheme(
      labelColor: colorScheme.secondary,
      unselectedLabelColor: colorScheme.onSurfaceVariant,
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: colorScheme.secondary,
            width: 2,
          ),
        ),
      ),
    );
  }

  @override
  BottomAppBarTheme bottomAppBarTheme(ColorScheme colorScheme) {
    return BottomAppBarTheme(
      color: colorScheme.primaryContainer,
      elevation: 0,
    );
  }

  @override
  BottomNavigationBarThemeData bottomNavigationBarTheme(
      ColorScheme colorScheme) {
    return BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: colorScheme.primaryContainer,
      selectedIconTheme: IconThemeData(color: colorScheme.primary),
      unselectedIconTheme: IconThemeData(color: colorScheme.onBackground),
      elevation: 0,
      landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
    );
  }

  @override
  FloatingActionButtonThemeData floatingActionButtonTheme(
      ColorScheme colorScheme) {
    return FloatingActionButtonThemeData(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        elevation: 20);
  }

  @override
  DrawerThemeData drawerTheme(ColorScheme colorScheme) {
    return DrawerThemeData(
      backgroundColor: colorScheme.surface,
    );
  }

  @override
  DialogTheme dialogTheme(ColorScheme colorScheme) {
    return DialogTheme(
        backgroundColor: colorScheme.primaryContainer, elevation: 20);
  }

  @override
  ButtonThemeData buttonTheme(ColorScheme colorScheme) {
    return ButtonThemeData(
        buttonColor: colorScheme.primary,
        splashColor: colorScheme.inversePrimary,
        hoverColor: colorScheme.inversePrimary,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(color: colorScheme.primary, width: 2)));
  }

  @override
  ElevatedButtonThemeData elevatedButtonTheme(ColorScheme colorScheme) {
    return ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            elevation: 10,
            backgroundColor: colorScheme.secondary,
            foregroundColor: colorScheme.onBackground,
            disabledForegroundColor: colorScheme.secondary.withAlpha(100),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: BorderSide(color: colorScheme.onBackground, width: 2))));
  }

  @override
  ProgressIndicatorThemeData progressIndicatorTheme(ColorScheme colorScheme) {
    return ProgressIndicatorThemeData(
        color: colorScheme.primary, circularTrackColor: colorScheme.primary);
  }

  @override
  TextTheme textTheme(TextTheme textTheme) {
    return textTheme.apply(fontFamily: 'Permanent Marker');
  }

  @override
  SwitchThemeData switchTheme(ColorScheme colorScheme) {
    final MaterialStateProperty<Color?> trackColor =
        MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return colorScheme.onBackground;
        }
        return null;
      },
    );
    final MaterialStateProperty<Color?> overlayColor =
        MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return colorScheme.onBackground;
        }
        return null;
      },
    );
    final MaterialStateProperty<Color?> thumbColor =
        MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        // Track color when the switch is selected.
        if (states.contains(MaterialState.selected)) {
          return colorScheme.secondary;
        }
        return colorScheme.secondary;
      },
    );
    return SwitchThemeData(
      trackColor: trackColor,
      overlayColor: overlayColor,
      thumbColor: thumbColor,
    );
  }
}

class NoAnimationPageTransitionsBuilder extends PageTransitionsBuilder {
  const NoAnimationPageTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return child;
  }
}

class FadeTransitionAnimationBuilder extends PageTransitionsBuilder {
  const FadeTransitionAnimationBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return FadeTransition(opacity: animation, child: child);
  }
}
