import 'package:custom_theme/src/models/app_base_theme.dart';
import 'package:custom_theme/src/models/theme_settings.dart';
import 'package:custom_theme/src/widgets/theme_provider.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

class DynamicThemeBuilder extends StatefulWidget {
  final Color seedColor;
  final Widget Function(ThemeProvider dynamicTheme) builder;
  final AppBaseTheme? appTheme;
  const DynamicThemeBuilder(
      {super.key,
      required this.builder,
      required this.seedColor,
      this.appTheme});

  @override
  State<DynamicThemeBuilder> createState() => _DynamicThemeBuilderState();
}

class _DynamicThemeBuilderState extends State<DynamicThemeBuilder> {
  late final ValueNotifier<ThemeSettings> themeSettings;
  @override
  void initState() {
    themeSettings = ValueNotifier(ThemeSettings(
        themeMode: ThemeMode.system, seedColor: widget.seedColor));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
        builder: (lightDynamic, darkDynamic) => ThemeProvider(
            appTheme: widget.appTheme,
            settings: themeSettings,
            lightDynamic: lightDynamic,
            darkDynamic: darkDynamic,
            child: NotificationListener<ThemeSettingsChanged>(
                onNotification: (notification) {
                  themeSettings.value = notification.settings;
                  return true;
                },
                child: ValueListenableBuilder<ThemeSettings>(
                    valueListenable: themeSettings,
                    builder: (context, value, _) {
                      final dynamicTheme = ThemeProvider.of(context);

                      return widget.builder.call(dynamicTheme);
                    }))));
  }
}
