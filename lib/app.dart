import 'package:can_i_quit/app_router.dart';
import 'package:can_i_quit/config/theme.dart';
import 'package:can_i_quit/flavors.dart';
import 'package:can_i_quit/shared/application/app/app_cubit.dart';
import 'package:can_i_quit/shared/application/app/app_state.dart';
import 'package:can_i_quit/shared/domain/entities/service_module.dart';
import 'package:can_i_quit/shared/presentation/widgets/app_wrapper.dart';
import 'package:can_i_quit/shared/utils/shared_const.dart';
import 'package:custom_theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  App({super.key});
  final _router = AppRouter.createRouter();
  @override
  Widget build(BuildContext context) {
    return DynamicThemeBuilder(
        seedColor: AppTheme.seedColor,
        appTheme: AppTheme(),
        builder: (dynamicTheme) {
          return MaterialApp.router(
            localizationsDelegates: const [],
            title: F.title,
            debugShowCheckedModeBanner: false,
            darkTheme: dynamicTheme.darkTheme,
            theme: dynamicTheme.lightTheme,
            themeMode: dynamicTheme.themeMode,
            builder: (context, child) {
              return AppWrapper(
                child: child,
              );
            },
            routeInformationProvider: _router.routeInformationProvider,
            routeInformationParser: _router.routeInformationParser,
            routerDelegate: _router.routerDelegate,
            scaffoldMessengerKey: SharedConstants.scaffoldMessengerKey,
          );
        });
  }
}
